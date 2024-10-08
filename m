Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E49940CE
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07B10E491;
	Tue,  8 Oct 2024 08:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="laIy7+Se";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEB410E1E3;
 Tue,  8 Oct 2024 08:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrKtN34pPeamJt0YXhR7R9J59BRXb8j7wv82U9AKul0LxPR0mHJRcYaTlRp8y0c9nua/AQkRleNSRS+lt5g+S5L+eqh+1R6LTE0HQprohAfqt1vKi6/TvliQmYWNMtlRJ+7hKbmHz6tamexXpRRdeN8X51IJ9S5TjjSsF9AhoRJV+UVHNMdobYP8zmpQ1q1nGe4Xx5iGpN/0Z8BNzeuiRQknUMc+v9yJA0VrcJctXMaXOnk0seaydeq6pDutMXWCss4G4UCA5w8wo7E3RWoEx8okqze15mvRCfNIHnCgJQpQwy0JErte9rzeEPXfSSh+wqDjcCGaoVQKc5inZi2Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSC5ZlYgWnqUhMMYy5Z3JXkBDijh2FJYn/f9x4vJeLc=;
 b=mJPZyT11ON+DjQICwlfU/YHXs73g4XeRy513E7VPqYGHSvQqYjEyR01kuBv6zm+d+zNkJE7loGJX0CJJEVK3+Q6DSz4TjdFrD2BmNxqbusR992Hvra/CkHnyG9nkFHgLxXGVyemFER9I+jGI0pj1qWh2RhaUKoBpjvfy979IwvGPucYDDxYBU0e/C0d4obULLnigEvbPg0awqkUnRdV0Z+KjtdAXPB8SSJsgwx12PyI8wtu38Ye8UrKH3DeLW7iKF/pQToJPTP7jElo+QVH+PFssMFK5w7y4qsp0VcogAD5Uv3B8vk5eNMvqrFsQkf814/lCtsK17cWQJbECpNAnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSC5ZlYgWnqUhMMYy5Z3JXkBDijh2FJYn/f9x4vJeLc=;
 b=laIy7+SecTuZ0rUvTkZxozjVLITMbZgiUfENy52ebcbwzry7A3TciXJ4U1QZ8AyUR7yvIyD8HcrxQQkwPMA8PerP4GBJjvudFVn0dfRgqsLRjAGWGBKTck621umQxYxgvDPtRGvG5NkyS2OSpZmcHNE/URqmIVh8Ll9plxUqnI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6813.namprd12.prod.outlook.com (2603:10b6:806:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Tue, 8 Oct
 2024 08:15:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 08:15:11 +0000
Message-ID: <139495eb-1b5f-45e9-a784-d291e5201adb@amd.com>
Date: Tue, 8 Oct 2024 10:15:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] drm/amdgpu: make process_name a flexible array
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com, jani.nikula@linux.intel.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com
References: <20241003124506.470931-1-pierre-eric.pelloux-prayer@amd.com>
 <20241003124506.470931-6-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241003124506.470931-6-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6813:EE_
X-MS-Office365-Filtering-Correlation-Id: 26f7e9b4-a1ad-45bd-206c-08dce771544a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkZLc0g3OWtYVDRoRGJvOHV5L2dvV0MwNVk2L3crZmhKa3RDdE9pMyt5RXVU?=
 =?utf-8?B?bjh1ekZvY3dOWDZ2UFRiK2loc3VXUjlKQTRqam5nWGdYZWVtSURSVlU2VHhj?=
 =?utf-8?B?YXlGS0RDdkRPcHpWdGhRRFk2OERkRW5Rdml1UUxuQUhBdHJra0kwVU1TSlBu?=
 =?utf-8?B?Zy9hMHhZdjVvb2N1QUtBRzc2dTNHMkJWNGRVMUNtNkFZRE1qR09tcDgxNmpt?=
 =?utf-8?B?Zmg0YmsrMDF0WmhacEJRaG5yZXVKV0VPYkx4M1h2NUdQdG9Ca0t5UW9BRHIx?=
 =?utf-8?B?bzdmMEdmaXI1Q1ZMa0hBYko1RUtvYk5WcWt5cHFlNHRHWTE0UU1wWVczb05w?=
 =?utf-8?B?Q21PcjVwU0FsdHNKUGUyV3pId3podGt0UlE5aUZwSEpWU0ltSTEwbDIzMjNm?=
 =?utf-8?B?bFBpL2JRbEpaZHhTNjRYV08xYWttTm1sRDVIeGJnemRuaitKNUM2Y21RU0Er?=
 =?utf-8?B?blVoWjV2S1dDSklxRytNTGNzbmYvWXM0VC9MOXlFT1pJVFpXUlpJSlNPSVJU?=
 =?utf-8?B?MkFqVmJqVHVSR2pTY0M3T0F4bU91bWEwZldVZmtHUm1BQko0NEo4UFdNZVdI?=
 =?utf-8?B?QVpwSUZHQnc5TGhkZlBZYzgxRlJIUkVoSUkzOFl2WGVTSlplaU1lZmJIN0xq?=
 =?utf-8?B?R2RERG5hSjJieU5ZMHdxOXVHbHgzVGpFOElXVWZRYnBzbnRJRTJlR1lSbHpt?=
 =?utf-8?B?ekY5MURteVVwZ3ZTU2NiWVZiTUsvUjJxYUVtdy9XSzEwYk54Y3pkbGd5VlI0?=
 =?utf-8?B?eXcwcUxxWDJtUS8xMlArRUQzL3NHOENJR1RQd3ZPa0ZseGJJUHJxbEc1UGlT?=
 =?utf-8?B?a2E3SlpyZ1J0dDdEejRhd2oyRXVpcGdSY3g1YVRDcmJMNWRiRGdLYkk4ZkxM?=
 =?utf-8?B?VUt3VmdlK2tsekF3M08xSHErRlBWa1BaOGU0UkFwV3RiWnU3bnB1V3hPbjRq?=
 =?utf-8?B?VTFHbzRobjA1d09LTHJjYVpQN1JqNUh1TE4zQkhOSXFmZGVMSzZWT1ZabGhK?=
 =?utf-8?B?L0gxM1M4cnhvVXRRR05pYmhpcTlYMFNjREdQbnBpNHJYaUxDQkxMTTE0WkRR?=
 =?utf-8?B?K0ExcUZzdVFod3orYVozSVJvTVdjWG1zSW5ZMHRlYUxRRHRVbHdHdEN5bEtL?=
 =?utf-8?B?MHJkNzZCcTJ1Wm43UGQ3RUs1anpycncwWmp5K0o5c1N6TERvSGxObXBtSFFp?=
 =?utf-8?B?Z1JxbmE5UGxBT216ZFQrV0dSczFoWGw0QW8za1ZVTDQ2OFFyaU9tejdHY1V1?=
 =?utf-8?B?eGowV2RYQWxrd083MUZjejcxbUlac0tJK0tsUm1iV0hHSTRyZ0VvTFJXaEtU?=
 =?utf-8?B?RCtNS2NDay9JVTVJVnIxM21VNnd2bXlIQWhUWEpIM210NlNBWXlYcW1LbXU1?=
 =?utf-8?B?ZVdhS0x0TkppZVNjQ2hRRk02cmNaSWhpSDlTSVRmZm9qbWhmQ0xWK2F5aFNX?=
 =?utf-8?B?elQ5RHRYWWgyVkl3bUdsSG1hZndwbzFSYnIxMmNjMFl3ZVJLWWpVV0hObnZs?=
 =?utf-8?B?VVUvUm16RlkraFBORThhVzhBUTR2NTBrM1FCMUxPOXNjd0VyMFVPNGh0NnRU?=
 =?utf-8?B?YnY5dmRhTS83ZlVGdGNmbytJbnFFMFhkQ2tURDV5WnpuTlNBT2JPaEp0b2xw?=
 =?utf-8?B?ZlZqSUN6YUJTVjNpL05rdU1RUWZhNXRUNVZIWFZTelRmVXIrYU9XSzNEUTFJ?=
 =?utf-8?B?M2FZVS9HVjlhaXNmU29LazIxaUZUQWFFMHZkWCtmS2F3WG4xQzJwTUhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDFMWnNWcjZSc0V5QVphZkNKdU54czdvcmZhTTZFN3JXRGZLNVVBRllsR1FE?=
 =?utf-8?B?SUY1R1ZQSGVOemU0T2tESzZsVlFlV2VMR2RIWjd4emlBMzBadjlHa01FT0xM?=
 =?utf-8?B?bWxxLzV0b0ROc2hNYUx4R2w2WWdMeUlOaDlKWXdIWEx0THd5ajY2MlhlL2Y1?=
 =?utf-8?B?RTRTQitxd1V0cUozYkJmVHVZWktBZVNPZlBJMzZJcXFsVzFPcXk5c1FhM3hN?=
 =?utf-8?B?Z3YrQ2RlMGRYYkxDNEZVWVUwUldWK09RVGloUHk0RlN6K0ZzTFpSd0hKT2ZZ?=
 =?utf-8?B?aUdweGtEb01BMVpQazJ0dHc3U2JlRWNVMENodVlyazR1S0FBek9VV294REc2?=
 =?utf-8?B?RXNLaysrdzdOcWh3Z203ajZZZk5CZEd4V2NXbzJ3bWlPRWd2VjRhTU9zUXN0?=
 =?utf-8?B?Nko4Wk1TWUR2bmlpa0gySXF4SWwzSWQvUWsydEJvQjhhTjBiRHlNYXlxUWZC?=
 =?utf-8?B?ejd6RjRTWnVpK0tDVklaTmFubjRvV2p3a0dzbWJwamdhYVUzenVHcGRPRU5M?=
 =?utf-8?B?d2pGV3BRRVhFb2trdGdnL1FaVUcxc3lPOUVubFNpcUNhaHhCZUg4clJMWUNF?=
 =?utf-8?B?bndhY0lTV3Y0S04wbkp4clpIRDFNM09qbndvOE5waU4ycWcxZUVNdFNOdGNN?=
 =?utf-8?B?dTBFblJMaU1WaFZQY2twM0JzQjJKRlFPNVA1aEl1YmROVVNlN3FITnNVSEll?=
 =?utf-8?B?ZjFscGs1UHJuR3h2enMxUlJPM3hVSmlKOVl4WFlGdkR6MExzckZDMEtFbUtU?=
 =?utf-8?B?czE5VW41U1pLeVVzN1l2Nm0wdTA2NWF2VWh1RG1Bb1hZSWw2eTBRTHZNSy8x?=
 =?utf-8?B?dVpUaENDMmNZQ3JuTDNlVlloOCtXbG96N2hGTGFZR2paeXRkMC9tamQwajhC?=
 =?utf-8?B?QUgwUUNmaXR6TE5tVTNYUUxKdDBYa0V4NWhBbnFSUUNDOThrTHUvNmZMT0RJ?=
 =?utf-8?B?RWxRRzhrVUFHTHBDcTdvM2hMeGRLQkRJcnRsYW96SGRIcjE4UnExMk9SNWF5?=
 =?utf-8?B?UVIvU0JBZDFNMVV0a1RIREdLazBrY2lDeGtXeU9sa2FFQTZWdFZjdzdMOElT?=
 =?utf-8?B?UEd3eXhJRktEeXJIeUYvQVZnMDhXNVQ5U1hWeGN1eE9ld1VhdmxOdm5CU09N?=
 =?utf-8?B?ZkpBejliRkFCT3ZVYUduUWVUeGtCTktCN0ZCdFhxSU4vN1ZuenZxNThWUThU?=
 =?utf-8?B?SVlWWFFnRWpxWWxiRlRGQWM3OGl0d2dNUkZaMzAxNVEwWHZzQ2RLby81a3Fk?=
 =?utf-8?B?a0NoY1VLSE1aelFBYk9uSWVXb2xlYjllL1AxUk94elRDSVNoblZtU0RSRG1j?=
 =?utf-8?B?a3dRNy9FRUowSVNHbitJVjVlcFkzSnVkWkpRN0htZ2tQWnRxUkFySWZlTXAv?=
 =?utf-8?B?aWhFNDFpQUQ5OTNXcEY5cmMyZ3R6bmlwRGlrVTJWejd0QndyTjM3dHFhdWh5?=
 =?utf-8?B?RnRuWXFkZlhhOUlGUnVQd1cra2ZWYmJITlN4SXNMaGVINmJpK29Va3RPaGZ5?=
 =?utf-8?B?UzRpamtGYk44UHEra1RITXhna1hYUTF5SFpiRnNKK0lrTnBZWDlpbGVUcHhj?=
 =?utf-8?B?OTYrc2VLS0t5NTRhRkFqNm5nbmwxSHRxQWFKVXlUbSt6bUlnTURidFNHeU5s?=
 =?utf-8?B?dXMxTmxLdFVRbGF5eE9UZ1MzWUpoYWZqZnlVZ3pTS2wvbzFETzZkWVJOVHI0?=
 =?utf-8?B?L0ZqTmMySGYva2RFVDUvdFBRSnVBTDZid1QxemRYWTRhU0NiUlFqYzE5aU8w?=
 =?utf-8?B?VjB6cCs2QUF4b3lFZFpCT3NTSVpqKzNNNXVIVUhxNVVsQUdWKzhTU0UxN1hB?=
 =?utf-8?B?WTFVb21zcUNtdFc4WkZCRWFGLzdwQVNIbnE0RnpXVjJwTm1lcFJDVFA2ZG91?=
 =?utf-8?B?eXBoWjQxY2RUaEM1OFJ5SGtJOU5IRUR3K2FzMjk2UmRKM0huL3psdjlQVEs5?=
 =?utf-8?B?STIwTUJFelMwZU8yanJrWVo5aVBhd2w5MllyN1hDM0x0MkY1NjAxcEFlaE1M?=
 =?utf-8?B?TEFkSzBkTG1GUFlhMk5RTElTMllMSHFDYzhuRFhLdzArVWF5YUxRWU1hNm44?=
 =?utf-8?B?RDVDTDZxQ2lxczg5SStlakIvSWM0N1p4ZFg0UGN1SU1iUTM1elAvMUswbWdI?=
 =?utf-8?Q?WJTNJArBlU941k7cO7gZ1s7V9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f7e9b4-a1ad-45bd-206c-08dce771544a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 08:15:11.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIf83s7ICOCGnqjfncFkJTRwwEmWx/drxeDSdcJT4zjOzJT1uzSV7RWpoRM/EMmJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6813
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

Am 03.10.24 um 14:43 schrieb Pierre-Eric Pelloux-Prayer:
> And rename it process_desc, since it will soon contain more than
> just the process_name.
>
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 13 +++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c            |  2 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c            |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  2 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_events.c          |  2 +-
>   13 files changed, 24 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index cbef720de779..c2185e43e38d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1786,7 +1786,7 @@ static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
>   
>   		ti = amdgpu_vm_get_task_info_vm(vm);
>   		if (ti) {
> -			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_name);
> +			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_desc);
>   			amdgpu_vm_put_task_info(ti);
>   		}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 5ac59b62020c..4ca0a372984b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -220,8 +220,8 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>   		   coredump->reset_time.tv_nsec);
>   
>   	if (coredump->reset_task_info.pid)
> -		drm_printf(&p, "process_name: %s PID: %d\n",
> -			   coredump->reset_task_info.process_name,
> +		drm_printf(&p, "process: %s PID: %d\n",
> +			   coredump->reset_task_info.process_desc,
>   			   coredump->reset_task_info.pid);
>   
>   	/* SOC Information */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index ad6bf5d4e0a9..d1678eebbff3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -125,7 +125,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>   	if (ti) {
>   		dev_err(adev->dev,
>   			"Process information: process %s pid %d thread %s pid %d\n",
> -			ti->process_name, ti->tgid, ti->task_name, ti->pid);
> +			ti->process_desc, ti->tgid, ti->task_name, ti->pid);
>   		amdgpu_vm_put_task_info(ti);
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 6cd5bd5362d4..561ff832930e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2357,13 +2357,22 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>   
>   static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>   {
> -	vm->task_info = kzalloc(sizeof(struct amdgpu_task_info), GFP_KERNEL);
> +	char process_name[TASK_COMM_LEN];
> +	size_t pname_len;
> +
> +	get_task_comm(process_name, current->group_leader);
> +	pname_len = strlen(process_name);
> +
> +	vm->task_info = kzalloc(
> +		struct_size(vm->task_info, process_desc, pname_len + 1),
> +		GFP_KERNEL);
> +
>   	if (!vm->task_info)
>   		return -ENOMEM;
>   
>   	/* Set process attributes now. */
>   	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
> +	strscpy(vm->task_info->process_desc, process_name, pname_len + 1);
>   
>   	kref_init(&vm->task_info->refcount);
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d12d66dca8e9..44da250217be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -232,11 +232,11 @@ struct amdgpu_vm_pte_funcs {
>   };
>   
>   struct amdgpu_task_info {
> -	char		process_name[TASK_COMM_LEN];
>   	char		task_name[TASK_COMM_LEN];
>   	pid_t		pid;
>   	pid_t		tgid;
>   	struct kref	refcount;
> +	char		process_desc[];
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index 9784a2892185..c82364e43a15 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -166,7 +166,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
>   	if (task_info) {
>   		dev_err(adev->dev,
>   			" in process %s pid %d thread %s pid %d\n",
> -			task_info->process_name, task_info->tgid,
> +			task_info->process_desc, task_info->tgid,
>   			task_info->task_name, task_info->pid);
>   		amdgpu_vm_put_task_info(task_info);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> index 2797fd84432b..4dace3de1def 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -136,7 +136,7 @@ static int gmc_v11_0_process_interrupt(struct amdgpu_device *adev,
>   		if (task_info) {
>   			dev_err(adev->dev,
>   				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> +				task_info->process_desc, task_info->tgid,
>   				task_info->task_name, task_info->pid);
>   			amdgpu_vm_put_task_info(task_info);
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index edcb5351f8cc..e56d702fbfed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -129,7 +129,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
>   		if (task_info) {
>   			dev_err(adev->dev,
>   				" in process %s pid %d thread %s pid %d)\n",
> -				task_info->process_name, task_info->tgid,
> +				task_info->process_desc, task_info->tgid,
>   				task_info->task_name, task_info->pid);
>   			amdgpu_vm_put_task_info(task_info);
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index 86488c052f82..5fca64e71ada 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1451,7 +1451,7 @@ static int gmc_v8_0_process_interrupt(struct amdgpu_device *adev,
>   		task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>   		if (task_info) {
>   			dev_err(adev->dev, " for process %s pid %d thread %s pid %d\n",
> -				task_info->process_name, task_info->tgid,
> +				task_info->process_desc, task_info->tgid,
>   				task_info->task_name, task_info->pid);
>   			amdgpu_vm_put_task_info(task_info);
>   		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index c76ac0dfe572..c54c86dac14f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -635,7 +635,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>   	if (task_info) {
>   		dev_err(adev->dev,
>   			" for process %s pid %d thread %s pid %d)\n",
> -			task_info->process_name, task_info->tgid,
> +			task_info->process_desc, task_info->tgid,
>   			task_info->task_name, task_info->pid);
>   		amdgpu_vm_put_task_info(task_info);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 23ef4eb36b40..ea1990c19803 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2186,7 +2186,7 @@ static int sdma_v4_0_print_iv_entry(struct amdgpu_device *adev,
>   	if (task_info) {
>   		dev_dbg_ratelimited(adev->dev,
>   				    " for process %s pid %d thread %s pid %d\n",
> -				    task_info->process_name, task_info->tgid,
> +				    task_info->process_desc, task_info->tgid,
>   				    task_info->task_name, task_info->pid);
>   		amdgpu_vm_put_task_info(task_info);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index c77889040760..df00bf480dcf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -1701,7 +1701,7 @@ static int sdma_v4_4_2_print_iv_entry(struct amdgpu_device *adev,
>   	task_info = amdgpu_vm_get_task_info_pasid(adev, entry->pasid);
>   	if (task_info) {
>   		dev_dbg_ratelimited(adev->dev, " for process %s pid %d thread %s pid %d\n",
> -				    task_info->process_name, task_info->tgid,
> +				    task_info->process_desc, task_info->tgid,
>   				    task_info->task_name, task_info->pid);
>   		amdgpu_vm_put_task_info(task_info);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index ea3792249209..95ba07ae3b89 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -1267,7 +1267,7 @@ void kfd_signal_reset_event(struct kfd_node *dev)
>   			if (ti) {
>   				dev_err(dev->adev->dev,
>   					"Queues reset on process %s tid %d thread %s pid %d\n",
> -					ti->process_name, ti->tgid, ti->task_name, ti->pid);
> +					ti->process_desc, ti->tgid, ti->task_name, ti->pid);
>   				amdgpu_vm_put_task_info(ti);
>   			}
>   		}

