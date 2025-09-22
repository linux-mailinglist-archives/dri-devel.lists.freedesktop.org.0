Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A6FB8EEF2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2820510E3A5;
	Mon, 22 Sep 2025 04:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AiDdkZVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA7610E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:29:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7RswrIVQpgKBF2tdNbhe/APjAl8morpwI7UXRWTAY/TYaVMhSns2ICNHnrSq/shXA9J+QwKpnkZGEzSMcKNv9N2kZvSHc8eJnK0B09WqusSNblJEYNXGsF/Ba6MOz+L4SARYYku+R6OfBLZ9lc34LJ0BPNKl7Tpf5Lu86r5JMazi7vxug5nn27eFoo+sQOS4kGajiNbMELcMbNejfKAZG0waEhxUbaBNfsUj4jdf/o+CAIweDnM9jRJAgR13ozSvGfAalfAzpFyJvDFMPwBMUYVVptpzEFRJ7JRtHy42GEmANfqazQ3kJ42ypAoXqCoA1Oa5j3ot5bEzLIGkZYUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ikekz+wm+0L0ESli/NJXiW5O1M/SABmUaQtS2aDR7+4=;
 b=wZZ0mZbsiHUVjHJgrdc/sNOPvKshb42SxsYV5kmJ8+V/74pX5y35GE7766aFkrS7ImSZ99kp+UXvsPLlqEOGBlKz5rdl/pE68hp6WNvFqjIzdzDcB/ODHEr0029F9F9W/zVdqEz+WJqdOG6ch0fupBvPBEzcb6BqnqgCNKEFo6pnNUOqlIAcDivw7o3AYETgfyyrrVhGIm5IbUURhhOQSytaXGbMBmME+7AQQLJDRJyd7eOeaDEpjiEFXvAwEkia+6thD5Pnp2Yf3B/LWY3KXrBf97jbC/oyIjIn4Bm39bJvuxygfIRnhJt44d+IOIte9C8DhvvkgZuqm09o6gnjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ikekz+wm+0L0ESli/NJXiW5O1M/SABmUaQtS2aDR7+4=;
 b=AiDdkZVMaSQAQgJJXH4hboZmIjtkaqupkVLXYeIuN0vNKQ6zVfR4OnigizqYPAzckivoEKvB591Vs03Bs77YexVyfrQArAa69CJyG18gxyVZp4Ft3weucBucIK6f96XpH42Ki3C8pfxZ2RfjntrLOuMOnCCsb1T9Usdpiq7KQn6D9EuHCI/H+KaeLwV/YXqHoXvdmZiVS6+aBO2k+kS3pUesjAR25lgH8maCvJE+jc3FIlelQ6NUm9pKzJY/nTNH5UYOJPRzxfFfnZxV2wZsgNHAgejCwnk7Hxu0SeiZUy+NUdj7gr4TJSZUgrN3TBsnIVB/LCQzH4oNy8Z0fAo2Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 04:29:28 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 04:29:28 +0000
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
Subject: Re: [PATCH v2 15/23] staging: media: tegra-video: tegra20: add
 support for second output of VI
Date: Mon, 22 Sep 2025 13:29:24 +0900
Message-ID: <5174845.cEBGB3zze1@senjougahara>
In-Reply-To: <20250906135345.241229-16-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-16-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::10) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f4f3182-bcb6-4e39-94da-08ddf9909e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVFWMStaNkdlbEZ4YzhBQjFTNW9kc3B4eVV5VDk5MjllWWhITURqTnU4VXlp?=
 =?utf-8?B?eFo5UXh3UnJqbm9aaVdyVjR5RmlGUWFYVnNnYnFCS2w4dE5TZmtCY3pNRlJH?=
 =?utf-8?B?YURRYml0cDExUjdLdFVlWUlEYXJVUFpBSmtzWTRtSVgzU2loODJxYlQ0R2Yw?=
 =?utf-8?B?bHdZQVd3cDdoOTlSU2NLOC9ldkROaXFoUzJhSkFiRi81ek1lWWJlRlRiblQw?=
 =?utf-8?B?c3I0c0hPMHJobGNDTFZxNjRLdkZ4R3NUZ3QwaWoxTmtRaUpWQUhUbkZldUxj?=
 =?utf-8?B?TlBMcnV3N0RhUXA0TEVSeVNHbXNsdytZWHJ4TGt1UExUN04yNzErcjc1ZEsw?=
 =?utf-8?B?ZzVraVRPc2tsL2YvWVBrZXdobDMxcmtTZWNST1dvZmw2RVgxNnFSM2tsQW05?=
 =?utf-8?B?RGRBZURtMW9TNjRCZkx4YndGUTI4SHlBdVVCOGpNUEpPTmQ1QTh0a2JQamRm?=
 =?utf-8?B?Z2lnejMrNjkzd2FJYWtEeW4xNGhoeEJHOHY2TnNzQ1JUSXorQmp2NTcvQ3A0?=
 =?utf-8?B?RzE4OEYrNWxTelpucjN0NXVyeStYeUFCOExJRTBINmJ5TjdGUUZCc29NRGVM?=
 =?utf-8?B?NVkwOG5yaXF6OXN3aHBRSGZneWMzQS9malB1dzdRLzNMOUNxcDkzQUJGdXJ3?=
 =?utf-8?B?WkdTTWVyWC9ESXdWRFoxTXF2R0NrOS9XQ2o0ZTZNTG9oRkNmMFZGYXJzbUZt?=
 =?utf-8?B?N3hNU2h3b2RhNU1ZejBQUUFTc21jWHJTSlIxS083SU1jY1ZNNHZsaGFhY240?=
 =?utf-8?B?VkRnUGFqR2xFV2ZQeDZIN0xDTUhNaGRCY0ZhZ0ZmUFVuby9YZ3UrMmlIWGVv?=
 =?utf-8?B?WkhnblZQRWVuU2drVGNZaTBIMWhKU0VqNUU5YUV4bEJ3SjZ4QWxSZ1ZwRVFE?=
 =?utf-8?B?SjlRcDIxQ21oVW1zbnY0a3luK1dNeU4xcldjN3Q2d0lnUXgvSFdySytIN0hE?=
 =?utf-8?B?SFFjMjI0OVZxQkVOcm56VHdEbjNvakRXU3hZSUcwUFJtU1dVK2cwK3NReUZs?=
 =?utf-8?B?QzJQczR2MmRnbUdjNTRyODB2ekF5V2ZuY0lUUVdPM0E0UzVPakllc28vbnVR?=
 =?utf-8?B?M202Tmp5RHF6cFB6bmVvV0k2aDMyNXFxSmd2QkRzVDlPK0lKRVFpd0t4bTht?=
 =?utf-8?B?cTl4SlJFcVZaVmFuYzdoODE3aW8wd2plUG9MZDRmWkNUN3ExZTVnNGExMXlV?=
 =?utf-8?B?ZjNRdHRYelhRL3RJMXlYVlZTYzY2OWlUTEtDTHRXbk0yMXlPYmhkSXlFVTdC?=
 =?utf-8?B?bUVHTHBURWVqSC80cGNSMjkrL3U0RVEvekZFcHlTekZaY0lhWFJVTjQzMER6?=
 =?utf-8?B?dko3T3JFT1g5YTUrNE1JbkNmcW1zWWJMTi9ycXI4WlFTK2ZSZm1vMFdhaDcw?=
 =?utf-8?B?UjcvU25xVmN0VFNRK2ZTWFYzQjJ5S2cwYnF3NjlTWlFyVWRDQ3oxNE5UN1kv?=
 =?utf-8?B?MUpZb2ZUSm9vZmVxWmdyVzlyYzliYlhiOFR0NWRjajNkMlVlRGE5c1g3SlU5?=
 =?utf-8?B?SWJjdE94eGVyUDZTZGtJMjlOdTlPa0RNd3JrV1lHWWtjVHUxc1ZScm9DMzZR?=
 =?utf-8?B?eThhNFJRT0JZeUNJR2FJQ21CQUc1c1lDUW1NNU9tM0Y3VExvUk9ETXNOdkNP?=
 =?utf-8?B?b09jaW41czVPUGtSckUxUFlPLytISEc3OXVTbE96NGdGMTFJT2JobDNUeERU?=
 =?utf-8?B?UE1PWEduNXJjVXNLMlBOQk5INURmMStvNWxRajFEa1llUHIwOU00eUVNZHVR?=
 =?utf-8?B?UmtTWVY5ZTFCQ0pWOGlXVXlhOHMwSHRBU1lNcFhFM1BmWVUySDNTYVJiajA2?=
 =?utf-8?B?bUpGS0VCdGR6SlpzWGtiQktFdVJRV3pwUFpzQXJkUCt5QmhJM1RzeVV6NHZ6?=
 =?utf-8?B?cExoU3pKd2RVYWRQWFZKTldUWjlPUzFMUzNxbDhkZkVMWUo5QU9xbmhQMTll?=
 =?utf-8?B?NmFpQmh0OXROUjZuWTF5MEpqV3JSc2VoWFp4SW51N2Fvb2tlR2w4VGVIM2Ri?=
 =?utf-8?B?T1YrRkdPcHh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXNNaW53R0tibnFSNkN6VHRLc1FrQnRHbVk5SXBGRXphSzNJeHlGeXNTVnJP?=
 =?utf-8?B?S2M3S3VwSTRON3Q5N2s1MEFoa0dMQ1hmS2djYlByVWZsL3BpQVZNRUVrNkRs?=
 =?utf-8?B?VSt2U2VvTDRNUkJCU0dqblpHcnVqRzUrZThscUpicHdWOWFRZGYrSmFpWHE5?=
 =?utf-8?B?MnRtL0RkcG9BQ0hLdHpNck40UzE2T1NZNlZ0UmVGOHRPWFVySHV3ZDREZkQv?=
 =?utf-8?B?UXZQVkhWQWs2cUJmemRlcG1XZmc1dHBpR0UxQU90UEVUZmFSbGV4TE5LWkR1?=
 =?utf-8?B?UThEQjFlVFNHMEUvb1BpdGt5THNrdDlXVDZvNC8wOGQvL2d4dVFlY0h0OTMv?=
 =?utf-8?B?aDV5L0NIalNjKzlhNmhsSnlUc2ZabkJUbTA2L2ZKelhYOUhYb0gzSXlzTHh0?=
 =?utf-8?B?N1J1UG1taXpsSzNyRWFxaDZFU0I1cjVrcHByNHZyeHh0SXRydW91TURtTita?=
 =?utf-8?B?S0Y4Z1RXY3RHU2Z5YnJrYTEyM1ZiQU1ZcVhzeGwrOWV2SWhVR0ttc2NQNGIr?=
 =?utf-8?B?Ulh3eDFHNmNZUmxqZ05JRTd2QmhwaGhNSi92S2M2akZsSzg1bFZkZTBobVhZ?=
 =?utf-8?B?RVVoN1BuZ2RHTWxBOGFoWTZ2cldLS2ZWT2UxRy9MM0QyVkI0R3pBQWl1aWNX?=
 =?utf-8?B?Y1NsTVZWSFY4UE5JYzhGdmtqOFNISHRyZlRreHNSVzVLQmgzSXJvdEMxcE1z?=
 =?utf-8?B?VDNrbzJYOThZaVE4WUxWcElZUDlRdlJ1VloxbE9GMHNRRm5zMG1mazdKUDds?=
 =?utf-8?B?dzlPWEdDYlB5dWhYeWVKWFNhNDJYc0tXL3JFWUUvMnpoYm5wVTRoOFQ5VXhn?=
 =?utf-8?B?aURtVTVXSCt1UElvN1grTGN0cGNlcXVPaHBRNlBPZG1pbzhEcDJaNTdSZXVD?=
 =?utf-8?B?VTI4dWFBT2JuSC9Ea3M3VDZDcHZWZExiWitVZ295dFVMUGZGL0RYS3JIaWgw?=
 =?utf-8?B?V1FNRXp0N0YxNEdQL283K1FyaVZXcmdzMUV4ejNQRC9Felphdkgvd2Z0Y2FD?=
 =?utf-8?B?KzBWTkNYREp2QUJzbDNaWXo3TDdQbi9wQmdSVVVVZXNnZFpPTTlsUUFTeURU?=
 =?utf-8?B?Y1FaK3NpSlpWUDZSQnQrSGphRUFvSnVORlV0MndmeFRHK0lqZlFqMkpRTjNM?=
 =?utf-8?B?ZE8zcm82K0U5NjFxbnFqSHJKRlJqcm1hZ04vMHZ4OWZSUkpCT3dQNzNZWnEx?=
 =?utf-8?B?aTFkZk5UTGZTMGc1ZktTQStzbEN4SFhTMDk5YXM5ZHU0VFI4YlJrU1RBS2ox?=
 =?utf-8?B?cG5xaW5nS2RGczJHVUFJTlF3TEpBVFIzRmpyTUxiYVJqdUNNQlF0Y2UvOFR0?=
 =?utf-8?B?ckJSMmJla3E4ZC82RjV2ZGVrbUdOR1RmUG1tKzFLOU5pajVqakdCd09QU21H?=
 =?utf-8?B?STF0WU8xbGpyTzdQeUZWdVF2Zk4wRWhRSitDdnBVRUFiRU54NlFiOVNnN3J2?=
 =?utf-8?B?WEhBSWE0TzQwb2R2MGszZmh1REU0M2g0NG5JMTR4MDlrMjJFVjlGUXNaYVMz?=
 =?utf-8?B?ZXFBZ05YcEJRS01oektwU3hJMW9GV3NwWlN6RXV4K01wbnlnSzlsUmxmWUR4?=
 =?utf-8?B?R3N2UDBIeU51SHgvbC9FZ2FnTzFIVGVsd0tMbHBMM2F2RWZUSDE3S3pXM1pK?=
 =?utf-8?B?eFcvVXBxdDJGaThqUW1xZUdTNGtWUVdxWUM5MmdscUYzSXJ4WDZ1cDB1V1Z3?=
 =?utf-8?B?NE8rblpwMFRHak1XdHZQYXBUajZPeWNGdDBMenAzcEo3YkN3L1RTUWxPak5k?=
 =?utf-8?B?OXBzcGlXeTFXTWxMOEhKNHpYT1dpSmFFTzFNcHRmQW1ZZVpEWE5RditDUVBq?=
 =?utf-8?B?dkJ6bVpoOGduVDJDb0EzSThxa21PYkZzdXY2eHBwSEMzdGZQayt0N3NPNDFx?=
 =?utf-8?B?ZkZMNWdpeUp6NjBXYzBqdGl2YkZ0TndGTHE2NkdQWDFod0cxOHlwR2drK2or?=
 =?utf-8?B?RnJrMmViZXp6Z3BVdnhMN1dMc2tUUkoxQTJtVzhsY1BqbDhMRnNUbXNQb1pZ?=
 =?utf-8?B?ZVlaRFdhaDBOSFNIdjNpVHowSHRTWG1XUzhwYTYvVmwxK25XQW52eXQ5dmE3?=
 =?utf-8?B?dVNtMDd3bmY3cktNMHIxeElTMlpCaVA0VmJiNFJJVDIwZU1sUnk3R3BPZ3BF?=
 =?utf-8?B?Y25DUUZQejRid2dZdDdtUUNFM3drdTc3WTNoSStrNW9VUFZxYUMzYmY4R0w0?=
 =?utf-8?B?Vzk2Zzh5SXRhY3FTVEtndGlxNzhlOG1vbXp0VUNFeTBJQUJtSUFXeTNGSHkw?=
 =?utf-8?B?M3ErVTRQc0NXNEg3bTA2bFhrdjFRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f4f3182-bcb6-4e39-94da-08ddf9909e0f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:29:28.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goU++2WoSa3J8r5xurNy9ZrBXcgWdjpdcMKfSTTZVkiQKjg4+QbWGV1XDnLqhyndcPY2A89OCHcr76cRumifZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126
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
> VI in Tegra20/Tegra30 has 2 VI outputs with different set of supported
> formats. Convert output registers to macros for simpler work with both
> outputs since apart formats their layout matches.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 82 ++++++++++++---------
>  1 file changed, 46 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 3dc26f5552eb..6e0b3b728623 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -29,13 +29,19 @@
>  #define TEGRA20_MIN_HEIGHT	32U
>  #define TEGRA20_MAX_HEIGHT	8190U
> =20
> +/* Tegra20/Tegra30 has 2 outputs in VI */
> +enum tegra_vi_out {
> +	TEGRA_VI_OUT_1 =3D 0,
> +	TEGRA_VI_OUT_2 =3D 1,
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * Registers
>   */
> =20
> -#define TEGRA_VI_CONT_SYNCPT_OUT_1			0x0060
> -#define       VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT	BIT(8)
> -#define       VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT	0
> +#define TEGRA_VI_CONT_SYNCPT_OUT(n)			(0x0060 + (n) * 4)
> +#define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
> +#define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
> @@ -47,6 +53,7 @@
>  #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 << VI_INPUT_YUV_INPUT_F=
ORMAT_SFT)
>  #define       VI_INPUT_INPUT_FORMAT_SFT			2  /* bits [5:2] */
>  #define       VI_INPUT_INPUT_FORMAT_YUV422		(0 << VI_INPUT_INPUT_FORMAT_=
SFT)
> +#define       VI_INPUT_INPUT_FORMAT_BAYER		(2 << VI_INPUT_INPUT_FORMAT_S=
FT)
>  #define       VI_INPUT_VIP_INPUT_ENABLE			BIT(1)
> =20
>  #define TEGRA_VI_VI_CORE_CONTROL			0x008c
> @@ -67,7 +74,7 @@
>  #define       VI_VI_CORE_CONTROL_OUTPUT_TO_EPP_SFT	2
>  #define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_SFT	0
> =20
> -#define TEGRA_VI_VI_FIRST_OUTPUT_CONTROL		0x0090
> +#define TEGRA_VI_VI_OUTPUT_CONTROL(n)			(0x0090 + (n) * 4)
>  #define       VI_OUTPUT_FORMAT_EXT			BIT(22)
>  #define       VI_OUTPUT_V_DIRECTION			BIT(20)
>  #define       VI_OUTPUT_H_DIRECTION			BIT(19)
> @@ -81,6 +88,7 @@
>  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)

I would perhaps add a note here that values below are only supported by OUT=
_2.

> +#define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
>  #define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/line, must=
 be even */
> @@ -90,26 +98,26 @@
>  #define       VI_VIP_V_ACTIVE_PERIOD_SFT		16 /* active lines */
>  #define       VI_VIP_V_ACTIVE_START_SFT			0
> =20
> -#define TEGRA_VI_VB0_START_ADDRESS_FIRST		0x00c4
> -#define TEGRA_VI_VB0_BASE_ADDRESS_FIRST			0x00c8
> +#define TEGRA_VI_VB0_START_ADDRESS(n)			(0x00c4 + (n) * 44)
> +#define TEGRA_VI_VB0_BASE_ADDRESS(n)			(0x00c8 + (n) * 44)
>  #define TEGRA_VI_VB0_START_ADDRESS_U			0x00cc
>  #define TEGRA_VI_VB0_BASE_ADDRESS_U			0x00d0
>  #define TEGRA_VI_VB0_START_ADDRESS_V			0x00d4
>  #define TEGRA_VI_VB0_BASE_ADDRESS_V			0x00d8
> =20
> -#define TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE		0x00e0
> -#define       VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT		16
> -#define       VI_FIRST_OUTPUT_FRAME_WIDTH_SFT		0
> +#define TEGRA_VI_OUTPUT_FRAME_SIZE(n)			(0x00e0 + (n) * 24)
> +#define       VI_OUTPUT_FRAME_HEIGHT_SFT		16
> +#define       VI_OUTPUT_FRAME_WIDTH_SFT			0
> =20
> -#define TEGRA_VI_VB0_COUNT_FIRST			0x00e4
> +#define TEGRA_VI_VB0_COUNT(n)				(0x00e4 + (n) * 24)
> =20
> -#define TEGRA_VI_VB0_SIZE_FIRST				0x00e8
> -#define       VI_VB0_SIZE_FIRST_V_SFT			16
> -#define       VI_VB0_SIZE_FIRST_H_SFT			0
> +#define TEGRA_VI_VB0_SIZE(n)				(0x00e8 + (n) * 24)
> +#define       VI_VB0_SIZE_V_SFT				16
> +#define       VI_VB0_SIZE_H_SFT				0
> =20
> -#define TEGRA_VI_VB0_BUFFER_STRIDE_FIRST		0x00ec
> -#define       VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT	30
> -#define       VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT	0
> +#define TEGRA_VI_VB0_BUFFER_STRIDE(n)			(0x00ec + (n) * 24)
> +#define       VI_VB0_BUFFER_STRIDE_CHROMA_SFT		30
> +#define       VI_VB0_BUFFER_STRIDE_LUMA_SFT		0
> =20
>  #define TEGRA_VI_H_LPF_CONTROL				0x0108
>  #define       VI_H_LPF_CONTROL_CHROMA_SFT		16
> @@ -137,7 +145,7 @@
>  #define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
>  #define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
> =20
> -#define TEGRA_VI_VI_ENABLE				0x01a4
> +#define TEGRA_VI_VI_ENABLE(n)				(0x01a4 + (n) * 4)
>  #define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
>  #define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
> =20
> @@ -367,8 +375,8 @@ static void tegra20_channel_vi_buffer_setup(struct te=
gra_vi_channel *chan,
>  	case V4L2_PIX_FMT_VYUY:
>  	case V4L2_PIX_FMT_YUYV:
>  	case V4L2_PIX_FMT_YVYU:
> -		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST,  base);
> -		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST, base + chan->=
start_offset);
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  bas=
e);
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), bas=
e + chan->start_offset);
>  		break;
>  	}
>  }
> @@ -456,6 +464,7 @@ static void tegra20_camera_capture_setup(struct tegra=
_vi_channel *chan)
>  	int stride_l =3D chan->format.bytesperline;
>  	int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
>  			output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
>  	int main_output_format;
>  	int yuv_output_format;
> =20
> @@ -473,33 +482,33 @@ static void tegra20_camera_capture_setup(struct teg=
ra_vi_channel *chan)
>  	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
>  	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_VI_FIRST_OUTPUT_CONTROL,
> +	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
>  			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
>  			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
>  			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
>  			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
> -	tegra20_vi_write(chan, TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE,
> -			 height << VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT |
> -			 width  << VI_FIRST_OUTPUT_FRAME_WIDTH_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> +			 height << VI_OUTPUT_FRAME_HEIGHT_SFT |
> +			 width  << VI_OUTPUT_FRAME_WIDTH_SFT);
> =20
>  	/* First output memory enabled */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
> +	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
> =20
>  	/* Set the number of frames in the buffer */
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT_FIRST, 1);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT(output_channel), 1);
> =20
>  	/* Set up buffer frame size */
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE_FIRST,
> -			 height << VI_VB0_SIZE_FIRST_V_SFT |
> -			 width  << VI_VB0_SIZE_FIRST_H_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE(output_channel),
> +			 height << VI_VB0_SIZE_V_SFT |
> +			 width  << VI_VB0_SIZE_H_SFT);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE_FIRST,
> -			 stride_l << VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT |
> -			 stride_c << VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE(output_channel),
> +			 stride_l << VI_VB0_BUFFER_STRIDE_LUMA_SFT |
> +			 stride_c << VI_VB0_BUFFER_STRIDE_CHROMA_SFT);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
> +	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
>  }
> =20
>  static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
> @@ -588,7 +597,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.nformats =3D ARRAY_SIZE(tegra20_video_formats),
>  	.default_video_format =3D &tegra20_video_formats[0],
>  	.ops =3D &tegra20_vi_ops,
> -	.vi_max_channels =3D 1, /* parallel input (VIP) */
> +	.vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
>  	.vi_max_clk_hz =3D 150000000,
>  	.has_h_v_flip =3D true,
>  };
> @@ -608,6 +617,7 @@ static int tegra20_vip_start_streaming(struct tegra_v=
ip_channel *vip_chan)
>  	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&vip_chan=
->subdev);
>  	int width  =3D vi_chan->format.width;
>  	int height =3D vi_chan->format.height;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> =20
>  	unsigned int main_input_format;
>  	unsigned int yuv_input_format;
> @@ -638,10 +648,10 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
>  			 GENMASK(9, 2) << VI_DATA_INPUT_SFT);
>  	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
> =20
> -	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
> -			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
>  			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> -			 << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
>=20




