Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21259F397C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 20:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180510E76A;
	Mon, 16 Dec 2024 19:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T6vWQpdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED4410E76A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 19:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fzOpm3zaxnyR/WOuUm8pfly1yxmHTac1V+W4iZtqmH8=; b=T6vWQpdqco5cQMXU1qcCDajOof
 8FGSirEV2713PlA6CQ7gGCQcyaodC5CgGjvIB1sndUbkeack8wpisUeNFYldOIXqzfR+pblKiVI1L
 Wikhmy8GCZNt1/Lf7JrnOrwCSfA7S86VO8dGycC0pgXYwwarv1+Z7R4PMffQnOLyocyLu/SQAd9rj
 fwmLywk/WUgiS8WG8MTlLOs3+e4byuWEbwCt6JcNnYEojzt0/6fajQeJATc4JXBLd5xiDeGZickgI
 B+GE/CtsqBLo/havNua5BTCmWpqyxTGLLGwMrXv0I6fxaRE4PKybIXRum03Mfpvx87Ux3LOdNEdCR
 Wz89jDmg==;
Received: from [179.214.71.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNGT4-003uV9-RM; Mon, 16 Dec 2024 20:09:23 +0100
Date: Mon, 16 Dec 2024 16:08:43 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
Message-ID: <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212202337.381614-2-mcanal@igalia.com>
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

On 12/12, Maíra Canal wrote:
> VC4 has internal copies of `drm_gem_lock_reservations()` and
> `drm_gem_unlock_reservations()` inside the driver and ideally, we should
> move those hard-coded functions to the generic functions provided by DRM.
> But, instead of using the DRM GEM functions to (un)lock reservations, move
> the new DRM Execution Contexts API.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vc4/Kconfig   |  1 +
>  drivers/gpu/drm/vc4/vc4_gem.c | 99 ++++++++---------------------------
>  2 files changed, 22 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> index c5f30b317698..0627e826fda4 100644
> --- a/drivers/gpu/drm/vc4/Kconfig
> +++ b/drivers/gpu/drm/vc4/Kconfig
> @@ -13,6 +13,7 @@ config DRM_VC4
>  	select DRM_DISPLAY_HDMI_HELPER
>  	select DRM_DISPLAY_HDMI_STATE_HELPER
>  	select DRM_DISPLAY_HELPER
> +	select DRM_EXEC
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 22bccd69eb62..1021f45cb53c 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -29,6 +29,7 @@
>  #include <linux/sched/signal.h>
>  #include <linux/dma-fence-array.h>
>  
> +#include <drm/drm_exec.h>
>  #include <drm/drm_syncobj.h>
>  
>  #include "uapi/drm/vc4_drm.h"
> @@ -578,19 +579,6 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
>  	}
>  }
>  
> -static void
> -vc4_unlock_bo_reservations(struct drm_device *dev,
> -			   struct vc4_exec_info *exec,
> -			   struct ww_acquire_ctx *acquire_ctx)
> -{
> -	int i;
> -
> -	for (i = 0; i < exec->bo_count; i++)
> -		dma_resv_unlock(exec->bo[i]->resv);
> -
> -	ww_acquire_fini(acquire_ctx);
> -}
> -
>  /* Takes the reservation lock on all the BOs being referenced, so that
>   * at queue submit time we can update the reservations.
>   *
> @@ -599,70 +587,23 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
>   * to vc4, so we don't attach dma-buf fences to them.
>   */
>  static int
> -vc4_lock_bo_reservations(struct drm_device *dev,
> -			 struct vc4_exec_info *exec,
> -			 struct ww_acquire_ctx *acquire_ctx)
> +vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> +			 struct drm_exec *exec_ctx)
>  {
> -	int contended_lock = -1;
> -	int i, ret;
> -	struct drm_gem_object *bo;
> -
> -	ww_acquire_init(acquire_ctx, &reservation_ww_class);
> -
> -retry:
> -	if (contended_lock != -1) {
> -		bo = exec->bo[contended_lock];
> -		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
> -		if (ret) {
> -			ww_acquire_done(acquire_ctx);
> -			return ret;
> -		}
> -	}
> -
> -	for (i = 0; i < exec->bo_count; i++) {
> -		if (i == contended_lock)
> -			continue;
> -
> -		bo = exec->bo[i];
> -
> -		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
> -		if (ret) {
> -			int j;
> -
> -			for (j = 0; j < i; j++) {
> -				bo = exec->bo[j];
> -				dma_resv_unlock(bo->resv);
> -			}
> -
> -			if (contended_lock != -1 && contended_lock >= i) {
> -				bo = exec->bo[contended_lock];
> -
> -				dma_resv_unlock(bo->resv);
> -			}
> -
> -			if (ret == -EDEADLK) {
> -				contended_lock = i;
> -				goto retry;
> -			}
> -
> -			ww_acquire_done(acquire_ctx);
> -			return ret;
> -		}
> -	}
> -
> -	ww_acquire_done(acquire_ctx);
> +	int ret;
>  
>  	/* Reserve space for our shared (read-only) fence references,
>  	 * before we commit the CL to the hardware.
>  	 */
> -	for (i = 0; i < exec->bo_count; i++) {
> -		bo = exec->bo[i];
> +	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> +	drm_exec_until_all_locked(exec_ctx) {
> +		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> +					     exec->bo_count, 1);

Hi Maíra,

So, I'm not familiar too drm_exec, but the original implementation of
vc4_lock_bo_reservations() has a retry of locks from the contention and
I don't see it inside the drm_exec_prepare_array(), why don't use the
loop drm_exec_prepare_obj() plus drm_exec_retry_on_contention() (similar
to the typical usage documented for drm_exec)?

Also, probably you already considered that: we can extend this update to
v3d, right?

Melissa

> +	}
>  
> -		ret = dma_resv_reserve_fences(bo->resv, 1);
> -		if (ret) {
> -			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> -			return ret;
> -		}
> +	if (ret) {
> +		drm_exec_fini(exec_ctx);
> +		return ret;
>  	}
>  
>  	return 0;
> @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>   */
>  static int
>  vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
> -		 struct ww_acquire_ctx *acquire_ctx,
> +		 struct drm_exec *exec_ctx,
>  		 struct drm_syncobj *out_sync)
>  {
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
> @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>  
>  	vc4_update_bo_seqnos(exec, seqno);
>  
> -	vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> +	drm_exec_fini(exec_ctx);
>  
>  	list_add_tail(&exec->head, &vc4->bin_job_list);
>  
> @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>  	struct drm_vc4_submit_cl *args = data;
>  	struct drm_syncobj *out_sync = NULL;
>  	struct vc4_exec_info *exec;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec_ctx;
>  	struct dma_fence *in_fence;
>  	int ret = 0;
>  
> @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto fail;
>  
> -	ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
> +	ret = vc4_lock_bo_reservations(exec, &exec_ctx);
>  	if (ret)
>  		goto fail;
>  
> @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>  		out_sync = drm_syncobj_find(file_priv, args->out_sync);
>  		if (!out_sync) {
>  			ret = -EINVAL;
> -			goto fail;
> +			goto fail_unreserve;
>  		}
>  
>  		/* We replace the fence in out_sync in vc4_queue_submit since
> @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>  	 */
>  	exec->args = NULL;
>  
> -	ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
> +	ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
>  
>  	/* The syncobj isn't part of the exec data and we need to free our
>  	 * reference even if job submission failed.
> @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
>  		drm_syncobj_put(out_sync);
>  
>  	if (ret)
> -		goto fail;
> +		goto fail_unreserve;
>  
>  	/* Return the seqno for our job. */
>  	args->seqno = vc4->emit_seqno;
>  
>  	return 0;
>  
> +fail_unreserve:
> +	drm_exec_fini(&exec_ctx);
>  fail:
>  	vc4_complete_exec(&vc4->base, exec);
>  
> -- 
> 2.47.1
> 
