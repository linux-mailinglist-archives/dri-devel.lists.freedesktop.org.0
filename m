Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B8C626AA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 06:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC74E10E0F3;
	Mon, 17 Nov 2025 05:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mn0odtuj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658AA10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 05:37:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5ozpKGuFYnYWuK0inrGH87stAaeb5csejMpjl5EbK7IZOxwl1+WBlLxcZ+We9er0WzD8dakbM6BWUFO50iEdyh5J+uxjuxQ4CZcfEdS7HNo0uhw8RvazVozJuz99Oo/PrL8unO2ufahEEu7W4r9YRuvfPC0X6ElE52Mcj5gGXyb5OXWeAIPTrlaHs4OZ2PRT+rybNK4NDA4dkTywLdyCe2hlGF808nrBgKBgFKOE07swol26NDOMEPnD4GSXUMs4aYDfDDn2ZHSllC6Pbf4/CeTVABobgx1RC0gwachCiHT/Z+jPLA0ndP4eeFSVnRX0EJL70b02CHc/TPzBdfobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgVPTNkgcqqRAjMiSa5MkUYxqofolhv3Y6VhGeWTTcQ=;
 b=ALS8Oe2VzlD70MDS3eqzGGg5IrXX2ywTzCswK8T2c58HpBMuvE3sbcUlbYqhOLht0NZrdWE5DGmrAw9WTCmhLzpjbd3c6pGn8TZ6bl2Uos/LXtR/yy9nNL9HSNK352nCERUObXnyTBjeCHgxPdpiOguFvLSq94mXN40/9LAJJV3G++Gmky5tYEdY7zuoaHO5NFuc3p5qGWOFELwFAyjvfQBJkMG70J/bq7wSaRvHhCn/jNwdpKJX/1y16CVVbLGvB2xUZIuT2NGGELpJo7Ubdlpy3ZmSprK/Ul5ON2YNAE5KLYWgqJfRXj118P0w1tSzNdeHUe42BP5HBthCLkpkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgVPTNkgcqqRAjMiSa5MkUYxqofolhv3Y6VhGeWTTcQ=;
 b=mn0odtuj2388eDxqOtMN2Hu30/uehIJuNpvSlNMge51HNP8hhuPN2CiFhN6e+pixhniIQLEtK4qoLbyM0EgfG2ezpUzUIWjYKQnd8kMUSS4gbYMDHcdmxM7VZXQbS9nF2xkkjS7Pvr4ggB6mkRxuv6f+OvzwGalh4mfCXHaacOI=
Received: from CH0PR04CA0082.namprd04.prod.outlook.com (2603:10b6:610:74::27)
 by SJ2PR10MB7597.namprd10.prod.outlook.com (2603:10b6:a03:53d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:37:16 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::b9) by CH0PR04CA0082.outlook.office365.com
 (2603:10b6:610:74::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 05:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:37:15 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:37:09 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 16 Nov
 2025 23:37:09 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 16 Nov 2025 23:37:09 -0600
Received: from [10.24.69.13] (meghana-pc.dhcp.ti.com [10.24.69.13] (may be
 forged))
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AH5b37d1941015;
 Sun, 16 Nov 2025 23:37:04 -0600
Message-ID: <83137569-d34b-4cd1-bff5-81a115c1923d@ti.com>
Date: Mon, 17 Nov 2025 11:07:03 +0530
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|SJ2PR10MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d948d2-5ab0-4f75-ba7b-08de259b5dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHkyOUVCY3pXbmF6Smw4TFFvNVRBTE5zMW1tUmZTRHozU3B5VlFnKzhGYVhJ?=
 =?utf-8?B?ZFptSUNFeTIzVm40UVN4bFVWS0lwWW10Ulp1ZTBCWVJvditaMEd3U1RDQlgz?=
 =?utf-8?B?RVpTbmVEMWNUQUZXa1g0S29ZWE5IRjl3YmpoRmc5WDRXUUVjdEhDRTFYeW9L?=
 =?utf-8?B?TG93amxGME1henkxRjNaT1EwVHlyZU95b2YyVWVmeWNxTDgxcmIwSSttcEFh?=
 =?utf-8?B?NW1adGVKVjVzK1dqY1huSWIrYzBEMWNlNTZIWjNZcExjNVFWZ1orTmpOQkhx?=
 =?utf-8?B?WUdLL3dNL2ZKOWpDSnMwLzNvVkYwRHdNd2t1YUJubVU0SXpSRUppMmlqUm5y?=
 =?utf-8?B?MG1pQ3UyUFhqU2NmNy8yc2EyMnRCeExpWXpxeURZLy9EWEMyei9NdUs3VXAr?=
 =?utf-8?B?V3NTZlkrVTB6NmVBUmV5cjdzM2JzNUJLS20rQUZyMjZPeTdiek05TDl0RVdR?=
 =?utf-8?B?d05ldnZhdHIva2lRZStNTmdpMHdrRmFYdkwvY053QnBiMlVhOUNUL21RYjhK?=
 =?utf-8?B?dm5VYjlxWStLTEtldEQ4b1dvUDNhSlEyVjhrd3FGUjFCNG5jYTVqNEh3YVcz?=
 =?utf-8?B?YXBtWlFkRWJuN0ZaMERvWDJXWHovOGZOMWwvdGhGQWFVaS9sV2svZy9nMWJ0?=
 =?utf-8?B?QnpYS3dlcVIzenhzdHdzOVBxUm52ZE1aRkRDcjJOQnd5NkcyWHNFTDhHNGRz?=
 =?utf-8?B?eG53d0NzSWE0elBTaUlmZjFuT05jY0ptaEpzeDVpYUI2NzdlSE1nZzJyV1BR?=
 =?utf-8?B?US96RmFJTkRQRkNGcERXcDZPTkFjaFBHMnk3Zm1vR0VVRmdIZmJDaUFBa0hE?=
 =?utf-8?B?cmJJTThvc2xxTTdRd2VCMEdaNVZzR2pOSURWRXppL3ZSdDBQSHFnTklGKzBR?=
 =?utf-8?B?V3h0ZXhCN3BLdlV3OHNxaEdKVFB1VjRnN0RsNk56RkptRGowRUltL1hRYzJN?=
 =?utf-8?B?ZkUzM3ZBZEFxaVp3QzVpNHhpZkN3ekVicHhxL0E4ODhIS2NnTTlubmV3dkFa?=
 =?utf-8?B?cTA4M3hpQVBkUFJ1Y2V6aGhEK2JiMnc0MVhpZThBU3JjTkU2bkJFUE1rWGlm?=
 =?utf-8?B?ZXZlZUF2TFdMN1h5U3BWR0VlUjV2SzJsUHhBWHUySENyUGE0blJFUjRacGlu?=
 =?utf-8?B?MmZDMEx2ZHMxUkxlTHY1VUE5U2NYMmUrdWZNRnBLNkp1NVppU0NuNXJYU2Jl?=
 =?utf-8?B?cEs5T2t5SHA3V1c3SlIrVzdyN0t5Rlo1Yk1XK1hnNDQ4MEtZU0c1cVNXdG16?=
 =?utf-8?B?Q2h3SjBTcXdjN3ZyR2pvMm9oemVQeEdxMmk0Y25jdm5Hc3lBazdLR0tRNVhH?=
 =?utf-8?B?akFQZFRsS0s0RThQMkoxM1VVOWl0dnE5eElhYnhIVGN2b3lCRStBdzJ5bEZX?=
 =?utf-8?B?Y3V0QmUwSXROZzdQMGMrUDYwbUVsTHV2aXF3bDVMZC9FUEY5Z0tCQy90bDNN?=
 =?utf-8?B?UVVPN0E0RmQydzk0QmhMcDhQakRIa3pWZURHU3NzNTZ2eFdaZEJRaTRkY0dX?=
 =?utf-8?B?VXQ3WTRVblIyMkh0UFFVNkt1MStVSjdrTTZSNytNMGQycnJpYW0yOUJNaTB5?=
 =?utf-8?B?VjFIeSswcER2dWRyY1ZMUlk1eUI0OTk0UVo5c3BwL3BkZVR1cEMxZmxKSXJJ?=
 =?utf-8?B?VzkwM21QWHIzQVVOWTVsemxybHJqRVFrU1ROOHlDdlI4dGFLZFBtaURZbGVR?=
 =?utf-8?B?U2FGbkpma25IT0x0SElGTXB4WEhjMTh1UGhBTlNkelpLblN4UWZEL1NVUlJ2?=
 =?utf-8?B?RU1yODBIdEI4ZEU2anNsQUJvd3N4NFFNZnVlTGUxRG5XNy9mWXoyNzFkblRq?=
 =?utf-8?B?SXZjbkVESUNITlptTWRsaWFmNW9BNWdQeU44RkxNekJ2NkVnalh3MEtVREQw?=
 =?utf-8?B?MjdUZlo2MS93NU8rUDFNbkUySDNmNWMvakhEZWdzMVNYUDd6TEg1aHZPT1lt?=
 =?utf-8?B?bHpqU0hFa2ltWnk1YWFla1dJTEFKNzRWSUpHTjArT3R3Q3I3ZXNNNmU1WE1q?=
 =?utf-8?B?cm5lRE96Qk5Xc3Vnd2o0NXFlY25ueVp6eUtCaElYUEhrcTNNQjZ5amxCKzVr?=
 =?utf-8?Q?i5wI2b?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:37:15.6767 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d948d2-5ab0-4f75-ba7b-08de259b5dda
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7597
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

After applying this series patches, I tried booting am64xx-hsevm in 
prueth dual-emac mode by applying k3-am642-evm-icssg1-dualemac.dtbo 
overlay, and I am getting the following kernel crash: 
https://gist.github.com/MeghanaMalladiTI/784fd2262d95b19fe9573c553c4a6a24

Can you please take a look at this.

> ---
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

