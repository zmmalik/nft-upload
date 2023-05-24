// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    mapping(uint => string) private TOKEN_URIs;
    string[5] private TOKENURIs = [
        "ipfs://QmYs8rrJiKE9WKXpRURx7PNo37oWA6t7Q1fbF4CpRcjdeA?filename=1.json",
        "ipfs://QmaJFrCN4koozf1s6KybrB8vXnSTzwPuuTHaTjAXAwNviV?filename=2.json",
        "ipfs://QmV89YdKPRYifUFVMfc9KpNH4twKdezwqPu6xQ9ojSEVwm?filename=3.json",
        "ipfs://QmUX532ATekNcV9kdGZcdQurPsDAopLii5sxKYPJHPVuo2?filename=4.json",
        "ipfs://QmWkvYNFMFwzPN4T9pXp1V5rr9f3vCaknSrXXmxLkSJC2b?filename=5.json"
    ];
    uint256 private s_tokenCounter;

    constructor() ERC721("token", "mtk") {
        s_tokenCounter = 0;
        for (uint i = 0; i < 5; i++) {
            TOKEN_URIs[i] = TOKENURIs[i];
        }
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter = s_tokenCounter + 1;
    }

    function tokenURI(uint256 /* tokenId */) public view override returns (string memory) {
        string memory uri = TOKEN_URIs[0];
        return uri;
    }

    function getTokenCounter() public view returns (uint256) {
        return s_tokenCounter;
    }
}