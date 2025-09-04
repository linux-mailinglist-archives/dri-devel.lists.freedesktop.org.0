Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB52FB439AB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A2C10E9F7;
	Thu,  4 Sep 2025 11:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qhZXFQTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D54110E9F3
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:13:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptZ+n97KQoNhRQ5GVuTJkL2gY9xVOjpS0d0U4amA+dVyFtHWYIVRPrPWeXEZjTmAHhUrpMn0kn83tkrnarE4y7KeG6CxBF2OOEtsC4Uyg831+3dX8lZaC0LvOIoBsWGlJ1phFUCTojNX6U3ZNK3vsDFTrlAkoaxgWjd4rUfu/morlu7CvBA49ezB0F35KBU+V3Vcgj6ruSIbw8tVniAu1nje27aWnwow8YXC0/AGX3lxOIyag0vC+cwHdO0vluQK9E3ohHaAqaJPQRwhPkGzUQtaciqqjRoozPxTbnI5xKI04OFjP4rJALX7wIrYEGP9ULZ1PDX2svjUEaxqOZOzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxKr7F6sX7hMl1+O/t76ZKOdBtQwsIUdqiRbnGz6EvA=;
 b=gxO6omYofrFP4CzYXO4/swF+2cbL+5yvLrFyclI8Z1cs0u7NTuuAWJKorkWDIRhf8mo30gzlZ2iXlB52ZeoFYGRdm10t3mGGtaSeToZ/35Z7pgYe/OWuHyyw0bnUD0hcEceKsXGFuzTAMmEi7BjHKxWoTasKG9lnMv2MvWEn0qtMCXC/o8/CEXdS0/ZFlJO6OwlF99hOptym7vxPgiSWrvnA52WcDZYjnkNBxLYxtZe9iENt7RpoiI75LtdqRuHxAOA/utdM8MJOU8XwKu35i3dzUXq7i7ej8pdKwtPAAAXqd4PPSsniQ+9SdLKW7UfGisE68p/ZUt66oalnav8Xvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxKr7F6sX7hMl1+O/t76ZKOdBtQwsIUdqiRbnGz6EvA=;
 b=qhZXFQTAsY+hF9fjO9eL0gw0lyGRju2YXR931Kjyv9d9TvG1LJarPsRQYONm5zFkkj1H/Ggv/K+cuV4CHgVsqLOhFwHUgdlydIZoTB7DbFtb1yGDoPgeN6Pu2b49we6FLrMcbTd3XujoOlkM0QhCC1HVOfgPNy7gTxPRcw6fXvc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8548.namprd12.prod.outlook.com (2603:10b6:610:165::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:13:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 11:13:35 +0000
Message-ID: <9bd35ef7-385e-4319-ac93-9a95fd2f1389@amd.com>
Date: Thu, 4 Sep 2025 13:13:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ttm/bo: add an API to populate a bo before exporting.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250904021643.2050497-1-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250904021643.2050497-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 638c3041-3ecc-4a1e-37d0-08ddeba416e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU1JYTh5eGt3UWVyaDBYV2kvUU9yRTliN214NkZJTEJlVnVyRlFzK21YS09C?=
 =?utf-8?B?ajAzRnNrdmM2VVA3cHlIZHVJeDN3alBJTUJlTHpuVnp1MEF2eGVmTm8yb3dI?=
 =?utf-8?B?ZDkxdElobGthdkIrMUtlOXB6NDQzK05kOVIrbVdwSEw3TVR5YnJpK0pLZzN1?=
 =?utf-8?B?QmNyR3NHV3RmaS91Zk9ZZWJnbVBIc3RvWGVpSVZZeStydlA1dWR3STZqSmFa?=
 =?utf-8?B?SmJWZi9meU11STZSRE9mMUg2S2czVDNqVGI5Z1hZdmlDcmFCM1ZsNmxqUzhZ?=
 =?utf-8?B?d1JTV1I3YUcwOGUxV1A4WS9tWWhVL2IzVTZtZG1TblgxWGZ4Y1NENlp5YVBJ?=
 =?utf-8?B?aXE4V1BWemh2dHYxekF5SFBhQWtMRzZKSUVmeW9BRkdqY3JyRG84N0I4dVZO?=
 =?utf-8?B?MGx6czNXZ0VmQWg5RlBwMVd4SkdxZWRta1RtTDE1VHdVTldrQ1psYnFTWlh2?=
 =?utf-8?B?N1FKTGJ1NzlDazRPa0RVWnpRQStSVkZUeEw1dzN4YnhES0IyWW0yWWMvRkpl?=
 =?utf-8?B?K0NJUGdPazhHck9JL2FKZStnaVpwN1lORW84YTNQQnlxdFRIaTNDdS9QNlVx?=
 =?utf-8?B?UE84WVIrNVZVVU1iSVpwL2NkM3oyUUcxYno5Nm5BOVJkRkswTW83a2lrT215?=
 =?utf-8?B?eFdtbXZqTURpQjFKMU9zd3FpeUtNVHNGMDJpbFBJQytkWndSSkRBZDRLUHJr?=
 =?utf-8?B?RXl4VFVBN3RjaUpoMGJCNzAzMGtMRGtnQVVZZmNLU3BBbmhKYS9oeFIwSHBJ?=
 =?utf-8?B?RGNtRmhOYm9ra3owcUg2NGZ4UCs2Tkt2NUpocG5HR2RaalJ3RmQ5aHYxdTli?=
 =?utf-8?B?WEtJeldoa0YwUnpiVGppZzZJYWc4Sk9WaXoxNEJ5Y0REM1ZreFpkTGloWWpY?=
 =?utf-8?B?ZGx6Z2NiYkkvdDlQdHBEVTVOMnpHMFlpSzJiYi9Od05zMXJ0T2JIWTZoTW01?=
 =?utf-8?B?ZS9nOXV3K3pYMFpZcFhONm5yR0Q3cGYzdFVyT1hqeFdpa2Z5aE1zT1VDcVpY?=
 =?utf-8?B?SDU5aVdZL1g2c1g1WFhBVjdZNG1BVVErdExtbDhUY2hiakJ3cElJNnpTR0Nk?=
 =?utf-8?B?LzllLytEa3d4Q0RudVlqMmJWa1llZnpiNUF3Y1NmTlpuOXA3Wm00cGErb1JB?=
 =?utf-8?B?b0FoNG43OEFoZGdSb2ZBeHhaRnc1R1hKZE5VWE1MRUxQNExSamtlbFlNVVl1?=
 =?utf-8?B?dlZTaU9EZjMxUjNGcjJrYmN3d3V2UG5IRXVLZG51QUxyNk4zYWgzRWdoU0ZP?=
 =?utf-8?B?Y0h3emdiV2pZV3F1aFRWUExIbm94THVUcnZ5cm9wcU9DM29sTmpXeGV0QXhM?=
 =?utf-8?B?VGx1YjVUODlsdUFKNHhwSjFabWtwckRsYlVoWXR2aklGbVBoWC9hRkdjR0pt?=
 =?utf-8?B?UUQ2bzJ0MVNFZkg2OVNjMm1zbEJqZGhCUmxTSkxYd0hIUHJiSXY3d3YxRDVm?=
 =?utf-8?B?d0toMVBlQy9vMkZrN0NBbU9Mbnk1SlM4d016MWliWEZ5eTgwUDFuTWxBTEJu?=
 =?utf-8?B?RXFzMDNqTXV4WDlQYkxhaDNSVS9EbDVBdHVIbzRCQ01KWUNFVUwxYU8zT280?=
 =?utf-8?B?cEZja0M3T0NnYUx1SjFsbTlYTDVJMy9xMzA2OVhxdzZscjJVb3NsUlhSQ3ZL?=
 =?utf-8?B?VVB6dkYyRjJFeGlzdkFjRS96bkx3cFgyYnM2bkE2NmxkdmZ5RXgweTZXSXhR?=
 =?utf-8?B?bFk0N3ZJUHVhRW05bE9vWlJUWEpIVlRWVW9lemdnVjZhZmt5RVpuVEZCY2lT?=
 =?utf-8?B?SDJZWDB1T1g5S1pja3ZHT2Z3OWxCTE5DMG85RXFlK2JBS2JXTVNOYS9XaXpB?=
 =?utf-8?B?MFF1Z2pvYytGazVYNFpYR0owbjhMNEl2YmlhZXVBZEo2Z09BYnVqU0FQa1ov?=
 =?utf-8?B?QXk0MFJRWGk1U1R4b2xvM1N4ZGFwZXhFbkYzaGF3aVJSczhCOWdFUi9XY3c3?=
 =?utf-8?Q?XOiMYAeeuzc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWtDSnFQU0xiQStlUkYwbmpJOVNqQXNpclErdkNsQjljRmFVY2hEdDVWRjNp?=
 =?utf-8?B?VCsvZ2I2bW9TcXE1K0xSNDZNVkgreSt0dWZiYVczNnhkNldjYVdWVkRMZ1Bk?=
 =?utf-8?B?TE1ITlJUSS83N3Y2Y2N4K25tUEY1ZitSOTlQT3hjSXhJMURFcDFtRzNJNzRD?=
 =?utf-8?B?VGRwOEFVenJvT25hamJMMFMraG96UFkwNHhHNzBYSU14eUMrUFBjUkErWXU0?=
 =?utf-8?B?WG9tTjVDQ1dXUHVQcDA5QUJ0V0dtUUJXRUdacUN1UWZ6ZThSRVFwOFhDNDBU?=
 =?utf-8?B?cTJJNGVmR08zQjRBa3ZmMjBUejhKMkRCYnc5TFlmYlEwc1lRMTIxdHNueWRm?=
 =?utf-8?B?VUV0MWtETnpQRTJkcjJkcWdSNk1CUWRwSWpza1BOQjRqYlBsYWxZSktzSzRm?=
 =?utf-8?B?bHlWS08yME95NkRoQ2VRRzlHVlhKTW5VR1Q3cXE0RlF6RWdjN2dYc2g3bEZy?=
 =?utf-8?B?cWFiL240YUtBc0ZUSFFkMnoxSGpXNzVyRU1leTZyRzQ5TlhxVkp5SGVBSThM?=
 =?utf-8?B?aEF0Y2F3UlRWejhFd3VQeCtPZkhlUnl4OFVRNHhDTzRGZXZ4T1pUcFV2SHhV?=
 =?utf-8?B?L1I0ZWhldkZwaEpzOVJlZEU5MDJvZDZ1NVYybTJWVWY0bFk3WDd1U3p2Y08w?=
 =?utf-8?B?elBiYWtVNEpsV2JSN2J5Y25tcG13QkdNaHNBcGN5ZlhjdXRjU2xRSFVjQlE1?=
 =?utf-8?B?UzFCdWtwWDM0cVVKOTdSMkU0V29xd1dUSDJ1eXhwalArVXl1OVNoa0R1TWd6?=
 =?utf-8?B?ZnJOcFBuVE0xUGNpUG9MbmVJa01zYk10eGRJaFRjNEI3UmlhbzhLYVJicml0?=
 =?utf-8?B?ejh2ZGZ1cm5uL1NaT3pXN0k0NVpjMnVBVmdQS2VCQWJxdHlmSGpNT2ZOdDNT?=
 =?utf-8?B?aFJjNGZwZVRzU2FNQk9uOWxwbm10d1J1aitkNlhkdTFKWWFZSEtTMFRicHpj?=
 =?utf-8?B?ekhPakY0RkZ4eDNWT09FcmlVU1RQWFVIbThUNXhkZmsxcStrM216RWhxZ2Fi?=
 =?utf-8?B?cld0RkgreUlqWnJER3lBMHlPWGMzbzludExkSHdiN01DTE9FeFJTZStPUTJk?=
 =?utf-8?B?cEZVMGR1RnFIZlJtdG52cTBGWDY4U216czZCK1dUUmpvOTk5WE1BbURGMkZv?=
 =?utf-8?B?YndjWURrdWx3NVNYQktOVlpKK2cvSVkvQ3NpNVB0QmJLdUV0bHpFaXNVU3BW?=
 =?utf-8?B?TFhoQTh5OXMrdWQ0MC9KZGlkYVM1V2R3ZnhTbmp0cjhBVHphQ3Z6N2RYc3ZW?=
 =?utf-8?B?bjdxVTE3bkdja2k2V1M2NnQrdDZzb3Nyc29zOWNNdUpPNm1NRVFxTk51OVpR?=
 =?utf-8?B?UFZML0YwREVNaTFUSHZtWG1CUFhmSmYzeDllT0F1dWVlN3JWR1NEMW5HVTJ4?=
 =?utf-8?B?ZzlZMDhTS2RzZ1ppRGNMT00zSGJXMjY3TTV1bWN5UXJBOWxBQmw5T3hwYlJi?=
 =?utf-8?B?V0x2QnFaeDdNdmhQTG5sQTRmSWRuNUN6QjAvVWY2TTFUM1NjTTRWUEVVRkFT?=
 =?utf-8?B?Ym5OZ2tJbi9MV2dJZTJUdDRtVTFLbHU3TkVpdVVHSktYUkJhY0lERDU5bUFX?=
 =?utf-8?B?aHBUalorTndYNHp2SDdkM3JOYzdNWmpqQXhHaGVNNTgzVnpUVmoyTW1zQ1JV?=
 =?utf-8?B?WWJjTVdvS1BSenhKeC95czJVWFlYZ3hYcktlUjU1bmErSGFOajk2K2tUSURi?=
 =?utf-8?B?emUzUm1VNnJ3YjMzN0c1QnF0RjlVQ1AybmFIQkc5bmtHbnFaWmVqSWhVWFdF?=
 =?utf-8?B?WEpwb0x4Y1lHQVFmT01OQ3VTbGVWbFFvTFB0TXN2bmxwcmpsRklIdUFldzBQ?=
 =?utf-8?B?RlNVT0hPQjFDcU8wakRUSmVpaU9JSzRFcUJuL0xpNSs3cFJNOHNTT1J2RVJu?=
 =?utf-8?B?MEREN1RWMjNSVnk4NjF4RGprSGlLZlBxbURXcU1McFJ2d2JUcDd0aStuU3VV?=
 =?utf-8?B?dVF2eWxsc3dpMUxMSU1vbFAyZU1GbHkrRkRzSTd1WlRhZlppRXk0SWx0a01R?=
 =?utf-8?B?M09LMHRISElKTmxzZVlXZkcvZmJmMmwvOHJiUnFGbjRLMnBHRVNHOUxWbU5n?=
 =?utf-8?B?WE9ycnpqenhNU1lFN0VOeURGa1Nvak9acGpEU3JCNGNhMWZOdXJQSGhxV3Fu?=
 =?utf-8?Q?eWFDJccMuDfpQdFTrHM2s4lQQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 638c3041-3ecc-4a1e-37d0-08ddeba416e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:13:34.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmU8wq67uGJuKXySjprapjiVy8ZiJJn5+cUUOj1AgHHVby7cbz9780GkpY24jafv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548
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

On 04.09.25 04:16, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing cgroups we noticed a problem where you could export
> a BO to a dma-buf without having it ever being backed or accounted for.
> 
> This meant in low memory situations or eventually with cgroups, a
> lower privledged process might cause the compositor to try and allocate
> a lot of memory on it's behalf and this could fail. At least make
> sure the exporter has managed to allocate the RAM at least once
> before exporting the object.
> 
> This only applies currently to TTM_PL_SYSTEM objects, because
> GTT objects get populated on first validate, and VRAM doesn't
> use TT.
> 
> Reviewed-by: Christian Koenig <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Patches #1 and #2 Reviewed-by: Christian König <christian.koenig@amd.com>

I don't see patches #3 and #4 in my inbox, but I guess it's the same for other drivers.

Regards,
Christian.

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 15 +++++++++++++++
>  include/drm/ttm/ttm_bo.h     |  2 ++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 273757974b9f..a815c7478d3f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1284,3 +1284,18 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_bo_populate);
> +
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			struct ttm_operation_ctx *ctx)
> +{
> +	int ret;
> +
> +	ret = ttm_bo_reserve(bo, false, false, NULL);
> +	if (ret != 0)
> +		return ret;
> +
> +	ret = ttm_bo_populate(bo, bo->resource->placement & TTM_PL_FLAG_MEMCG, ctx);
> +	ttm_bo_unreserve(bo);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_setup_export);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index c33b3667ae76..cdc9f5d1b420 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -473,6 +473,8 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
> +int ttm_bo_setup_export(struct ttm_buffer_object *bo,
> +			struct ttm_operation_ctx *ctx);
>  
>  /* Driver LRU walk helpers initially targeted for shrinking. */
>  

