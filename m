Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53809F3A01
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C975C10E786;
	Mon, 16 Dec 2024 19:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jdyVTih7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE20E10E0C7;
 Mon, 16 Dec 2024 19:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7RnMF1NvxE3JX/wITRXs0i3Bgq+LlC+KRx1g3YX5nMkyVhOz7TQGPhOibeD977VYcHoYoofJLaXyyCAnnwCbMLf/uzG3gis/pWD2KsWH6ZoxauwctCJu4IT1Q5ylmjQ1HXdy8+GUKPDoT2gro8+dkluegCgAgFuPM6NW7BCK9kgo4VTr61ss/emMetWIb/8VlkQA9L4KHzbvkfMrtZvZlt3dBD/9MBgyFjf8oWVXC3fvVghent6Itxeke3KUdilIFjk8Vjffri0dV3DROv/w6wSGnL72wkKnh4TtlYPNFVa3qbTbYdOXEjYfhxI7VHdRmazyZ8kI7EPK5kGT8pAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5lEFc2e5j4ysgh7+ljtbgCNlvs0fSAytIxF5b0lfRk=;
 b=Ra8U+kxM2cWODKTIT8XtCqK8SIXOdzxnL3Xh0GsjW8dlSGPUZQDUCRPrV8zFr2JVKaOf6nWLou3pVh8AeqCTcDgEtCA6mCPoImFDlkExtxjEZmaq4YiQBNe4yuQYvdGO4MPHhfyGAidqK2yyksM/6VCAizY/Cw7R3Fy0aF7l+oecxXkBhRz9A9EENJsO0+EwEi//WHhP4XtJ2SLb9rTdstszBJGW6Hw/k4pv3ZOuM37kT0172u8Os21LhVePMOjq+UZJR3r+nKYkL2dhyd1DDv8EkLk1aet+D4Dl8BOGKTWYvhBnGq+diDb8QMsSVvnDbtmAxzC1iHxK7lMoGwgN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5lEFc2e5j4ysgh7+ljtbgCNlvs0fSAytIxF5b0lfRk=;
 b=jdyVTih73We19x8sXgxSmMauBtspCuFzMRY8eggMCdnEhVPZ3I5yWaYQea8be76pF2HJUYa+pvFMQOZCct5Tazxlhpzj5vEIpmPraHCeRLEax4ra/zdAfR56VYq4Ijc4wwPW0MUukfCTp35jqMxSanS8omG0xj2W5f4ricoCUz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 19:39:01 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 19:39:01 +0000
Message-ID: <ab347745-80cc-4a5c-ab92-de6bc6bce3cc@amd.com>
Date: Mon, 16 Dec 2024 14:38:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Alex Deucher <alexdeucher@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
 <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
 <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB8968:EE_
X-MS-Office365-Filtering-Correlation-Id: d05d4583-45b3-4def-9ad2-08dd1e094a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXNGUnoyZ2Y5Z0xUbmJpQm5LT3BNeTVmUzB6bjgrNjd0dEZYTXFSV21tNXBK?=
 =?utf-8?B?UjdGNGZDSlQ2LzRta2REMHFvdUdhRUZwYXZYSituOWJ0WDNlRmpZRjJyZlFz?=
 =?utf-8?B?d0Q4N1FYeGtYdU5ldFFlNHducy9FcXNCb0JNWE9sWE1Db3M2OVYyMWxabHp0?=
 =?utf-8?B?RGtGT1NhVkxNYUdjWDZmcDZkYWtubWIrWkNjQVBGbEh4dVZxQVNOSzN1aHFK?=
 =?utf-8?B?M0FHamw4c1EwUG1hSkhCcHROOXlBSzVsQ0FWMjNoNUhHZ1VWb1AzV3pMRGRL?=
 =?utf-8?B?ZE9aa3M0cGNheW00WW9OOGJEbnR0b1c1b3drRjRmcURiWkpQeWZVaXZ1TmhY?=
 =?utf-8?B?WnhncHhYd2Rnbng2eWdrdzQzdTB2Zk1KdEZHaVRuTjgrUTQ2aUNZRDVRZVlT?=
 =?utf-8?B?RTJjTi9XL3Y4TjQ1ZU9HaFd1cWw4NzRNNXRiODdLcnNteFpNaE9CWTdBcnhT?=
 =?utf-8?B?Q08raWJHbU5Kd1g2MDkyakNBYU5sbjljeHhsa1d3L3NUamk4NEZIdms4OVJl?=
 =?utf-8?B?ZFFqRHM2RlNRVlBIRU9HQWFJZ0kvQy94V3ZQS3V1TnFFYmxLQm1acGRuSVIr?=
 =?utf-8?B?dVlyNmp6dnZNWnRWVG5HSkp3dlRrMmgzeC8wcXFKbUxCdEhNZnJGUldHT3BH?=
 =?utf-8?B?ZXBTcWRoeU5peHEwc3k4ZUlwYzJCUTVBOHltazluNVBGelJNZGkzWGVNZ2E4?=
 =?utf-8?B?eER1Z1A5RzdCQzFkYnFHK1MyR1hibURNd2p6YUZySnNMQ3JnNGRFTkpveW02?=
 =?utf-8?B?NG43VTZCSXFRTXgzeU9waks3eUZGRTlxMmtGT3NNUW9lTkR5N1dCWUNEbVJ2?=
 =?utf-8?B?NjJDUTJYQzdoZktLZUFHZm16NWRTdjR5TDVsT2w0Mnh1Zy9pMkgxQmp3aXhi?=
 =?utf-8?B?ZjUxWHpSY1c2RTkwSzdqK1FWY0tidWhOSnVDV3VsU3IvUmJGMk0wV2ZEdmN0?=
 =?utf-8?B?SGo3NGVoYWlTZDlJMmhLNzBWMTcwczM2djJKU0pYWnFKZElSTlR0TlU1bmNZ?=
 =?utf-8?B?MHYzeE11OGdaTlgzdXZ3Wm51cHVtUXRMVHlTQnh3eEpURzRPQ3phUXkxTGRM?=
 =?utf-8?B?aUhHb3Bad2F6YjU5R1ZXNG9kWERKNXNIZjQ5bDVqbm0vZllVZ1M3RGRmNFBm?=
 =?utf-8?B?VjBmTG9FYTFOTTgza1UwM0pLajRkd0Y1cENlTkhkdzBwUS9wREpIOUhpYmcy?=
 =?utf-8?B?ZFpUN21FU2lDdnRPazU0b2l0dVpiT1lhSjRIQkZKSzN2NVZsc2hZeVZ6MU1P?=
 =?utf-8?B?Nzhsbjh0NUhTem1wdkQybkFEcDdzOHBFTFhzM2hhRG9VZWdFM0FESnNSQjVU?=
 =?utf-8?B?Zld0WDdSdE9CRmxYQkxGdzRGK1BIaWx0YUV2ZWZFRjJlNDRtL2JYT1k4d0M2?=
 =?utf-8?B?ZDUwdUFyckdhWUl3dFZ3anRGNDA4c2ZTRFV4OE1BYmlMb2pBbWdKNlZXelh2?=
 =?utf-8?B?L0JDZ2ZHMVdjWGtYbzFhdno2NU04b3BBME15eXBRck9FOHlwemVnTTRsdmpB?=
 =?utf-8?B?NjNYSEgzaUg4aXZNUnRmRHNFVjBGQUpuWnBHR0kyNHJmQzlFZ2N4K2VidDcy?=
 =?utf-8?B?NHcvd1dNUTRsYjlDZWFvbU1WSHArSFZOYUdnR1pxcVoyQWRNa0R3VzRPNS9l?=
 =?utf-8?B?V0IxVlN1eHdzZW02VkJ6eDBvU24yT0dFbEJKOTRiK3hDOVhqWFRubUtGNFZQ?=
 =?utf-8?B?YlJaZHRpYU0yMENwMkhtWDhDcXYvNVN4VEdXOWtVNDRweFZGTkExb215eUlM?=
 =?utf-8?B?V3ZnSmMvQ290ZW0wRDdhbjJZRGd4YTBoOXJZVFlJbVIzZjVlNTRpdnFhZjJH?=
 =?utf-8?B?WVR6dEhvb09JaExlOGQwRWtIWXdmTzYzazVQRWdtSW04WEFYWXVNV08vd0pU?=
 =?utf-8?Q?duy1dH3k/AfiR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHIxOVpyaUlkK2NiS2NTY1lmSnhwTFk1UXVMYVNDZGtrZHYxcjdKZi9rd1dp?=
 =?utf-8?B?djZRa2h4ZXpqUFNXT3VYaHdvbmJJOTBOZDhEdlloRUFTdzFjZVU4M1lPU25X?=
 =?utf-8?B?b2ZyTTdkalpKN202eENrd1kzbDdzQmd3Z2w1akJON3IyRkVidW9tYVkraEly?=
 =?utf-8?B?VHZaME9HY2hISlZxM3dmTW14ZERjcDBXbnZaMjl2eFdtckxRUEFONE1RMitC?=
 =?utf-8?B?Mk5ha3BTUjNBUklGYUdtajcrckk3eWNEakIxWEl2d284Z3U5YmF0ZWVNQVFN?=
 =?utf-8?B?N2d3bzNDQzA1eVVPWG5zbVZKUXlQTFVuYmZJRkN3Wko4ZFdNeTM2cEZ3OW9l?=
 =?utf-8?B?N2xPM0xzZU90UWkwRWxxa1ZaSzRNeitJRHk1VGcyUTZaZG4zc2lZelduYkQ3?=
 =?utf-8?B?MDJ5WDZSSElDdWtaNkxtVVZWNEIvMmo3YjdrOFp5bzJQUlVVOTEySWpuNmZG?=
 =?utf-8?B?aHd1RkhJRWhGamlDcnVVdkJ6aVRGdGJjMEhJTVB2ZHZBc0lVREwyWkxlbDB3?=
 =?utf-8?B?VVFxRm1STHdRMmp6aXpzdGI3cndPc3d3aHZQM2ltMmVaVjdJb3VZTHhyVVJG?=
 =?utf-8?B?S2wzSnJZWjRlQUdBZU42aitaK3A3WDJGSlpZWnRqVzBYZzhURzM1d1FscGhj?=
 =?utf-8?B?V1FTSkpoMGpuQm9zdG4yN0k0VE50MU5aK0IvK0F4MnQ1WklSYXhuVHZtenZN?=
 =?utf-8?B?blMwbGJBc0JtZmk0dlRBN24wMTE4bE5KY0IwcHNnZnpyblVtSmRPWmVSMkQw?=
 =?utf-8?B?WGhyaWIwemlSY1BROVRjTjBtVUw5UHhFaDBJNXBBSVA0VjJTRjZXc25UNW5v?=
 =?utf-8?B?YnppcHZZTDlKM3Z4cFlJUGpqNU0zS0JxR2NBQWVSRC92Q1dycnFEcTVSbVNa?=
 =?utf-8?B?b1lkUVJvSzFHREprQkp0MldoYld4OU9vYXNLWWgxcEFlNllZQlU2SkpndkVw?=
 =?utf-8?B?Zm93UXdJdW5XN3VJbFhBUTZlQ0puR3RMQzI5RnZkTWVQNG1qUHVtM1RWaG02?=
 =?utf-8?B?VnUwdm1yYUo1NUhMMEZ3bEhaZFdYMWh1bkxuc0poZ3ovQldiQWxSMXBkSVVl?=
 =?utf-8?B?aERNb2JSdkpxZk1UV0V1ODlRK1BWTHgyUHJpcHc3VmpDQjF1QnNCYmMvbXBw?=
 =?utf-8?B?WWRsdUJ2YnZKOEJPRE9lRFAwNU02RmF3RHdIRG0rclZySGkySHNKdDVMb1Fl?=
 =?utf-8?B?ZGN1K2VFS01EUjdOV3FzdERMSmZxS3ZOamc5aGVHMFcrN1VjcHBsZE1LU05E?=
 =?utf-8?B?ME5OdzBMUmNKYVdJUDcwYTJEZzR1d1VQcmpBVlJsVU80cnozSmpDRmVJV2hJ?=
 =?utf-8?B?V09WQmhjY3liSm12R0VYcVVveldacFd0NUYwOXpIVlNiWEYybUdGcEFWVDhS?=
 =?utf-8?B?ejhybFIzVTZxNVI1QS9zbjc3WCtsZlpVK0pOQk5vaU5tRHUzUURGem92Y3ph?=
 =?utf-8?B?Z0pFR081QVhES3hMay9hMnZCRUIzSFV0d2FIM2lhYXdxQmFhczhRR0NRRTcx?=
 =?utf-8?B?VmdHMVhTTzZqN3JsUnZjWE01UW8zSitZVVArQXFGUDhtMmZqV1VGRVhBbm9j?=
 =?utf-8?B?eVU3VjJhUUJ2dmh0Y1VNYnJ0andVbndLNy9wTm0wYkFObEJvdFN4TFE4WER1?=
 =?utf-8?B?dlZkVGpiRldUY3lDZ0d4cjh4UFZmWVpldWlPOVFLei85QTIzeU94WFZ6WWlu?=
 =?utf-8?B?QklGRE5jajBKZmJra214MU5PY0p2bk5QRTBnWFh4Q3E0R3l3SnE4UVJjT2lw?=
 =?utf-8?B?Y0hJZ1NuOER6SGQvdWUxMWUzazdUWHorWmRlQ2w0QnlEOGVObnFVMXVidVdK?=
 =?utf-8?B?QVVxQkphNVRDYjNmQ09qLzhCYzJObXFzVFM4VGJjWVRUSUdSWkJMQk1na2Nk?=
 =?utf-8?B?aDEyS1U4K25MdG9sa052V2NQQXVwRTNjYWYzdjE5dm9OSDgvVUZIT2lkSFlM?=
 =?utf-8?B?Nkc2Tmt3bVhlc2pxdjN1Y1JiZFNoSUkyaFM4NUR2RlJROWpCTTZTQjZwNVlz?=
 =?utf-8?B?aENzaWRzSVJwNXdOREZ6YVJDUW9YZTI4YzFlRFNEWVRsa1VFa0ZNcC9ZUkp1?=
 =?utf-8?B?U0FXdWM4cFZaUVRRMzB1NCttd1dMMHRrbFNVL0ljSGkxajdrUjRlOFMyVWlN?=
 =?utf-8?Q?Xe/2EqlXsvkLREZ6nImg7TGmN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d05d4583-45b3-4def-9ad2-08dd1e094a5d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 19:39:00.9535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMz8C23jUrIPSaqurdXBvYnY8kCYHDZ2MJhG64cCBuJxihWC9duqIxxkhZCmEo+i8nm2/e6KCp0RFqgSdcZn0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968
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



On 2024-12-16 10:31, Alex Deucher wrote:
> On Mon, Dec 16, 2024 at 10:12 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> wrote:
>>>
>>>
>>>
>>> On 2024-12-10 16:20, Dmitry Baryshkov wrote:
>>>> On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
>>>>> Reading access to connector->eld can happen at the same time the
>>>>> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
>>>>> order to protect connector->eld from concurrent access.
>>>>>
>>>>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> ---
>>>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this one
>>>> and to the radeon patches? I'd like to be able to pick the series for
>>>> drm-misc and these two are not reviewed by you.
>>>>
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>>> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
>>>>>                      continue;
>>>>>
>>>>>              *enabled = true;
>>>>> +            mutex_lock(&connector->eld_mutex);
>>>>>              ret = drm_eld_size(connector->eld);
>>>>>              memcpy(buf, connector->eld, min(max_bytes, ret));
>>>>> +            mutex_unlock(&connector->eld_mutex);
>>>
>>> All of this is wrapped by the adev->dm.audio_lock mutex. It might
>>> be safer to modify the audio_lock mutex so it only guards the
>>> aconnector->audio_inst access.
>>>
>>> But I don't see any way these mutexes would otherwise interact,
>>> so this change should be good as-is.
>>>
>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>
>> Would you ack it to merge it through drm-misc? Or would you prefer to
>> pick up those two patches after merging drm-misc-next once the rest of
>> the series lands?
> 
> Merging through drm-misc is fine with me.
> 

Same.

Harry

> Thanks,
> 
> Alex
> 
>>
>>>
>>> Harry
>>>
>>>>>
>>>>>              break;
>>>>>      }
>>>>>
>>>>> --
>>>>> 2.39.5
>>>>>
>>>>
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry

