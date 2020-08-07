Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4867923EA3E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9B06E99E;
	Fri,  7 Aug 2020 09:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F9F6E9A7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnIP+mUQk1Al8hp4PYeP2tzdqKghz3jDH2rXZiBippUZpWOI1OzARc8VkVm7NnKHx410dAZhnXXopbyIYWNwNd5eImzXAWRNcMorSvm/hGhqVfKyWA4iO2sQ6JG08t9oEEnk9wqXybiRyypdKY9ZWo6cerg7HvGF4y7tX7i3Hxuo4dNhu9UdoMYdC2WdBn5QXV43TQqkts/5qk+yVlPeJNEx+Pz1gFhusxDO0/rVkbACImw81m2C6w8LZ7cIANKUrLg1id6D2mkUfhQSg9YTACrhr9ta4lF4Z+dKt36jLnQ/YzuQPgbZ3MA7pT4KRJ4xot/pVyu2ecE6UEQLpmTPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5CW0JevTB5HaZuArof1kNawyB68qX/nDeePavjtL4Q=;
 b=TTtFgQgrCzqnD8AJx/iNios2xgHM3SDyBMp8qNEmXnTI2loOhogy0otE5rxgwNBR9yZEXAbOfT3+FwHXwnBBEmx/i94MpAg9zDIEZHBSA/mdYNPC0oTlU+xHfGJpw9Yuk+N3Hmqa3bL6qfhfGChmZqTnoyohyK/PiRO4fuMtC1T3mifi+H8LxJb+hGc4f6jcFNrVHXSj35t50FqqK0SCIey+INSCkTPqKlo3S4odCwG0EE8ajA/n3PgBQe549jjCCYhtFcoHYjAsHy1ZWYNZGAUNctOIySwSKBt9rGySK698ZXZqdohfSnC3KwA+mrDOTgoVi/dnEs83EluP2JzZxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5CW0JevTB5HaZuArof1kNawyB68qX/nDeePavjtL4Q=;
 b=QwwGVEaQP8VnkY90C25sDp8xMVHeFMDxzR/upBLW0xXspRGS927CxwrDAUawBv2YFC0ttxJHCkeHI0+C3ZgaSGAzBZwSTIwB4G31AQUpXGAINyU3ldhJhcwxpeCzpfFwP8QfgWafu95+F2eF9IyD8/4DPbUJWvrhHQLBETZELQg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 7 Aug
 2020 09:22:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 09:22:09 +0000
Subject: Re: [PATCH 3/4] drm/ttm: drop size from resource manager base class.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200806233459.4057784-1-airlied@gmail.com>
 <20200806233459.4057784-4-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e1604fd4-2f93-52e2-86fa-b12d288b0b3b@amd.com>
Date: Fri, 7 Aug 2020 11:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200806233459.4057784-4-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0101CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0047.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Fri, 7 Aug 2020 09:22:08 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d8c52ee-c38d-46b1-fc93-08d83ab35bd2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4221:
X-Microsoft-Antispam-PRVS: <MN2PR12MB422129E45FA85E7DBE28C28983490@MN2PR12MB4221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IACLx2D1KS17QUk07CavVD5+dOBT/uCZn1qjnvN7VgdNTdbGfqCs8s5+HaP6d5bU8txfRKRNaHDM7YVDmSl9n8Ywz/ol8dka8WRxHaypJvXMfK0gmfYCkQlXsk0R0RqhgpYavVwoIjqIU8t6DxGdX/j7TNMTuFZ3gaUUa/HysRm0JJUkqMZsrQMGSTXiI/U03NB/s4GI5TjL3752X7TNV577SWBbWecAjkjWRdm5Utn/r713QgUFbd5bwNPlh07hWtpcWWdqsxp9l2ZCLiyAYiVq7DN5Yx++CrLEQi6ThTqG9fZ6/I3yDvO2bTgoX1stALYD7sj2+DkFxMbvxqzEacmj+s7PBy5AgweCiCIx9XBXahmCsJR06e7YxoBQ09sn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(36756003)(66556008)(6666004)(30864003)(478600001)(66476007)(4326008)(31686004)(5660300002)(52116002)(6486002)(31696002)(316002)(66946007)(8936002)(186003)(16526019)(86362001)(83380400001)(2906002)(8676002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: NahkNySpahUiF7svdUn5PQqsRbE1aP8Aia4Au3MLk2t9NTzASpXtzCOTb5llUjd8jv8yVGVQZHnJ5uhRgnzVyw1eIKwabQA8c8dP0wUQeJDefWJ2q5q6g6TdjFQu/GmRiVoxW+QE2TMPb0oWORENzeUwE7Udhrs2T9BN2BjoujuBgI0I+27dDwZzvq4YRrG68vDfn5p20Iz3I/5pwb8h1O30IP5KXM5yfi5daRAmKtVIY3/qUmufi2a+5sMaLmaYfu8EW0jpz93HYccTNnlOSATdVVDzAqiFE1xMQ1fSV6w1kza0aypzSxoFGEWnk33h2/wJpmvgnt7Pe9C0fQdExAj9UKgOV0InCut2fa0sfjki3GrPDoU7V+4juwIKnqRBRt0ysoPVWAb5aflzb0ygIZR7ytSDbPWmvGgU8itvpNz0gO5pO6uMLpnjo3SRpqB76PUtrcp+D7q6mmnaRCOYdCC49AgO+YH/OutR+nJ6La62U6JIKMpoFdZTV3q1sFyddSPnOuup/hYEwr3F/N9SFiNY/dXW8TcYNGBdEexqD/0q8tNpsTt6W0P0Uk4DHSVMsl4weGxMbVeygOzn4B7MnN3OmVhIjrcwYDR+Po6rEYuGmcUlJkZnDv8gUbG1UJrnKcI4yqCYE0W/ptWYE/r8EvyIbJ34ygmA34WiBbthtbinV7adRhF7piGOSokOvGfLZON6r+qajrZUJ36u4gN9pA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c52ee-c38d-46b1-fc93-08d83ab35bd2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 09:22:09.0683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKmcJ3QGuQr4gznpUfBX4qQ+67kUgBgtP17T0ik56Sr6UN07i6Ak4r9dRnQz9Jll
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.20 um 01:34 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This is a bit more involved that it looked, the range manager
> needs accessors adding and amdgpu needs a bit of a refactor.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   | 21 ++++++++-----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  5 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 13 ++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 12 +++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 16 ++++++--------
>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  5 ++---
>   drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c           |  3 +--
>   drivers/gpu/drm/ttm/ttm_bo.c                  |  7 ++-----
>   drivers/gpu/drm/ttm/ttm_range_manager.c       | 21 +++++++++++++++++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  9 ++++----
>   include/drm/ttm/ttm_bo_api.h                  |  4 +---
>   include/drm/ttm/ttm_bo_driver.h               | 20 ++++++++++++++++--
>   15 files changed, 87 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 010518148ef8..b769b43b2fbc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -24,11 +24,6 @@
>   
>   #include "amdgpu.h"
>   
> -static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct amdgpu_gtt_mgr, manager);
> -}
> -
>   struct amdgpu_gtt_node {
>   	struct drm_mm_node node;
>   	struct ttm_buffer_object *tbo;
> @@ -48,8 +43,9 @@ static ssize_t amdgpu_mem_info_gtt_total_show(struct device *dev,
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = ddev->dev_private;
>   	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> -	return snprintf(buf, PAGE_SIZE, "%llu\n",
> -			man->size * PAGE_SIZE);
> +	struct amdgpu_gtt_mgr *gtt_mgr = to_gtt_mgr(man);
> +	return snprintf(buf, PAGE_SIZE, "%lu\n",
> +			gtt_mgr->size * PAGE_SIZE);
>   }
>   
>   /**
> @@ -96,13 +92,14 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   	man->available_caching = TTM_PL_MASK_CACHING;
>   	man->default_caching = TTM_PL_FLAG_CACHED;
>   
> -	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
> +	mgr->size = gtt_size >> PAGE_SHIFT;
> +	ttm_resource_manager_init(man);
>   
>   	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>   	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>   	drm_mm_init(&mgr->mm, start, size);
>   	spin_lock_init(&mgr->lock);
> -	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
> +	atomic64_set(&mgr->available, mgr->size);
>   
>   	ret = device_create_file(adev->dev, &dev_attr_mem_info_gtt_total);
>   	if (ret) {
> @@ -264,7 +261,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
>   uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -	s64 result = man->size - atomic64_read(&mgr->available);
> +	s64 result = mgr->size - atomic64_read(&mgr->available);
>   
>   	return (result > 0 ? result : 0) * PAGE_SIZE;
>   }
> @@ -305,8 +302,8 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
>   	drm_mm_print(&mgr->mm, printer);
>   	spin_unlock(&mgr->lock);
>   
> -	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
> -		   man->size, (u64)atomic64_read(&mgr->available),
> +	drm_printf(printer, "man size:%lu pages, gtt available:%lld pages, usage:%lluMB\n",
> +		   mgr->size, (u64)atomic64_read(&mgr->available),
>   		   amdgpu_gtt_mgr_usage(man) >> 20);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index fff9c013f337..732e4004777e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -608,7 +608,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>   			min(adev->gmc.visible_vram_size -
>   			    atomic64_read(&adev->visible_pin_size),
>   			    vram_gtt.vram_size);
> -		vram_gtt.gtt_size = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
> +		vram_gtt.gtt_size = to_gtt_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
>   		vram_gtt.gtt_size *= PAGE_SIZE;
>   		vram_gtt.gtt_size -= atomic64_read(&adev->gart_pin_size);
>   		return copy_to_user(out, &vram_gtt,
> @@ -620,6 +620,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>   			ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>   		struct ttm_resource_manager *gtt_man =
>   			ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> +		struct amdgpu_gtt_mgr *gtt_mgr = to_gtt_mgr(gtt_man);
>   		memset(&mem, 0, sizeof(mem));
>   		mem.vram.total_heap_size = adev->gmc.real_vram_size;
>   		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
> @@ -640,7 +641,7 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>   		mem.cpu_accessible_vram.max_allocation =
>   			mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
>   
> -		mem.gtt.total_heap_size = gtt_man->size;
> +		mem.gtt.total_heap_size = gtt_mgr->size;
>   		mem.gtt.total_heap_size *= PAGE_SIZE;
>   		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
>   			atomic64_read(&adev->gart_pin_size);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 43f4966331dd..33957d829197 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -442,25 +442,24 @@ void amdgpu_bo_free_kernel(struct amdgpu_bo **bo, u64 *gpu_addr,
>   static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
>   					  unsigned long size, u32 domain)
>   {
> -	struct ttm_resource_manager *man = NULL;
> -
> +	unsigned long mgr_size = 0;
>   	/*
>   	 * If GTT is part of requested domains the check must succeed to
>   	 * allow fall back to GTT
>   	 */
>   	if (domain & AMDGPU_GEM_DOMAIN_GTT) {
> -		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
> +		mgr_size = to_gtt_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
>   
> -		if (size < (man->size << PAGE_SHIFT))
> +		if (size < (mgr_size << PAGE_SHIFT))
>   			return true;
>   		else
>   			goto fail;
>   	}
>   
>   	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
> -		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> +		mgr_size = to_vram_mgr(ttm_manager_type(&adev->mman.bdev, TTM_PL_TT))->size;
>   
> -		if (size < (man->size << PAGE_SHIFT))
> +		if (size < (mgr_size << PAGE_SHIFT))
>   			return true;
>   		else
>   			goto fail;
> @@ -472,7 +471,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
>   
>   fail:
>   	DRM_DEBUG("BO size %lu > total memory in domain: %llu\n", size,
> -		  man->size << PAGE_SHIFT);
> +		  mgr_size << PAGE_SHIFT);
>   	return false;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 28557839f132..ca312ef8c2f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2045,7 +2045,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   		size = adev->gmc.real_vram_size;
>   	else
>   		size = adev->gmc.visible_vram_size;
> -	man->size = size >> PAGE_SHIFT;
> +	to_vram_mgr(man)->size = size >> PAGE_SHIFT;
>   	adev->mman.buffer_funcs_enabled = enable;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 4a6d92f27b6e..5636ef2b1707 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -47,15 +47,27 @@ struct amdgpu_vram_mgr {
>   	spinlock_t lock;
>   	atomic64_t usage;
>   	atomic64_t vis_usage;
> +	unsigned long size;
>   };
>   
> +static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct amdgpu_vram_mgr, manager);
> +}
> +
>   struct amdgpu_gtt_mgr {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
>   	spinlock_t lock;
>   	atomic64_t available;
> +	unsigned long size;

Those should probably better be uint64_t, same for above.

Apart from that looks rather good to me on first glance.

Christian.

>   };
>   
> +static inline struct amdgpu_gtt_mgr *to_gtt_mgr(struct ttm_resource_manager *man)
> +{
> +	return container_of(man, struct amdgpu_gtt_mgr, manager);
> +}
> +
>   struct amdgpu_mman {
>   	struct ttm_bo_device		bdev;
>   	bool				mem_global_referenced;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 7882efd275d1..d4aa2aa49b4f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -28,11 +28,6 @@
>   #include "amdgpu_atomfirmware.h"
>   #include "atom.h"
>   
> -static inline struct amdgpu_vram_mgr *to_vram_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct amdgpu_vram_mgr, manager);
> -}
> -
>   static inline struct amdgpu_device *to_amdgpu_device(struct amdgpu_vram_mgr *mgr)
>   {
>   	return container_of(mgr, struct amdgpu_device, mman.vram_mgr);
> @@ -180,11 +175,12 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
>   	man->default_caching = TTM_PL_FLAG_WC;
>   
> -	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man);
>   
>   	man->func = &amdgpu_vram_mgr_func;
>   
> -	drm_mm_init(&mgr->mm, 0, man->size);
> +	mgr->size = adev->gmc.real_vram_size >> PAGE_SHIFT;
> +	drm_mm_init(&mgr->mm, 0, mgr->size);
>   	spin_lock_init(&mgr->lock);
>   
>   	/* Add the two VRAM-related sysfs files */
> @@ -325,7 +321,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   
>   	lpfn = place->lpfn;
>   	if (!lpfn)
> -		lpfn = man->size;
> +		lpfn = mgr->size;
>   
>   	max_bytes = adev->gmc.mc_vram_size;
>   	if (tbo->type != ttm_bo_type_kernel)
> @@ -600,8 +596,8 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>   	drm_mm_print(&mgr->mm, printer);
>   	spin_unlock(&mgr->lock);
>   
> -	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
> -		   man->size, amdgpu_vram_mgr_usage(man) >> 20,
> +	drm_printf(printer, "man size:%lu pages, ram usage:%lluMB, vis usage:%lluMB\n",
> +		   mgr->size, amdgpu_vram_mgr_usage(man) >> 20,
>   		   amdgpu_vram_mgr_vis_usage(man) >> 20);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index e6a30865a00b..93685a376a50 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -175,8 +175,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   		man->func = &nouveau_vram_manager;
>   		man->use_io_reserve_lru = true;
>   
> -		ttm_resource_manager_init(man,
> -					  drm->gem.vram_available >> PAGE_SHIFT);
> +		ttm_resource_manager_init(man);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>   		ttm_resource_manager_set_used(man, true);
>   		return 0;
> @@ -237,7 +236,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>   	man->available_caching = available_caching;
>   	man->default_caching = default_caching;
>   	man->use_tt = true;
> -	ttm_resource_manager_init(man, size_pages);
> +	ttm_resource_manager_init(man);
>   	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>   	ttm_resource_manager_set_used(man, true);
>   	return 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> index 7f5dfe04789e..00258d158cfe 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -228,7 +228,7 @@ int radeon_gem_info_ioctl(struct drm_device *dev, void *data,
>   
>   	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
>   
> -	args->vram_size = (u64)man->size << PAGE_SHIFT;
> +	args->vram_size = (u64)ttm_range_man_size(man) << PAGE_SHIFT;
>   	args->vram_visible = rdev->mc.visible_vram_size;
>   	args->vram_visible -= rdev->vram_pin_size;
>   	args->gart_size = rdev->mc.gtt_size;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 3355b69b13d1..e41ec62ff944 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -843,9 +843,8 @@ void radeon_ttm_set_active_vram_size(struct radeon_device *rdev, u64 size)
>   	if (!rdev->mman.initialized)
>   		return;
>   
> -	man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
>   	/* this just adjusts TTM size idea, which sets lpfn to the correct value */
> -	man->size = size >> PAGE_SHIFT;
> +	ttm_range_man_adjust_size(man, size >> PAGE_SHIFT);
>   }
>   
>   static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ad09329b62d3..cf8176bce4f6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -82,7 +82,6 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   {
>   	drm_printf(p, "    use_type: %d\n", man->use_type);
>   	drm_printf(p, "    use_tt: %d\n", man->use_tt);
> -	drm_printf(p, "    size: %llu\n", man->size);
>   	drm_printf(p, "    available_caching: 0x%08X\n", man->available_caching);
>   	drm_printf(p, "    default_caching: 0x%08X\n", man->default_caching);
>   	if (man->func && man->func->debug)
> @@ -1468,8 +1467,7 @@ int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type)
>   }
>   EXPORT_SYMBOL(ttm_bo_evict_mm);
>   
> -void ttm_resource_manager_init(struct ttm_resource_manager *man,
> -			       unsigned long p_size)
> +void ttm_resource_manager_init(struct ttm_resource_manager *man)
>   {
>   	unsigned i;
>   
> @@ -1477,7 +1475,6 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>   	mutex_init(&man->io_reserve_mutex);
>   	spin_lock_init(&man->move_lock);
>   	INIT_LIST_HEAD(&man->io_reserve_lru);
> -	man->size = p_size;
>   
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		INIT_LIST_HEAD(&man->lru[i]);
> @@ -1590,7 +1587,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
>   	man->available_caching = TTM_PL_MASK_CACHING;
>   	man->default_caching = TTM_PL_FLAG_CACHED;
>   
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man);
>   	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
>   	ttm_resource_manager_set_used(man, true);
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 274a05ca13d3..0dc4b17cc3dc 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -47,6 +47,7 @@ struct ttm_range_manager {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
>   	spinlock_t lock;
> +	uint64_t size;
>   };
>   
>   static inline struct ttm_range_manager *to_range_manager(struct ttm_resource_manager *man)
> @@ -68,7 +69,7 @@ static int ttm_range_man_get_node(struct ttm_resource_manager *man,
>   
>   	lpfn = place->lpfn;
>   	if (!lpfn)
> -		lpfn = man->size;
> +		lpfn = rman->size;
>   
>   	node = kzalloc(sizeof(*node), GFP_KERNEL);
>   	if (!node)
> @@ -133,8 +134,9 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
>   
>   	man->func = &ttm_range_manager_func;
>   
> -	ttm_resource_manager_init(man, p_size);
> +	ttm_resource_manager_init(man);
>   
> +	rman->size = p_size;
>   	drm_mm_init(&rman->mm, 0, p_size);
>   	spin_lock_init(&rman->lock);
>   
> @@ -185,3 +187,18 @@ static const struct ttm_resource_manager_func ttm_range_manager_func = {
>   	.put_node = ttm_range_man_put_node,
>   	.debug = ttm_range_man_debug
>   };
> +
> +void ttm_range_man_adjust_size(struct ttm_resource_manager *man,
> +			       unsigned long size)
> +{
> +	struct ttm_range_manager *rman = to_range_manager(man);
> +	rman->size = size;
> +}
> +EXPORT_SYMBOL(ttm_range_man_adjust_size);
> +
> +unsigned long ttm_range_man_size(struct ttm_resource_manager *man)
> +{
> +	struct ttm_range_manager *rman = to_range_manager(man);
> +	return rman->size;
> +}
> +EXPORT_SYMBOL(ttm_range_man_size);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 3fea7a6c7cfa..a7a2deae2277 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -116,7 +116,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>   	man->default_caching = TTM_PL_FLAG_CACHED;
>   	/* TODO: This is most likely not correct */
>   	man->use_tt = true;
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man);
>   	spin_lock_init(&gman->lock);
>   	gman->used_gmr_pages = 0;
>   	ida_init(&gman->gmr_ida);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index f594e2e6ab7e..74cdee48b191 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -19,6 +19,7 @@ struct vmw_thp_manager {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
>   	spinlock_t lock;
> +	uint64_t size;
>   };
>   
>   static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
> @@ -63,7 +64,7 @@ static int vmw_thp_get_node(struct ttm_resource_manager *man,
>   
>   	lpfn = place->lpfn;
>   	if (!lpfn)
> -		lpfn = man->size;
> +		lpfn = rman->size;
>   
>   	mode = DRM_MM_INSERT_BEST;
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> @@ -134,10 +135,10 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>   	man->available_caching = TTM_PL_FLAG_CACHED;
>   	man->default_caching = TTM_PL_FLAG_CACHED;
>   
> -	ttm_resource_manager_init(man,
> -				  dev_priv->vram_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man);
>   
> -	drm_mm_init(&rman->mm, 0, man->size);
> +	rman->size = dev_priv->vram_size >> PAGE_SHIFT;
> +	drm_mm_init(&rman->mm, 0, rman->size);
>   	spin_lock_init(&rman->lock);
>   
>   	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 770ad2195875..e4bf93482b59 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -537,12 +537,10 @@ int ttm_bo_create(struct ttm_bo_device *bdev, unsigned long size,
>    * ttm_resource_manager_init
>    *
>    * @man: memory manager object to init
> - * @p_size: size managed area in pages.
>    *
>    * Initialise core parts of a manager object.
>    */
> -void ttm_resource_manager_init(struct ttm_resource_manager *man,
> -			       unsigned long p_size);
> +void ttm_resource_manager_init(struct ttm_resource_manager *man);
>   
>   /**
>    * ttm_bo_evict_mm
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index eb1c3312e175..c719b4aa3793 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -116,7 +116,6 @@ struct ttm_resource_manager_func {
>    * managed by this memory type.
>    * @gpu_offset: If used, the GPU offset of the first managed page of
>    * fixed memory or the first managed location in an aperture.
> - * @size: Size of the managed region.
>    * @available_caching: A mask of available caching types, TTM_PL_FLAG_XX,
>    * as defined in ttm_placement_common.h
>    * @default_caching: The default caching policy used for a buffer object
> @@ -142,7 +141,6 @@ struct ttm_resource_manager {
>   	 */
>   	bool use_type;
>   	bool use_tt;
> -	uint64_t size;
>   	uint32_t available_caching;
>   	uint32_t default_caching;
>   	const struct ttm_resource_manager_func *func;
> @@ -883,4 +881,22 @@ int ttm_range_man_fini(struct ttm_bo_device *bdev,
>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
> +/**
> + * ttm_range_man_adjust_size
> + *
> + * @man: manager to adjust size for
> + * @p_size: new size.
> + */
> +void ttm_range_man_adjust_size(struct ttm_resource_manager *man,
> +			       unsigned long p_size);
> +
> +/**
> + * ttm_range_man_size
> + *
> + * @man: manager to get size for
> + * Returns:
> + * size of range manager.
> + */
> +unsigned long ttm_range_man_size(struct ttm_resource_manager *man);
> +
>   #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
