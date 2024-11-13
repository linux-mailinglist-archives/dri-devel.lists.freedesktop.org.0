Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F79C6FCE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 13:55:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE5010E6E2;
	Wed, 13 Nov 2024 12:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0XcJmxAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4519410E25B;
 Wed, 13 Nov 2024 12:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oD1tonXp6Z81kT9HmB3LJ/COwKSguK5baQpaEoy+ltfSFgzB/R05Cfgk4c08Bsqx91QKKVfRnPfiX1nsqNj/KEVQy2QFLes+LNsE/DPkpD3942TTnHqw4APTF9pwBtmSuaRFoy/o5/BzvgLNERi+GKIth0xAy7I0XyHOjOgaudn/fDkyilvOJR+Nsi7u6vvH5Kp0roUaZgT5OtOydZFo/Al+nkzD1WBnE/5CIIp0NKqHMC0kxinJHIbnVwJiTp8sV5lfU5humEZSdWtOTzVdaRpLezKx8Klw+zaKCym2ejtHClCln4RxSdM6aV0siJSnpZ8UxR012yksykRgTmy//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb6gbsWlRz8JHbUs9ER1WZQMhjBvyr0MYAHJSuhmYY8=;
 b=OIRFXo99aI4xM9xHtmdNZz6w3vr9O7WvfrVLN+8oyJ/jw7lhVjs4JQIkm+izvXE8ocmB1jYFlG9ui5KiSnCcUFgHi2qo+/9HzF+dYlcy8RF6SAOpJycH0pmfs2K6SEm6jhq3kJGsa3uAJQZz/+YBl8D2IAqb4zUzg6L/JxzkHid+FDKinsijeVl5YAKUjXjcx/etjgUk4QJGXYfJbBoRKu0GaSnpuN6zMbB27ECU0Y91xW3iUZljRSePhE7FKfKchEI+z2YQ2Mf5sjhoTH7tycjmOWA9VNNR3rDAvvwwjbLrcMJAhCaSbsoyqmhHxd6UqWseSzoh1AS1V3bTjfxAgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb6gbsWlRz8JHbUs9ER1WZQMhjBvyr0MYAHJSuhmYY8=;
 b=0XcJmxAu6oqw2KXLmvQP+QByc8APYw4sLpNVxEBIl6VWiQeN3UL3xRpxvu6fiVgHcUrRAvzSMkItjB/J7QIVmd4+zoVBwvQGM4ZkUnc+qTjll6khfG9dnhXlaXfnqSeAuiTiMtfCR3W43E9xDj9rhhT6b45dHXf5T3yVR6ovYgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6669.namprd12.prod.outlook.com (2603:10b6:806:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 12:54:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 12:54:50 +0000
Message-ID: <11457899-355a-4682-aea1-6b0a196bcef2@amd.com>
Date: Wed, 13 Nov 2024 13:54:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: Use ttm_bo_move_null() in radeon_bo_move()
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20241113125158.1959533-1-chenhuacai@loongson.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241113125158.1959533-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 8408aa9d-3fb5-4541-21ef-08dd03e25c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UENFTElUenZyMUx3VlhRTEwyYlFKTU1tN0taZE9Sd2pUNTl4dEtQdjFGdmFr?=
 =?utf-8?B?c2F3L1kzOG9OR1NhZGNPM25yNzZ2RzFlZEZMVDFnTkpqYi9EOUxaclZzeTAv?=
 =?utf-8?B?Qm9mRnV3K2dlako0U0RacElhMzQ3S1VHUmxxeSsyaGdsNEM0Q2tZck8zOENC?=
 =?utf-8?B?UXdTK3FDMnBOa2xGV3VZRk9XaDRyZzNFa0EyMW9WNXVYckl1WG9SYzFub2M4?=
 =?utf-8?B?T0pmTnBPcFEvRUI5NExCdm85cVdNYWVQUW5YZ2szL2J3WEVYWTl0Z2pZZW5Z?=
 =?utf-8?B?Zng3YkdpSThQbXNQMVd3NDVCQzdBTEVzNFVQVzYxR3dGaXZTQjUyUjJ6Sk9Y?=
 =?utf-8?B?SVkveTBxNUdab0tjL1hCMTNaZFNpelFDNmlpSUNzaitOaUNBVXBwS2ZiTUhG?=
 =?utf-8?B?bzhqeUFWNC9kUkVkSS9panoxdmlBY1M0VWRlUE9ScmdSWTl4UlpnVmtOSTc1?=
 =?utf-8?B?TjA5VmFYZWx2UE5PdGJJc2w3NmVPQ0pUcVdQTUVMcEJLektUSVhpUEJ3N0Mw?=
 =?utf-8?B?elRIa1FBVWQva1ZQZ2h4cWRTZzl3OHZlQ2g4WGdTU2I1MCs0OVZma004UmNG?=
 =?utf-8?B?eWFRcXU3UWZiSlNiK0wzY2NQRHNOWGMxTGE3UC9vU0RRc3puQnozalh3YUQ0?=
 =?utf-8?B?RGtGRHAzZytNcVZ2dXNhY0kzcEFZYWVNa1MySW1vUSt5TFRhaUw2ZHhYQUtC?=
 =?utf-8?B?YTFLY1JYNkY5TTBuTCtHVTgrZWM5NE0yeTgvb25IeHZlUFFXeTNmTlBYUlVC?=
 =?utf-8?B?NXRmd08xUVF3Q0M3S081TEZSNHViZVlLTlhEVUFTVzd4YTdURnA0RE5tVGpY?=
 =?utf-8?B?SzRJeUdCUnJwcXNPZS90ZGViMVZnczZQb1BESko4SDRJNk9uNUdpS0E2RUdj?=
 =?utf-8?B?dlkyVHFUM2dNV1dIeEVLNENXQmoxWE9xYTBkblFxUHhWRXdqekxmcjliZk5F?=
 =?utf-8?B?Rk5BaGkwUkIwV3ZWc2ZsZE1INnQ4NWJGMnhBaHVNc0FvWHN5Tkw0Yi84NHNO?=
 =?utf-8?B?WnBUaXI4bjRVb1ZuRDVtdnhQTW44MWhaTUI3bGxvK3ZsOFlURVZsdEQ5OE1v?=
 =?utf-8?B?dlJ6dUh2T2NKTXFzbktYYjBoTEZvMWNETDdqbFREa2pteFNFZXZDc1dmdUJT?=
 =?utf-8?B?MTZJOTEzS3ZIbEZUek82N1FlNlFzL2g2K3hKTXJEQUh2UUcwb0dLK1VQclR5?=
 =?utf-8?B?QndxZmdjNkZyRjk4UFFMWDNuMDNlTTZYdGZ5SzdaSmRrRGxsbHZJd0hhemxz?=
 =?utf-8?B?bGJ6eVNsQWZYVm1zRU03S05DN2xwcXNMWHI4QWZUV0RoK3M3QjcvR0psOWlE?=
 =?utf-8?B?TU1HUGl1L0FGWFNmQWw0cUNjS1JYcU5PM05Md0IwTG0yOFNlTERYV05HODNu?=
 =?utf-8?B?SUhVSzRyd1U2aG1EUkNZc1o4UXhLSXdReU1OSGV6ZnBmeWRXOFJsTnEwVm5B?=
 =?utf-8?B?aWRrRHpVaGxOcFBXbVhyRVdLUWpVb0JvK2xXdHlTb3N1NTdJOVFmU2VRVGd2?=
 =?utf-8?B?ZGxhR0hGaVFzUjdlcUQrMmNPQmR3aXZKN0s1YmNCdWZoMjZmQ0RrcDJVWjdr?=
 =?utf-8?B?NENmY3VkOXA0eWtTVElFNnkrVnlZWnhmNXMycTUxUnUxekkzekIvR3kyNmZD?=
 =?utf-8?B?ckxjdWpNL3pNNE1UYWxlMCt2aXhobWJ0dFlGcVR0SkhlaFpuMjVNSWVkUlBa?=
 =?utf-8?B?Z2pNQlBRdHY1SlF2blBNcnpVZ1YyenNJQU5ZL0tEekZaa1RFVmFIblVPQmE3?=
 =?utf-8?Q?JWmBlhx3Abr7KMr3JE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTRkNlVYYnk4M0JybDZ5Nkw4dUZWREdFaWN5QVJtT0VqU2U0amI5UnB6SFpi?=
 =?utf-8?B?cGFXM2NhK21wdmRYcUNITHoxemlGM21welA3bDc0ZGd4ZnZWcWR1NTdLSUZR?=
 =?utf-8?B?WUpJOEIyaGwvSENiakNIRDhBS1NId1VrM3VNNkZqT2R1b25oQ0FRWXArNnp0?=
 =?utf-8?B?UVpjZDFtMXRKMUhITXB6Vy9ka0EwbGNJNmZLSEk0b3NRSjBnVllMMWtWVHBC?=
 =?utf-8?B?T1IrU3YxQTJKTDNyRndEMjcyTzlET3FONnZUNkxHM2YxK0VvczVRSXdaNHQ5?=
 =?utf-8?B?SzRBR05YY0JzNjgrc1ZhaE9uU0cwZk9BRkJFV0lpRXE3Z2NNVGw2Y1Y1b1dC?=
 =?utf-8?B?MmhUZWVmVTVtVzlIQmpIOG9XTjlrLzB0a2V2cWNCaGRRdjRIaC9qRnZuZ3pW?=
 =?utf-8?B?TFJlZ0hoc0NqMmNnTHQ5NWJvU1haZFdUNElrRElBSGplMjNUbTNUMGVXRWMr?=
 =?utf-8?B?cHhwSUg2eVRCOG90UHZZTXRLZVlkZFhEZ0xORS9BQzY1TFAvbDFaRUN4VjZI?=
 =?utf-8?B?K2JoVjMyZFVCYXV3UUFxZHBlVnZudTlmUVFhNW1sUWt3UkpWalVlRVpLU2cw?=
 =?utf-8?B?WFpoMlE0MHhpUk9NRHVQRmZ0L2VWSHFXM0tNcmNEQTJ2VE9UMEo4cm9ZWXZ0?=
 =?utf-8?B?RTRaNjFaREJ3T3dSM3ZWY1U3V0I2cURtTXJkL1VaakFxNXFqVlJra2txSXF1?=
 =?utf-8?B?d29wNkszZzg1WTAzUHZUTDYzMm1LUk1zOG02ckhnMTBsejEzQ2dVV0htTlJk?=
 =?utf-8?B?YTUrUFNhN2tiR015ek9iZTF2Z29qRXMwVWNkSTJTa2ZTRHMrdHlKeDk5R1Az?=
 =?utf-8?B?bzRRMXhKZVphL0V5VnQwbmlNZG1GdnlRSXowS2JQZklLY2Mvb2hRWGpkbHlX?=
 =?utf-8?B?Qy9LdXVuRHBhU1pNQ0I2ZUpDc1gwbzNCT2pQQjZzaklNQ0ozSDhjby9jS2ds?=
 =?utf-8?B?RTZFYXh2eVg4UzdMdFZkWTR0bE5XdlpsRGMyYjBLNE9FWWtxRURlbVNKakdT?=
 =?utf-8?B?eXBuTytEN1ZMNEtFZEtjQU81MGVKQjRQRjYzSHk1akI3TjNUN3hmelVvZ1Ni?=
 =?utf-8?B?T1d6Y3lhQ240RmpldmdhNVFLRlZDOTJIOGRvcUtPTFYvZUZiVU5hdTFlSlhK?=
 =?utf-8?B?Ykc3by91TXpQMTUwVzBJTU9HNFNUTU1JOHQxSHVFbmJaR0ZyTktFWWY4dC8x?=
 =?utf-8?B?M3lKQ0E1RWtwTWdFUXZKRWxrSTdYMG1iL1RnYmcwWWpua2I0L2VFTzJOZHN0?=
 =?utf-8?B?L09uRHloMXdkTlhSWnRtM1RwREMycW01SHp5VVNXZ1FrWldBVWtoUzNCd3R0?=
 =?utf-8?B?WGQxaXBJNjZxUElxYnhxUVpmRVZ0T0xwOXM2NTJrWlo0QWZJRU5DY0RjQWVV?=
 =?utf-8?B?UHY3ZmtmUWh6K1h2TkdDS0ttcStwY0x4ZkJNMnZtM3BTUnJvcW41ZWlLWXlJ?=
 =?utf-8?B?c3lvcEYrUmYyRDQ2TFplMUxOK1pVb2NadkFCT3V2Rk5iUnJyM21EVHMwYW9C?=
 =?utf-8?B?d0dJMGxFc2F5SXJENGRuSHR3VE9ZcUZoemx4SG1KNzBnNVVDRnJ2bEpZSXl5?=
 =?utf-8?B?dDVsM1RlVUVEZFgrQXc4QlQ2d2RvTDlGVzJHdTRxRUtMRFpBV3l2bUpEcktU?=
 =?utf-8?B?SXMwY3RBVGFIajcvNEwzWXVERVhZaWpoeUdSeU9KTzBrcVBIdFRMOXVDQnYr?=
 =?utf-8?B?c0hSc2RHQmhubnFiWmFtYVZtbzdMSUVTT3plMW1EV25QaWVWRnJLNktSUnVC?=
 =?utf-8?B?SUZqWFB0a1hsbnVHM3BCdXAwMFZJV2hzdEZvc0x1YWpFMWU5WHdFRlhUUWJO?=
 =?utf-8?B?cEdMbTYyaVlOZ3BnOTNuZXYzcDYwWlJ2S2dGd3UzTEJyTjZTdHVmWHh4VmhF?=
 =?utf-8?B?M3F3YUhSNmxJWmFXeUw2WWtKVEhGc1U0UHA0cGxMalVuc3VhdWJMU0c0Q0Er?=
 =?utf-8?B?dkRnb2ExUEJNN1A2N3VRSUpoUnlPcUVzbERqSTFVYkgvc3doUmFvWUE5MXYw?=
 =?utf-8?B?QkR4cUdveXdZNDhRSnVIc0hVaStROWpGclA2WWJKWkNQbjJyc2tmOUptMWpN?=
 =?utf-8?B?RlQwM0tUdjlrUk9BYyt5L1ArOXpXUTFoZ0lqWXFOWmtIMUkzOThQS1Ivd2lt?=
 =?utf-8?Q?PtciuSC/Bzwcfu8ZbBxIkOpW9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8408aa9d-3fb5-4541-21ef-08dd03e25c5b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 12:54:50.5866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjGXuS/gJI+Y8BzjUCrZhoxMRwkrwYSTbbHGVSSXANN6c9lWU0c8wUT8WBEjd894
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6669
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

Am 13.11.24 um 13:51 schrieb Huacai Chen:
> Since ttm_bo_move_null() is exactly the same as ttm_resource_free() +
> ttm_bo_assign_mem(), we use ttm_bo_move_null() for the GTT --> SYSTEM
> move case too. Then the code is more consistent as the SYSTEM --> GTT
> move case.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Looks reasonable to me, Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_ttm.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 69d0c12fa419..616d25c8c2de 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -219,8 +219,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (old_mem->mem_type == TTM_PL_TT &&
>   	    new_mem->mem_type == TTM_PL_SYSTEM) {
>   		radeon_ttm_tt_unbind(bo->bdev, bo->ttm);
> -		ttm_resource_free(bo, &bo->resource);
> -		ttm_bo_assign_mem(bo, new_mem);
> +		ttm_bo_move_null(bo, new_mem);
>   		goto out;
>   	}
>   	if (rdev->ring[radeon_copy_ring_index(rdev)].ready &&

