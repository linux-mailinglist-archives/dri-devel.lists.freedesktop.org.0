Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD8F9F3ABC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 21:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EFC10E796;
	Mon, 16 Dec 2024 20:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M7yF1Yc9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F16E10E7A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Vl5ai8gBCrajPTDp6JHTWgK/dGzq3IQDYcSMIFrKvQ=; b=M7yF1Yc9QZb7EMjnpr40689pcW
 VcyispCXRwiYBFn3CdAiyKs4UT3msR6+ti2pwS91U9B+rOzZoK/EifN3sSvleycZtFA4V67uXgS0V
 dgTAhweLepAlwwgVtfVp8m/mKmeiR3wNxxSTR6qjm86paQ/EL2wxdVsLAa29PnuD80C4qI4VX4Rgq
 ae8ybmuk52P+dLbyDi329mS0dRXQcvRwoHarqZAwduWztQLWlXvMjGZAKV+2peuayN5JFxe/fQbGX
 osQAC1JN8zWO3/vGlUAiXWz8CeUOyjsRGqwGIjpqvIxgiVzQCFXKYiFGcNsqXgoXjwNZ00OCsQPlB
 uaPfh7rA==;
Received: from [179.214.71.67] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tNHf1-003vvS-OH; Mon, 16 Dec 2024 21:25:48 +0100
Date: Mon, 16 Dec 2024 17:25:26 -0300
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v2 3/4] drm/vc4: Remove BOs seqnos
Message-ID: <gmtygjcms4gh4r3zbjlq3lmzzwfpmra45gxbcn4f45h65u2qat@yk6ylcftz4ci>
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212202337.381614-4-mcanal@igalia.com>
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
> `bo->seqno`, `bo->write_seqno`, and `exec->bin_dep_seqno` are leftovers
> from a time when VC4 didn't support DMA Reservation Objects. When they
> were introduced, it made sense to think about tracking the correspondence
> between the BOs and the jobs through the job's seqno.
> 
> This is no longer needed, as VC4 already has support for DMA Reservation
> Objects and attaches the "job done" fence to the BOs.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c     | 22 +++++++++++-----------
>  drivers/gpu/drm/vc4/vc4_drv.h      | 13 -------------
>  drivers/gpu/drm/vc4/vc4_gem.c      | 18 ++----------------
>  drivers/gpu/drm/vc4/vc4_validate.c | 11 -----------
>  4 files changed, 13 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index cf40a53ad42e..3a5b5743cb2f 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -919,10 +919,11 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
>  	kfree(flip_state);
>  }
>  
> -static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
> +static void vc4_async_page_flip_seqno_complete(struct dma_fence *fence,
> +					       struct dma_fence_cb *cb)
>  {
>  	struct vc4_async_flip_state *flip_state =
> -		container_of(cb, struct vc4_async_flip_state, cb.seqno);
> +		container_of(cb, struct vc4_async_flip_state, cb.fence);

hmm... I didn't get why you still call this function
vc4_async_page_flip_seqno_complete if you are not using seqno anymore.

On top of that, can we just use vc4_async_page_flip_fence_complete
instead? I mean, looks like we don't need two different async page flip
paths according to the hardware anymore.

>  	struct vc4_bo *bo = NULL;
>  
>  	if (flip_state->old_fb) {
> @@ -961,16 +962,15 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
>  {
>  	struct drm_framebuffer *fb = flip_state->fb;
>  	struct drm_gem_dma_object *dma_bo = drm_fb_dma_get_gem_obj(fb, 0);
> +	dma_fence_func_t async_page_flip_complete_function;
>  	struct vc4_dev *vc4 = to_vc4_dev(dev);
>  	struct dma_fence *fence;
>  	int ret;
>  
> -	if (vc4->gen == VC4_GEN_4) {
> -		struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
> -
> -		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> -					  vc4_async_page_flip_seqno_complete);
> -	}
> +	if (vc4->gen == VC4_GEN_4)
> +		async_page_flip_complete_function = vc4_async_page_flip_seqno_complete;
> +	else
> +		async_page_flip_complete_function = vc4_async_page_flip_fence_complete;
>  
>  	ret = dma_resv_get_singleton(dma_bo->base.resv, DMA_RESV_USAGE_READ, &fence);
>  	if (ret)
> @@ -978,14 +978,14 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
>  
>  	/* If there's no fence, complete the page flip immediately */
>  	if (!fence) {
> -		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> +		async_page_flip_complete_function(fence, &flip_state->cb.fence);
>  		return 0;
>  	}
>  
>  	/* If the fence has already been completed, complete the page flip */
>  	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
> -				   vc4_async_page_flip_fence_complete))
> -		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
> +				   async_page_flip_complete_function))
> +		async_page_flip_complete_function(fence, &flip_state->cb.fence);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 03ed40ab9a93..ff8048991030 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -247,16 +247,6 @@ struct vc4_dev {
>  struct vc4_bo {
>  	struct drm_gem_dma_object base;
>  
> -	/* seqno of the last job to render using this BO. */
> -	uint64_t seqno;
> -
> -	/* seqno of the last job to use the RCL to write to this BO.
> -	 *
> -	 * Note that this doesn't include binner overflow memory
> -	 * writes.
> -	 */
> -	uint64_t write_seqno;
> -
>  	bool t_format;
>  
>  	/* List entry for the BO's position in either
> @@ -695,9 +685,6 @@ struct vc4_exec_info {
>  	/* Sequence number for this bin/render job. */
>  	uint64_t seqno;
>  
> -	/* Latest write_seqno of any BO that binning depends on. */
> -	uint64_t bin_dep_seqno;
> -
>  	struct dma_fence *fence;
>  
>  	/* Last current addresses the hardware was processing when the
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 4037c65eb269..1cbd95c4f9ef 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -553,27 +553,19 @@ vc4_move_job_to_render(struct drm_device *dev, struct vc4_exec_info *exec)
>  }
>  
>  static void
> -vc4_update_bo_seqnos(struct vc4_exec_info *exec, uint64_t seqno)
> +vc4_attach_fences(struct vc4_exec_info *exec)
>  {
>  	struct vc4_bo *bo;
>  	unsigned i;
>  
>  	for (i = 0; i < exec->bo_count; i++) {
>  		bo = to_vc4_bo(exec->bo[i]);
> -		bo->seqno = seqno;
> -
>  		dma_resv_add_fence(bo->base.base.resv, exec->fence,
>  				   DMA_RESV_USAGE_READ);
>  	}
>  
> -	list_for_each_entry(bo, &exec->unref_list, unref_head) {
> -		bo->seqno = seqno;
> -	}
> -
>  	for (i = 0; i < exec->rcl_write_bo_count; i++) {
>  		bo = to_vc4_bo(&exec->rcl_write_bo[i]->base);
> -		bo->write_seqno = seqno;
> -
>  		dma_resv_add_fence(bo->base.base.resv, exec->fence,
>  				   DMA_RESV_USAGE_WRITE);
>  	}
> @@ -647,7 +639,7 @@ vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>  	if (out_sync)
>  		drm_syncobj_replace_fence(out_sync, exec->fence);
>  
> -	vc4_update_bo_seqnos(exec, seqno);
> +	vc4_attach_fences(exec);
>  
>  	drm_exec_fini(exec_ctx);
>  
> @@ -845,12 +837,6 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
>  			goto fail;
>  	}
>  
> -	/* Block waiting on any previous rendering into the CS's VBO,
> -	 * IB, or textures, so that pixels are actually written by the
> -	 * time we try to read them.
> -	 */
> -	ret = vc4_wait_for_seqno(dev, exec->bin_dep_seqno, ~0ull, true);

Don't we still need waiting for fences here?

> -
>  fail:
>  	kvfree(temp);
>  	return ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
> index 5bf134968ade..1e7bdda55698 100644
> --- a/drivers/gpu/drm/vc4/vc4_validate.c
> +++ b/drivers/gpu/drm/vc4/vc4_validate.c
> @@ -284,9 +284,6 @@ validate_indexed_prim_list(VALIDATE_ARGS)
>  	if (!ib)
>  		return -EINVAL;
>  
> -	exec->bin_dep_seqno = max(exec->bin_dep_seqno,
> -				  to_vc4_bo(&ib->base)->write_seqno);
> -
>  	if (offset > ib->base.size ||
>  	    (ib->base.size - offset) / index_size < length) {
>  		DRM_DEBUG("IB access overflow (%d + %d*%d > %zd)\n",
> @@ -738,11 +735,6 @@ reloc_tex(struct vc4_exec_info *exec,
>  
>  	*validated_p0 = tex->dma_addr + p0;
>  
> -	if (is_cs) {
> -		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
> -					  to_vc4_bo(&tex->base)->write_seqno);
> -	}
> -
>  	return true;
>   fail:
>  	DRM_INFO("Texture p0 at %d: 0x%08x\n", sample->p_offset[0], p0);
> @@ -904,9 +896,6 @@ validate_gl_shader_rec(struct drm_device *dev,
>  		uint32_t stride = *(uint8_t *)(pkt_u + o + 5);
>  		uint32_t max_index;
>  
> -		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
> -					  to_vc4_bo(&vbo->base)->write_seqno);
> -
>  		if (state->addr & 0x8)
>  			stride |= (*(uint32_t *)(pkt_u + 100 + i * 4)) & ~0xff;
>  
> -- 
> 2.47.1
> 
