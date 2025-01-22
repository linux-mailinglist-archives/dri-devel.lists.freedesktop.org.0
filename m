Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC7A1956A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 16:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3479C10E70D;
	Wed, 22 Jan 2025 15:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Sd8I8Fr8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4FF10E241;
 Wed, 22 Jan 2025 15:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBk9xb8lveQ3SneT9hNPRSmA4NFV5XtQ3vzdY0n5icCY61HvNIyw5kXZWGalA1qKvAXRVu8IFKrNh59ScPEBbyfqobEP7/wl0ZO1Q1QHa/DKkqFwqvsvkaLL2Dxz3ouCVCRxuRgfTfz1fzVCIzsjFqqCVtJdxbbPqcpM5ZRxdraY6pLzvwogo2XtJTuKnZqzruNZ806P/577BU+QwQxPJpbO9mVRKpC5wdARD+wyy2C40o9b6fIPUsF/zULi+JMRv/9Do7c9YjugD1rT97yG9vqqwBq7PXCyy9IxSWUOIkfU8txX75VlQAF8BDGrD+Ig3Jducea59B1hazOjDm+aSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6URFtFgJOVXaTLI+zDhKduFdrw/zWGKUwU4mSqTGGbA=;
 b=GAVeyrJOCjOUr+aImyP6EyL7M6C+WjJAwNZDgQ+ZsWiohKdXNUcybqCZgohwLvV+w4Yo/4RE3UVWsKdU+arc+CaR6pLiA2bslz8Q9jjAyFkwvAaXguvEdHDx1+yzPqJlBlu1MJHmNs+J3y1AnNjKVoLvYsNkp4MyFbnEa9pId31yG7kjoakUOEVw/2DtBCRzBlKb+NEptnw1Y3YQUDFuVwjMaXRhnJiip5HrqjvhaGoNbs54qqJcP1vQC3Is0R19vvahY2gpnqFyBVusMtoiIHCbfNgQ6rzkBYn+cFzbZhDHUcEuoIxcwM7RiyogsAU28xqyWzQ+N8MfyFoJeWry0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6URFtFgJOVXaTLI+zDhKduFdrw/zWGKUwU4mSqTGGbA=;
 b=Sd8I8Fr8hQwGg4OITHpqUzy2JylVPxgnTppgJW5zuj2nXyufXQb2qV9aImiId79FpXIs9nHX6uN469hj8KWt4y0Ww3i92VvGn40hqlKkzhMFga7vXxdnT0cGT1VX2BlbPtn07qZQ2ZJZe727qB6Q16iKvi4B+Ow3zxFqelwNxNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 15:37:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Wed, 22 Jan 2025
 15:37:35 +0000
Message-ID: <cf206266-29aa-4a15-ad20-0d739f19c9d0@amd.com>
Date: Wed, 22 Jan 2025 16:37:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Philipp Stanner <pstanner@redhat.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
 <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
 <4614fd95-ea91-484b-87b7-bba5da0bb8d6@amd.com>
 <2cc132e5fe2ff857027a0f641a99bfd336ef4e0e.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2cc132e5fe2ff857027a0f641a99bfd336ef4e0e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fda934-5ce5-4275-6082-08dd3afab16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW1rWHhVWXpZU05HOWhLQ3hHUzA2TGtxcldUZVZRcnNIMlczdExXN1lQMS9j?=
 =?utf-8?B?dDBYYWxrdWZySGlhK0hOOUp2ck9EejVPbTVhRFJ3MGkxa2FtVHRvWGtyWko3?=
 =?utf-8?B?eWdvV2Qwemo2WnBQcmg2dHpZeHp2WnQvWngvT3dQMWNJTitkVHZiK3pEakx6?=
 =?utf-8?B?MXB2c3lkdDBTdzYrdjJyQWFNdDRPOUtzVVBKQ1lPNU1GN3pGNllPbVVUNDNV?=
 =?utf-8?B?R2N2QksrYUY3L1MrWXZHWTUyZXJPVkpxWmpzS3B6MW4xSmliMm5VU1lVaEt1?=
 =?utf-8?B?ZXplYnN2OFV0eWl4ZUJVTHlvbnBzZGF0S3pka1RQUnRlN0R5dUlLR04wRHlt?=
 =?utf-8?B?T3I1TmtBZjExYTQwbVJ1ejZxWVc3aFByQWE2OHZ2ZUg1UmNEbnY0dURqdHJT?=
 =?utf-8?B?ckNRN2VONmhmZ1lZNGpldG9SUHUydEZWUnBmc3VnUFBMbTl0WEpBWEVsa0Rl?=
 =?utf-8?B?QnVoOURnSjErdjRWeEYvMWJRbW1ES1B0TkFiRmlJTWphZ1p5VnVZMDRpRjln?=
 =?utf-8?B?S3RVSGg2NkpXN0RRSmtTUmFWWkYwelVRdWxTQ1pmaTNLb0U4QkN6V3hFQkky?=
 =?utf-8?B?QVk2WVpXdXpIcXV4NFgveXBGVzFYVUFsTWkyajZhbFpzT3hkcUxjWjNvMGkv?=
 =?utf-8?B?d0xhWG5FVW9uUzEyVGVySjVCS2dITTdnNHVMcmJVQnYzcUpaZ25DZ0FjRWJC?=
 =?utf-8?B?c2ttUHRra1RManE2QnQvQ3I5ekhjcHJQaDFxNUkzZ0F2OHJjY0dVbldIalR2?=
 =?utf-8?B?dms0UG9MN1ArcFhxU2h4WTEwa21xRnZpeGxpckVrVU4zRHZoWURJVUVtc2Z6?=
 =?utf-8?B?SThIMjZrVjdxai83aGhiRXNKbS91K004Sk1NSTNxOEhMcUNGZkxDQ1YxekFq?=
 =?utf-8?B?QUV4d3Zsc3IwaS9HWTNlOGd1SXlaMEthRHVEWklaWE5qbTZLSHRQcmNTNUxC?=
 =?utf-8?B?NjV0LzkxbTdnd0F3V3Q5RHpjOFV2SnZqdjZZaXBzTjZodG9HT1E1dGpTbU45?=
 =?utf-8?B?UjY4NURJN3lZekxlUnRxTU5hVHpWdWZ1eVNRQzR3STJ1VVgwZDVqWDF3QnlJ?=
 =?utf-8?B?TWVUV25qWmZER2tuVU0ybkp0bnpjdi9vaUlObXFzY1FZM3AySkQvWGRmTkZC?=
 =?utf-8?B?OTZkeTJ6bTVKb1FQRlQxbDR3NEF3R3Vna2tYV3M5WmxaTVQ1SDNNVnFFRWg3?=
 =?utf-8?B?WFUvTEJaTG9YUnFQUTVGWUpFdTRpckc4VUtuQzlYN0hraThsZTI3dlYwMTZn?=
 =?utf-8?B?bGtKLzd0ckZvaEFOM05pdEpVK1lZVVdlQk9VTDkvRE40bk9BanlEak1ZQ0FF?=
 =?utf-8?B?VVRGczdCVzJQQmhPTmZmbVBta1ZZOERnMzAybnN1ckcyMXNpMlRVYjRIOGI5?=
 =?utf-8?B?K3Fwd2lqcjgrTUYvUW1SR1lGa2gxUVMrZFEzVGJXV1ZHRksxckR5Zkt4a203?=
 =?utf-8?B?RjRVNUljOVhod2crOUE1ajYzcFBxZWQxOTZudGp6WVpJMXdtY1d6dy9LcWkx?=
 =?utf-8?B?dGI4RFJsemdFSTUvbmlHQmNiY0t4NmF3WDExeHBVRVpELzBZNjNYSk01STE0?=
 =?utf-8?B?dndmQ2FNOVZDZjZwa2p0S0JaSWplV1pKa3ExYjZ0TGhmT0UvUEhFbVBJVmlw?=
 =?utf-8?B?SDNPcUJ2NStWMFBZZ0FUVFMySTBQY3JmRWN2UHM2MllRVTk3Zm5xWlZyczFE?=
 =?utf-8?B?U1FoVW03OE00ZEt0b295TVpaU202UXh4YnE1aGdEby9rNENNRmk2NEl6YzJK?=
 =?utf-8?B?MGZ4MEFKbDd5TjRZZnl2bW1xOFl0SS9hczk0V1U5QU00a0ZST0tzRHAzc2dv?=
 =?utf-8?B?dVJzb3RWbWlCY0RVSzFWc2tkMnZBUGRaNHRVUVNQMENHV1g4NEgrZUdDN0Zr?=
 =?utf-8?B?YUtSK3FGSHlVOFo0TWhNNThHdlNKMERxK0JjaHg1WnJYRTJ3NnNTYlZheThF?=
 =?utf-8?Q?wy9BEbVAU8k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VndjS0VMQlJjeW1FUDM2SU9IRGhjeTFHRHBYQ3VMSXJoaVlsRnNuM1JrcytP?=
 =?utf-8?B?T1BzSk8ybys0ZHlYbDU1OVYxaFB6V1gwa3BCMmxTbCszSmJSclVxS0FyL2JY?=
 =?utf-8?B?b2JWNzVNMmw1L2NzTlRDVTZXR0ErRllBY3BrSDJXazhiR25RRVA2eTR5blAw?=
 =?utf-8?B?SkFqbndOZGVHZTZKZ2tjbzRtV3RLdk5SbDRLNW9iK3BjRHdObGhRZWx6cGhY?=
 =?utf-8?B?VmFpbHJqMVdHemM1aTVEUEc3emkxL1U2Vm9nN3M3WS9lOTMvRHlJV1Y3Snh5?=
 =?utf-8?B?cmZOVytCK1VkMDc4K25HbXJiQXk1QUR0VFBwZVgzaFRMdFRNUS9pb3Urak42?=
 =?utf-8?B?SDBBTnBrV0hUUkJybGNaNEp0MEc3eHpWbHMzR2kvVkxIcTByWTM3YUFFT0hD?=
 =?utf-8?B?bUprRDhFdjBOcXRPSWx0RGFMK3dWMGF5cG84eS9Fd29Tc0dLeVoxcEhJZmJO?=
 =?utf-8?B?RmVWT2FtNmRrakdyMEZxV2U5a243UTAzUm9HS3haWS9rSzluMjdmdGZBd2Z1?=
 =?utf-8?B?NG9SWUs5Vnl0NFpUcUd4Z2VvZktFZGF2OElvanhLY0NsOFNNTzlTT094Vy9R?=
 =?utf-8?B?LytGeDJQNGhlaFN5R0lyQXNPNmZkaW45b0UzdTVpRElFZ0F0UEhiU09BV0VN?=
 =?utf-8?B?MWlwQUhIdlpELzNvTnZzOXl2L21WbDJzTjlDRy95VmtvSXc0em11VERqRlB6?=
 =?utf-8?B?T2p0NjdrYlZ2ZmtpOXR1UEE5czhJNnNkSENOSFVwdDk4bU9WTFBHa3hkWHlv?=
 =?utf-8?B?dC96TTRkSXlUT2J4TFl4TUF3QlZiWkdYYloxSEJtcHMwN1VXd0FRaEFNanFj?=
 =?utf-8?B?QTIyVk1HQmY2WnV3eW9LSEhSUUM3T0E5eGJlSmowRHlrVlBCTENaMjMyTXZH?=
 =?utf-8?B?VlkyR0xWVmdGOFNiOGpvaENCcXZ2T2thZFFhd3JDa3hiYisyelRTa3RJZlJ0?=
 =?utf-8?B?eUVtRnBqUjFwbmVnZVdlK2dmMEpBa3F0dWFqZE1jZjB0SUM4cExlT3hkMGNF?=
 =?utf-8?B?d1pzNkp3cmhmTXZnSjVkc25CV1JEelR0U0xyNHJSbU1yZGkxZ0lianlJdU9y?=
 =?utf-8?B?TVR6dEdMdXB5dDFoODhMUWswd09qdzhoVi9JV0MzM05KMkwxYzg1WjVBQWlF?=
 =?utf-8?B?QlZ0VUV3UkZjZ0h1YS9JYXM2SFU1aTFhcDNBOXRGbUhwb3Awb2w0dHAydkxQ?=
 =?utf-8?B?Y2tJSEthUGZvZFBFWUkwRUFIczU5SWtPMmhTQ1FoY1d0anNXRzRvTStEeTRK?=
 =?utf-8?B?Zmk1cXV1SWRsM3JxSStXOHhjUFlUam42S28xTnAvQ3ZvRXkzNHQ0dTBSZEFP?=
 =?utf-8?B?T3ZwQ3FVeEFXamtZa3VsSWg2UEVnVlQyWWpSUTBwdE5saC9qNHRQdkdDc3Yx?=
 =?utf-8?B?MUVIRnd5dHN3dHIwUTZURkhRR3Q3YllaZlA3WXJ5Rkd2SE1KTWRBQ1hYOHVJ?=
 =?utf-8?B?RGNhZ1lDZktNZFJqZnJvampINFpEaGVuUUE0L2ozQ1Z2YU1GT25LVjQrRDJE?=
 =?utf-8?B?K0ROTmtnWENpYWhkc2Y5L1JqcmQ4SDV1WFNrUlBYT0RONVJKTVNxR1JGWkJZ?=
 =?utf-8?B?RFNLMjBKVUw1RXBzL3JLUXBVYTVtVnZkcjU1b2NwaVdXeEFEWjc1YjdYOTZl?=
 =?utf-8?B?M1RHdmdtOGVuYVo4U0hGSHUwWG8zcjdQbVJ2QU1DVXVZUmFIRVpXODVLNEla?=
 =?utf-8?B?aDdJS25ibXZaWjJ6WG45YVUwUlF2TEdEK0NPU0NFSDJFZFA5UitaOTd5MmpL?=
 =?utf-8?B?dlNhMS9ZT09kRWFzeDNnekxGc1kwMEk5U1NWeE1lWmg2U0xCSTlFZ1dpdWdR?=
 =?utf-8?B?d3dRRGhJVW9GS3lZZFhBQnR1ak1EMFhreWZRU1h4TERtb0x2TnBjNkFvM1Aw?=
 =?utf-8?B?T0VMSkJuRTg1cDl5dFV6dHlmQ3crVG0rL2ZIcFdkbERFUmpQRUNDWEYyZzhw?=
 =?utf-8?B?UlY1aWVUNjVUNVJLSmJWYmJoUkhDa2pUMEwwK1Izem9MeWhQa3JMKytaZG9a?=
 =?utf-8?B?SDdBb08vdUJLNWU4MXZpVXNFNnFMNjNkNUVXNWVCcVZuZUV0UFZFZ1pLQVRF?=
 =?utf-8?B?ZjcrSTZVWXZGeEw3dUdLd1ZXQzZYSVdWUndFejR3dWVXazdHY1RJV25pZXRD?=
 =?utf-8?Q?OWQxwfQhDHDHOe3HhM7wy93Xb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fda934-5ce5-4275-6082-08dd3afab16a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 15:37:35.2708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhGrE4wUvGWeF1gmAqYC0ZapW9aW8DSW249yQ2GFG6K8yEsM/VTTxoOTKiCySGgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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

Am 22.01.25 um 16:23 schrieb Philipp Stanner:
> On Wed, 2025-01-22 at 16:06 +0100, Christian König wrote:
>> Am 22.01.25 um 15:48 schrieb Philipp Stanner:
>>> On Wed, 2025-01-22 at 15:34 +0100, Christian König wrote:
>>>> Am 22.01.25 um 15:08 schrieb Philipp Stanner:
>>>>> drm_sched_init() has a great many parameters and upcoming new
>>>>> functionality for the scheduler might add even more. Generally,
>>>>> the
>>>>> great number of parameters reduces readability and has already
>>>>> caused
>>>>> one missnaming in:
>>>>>
>>>>> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
>>>>> nouveau_sched_init()").
>>>>>
>>>>> Introduce a new struct for the scheduler init parameters and
>>>>> port
>>>>> all
>>>>> users.
>>>>>
>>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>>> ---
>>>>> Howdy,
>>>>>
>>>>> I have a patch-series in the pipe that will add a `flags`
>>>>> argument
>>>>> to
>>>>> drm_sched_init(). I thought it would be wise to first rework
>>>>> the
>>>>> API as
>>>>> detailed in this patch. It's really a lot of parameters by now,
>>>>> and
>>>>> I
>>>>> would expect that it might get more and more over the years for
>>>>> special
>>>>> use cases etc.
>>>>>
>>>>> Regards,
>>>>> P.
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  21 +++-
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  20 ++-
>>>>>     drivers/gpu/drm/imagination/pvr_queue.c    |  21 +++-
>>>>>     drivers/gpu/drm/lima/lima_sched.c          |  21 +++-
>>>>>     drivers/gpu/drm/msm/msm_ringbuffer.c       |  22 ++--
>>>>>     drivers/gpu/drm/nouveau/nouveau_sched.c    |  20 ++-
>>>>>     drivers/gpu/drm/panfrost/panfrost_job.c    |  22 ++--
>>>>>     drivers/gpu/drm/panthor/panthor_mmu.c      |  18 ++-
>>>>>     drivers/gpu/drm/panthor/panthor_sched.c    |  23 ++--
>>>>>     drivers/gpu/drm/scheduler/sched_main.c     |  53 +++-----
>>>>>     drivers/gpu/drm/v3d/v3d_sched.c            | 135
>>>>> +++++++++++++++-
>>>>> -----
>>>>>     drivers/gpu/drm/xe/xe_execlist.c           |  20 ++-
>>>>>     drivers/gpu/drm/xe/xe_gpu_scheduler.c      |  19 ++-
>>>>>     include/drm/gpu_scheduler.h                |  35 +++++-
>>>>>     14 files changed, 311 insertions(+), 139 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> index cd4fac120834..c1f03eb5f5ea 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>> @@ -2821,6 +2821,9 @@ static int
>>>>> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>     {
>>>>>     	long timeout;
>>>>>     	int r, i;
>>>>> +	struct drm_sched_init_params params;
>>>> Please keep the reverse xmas tree ordering for variable
>>>> declaration.
>>>> E.g. long lines first and variables like "i" and "r" last.
>>> Okay dokay
>>>
>>>> Apart from that looks like a good idea to me.
>>>>
>>>>
>>>>> +
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>>     
>>>>>     	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>>>     		struct amdgpu_ring *ring = adev->rings[i];
>>>>> @@ -2844,12 +2847,18 @@ static int
>>>>> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>>>     			break;
>>>>>     		}
>>>>>     
>>>>> -		r = drm_sched_init(&ring->sched,
>>>>> &amdgpu_sched_ops, NULL,
>>>>> -				   DRM_SCHED_PRIORITY_COUNT,
>>>>> -				   ring->num_hw_submission, 0,
>>>>> -				   timeout, adev-
>>>>>> reset_domain-
>>>>>> wq,
>>>>> -				   ring->sched_score, ring-
>>>>>> name,
>>>>> -				   adev->dev);
>>>>> +		params.ops = &amdgpu_sched_ops;
>>>>> +		params.submit_wq = NULL; /* Use the system_wq.
>>>>> */
>>>>> +		params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +		params.credit_limit = ring->num_hw_submission;
>>>>> +		params.hang_limit = 0;
>>>> Could we please remove the hang limit as first step to get this
>>>> awful
>>>> feature deprecated?
>>> Remove it? From the struct you mean?
>>>
>>> We can mark it as deprecated in the docstring of the new struct.
>>> That's
>>> what you mean, don't you?
>> No, the function using this parameter already deprecated. What I
>> meant
>> is to start to completely remove this feature.
>>
>> The hang_limit basically says how often the scheduler should try to
>> run
>> a job over and over again before giving up.
> Agreed, it should be removed.
>
> But let me do that in a separate patch after this one is merged, and
> just hint at the deprecation in the arg in the struct for now; it's
> kind of unrelated to the init()-rework I'm doing here, ack?

Works for me.

Regards,
Christian.

>
>> And we already agreed that trying the same thing over and over again
>> and
>> expecting different results is the definition of insanity :)
> I'll quote you (and Einstein) with that if I ever give a presentation
> about the scheduler ;p
>
> P.
>
>> So my suggestion is to drop the parameter and drop the job as soon as
>> it
>> caused a timeout.
>>
>> Regards,
>> Christian.
>>
>>> P.
>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>> +		params.timeout = timeout;
>>>>> +		params.timeout_wq = adev->reset_domain->wq;
>>>>> +		params.score = ring->sched_score;
>>>>> +		params.name = ring->name;
>>>>> +		params.dev = adev->dev;
>>>>> +
>>>>> +		r = drm_sched_init(&ring->sched, &params);
>>>>>     		if (r) {
>>>>>     			DRM_ERROR("Failed to create scheduler
>>>>> on
>>>>> ring %s.\n",
>>>>>     				  ring->name);
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> index 5b67eda122db..7d8517f1963e 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> @@ -145,12 +145,22 @@ int etnaviv_sched_push_job(struct
>>>>> etnaviv_gem_submit *submit)
>>>>>     int etnaviv_sched_init(struct etnaviv_gpu *gpu)
>>>>>     {
>>>>>     	int ret;
>>>>> +	struct drm_sched_init_params params;
>>>>>     
>>>>> -	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
>>>>> NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     etnaviv_hw_jobs_limit,
>>>>> etnaviv_job_hang_limit,
>>>>> -			     msecs_to_jiffies(500), NULL,
>>>>> NULL,
>>>>> -			     dev_name(gpu->dev), gpu->dev);
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>> +	params.ops = &etnaviv_sched_ops;
>>>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params.credit_limit = etnaviv_hw_jobs_limit;
>>>>> +	params.hang_limit = etnaviv_job_hang_limit;
>>>>> +	params.timeout = msecs_to_jiffies(500);
>>>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params.score = NULL;
>>>>> +	params.name = dev_name(gpu->dev);
>>>>> +	params.dev = gpu->dev;
>>>>> +
>>>>> +	ret = drm_sched_init(&gpu->sched, &params);
>>>>>     	if (ret)
>>>>>     		return ret;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
>>>>> b/drivers/gpu/drm/imagination/pvr_queue.c
>>>>> index c4f08432882b..03a2ce1a88e7 100644
>>>>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>>>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>>>>> @@ -1211,10 +1211,13 @@ struct pvr_queue
>>>>> *pvr_queue_create(struct
>>>>> pvr_context *ctx,
>>>>>     	};
>>>>>     	struct pvr_device *pvr_dev = ctx->pvr_dev;
>>>>>     	struct drm_gpu_scheduler *sched;
>>>>> +	struct drm_sched_init_params sched_params;
>>>>>     	struct pvr_queue *queue;
>>>>>     	int ctx_state_size, err;
>>>>>     	void *cpu_map;
>>>>>     
>>>>> +	memset(&sched_params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	if (WARN_ON(type >= sizeof(props)))
>>>>>     		return ERR_PTR(-EINVAL);
>>>>>     
>>>>> @@ -1282,12 +1285,18 @@ struct pvr_queue
>>>>> *pvr_queue_create(struct
>>>>> pvr_context *ctx,
>>>>>     
>>>>>     	queue->timeline_ufo.value = cpu_map;
>>>>>     
>>>>> -	err = drm_sched_init(&queue->scheduler,
>>>>> -			     &pvr_queue_sched_ops,
>>>>> -			     pvr_dev->sched_wq, 1, 64 * 1024,
>>>>> 1,
>>>>> -			     msecs_to_jiffies(500),
>>>>> -			     pvr_dev->sched_wq, NULL, "pvr-
>>>>> queue",
>>>>> -			     pvr_dev->base.dev);
>>>>> +	sched_params.ops = &pvr_queue_sched_ops;
>>>>> +	sched_params.submit_wq = pvr_dev->sched_wq;
>>>>> +	sched_params.num_rqs = 1;
>>>>> +	sched_params.credit_limit = 64 * 1024;
>>>>> +	sched_params.hang_limit = 1;
>>>>> +	sched_params.timeout = msecs_to_jiffies(500);
>>>>> +	sched_params.timeout_wq = pvr_dev->sched_wq;
>>>>> +	sched_params.score = NULL;
>>>>> +	sched_params.name = "pvr-queue";
>>>>> +	sched_params.dev = pvr_dev->base.dev;
>>>>> +
>>>>> +	err = drm_sched_init(&queue->scheduler,
>>>>> &sched_params);
>>>>>     	if (err)
>>>>>     		goto err_release_ufo;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c
>>>>> b/drivers/gpu/drm/lima/lima_sched.c
>>>>> index b40c90e97d7e..a64c50fb6d1e 100644
>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>> @@ -513,20 +513,29 @@ static void
>>>>> lima_sched_recover_work(struct
>>>>> work_struct *work)
>>>>>     
>>>>>     int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const
>>>>> char
>>>>> *name)
>>>>>     {
>>>>> +	struct drm_sched_init_params params;
>>>>>     	unsigned int timeout = lima_sched_timeout_ms > 0 ?
>>>>>     			       lima_sched_timeout_ms : 10000;
>>>>>     
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	pipe->fence_context = dma_fence_context_alloc(1);
>>>>>     	spin_lock_init(&pipe->fence_lock);
>>>>>     
>>>>>     	INIT_WORK(&pipe->recover_work,
>>>>> lima_sched_recover_work);
>>>>>     
>>>>> -	return drm_sched_init(&pipe->base, &lima_sched_ops,
>>>>> NULL,
>>>>> -			      DRM_SCHED_PRIORITY_COUNT,
>>>>> -			      1,
>>>>> -			      lima_job_hang_limit,
>>>>> -			      msecs_to_jiffies(timeout), NULL,
>>>>> -			      NULL, name, pipe->ldev->dev);
>>>>> +	params.ops = &lima_sched_ops;
>>>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params.credit_limit = 1;
>>>>> +	params.hang_limit = lima_job_hang_limit;
>>>>> +	params.timeout = msecs_to_jiffies(timeout);
>>>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params.score = NULL;
>>>>> +	params.name = name;
>>>>> +	params.dev = pipe->ldev->dev;
>>>>> +
>>>>> +	return drm_sched_init(&pipe->base, &params);
>>>>>     }
>>>>>     
>>>>>     void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
>>>>> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> index c803556a8f64..49a2c7422dc6 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
>>>>> @@ -59,11 +59,13 @@ static const struct drm_sched_backend_ops
>>>>> msm_sched_ops = {
>>>>>     struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu
>>>>> *gpu,
>>>>> int id,
>>>>>     		void *memptrs, uint64_t memptrs_iova)
>>>>>     {
>>>>> +	struct drm_sched_init_params params;
>>>>>     	struct msm_ringbuffer *ring;
>>>>> -	long sched_timeout;
>>>>>     	char name[32];
>>>>>     	int ret;
>>>>>     
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is
>>>>> a
>>>>> power of 2 */
>>>>>     	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
>>>>>     
>>>>> @@ -95,13 +97,19 @@ struct msm_ringbuffer
>>>>> *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>>>>>     	ring->memptrs = memptrs;
>>>>>     	ring->memptrs_iova = memptrs_iova;
>>>>>     
>>>>> -	 /* currently managing hangcheck ourselves: */
>>>>> -	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>>>>> +	params.ops = &msm_sched_ops;
>>>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params.credit_limit = num_hw_submissions;
>>>>> +	params.hang_limit = 0;
>>>>> +	/* currently managing hangcheck ourselves: */
>>>>> +	params.timeout = MAX_SCHEDULE_TIMEOUT;
>>>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params.score = NULL;
>>>>> +	params.name = to_msm_bo(ring->bo)->name;
>>>>> +	params.dev = gpu->dev->dev;
>>>>>     
>>>>> -	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>>>> NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     num_hw_submissions, 0,
>>>>> sched_timeout,
>>>>> -			     NULL, NULL, to_msm_bo(ring->bo)-
>>>>>> name, gpu->dev->dev);
>>>>> +	ret = drm_sched_init(&ring->sched, &params);
>>>>>     	if (ret) {
>>>>>     		goto fail;
>>>>>     	}
>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> index 4412f2711fb5..f20c2e612750 100644
>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>>>> @@ -404,9 +404,11 @@ nouveau_sched_init(struct nouveau_sched
>>>>> *sched, struct nouveau_drm *drm,
>>>>>     {
>>>>>     	struct drm_gpu_scheduler *drm_sched = &sched->base;
>>>>>     	struct drm_sched_entity *entity = &sched->entity;
>>>>> -	const long timeout =
>>>>> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>>>>> +	struct drm_sched_init_params params;
>>>>>     	int ret;
>>>>>     
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	if (!wq) {
>>>>>     		wq = alloc_workqueue("nouveau_sched_wq_%d", 0,
>>>>> WQ_MAX_ACTIVE,
>>>>>     				     current->pid);
>>>>> @@ -416,10 +418,18 @@ nouveau_sched_init(struct nouveau_sched
>>>>> *sched, struct nouveau_drm *drm,
>>>>>     		sched->wq = wq;
>>>>>     	}
>>>>>     
>>>>> -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops,
>>>>> wq,
>>>>> -			     NOUVEAU_SCHED_PRIORITY_COUNT,
>>>>> -			     credit_limit, 0, timeout,
>>>>> -			     NULL, NULL, "nouveau_sched", drm-
>>>>>> dev->dev);
>>>>> +	params.ops = &nouveau_sched_ops;
>>>>> +	params.submit_wq = wq;
>>>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params.credit_limit = credit_limit;
>>>>> +	params.hang_limit = 0;
>>>>> +	params.timeout =
>>>>> msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
>>>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params.score = NULL;
>>>>> +	params.name = "nouveau_sched";
>>>>> +	params.dev = drm->dev->dev;
>>>>> +
>>>>> +	ret = drm_sched_init(drm_sched, &params);
>>>>>     	if (ret)
>>>>>     		goto fail_wq;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> index 9b8e82fb8bc4..6b509ff446b5 100644
>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> @@ -836,10 +836,13 @@ static irqreturn_t
>>>>> panfrost_job_irq_handler(int irq, void *data)
>>>>>     
>>>>>     int panfrost_job_init(struct panfrost_device *pfdev)
>>>>>     {
>>>>> +	struct drm_sched_init_params params;
>>>>>     	struct panfrost_job_slot *js;
>>>>>     	unsigned int nentries = 2;
>>>>>     	int ret, j;
>>>>>     
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	/* All GPUs have two entries per queue, but without
>>>>> jobchain
>>>>>     	 * disambiguation stopping the right job in the close
>>>>> path
>>>>> is tricky,
>>>>>     	 * so let's just advertise one entry in that case.
>>>>> @@ -872,16 +875,21 @@ int panfrost_job_init(struct
>>>>> panfrost_device
>>>>> *pfdev)
>>>>>     	if (!pfdev->reset.wq)
>>>>>     		return -ENOMEM;
>>>>>     
>>>>> +	params.ops = &panfrost_sched_ops;
>>>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params.num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params.credit_limit = nentries;
>>>>> +	params.hang_limit = 0;
>>>>> +	params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>>>>> +	params.timeout_wq = pfdev->reset.wq;
>>>>> +	params.score = NULL;
>>>>> +	params.name = "pan_js";
>>>>> +	params.dev = pfdev->dev;
>>>>> +
>>>>>     	for (j = 0; j < NUM_JOB_SLOTS; j++) {
>>>>>     		js->queue[j].fence_context =
>>>>> dma_fence_context_alloc(1);
>>>>>     
>>>>> -		ret = drm_sched_init(&js->queue[j].sched,
>>>>> -				     &panfrost_sched_ops,
>>>>> NULL,
>>>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>>>> -				     nentries, 0,
>>>>> -				
>>>>> msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>> -				     pfdev->reset.wq,
>>>>> -				     NULL, "pan_js", pfdev-
>>>>>> dev);
>>>>> +		ret = drm_sched_init(&js->queue[j].sched,
>>>>> &params);
>>>>>     		if (ret) {
>>>>>     			dev_err(pfdev->dev, "Failed to create
>>>>> scheduler: %d.", ret);
>>>>>     			goto err_sched;
>>>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
>>>>> b/drivers/gpu/drm/panthor/panthor_mmu.c
>>>>> index a49132f3778b..4362442cbfd8 100644
>>>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>>>> @@ -2268,6 +2268,7 @@ panthor_vm_create(struct panthor_device
>>>>> *ptdev, bool for_mcu,
>>>>>     	u64 full_va_range = 1ull << va_bits;
>>>>>     	struct drm_gem_object *dummy_gem;
>>>>>     	struct drm_gpu_scheduler *sched;
>>>>> +	struct drm_sched_init_params sched_params;
>>>>>     	struct io_pgtable_cfg pgtbl_cfg;
>>>>>     	u64 mair, min_va, va_range;
>>>>>     	struct panthor_vm *vm;
>>>>> @@ -2284,6 +2285,8 @@ panthor_vm_create(struct panthor_device
>>>>> *ptdev, bool for_mcu,
>>>>>     		goto err_free_vm;
>>>>>     	}
>>>>>     
>>>>> +	memset(&sched_params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	mutex_init(&vm->heaps.lock);
>>>>>     	vm->for_mcu = for_mcu;
>>>>>     	vm->ptdev = ptdev;
>>>>> @@ -2325,11 +2328,18 @@ panthor_vm_create(struct panthor_device
>>>>> *ptdev, bool for_mcu,
>>>>>     		goto err_mm_takedown;
>>>>>     	}
>>>>>     
>>>>> +	sched_params.ops = &panthor_vm_bind_ops;
>>>>> +	sched_params.submit_wq = ptdev->mmu->vm.wq;
>>>>> +	sched_params.num_rqs = 1;
>>>>> +	sched_params.credit_limit = 1;
>>>>> +	sched_params.hang_limit = 0;
>>>>>     	/* Bind operations are synchronous for now, no timeout
>>>>> needed. */
>>>>> -	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
>>>>> ptdev->mmu->vm.wq,
>>>>> -			     1, 1, 0,
>>>>> -			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
>>>>> -			     "panthor-vm-bind", ptdev-
>>>>>> base.dev);
>>>>> +	sched_params.timeout = MAX_SCHEDULE_TIMEOUT;
>>>>> +	sched_params.timeout_wq = NULL; /* Use the system_wq.
>>>>> */
>>>>> +	sched_params.score = NULL;
>>>>> +	sched_params.name = "panthor-vm-bind";
>>>>> +	sched_params.dev = ptdev->base.dev;
>>>>> +	ret = drm_sched_init(&vm->sched, &sched_params);
>>>>>     	if (ret)
>>>>>     		goto err_free_io_pgtable;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
>>>>> b/drivers/gpu/drm/panthor/panthor_sched.c
>>>>> index ef4bec7ff9c7..a324346d302f 100644
>>>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>>>> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
>>>>> *group,
>>>>>     		   const struct drm_panthor_queue_create
>>>>> *args)
>>>>>     {
>>>>>     	struct drm_gpu_scheduler *drm_sched;
>>>>> +	struct drm_sched_init_params sched_params;
>>>>>     	struct panthor_queue *queue;
>>>>>     	int ret;
>>>>>     
>>>>> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
>>>>> *group,
>>>>>     	if (!queue)
>>>>>     		return ERR_PTR(-ENOMEM);
>>>>>     
>>>>> +	memset(&sched_params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	queue->fence_ctx.id = dma_fence_context_alloc(1);
>>>>>     	spin_lock_init(&queue->fence_ctx.lock);
>>>>>     	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
>>>>> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group
>>>>> *group,
>>>>>     	if (ret)
>>>>>     		goto err_free_queue;
>>>>>     
>>>>> +	sched_params.ops = &panthor_queue_sched_ops;
>>>>> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
>>>>> +	sched_params.num_rqs = 1;
>>>>>     	/*
>>>>> -	 * Credit limit argument tells us the total number of
>>>>> instructions
>>>>> +	 * The credit limit argument tells us the total number
>>>>> of
>>>>> instructions
>>>>>     	 * across all CS slots in the ringbuffer, with some
>>>>> jobs
>>>>> requiring
>>>>>     	 * twice as many as others, depending on their
>>>>> profiling
>>>>> status.
>>>>>     	 */
>>>>> -	ret = drm_sched_init(&queue->scheduler,
>>>>> &panthor_queue_sched_ops,
>>>>> -			     group->ptdev->scheduler->wq, 1,
>>>>> -			     args->ringbuf_size / sizeof(u64),
>>>>> -			     0,
>>>>> msecs_to_jiffies(JOB_TIMEOUT_MS),
>>>>> -			     group->ptdev->reset.wq,
>>>>> -			     NULL, "panthor-queue", group-
>>>>>> ptdev-
>>>>>> base.dev);
>>>>> +	sched_params.credit_limit = args->ringbuf_size /
>>>>> sizeof(u64);
>>>>> +	sched_params.hang_limit = 0;
>>>>> +	sched_params.timeout =
>>>>> msecs_to_jiffies(JOB_TIMEOUT_MS);
>>>>> +	sched_params.timeout_wq = group->ptdev->reset.wq;
>>>>> +	sched_params.score = NULL;
>>>>> +	sched_params.name = "panthor-queue";
>>>>> +	sched_params.dev = group->ptdev->base.dev;
>>>>> +
>>>>> +	ret = drm_sched_init(&queue->scheduler,
>>>>> &sched_params);
>>>>>     	if (ret)
>>>>>     		goto err_free_queue;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 57da84908752..27db748a5269 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -1240,40 +1240,25 @@ static void
>>>>> drm_sched_run_job_work(struct
>>>>> work_struct *w)
>>>>>      * drm_sched_init - Init a gpu scheduler instance
>>>>>      *
>>>>>      * @sched: scheduler instance
>>>>> - * @ops: backend operations for this scheduler
>>>>> - * @submit_wq: workqueue to use for submission. If NULL, an
>>>>> ordered wq is
>>>>> - *	       allocated and used
>>>>> - * @num_rqs: number of runqueues, one for each priority, up to
>>>>> DRM_SCHED_PRIORITY_COUNT
>>>>> - * @credit_limit: the number of credits this scheduler can
>>>>> hold
>>>>> from all jobs
>>>>> - * @hang_limit: number of times to allow a job to hang before
>>>>> dropping it
>>>>> - * @timeout: timeout value in jiffies for the scheduler
>>>>> - * @timeout_wq: workqueue to use for timeout work. If NULL,
>>>>> the
>>>>> system_wq is
>>>>> - *		used
>>>>> - * @score: optional score atomic shared with other schedulers
>>>>> - * @name: name used for debugging
>>>>> - * @dev: target &struct device
>>>>> + * @params: scheduler initialization parameters
>>>>>      *
>>>>>      * Return 0 on success, otherwise error code.
>>>>>      */
>>>>>     int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>> -		   const struct drm_sched_backend_ops *ops,
>>>>> -		   struct workqueue_struct *submit_wq,
>>>>> -		   u32 num_rqs, u32 credit_limit, unsigned int
>>>>> hang_limit,
>>>>> -		   long timeout, struct workqueue_struct
>>>>> *timeout_wq,
>>>>> -		   atomic_t *score, const char *name, struct
>>>>> device *dev)
>>>>> +		const struct drm_sched_init_params *params)
>>>>>     {
>>>>>     	int i;
>>>>>     
>>>>> -	sched->ops = ops;
>>>>> -	sched->credit_limit = credit_limit;
>>>>> -	sched->name = name;
>>>>> -	sched->timeout = timeout;
>>>>> -	sched->timeout_wq = timeout_wq ? : system_wq;
>>>>> -	sched->hang_limit = hang_limit;
>>>>> -	sched->score = score ? score : &sched->_score;
>>>>> -	sched->dev = dev;
>>>>> +	sched->ops = params->ops;
>>>>> +	sched->credit_limit = params->credit_limit;
>>>>> +	sched->name = params->name;
>>>>> +	sched->timeout = params->timeout;
>>>>> +	sched->timeout_wq = params->timeout_wq ? : system_wq;
>>>>> +	sched->hang_limit = params->hang_limit;
>>>>> +	sched->score = params->score ? params->score : &sched-
>>>>>> _score;
>>>>> +	sched->dev = params->dev;
>>>>>     
>>>>> -	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>>>> +	if (params->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
>>>>>     		/* This is a gross violation--tell drivers
>>>>> what
>>>>> the  problem is.
>>>>>     		 */
>>>>>     		drm_err(sched, "%s: num_rqs cannot be greater
>>>>> than
>>>>> DRM_SCHED_PRIORITY_COUNT\n",
>>>>> @@ -1288,16 +1273,16 @@ int drm_sched_init(struct
>>>>> drm_gpu_scheduler
>>>>> *sched,
>>>>>     		return 0;
>>>>>     	}
>>>>>     
>>>>> -	if (submit_wq) {
>>>>> -		sched->submit_wq = submit_wq;
>>>>> +	if (params->submit_wq) {
>>>>> +		sched->submit_wq = params->submit_wq;
>>>>>     		sched->own_submit_wq = false;
>>>>>     	} else {
>>>>>     #ifdef CONFIG_LOCKDEP
>>>>> -		sched->submit_wq =
>>>>> alloc_ordered_workqueue_lockdep_map(name,
>>>>> -
>>>>> 							
>>>>> 	       WQ_MEM_RECLAIM,
>>>>> -
>>>>> 							
>>>>> 	       &drm_sched_lockdep_map);
>>>>> +		sched->submit_wq =
>>>>> alloc_ordered_workqueue_lockdep_map(
>>>>> +					params->name,
>>>>> WQ_MEM_RECLAIM,
>>>>> +					&drm_sched_lockdep_map
>>>>> );
>>>>>     #else
>>>>> -		sched->submit_wq =
>>>>> alloc_ordered_workqueue(name,
>>>>> WQ_MEM_RECLAIM);
>>>>> +		sched->submit_wq =
>>>>> alloc_ordered_workqueue(params-
>>>>>> name, WQ_MEM_RECLAIM);
>>>>>     #endif
>>>>>     		if (!sched->submit_wq)
>>>>>     			return -ENOMEM;
>>>>> @@ -1305,11 +1290,11 @@ int drm_sched_init(struct
>>>>> drm_gpu_scheduler
>>>>> *sched,
>>>>>     		sched->own_submit_wq = true;
>>>>>     	}
>>>>>     
>>>>> -	sched->sched_rq = kmalloc_array(num_rqs,
>>>>> sizeof(*sched-
>>>>>> sched_rq),
>>>>> +	sched->sched_rq = kmalloc_array(params->num_rqs,
>>>>> sizeof(*sched->sched_rq),
>>>>>     					GFP_KERNEL |
>>>>> __GFP_ZERO);
>>>>>     	if (!sched->sched_rq)
>>>>>     		goto Out_check_own;
>>>>> -	sched->num_rqs = num_rqs;
>>>>> +	sched->num_rqs = params->num_rqs;
>>>>>     	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched-
>>>>>> num_rqs;
>>>>> i++) {
>>>>>     		sched->sched_rq[i] = kzalloc(sizeof(*sched-
>>>>>> sched_rq[i]), GFP_KERNEL);
>>>>>     		if (!sched->sched_rq[i])
>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> b/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> index 99ac4995b5a1..716e6d074d87 100644
>>>>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>>>>> @@ -814,67 +814,124 @@ static const struct
>>>>> drm_sched_backend_ops
>>>>> v3d_cpu_sched_ops = {
>>>>>     	.free_job = v3d_cpu_job_free
>>>>>     };
>>>>>     
>>>>> +/*
>>>>> + * v3d's scheduler instances are all identical, except for ops
>>>>> and
>>>>> name.
>>>>> + */
>>>>> +static void
>>>>> +v3d_common_sched_init(struct drm_sched_init_params *params,
>>>>> struct
>>>>> device *dev)
>>>>> +{
>>>>> +	memset(params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>> +	params->submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params->num_rqs = DRM_SCHED_PRIORITY_COUNT;
>>>>> +	params->credit_limit = 1;
>>>>> +	params->hang_limit = 0;
>>>>> +	params->timeout = msecs_to_jiffies(500);
>>>>> +	params->timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params->score = NULL;
>>>>> +	params->dev = dev;
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_bin_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_bin_sched_ops;
>>>>> +	params.name = "v3d_bin";
>>>>> +
>>>>> +	return drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_render_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_render_sched_ops;
>>>>> +	params.name = "v3d_render";
>>>>> +
>>>>> +	return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_tfu_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_tfu_sched_ops;
>>>>> +	params.name = "v3d_tfu";
>>>>> +
>>>>> +	return drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_csd_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_csd_sched_ops;
>>>>> +	params.name = "v3d_csd";
>>>>> +
>>>>> +	return drm_sched_init(&v3d->queue[V3D_CSD].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_cache_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_cache_clean_sched_ops;
>>>>> +	params.name = "v3d_cache_clean";
>>>>> +
>>>>> +	return drm_sched_init(&v3d-
>>>>>> queue[V3D_CACHE_CLEAN].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +v3d_cpu_sched_init(struct v3d_dev *v3d)
>>>>> +{
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>> +	v3d_common_sched_init(&params, v3d->drm.dev);
>>>>> +	params.ops = &v3d_cpu_sched_ops;
>>>>> +	params.name = "v3d_cpu";
>>>>> +
>>>>> +	return drm_sched_init(&v3d->queue[V3D_CPU].sched,
>>>>> &params);
>>>>> +}
>>>>> +
>>>>>     int
>>>>>     v3d_sched_init(struct v3d_dev *v3d)
>>>>>     {
>>>>> -	int hw_jobs_limit = 1;
>>>>> -	int job_hang_limit = 0;
>>>>> -	int hang_limit_ms = 500;
>>>>>     	int ret;
>>>>>     
>>>>> -	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
>>>>> -			     &v3d_bin_sched_ops, NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     hw_jobs_limit, job_hang_limit,
>>>>> -			     msecs_to_jiffies(hang_limit_ms),
>>>>> NULL,
>>>>> -			     NULL, "v3d_bin", v3d->drm.dev);
>>>>> +	ret = v3d_bin_sched_init(v3d);
>>>>>     	if (ret)
>>>>>     		return ret;
>>>>>     
>>>>> -	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
>>>>> -			     &v3d_render_sched_ops, NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     hw_jobs_limit, job_hang_limit,
>>>>> -			     msecs_to_jiffies(hang_limit_ms),
>>>>> NULL,
>>>>> -			     NULL, "v3d_render", v3d-
>>>>>> drm.dev);
>>>>> +	ret = v3d_render_sched_init(v3d);
>>>>>     	if (ret)
>>>>>     		goto fail;
>>>>>     
>>>>> -	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
>>>>> -			     &v3d_tfu_sched_ops, NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     hw_jobs_limit, job_hang_limit,
>>>>> -			     msecs_to_jiffies(hang_limit_ms),
>>>>> NULL,
>>>>> -			     NULL, "v3d_tfu", v3d->drm.dev);
>>>>> +	ret = v3d_tfu_sched_init(v3d);
>>>>>     	if (ret)
>>>>>     		goto fail;
>>>>>     
>>>>>     	if (v3d_has_csd(v3d)) {
>>>>> -		ret = drm_sched_init(&v3d-
>>>>>> queue[V3D_CSD].sched,
>>>>> -				     &v3d_csd_sched_ops, NULL,
>>>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>>>> -				     hw_jobs_limit,
>>>>> job_hang_limit,
>>>>> -				
>>>>> msecs_to_jiffies(hang_limit_ms), NULL,
>>>>> -				     NULL, "v3d_csd", v3d-
>>>>>> drm.dev);
>>>>> +		ret = v3d_csd_sched_init(v3d);
>>>>>     		if (ret)
>>>>>     			goto fail;
>>>>>     
>>>>> -		ret = drm_sched_init(&v3d-
>>>>>> queue[V3D_CACHE_CLEAN].sched,
>>>>> -				
>>>>> &v3d_cache_clean_sched_ops,
>>>>> NULL,
>>>>> -				     DRM_SCHED_PRIORITY_COUNT,
>>>>> -				     hw_jobs_limit,
>>>>> job_hang_limit,
>>>>> -				
>>>>> msecs_to_jiffies(hang_limit_ms), NULL,
>>>>> -				     NULL, "v3d_cache_clean",
>>>>> v3d-
>>>>>> drm.dev);
>>>>> +		ret = v3d_cache_sched_init(v3d);
>>>>>     		if (ret)
>>>>>     			goto fail;
>>>>>     	}
>>>>>     
>>>>> -	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
>>>>> -			     &v3d_cpu_sched_ops, NULL,
>>>>> -			     DRM_SCHED_PRIORITY_COUNT,
>>>>> -			     1, job_hang_limit,
>>>>> -			     msecs_to_jiffies(hang_limit_ms),
>>>>> NULL,
>>>>> -			     NULL, "v3d_cpu", v3d->drm.dev);
>>>>> +	ret = v3d_cpu_sched_init(v3d);
>>>>>     	if (ret)
>>>>>     		goto fail;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c
>>>>> b/drivers/gpu/drm/xe/xe_execlist.c
>>>>> index a8c416a48812..7f29b7f04af4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>>>> @@ -332,10 +332,13 @@ static const struct drm_sched_backend_ops
>>>>> drm_sched_ops = {
>>>>>     static int execlist_exec_queue_init(struct xe_exec_queue *q)
>>>>>     {
>>>>>     	struct drm_gpu_scheduler *sched;
>>>>> +	struct drm_sched_init_params params;
>>>>>     	struct xe_execlist_exec_queue *exl;
>>>>>     	struct xe_device *xe = gt_to_xe(q->gt);
>>>>>     	int err;
>>>>>     
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>>     	xe_assert(xe, !xe_device_uc_enabled(xe));
>>>>>     
>>>>>     	drm_info(&xe->drm, "Enabling execlist submission (GuC
>>>>> submission disabled)\n");
>>>>> @@ -346,11 +349,18 @@ static int
>>>>> execlist_exec_queue_init(struct
>>>>> xe_exec_queue *q)
>>>>>     
>>>>>     	exl->q = q;
>>>>>     
>>>>> -	err = drm_sched_init(&exl->sched, &drm_sched_ops,
>>>>> NULL, 1,
>>>>> -			     q->lrc[0]->ring.size /
>>>>> MAX_JOB_SIZE_BYTES,
>>>>> -			     XE_SCHED_HANG_LIMIT,
>>>>> XE_SCHED_JOB_TIMEOUT,
>>>>> -			     NULL, NULL, q->hwe->name,
>>>>> -			     gt_to_xe(q->gt)->drm.dev);
>>>>> +	params.ops = &drm_sched_ops;
>>>>> +	params.submit_wq = NULL; /* Use the system_wq. */
>>>>> +	params.num_rqs = 1;
>>>>> +	params.credit_limit = q->lrc[0]->ring.size /
>>>>> MAX_JOB_SIZE_BYTES;
>>>>> +	params.hang_limit = XE_SCHED_HANG_LIMIT;
>>>>> +	params.timeout = XE_SCHED_JOB_TIMEOUT;
>>>>> +	params.timeout_wq = NULL; /* Use the system_wq. */
>>>>> +	params.score = NULL;
>>>>> +	params.name = q->hwe->name;
>>>>> +	params.dev = gt_to_xe(q->gt)->drm.dev;
>>>>> +
>>>>> +	err = drm_sched_init(&exl->sched, &params);
>>>>>     	if (err)
>>>>>     		goto err_free;
>>>>>     
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>>>> b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>>>> index 50361b4638f9..2129fee83f25 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>>>> @@ -63,13 +63,26 @@ int xe_sched_init(struct xe_gpu_scheduler
>>>>> *sched,
>>>>>     		  atomic_t *score, const char *name,
>>>>>     		  struct device *dev)
>>>>>     {
>>>>> +	struct drm_sched_init_params params;
>>>>> +
>>>>>     	sched->ops = xe_ops;
>>>>>     	INIT_LIST_HEAD(&sched->msgs);
>>>>>     	INIT_WORK(&sched->work_process_msg,
>>>>> xe_sched_process_msg_work);
>>>>>     
>>>>> -	return drm_sched_init(&sched->base, ops, submit_wq, 1,
>>>>> hw_submission,
>>>>> -			      hang_limit, timeout, timeout_wq,
>>>>> score, name,
>>>>> -			      dev);
>>>>> +	memset(&params, 0, sizeof(struct
>>>>> drm_sched_init_params));
>>>>> +
>>>>> +	params.ops = ops;
>>>>> +	params.submit_wq = submit_wq;
>>>>> +	params.num_rqs = 1;
>>>>> +	params.credit_limit = hw_submission;
>>>>> +	params.hang_limit = hang_limit;
>>>>> +	params.timeout = timeout;
>>>>> +	params.timeout_wq = timeout_wq;
>>>>> +	params.score = score;
>>>>> +	params.name = name;
>>>>> +	params.dev = dev;
>>>>> +
>>>>> +	return drm_sched_init(&sched->base, &params);
>>>>>     }
>>>>>     
>>>>>     void xe_sched_fini(struct xe_gpu_scheduler *sched)
>>>>> diff --git a/include/drm/gpu_scheduler.h
>>>>> b/include/drm/gpu_scheduler.h
>>>>> index 95e17504e46a..1a834ef43862 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
>>>>>     	struct device			*dev;
>>>>>     };
>>>>>     
>>>>> +/**
>>>>> + * struct drm_sched_init_params - parameters for initializing
>>>>> a
>>>>> DRM GPU scheduler
>>>>> + *
>>>>> + * @ops: backend operations provided by the driver
>>>>> + * @submit_wq: workqueue to use for submission. If NULL, an
>>>>> ordered wq is
>>>>> + *	       allocated and used
>>>>> + * @num_rqs: Number of run-queues. This is at most
>>>>> DRM_SCHED_PRIORITY_COUNT,
>>>>> + *           as there's usually one run-queue per priority,
>>>>> but
>>>>> could be less.
>>>>> + * @credit_limit: the number of credits this scheduler can
>>>>> hold
>>>>> from all jobs
>>>>> + * @hang_limit: number of times to allow a job to hang before
>>>>> dropping it
>>>>> + * @timeout: timeout value in jiffies for the scheduler
>>>>> + * @timeout_wq: workqueue to use for timeout work. If NULL,
>>>>> the
>>>>> system_wq is
>>>>> + *		used
>>>>> + * @score: optional score atomic shared with other schedulers
>>>>> + * @name: name used for debugging
>>>>> + * @dev: associated device. Used for debugging
>>>>> + */
>>>>> +struct drm_sched_init_params {
>>>>> +	const struct drm_sched_backend_ops *ops;
>>>>> +	struct workqueue_struct *submit_wq;
>>>>> +	struct workqueue_struct *timeout_wq;
>>>>> +	u32 num_rqs, credit_limit;
>>>>> +	unsigned int hang_limit;
>>>>> +	long timeout;
>>>>> +	atomic_t *score;
>>>>> +	const char *name;
>>>>> +	struct device *dev;
>>>>> +};
>>>>> +
>>>>>     int drm_sched_init(struct drm_gpu_scheduler *sched,
>>>>> -		   const struct drm_sched_backend_ops *ops,
>>>>> -		   struct workqueue_struct *submit_wq,
>>>>> -		   u32 num_rqs, u32 credit_limit, unsigned int
>>>>> hang_limit,
>>>>> -		   long timeout, struct workqueue_struct
>>>>> *timeout_wq,
>>>>> -		   atomic_t *score, const char *name, struct
>>>>> device *dev);
>>>>> +		const struct drm_sched_init_params *params);
>>>>>     
>>>>>     void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>     int drm_sched_job_init(struct drm_sched_job *job,

