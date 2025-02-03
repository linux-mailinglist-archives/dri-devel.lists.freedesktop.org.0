Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C992A25B67
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C77F10E4DA;
	Mon,  3 Feb 2025 13:53:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="eAXfW5xJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eAXfW5xJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2053.outbound.protection.outlook.com [40.107.104.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4347A10E4DA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 13:53:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=miKUB/GDotFF+bsEwtMMaxy5RRjhjW+wPbnGzW99nLjzxMOScZY6gILXIi+0MedJT86Oz6deamLu/GVXWcVRka4bUY1ULPMFM22Ve6XnFHTJsB2md5HC4BnllD2H4P2qPIRQhx4vZwDlmkkYABhDwfUIym75aXD0Ms9YcqG1X0nfVzi/c+1frgys1gKIM+b7D9FtkzSsc9WRYr23NSWn9kXgphP0KIzrUE+dJ3IyDncN5FCzBuw4aui0YvTyN5m8gi7EkVZs4gmJEU4xuyguF4rmx+hoYFRz8ZWkAIaouYWE/eagcS97DSsBh8Erpj5hPqjkbwGC2CNmJQwMWBUq8w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP0lVic2e3EE3KF8kqlGQOsyRt2qVrpeRbqFwGCjl6o=;
 b=JBPgRIBHJPBFGCZkENLHMs0ELlnmneO8xCpUBneUJNGN1o785ck0mL97lj3AYoBZJObqXcIotSb1oEn5HRRpxQwpC4+gbThxNi8Vh0VOYDu5gYy7J76ysyQUIWuG9x4VTFzL7TDolQ5yTOUmLHzeMRX/DcpEqo4b+RVDQR7/mamil5lg2HVWk7GWvRvGND159YZ8GFNLUQq9cDsOtR7waIA5m9JcQWSNj+5WOboKh6mfQIQ+eb/p7FUg2wPupAgp73Q07UomboELm/3zvyrPZbCUQclcwLNg9wt+3zE+5jdoQ4fpWsLtpzeWsWh2KX59iFzgCr7pR2AS3jjBLPP+KA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP0lVic2e3EE3KF8kqlGQOsyRt2qVrpeRbqFwGCjl6o=;
 b=eAXfW5xJPqL7qn20j4u4/4kNLfMJIyL1g1VqGCD1iHKEkK+8/AKKmGDDy5u/xs0/AKS5HqWvpJoonlufsJSZ192EtSlykDWVrESoiH6h5I5D0pqzlUcJ2tAfy2rjA94/qyVSbXlyeYN+6p1nJ+9hbgHRhGtF2SshLXe56PSMTK8=
Received: from AS9PR06CA0078.eurprd06.prod.outlook.com (2603:10a6:20b:464::28)
 by AS8PR08MB6150.eurprd08.prod.outlook.com (2603:10a6:20b:29c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 13:52:56 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:464:cafe::bb) by AS9PR06CA0078.outlook.office365.com
 (2603:10a6:20b:464::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Mon,
 3 Feb 2025 13:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 3 Feb 2025 13:52:55 +0000
Received: ("Tessian outbound ca1ab514ff10:v560");
 Mon, 03 Feb 2025 13:52:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a155a5262f928fa8
X-TessianGatewayMetadata: isaR7VsRjQaz22AlM+auSyWsiUHvKVv5KEZpqQBcqtSWMUbxSCXBJmMkNrMZ/M42l5ES6qXsmTAAei1uJqvVsMPoush0qMH+JYUv0ctREELmrAt4hp/z8qxtnLyLaVMykIbEf523WMWX+cNEPq1CsGuAXjDnTasD4+iDCDDShb8=
X-CR-MTA-TID: 64aa7808
Received: from Lf232805ead71.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D07E2FD0-3EB2-4A12-8ACB-938E0CFDB4C2.1; 
 Mon, 03 Feb 2025 13:52:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf232805ead71.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 03 Feb 2025 13:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxXapb4Om8vwU5PapHTRiWCZSU+Jyg+67g8Px6LZBKmBM0l8HLsaZ6BqcH2wYFgMze+7C0OjjHRgGAZjclOTc0vBwKHEMmJvLLE7EzyZmPyOnlOTNTYU6EPC1HFRXLfAJtKH/tMjEXk/nzSMI4izsIeB3hlZ4ipK20HTcb1kyD8bbRYw5ggLEEX2+5DQ96tk3nbpyFkqoYHRoLh/5X1ubH3BbaGup58o0PV3Zc3JJPOd78d1WfjZKA2iGfJholtABoZH97zSVF/4rLsvbYiwvuIlgfSDnK/iZOLB7wKGo4vM7cee9n6U3LNCaV+OZZbjC/1AhHZenZ5biV+ULbikGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP0lVic2e3EE3KF8kqlGQOsyRt2qVrpeRbqFwGCjl6o=;
 b=Yky+s81vHt8Ck8SOMfHdSXiLDXsFgYcpPl46OMXdY/2SGYgfqScQ41ZwcIBRdB882baKYqux1LnbGkXg3VmRSy4+Y0Eq5XR4MbtIqANNvNIHrBSOWJT39If1e4P+ROTMBX0NdxhNcGNNlztLWvU9dRdbqFJlnE76anyGDk1xorQpQaq90uyAdE6CClp1tQxVe8NMiEQYQCC2yJk8c1ebdU+g7VqA5+TuypiMwQdLPDOUsATAPcWn4wlhrhNmEMUTqmUQZ8CvWJgRbeoodpPUTr17yiK64HtQmpaKfCYrGR4FREbn7CCiXiQaEmzR34nDbA82+D3dh3MciANsapsg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP0lVic2e3EE3KF8kqlGQOsyRt2qVrpeRbqFwGCjl6o=;
 b=eAXfW5xJPqL7qn20j4u4/4kNLfMJIyL1g1VqGCD1iHKEkK+8/AKKmGDDy5u/xs0/AKS5HqWvpJoonlufsJSZ192EtSlykDWVrESoiH6h5I5D0pqzlUcJ2tAfy2rjA94/qyVSbXlyeYN+6p1nJ+9hbgHRhGtF2SshLXe56PSMTK8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by AM8PR08MB6386.eurprd08.prod.outlook.com (2603:10a6:20b:362::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 13:52:40 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%7]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:52:39 +0000
Message-ID: <0fc22f56-1386-4b4a-bddc-0745ec8a3f9c@arm.com>
Date: Mon, 3 Feb 2025 13:52:38 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] cma-heap: Allow registration of custom cma heaps
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <2255866ee9e81136a7099376b34b8305758ec9f0.1738228114.git.florent.tomasin@arm.com>
 <kyesso3gaajbdze3ie4imrmrk2lzqf6s7eoonlljeitfs3utwh@dycnl7cnzep5>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <kyesso3gaajbdze3ie4imrmrk2lzqf6s7eoonlljeitfs3utwh@dycnl7cnzep5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|AM8PR08MB6386:EE_|AMS0EPF00000199:EE_|AS8PR08MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5b1884-5626-4c2a-b267-08dd445a0fcf
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?UGtXVVBPZWppRXpjZ3RFQlIvSE1sbjB2by9LeFdhcENpVW9Wd2cyc3JLYkho?=
 =?utf-8?B?WnpaNUZQWGFtbStHM1dnZVNaS3lhY0FJa1ZsbUQ5SHNwQW1jVTJ0RktiZ2V3?=
 =?utf-8?B?eGlla09taDV4K1NwbFVueUhHdWxDdVp6bUhZb09NN0dEOUhvZHJ1YzlMOHlS?=
 =?utf-8?B?VjFGMGtLakRZUnFFamFkNDhrcHJrTEI1NXphWFJVUU93MFlCcmdXNDJQUWhV?=
 =?utf-8?B?SEpMZ0U2TVIzME1kRmoyQjFlOVJvUDR6MFpUL2FjeUdrWGFKVk5mSmM3aHBh?=
 =?utf-8?B?c1lDQzJjUENIVjdWOFpheXBPRkVCck1uU2FIZWpVNkRHZVNjUFJ4b215Lzhv?=
 =?utf-8?B?N3Y5MTRxYlF5d2xPWVlqekZ6ZVdueXlVMDF1RnNnYTVMbkkwRTA0dVFqNFJU?=
 =?utf-8?B?eC9rdHhRcHpYL1JIL2lVL3lHSFhhKzU4cUpQdVNaam81emVKTjlsVFhzU2RU?=
 =?utf-8?B?bXBOU0RWSWhBMkExZmRvWDRpWERYc25pajErWlIvUFpCSUJ1NTcyQm9iUjUr?=
 =?utf-8?B?NGk4Zm9GNDhLbi9tNS94TE9OVEI4RjlmWGhIeGNWN3N4R0JIR3F2Nkp0djlQ?=
 =?utf-8?B?UkZxY1g0UnFBbS96Y0FVNk92NzBSYlBjc3hsYzlDeHV3L0RKeDdZc3lTTnU2?=
 =?utf-8?B?NGpyd1BQTXRVNXBjTVhXeXJQTS90WkVIYzhvWnNNaEcvRDRLMkh1ZkF6VE13?=
 =?utf-8?B?anhWS2lRUGZiaDJ3VTdhZTBQMlpDYXVEYUdWT3hSQVFiT3dTWTMrUnlSb09j?=
 =?utf-8?B?clgzZExwbitBWXhaQW5wUkxkcHJFU1hvRVlIU1piejJHY1BwS0F6WEFIWTJ6?=
 =?utf-8?B?K2pQQnBOZUgzN3BpNGdLU2JrcGVwdmM2MXhDcmxyMkY1QjVjSkdqak9NZlp2?=
 =?utf-8?B?WS8rN2N5Q0txU1NhK3ZhbTFJZytZR3ZZWXRGZHBWcnpwQ2NhQVVsUjNTRzR5?=
 =?utf-8?B?ZlU1OTNVbHBxSmRsOVF0MDBIWHplZ2o2TEJFaUpKVVZHb2k1RHlXS0NDTFNo?=
 =?utf-8?B?WHd0NExOY3NCUlZyQW4rU1FMM2pWU2w3bGdzakFHczNoVGFDeGxJWThuMXNq?=
 =?utf-8?B?cVYwZitoZlBwRDJpNEFINVZLSlVmTEdqdnhXU1h6TDhGdEdjMlhMUHpXU1pp?=
 =?utf-8?B?czM5QVlFZWJBVXlLQlNqWDZ3MEtybnhSYmdNWlczZktVVlpvL1puNUJZbzdm?=
 =?utf-8?B?Z0k3T0FuQjJwTUp2M1B6QXBmNjNvUmFEdGpMay9FNTl2UnZLVTFzM2ZORHln?=
 =?utf-8?B?cG1BbTk2ZldNa0I0VlkweFFNVjVyR2pZZTFHZEpOdW5iUkdsY1lCT2t6cEFM?=
 =?utf-8?B?dEtwUFdPb05KWmphMnFwckZlOGplYjFmZXdiLzk1RGRJYW1SZndRbmdRdDRv?=
 =?utf-8?B?cmFUQXZiZHZhYlFoQWRzd2FqdUdUSDRJVWlVK0wxWmpIaVNHN2VMTEMxdHFv?=
 =?utf-8?B?WjlESVRpai9Ga3o2U0l5UUVHL0U2a3dlaUExa0lPMk0wc05HdzI2OEJ4WW1M?=
 =?utf-8?B?UUJ0bENmWXlZYlJuNmlsb0YxUHovaTJWdDJaUmtrZGdRRy9ZbVdUeXlGTjA3?=
 =?utf-8?B?U3c4NHF5YmdidE1WQ3ZHTzYxRVpZNWs0Zm9WYm92dDcxbGo1ZEdTQXMrd1gv?=
 =?utf-8?B?T3lTeHA1QTdDZ1diQkhEOGN1dHpEWU5RdzVMZTVWTktPVFFDMG1tQitQUk1P?=
 =?utf-8?B?eGM2SitkNWpjeU9QamVmRHkzL3paei9TOGszY0VPY2pmaXNUZWswRmxKaDJL?=
 =?utf-8?B?dklBS0xNNVYydDE1d2ZELzNZSVpaK0NaSWxubU9BbGpXbk0rY3dYREhpZjlt?=
 =?utf-8?B?bGE4bnVTeU9ITGJqRmttZz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6386
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 997e9b26-a0eb-4b3a-d3b5-08dd445a061e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|376014|82310400026|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2N3d1FpVnRJM0NOYUNaQlkyMGduQ0YwTWgwdkZiMk1XdkxSTGI2djJ5dXRF?=
 =?utf-8?B?QzFnV1ptbTRKczhLdmpnNGIwZkhzL29CU0h2M0VGaEtlTU5YeXlMU20zbWZR?=
 =?utf-8?B?alVDUURNWGs3cWxIMTU3bmlOOVBuNVpoenM4UVZ0S2dVVXdSS1VpaGNydG80?=
 =?utf-8?B?Ykh6eHM1djVRRWZkdXIvNUFkV3RTVE5UWExzM0RWZzBnYXhwNlBOUEpreHRq?=
 =?utf-8?B?MU55S3U5WEsxZzI4bWgzKyt0dGU1WjZMWnVaaTJJUmhCZURZYU5QZi9jakF5?=
 =?utf-8?B?cC9BZWovOGZBVStic1VTS0pkSGpUSkxvVkI1R0QvOE1NZTZra3luUlBFT0t4?=
 =?utf-8?B?WWREOVNIWVo2NE9pWlI5VWVURFByRnhQdFBLV3hmMkNIL3FXelVFd3gzY3dq?=
 =?utf-8?B?U3laMTZtekoxVG5ubXlLM3lvYnBnQU1RRHFhRWYzTzJlNzBCcUhQTUdxU3dB?=
 =?utf-8?B?U2cxZmgwYmlnNGxMZFlPcU9MY1oyVXhkOWd2ZUxkMUFVdmNPdnczYklHNEVT?=
 =?utf-8?B?ZDFmckkyYzNjR2I0K2prWng4Z2FCZ0dvaVN5V0RFSUxYSkRjd3Q5QWlBaFhH?=
 =?utf-8?B?aXJNVk5xR2h2RytaNWw2SDNqR3BIOVBCNDV0emdNSmRldWZWVHdDZGU5bmww?=
 =?utf-8?B?UlN2clU1TmxTTUZFMzBHeHNNejBOT1pDY1dUbUJuS1U0VUZRZ05jZVV6Rm1r?=
 =?utf-8?B?SXQ2cDUxZDVqR0Jxd3RPMDNkb3dnaGx3K1RhaTlIUlNwazdyV2U0emRlZmpW?=
 =?utf-8?B?YmRwdWZGMTV5RXlaV2hmSFdvYTZEelVWR21idEdITUgzd3NzSWZlcHNqSmNh?=
 =?utf-8?B?TmNXR21XK25hK0lwbnRoeHlad1U3QnNtZ3lmaDkzNWxBNnhkTDhVenVNM1ds?=
 =?utf-8?B?cHU0czZrQnVTL0xpSVY3RkRzS1k4elM0K0JjRk1DaU80MHB4VjZ3UHVwcVg3?=
 =?utf-8?B?L0hEanVQbXcxenVIYlhDRVpHZ0w1TG9nSUZJVlJKNHN6WUpNU2xoSXB5Y0NR?=
 =?utf-8?B?K2lTeXkydjNVVS91VjA2WW5ad3NNYzd0QWlUWGdTWEsyQnFaSmhSZ29ZYnlw?=
 =?utf-8?B?b3FpbEtWd2k3YklJd3pkb1hBT1pvWTh2WDJaZUZFbFNkYmlpekxHTmoxY05H?=
 =?utf-8?B?T1hlZHdKS2kvaEw2ZUYrMzBJZ3dMYzYzQ1JDZEU5enVYK3lyY0hoblJ2YnNm?=
 =?utf-8?B?ZkNFRklqZEFhWE9GNVlJMHFEYURYQ1o0S3drR0ZHN3ZNVUNzYVRGQTYwcnFp?=
 =?utf-8?B?RDB5amhTNUd0MnhWYU5jTHQ4QmkvdFJrK1FZYU82ZW15T1EvQnVjSjlocmNv?=
 =?utf-8?B?cm9NV1V6czRJOXlGUElTS21KdDJjbCtteTNodk5YNm9rN2dtU1FvbXBNV3dx?=
 =?utf-8?B?TDBrcXpwVGJHK0NCejcvOVdrOS8wSm4yemlWQVc3ZHA4aU5pc1hsYlhnajhv?=
 =?utf-8?B?MkF4M1NNeVh5NHhCaHBlLzhncDZjWk1SeXhqS3NlRDJ2RUcvSEIyTWlZTUF1?=
 =?utf-8?B?aFVhcnlaZTU1eGRTd1BBYnJ2Q3d5b3B1dFllR3I5OXFJa0U5RVJNRmRtRmhR?=
 =?utf-8?B?VXNmZm93b1h4dVJXN0tCbVVLQUZ5STE3NmJOU0lCQzMzNloxZnZGYUduQ2Y1?=
 =?utf-8?B?RmpEbitLZGJVNDJWd3JjK040Vk1kY3RmaFNqWUJKcW1mVDErT28yeHJoem9C?=
 =?utf-8?B?ajNzdTY5TG5MOVh2TXhxYzR3aEZvNmwrVDcydjdIQUJQbXROZUE5TnBreWkv?=
 =?utf-8?B?c2trM2dPdWUvRG9pbEo3UDFkbXo2VkJPb05FcFRjUjd6LzRPWFNmQVlRSFp3?=
 =?utf-8?B?R2hHN2NQRGhua2ZTc0NkOE5Ud2p5eEd1VU5sZ3B0Y0l2ZUYreXBYT0d2di96?=
 =?utf-8?B?V1llYytLZG1MWk96NkNjK2lFeW82VHdzU0FNaTBOYVBUY25Ia0tpMFdPdFJL?=
 =?utf-8?Q?7mc104TpL/E=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:52:55.8868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5b1884-5626-4c2a-b267-08dd445a0fcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6150
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

Hi,

On 30/01/2025 13:34, Maxime Ripard wrote:
>> This patch introduces a cma-heap probe function, allowing
>> users to register custom cma heaps in the device tree.
>>
>> A "memory-region" is bound to the cma heap at probe time
>> allowing allocation of DMA buffers from that heap.
>>
>> Use cases:
>> - registration of carved out secure heaps. Some devices
>>   are implementing secure memory by reserving a specific
>>   memory regions for that purpose. For example, this is the
>>   case of platforms making use of early version of
>>   ARM TrustZone.
> 
> In such a case, the CMA heap would de-facto become un-mappable for
> userspace, right?
> 

It could be that the CMA heap or alternative carved-out types of heaps
are made mappable to user space. An example would be an integrator
decided to implement a single carved-out secure heap and have both user
and kernel space programs allocate from it (using the DMA heap
framework).

In the case of Mali CSF GPUs, this same integrator could have decided to
share the secure heap with the whole system and protect its usage with a
secure FW.

>> - registration of multiple memory regions at different
>>   locations for efficiency or HW integration reasons.
>>   For example, a peripheral may expect to share data at a
>>   specific location in RAM. This information could have been
>>   programmed by a FW prior to the kernel boot.
> 
> How would you differentiate between them?

For that situation, I relied on the API exposed by this proposal:

-
https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/#t

The heaps would be distinguished by the name they are given. Therefore,
in the CMA patch, I retrieved the name of the heap using the label of
DTB node. We could do it differently and have a specific field in the
DTB node to assign the name.

I assumed it would be possible to call `dma_heap_find()` from the kernel
driver. The name of the heap would be known by the integrator. This
person may decide to hard code the name of the heap in the importer
kernel driver, or pass it as a property of some sort: insmod module
parameter, DTB, etc to make it generic.

Florent

