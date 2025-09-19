Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D57B87FEA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 08:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4016410E056;
	Fri, 19 Sep 2025 06:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EiT8H2tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010058.outbound.protection.outlook.com
 [52.101.193.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB45710E056
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 06:29:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijW7tH3nTlLDi8YN/ZkVAM4KRwvpt4UM4Oaa8C+6vkyZM4AVg9YRAKeDmIKQzpMZvVcFSSslDPKXJs/vQaRiefAv15oQ/gaZ3Be5WVEOUs5qwNXUMONxUAF53HyEiYYdkBtMp2xnjuT0CMUAiQnZ/BWbC9vrRDnjB8RAzN0JvXrWbgHZ4dCyP6H9ZCgugle8kp2L6RWQNaxIJxZac2vuQ6GoHY/ZbVgH98whlBM+pPt+mcOLNvSQkggEO/Ff5HFfBdRFUMTZtA0O7ncjgFebdmxalD00cgp5sgRbxT957LKbRITaVFsKH7LRVZxMMw3OwOGAAg5AwxtkFegDyb8RnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymr5RFPtABic/nvXfzxQr4ydK4bWl9RC+MknIief+v4=;
 b=SznquUtaIrBY+wZJqXC4AY8PtPyBwy8jVJt1peFJafar4dKUUMSXnBvwUXBrygn87lnxZ5WBKA7elVz+10rcx1rtOWHzYm2G8XTpcoPdBjdMFcleo4oqT6MxvXz4TYAxqHgRoCXfsY0m3/EOPMnJ3GYuTgm1tNZk4TMjIuF9UeT/cjkNaI7xRhK2Z+g+TiQ6sZj/ez4E/RY1SVe4sVyg+NuvD6c3DDqftZ/zb1FMwyXDWu48T7yPOg1OY0eYw1krMqGHJMFE9VUjOGWj/quXUqR2UyN4YQrqbOdjdWBEx90tkQbGmlW+AliGdTpzz/iZ9vuTxfwUqIMOMD7baGlwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymr5RFPtABic/nvXfzxQr4ydK4bWl9RC+MknIief+v4=;
 b=EiT8H2txoSY8pQbyrkf6E7bMYBmFjPhh+9hPCvKavjG13FWdXUg9sTF3u16R+1P3DCzXusgtXWUBO14n5dJ8/K4umgrX+XPma70UC0KkrsyhKrP0AMYi6MWc3flQliUwOEIGzxsxv1npQmpAR8GVSaZ1XrGrz9tZ//2N9RFVMUQuuJWGaUeLbjq9zpQVHfaDdjp7ATk4g11jyBn7PkotUQzAsMH2lDeT4lb2UXDrbEeno0dO+8mmsBauUFHR7m4OTlMxXaGVZPRUrz1wAHhLcK7tZdfZlvbXEYbs209aTKWvTUzA4QcwMGLPEJbZTiWlj9TO2kuDOh9D6r3v/8MUxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Fri, 19 Sep 2025 06:29:51 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 06:29:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 01/23] clk: tegra: set CSUS as vi_sensors gate for
 Tegra20, Tegra30 and Tegra114
Date: Fri, 19 Sep 2025 15:29:46 +0900
Message-ID: <2718480.Icojqenx9y@senjougahara>
In-Reply-To: <20250906135345.241229-2-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-2-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e19da22-0470-4a7e-2eb9-08ddf745efc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bThTSGprMHNJcTVCdnMxOE9PblFVbVo3Z1AyaTJMSVAvWkNqQkw4UlllMHhF?=
 =?utf-8?B?TXg3VDNBM0tOeHlETUlHbDl0UGxUOTNZVFNIVngyZnl6ZnBpeE1vNVNsZ3Ar?=
 =?utf-8?B?UDBJRHBoTU1Xa2tXR3o0eDVXcnhRUktEY2hpaFBqYVc2QlIwYTRLTjVmRWVU?=
 =?utf-8?B?elNXWHU3OVVTaTRNOEt3ejNNWWEvTkJzdng1SkFMN3NpMmczbG54TWZyRUpB?=
 =?utf-8?B?TEJQMDFTZEdYU2hHenZDVndXcmR5UTllQTF2S1dtRnBBMEljRHdiWnU2eXpK?=
 =?utf-8?B?bHI3WENIekRCVFpRam9TN3RFakUxdVZRbXNEMThmMUwraUlnOWNZZU9GNW8w?=
 =?utf-8?B?RVE4THlVbmZjNUg1UTdZYm9iRnpsRWpqZS9rQzhYOGlBc0lJbVdNZUNPclFs?=
 =?utf-8?B?aDNXbUNLa3hsektCd2U3NUxjbU44bDdyRW4vK1Jmak54bG8wRGh4em0wdkVE?=
 =?utf-8?B?V1lWYU42Zm4weEdsMnVERGRMOGc0eFRMcXZoK1F2cm9vWmE0LzR5VTlWU1k5?=
 =?utf-8?B?NFZzVThTMTdEK2NUTkk2QXp3VE5UNGs1OXJNK2xYazUydXdRN3drTnl1T1pT?=
 =?utf-8?B?dkFrQVRkeVFWbmFaWk1JV0Eva1hGNnEzWlBPNTJCNjdKMHlyR0MxMWJ4RU93?=
 =?utf-8?B?Rk9UNUIzOEZaeE1pTStDd1JvRzBsUHVtQUR2Y0N2YTRqQi9jSmd5V1RxelUz?=
 =?utf-8?B?WHRpU3dxMzI1dTJPY1NCN0lPbFcyRjFnU3J6SjZLdldBZXQ5Yk96YThlSS9k?=
 =?utf-8?B?R2YwOFVvdk5RWnVpRkV6bmxnRUFnODFhcktJZW5YZHREWmJET3JscEtFc3hC?=
 =?utf-8?B?dkk0QlZhRkRNQ1I5bFdmdFphRjltMndZcWk3N01OaGFZQVJueEFBK2ozd3lu?=
 =?utf-8?B?WEUxNllTOUc3a0dhTHJwOFdtb3MrcjJ6SFFpQ2FLL2JmMlU1N3RLdkJhcmF5?=
 =?utf-8?B?elhYRHdQYytHUlNqdUNaYTdMSlRNeElldEZaWUFPNnhNNlZ2Z1d0Z29xaWdD?=
 =?utf-8?B?OXFNSEZNUjV5Nm1FaVBjTWJjOGgvOTBVVE43a0JoSGxZZUQxRlV6MjRUVHVY?=
 =?utf-8?B?QjF4UFFHMXpoMllvVVpwdzExMStLRWx0cTFiSzJFK0wwVTgxSjI4b094WlJx?=
 =?utf-8?B?dnpVejVZVXY4SG1pU056ZlNZVFRaeUZGUWdJZGtlVHpmamxuTDJvQU00dnRX?=
 =?utf-8?B?eVErdnZidGZudXRodmppQnVLV0s3dE1HVUUvRHlZNy9PWEs4a2NEaTFFemFT?=
 =?utf-8?B?TDgrUHVCejhQTUxwRmtXcGhtSmRWQjI4TmxsRUdxQmxGV1h3eEp6UFEzU2sv?=
 =?utf-8?B?L3NWWHl0K2pYNFAwTUhzVFJNclNqQm5EVXBDWmsxSTRtb3NkOSs2WWJWYTlj?=
 =?utf-8?B?VDlXOHFBMDh1M0M0WEtNdjg4TXBsQnJ6bVQ0ZUkyU0RxOFp4c1hnNVlQUkJY?=
 =?utf-8?B?eWZFTmozUkhpdHRKNDY0b1hNK1k5UzdSL0h2YWxyZXBneU5DY01uNTFKMFk0?=
 =?utf-8?B?ajZHSitxTUQxckgrNnUvemlHakVjTUI3MXdteFBWZWpsVVB4Zmw3TXkxS0pB?=
 =?utf-8?B?bVd0RjJOOFg4d2Z5UTRJSXBPcmdkZ2tNMzNrcng4eDFuWTlBb3phRzNJZ1ZL?=
 =?utf-8?B?YldqSm1MMzRhcnpDTUtLaHR2Y2hXVjJtZndWR0g5STc5N2dzQWh3K0xkM1Rj?=
 =?utf-8?B?U0MyUjE1U2x2bkZyL1NNaWt3bWU5MHB3RUQ2dExoR0FLMWpPbXRJVWdJMlMr?=
 =?utf-8?B?SXhPeFZJTnl5WVN3RWNLNHhiQ1VZR1ZNeTcrcUV1RWg5cFdla1NQMjBGT3Vz?=
 =?utf-8?B?SExrQThWQ3ZQd2RpZHBZRUprSlhhbHdDRVNlek12Z1ZRbWc0OXpXR3BwQ3FU?=
 =?utf-8?B?UzhTcFM0UkJ6M2hEOURlR0ZXbzlDWWY1V0JKOVkvTGtiTDFHL2hqbkRRdjNU?=
 =?utf-8?B?T3RxV1haQXU2Zm5meGNhMzhtTlpoMlVrdS9XbjZGSStyYVZycUFISHZrSmxw?=
 =?utf-8?B?dHJQaVlCTERBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TC90UllUN0NEeW84b1Y5T0szWFNXZFFFWlVOd2Vac3Yxb3h3TFZJL2Jkbzgy?=
 =?utf-8?B?RjdaNlBiOVlYV3FET2dIOWZ0SG4zcU94Q2JNNGRxcVZKd3JHbDdjL0E3QjZ5?=
 =?utf-8?B?RWNuSXdyc0FmanUrZFRtcEk1eUJaMDZJTUJ2dzJIUHQ5ek11cjE1SWlKUmhH?=
 =?utf-8?B?NXpBdHcxUFhNZVpwZXREaFM4ODd5eVNWV0NvK1dXVzJHTXUvbUlXbVdLR1NU?=
 =?utf-8?B?WXVFa3hNY1IwS3l5amEvUFZING1GdzlrUHlsbzByV2J5OHo2ZUJiM1prTHdM?=
 =?utf-8?B?ZFo1UHVQT3ZQNWZBVUNVdHR2MlFPS2pLR1M4OGFXd3J3UHJGeE8xV2xTWjNl?=
 =?utf-8?B?a09xa3hKajNHZDhvaTVzMDUwdy8wTTNpQ2U0cXM1WlpReUMzT0lZY3BvVHN5?=
 =?utf-8?B?ZFhJeEF2Wk1qYnkyK2ZZSVJZbm9ITGNobHpjOGlEOGcrOGFmY3BKOElWS0Mv?=
 =?utf-8?B?RWVjM0NUcGNPUHhPcG16V280ZHhicmhvQlRJU2NLN05xZk0xWTdVWFBGTVJC?=
 =?utf-8?B?RHVsZkc5U3BuSi9HS3pPOUV2eHpqQUlEZlNNMUlLRlFOaXQ4cWFORC9TS3JU?=
 =?utf-8?B?Q01BUGhydUYvTFVKZi9DRWtSN0JTeXhxQ2wxMEs4NUN6MUYxbTRwZzZNR29k?=
 =?utf-8?B?enNOVCtMbkRkM1VCYVFCQU5tVDdyTC9VQzBidWw1RHAxRWMxelVNSEpOVjln?=
 =?utf-8?B?bHFsSGxSTUV5ejloOHJrRVlWRGlWaC9vSWJBbUJmTGd4R2g4aHdNZ1VQNkhR?=
 =?utf-8?B?TG5idi9rMnRsZU5zQXVNY0t3YzRzUTlCZkJEbDhJSVh2RFZjY0FORkRyckMr?=
 =?utf-8?B?VjV4NUFiVHZoQ0VzUmMrUmJ1ekwvazdMN1hWNThjNTIwc1FaL3MwUkFzN1lD?=
 =?utf-8?B?L1RoTDRDRWJkWVdBL1dJS1VGZExaK21tN1kvK2JFWmN6OFpvY1d4bk9jdVo2?=
 =?utf-8?B?SUp5d0VKYW9uMlJIVFdCOFJZUVhQTHBhUzdOcXp0ZHB5UTJZK0NSVFUyRys4?=
 =?utf-8?B?eU5hbzB3WHkxL2dKTlpMM2JIakdvcGlYUWI5Y2o5bG8wdVJLMkkycHlZMXVp?=
 =?utf-8?B?Q1lUQ2Z4bkxPVGZBVDBENzYxdGJBaWhLaVhmQ0YwSHZIQ01mN3U3bEE0K081?=
 =?utf-8?B?QUNmVlU4ekpWbXhaeTU0M2J4T3k0NHNPSXB5L29xRXdHRFFOVnZEeTd4aFRh?=
 =?utf-8?B?bjBVYmNUVHZtRmtSVGNBbko1ZFo0d3lyNjMrcXRxSis0L1ZGcFFNNWlpSFVK?=
 =?utf-8?B?ZmN3TEdrUnhTOXVURlp1UnNUL1FtSTd5UTMwZkpmQk1IL1ptVzB5NjJYTlp3?=
 =?utf-8?B?TU9idWdzc3cxd2FQZ2M4UFhlQWhrMjhvc1h6dm5TbThETkg2bW0rdVBXK3dQ?=
 =?utf-8?B?UXRNQUxFeDlhY241dzZhbFloN2xRQ2Y4YXJ6YVpEYW05OUxZQmgxNXFvQkEw?=
 =?utf-8?B?RDlGZmhoRGkwNU1uNVJFVW84QXc4eXlKbCsySEg2eVppQTFjalFkdk5vem9H?=
 =?utf-8?B?K3IrdWJiY2RINTNRN2tBRE9FNUgyUElOd2J3WFcrNHVuajVUdC9jSzVHMmlF?=
 =?utf-8?B?bHgvSC8yYUhHVC94RlRDc3c4NTdJd2QwWGNNR1I1NmpaSTNlY0dkR2tiRkNP?=
 =?utf-8?B?WjNWTmRuQXdOTUtrZGhsOEhUekl5aGVoNUpJUmovNThGYjBscG9zcVV2NDJq?=
 =?utf-8?B?WEJIYkhkRlJSYktYbUc4L2dDY3Y0T1RWd2IzYVVHT25QVVllc3NObyttWUM0?=
 =?utf-8?B?MkNJcVdSbFhqZk9tR0xKcCs0UFBxaXhNMzdWQU1KQmV6dXBXdmRlVTF4VTZP?=
 =?utf-8?B?WUsvUDIyOWl0MXNUZVVMOCtFclBhbldwNFJjRmZJYXFuYzEwZm1XUzJoa1Ew?=
 =?utf-8?B?WTZLTFgxcmJWYm9ySHJMK25SVnl6TkNoUjhpVnhwVyt0MW11REZTaUVlanA1?=
 =?utf-8?B?K2VNM2U2MXl2UkFUWFNvVis4c1pDVndVeWRDbm9ROGJ3MSsxQXRIZjZLU2lp?=
 =?utf-8?B?ZktkK1J6QllMaTFMcXJCMHZmOEI5WGRldE1SK2RRQWZsZW1qZXo4N2FhNXZs?=
 =?utf-8?B?MWFWTHBVNU0rU0k0OWF4TURmeHRNNVp4S3VZTzU2TGw1azFVU3VWTFQ2c2x3?=
 =?utf-8?B?ci9aQkVsSjRiRVQyTkx3blYvUXYvODVDb1d0anRQN3l0UzVDZW4wRWEwSWZ1?=
 =?utf-8?B?V1k2UFlxQjR4SVE4eFRYV1NZdW5za2c2VzdkRzIrZ0ttM3ZoUHBOK09rc2Rj?=
 =?utf-8?B?bkJhYS9pTWdhenpIZm9HYUZHSlJ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e19da22-0470-4a7e-2eb9-08ddf745efc5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 06:29:50.6834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4/LXBw9wZx7FMawmzvnouey5LvPquJuDTVNj1uxQ8RjbMs/ZNZZS2n2SQ/FTwABKa5ppmvHEB3mqk8cJec3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
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

On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> CSUS clock which is camera MCLK, is also a clock gate for vi_sensor so
> lets model it by creating CSUS grate with vi_sensor as a parent.

s/grate/gate/; "vi_sensor's" in commit message.

The commit message is a bit difficult to understand (to me at least), perha=
ps explain it in terms of the clock signal flow, e.g. "The CSUS clock is a =
clock gate for the output clock signal primarily sourced from the VI_SENSOR=
 clock. This clock signal is used as an input MCLK clock for cameras."

For Tegra30/114, I think this is correct. For Tegra20, I noticed that for t=
he two other output clocks -- cdev1 and cdev2 -- we already are modelling t=
he source clock muxing in the clock framework through clocks called cdev1_m=
ux and cdev2_mux which are registered as read-only mux clocks in pinctrl-te=
gra20.c. So I think the same should be done for csus -- add a csus_mux cloc=
k in pinctrl-tegra20.c, and make it csus's parent. For Tegra30 and later ch=
ips, these output clocks seem to have only one source clock.

Thanks,
Mikko

>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c | 7 ++++++-
>  drivers/clk/tegra/clk-tegra20.c  | 7 ++++++-
>  drivers/clk/tegra/clk-tegra30.c  | 7 ++++++-
>  3 files changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-teg=
ra114.c
> index 186b0b81c1ec..00282b0d3763 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] =
__initdata =3D {
>  	[tegra_clk_tsec] =3D { .dt_id =3D TEGRA114_CLK_TSEC, .present =3D true =
},
>  	[tegra_clk_xusb_host] =3D { .dt_id =3D TEGRA114_CLK_XUSB_HOST, .present=
 =3D true },
>  	[tegra_clk_msenc] =3D { .dt_id =3D TEGRA114_CLK_MSENC, .present =3D tru=
e },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA114_CLK_CSUS, .present =3D true =
},
>  	[tegra_clk_mselect] =3D { .dt_id =3D TEGRA114_CLK_MSELECT, .present =3D=
 true },
>  	[tegra_clk_tsensor] =3D { .dt_id =3D TEGRA114_CLK_TSENSOR, .present =3D=
 true },
>  	[tegra_clk_i2s3] =3D { .dt_id =3D TEGRA114_CLK_I2S3, .present =3D true =
},
> @@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void _=
_iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA114_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA114_CLK_CSUS] =3D clk;
> +
>  	/* emc mux */
>  	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
>  			       ARRAY_SIZE(mux_pllmcp_clkm),
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index 2c58ce25af75..bf9a9f8ddf62 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA20_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA20_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA20_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA20_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA20_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA20_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA20_CLK_BSEV, .present =3D true }=
,
> @@ -807,6 +806,12 @@ static void __init tegra20_periph_clk_init(void)
>  	clk_register_clkdev(clk, NULL, "dsi");
>  	clks[TEGRA20_CLK_DSI] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA20_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA20_CLK_CSUS] =3D clk;
> +
>  	/* pex */
>  	clk =3D tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, =
70,
>  				    periph_clk_enb_refcnt);
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 82a8cb9545eb..ca367184e185 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA30_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA30_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA30_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA30_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA30_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA30_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA30_CLK_BSEV, .present =3D true }=
,
> @@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
>  				    0, 48, periph_clk_enb_refcnt);
>  	clks[TEGRA30_CLK_DSIA] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA30_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA30_CLK_CSUS] =3D clk;
> +
>  	/* pcie */
>  	clk =3D tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
>  				    70, periph_clk_enb_refcnt);
>=20




