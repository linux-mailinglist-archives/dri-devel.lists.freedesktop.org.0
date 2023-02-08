Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B1568EE9B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C400710E753;
	Wed,  8 Feb 2023 12:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D489910E742;
 Wed,  8 Feb 2023 12:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGCCiZG4fslUIYmc5kxNF1qepvytcprypWOhKPOWoipzqG6/C8ziPTuoMJPOZi1OFUAIkOrZdhCN/0c6CTK4nQIlUg6Txxe4FmAlaPTPMPCg98N6TNxu8gINm4xqGMZ3/DFwe2rnubTSed5wQwdn3anId0dlWkdp9yVtjMgwKdwWaxADrSWG5mKo2wp+H8qxY4fXOQ2eMNuxCfbub9fOUvxZy0LvhwO4SUdr+fvDtKEpa3clCWV2fXbN5WOJEy+5BzwBgCjJA9sFR4Vwf86/8zPDLRgPL/zKvD+g71Ir+GfLLTU9f+yu6xZA8P3XaHUSWkeJA848/xeH5UUWEG+JFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+9zhKgmqQqD/oShtP1HyRPPHTGAu55Lo5StNqYzcOw=;
 b=DY4DCqFRXmyfdR1gnqh3cQ7k2qP7fu+UQ0l3PHzO7MedaabzpQsBrtZGRFpczXNbdUHV3TCHhTCY1euC5gIdjxiLk/HAzl1LunDDpUwBSzOnIClgnATKTAU1FGQXW2agZLmb04QCHP+eBrZEb2tXRGDiNf5rfBxSW+n86pGxEWDXtGqNMVCshZ/Z8AJ6xkkkcva33Pz7GMLMEyc/LVSQIl5BLsHhhbhi5s642lRe5xURCholjWuLdv3qEI013xG5u8d4Yt0aX/fUR6NL9DXtIuEhcF+v+cOi+Izp5EYnftdRCPNkRc7YfRCIiiamkXMpmpslPeqEumZbn431ZK+SeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+9zhKgmqQqD/oShtP1HyRPPHTGAu55Lo5StNqYzcOw=;
 b=0ZRPuryHRUTZeYCWpIkZzUn7P9sYcauw28xOAj19gMVpYWavoY7pxDnMTqcMvJ/nWLVi8dDsNY0gO0dXknrlBjBZKiGFE8E4xY25zDXv77gDQWtIe4C4RzKGiv2kuEsss/UjCtutxWuJ8i9aTQy8XJ3tHFtRFit+6YFvO+qSZO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB8064.namprd12.prod.outlook.com (2603:10b6:a03:4cc::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 12:11:13 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 12:11:13 +0000
Message-ID: <a918a254-5c8c-b5f5-853e-e70dc97a4ed0@amd.com>
Date: Wed, 8 Feb 2023 13:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] drm/amdgpu: Remove TTM resource->start visible VRAM
 condition
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
 <20230208090106.9659-2-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230208090106.9659-2-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f621b6-87b2-43de-d214-08db09cd9219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGiM8/mD6MD0bvKSU+3TjodtOOjeIoDG/ZjTPB77AmqLIScdvmYyIjCIIPUTmyt7Xp8vplx58Ud4KaJZQGR6VfJ/DIjzUTkG1dcraCPJgdZ+xcVP2zYVUZe4jXWRD7GB38/U5PQoL7C++lzAyCXh1ioPQjsSbA1l6JTAnNy4d3L3/7vtrgBfq7lTQdyPnzDdDor6K4Zur5NCk9ex6/w4jwczlTvCoL8Khzdep0/xdr4dwwc/Y1uIEiLyOFIeCleHooCLBhvEzVIv1m3g1gXrdKRRpvx4x7rdbQbefHCouegDR2lmyWyqUmQd22d+khqpPTtnIsTqc8UXEH4w1IZfd6KsQt8iNlXvu5rCHTkkG3QWrwT4BAVyKkDnwZlQSFvpJbm4zH6wUtGu6Ao8CZ02RjuORRDh1P67k1rpPzmeoDWsYtxbAWRw+GE2K4sDtUisdgB23f+esPpKWYP6aq3fWvp6tRYI+WRH/0jzIt12Hl+UQZqbhiHggnp4dta84lTrnD+XI+zdcrydBCwquV0UDZbdM0uFDZtglpszcVhgO269o/EQW3Spt2tjVxt7N/Lj0ftC6TjSoCuxbI1xo+WFqJ+iVEI78HWUbsV7eg8U+8nIePJ0ciUe4dqYs71obW5d9EFx2+1f7grcGWKlqZ+wrMY8q0HfjK3zXPQlcQX6JD+Hs0456AmDngPO8jsv5ZFHFAjPiaB27lJJ9oUuwh5TPNnypkZZaV86NM0LSYutFzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(451199018)(8936002)(5660300002)(2616005)(31696002)(66556008)(66476007)(6486002)(66946007)(8676002)(4326008)(38100700002)(478600001)(86362001)(41300700001)(2906002)(36756003)(316002)(83380400001)(31686004)(6512007)(186003)(6666004)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUZRczhiVVZtU1NkS2xPN2w2Ykt2d2VsRk9HL1A1Z0RzQ1Rxc2Y1VVdxaXBP?=
 =?utf-8?B?K3JOUWRnOSswTmlMdGpMM0YzY1FyL29IN25ZNmhNMFVPeTlsU1JBOXQ1YUJ1?=
 =?utf-8?B?QlpWZ1hLTTZNS2RtS29QMWFLZ2k1aU4veFhZUjhHUVhlTDZYdndXcjhLOG9C?=
 =?utf-8?B?Q3BRS09Dc2hDNjNVdHgyNDV3dnVRZ0JJYTJnL1dtWUtZQkQvbkg2UmdSOUU1?=
 =?utf-8?B?dzBSaGZlRFg3N3hJdFpHL3liWTd4bWgrM2RrcTZPTll4RXpFYmp3d1kvUkc1?=
 =?utf-8?B?ZUdPOTM3aHR1Ky9VVWd1NnlxaXRqY0pSMWM2TEYxcGxRUnVKSm5mNVo0L0Ny?=
 =?utf-8?B?NU9CbVlkbXlkVWtTT1pPV2hGR0t3em9iZjFnMWZ6OTBxRm1LVEJPMmxKcmZE?=
 =?utf-8?B?VHZ0WEptVWFaYXJUM0lxVTUyVDBzYzhEMWZZcHp3Z01ld08zSEN4aGxveXdC?=
 =?utf-8?B?NjBzQTBnRlpKZW5Fa2JRNENoRmNQd1BiY1l2U3h5TXBYUERQSVlWc2xiYktR?=
 =?utf-8?B?aDFReWwxUCtsOE45SE1EbVhlMnlkN0FHWXo4NEZLeDdsSXlpeXZxaElkQ3d4?=
 =?utf-8?B?ZmtETEJoS2ltb1pnVG95bFpXVDJCeGFPUXlFd1BTMVZ2TW94bDdVUHRWWEVa?=
 =?utf-8?B?cVU0am9MSjcyV0pnTDQrUWdoYU9sbVhHNCtaTWdKRUNzc0o4bVBPZWtoZ3NR?=
 =?utf-8?B?QnNEZVlENjRweEtYL0cxVHlYZVlRbllyK1gybUx6QTg2NWZHS3Y2eFN2T1hy?=
 =?utf-8?B?TGZoOFY3S0NjcFhWKzQ3M3d4TlA1L3JBS2dvQXh1THVjV3pJS2JoZDNtbjRH?=
 =?utf-8?B?QzZmbTkrbjk5azh1MnFwR2owSVp6SmdzM2lDNkd2QWxsSlZFQXVDUlBYeWNr?=
 =?utf-8?B?Ujg0M1ZPMStFT1JtK2J5SSs3aVlBRDhPd0hjSXQwS2YrQjZQMEtreFlBOEpr?=
 =?utf-8?B?MlcyUkU3dE1kd25ibXJPYlJlVmg3anlOQkpwelVxQ01CMU1odGFGem5zeTlG?=
 =?utf-8?B?b09JZWNOQWJwUUErZ2owY3BOZjR2UnQyS0F4RUdyNmk4RzZKT0x4dVk1akox?=
 =?utf-8?B?SzFISXlZa29wWEtyTWN2ZUFzNUNVUHB3U3lHR21hSk5kbUdzZE0zVjVicmlt?=
 =?utf-8?B?Q214Yy94VkMrTjUxL2tGdTEwTVErVGJWdTNVcFhzelgrRWRIVjRBTXFuaXcw?=
 =?utf-8?B?bnZrNUZmQ1UxN1BVNDJkSEZXNlRPVWQ3NGZrdWJ4YkxxYjBuS3kycThMUjZk?=
 =?utf-8?B?SHk4c2dvU2pGM01qelFUS3dPZzV2b01EeXhSaFlMZjNFSCtiOGFUMStsenFG?=
 =?utf-8?B?Q0tGdnAwMDlweHY0L2srckY3NC85RDBGNVB2Zk42Y0QwL3dlckRweEdERCto?=
 =?utf-8?B?d0MrQ3JoRnJDemU0MEVXNDJMeHJnZzc5VEZSbUxoNGI3T3VrOW5CK1ZYS0Mr?=
 =?utf-8?B?dHlOTm5VcmtmZENhZ0hLL2d5VTNZQ0RaRkFtV0ZqdzQwRUxESjQwWEoyaUYv?=
 =?utf-8?B?c3dxT1pWWTZHS1VlbDJqQXpBYi9YSkpWc21ucG50MW9tY1o2TE5mUnNsMmt5?=
 =?utf-8?B?UjJ0WE5pRmc2VVNuWEJQM2x6bU9DdFhnZnlQUE5NdmlxY2d5S3ZwZERyQ2lR?=
 =?utf-8?B?WkhZNWdEVjFabHU5UldSSFhDcTkvS0hYRnlOcE5hYks0b1ZQMzJIY0hOZUZw?=
 =?utf-8?B?RHA1L3Bwd1FhNlRYaTYyL0hHTUFXV0FnVTFmQTdISVJqc2JiTGUwZng2QVE0?=
 =?utf-8?B?M09wSnJDQjVnRWg0UmtXOVlYekVhQTdhUlhZVW1XNzV6b1FrZnREZENqYjY2?=
 =?utf-8?B?WERiYTdiOXBQa2dDREdKZUZvQ1I0QlVQelc0Tjlvb0dYaWd3c0FOU2VxOFhK?=
 =?utf-8?B?YWVQMjdvN3RDYTFMNlJqUy9ZdnViLzV2NU9SbXA2cVltRU1FY2FzblhYMzdX?=
 =?utf-8?B?a1JjTE5BcnJBcVI1Q2ZwQnJQcHJibEwwV0tTTEN2OG52WFJMU3BsOWJKeFMx?=
 =?utf-8?B?S045MDFZZXgyKzRZUHdXQ0dJeE5vNVBJT0EyVm9MRjV6elJEZzhCeFFsaTNS?=
 =?utf-8?B?a1dZSmVuaWRGQnFLV05UZFJxbUdzYXlEWDlvNGNVN2NndHV3Z2xJMkxXL0lJ?=
 =?utf-8?B?Rk5sM2xDSDNNSnlQV3ZmOS9GbFg2QVgrMi9tY01jeWVkdElsNmRDSHhqVHFj?=
 =?utf-8?Q?8Zpo+CKWC0y5Gt6/4InHif/VFstkUoFCghpXXZGkP8zK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f621b6-87b2-43de-d214-08db09cd9219
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:11:12.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZCOMQRr9MywI+v/rULwF4eQvoGtKbrsV0pnz03ZDTGoKAJhdETN7qCJ3hKpGAe6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8064
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.02.23 um 10:01 schrieb Somalapuram Amaranath:
> Use amdgpu_bo_in_cpu_visible_vram() instead.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 981010de0a28..d835ee2131d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -600,7 +600,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   
>   	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
>   	    bo->tbo.resource->mem_type == TTM_PL_VRAM &&
> -	    bo->tbo.resource->start < adev->gmc.visible_vram_size >> PAGE_SHIFT)
> +	    amdgpu_bo_in_cpu_visible_vram(bo))
>   		amdgpu_cs_report_moved_bytes(adev, ctx.bytes_moved,
>   					     ctx.bytes_moved);
>   	else
> @@ -1346,7 +1346,6 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
> -	unsigned long offset;
>   	int r;
>   
>   	/* Remember that this BO was accessed by the CPU */
> @@ -1355,8 +1354,7 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	if (bo->resource->mem_type != TTM_PL_VRAM)
>   		return 0;
>   
> -	offset = bo->resource->start << PAGE_SHIFT;
> -	if ((offset + bo->base.size) <= adev->gmc.visible_vram_size)
> +	if (amdgpu_bo_in_cpu_visible_vram(abo))
>   		return 0;
>   
>   	/* Can't move a pinned BO to visible VRAM */
> @@ -1378,10 +1376,9 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	else if (unlikely(r))
>   		return VM_FAULT_SIGBUS;
>   
> -	offset = bo->resource->start << PAGE_SHIFT;
>   	/* this should never happen */
>   	if (bo->resource->mem_type == TTM_PL_VRAM &&
> -	    (offset + bo->base.size) > adev->gmc.visible_vram_size)
> +	    amdgpu_bo_in_cpu_visible_vram(abo))

This check needs to be inversed. E.g. we return the error if the BO is 
not in visible VRAM.

Apart from that the patch looks good to me.

Regards,
Christian.

>   		return VM_FAULT_SIGBUS;
>   
>   	ttm_bo_move_to_lru_tail_unlocked(bo);

