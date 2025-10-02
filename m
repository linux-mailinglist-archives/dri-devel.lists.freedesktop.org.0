Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8E4BB29A1
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 08:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A54410E78E;
	Thu,  2 Oct 2025 06:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ei64G5aB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8098B10E78E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 06:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW/2t74YtydmUxePSUcY3xcOX/m4iaLgwAltwFgxm1I4iaWTXucdELQtQlboVOCYXCjMIB1Q4YxPhIH/iAaLP2NybBfohcWjWp98QbXzHkHOA2OamJiGRQWVwLAtup5OHTOEsbldQiErpp1dUKlfLCdYp+nh5UriZySXiTZhagXzFWzqg3yCRZ9lGB/W5soZZVpIE+xXWb+lSlD4tEcnaSJim+pGC43zjRYFW1AXN2HWjC79MUvVYBraj/ymdwDECnKJd515ylJBNxz56OIzlA04uaf8ThPUFdSDpEIpii8x97QPFFeC2ZjGI6lqIOcUXTnSgjBcrA5vfELUTKmNfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6THS2KjOBJ2a8qhl7Q2tlPWrhKIhswgVgAJH7UV/udk=;
 b=vTfEzgRU5XitMUSwI1zGtlnz4MM5j6T3mgaG9493DE2O3K8xm8xbfMFrltMVHPNxJxtvakfxAiK2HK3SA5na2TV/ATNPfWEhiWYiNt0HqUtRw4hx8vYi3pRc7rmEEtCya3diqh6svzOxN5979DQcb6ATYulykAV+g3BMwTIdavvPBz35jUkZ8OFHJsGVEKAv3D8TSHt6y9ZRwryKtknUr04fhfAvWFZ66hvc1C9Bb8n52LCbJoQDiA7Jgipi+zgiWaqVReM9OEA90ew9zK+deLnwPfAg7+9a0xUvTsi07WQFRoOFYlbEN9tG9/F+ggRIKaidnwvFldiibRLU7dfjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6THS2KjOBJ2a8qhl7Q2tlPWrhKIhswgVgAJH7UV/udk=;
 b=Ei64G5aBkjK+YYf7+MwpxxfYoXVG+2B1xX+o1R0Ehg3/+fSR5HOpD+Poh2JApjaf94QkZ6PolM2n+3+TbJQqnd93hnMjUfSunfeHjv6zgLLhHwO6RWEq/3gufx9Flp6DPfecdG47mrDXIqeg7+Vuz4f6Yl2fMFr0sLmMXDFqZjg3nsUxDbubWcB2IjuF2aZLp50vrjdXGCpwrDNLYFg8vavjua0m4L1ZPb0xhFF/ngTRlahakFOZIgrE5BEtH4LfAGH0KkvkvfMZqOlypSwxsQpxH8f+OF3UWdhYA6/G2mC3LJdmWDHxCvMuRAJ9ajHLcUDCdMnlTGtyaDEhO+TkRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA1PR12MB9246.namprd12.prod.outlook.com (2603:10b6:806:3ac::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Thu, 2 Oct 2025 06:12:25 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 06:12:24 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Thu, 02 Oct 2025 15:12:20 +0900
Message-ID: <3862885.G96rZvMJ2N@senjougahara>
In-Reply-To: <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <3665995.U7HbjWM52l@senjougahara>
 <CAPVz0n3CrVufs8vbw8XnYuwoZoQ2Xsi3V4HimgT0=4RQySzvaw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA1PR12MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: eac45851-1d62-462f-337b-08de017aa7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk81a0RLT3JkbldtOFBTQnQ0R3kxbk92N255T3phb2o2N2lVUTNnV2RQaXlY?=
 =?utf-8?B?d21VeldjVFZuYW9JVllTeDZDQlhsMyt4c0I1bjVXekxsTGFmeGpPeFd1dFlm?=
 =?utf-8?B?OWZEeWQ2eTBTR2hEYm85aGhkVUZwUUN0WHBsb01VdU10MCsxRXcybHVpUHRW?=
 =?utf-8?B?MXYvcWJ5ZzNWQUp2M0NRa0hvKytEUmdqcjNqWU9ZQVNmc1pUTW9zWEtSWlVu?=
 =?utf-8?B?WVFGZzBBQkhBSTJIQ3NiRklzaGEyK29CSkxXOXdHc0hGNEticUFpVUV3NHNE?=
 =?utf-8?B?T3FUYlU4S2RFTzArMG5ONUVnRXR6YXpRZlpCWWVkdkhUNWlsZ29telNVZnJU?=
 =?utf-8?B?OVhwUnErRGN4VDJ1RDNmVzYxcXN4bU5RNVJkTE9PNU9pUFptZVdzWDRJb201?=
 =?utf-8?B?UlBBVkhnM3RTdWdsVS9WUFh1d3hGOU42ZG5rVUpVdmdCUm5kWU9iMC9lV2lH?=
 =?utf-8?B?d2NzMFZkYkZKY01wWngyb1RpdzVMU1ZHa0ROUjJGQ3c5bWV1cEsvMWZBQW1T?=
 =?utf-8?B?MlVCRVlwYnJDYnUrTWJQWXJGWlBzYzhxeUVjdWhMdlhwVGFNSzZBL3BOZXVT?=
 =?utf-8?B?YXJGYkVVTVpDU3pra0NuS04wWWRvOVYxNmRyRHYzNGRPMWhTWStvT2dOMUor?=
 =?utf-8?B?Z1I1cXRLN3VNUXlTanJrUFkrK25wTzNsRWZRMFZyS3RzdThmYVlZNnVrbUlq?=
 =?utf-8?B?OHpHMFNIenBoR21mMjVwY0dvSGpCaUk3TDNPKy9WZ2tHK1h2TlJqclhHQ0xB?=
 =?utf-8?B?dHJ2bFZhQzRtOEdDejVXQ1ladTYwNmIyTC9rcFNNcE5iSUdiVHQ3bWRNWnh6?=
 =?utf-8?B?K3NyZXkxQTYxWnZMT3UyMTc3RnVZYWlhY3Y0TkJIYVY2R3dHNC9BNG16aFFR?=
 =?utf-8?B?UGVxZGtMTXhjK2dKZHVKd21CY04zYTBmUGRhczhZcGY4T2pVcGplSzd2RnBW?=
 =?utf-8?B?VDd0clFmcFFmbEpkU3ptVUErMWs4ZHczNkpTTVpxVDUyY0w3UGIyQTFUNm9o?=
 =?utf-8?B?VHd3RkN5b09Ocjg3ZDU0d0Rqdm9yV2c5VU1tUUw2TUprV2RKVWNqa3FFbFp3?=
 =?utf-8?B?M1ZKSGU4bklTempQUFFOZko0Mitwd2tKekVkbWhpZEpac1lQVmczKzgyeGZE?=
 =?utf-8?B?Q05PbmVqR0oyWU9Wb0JCbmZtdkRFM2FCU1NNUUs5N2h4NXowZ1ZvY3M5alBq?=
 =?utf-8?B?OGY1MGtuZUV2VGUrMjJDWVY4b3FRYXpYaUVBYnNNMnNYUlUzZktkNUlzQ3I3?=
 =?utf-8?B?K095QStWdHcwc1ZhSWV2L1F3cjVRTCtvZ1llU0N0VGlSUms2cy94eFMzRXFK?=
 =?utf-8?B?NUYvSjRLbmI1bUZlRHUveU5HS3IyeVU5bExCYVRRWS8xMjllRXRRRkRyWFBV?=
 =?utf-8?B?bXc4Y3VlMEZadnZQcWp2NHFzNUxGOFZpMmlySStvcXFSbG9ZUGJtSm1nNWZw?=
 =?utf-8?B?TUJtUC9PMUc3SDJCSHZEcHltaXAxbm1BY0FYTmEzcUpLaGovdVFVNUZSdGs1?=
 =?utf-8?B?MUsxSjVFU3d4R0o0Ykk2WGxPTVdaL1VTc2RleFdjazBzTWRBekZKWjRHMnE2?=
 =?utf-8?B?ZnhhTXh1R1ZTVU83MldLK2JYT3hUa1NiODhVeXRhT0M2RyswY3NDKzBWUDRt?=
 =?utf-8?B?SmlFTkoySUhTaWVWVE82bWllSmRLa0dQTXFYazNwVzdoVGJlRzQ2R0RIV0Q2?=
 =?utf-8?B?M0NXa05OTk1HZ0dmYkNMNTRDWC9vVzZhMnBjL0F3aldvRUVFR3JyOVVDbUZD?=
 =?utf-8?B?aWxZVit6dkJMVkN2VXUrdzFQZkhuVTNkTlBqSFZUVVRDUXFmTWR6NWkvdzdF?=
 =?utf-8?B?OGpXQy9XM2phT2pMQmZYTlRoeHI2RjhWZWFUZVFKM0FYeWZ0bEhNcjJqVWFz?=
 =?utf-8?B?blk4TmF2ODlPWStwTGthVWh0MHRkUm1QVDBQeEVVS1BGcFVSaTByMVJ2bHpy?=
 =?utf-8?Q?tA7rDErModHiMJkPO6zHAY4OVKv1zqcW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M09SUEhGSlNJTWRLS3gzNWJla3g3NUZHTzI3SFFadHI2NndDZ0VNSHhOMmxv?=
 =?utf-8?B?SjlwcStVeWQ5Wm4rY2NVV1VzSjN2c2lSNTNYVjNFRzVrdXhQN0ZRaG5hZWh0?=
 =?utf-8?B?elcyM2d3SGdadjFjZEJuaUUxT1liT290MEF3N25jRndUczR0a3NDdjYvUGhW?=
 =?utf-8?B?cVdPZ25lYTlWNnJra1BvNm1YTFlubGwyU2lQK0tvR294bjVrSVl0OUVRQzAy?=
 =?utf-8?B?UEFzZ3VYZ2ZKNFA2Y0F5elVnSVpjKzEzT1BMQTYrMEJMTzRTcWtmOFJ2OHFx?=
 =?utf-8?B?M0QvVzVxRGRtcFZWc0pibFNjWXdjS0lMZ2ZRNkJ3cjJZQnJjdWtodWNCUHNJ?=
 =?utf-8?B?MzhjZStJNXNNM0tZYXRFTmcxbkFIY3BWVmN2Q3VCQ0FIdENCaWg3ZVFlWjJq?=
 =?utf-8?B?MmIwdjBidEoyVmR0T1ZYMHZhQXc1MGsxQ2pueFFFaTl4N1JJTmZSU0hrYTBH?=
 =?utf-8?B?M296cjQ0c3BXUzNWc2dXbUxkeFVrWHd5VzVQWmNCMzBxWUJ2VHljZUNFRTMw?=
 =?utf-8?B?SVlUNHhCc1RheXR4RnB3WUhsWGhDdVBQRTVjcWhWYndnSjBPanJVVU50MEI0?=
 =?utf-8?B?YXJOd1NUcUJ0S25IQlNtWldhVUVDWHZ3cW16c0JDblNBamlqU1dyZG9MVkVE?=
 =?utf-8?B?US9BOUFmbHNaaTcwZ3liQWRmTC9adzB0VlNjOERPK3lLMCtsOEpUVGE0cmZI?=
 =?utf-8?B?ekRJa2ZaY0x4RVYyTit5UUxrNmt5MGpvMVd0dzlLZFpHenkrd1kxaWpiYmVG?=
 =?utf-8?B?NHZaaEV1SHpUQWE5L3U3WFNUN0tyWTVkQjBaQUU5NjVuOUg4N25lNmNSOUdh?=
 =?utf-8?B?Ukc2OGFOTmV6QnhtRDVQMnAvSmJOUGNIa084VE01MkNFOXpEUGlyN3U3NE9C?=
 =?utf-8?B?c1psNXg0d2l4YWU5VXQ5TVhQT0wxdTBEMThJK0MyaWJ5RHVRSlRkLzVISXhj?=
 =?utf-8?B?ZnZ1VGtJRGZ1ai9qandxWVBodlc1ckY1S1ExelRVNUNiSjYrZGJmdVBBTW9T?=
 =?utf-8?B?dmNITW9NTloweDBDaXlVQVRvb203Y1FjOExoK2Z3aGhzTys5NUJucndHVDFG?=
 =?utf-8?B?ays2bDBORHFiNmxqUFB4SG90MEpDS0NPV0hHOUoxeUowdEJVbkRWYzZOM2FW?=
 =?utf-8?B?dU0yTGVYckM3V1FqSmRGUGRKOStBL09jS1dTL0RyMGZsRjJhamdIRDE1RmVh?=
 =?utf-8?B?eEw2bXozNHVId0k5cy85dmM5MVZoZng0V1JlUlJDajFqc3plbmErNmZ1Wm96?=
 =?utf-8?B?K3d2VDFRT1VZQ1ZpZnptK2pTWkhBWUhHejFmSDJ4cmVFR2pyR1pVRlovbGhG?=
 =?utf-8?B?RVlvU2pnVk04bGlvUHZOZ2xWZWU5ckorUWdvdjQ0UFIwWDFKL1ZxNk50R0Z3?=
 =?utf-8?B?OExGMXhXUU5LS3FNdjQ2Z2U2NGw4b1FsKzh6bkJjRldCM1BuaU5DVGtnVllS?=
 =?utf-8?B?SEl1bW5YU2lhSHBRTFYvRkhsaGxHYVlUYzluOG4yUFVvbTAxdmtla3pFVDI5?=
 =?utf-8?B?TmFGeHNOUTNtaU1CV2hjZ2VkdGpOR2l6MUhLckpjOXhxanQvQ2VkeHo2TkR5?=
 =?utf-8?B?djE5Q1dYbVBzTFZwTExKWGhaVFF6bDRRdW5CNGJJMUNZcTFjK1JuSThFbWlo?=
 =?utf-8?B?VGkzRXY3OUp5MjFYaE5rVWhiaUxVei8wSmJPNWd5RmFDSFF2N09tOG92SmJ5?=
 =?utf-8?B?eGhpc1FoY1ZaN2VYRUUycW9hbmNQc0dtVzVEK0RPOHlRVmo5dkYxUUF0Qk9I?=
 =?utf-8?B?NTQ3bTdmMDZDSUNHUGlZZ3pYUE4xYnhyaUorUjhQdjdoclFXVGgvSjdlVWdV?=
 =?utf-8?B?TWRJNm9WUFp4emlnQkdhT1FXNDI0eEZKVzNPVUVNZ1U1dlVCZnA0VndnMkFr?=
 =?utf-8?B?MERDbXhZbU1yWlJPWDNOeHVPUWRQNms0c2F0UWdoWURqQXc5NWkrSnhXN0ZR?=
 =?utf-8?B?SGRFM09YaGVCRndDUFNlcFg1VE5USk9uZzQ1K2VyRklOZHRCQ2lwRFFubVdB?=
 =?utf-8?B?VW1tNmx4MFJWcFlSMnV3Rk5EeGRzeCsrYmhJVWdWRE9NNkFzN2FEOTg1Mk4y?=
 =?utf-8?B?emRhNkN0SGUyUVN1azNheHVWOXJXWERSWkg4TlR0c3pWSGtPczlrUHd6dS9l?=
 =?utf-8?B?MGRNZzJtU05wSlRrZTI1T2k2M1ZST2RwU29wZVVJN0hxRmc5Z0doZzhRNGJY?=
 =?utf-8?B?dGMxY1phdTJTWkR2Q3U0bGRISkcvb3AxalFhSkd2Z1ltamQwejJNSkdWMUpp?=
 =?utf-8?B?emdvTEIyL0x6WS9zUnJCUmZRZUtBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac45851-1d62-462f-337b-08de017aa7dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 06:12:24.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9MvIvyi/0GzhRDl0Z4X/EunAl2taH4JoufHNx1R2J/yxhwJ06vFc+TYEzf5oqXtwW0tSSAsL3B4RJzxgqu4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9246
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

On Thursday, October 2, 2025 2:41=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 07:=
00 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wednesday, October 1, 2025 4:59=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE=
 10:51 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wrot=
e:
> > > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =
=D0=BE 08:07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > > > >
> > > > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =
=D0=BE 07:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > >
> > > > > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryh=
el wrote:
> > > > > > > > Simplify format align calculations by slightly modifying su=
pported formats
> > > > > > > > structure. Adjusted U and V offset calculations for planar =
formats since
> > > > > > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 =
planes for U
> > > > > > > > and V) so stride is width * 3/2, but offset must be calcula=
ted with plain
> > > > > > > > width since each plain has stride width * 1. This aligns wi=
th downstream
> > > > > > >
> > > > > > > plane
> > > > > > >
> > > > > > > > behavior which uses same approach for offset calculations.
> > > > > > > >
> > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++=
------------
> > > > > > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > > > > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/=
drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v=
4l2_pix_format *pix, unsigned int bpp)
> > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,=
  TEGRA20_MAX_WIDTH);
> > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT=
, TEGRA20_MAX_HEIGHT);
> > > > > > > >
> > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) =
* 2;
> > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2=
 * pix->height;
> > > > > > > > -             break;
> > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * p=
ix->height * 3 / 2;
> > > > > > > > -             break;
> > > > > > > > -     }
> > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, =
8);
> > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /*
> > > > > > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup=
(struct tegra_vi_channel *chan)
> > > > > > > >  {
> > > > > > > >       unsigned int stride =3D chan->format.bytesperline;
> > > > > > > >       unsigned int height =3D chan->format.height;
> > > > > > > > +     unsigned int width =3D chan->format.width;
> > > > > > > >
> > > > > > > >       chan->start_offset =3D 0;
> > > > > > > >
> > > > > > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup=
(struct tegra_vi_channel *chan)
> > > > > > > >
> > > > > > > >       case V4L2_PIX_FMT_YUV420:
> > > > > > > >       case V4L2_PIX_FMT_YVU420:
> > > > > > > > -             chan->addr_offset_u =3D stride * height;
> > > > > > > > -             chan->addr_offset_v =3D chan->addr_offset_u +=
 stride * height / 4;
> > > > > > > > +             chan->addr_offset_u =3D width * height;
> > > > > > > > +             chan->addr_offset_v =3D chan->addr_offset_u +=
 width * height / 4;
> > > > > > > >
> > > > > > > >               /* For YVU420, we swap the locations of the U=
 and V planes. */
> > > > > > > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_=
FMT_YVU420)
> > > > > > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_set=
up(struct tegra_vi_channel *chan)
> > > > > > > >               chan->start_offset_v =3D chan->addr_offset_v;
> > > > > > > >
> > > > > > > >               if (chan->vflip) {
> > > > > > > > -                     chan->start_offset   +=3D stride * (h=
eight - 1);
> > > > > > > > -                     chan->start_offset_u +=3D (stride / 2=
) * ((height / 2) - 1);
> > > > > > > > -                     chan->start_offset_v +=3D (stride / 2=
) * ((height / 2) - 1);
> > > > > > > > +                     chan->start_offset   +=3D width * (he=
ight - 1);
> > > > > > > > +                     chan->start_offset_u +=3D (width / 2)=
 * ((height / 2) - 1);
> > > > > > > > +                     chan->start_offset_v +=3D (width / 2)=
 * ((height / 2) - 1);
> > > > > > > >               }
> > > > > > > >               if (chan->hflip) {
> > > > > > > > -                     chan->start_offset   +=3D stride - 1;
> > > > > > > > -                     chan->start_offset_u +=3D (stride / 2=
) - 1;
> > > > > > > > -                     chan->start_offset_v +=3D (stride / 2=
) - 1;
> > > > > > > > +                     chan->start_offset   +=3D width - 1;
> > > > > > > > +                     chan->start_offset_u +=3D (width / 2)=
 - 1;
> > > > > > > > +                     chan->start_offset_v +=3D (width / 2)=
 - 1;
> > > > > > > >               }
> > > > > > > >               break;
> > > > > > > >       }
> > > > > > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegr=
a20_vi_ops =3D {
> > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > > >  };
> > > > > > > >
> > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > > -{                                                    \
> > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE,=
 BPP, FOURCC)      \
> > > > > > > > +{                                                         =
           \
> > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,      =
             \
> > > > > > > > +     .bit_width      =3D BIT_WIDTH,                       =
             \
> > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,       =
             \
> > > > > > > > +     .bpp            =3D BPP,                             =
             \
> > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,           =
             \
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct tegra_video_format tegra20_video_forma=
ts[] =3D {
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > +     /* YUV422 */
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420=
),
> > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420=
),
> > > > > > > >  };
> > > > > > >
> > > > > > > Looking at the code, BPP seems to only be used for the line s=
tride (i.e. bytes per line) calculation. I think we should just make it 8 f=
or the planar formats (possibly with an explaining comment). With the curre=
nt code, we end up with 'bytesperline' variables in places not being the ac=
tual bytes per line, which is confusing.
> > > > > > >
> > > > > > > Actually, we can then just make the 'bpp' field be bytes per =
pixel as it was before to avoid the discrepancy with Tegra210.
> > > > > > >
> > > > > >
> > > > > > No, this code is actually cleaner and in sync with what downstr=
eam
> > > > > > does, Tegra210 bytes per pixel is confusing since it totally ne=
glects
> > > > > > formats with fractional bytes per pixel, it is impossible to se=
t there
> > > > > > 3/2 for example, which is used by YUV420.
> > > > > >
> > > > > > According to downstream code bytes_per_line =3D
> > > > > > soc_mbus_bytes_per_line..., downstream directly name is bytes_p=
er_line
> > > > > > and soc_mbus_bytes_per_line returns width * 3 / 2 which is corr=
ect
> > > > > > calculation (12 bits). Meanwhile for planar formats Tegra has 3
> > > > > > different buffers so with offset calculation plain width must b=
e used
> > > > > > (which matches downstream).
> > > > > >
> > > > >
> > > > > If you mean use of BPP by VI, I can propose removing bytesperline=
 and
> > > > > sizeimage configuration from VI entirely and leave this to per-So=
C
> > > > > fmt_align function which does this already anyway and guards ever=
y
> > > > > time those values are referred. This way there will be no instanc=
es
> > > > > where "places not being the actual bytes per line" comes true.
> > > >
> > > > Without trying myself, I'm not sure what approach is the cleanest. =
In any case, the downstream code is just wrong (or incorrectly named), so w=
e shouldn't defer to it in this matter. I don't see a reason to keep the va=
lue '12' either if it doesn't serve any purpose (admittedly if we changed i=
t to 8 or 1, 'bpp' would be a confusing name for it, but explainable with a=
 comment and improve-able later) I don't mind having an if/switch statement=
 for the planar formats to use a '8' as multiplier instead of '12' if we ne=
ed to keep the '12'. But the main thing I want to avoid is a bytesperline/s=
tride variable that isn't the line stride in bytes.
> > > >
> > >
> > > I am proposing you a solution, handle bytesperline and sizeimage in
> > > per-SoC fmt_align function.
> >
> > Ok, I think that sounds good. It's good to consolidate the calculation =
in one place.
> >
> > >
> > > 12 represents amount of bits used per pixel, 8 for Y plane, 2 for U
> > > plane and 2 for V plane, total is 12. "but explainable with a comment
> > > and improve-able later" why then we cannot use 12 with a comment? thi=
s
> > > is all arbitrary. Downstream is not wrong from this perspective, you
> > > don't take into account that YUV420 is planar and it uses 3 planes a
> > > whole Y plane and 1/4 of U and V which in total results in wigth + 2 =
*
> > > 1/4 width which is width * 3/2
> >
> > Yes -- but AIUI, the only thing the bpp value is used for the bytesperl=
ine calculation. When we add the special case for planar formats, which doe=
sn't use the bpp value, then the value 12 is never used anywhere. We should=
 at least have a comment saying it is unused. (At that point, we could just=
 hardcode the bpp values in the fmt_align function -- but I don't mind eith=
er way.)
> >
> https://ffmpeg.org/pipermail/ffmpeg-user/2023-June/056488.html

I understand very well that for YUV420, each pixel has 12 bits of color inf=
ormation. But how many bits of color information each pixel has is not usef=
ul in the context of this driver. The number of bytes per line is not relat=
ed to how many bits of color information each pixel has for planar formats.




