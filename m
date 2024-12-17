Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15179F4B3C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1A10E964;
	Tue, 17 Dec 2024 12:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FwI+XeuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725E210E967
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jNmgbU6IsFHVUPTr4H0JAC4/T1HxsECMRSHE6c8AFR0=; b=FwI+XeuR6XBVOaipuGj/OMkAmo
 9iymHfUSfAhojZ5IAmJhU3ehd1QzqbuSj4zBrSPxsRjyo7fw++yfJgHxZJYHGYXIVRyRBkD6oWMJz
 h7Rq6MBLOQjcjS6GhzSmFA3X5HO2y90wlHJzwoNdI1KInJUpHLPJ3NotL8+lqeo9KjOM2CysZ+4Fc
 xkigDRNk5Sb/FsotCEzoNVG/C0JuDPVpqvTN3CiIiwuxGXFAtL4BSLwnupYa+NEG+X9OvGLGD7nnU
 RJjM5AzXf7zAJIJ9YfPs9GgAESkWIw0530NGl+2rd31PxTb7beLtTU/eH7z2gndNrDjs8oWH/XMHs
 gdUuTEvg==;
Received: from [179.214.71.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNX22-004N4A-3a; Tue, 17 Dec 2024 13:50:34 +0100
Date: Tue, 17 Dec 2024 09:50:16 -0300
From: Melissa Wen <mwen@igalia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
Message-ID: <dusu3mdjxapqlvh7u4mybyn3et652mvqgehdqp2hwgg3jvean3@3nlvrv7afth2>
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
 <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
 <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
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

On 12/17, Christian König wrote:
> Am 16.12.24 um 20:08 schrieb Melissa Wen:
> > On 12/12, Maíra Canal wrote:
> > > VC4 has internal copies of `drm_gem_lock_reservations()` and
> > > `drm_gem_unlock_reservations()` inside the driver and ideally, we should
> > > move those hard-coded functions to the generic functions provided by DRM.
> > > But, instead of using the DRM GEM functions to (un)lock reservations, move
> > > the new DRM Execution Contexts API.
> > > 
> > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > ---
> > >   drivers/gpu/drm/vc4/Kconfig   |  1 +
> > >   drivers/gpu/drm/vc4/vc4_gem.c | 99 ++++++++---------------------------
> > >   2 files changed, 22 insertions(+), 78 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> > > index c5f30b317698..0627e826fda4 100644
> > > --- a/drivers/gpu/drm/vc4/Kconfig
> > > +++ b/drivers/gpu/drm/vc4/Kconfig
> > > @@ -13,6 +13,7 @@ config DRM_VC4
> > >   	select DRM_DISPLAY_HDMI_HELPER
> > >   	select DRM_DISPLAY_HDMI_STATE_HELPER
> > >   	select DRM_DISPLAY_HELPER
> > > +	select DRM_EXEC
> > >   	select DRM_KMS_HELPER
> > >   	select DRM_GEM_DMA_HELPER
> > >   	select DRM_PANEL_BRIDGE
> > > diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> > > index 22bccd69eb62..1021f45cb53c 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_gem.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> > > @@ -29,6 +29,7 @@
> > >   #include <linux/sched/signal.h>
> > >   #include <linux/dma-fence-array.h>
> > > +#include <drm/drm_exec.h>
> > >   #include <drm/drm_syncobj.h>
> > >   #include "uapi/drm/vc4_drm.h"
> > > @@ -578,19 +579,6 @@ vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
> > >   	}
> > >   }
> > > -static void
> > > -vc4_unlock_bo_reservations(struct drm_device *dev,
> > > -			   struct vc4_exec_info *exec,
> > > -			   struct ww_acquire_ctx *acquire_ctx)
> > > -{
> > > -	int i;
> > > -
> > > -	for (i = 0; i < exec->bo_count; i++)
> > > -		dma_resv_unlock(exec->bo[i]->resv);
> > > -
> > > -	ww_acquire_fini(acquire_ctx);
> > > -}
> > > -
> > >   /* Takes the reservation lock on all the BOs being referenced, so that
> > >    * at queue submit time we can update the reservations.
> > >    *
> > > @@ -599,70 +587,23 @@ vc4_unlock_bo_reservations(struct drm_device *dev,
> > >    * to vc4, so we don't attach dma-buf fences to them.
> > >    */
> > >   static int
> > > -vc4_lock_bo_reservations(struct drm_device *dev,
> > > -			 struct vc4_exec_info *exec,
> > > -			 struct ww_acquire_ctx *acquire_ctx)
> > > +vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> > > +			 struct drm_exec *exec_ctx)
> > >   {
> > > -	int contended_lock = -1;
> > > -	int i, ret;
> > > -	struct drm_gem_object *bo;
> > > -
> > > -	ww_acquire_init(acquire_ctx, &reservation_ww_class);
> > > -
> > > -retry:
> > > -	if (contended_lock != -1) {
> > > -		bo = exec->bo[contended_lock];
> > > -		ret = dma_resv_lock_slow_interruptible(bo->resv, acquire_ctx);
> > > -		if (ret) {
> > > -			ww_acquire_done(acquire_ctx);
> > > -			return ret;
> > > -		}
> > > -	}
> > > -
> > > -	for (i = 0; i < exec->bo_count; i++) {
> > > -		if (i == contended_lock)
> > > -			continue;
> > > -
> > > -		bo = exec->bo[i];
> > > -
> > > -		ret = dma_resv_lock_interruptible(bo->resv, acquire_ctx);
> > > -		if (ret) {
> > > -			int j;
> > > -
> > > -			for (j = 0; j < i; j++) {
> > > -				bo = exec->bo[j];
> > > -				dma_resv_unlock(bo->resv);
> > > -			}
> > > -
> > > -			if (contended_lock != -1 && contended_lock >= i) {
> > > -				bo = exec->bo[contended_lock];
> > > -
> > > -				dma_resv_unlock(bo->resv);
> > > -			}
> > > -
> > > -			if (ret == -EDEADLK) {
> > > -				contended_lock = i;
> > > -				goto retry;
> > > -			}
> > > -
> > > -			ww_acquire_done(acquire_ctx);
> > > -			return ret;
> > > -		}
> > > -	}
> > > -
> > > -	ww_acquire_done(acquire_ctx);
> > > +	int ret;
> > >   	/* Reserve space for our shared (read-only) fence references,
> > >   	 * before we commit the CL to the hardware.
> > >   	 */
> > > -	for (i = 0; i < exec->bo_count; i++) {
> > > -		bo = exec->bo[i];
> > > +	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
> > > +	drm_exec_until_all_locked(exec_ctx) {
> > > +		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
> > > +					     exec->bo_count, 1);
> > Hi Maíra,
> > 
> > So, I'm not familiar too drm_exec, but the original implementation of
> > vc4_lock_bo_reservations() has a retry of locks from the contention and
> > I don't see it inside the drm_exec_prepare_array(), why don't use the
> > loop drm_exec_prepare_obj() plus drm_exec_retry_on_contention() (similar
> > to the typical usage documented for drm_exec)?
> 
> The way how drm_exec and drm_exec_prepare_array is used seems to be correct
> here.
> 
> drm_exec_prepare_array() basically just loops over all the GEM BOs in the
> array and calls drm_exec_prepare_obj() on them, so no need to open code
> that.
> 
> drm_exec_retry_on_contention() is only needed if you have multiple calls to
> drm_exec_prepare_array() or drm_exec_prepare_obj(), so that the loop is
> restarted in between the calls.

Current behavior of vc4 is to retry locking the contended lock and then
all others, instead of just return on error, and I don't see this being
covered by drm_exec_prepare_array(). vc4 behavior seems closer to what
is done by MSM, a loop of drm_exec_prepare_obj() plus
drm_exec_retry_on_contention().

Moreover, I don't see any DRM driver using drm_exec_prepare_array(), so
maybe updating this function would make it more useful and meet vc4
current behavior too. Something as below:

```
int drm_exec_prepare_array(struct drm_exec *exec,
			   struct drm_gem_object **objects,
			   unsigned int num_objects,
			   unsigned int num_fences)
{
	int ret;

	for (unsigned int i = 0; i < num_objects; ++i) {
		ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
		drm_exec_retry_on_contention(exec); <----- here
		if (unlikely(ret))
			return ret;
	}

	return 0;
}
```

WDYT?

Melissa

> 
> Regards,
> Christian.
> 
> > 
> > Also, probably you already considered that: we can extend this update to
> > v3d, right?
> > 
> > Melissa
> > 
> > > +	}
> > > -		ret = dma_resv_reserve_fences(bo->resv, 1);
> > > -		if (ret) {
> > > -			vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> > > -			return ret;
> > > -		}
> > > +	if (ret) {
> > > +		drm_exec_fini(exec_ctx);
> > > +		return ret;
> > >   	}
> > >   	return 0;
> > > @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
> > >    */
> > >   static int
> > >   vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
> > > -		 struct ww_acquire_ctx *acquire_ctx,
> > > +		 struct drm_exec *exec_ctx,
> > >   		 struct drm_syncobj *out_sync)
> > >   {
> > >   	struct vc4_dev *vc4 = to_vc4_dev(dev);
> > > @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
> > >   	vc4_update_bo_seqnos(exec, seqno);
> > > -	vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
> > > +	drm_exec_fini(exec_ctx);
> > >   	list_add_tail(&exec->head, &vc4->bin_job_list);
> > > @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> > >   	struct drm_vc4_submit_cl *args = data;
> > >   	struct drm_syncobj *out_sync = NULL;
> > >   	struct vc4_exec_info *exec;
> > > -	struct ww_acquire_ctx acquire_ctx;
> > > +	struct drm_exec exec_ctx;
> > >   	struct dma_fence *in_fence;
> > >   	int ret = 0;
> > > @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> > >   	if (ret)
> > >   		goto fail;
> > > -	ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
> > > +	ret = vc4_lock_bo_reservations(exec, &exec_ctx);
> > >   	if (ret)
> > >   		goto fail;
> > > @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> > >   		out_sync = drm_syncobj_find(file_priv, args->out_sync);
> > >   		if (!out_sync) {
> > >   			ret = -EINVAL;
> > > -			goto fail;
> > > +			goto fail_unreserve;
> > >   		}
> > >   		/* We replace the fence in out_sync in vc4_queue_submit since
> > > @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> > >   	 */
> > >   	exec->args = NULL;
> > > -	ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
> > > +	ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
> > >   	/* The syncobj isn't part of the exec data and we need to free our
> > >   	 * reference even if job submission failed.
> > > @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, void *data,
> > >   		drm_syncobj_put(out_sync);
> > >   	if (ret)
> > > -		goto fail;
> > > +		goto fail_unreserve;
> > >   	/* Return the seqno for our job. */
> > >   	args->seqno = vc4->emit_seqno;
> > >   	return 0;
> > > +fail_unreserve:
> > > +	drm_exec_fini(&exec_ctx);
> > >   fail:
> > >   	vc4_complete_exec(&vc4->base, exec);
> > > -- 
> > > 2.47.1
> > > 
> 
