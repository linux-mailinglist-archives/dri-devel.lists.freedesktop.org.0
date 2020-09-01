Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B7258CA0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 12:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1903889F69;
	Tue,  1 Sep 2020 10:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3194C89F69
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:20:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so612925wmm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 03:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3GIpy2hsxgFsBlpT+dsHbTbTluNWsmd1rZYjI09Uxc8=;
 b=XFND8mCwVNeeDtS+fg/HptRv9VEH756A1a+vj+5/P2wZZxyQEM2/bjCp/FcbmjsIPk
 r64cPgQLvDI8oXcy561SiPfA8aV7kY+UBcCu0AQ8GiBSuWvXWuc3bEsCZpZl1y0NbLne
 1C+QAYiqTPu98hOOlMgeWNFespOaXxl3tzfzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3GIpy2hsxgFsBlpT+dsHbTbTluNWsmd1rZYjI09Uxc8=;
 b=BiOI1FVi6wWMCTTAdk6ljOn4167AZLPLuwDrgFYZBaLXSq/BCVcdaf69ZvRdnDhFQd
 VhXVHWUheZnmFQy6+9iYPmCME/bTRuKSBI9x1cE7tknrV9Z4lwawLbNQ/5venoqH/06N
 htQWw/7txxmeSmkBuVMY2oKFSwKv+m1Qu6hSS3NU4u6fXXYkcsuAwFQ1dwmJThS6NUPh
 vDxwAiZ8TnM04OEntLeHtSPmXreyacdeVUJ5tLYwmmFRpgRPi2NdYXEpeV567JFdjODw
 lU1qzWaGnGbo7V3gU5zTqn7ugaFMO/H8tmn3jcAGfHjD7j3j+PyYw2TviUpPushe/beg
 cl2w==
X-Gm-Message-State: AOAM531xB8ExFis9yd+ba8yWvqkwZJ/y7YVGOWbWOiYIA3hAfckMybEB
 4AE8MfM053sYn9Dux1VFT8zy8Q==
X-Google-Smtp-Source: ABdhPJy0gJSV+RL3QsNU+fR8THpAo9rjW3MvBEvOVXFmBzuJReNfV54lLhSlHCW2A7mUll0ZBu5M0g==
X-Received: by 2002:a1c:f207:: with SMTP id s7mr1096430wmc.22.1598955609706;
 Tue, 01 Sep 2020 03:20:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m3sm800807wmb.26.2020.09.01.03.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 03:20:08 -0700 (PDT)
Date: Tue, 1 Sep 2020 12:20:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] drm/virtio: fix unblank
Message-ID: <20200901102006.GZ2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, 1882851@bugs.launchpad.net,
 David Airlie <airlied@linux.ie>, Chia-I Wu <olvaffe@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200818072511.6745-1-kraxel@redhat.com>
 <20200818072511.6745-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818072511.6745-2-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 1882851@bugs.launchpad.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 09:25:10AM +0200, Gerd Hoffmann wrote:
> When going through a disable/enable cycle without changing the
> framebuffer the optimization added by commit 3954ff10e06e ("drm/virtio:
> skip set_scanout if framebuffer didn't change") causes the screen stay
> blank.  Add a bool to force an update to fix that.
> 
> v2: use drm_atomic_crtc_needs_modeset() (Daniel).
> 
> Cc: 1882851@bugs.launchpad.net
> Fixes: 3954ff10e06e ("drm/virtio: skip set_scanout if framebuffer didn't change")
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h     |  1 +
>  drivers/gpu/drm/virtio/virtgpu_display.c | 11 +++++++++++
>  drivers/gpu/drm/virtio/virtgpu_plane.c   |  4 +++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 9ff9f4ac0522..4ab1b0ba2925 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -138,6 +138,7 @@ struct virtio_gpu_output {
>  	int cur_x;
>  	int cur_y;
>  	bool enabled;
> +	bool needs_modeset;

Maybe for a follow-up in -next: The clean atomic way of doing this is to
put this into a virtio_crtc_state, compute it in atomic_check, and then
fish it out (through old_state->state lookup, somewhat contrived I know)
in the commit side. Putting random atomic commit state tracking stuff into
non-state structures without appropriate amounts of locks is kinda iffy
and means more work for reviewers pondering whether it all works
correctly.

Cheers, Daniel


>  };
>  #define drm_crtc_to_virtio_gpu_output(x) \
>  	container_of(x, struct virtio_gpu_output, crtc)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
> index 2c2742b8d657..6c26b41f4e0d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> @@ -123,6 +123,17 @@ static int virtio_gpu_crtc_atomic_check(struct drm_crtc *crtc,
>  static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc,
>  					 struct drm_crtc_state *old_state)
>  {
> +	struct virtio_gpu_output *output = drm_crtc_to_virtio_gpu_output(crtc);
> +
> +	/*
> +	 * virtio-gpu can't do modeset and plane update operations
> +	 * independant from each other.  So the actual modeset happens
> +	 * in the plane update callback, and here we just check
> +	 * whenever we must force the modeset.
> +	 */
> +	if (drm_atomic_crtc_needs_modeset(crtc->state)) {
> +		output->needs_modeset = true;
> +	}
>  }
>  
>  static const struct drm_crtc_helper_funcs virtio_gpu_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
> index 52d24179bcec..65757409d9ed 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
> @@ -163,7 +163,9 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
>  	    plane->state->src_w != old_state->src_w ||
>  	    plane->state->src_h != old_state->src_h ||
>  	    plane->state->src_x != old_state->src_x ||
> -	    plane->state->src_y != old_state->src_y) {
> +	    plane->state->src_y != old_state->src_y ||
> +	    output->needs_modeset) {
> +		output->needs_modeset = false;
>  		DRM_DEBUG("handle 0x%x, crtc %dx%d+%d+%d, src %dx%d+%d+%d\n",
>  			  bo->hw_res_handle,
>  			  plane->state->crtc_w, plane->state->crtc_h,
> -- 
> 2.18.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
