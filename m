Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FE8ACA11
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338A310F19C;
	Mon, 22 Apr 2024 09:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JYn4xA1q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C33710F19C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ib5Rx54dMQBeluD48M5yCvqXtKEnmtduquS21tklYu8=; b=JYn4xA1qET89x9TAas/gIYMbGH
 TL7TESsUuh+3TkPuvzjv28OuEFgpejt1ojM3QaeSO1J1oyssUxfUhptwbERE3Xwer7HAWPR9Cftuo
 OdaUEqjsoC6e+gETPm7+WroudJXd/gLcL1oRHWVPrgDfgnsai8U+4mmFByWT2PptyoswO96A5pqWp
 WuXaB1zPDPRwM7Y5mF/W2/1fQGBdCx6st6FCWvxQpFk4KdClDvRIABv32c/OgmqDg0t9arcjaq3dl
 sVrxiEMas0VXMR/nl/Pc0CWTRDEQa0V8lU5nn0cRWK8FTH4EYDT5803Ax1uRD0374rBS5KgDh9vYV
 0NYjLJIA==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ryqSW-007ClM-T9; Mon, 22 Apr 2024 11:59:36 +0200
Message-ID: <f9577321-c388-4a86-aa2d-ce4a9b64b433@igalia.com>
Date: Mon, 22 Apr 2024 10:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] drm/v3d: Use gemfs/THP in BO creation if available
Content-Language: en-GB
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240421215309.660018-1-mcanal@igalia.com>
 <20240421215309.660018-8-mcanal@igalia.com>
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240421215309.660018-8-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 21/04/2024 22:44, Maíra Canal wrote:
> Although Big/Super Pages could appear naturally, it would be quite hard
> to have 1MB or 64KB allocated contiguously naturally. Therefore, we can
> force the creation of large pages allocated contiguously by using a
> mountpoint with "huge=within_size" enabled.
> 
> As V3D has a mountpoint with "huge=within_size" (if user has THP enabled),
> use this mountpoint for BO creation if available. This will allow us to create
> large pages allocated contiguously and make use of Big/Super Pages.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_bo.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 79e31c5299b1..16ac26c31c6b 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -94,6 +94,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
>   	struct v3d_bo *bo = to_v3d_bo(obj);
>   	struct sg_table *sgt;
> +	u64 align;
>   	int ret;
>   
>   	/* So far we pin the BO in the MMU for its lifetime, so use
> @@ -103,6 +104,15 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> +	if (!v3d->gemfs)
> +		align = SZ_4K;
> +	else if (obj->size >= SZ_1M)
> +		align = SZ_1M;
> +	else if (obj->size >= SZ_64K)
> +		align = SZ_64K;
> +	else
> +		align = SZ_4K;

V3d has one GPU address space, right? I wonder if one day fragmentation 
could become an issue but it's a problem for another day. Patch looks 
fine to me.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> +
>   	spin_lock(&v3d->mm_lock);
>   	/* Allocate the object's space in the GPU's page tables.
>   	 * Inserting PTEs will happen later, but the offset is for the
> @@ -110,7 +120,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	 */
>   	ret = drm_mm_insert_node_generic(&v3d->mm, &bo->node,
>   					 obj->size >> V3D_MMU_PAGE_SHIFT,
> -					 SZ_4K >> V3D_MMU_PAGE_SHIFT, 0, 0);
> +					 align >> V3D_MMU_PAGE_SHIFT, 0, 0);
>   	spin_unlock(&v3d->mm_lock);
>   	if (ret)
>   		return ret;
> @@ -130,10 +140,17 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> +	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
>   	int ret;
>   
> -	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +	/* Let the user opt out of allocating the BOs with THP */
> +	if (v3d->gemfs)
> +		shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> +							  v3d->gemfs);
> +	else
> +		shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +
>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
