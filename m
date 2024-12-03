Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1049E1ED8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2B110EA20;
	Tue,  3 Dec 2024 14:17:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fnULkyrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49C310EA20;
 Tue,  3 Dec 2024 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9os0pCp6DorfTCNWcBNM8Qdpy2bJqgk0SCVCWt6e3mY=; b=fnULkyrFxkORVB4CUb52H7x2IW
 i7F5RY0P/VaWgYXpSSOs2j2Cy+3izMTgl5AjmG4h2hO1yphg8MnIzOGfsH57i+B/NutCZD+vJwHmW
 kw3fyzwhLBFfayVC/BsNbcQWkXVVvlRwScFudOYA6x1eRs+fhr7c1IRu4tevufBqJwzk+1h0CQ6mO
 ZBNaYGrbXuLtXn5w0aCqaWXwv1enmIMCKGeyggZ9lI0EsnnXsNIGnBEcy6A0F03o4vrDYYgWQQHQd
 71F5M9n5FFDy1un/fMw7/YiSZH4ZDssKp/XK0PY+y5xHwOfaUE6rBestbz48UCTbH5BnjEJNNul/v
 Lo/5+ufg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tITi0-00Fp9T-0B; Tue, 03 Dec 2024 15:17:00 +0100
Message-ID: <db43b379-2100-40fa-ab32-5293779663ab@igalia.com>
Date: Tue, 3 Dec 2024 14:16:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/5] drm: make drm-active- stats optional
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20241128185404.2672-1-Yunxiang.Li@amd.com>
 <20241128185404.2672-3-Yunxiang.Li@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241128185404.2672-3-Yunxiang.Li@amd.com>
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


On 28/11/2024 18:54, Yunxiang Li wrote:
> When memory stats is generated fresh everytime by going though all the
> BOs, their active information is quite easy to get. But if the stats are
> tracked with BO's state this becomes harder since the job scheduling
> part doesn't really deal with individual buffers.
> 
> Make drm-active- optional to enable amdgpu to switch to the second
> method.
> 
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> CC: dri-devel@lists.freedesktop.org
> CC: intel-gfx@lists.freedesktop.org
> CC: amd-gfx@lists.freedesktop.org
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  1 +
>   drivers/gpu/drm/drm_file.c                 | 13 +++++++------
>   drivers/gpu/drm/i915/i915_drm_client.c     |  1 +
>   drivers/gpu/drm/xe/xe_drm_client.c         |  1 +
>   include/drm/drm_gem.h                      | 14 ++++++++------
>   5 files changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index df2cf5c339255..7717e3e4f05b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -97,6 +97,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   		drm_print_memory_stats(p,
>   				       &stats[i].drm,
> +				       DRM_GEM_OBJECT_ACTIVE |
>   				       DRM_GEM_OBJECT_RESIDENT |
>   				       DRM_GEM_OBJECT_PURGEABLE,
>   				       pl_name[i]);
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e285fcc28c59c..fd06671054723 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -884,7 +884,9 @@ void drm_print_memory_stats(struct drm_printer *p,
>   {
>   	print_size(p, "total", region, stats->private + stats->shared);
>   	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +
> +	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
> +		print_size(p, "active", region, stats->active);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
>   		print_size(p, "resident", region, stats->resident);
> @@ -917,15 +919,13 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   
>   		if (obj->funcs && obj->funcs->status) {
>   			s = obj->funcs->status(obj);
> -			supported_status = DRM_GEM_OBJECT_RESIDENT |
> -					DRM_GEM_OBJECT_PURGEABLE;
> +			supported_status |= s;
>   		}
>   
> -		if (drm_gem_object_is_shared_for_memory_stats(obj)) {
> +		if (drm_gem_object_is_shared_for_memory_stats(obj))
>   			status.shared += obj->size;
> -		} else {
> +		else
>   			status.private += obj->size;
> -		}
>   
>   		if (s & DRM_GEM_OBJECT_RESIDENT) {
>   			status.resident += add_size;
> @@ -938,6 +938,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   
>   		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
>   			status.active += add_size;
> +			supported_status |= DRM_GEM_OBJECT_ACTIVE;
>   
>   			/* If still active, don't count as purgeable: */
>   			s &= ~DRM_GEM_OBJECT_PURGEABLE;
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index f586825054918..168d7375304bc 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -102,6 +102,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   	for_each_memory_region(mr, i915, id)
>   		drm_print_memory_stats(p,
>   				       &stats[id],
> +				       DRM_GEM_OBJECT_ACTIVE |
>   				       DRM_GEM_OBJECT_RESIDENT |
>   				       DRM_GEM_OBJECT_PURGEABLE,
>   				       mr->uabi_name);
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index 6a26923fa10e0..54941b4e850c4 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -229,6 +229,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
>   		if (man) {
>   			drm_print_memory_stats(p,
>   					       &stats[mem_type],
> +					       DRM_GEM_OBJECT_ACTIVE |
>   					       DRM_GEM_OBJECT_RESIDENT |
>   					       (mem_type != XE_PL_SYSTEM ? 0 :
>   					       DRM_GEM_OBJECT_PURGEABLE),
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bae4865b2101a..da11c16e212aa 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -48,19 +48,21 @@ struct drm_gem_object;
>    * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>    * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>    * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
> + * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
>    *
>    * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
> - * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
> - * it still active or not resident, in which case drm_show_fdinfo() will not
> + * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
> + * and be active or not resident, in which case drm_show_fdinfo() will not
>    * account for it as purgeable.  So drivers do not need to check if the buffer
> - * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
> - * as purgeable even while it is still busy on the GPU.. it does not _actually_
> - * become puregeable until it becomes idle.  The status gem object func does
> - * not need to consider this.)
> + * is idle and resident to return this bit, i.e. userspace can mark a buffer as
> + * purgeable even while it is still busy on the GPU. It will not get reported in
> + * the puregeable stats until it becomes idle.  The status gem object func does
> + * not need to consider this.
>    */
>   enum drm_gem_object_status {
>   	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>   	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
> +	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
>   };
>   
>   /**

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
