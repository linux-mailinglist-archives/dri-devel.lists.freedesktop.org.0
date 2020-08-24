Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B7924F312
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 09:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F3E6E1B2;
	Mon, 24 Aug 2020 07:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13956E1B2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 07:24:43 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id b2so7126761edw.5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 00:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JQhe2TwsvYSS5W+dXPyOis7nazcu/3wqiq9MuxZoClE=;
 b=cEByC1p9HZsYcy5Lf6b6z2UpLFP123hCk9hiwAn6dHYebEeswLfH/9+3tzA0tMZZWr
 uRuskvFeYkkeFNa1DXRerNwxBZSa4YSdeEoOr4TZ3HbfyGw/2QHy/HSnJCYgIPUDt7FG
 DrH6ALTFR6tl7DCtLrfoCVMsA7QNF0LgwrgK5Ry6A0cLmKombt5vy7Aff6yFUTxH+Vgs
 Kg6VjxyVY98jHwBZxLYRHCj6mywiwMfFUOKGd6cqX03aGw6tprrumEcJXgCqqRAJABXS
 xpISbXbxBAcxVbfiGXo19k1raqz5c0wwSmK2F15MRHOaZutkQ1GsAwp/MWIrKcCHXsOQ
 NLLA==
X-Gm-Message-State: AOAM5332oNMKRfYUeY6QDCo++8SJ3ESDHJkDqDsGIq/sIjQichYTFLKZ
 Z05IZKmdCjGHXIyl7jt93yE=
X-Google-Smtp-Source: ABdhPJz8DNv8UC+cvnA3KSEUH4jbL1XJhNOQ6zDRmRRPttp/pkFHhwmeO45aGK7OTDvv2Ia5IQ1Yqw==
X-Received: by 2002:a05:6402:1b02:: with SMTP id
 by2mr1245225edb.95.1598253882449; 
 Mon, 24 Aug 2020 00:24:42 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id zm10sm5178531ejb.91.2020.08.24.00.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2020 00:24:41 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/virtio: fix unblank
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200818072511.6745-1-kraxel@redhat.com>
 <20200818072511.6745-2-kraxel@redhat.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <88ae71c2-c3ed-e0e4-e62c-bdf9d6534f2a@kernel.org>
Date: Mon, 24 Aug 2020 09:24:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818072511.6745-2-kraxel@redhat.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, 1882851@bugs.launchpad.net,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18. 08. 20, 9:25, Gerd Hoffmann wrote:
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

Tested-by: Jiri Slaby <jirislaby@kernel.org>

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
> 


-- 
js
suse labs
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
