Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D24922C87FB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 16:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF26E513;
	Mon, 30 Nov 2020 15:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BBF6E516
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 15:30:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e25so6697717wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RWLqIywFtrqrBkq/ZNV0O8uiKvpij3wbbn35Lb/5ZuM=;
 b=at49uVfOayW2p6eUQRBPvl9CY4/SPpmJRaCsBSfVUz3AYxJu/AOhCbsGLjZ+XR+z6Z
 IVeD+/S1obeUYkNmcW3GY3htoeh3ff2p+p5WNPOF9FypOv0TztdlZFG+HZuEwhCeOLnq
 NSpEGJKwiTOzGHZfUKS1/eTIcR+4qWBDElcKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RWLqIywFtrqrBkq/ZNV0O8uiKvpij3wbbn35Lb/5ZuM=;
 b=tuVasaPHANJVCyRxJxgYygR0gXcANgV0KdC6+qRbHrzvFp/8nph63V/IBmXs7Z/Ry1
 Nwwr8+niHTdDesQtKmrRbWtNYVxMoRtJa7rzVmD4pTEU9PWckaoIGvYIpvlzPf6DgvRu
 V5VSUGOi9bDKYPpUijiMyjxOBb4+rzR02k6moZBhJoLB+X/EPSIM+zsDqJ2fD5+t0Yyt
 LMAVc7MBej8vNxBISdsNTKRKxYMivzyDi/Dfwsti3InIBjITGl00VgVwlRNTzkazyupO
 KpAxontz15KMiD6Wr/3ybwxBy8xtJaJ09Txiq+JKlTsfL9v7TFqYrnXljCHIE1L2nQXa
 Ox0Q==
X-Gm-Message-State: AOAM533ziJyhSRvTnu7OvDv77fqB8Cixv4PmbCg9uSFdKOUgdjC8KKbj
 VI696Pnolf0DNBKq5SxdnIrsoA==
X-Google-Smtp-Source: ABdhPJxTJYBqhNZMzVA7bBkie6JHrnE0E+Im3h54w8utnlycMFiG5v498MUull1oMdRpoQfqSIQupg==
X-Received: by 2002:a1c:1bc9:: with SMTP id
 b192mr15502469wmb.136.1606750251320; 
 Mon, 30 Nov 2020 07:30:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 189sm11857653wma.22.2020.11.30.07.30.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:30:50 -0800 (PST)
Date: Mon, 30 Nov 2020 16:30:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
Message-ID: <20201130153048.GS401619@phenom.ffwll.local>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130120433.7205-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: hdegoede@redhat.com, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 01:04:26PM +0100, Thomas Zimmermann wrote:
> Mapping a GEM object's buffer into kernel address space prevents the
> buffer from being evicted from VRAM, which in turn may result in
> out-of-memory errors. It's therefore required to only vmap GEM BOs for
> short periods of time; unless the GEM implementation provides additional
> guarantees.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_prime.c |  6 ++++++
>  include/drm/drm_gem.h       | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 7db55fce35d8..9c9ece9833e0 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -669,6 +669,12 @@ EXPORT_SYMBOL(drm_gem_unmap_dma_buf);
>   * callback. Calls into &drm_gem_object_funcs.vmap for device specific handling.
>   * The kernel virtual address is returned in map.
>   *
> + * To prevent the GEM object from being relocated, callers must hold the GEM
> + * object's reservation lock from when calling this function until releasing the
> + * mapping. Holding onto a mapping and the associated reservation lock for an
> + * unbound time may result in out-of-memory errors. Calls to drm_gem_dmabuf_vmap()
> + * should therefore be accompanied by a call to drm_gem_dmabuf_vunmap().
> + *
>   * Returns 0 on success or a negative errno code otherwise.

This is a dma-buf hook, which means just documenting the rules you'd like
to have here isn't enough. We need to roll this out at the dma-buf level,
and enforce it.

Enforce it = assert_lock_held

Roll out = review everyone. Because this goes through dma-buf it'll come
back through shmem helpers (and other helpers and other subsystems) back
to any driver using vmap for gpu buffers. This includes the media
subsystem, and the media subsystem definitely doesn't cope with just
temporarily mapping buffers. So there we need to pin them, which I think
means we'll need 2 version of dma_buf_vmap - one that's temporary and
requires we hold dma_resv lock, the other requires that the buffer is
pinned.

That's what I meant with that this approach here is very sprawling :-/
-Daniel

>   */
>  int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_map *map)
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 5e6daa1c982f..7c34cd5ec261 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -137,7 +137,21 @@ struct drm_gem_object_funcs {
>  	 * Returns a virtual address for the buffer. Used by the
>  	 * drm_gem_dmabuf_vmap() helper.
>  	 *
> +	 * Notes to implementors:
> +	 *
> +	 * - Implementations must expect pairs of @vmap and @vunmap to be
> +	 *   called frequently and should optimize for this case.
> +	 *
> +	 * - Implemenations may expect the caller to hold the GEM object's
> +	 *   reservation lock to protect against concurrent calls and relocation
> +	 *   of the GEM object.
> +	 *
> +	 * - Implementations may provide additional guarantees (e.g., working
> +	 *   without holding the reservation lock).
> +	 *
>  	 * This callback is optional.
> +	 *
> +	 * See also drm_gem_dmabuf_vmap()
>  	 */
>  	int (*vmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
> @@ -148,6 +162,8 @@ struct drm_gem_object_funcs {
>  	 * drm_gem_dmabuf_vunmap() helper.
>  	 *
>  	 * This callback is optional.
> +	 *
> +	 * See also @vmap.
>  	 */
>  	void (*vunmap)(struct drm_gem_object *obj, struct dma_buf_map *map);
>  
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
