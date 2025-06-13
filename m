Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FFAAD8E8A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA0B10E9D7;
	Fri, 13 Jun 2025 14:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HYzKXaVv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D6C10E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749823475; x=1781359475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rXd8G+7LAepvnCs58yRMWpbrdAVS+7MuGNt+Fdg+uHE=;
 b=HYzKXaVvF0P1jKt2AW+10g6E8ltRNdSXSf0mq5fwDaeIbbuMKVAqa9S+
 0qdy4FdX5z/4m++PWLabK7dpMlAU8ErpUhwLWEjhGkEZq/AJDzaKm8xU2
 8P92Xo80BUq5C2XlaiwWmwNE2yOSH/TGYbu4YH95ykGIhUSiLzXfdkjsO
 9BzJ12LDqJimELkxD1NEJb2trbanFJTAZsSreb7ua+Zv6gHiU9y1hzTd6
 F7/UAqmBiM79NWqImb2g8PPoIOYa8n0KAi2UrN4xg0VmWIpbcTRhI/Xk7
 7X5ZO1i0aJIJlnb8qsqD6QWC38RkgB7wHQjQbl/vOYinWfbEoOmEisfup A==;
X-CSE-ConnectionGUID: 0duKx3HLQ/SJdHOTrLDAdw==
X-CSE-MsgGUID: yKfbNxMJS/GvbsoygkfYGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="51757877"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="51757877"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 07:04:35 -0700
X-CSE-ConnectionGUID: 6Y0tk6HmRpeXSMzF/lLCFA==
X-CSE-MsgGUID: 37VFYeyzRCSj3XAGTelsvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="153126796"
Received: from johunt-mobl9.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.161])
 by orviesa005.jf.intel.com with SMTP; 13 Jun 2025 07:04:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Jun 2025 17:04:31 +0300
Date: Fri, 13 Jun 2025 17:04:31 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: tzimmermann@suse.de, simona.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: remove drm_prime_lookup_buf_by_handle
Message-ID: <aEwrIrczo1rSx2rr@intel.com>
References: <20250604113234.2520-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604113234.2520-1-christian.koenig@amd.com>
X-Patchwork-Hint: comment
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

On Wed, Jun 04, 2025 at 01:32:34PM +0200, Christian König wrote:
> This was added by Sima +10 years ago as a solution to avoid exporting
> multiple dma-bufs for the same GEM object. I tried to remove it before,
> but wasn't 100% sure about all the side effects.
> 
> Now Thomas recent modified drm_gem_prime_handle_to_dmabuf() which makes
> it obvious that this is a superflous step. We try to look up the DMA-buf
> by handle handle and if that fails for some reason (must likely because
> the handle is a duplicate) the code just use the DMA-buf from the GEM
> object.
> 
> Just using the DMA-buf from the GEM object in the first place has the
> same effect as far as I can see.

This screwed up i915/xe:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16692/bat-twl-1/igt@prime_self_import@basic-with_one_bo.html

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_gem.c      |  2 +-
>  drivers/gpu/drm/drm_internal.h |  1 +
>  drivers/gpu/drm/drm_prime.c    | 56 +++++-----------------------------
>  3 files changed, 10 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 1e659d2660f7..2eacd86e1cf9 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -282,7 +282,7 @@ drm_gem_object_release_handle(int id, void *ptr, void *data)
>  	if (obj->funcs->close)
>  		obj->funcs->close(obj, file_priv);
>  
> -	drm_prime_remove_buf_handle(&file_priv->prime, id);
> +	drm_prime_remove_buf_handle(&file_priv->prime, obj->dma_buf, id);
>  	drm_vma_node_revoke(&obj->vma_node, file_priv);
>  
>  	drm_gem_object_handle_put_unlocked(obj);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index e44f28fd81d3..504565857f4d 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -86,6 +86,7 @@ int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>  void drm_prime_init_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_destroy_file_private(struct drm_prime_file_private *prime_fpriv);
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 struct dma_buf *dma_buf,
>  				 uint32_t handle);
>  
>  /* drm_managed.c */
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index d828502268b8..f4facfa469db 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -90,7 +90,6 @@ struct drm_prime_member {
>  	uint32_t handle;
>  
>  	struct rb_node dmabuf_rb;
> -	struct rb_node handle_rb;
>  };
>  
>  static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
> @@ -122,45 +121,9 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  	rb_link_node(&member->dmabuf_rb, rb, p);
>  	rb_insert_color(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>  
> -	rb = NULL;
> -	p = &prime_fpriv->handles.rb_node;
> -	while (*p) {
> -		struct drm_prime_member *pos;
> -
> -		rb = *p;
> -		pos = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (handle > pos->handle)
> -			p = &rb->rb_right;
> -		else
> -			p = &rb->rb_left;
> -	}
> -	rb_link_node(&member->handle_rb, rb, p);
> -	rb_insert_color(&member->handle_rb, &prime_fpriv->handles);
> -
>  	return 0;
>  }
>  
> -static struct dma_buf *drm_prime_lookup_buf_by_handle(struct drm_prime_file_private *prime_fpriv,
> -						      uint32_t handle)
> -{
> -	struct rb_node *rb;
> -
> -	rb = prime_fpriv->handles.rb_node;
> -	while (rb) {
> -		struct drm_prime_member *member;
> -
> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (member->handle == handle)
> -			return member->dma_buf;
> -		else if (member->handle < handle)
> -			rb = rb->rb_right;
> -		else
> -			rb = rb->rb_left;
> -	}
> -
> -	return NULL;
> -}
> -
>  static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  				       struct dma_buf *dma_buf,
>  				       uint32_t *handle)
> @@ -186,25 +149,28 @@ static int drm_prime_lookup_buf_handle(struct drm_prime_file_private *prime_fpri
>  }
>  
>  void drm_prime_remove_buf_handle(struct drm_prime_file_private *prime_fpriv,
> +				 struct dma_buf *dma_buf,
>  				 uint32_t handle)
>  {
>  	struct rb_node *rb;
>  
> +	if (!dma_buf)
> +		return;
> +
>  	mutex_lock(&prime_fpriv->lock);
>  
> -	rb = prime_fpriv->handles.rb_node;
> +	rb = prime_fpriv->dmabufs.rb_node;
>  	while (rb) {
>  		struct drm_prime_member *member;
>  
> -		member = rb_entry(rb, struct drm_prime_member, handle_rb);
> -		if (member->handle == handle) {
> -			rb_erase(&member->handle_rb, &prime_fpriv->handles);
> +		member = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> +		if (member->dma_buf == dma_buf && member->handle == handle) {
>  			rb_erase(&member->dmabuf_rb, &prime_fpriv->dmabufs);
>  
>  			dma_buf_put(member->dma_buf);
>  			kfree(member);
>  			break;
> -		} else if (member->handle < handle) {
> +		} else if (member->dma_buf < dma_buf) {
>  			rb = rb->rb_right;
>  		} else {
>  			rb = rb->rb_left;
> @@ -446,12 +412,6 @@ struct dma_buf *drm_gem_prime_handle_to_dmabuf(struct drm_device *dev,
>  		goto out_unlock;
>  	}
>  
> -	dmabuf = drm_prime_lookup_buf_by_handle(&file_priv->prime, handle);
> -	if (dmabuf) {
> -		get_dma_buf(dmabuf);
> -		goto out;
> -	}
> -
>  	mutex_lock(&dev->object_name_lock);
>  	/* re-export the original imported/exported object */
>  	if (obj->dma_buf) {
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
