Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0193DC73353
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518B110E730;
	Thu, 20 Nov 2025 09:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ULC7janN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010001.outbound.protection.outlook.com
 [52.101.193.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C0F10E730
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi6qcXddJ1EaQz5ymIInzhQONmAQz/JrJiNWMzKYQApuieh64yMxV5nYmPvELqMMyB3t9tZ80rase+TZEeI6AG3Qz4n/dc5VhvKEsYt50ECB8cbqo3A9csSY3Auc15TWqCpbVEw2pBjSh/02Adr+ENo08liKj6zQuprzB2xfcikSKp15S35zgi+yobfhafokgBrNEjwEcDdKSXE4qPv07vgYieZPdUQsGS5cW6NMJfk49vyRi+QaMwOVQa7vhvQslSz6xrdB42k5dHdZS8yMrGo8P31UftQ/Aao+9HjevatJv5qPsB5U9yjxDDSFRBfz7cqUFl+NTPDQKV1apkyM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq/tT0C9o139rb4x5+u6Yyb8ElgXlto4CN0DEnQmnUQ=;
 b=EvmeH2d0KvKg4OfAxbRaEvrwvwXIjHhtK3eOiTeH5ZMuTxhDYmPWSLXGb7MelV70DmNdcAs8xdvMnxeuK4pHcy7/5LgNubMFIjqSrGItsEuXoWMDdhPWo6q6AnC58ufo7KzFfX+miZ2PLBxgyFCkOO1AIlOt5rupjbwR2KensvtJlRTXTlHydsncmRn9FXYlLXKH318tkSLXYVEe3A71jXOHmwB/ghGGyhXDfobxoNyVnefdfGnSxBrH1YSWhOOe0aaEZuzzfwfIVGNX0mhs+aAfwJ4cj/RHCwhbQypehVg0iLSkbhrRjACk/8aKXtyUL397MH4bmdtZxDJ30UOvSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq/tT0C9o139rb4x5+u6Yyb8ElgXlto4CN0DEnQmnUQ=;
 b=ULC7janNoV7IZJ7sKvleQ5dLUzGSK7Ut4vQ5eJ+oxUp8uD/ss3CbDioQRI0I9J4Bbnxt9Oyyn66ujNTIls0/21r5WvZBjaUAD+Y8sekUvosSKib2OGTZTduYYq/HTZlw9XLUPUuLFXq61sjUpeyL9uHDAcHD9TUTKbWIFnV+AFk=
Received: from SA1P222CA0089.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::19)
 by CH0PR10MB4876.namprd10.prod.outlook.com (2603:10b6:610:c9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:35:51 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::c) by SA1P222CA0089.outlook.office365.com
 (2603:10b6:806:35e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 09:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:35:50 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:35:44 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:35:44 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:35:44 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be
 forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9Zc513447476;
 Thu, 20 Nov 2025 03:35:39 -0600
Message-ID: <a35a9e6e-860e-46e0-b124-37fc80c5e48d@ti.com>
Date: Thu, 20 Nov 2025 15:05:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [PATCH net-next v2 0/7] net: ethernet: ti: am65-cpsw:
 add AF_XDP zero copy support
To: Roger Quadros <rogerq@kernel.org>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "Jesper Dangaard
 Brouer" <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Stanislav Fomichev <sdf@fomichev.me>, "Simon
 Horman" <horms@kernel.org>
CC: <srk@ti.com>, <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CH0PR10MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cd6ce8-faff-4c20-1fdd-08de28183123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzVMSFA3MXBjSkEzdVFOaGE2anZEZVRxZnJXTjhLSXdTU3JIdkpVT1BuRHFk?=
 =?utf-8?B?M1F3QTdMZnhJSi91SnFkaXNnMzVJT3NKS0dNR1RWWWhtRGZheTQ2K0c0VTZI?=
 =?utf-8?B?Uy85Q200Z09uSkVWQXNjN1R2RTh0UUdrbVRVSmh3eDdybVJkVU1YWFA0VjZJ?=
 =?utf-8?B?MnFkaDVuNmtzaGVVWFZQem05ejVwM2l6T3Qzamx3ODZQRy9pejZnSmtpWHl4?=
 =?utf-8?B?YTN4QURRVkxIb04xNloxT3lXbGtXT2J3aFdwMzZMSjRZaUUrU1lzUzRpeFJD?=
 =?utf-8?B?b0FHMUtLc0pBcFRlSjdaUU4vYjVoYjFxQVNxYzZvZmRqOUJiTkdvQlA4dy9p?=
 =?utf-8?B?SXJxMllNVEgxVjc4K0F4QjZEaHRuZU9OOVB4Nk52Qm5jb3ZDOGVNZFFVUDNn?=
 =?utf-8?B?bktkR3llbk1DTDhFNnVLV0M1d2dmTFhxazFWOHhjTTlCZ3h2SWp6cWFRczJH?=
 =?utf-8?B?M0RiYVBqOTZGeDQxMHQ0ZkIwTzZIMUVFZ2RXSTVSbGNCWVhIaFhzTTkwSDhX?=
 =?utf-8?B?dFQyejY1SnpieEpJcWdHdURYS3VwdkNzVTMxbFNwUU5MNDZLaTZDYnQ2VFhv?=
 =?utf-8?B?RUI4UVhSRm9BZU92Z09GM3lDeE5LT2tWODhwc1dQaWR2dk5ydHhVbUdkbTFh?=
 =?utf-8?B?M09jZmNOek5WUkRLdDBycDAwSDhmSlRvZ3ZZTUhzS21laGtRRzNSNzlTaFZT?=
 =?utf-8?B?cGNwZzhraGZ1QUNrU1U3SFQrSU1sbkx5Q0EvT2dDNmt5ZGFUaUErRjR0Zjlh?=
 =?utf-8?B?d3Ztc0VOU1cySUtFUXZKclpESEViUlpHemhQUXJHRnVTVzJZWENyM09oNktY?=
 =?utf-8?B?dG5XTURLQzRpUzNMMk1Pa2lHTlJjQysrRWtaWkJYU1RmVjdXNHZ2S25mVEJy?=
 =?utf-8?B?dlNKakFxckhPREd4UTB3UTFsNWFOT3hzQnpPeVlKbitIZis3akNzTVE3K2NK?=
 =?utf-8?B?MjZnaUJsU2t0OXFHUGNBdEQxM0hvejJpKzc2dDhFNTBHa3FCQUVZN2h1aEhE?=
 =?utf-8?B?UVp4SjUyYk1ZVndoTklSMW92MEV2cVlyNU9lSkhFUGcyYWlkL0RtQWRqdnFw?=
 =?utf-8?B?czN6QzdDWG82TEkrdzAxd2QzRGpiRDh3VkNZT3NHMmVkb2JKb2pnbUY2Z2ZD?=
 =?utf-8?B?dlFpN0h4S3VzQjBHZFBMSGp0OCt2U0t1REhPNG1JOG9aeHBYdG8wNEJWVU9U?=
 =?utf-8?B?b1JDY3F3Uk5ydWlaRVZLUjlnazZYdlVWOUlFdXduNVBxc1BNVDRzWEVXOU9v?=
 =?utf-8?B?L0tDWEY2Y211d0RoQlI3L2s3VVhnQ3EvYVNTZFBaOXdieXExcUNScC9uMGpX?=
 =?utf-8?B?ZUZBVGVDeGZYdEhNSElNb2VLWTlnWWZuTDlFaFZ2aDBlcTRHUEZwdHdZR0Mv?=
 =?utf-8?B?S1Jzd3lYZ2NWRE1WbW96c2tuZnp0ZHlxakUwNm9ndGI0NDN1NUFHOG9lUy8v?=
 =?utf-8?B?Vk14bVpFOU5ZZ2VwSlhCTXNaNC9ycHpKN0dza1pET1hZMEJ4d2JvUm5QdHNZ?=
 =?utf-8?B?cHRVbzh2bXdWbW8ydU16aUJ6aTU2TXhtZmdUditGMTBJcTRtUGhjcUI0bzJI?=
 =?utf-8?B?R0krczRsZlN3R0RLdHdIcWYwclIxTStyN3BQWU9LbG5ZeHFYYXVNME9lRE1D?=
 =?utf-8?B?Z3RCNmFnb3lsck94MnZZczZrdHVvV0l2MVBZUWJ4YXBTRSsxSlV2RkNnSkNG?=
 =?utf-8?B?anpDeVRoOFRMQnBmOUFNbDZHZkFKM3lHeTF6ZHFpWkRyOWI5bkgwdmRtdFdG?=
 =?utf-8?B?SkUvM0xBU1RBZVlHV3RUaVFTVnplYUxQMHF5WDdVb3o3MUt4TXZHZFFFV3Iz?=
 =?utf-8?B?YzNoWlJvWkpUSHlQRk5oQ0pLNkUvZExReDJSU1djNTZSajcvTUlRMXg2Zk4v?=
 =?utf-8?B?VmxvcEFiMzNyYTdiK2xqWUwrSGI3RUhNcmpwdjhFbkh2R21odkU3V0V0ZWhL?=
 =?utf-8?B?WFhTRGhJS1JNWlNWOGdJM0pldmRrNDNZdkNscTF1MDhXOFBrS1V3aWNhdlVW?=
 =?utf-8?B?aFlOSU9qeDlJREVpTnBXbTRTRkRLVm9aRG9CZFhYM3phbkZKMG9yUGpsQnRl?=
 =?utf-8?Q?+7O1AC?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:35:50.1434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cd6ce8-faff-4c20-1fdd-08de28183123
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4876
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roger,

On 11/10/25 03:07, Roger Quadros wrote:
> This series adds AF_XDP zero coppy support to am65-cpsw driver. Tests 
> were performed on AM62x-sk with xdpsock application [1]. A clear 
> improvement is seen in 64 byte packets on Transmit (txonly) and receive 
> (rxdrop). 1500 byte test seems to
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source 
> of this email and know the content is safe.
> Report Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK! 
> u7dqXRfP1k07KyXOF3NDf8vo0my_AFaH4vPAPLVnKCsqFWj_bXKNsRmhTJBE82Rrr_w736hROV-tgpjEGb6O7cQAClKjG9x9il73ZT70$>
> ZjQcmQRYFpfptBannerEnd
> 
> This series adds AF_XDP zero coppy support to am65-cpsw driver.
> 
> Tests were performed on AM62x-sk with xdpsock application [1].
> 
> A clear improvement is seen in 64 byte packets on Transmit (txonly)
> and receive (rxdrop).
> 1500 byte test seems to be limited by line rate (1G link) so no
> improvement seen there in packet rate. A test on higher speed link
> (or PHY-less setup) might be worthwile.
> 
> There is some issue during l2fwd with 64 byte packets and benchmark
> results show 0. This issue needs to be debugged further.
> A 512 byte l2fwd test result has been added to compare instead.
> 
> AF_XDP performance using 64 byte packets in Kpps.
> Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
> rxdrop		322		491		845
> txonly		390		394		723
> l2fwd 		205		257		0
> 
> AF_XDP performance using 512 byte packets in Kpps.
> l2fwd		140		167		231
> 
> AF_XDP performance using 1500 byte packets in Kpps.
> Benchmark:	XDP-SKB		XDP-Native	XDP-Native(ZeroCopy)
> rxdrop		82		82		82
> txonly		82		82		82
> l2fwd 		82		82		82
> 
> [1]:https://urldefense.com/v3/__https://github.com/xdp-project/bpf-examples/ 
> tree/master/AF_XDP-example__;!!G3vK! 
> SX4J82NfOn_sfwizSTYO-8W3GRuffFIHyCngO1J2CT4Alea18pIGiBI4l5XKFKVUbxESDgb4GkCb$ <https://urldefense.com/v3/__https://github.com/xdp-project/bpf-examples/tree/master/AF_XDP-example__;!!G3vK!SX4J82NfOn_sfwizSTYO-8W3GRuffFIHyCngO1J2CT4Alea18pIGiBI4l5XKFKVUbxESDgb4GkCb$>
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---

This series causes nfs boot failure for am62lxx-evm:
https://gist.github.com/MeghanaMalladiTI/dda232ebe6c24554e933085513ce8b33

Due to descriptor leakage during Rx teardown. I have faced similar 
problem in ICSSG and a fix similar to this is needed for CPSW as well. 
Please incorporate this fix as well in your v3: 
https://gist.github.com/MeghanaMalladiTI/c5467e2a5c9d4ebdc5e71e3720b6524d

> Changes in v2:
> - Prevent crash on systems with 1 of 2 ports disabled in device tree. check
>    for valid ndev before registering/unregistering XDP RXQ.
>    Reported-by: Meghana Malladi <m-malladi@ti.com>
> - Retain page pool on XDP program exchangae so we don't have to re-alloacate
>    memory.
> - Fix clearing of irq_disabled flag in am65_cpsw_nuss_rx_poll().
> - Link to v1:https://urldefense.com/v3/__https://lore.kernel.org/r/20250520-am65- 
> cpsw-xdp-zc-v1-0-45558024f566@kernel.org__;!!G3vK! 
> SX4J82NfOn_sfwizSTYO-8W3GRuffFIHyCngO1J2CT4Alea18pIGiBI4l5XKFKVUbxESDgAECR9g$ <https://urldefense.com/v3/__https://lore.kernel.org/r/20250520-am65-cpsw-xdp-zc-v1-0-45558024f566@kernel.org__;!!G3vK!SX4J82NfOn_sfwizSTYO-8W3GRuffFIHyCngO1J2CT4Alea18pIGiBI4l5XKFKVUbxESDgAECR9g$>
> 
> ---
> Roger Quadros (7):
>        net: ethernet: ti: am65-cpsw: fix BPF Program change on multi-port CPSW
>        net: ethernet: ti: am65-cpsw: Retain page_pool on XDP program exchange
>        net: ethernet: ti: am65-cpsw: add XSK pool helpers
>        net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for RX
>        net: ethernet: ti: am65-cpsw: Add AF_XDP zero copy for TX
>        net: ethernet: ti: am65-cpsw: enable zero copy in XDP features
>        net: ethernet: ti: am65-cpsw: Fix clearing of irq_disabled flag in rx_poll
> 
>   drivers/net/ethernet/ti/Makefile         |   2 +-
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c | 583 ++++++++++++++++++++++++++-----
>   drivers/net/ethernet/ti/am65-cpsw-nuss.h |  37 +-
>   drivers/net/ethernet/ti/am65-cpsw-xdp.c  | 155 ++++++++
>   4 files changed, 692 insertions(+), 85 deletions(-)
> ---
> base-commit: a0c3aefb08cd81864b17c23c25b388dba90b9dad
> change-id: 20250225-am65-cpsw-xdp-zc-2af9e4be1356
> 
> Best regards,
> -- 
> Roger Quadros <rogerq@kernel.org>
> 

