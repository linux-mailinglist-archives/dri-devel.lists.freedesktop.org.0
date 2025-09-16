Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0EB59C9C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417FF10E058;
	Tue, 16 Sep 2025 15:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNF7eHoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4CE10E058
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758038123; x=1789574123;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ejGimSrqJ4B5tkiLt5URRUekzamq8tqyslt/pMg8kOw=;
 b=NNF7eHoA4wQp+ppTeRjHHVIeo8h3pZ2r85V4q4dPWjuDwf1TYU8rTVvj
 1WG9z5kY5g2wVeFMDNMxAmHwnkU2zAAbx8a7WS2kYFoRrFjGR8JnY5UHe
 3dDIUpeWsH/34pl2Cu9NRbnCDTMVYpIanQvB1ZMgAyoGPNumLTWc0DXas
 oZ0tbGy/Ylk/vigev0oCF+ZpMK4MNrRcOdw+5S5qWga8Xg2TXJW6JIedr
 MiXnG+3zwq4W2aurKumacpc/gXZhdnVzUCtlcg9BD390oOmtbqggaCQtn
 8K85+56m5OUSma2iLyJ7gH7fohgED1Ge2B/8BEge0YG9WRiwCVvSv79CV w==;
X-CSE-ConnectionGUID: 8uR+WcULQTCThxMhkr3Flg==
X-CSE-MsgGUID: ZfMwn/2HRLaJfnN+tOY6bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64127070"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64127070"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:55:22 -0700
X-CSE-ConnectionGUID: sP87AbSOQQqivrWYBPa4tw==
X-CSE-MsgGUID: roSA1V6PQw+zPai7xl0ktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="175757352"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 08:55:18 -0700
Message-ID: <50380149-c9cd-4478-9fe0-93d95a1016af@linux.intel.com>
Date: Tue, 16 Sep 2025 17:55:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH V1] accel/amdxdna: Call dma_buf_vmap_unlocked() for
 imported object
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20250915161046.135243-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250915161046.135243-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 9/15/2025 6:10 PM, Lizhi Hou wrote:

> In amdxdna_gem_obj_vmap(), calling dma_buf_vmap() triggers a kernel
> warning if LOCKDEP is enabled. So for imported object, use
> dma_buf_vmap_unlocked(). Then, use drm_gem_vmap() for other objects.
> The similar change applies to vunmap code.
>
> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/amdxdna_gem.c | 38 +++++++++++------------------
>   1 file changed, 14 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index d407a36eb412..50950be189ae 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -392,35 +392,25 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
>   	.vunmap = drm_gem_dmabuf_vunmap,
>   };
>   
> -static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> +static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, struct iosys_map *map)
>   {
> -	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
> -
>   	iosys_map_clear(map);
>   
> -	dma_resv_assert_held(obj->resv);
> -
>   	if (is_import_bo(abo))
> -		dma_buf_vmap(abo->dma_buf, map);
> -	else
> -		drm_gem_shmem_object_vmap(obj, map);
> -
> -	if (!map->vaddr)
> -		return -ENOMEM;
> +		return dma_buf_vmap_unlocked(abo->dma_buf, map);
Hi,

The dma_buf_vmap_unlocked() will call iosys_map_clear at its start so that
in this case it will be called twice. Probably it will be optimize out, 
but maybe
its something to better omit.
>   
> -	return 0;
> +	return drm_gem_vmap(to_gobj(abo), map);
>   }
>   
> -static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
> +static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo, struct iosys_map *map)
>   {
> -	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
> -
> -	dma_resv_assert_held(obj->resv);
> +	if (iosys_map_is_null(map))
> +		return;
>   
>   	if (is_import_bo(abo))
> -		dma_buf_vunmap(abo->dma_buf, map);
> -	else
> -		drm_gem_shmem_object_vunmap(obj, map);
> +		return dma_buf_vunmap_unlocked(abo->dma_buf, map);
I do also wonder what is the convention here on clearing iosys_map when 
returning.
The function drm_gem_vunmap will clear the map for callers while the 
other not.
I think at least comment explaining the logic will be necessary.

Best regards,
Maciej

> +
> +	return drm_gem_vunmap(to_gobj(abo), map);
>   }
>   
>   static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
> @@ -468,7 +458,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>   	if (abo->type == AMDXDNA_BO_DEV_HEAP)
>   		drm_mm_takedown(&abo->mm);
>   
> -	drm_gem_vunmap(gobj, &map);
> +	amdxdna_gem_obj_vunmap(abo, &map);
>   	mutex_destroy(&abo->lock);
>   
>   	if (is_import_bo(abo)) {
> @@ -489,8 +479,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
>   	.pin = drm_gem_shmem_object_pin,
>   	.unpin = drm_gem_shmem_object_unpin,
>   	.get_sg_table = drm_gem_shmem_object_get_sg_table,
> -	.vmap = amdxdna_gem_obj_vmap,
> -	.vunmap = amdxdna_gem_obj_vunmap,
> +	.vmap = drm_gem_shmem_object_vmap,
> +	.vunmap = drm_gem_shmem_object_vunmap,
>   	.mmap = amdxdna_gem_obj_mmap,
>   	.vm_ops = &drm_gem_shmem_vm_ops,
>   	.export = amdxdna_gem_prime_export,
> @@ -692,7 +682,7 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>   	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
>   	drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
>   
> -	ret = drm_gem_vmap(to_gobj(abo), &map);
> +	ret = amdxdna_gem_obj_vmap(abo, &map);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
>   		goto release_obj;
> @@ -770,7 +760,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>   	abo->type = AMDXDNA_BO_CMD;
>   	abo->client = filp->driver_priv;
>   
> -	ret = drm_gem_vmap(to_gobj(abo), &map);
> +	ret = amdxdna_gem_obj_vmap(abo, &map);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
>   		goto release_obj;
