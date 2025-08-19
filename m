Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7451B2C6ED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004B10E1DF;
	Tue, 19 Aug 2025 14:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="MVTEca79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023118.outbound.protection.outlook.com
 [40.107.159.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DB010E1DF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 14:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnvg1gUjIvQSGMXVKV1XBbW7Gzr1VvTf9uXpNujvifB2skJuM4MaPJH2Lm6hdJFaJnjVFZw/417+scc3hEzMog8CGV2C2enEiag9qn7nxh2zfsj7Rk5MM3wDIuw21LAj0pnpnxypMNHCU++tlT3eSF7roHTOHh9dWdWSJWw2I/hWy9OGQUGXJOXkcetTHifIlqgekLE7UoLt1PAC8yh06XA2ntncew2kYKEXazxc3PR+MHhaHiEdo0QGt80E8lpyNOzqRS/aGzeJKDtEuQmTc/FAJIhuHrXYPNKKmgrXuAk8gkaBkZK9ZROkRjlR7Cjawd+Fk1LYgbNniD/hEQCcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf72E4W0JRDCSG7mXpfIx1MkYIIESaSO2DdZrkGNdHg=;
 b=X3pbIWl2b3CXWL9Ulz0s2kxXDU1YgO+rOS6E2ODMpTldaEetPf6dYg6YDSAzkV1221dMxdGbcwaizf6Q7IcYSZRfyVjABzwCe/1CD8R187766B+EgcA/53Z+LSd/rSoDgcsFYn69QMVcYBR/hIAR11CXqnDLX3GKUHH8X6ki0+8XP40Anr8JvRGoXxPmj7Hj5FVFom8zlab2SSNCnYkbRGQtC4cmO5c4+E7CvxRQGRfdapMWtTFSdqrhwQHA4ZazuFh1AO+I5lnyTlEKZ1lp+K1o/yP3Dk+2lbyqWC0CLTqR9UanVyaKO31wVwwIG/Jy2VW/qrcx3gahDGVZlnaZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qf72E4W0JRDCSG7mXpfIx1MkYIIESaSO2DdZrkGNdHg=;
 b=MVTEca79Tum0ghnS9XPBjS83/MdySGxoA2/a76GLrmCk0ESyupairUoPJwnz51Q41tIG/k0Owzx4Rni13wb/6dz6/7llSn/rNhswwrc+d/zMdjKCmernZNeW591BqDz5LP7UZZx/hezBg08/zlrCdBv2HUvrK8vjvF5J4SnBW+oBSxXcezGpkQAyS7cY/Vla7Aq10raHjUZICfKzTV9oMLuW4Dvvla6opf51HO2a3rJSGyHBChydd2O7SDsG3pTIwelYUOIfMmZQ/cVVK3BLx8CdpnbiH+nXmSXbnNo3bM3hqpnYfUgAyhuY88aAG76CUr4wnNOZAljHjZqZec1xPQ==
Received: from DU7P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::34)
 by GV1PR04MB10656.eurprd04.prod.outlook.com (2603:10a6:150:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 14:25:40 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::65) by DU7P190CA0020.outlook.office365.com
 (2603:10a6:10:550::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.24 via Frontend Transport; Tue,
 19 Aug 2025 14:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 14:25:39 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com (40.93.65.1) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 14:25:37 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 14:25:30 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 14:25:30 +0000
Message-ID: <7d57e55a-223f-4c3a-8806-1ea616b56d02@topic.nl>
Date: Tue, 19 Aug 2025 16:25:29 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v2 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
To: Maxime Ripard <mripard@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.9365be0b-205e-4d59-ad18-c1924bf45277@emailsignatures365.codetwo.com>
 <20250819053205.9976-3-mike.looijmans@topic.nl>
 <5dc6mmx26aa6qoig5wkei2uozdjmx5r2uduhc5wtja7dhjdypj@fincrfpg5u3s>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <5dc6mmx26aa6qoig5wkei2uozdjmx5r2uduhc5wtja7dhjdypj@fincrfpg5u3s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0040.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::28) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU2PR04MB8677:EE_|DB1PEPF000509F3:EE_|GV1PR04MB10656:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a2cf76-3c5a-4c67-968e-08dddf2c45c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NWYzNGJtMnBQRjU4YklPc3VvS1hISXZFU3ZOUEtxTDdGUGRuOUd0czdzR1hx?=
 =?utf-8?B?M0FGOWJ1dWJuWjY5dDBzQ21nYlFPNmsyUHV6QkhjeGV4NFc4V09meEJzazdK?=
 =?utf-8?B?dDBXeW51WlEyRXZwNFZ5NnhIYUhPVER1SllNckxKNElibjFSZ1ZqNUdMR1Nl?=
 =?utf-8?B?VlVCU2xreEdXT0x0WTRpb1pXWGtWM3BpK2VGYlY1RDBXWmRnMmJZdjA0cENy?=
 =?utf-8?B?VHRBNi8vU3JudWN4d0w3NUVaSG9XU1JQSTF3VitxZmhzYjBMY0Z5SnpkNEly?=
 =?utf-8?B?c2JCT3Ezb0QzQVN1dGkrMjQ4Um00UHhkbEh1a29YejRKZUpxR1g1V3QzaVRD?=
 =?utf-8?B?K0QrM29yejl2STJwaGhCUWI0LzNYR3d2VjFKUCtxT1IxWDBJbFpwS2c4QkxW?=
 =?utf-8?B?Rzd5NWp4UzdueEtKaHhDNXhNakJoZXpmUmhnd2ZCOE9xUnNwRlN5VThxczNq?=
 =?utf-8?B?MDE0b2dUSTdKdy80WmtVcmhEWndMWFBQN1R3Um5oMzlRR1hMS1lQUlBVTlZp?=
 =?utf-8?B?Mm8xZkhlV0laRk5XZmhoTzJRSmZFZkVyOTl3VktwajRWSDFlRGE2dDFrUTQz?=
 =?utf-8?B?d3lZVUVtOHQ2bi81b3IrQXRWNzc5WVQvTnorbFFrZkwxUXhPb2p3Mjljbm1H?=
 =?utf-8?B?VmJVRm9CNjhLODM2L0U3QkEvc2tyVVpvcnp2aS9Db2twdW1POXkwbCsyQzRh?=
 =?utf-8?B?TXprR09VYmJ2Uk5RTExOWHFvSExWS3dUbGgwU2h6T3AzbEEzeCtEZ2R2bkh3?=
 =?utf-8?B?VmtRN21qWjZaNzNxNkp2alV2KzBrV3dmRnVyTUFPcS9ISHkveDFMYlNYMy9X?=
 =?utf-8?B?aTUvd1BuVHBiVGw5S1Q4ZUx0dHhQVWRjbVZnaVdPbXZvQ3g2dVpZeFljQi9J?=
 =?utf-8?B?eWVpTFhpUXE1ZDFrMG9nSFk0cG1qOHpHWGNKVHNQMTRhdmxQMFF6WEMveWND?=
 =?utf-8?B?aSt6Zk1SMlZVcWRwcHVSM1RiTW92TStpSk1JRVpvOWluaFFnVU9qV2MxNFgy?=
 =?utf-8?B?NXJCTm9GdEVsQWc1bkx1RWVNMVZab3ljZTFRUE5pcm85S0hmRmZTdjF4Q1RD?=
 =?utf-8?B?UUZFeElSeXlVazY2eW8vV0JRQlFRSkxucDVUMWZGN09USHdWMDQ1dFVQek5K?=
 =?utf-8?B?WE1zVXhUMnNlaGxUVTdTWENReWwxbWp1VnVydEtoeE9vUG44bVRielYzN0JM?=
 =?utf-8?B?OUhkMy9oTXNBQlFtTVdrSnQwS2hUMk5xYW4xUDRUWW4rbnRQeHNjazRZczZM?=
 =?utf-8?B?ZEozTXFaSndVMkN3VEo0clZlNlNwOWpqdDF0SXl5dlFER1RSOUxFWXFiL3hj?=
 =?utf-8?B?MThDUE9HWWh6b2ZqTmViNnQ2RWM2Q1JrRS9CclE0NFFTUVhuNjJZNFJwQ3RZ?=
 =?utf-8?B?SGNvMHBlMXFjM0ZLQmw4VHRKSUc2ZlgyS3lGbnM4WUtINFd1RTFjTlEvZjho?=
 =?utf-8?B?dURreVhLbGVJWmJPd3BCczZ6SXFld2VlMnpwcEwyMERZVm55Z2xTZDAzeW8r?=
 =?utf-8?B?MjJzSkFBdDlsMHphdHl2OVQvSHdLYkp3M2c5Yit3SkRJQ2dkdllPQmpOdlVt?=
 =?utf-8?B?bWN2U2dZTldZbGdtYXM0MFpRclpMVmdKK0xPS2s0V3ErNExUaWNkeFA5Q0dp?=
 =?utf-8?B?OFhZalhwTnRqLzBsaC9lUmc2MEJEMUFDL2daQnBYMjk2S3NTcFdESEF3Y3Ba?=
 =?utf-8?B?UjJjQ2Z3d1FaRlZwSzNFU2o3MFU1Ylk2SlRrTktUL2ZzNjBLSTFNRXlCbWcy?=
 =?utf-8?B?VmEvUzgweUQrcG5MTTE2eHFaUEFlL3JjSmxIdW9tOVZCS1BQSzgxVEdLWWh5?=
 =?utf-8?B?U1pyZ1ZkWWVvaFYvMUwvbGk3SVN2dURXSFhxZVlWNG1lZkNteFhpVk8zSktk?=
 =?utf-8?B?T1A4dWFrTncvRkFEcC9STVlYZ2NjbVRuUlJQM1gwUFJXcFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8677
X-CodeTwo-MessageID: dccca26e-508e-485e-b233-a96f041a417a.20250819142537@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f223d37d-07b5-4eab-3538-08dddf2c3fe3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|82310400026|1800799024|376014|14060799003|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUhKMHlOdG44bVVjc1hZYitxdGFaMXNKRVRDQ3VXZENjd1ZiRWNYb05DNmZG?=
 =?utf-8?B?QjNockVoODVqcll0cHdCR2ZieWVRRjdGcUlmckVTZk5uNVc3YVo4QTJvTG5J?=
 =?utf-8?B?UVA0S0ZySTJvY1BjMzlzSDVIUU82S1lBdUxUbTlVSkoyU0M2NlF3Z2crRjFq?=
 =?utf-8?B?WC9OYWVpYVNFck9xcnA2UlZTemdZWUhnV3RtZVpmWGZUNVRibnFMUS9tVS9s?=
 =?utf-8?B?VzUxMzJHZ09JelN6aXlETjhBRWRQczBGZFVhdnd4bis3U2RLWHZxWnpHaEhT?=
 =?utf-8?B?dGpieDZBVWZFbVEwelAzUllrdG1ua3Y3QmkzMzhTM0V0VDVtNTl1cE1IUHVt?=
 =?utf-8?B?RXBEdnhJRGZ5MXdubzRnZWZZL2pQRDYrc3NvTEl3NWZSQTdpOUhiWUtlc0E5?=
 =?utf-8?B?UmJkZFpxVzNiTitUTFhxNW9BS3l0V1B4OER5NWx4T09YQmpnUjZpOHkrbTRY?=
 =?utf-8?B?S3g1Y29IWWR2WW5jMjVIVlpQNFBLRHl6YUQ5Y0ZuZ0VuTy81T1BzQUQza3g3?=
 =?utf-8?B?b3FVU0U3L1BZek14YitJL29MejdXemVKK1ZjQWRSRVRaS1JEdDhkMDFwTlpj?=
 =?utf-8?B?ZEhYNExFSmFlSU4vSU1nQVRLZUpDempqeHhqNEpZSEdnbGVtN3BWTm9kbVQ2?=
 =?utf-8?B?dzh4OUliSEltRDUzZVdWdEkzamVrWEpWeTVSMWE2Y2l6ZHU5R1VNKzJmQTVP?=
 =?utf-8?B?YjR4MWxCODRBRk5jOW90aURzZGR4SUZxbFdXT0c0WHJzdzVORFM4VVkyVDkz?=
 =?utf-8?B?SjI1OTN5eDNaSjlFdzVOeG1lTGY4RzQxVUhzVDlFbnFXQ3UwMkdnMXBUVnNz?=
 =?utf-8?B?YllVamhZSjBSWGNjamJzbS9ON3pId0d2N243VlUxdlRsaVN5SjYzVk1rMFNz?=
 =?utf-8?B?NnNCSUg0eThpYmFabWhmNTh3NFlCaUtCMi9qNmd5WnNEYTBtMGpqc0ZkSHJD?=
 =?utf-8?B?REcwWEhZQjRkbGJGWmhuNUkrTm9mTjZiU3AwTXhncGJNYXdaYzVZKzlSZlBQ?=
 =?utf-8?B?NU02VnFLaU9ZcDhiSDJld1hvbEM5WnYwZS9EM1hlN3JMazZVOUd5S2xmRm5I?=
 =?utf-8?B?T2NwM0lFZnBHN2ZxOUZUbEk4di93RVFyL2hsUDQ2c1kycjNISHFvZHk4MVVH?=
 =?utf-8?B?SFpHTzFYYm1iV1hoRGU5aGlYQUIydVZ3b0ZFMDhqY01TaFd3NzcrUnZJdGpz?=
 =?utf-8?B?NDlTR0txMEdWSmFrdzhKZlhUMlRGZ3ZpbXpDNEtYQ3JoNzhCUnkyQ3p4Unkz?=
 =?utf-8?B?UUhYbHJkVmsxTG4wWlFiZ2V0c1A3VjhOb3B0KzZUT3Q5RWtMc1dBWEo5SUdM?=
 =?utf-8?B?SUFSbGlNbmY4OCsxSzRuWWc2WlhwV3ovNm1BelJJTHA3QWxZRDRjangwQk1x?=
 =?utf-8?B?dFJ1WDcvb0lGY1BWM1c2cW1tc2hEdlc3S2xGcExGcU53TzdLUjRNcVl6Nlc0?=
 =?utf-8?B?UHUxQS9RTmVRSjNKcWtiZzMxWVgxOXV3WDM1Qk1hVGFoNEhwN2MxVDFoUUps?=
 =?utf-8?B?elplMjJ6Uno4cXpxZ2cvRjdVang1RVM5QlAwSUZQVk9OcVlDNUZNamZMTXlB?=
 =?utf-8?B?c3RoVGZIY0JSeG9OS0xIWEFrd3p2dWJCZkc3TFgyRnljY0tRcHZEdWhGb2gx?=
 =?utf-8?B?bjErL2JBcERoSVdsd1NlcWdaZVFma0lKUkxLZ1VZWnVLbDJ1VzZWUjk1eDZj?=
 =?utf-8?B?aVVUNVRHK1BMR1pab1kxSURJVStCdit1MW5FT3gvcVhOSnpRSHUvRW4vVTRu?=
 =?utf-8?B?NEl0OWZReWhLK0JpVCthQlNKY1pMS0w0YlhSbStNeUZ4QmY5TFk5QnRLRkpm?=
 =?utf-8?B?b0VtYjdYZTE1a2NvdzRDYVdGWHlRQnhJYVRjbm1URzRlVEZRdHJlSXRKL1Zn?=
 =?utf-8?B?aGlGdTRaTlRxNXo3UTdyZFVjU2I1ck9tS2xHKzBZZnBkR0t4aDUzdS9vUExR?=
 =?utf-8?Q?8+40OfvpLNomLrUweV3mO0TBkTqpLGuy?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(376014)(14060799003)(7416014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:25:39.6594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a2cf76-3c5a-4c67-968e-08dddf2c45c8
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10656
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

On 19-08-2025 15:22, Maxime Ripard wrote:
> On Tue, Aug 19, 2025 at 07:31:15AM +0200, Mike Looijmans wrote:
>> The tmds181 and sn65dp159 are "retimers" and hence can be considered
>> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
>> FPGA into a valid HDMI signal, and it will typically be inserted
>> between an encoder and hdmi-connector.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>> Changes in v2:
>> Use atomic_enable/disable
>> Use #defines for bit fields in registers
>> Allow HDMI 2 compliance
>> Filter modes on clock range
>> Use cross-over pixel frequency instead of manual overides
>> Devicetree bindings according to standards
>>
>>   drivers/gpu/drm/bridge/Kconfig      |  11 +
>>   drivers/gpu/drm/bridge/Makefile     |   1 +
>>   drivers/gpu/drm/bridge/ti-tmds181.c | 561 ++++++++++++++++++++++++++++
>>   3 files changed, 573 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kco=
nfig
>> index b9e0ca85226a..753177fc9b50 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>>   	help
>>   	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>>  =20
>> +config DRM_TI_TMDS181
>> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
>> +	depends on OF
>> +	select DRM_KMS_HELPER
>> +	select REGMAP_I2C
>> +	help
>> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
>> +	  The SN65DP159 provides output into a cable (source) whereas the
>> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
>> +	  can be set up as source or sink though.
>> +
>>   config DRM_TI_TPD12S015
>>   	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Ma=
kefile
>> index 245e8a27e3fc..f4b5089e903c 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>>   obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>>   obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
>>   obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>> +obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
>>   obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
>>   obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
>>   obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
>> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridg=
e/ti-tmds181.c
>> new file mode 100644
>> index 000000000000..34cbdb066820
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
>> @@ -0,0 +1,561 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
>> + *
>> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
>> + *
>> + * based on code
>> + * Copyright (C) 2007 Hans Verkuil
>> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/i2c.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/re=
timer");
>> +MODULE_AUTHOR("Mike Looijmans");
>> +MODULE_LICENSE("GPL");
>> +
>> +#define TMDS181_REG_ID		0
>> +#define TMDS181_REG_REV		0x8
>> +#define TMDS181_REG_CTRL9	0x9
>> +/* Registers A and B have a volatile bit, but we don't use it, so cache=
 is ok */
>> +#define TMDS181_REG_CTRLA	0xA
>> +#define TMDS181_REG_CTRLB	0xB
>> +#define TMDS181_REG_CTRLC	0xC
>> +#define TMDS181_REG_EQUALIZER	0xD
>> +#define TMDS181_REG_EYESCAN	0xE
>> +
>> +#define TMDS181_CTRL9_SIG_EN			BIT(4)
>> +#define TMDS181_CTRL9_PD_EN			BIT(3)
>> +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
>> +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
>> +
>> +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
>> +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
>> +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
>> +#define TMDS181_CTRLA_EQ_EN			BIT(4)
>> +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
>> +#define TMDS181_CTRLA_APPLY			BIT(2)
>> +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
>> +
>> +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
>> +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
>> +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
>> +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
>> +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
>> +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
>> +
>> +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
>> +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
>> +
>> +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
>> +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
>> +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
>> +
>> +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
>> +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
>> +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
>> +
>> +/* Above this data rate HDMI2 standards apply (TX termination) */
>> +#define HDMI2_PIXEL_RATE_KHZ	340000
>> +
>> +enum tmds181_chip {
>> +	tmds181,
>> +	dp159,
>> +};
>> +
>> +struct tmds181_data {
>> +	struct i2c_client *client;
>> +	struct regmap *regmap;
>> +	struct drm_bridge *next_bridge;
>> +	struct drm_bridge bridge;
>> +	u32 retimer_threshold_khz;
>> +	enum tmds181_chip chip;
>> +};
>> +
>> +static inline struct tmds181_data *
>> +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
>> +{
>> +	return container_of(bridge, struct tmds181_data, bridge);
>> +}
>> +
>> +/* Set "apply" bit in control register after making changes */
>> +static int tmds181_apply_changes(struct tmds181_data *data)
>> +{
>> +	return regmap_write_bits(data->regmap, TMDS181_REG_CTRLA,
>> +				 TMDS181_CTRLA_APPLY, TMDS181_CTRLA_APPLY);
>> +}
>> +
>> +static int tmds181_attach(struct drm_bridge *bridge,
>> +			  enum drm_bridge_attach_flags flags)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +
>> +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
>> +				 flags);
>> +}
>> +
>> +static enum drm_mode_status
>> +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_=
info *info,
>> +		   const struct drm_display_mode *mode)
>> +{
>> +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clock =
*/
>> +	if (mode->clock < 25000)
>> +		return MODE_CLOCK_LOW;
> I'm a bit confused by your comment here. Why do we care about the bit clo=
ck here?

Purpose here is to filter out modes that certainly won't work. For=20
example, a standard 640x480 mode would have a 24MHz clock, which this=20
chip doesn't support according to the datasheet.


>> +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
>> +	if (mode->crtc_clock > 350000)
>> +		return MODE_CLOCK_HIGH;
> And what do you call the "actual HDMI clock" and why wouldn't it be provi=
ded?

The clock signal on the HDMI cable.

Again, aim is to block modes that certainly won't work.

While developing the driver (and logging lots) the crtc_clock was often=20
just "0".

This is still tricky though. What if we'd have a DSI-to-HDMI bridge in=20
between this and the crtc, and outputting a 4k display mode? The=20
DSI-to-HDMI bridge output clock (to the retimer) won't match the CRTC=20
clock, nor would it match the pixel clock (using 1/40 clock rate).

So maybe I'll have to drop this filter. Or figure out how to obtain the=20
incoming clock rate. Currently don't have the hardware to test the=20
limits here.


>
>> +	/*
>> +	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit =
is
>> +	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
>> +	 */
>> +	if (mode->clock > 600000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>> +static void tmds181_enable(struct drm_bridge *bridge, struct drm_bridge=
_state *old_bridge_state)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +	struct drm_atomic_state *state =3D old_bridge_state->base.state;
>> +	const struct drm_bridge_state *bridge_state;
>> +	const struct drm_crtc_state *crtc_state;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_connector *connector;
>> +	struct drm_crtc *crtc;
>> +	unsigned int val;
>> +
>> +	/*
>> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
>> +	 * from the bridge to the encoder, to the connector and to the CRTC.
>> +	 */
>> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>> +							     bridge->encoder);
>> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
>> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	mode =3D &crtc_state->adjusted_mode;
>> +
>> +	/* Set retimer/redriver mode based on pixel clock */
>> +	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_=
FUNC_MODE : 0;
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
>> +			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
>> +
>> +	/* Configure TX termination based on pixel clock */
>> +	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
>> +				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
>> +				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
>> +			   TMDS181_CTRLB_TX_TERM_CTL,
>> +			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
>> +
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
>> +			   TMDS181_CTRL9_PD_EN, 0);
>> +}
>> +
>> +static void tmds181_disable(struct drm_bridge *bridge, struct drm_bridg=
e_state *old_bridge_state)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +
>> +	/* Set the PD_EN bit */
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
>> +			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
>> +}
>> +
>> +static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
>> +	.attach		=3D tmds181_attach,
>> +	.mode_valid	=3D tmds181_mode_valid,
>> +	.atomic_enable	=3D tmds181_enable,
>> +	.atomic_disable	=3D tmds181_disable,
>> +
>> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
>> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>> +};
>> +
>> +static const char * const tmds181_modes[] =3D {
>> +	"redriver",
>> +	"auto1",
>> +	"auto2",
>> +	"retimer",
>> +};
>> +
>> +static ssize_t mode_show(struct device *dev, struct device_attribute *a=
ttr,
>> +			 char *buf)
>> +{
>> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
>> +	const char *equalizer;
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (val & BIT(4)) {
>> +		if (val & BIT(5))
>> +			equalizer =3D "eq-adaptive";
>> +		else
>> +			equalizer =3D "eq-fixed";
>> +	} else {
>> +		equalizer =3D "eq-disabled";
>> +	}
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "%6s %s %s\n",
>> +			(val & BIT(7)) ? "sink" : "source",
>> +			tmds181_modes[val & 0x03],
>> +			equalizer);
>> +}
>> +
>> +static ssize_t mode_store(struct device *dev, struct device_attribute *=
attr,
>> +			  const char *buf, size_t len)
>> +{
>> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
>> +	u32 val;
>> +	int ret;
>> +	int i;
>> +
>> +	/* Strip trailing newline(s) for being user friendly */
>> +	while (len && buf[len] =3D=3D '\n')
>> +		--len;
>> +
>> +	/* Need at least 4 actual characters */
>> +	if (len < 4)
>> +		return -EINVAL;
>> +
>> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLA, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(tmds181_modes); ++i) {
>> +		if (strncmp(tmds181_modes[i], buf, len) =3D=3D 0) {
>> +			val &=3D ~TMDS181_CTRLA_DEV_FUNC_MODE;
>> +			val |=3D FIELD_PREP(TMDS181_CTRLA_DEV_FUNC_MODE, i);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (strncmp("sink", buf, len) =3D=3D 0)
>> +		val |=3D TMDS181_CTRLA_MODE_SINK;
>> +
>> +	if (strncmp("source", buf, len) =3D=3D 0)
>> +		val &=3D ~TMDS181_CTRLA_MODE_SINK;
>> +
>> +	if (strncmp("eq-", buf, 3) =3D=3D 0) {
>> +		switch (buf[3]) {
>> +		case 'a': /* adaptive */
>> +			val |=3D TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN;
>> +			break;
>> +		case 'f': /* fixed */
>> +			val |=3D TMDS181_CTRLA_EQ_EN;
>> +			val &=3D ~TMDS181_CTRLA_EQ_ADA_EN;
>> +			break;
>> +		case 'd': /* disable */
>> +			val &=3D ~(TMDS181_CTRLA_EQ_ADA_EN | TMDS181_CTRLA_EQ_EN);
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* Always set the "apply changes" bit */
>> +	val |=3D TMDS181_CTRLA_APPLY;
>> +
>> +	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLA, val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return len;
>> +}
> The datasheet seems to define when to use a mode over another. Why would
> we want to force it over what it requires?
>
> What happens if that change is made during an atomic_commit?

Hmm, this is mostly a leftover from EMC and compliance testing (wanted=20
to be able to control a few knobs) several years ago. Best is to just=20
remove this.


>
>> +/* termination for HDMI TX: 0=3Doff, 1=3D150..300, 3=3D75..150 ohms */
>> +static ssize_t termination_show(struct device *dev,
>> +		struct device_attribute *attr, char *buf)
>> +{
>> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return scnprintf(buf, PAGE_SIZE, "%u\n",
>> +			 FIELD_GET(TMDS181_CTRLB_TX_TERM_CTL, val));
>> +}
>> +
>> +static ssize_t termination_store(struct device *dev,
>> +		struct device_attribute *attr, const char *buf, size_t len)
>> +{
>> +	struct tmds181_data *data =3D dev_get_drvdata(dev);
>> +	u32 val;
>> +	unsigned long newval;
>> +	int ret;
>> +
>> +	ret =3D regmap_read(data->regmap, TMDS181_REG_CTRLB, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D kstrtoul((const char *) buf, 10, &newval);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (newval > 3)
>> +		return -EINVAL;
>> +
>> +	val &=3D ~TMDS181_CTRLB_TX_TERM_CTL;
>> +	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, newval);
>> +
>> +	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return len;
>> +}
> Same question. The datasheet defines which termination to use based on
> the pixel clock. Why should we want anything else?
>
> Also, since it's in userspace, where is the documentation and userspace
> code using that API?

Also leftover from compliance and EMC testing. We've learned what the=20
best settings are and that's now part of the driver code, so this should=20
be removed.


>
>> +static DEVICE_ATTR_RW(mode);
>> +static DEVICE_ATTR_RW(termination);
>> +
>> +static struct attribute *tmds181_attrs[] =3D {
>> +	&dev_attr_mode.attr,
>> +	&dev_attr_termination.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group tmds181_attr_group =3D {
>> +	.attrs =3D tmds181_attrs,
>> +};
>> +
>> +static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
>> +static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
>> +
>> +static int tmds181_check_id(struct tmds181_data *data)
>> +{
>> +	int ret;
>> +	int retry;
>> +	u8 buffer[8];
>> +
>> +	for (retry =3D 0; retry < 20; ++retry) {
>> +		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
>> +				       sizeof(buffer));
>> +		if (!ret)
>> +			break;
>> +
>> +		/* Compensate for very long OE power-up delays due to the cap */
>> +		usleep_range(5000, 10000);
>> +	}
>> +
>> +	if (ret) {
>> +		dev_err(&data->client->dev, "I2C read ID failed\n");
>> +		return ret;
>> +	}
>> +
>> +	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
>> +		dev_info(&data->client->dev, "Detected: TMDS181\n");
>> +		data->chip =3D tmds181;
>> +		return 0;
>> +	}
>> +
>> +	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
>> +		dev_info(&data->client->dev, "Detected: DP159\n");
>> +		data->chip =3D dp159;
>> +		return 0;
>> +	}
>> +
>> +	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer),=
 buffer);
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int=
 reg)
>> +{
>> +	switch (reg) {
>> +	/* IBERT result and status registers, not used yet */
>> +	case 0x15:
>> +	case 0x17 ... 0x1F:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static const struct regmap_config tmds181_regmap_config =3D {
>> +	.reg_bits =3D 8,
>> +	.val_bits =3D 8,
>> +	.cache_type =3D REGCACHE_RBTREE,
>> +	.max_register =3D 0x20,
>> +	.volatile_reg =3D tmds181_regmap_is_volatile,
>> +};
>> +
>> +static int tmds181_probe(struct i2c_client *client)
>> +{
>> +	struct tmds181_data *data;
>> +	struct gpio_desc *oe_gpio;
>> +	int ret;
>> +	u32 param;
>> +	u8 val;
>> +
>> +	/* Check if the adapter supports the needed features */
>> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA=
))
>> +		return -EIO;
>> +
>> +	data =3D devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
> devm_drm_bridge_alloc()

Will do.


>
> Maxime


--=20
Mike Looijmans



