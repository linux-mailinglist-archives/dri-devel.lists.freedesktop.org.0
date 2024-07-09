Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928D392B3DC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00B010E4D6;
	Tue,  9 Jul 2024 09:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bAE9X1rS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD5910E4DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 09:30:50 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ee9cb8d487so2014491fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720517449; x=1721122249; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IZ508PHn6u4V9pn1IwJRR5UC3ZFdK/qhxqHJ2u2OfcE=;
 b=bAE9X1rSpiCscXr2Orv69ayRqMgBpZssCyrN/OsW+xDCIF7fFBfQnOlUARL4DhgVKQ
 p7eVwPZKgTKDtCb5X+claWIW4VnLnPXhVMsVoakg9haexUzUoKePph3BJEBrUlQZlVju
 8LtW9szLTO04+SJ3lP0ZXLulaZVpJBgfrHSVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720517449; x=1721122249;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZ508PHn6u4V9pn1IwJRR5UC3ZFdK/qhxqHJ2u2OfcE=;
 b=UJKxngNwbDe9n+fjPVvBJyKyuPg+N22CBlUjUqKvCYYwKUK1MO3TI0sa9n7RZaZYZY
 NhHYVifP71ssCq/DZh5Q4tcsU2CLx7o2RqPzaVIkjXJCE+OIofm80wm5Hk9UpeHTrRpM
 e4vdSOILG/hsPxpJQjvO0cO5Uoy38zVKeEOa2sY/1F1GVCVzq+8v1tEnkkOOp3oIA9o6
 Pw6V64REUJQoEouOeuOjO14ehuNRYdxS4vfoYvy5PgTbWSvNPY+ubu0fH73KsDzX+bFm
 RjUVCTE/UdAemTQ/yh59jx4/eMJ1dCtx1uwDK+NzvYaIrVvvtcYo3W9PMFUlJU1xGIls
 FoeQ==
X-Gm-Message-State: AOJu0YzcSl+eopvrY3TMDEXUo6Yb4DawSH9tpDBJu9T59JHR2oD4CgUj
 /hKoRhIePpJSUOPVn4AAfCCjVS9ElIxwoeUUGbIQF8kvc/fyhFkvx9fWtYemuUM=
X-Google-Smtp-Source: AGHT+IH/UkaNxu7j8rMOhDpAuNrbxZuy9PmNmaDyrDvYMk0pbWCLHRQchLHDW/ZNsfuCfPwoLumcDg==
X-Received: by 2002:a05:6512:3f09:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-52eb99da573mr1207826e87.4.1720517448950; 
 Tue, 09 Jul 2024 02:30:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6e09fcsm32649035e9.4.2024.07.09.02.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 02:30:48 -0700 (PDT)
Date: Tue, 9 Jul 2024 11:30:46 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Hung <alex.hung@amd.com>, Wayne Lin <wayne.lin@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/vblank: allow dynamic per-crtc vblank off delay
Message-ID: <Zo0DRi2MtVYEZrsN@phenom.ffwll.local>
References: <20240708202907.383917-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708202907.383917-1-hamza.mahfooz@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 08, 2024 at 04:29:06PM -0400, Hamza Mahfooz wrote:
> We would like to be able to adjust the vblank off delay dynamically for
> a given CRTC. Since, it will allow drivers to apply static screen
> optimizations more quickly and consequently allow users to benefit more
> so from the power savings afforded by the aforementioned optimizations.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

So the vblank off delay is a hack to work around driver bugs/races, where
immediately disabling the vblank interrupt might result in
under/overcounting vblanks. Which really confuses compositors. The timeout
is chosen to be long enough that any miscounting should never end up
confusing userspace, so you can't just change it as a power optimization.

The right way to fix this is to work your driver so that you can set
vblank_disable_immediate = true, which amdgpu does for at least some
generations. The right fix here is to make sure you have that enabled on
all platforms correctly (which means the vblank interrupt race needs to be
properly fixed in driver code, which requires some deep hw knowledge of
when exactly the various registers update an interrupts fire). The
kerneldoc for vblank_disable_immedate and the other pieces it references
should expain the details.

tldr; nak on this approach.

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_vblank.c | 31 ++++++++++++++++++++++++++-----
>  include/drm/drm_vblank.h     |  7 +++++++
>  2 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 702a12bc93bd..4f475131a092 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -529,6 +529,7 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  
>  		vblank->dev = dev;
>  		vblank->pipe = i;
> +		vblank->offdelay_ms = drm_vblank_offdelay;
>  		init_waitqueue_head(&vblank->queue);
>  		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
>  		seqlock_init(&vblank->seqlock);
> @@ -1229,6 +1230,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
>  void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  {
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	int vblank_offdelay = vblank->offdelay_ms;
>  
>  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
>  		return;
> @@ -1238,13 +1240,13 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
>  
>  	/* Last user schedules interrupt disable */
>  	if (atomic_dec_and_test(&vblank->refcount)) {
> -		if (drm_vblank_offdelay == 0)
> +		if (!vblank_offdelay)
>  			return;
> -		else if (drm_vblank_offdelay < 0)
> +		else if (vblank_offdelay < 0)
>  			vblank_disable_fn(&vblank->disable_timer);
>  		else if (!dev->vblank_disable_immediate)
>  			mod_timer(&vblank->disable_timer,
> -				  jiffies + ((drm_vblank_offdelay * HZ)/1000));
> +				  jiffies + ((vblank_offdelay * HZ) / 1000));
>  	}
>  }
>  
> @@ -1455,6 +1457,25 @@ void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>  }
>  EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
>  
> +/**
> + * drm_crtc_set_vblank_offdelay - configure the vblank off delay value
> + * @crtc: CRTC in question
> + * @offdelay: off delay value
> + *
> + * If used, must be called before drm_vblank_on().
> + */
> +void drm_crtc_set_vblank_offdelay(struct drm_crtc *crtc, int offdelay)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	unsigned int pipe = drm_crtc_index(crtc);
> +	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +
> +	drm_WARN_ON(dev, dev->vblank_disable_immediate);
> +
> +	vblank->offdelay_ms = offdelay;
> +}
> +EXPORT_SYMBOL(drm_crtc_set_vblank_offdelay);
> +
>  /**
>   * drm_crtc_vblank_on - enable vblank events on a CRTC
>   * @crtc: CRTC in question
> @@ -1490,7 +1511,7 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
>  	 * re-enable interrupts if there are users left, or the
>  	 * user wishes vblank interrupts to be enabled all the time.
>  	 */
> -	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> +	if (atomic_read(&vblank->refcount) != 0 || !vblank->offdelay_ms)
>  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
>  	spin_unlock_irq(&dev->vbl_lock);
>  }
> @@ -1909,7 +1930,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>  	 * drm_handle_vblank_events) so that the timestamp is always accurate.
>  	 */
>  	disable_irq = (dev->vblank_disable_immediate &&
> -		       drm_vblank_offdelay > 0 &&
> +		       vblank->offdelay_ms > 0 &&
>  		       !atomic_read(&vblank->refcount));
>  
>  	drm_handle_vblank_events(dev, pipe);
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index 7f3957943dd1..f92f28b816af 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -187,6 +187,12 @@ struct drm_vblank_crtc {
>  	 */
>  	int linedur_ns;
>  
> +	/**
> +	 * @offdelay_ms: Vblank off delay in ms, used to determine how long
> +	 * @disable_timer waits before disabling.
> +	 */
> +	int offdelay_ms;
> +
>  	/**
>  	 * @hwmode:
>  	 *
> @@ -255,6 +261,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>  wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
>  void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>  				   u32 max_vblank_count);
> +void drm_crtc_set_vblank_offdelay(struct drm_crtc *crtc, int offdelay);
>  
>  /*
>   * Helpers for struct drm_crtc_funcs
> -- 
> 2.45.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
