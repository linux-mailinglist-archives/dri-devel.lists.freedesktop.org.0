Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016DA90D71
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EFA10E178;
	Wed, 16 Apr 2025 20:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="xL7afhCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F400710E178
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:56:12 +0000 (UTC)
Date: Wed, 16 Apr 2025 16:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744836970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhVnOH0k9VWx9UfNNrD0I3JDKG9V0vMTdWVPEm7S7DM=;
 b=xL7afhCp98Q2ZuziuNCpCfub0SSIPQgn+hiZUhGyNtaUET3vccINgLsoVhqZE/5UqWuuQV
 wwbQnH6xjqQNGC9fZbaIBc0EaHHe+1bUt8k5APdyRrho24I87n0/AP1cBwyzf8tvgQSSfd
 SpR0KtR5jBfb9+KyTU7O0TtOrkjd8DbwAYCphygGaqGH6c+uHCL3eDeo7N5WGm5A1KTf60
 +Zn8RWvJX7QCea7bHKuuPKBQ3Ty5rrwglhy8vGgUTmFKvVNuLVqZoMIPc7gJs1P8FRSynp
 gtUxw40wx0H4VE18lXamqqcJQAIN1CQKqhPrHeA6oDMG7fMZg0skUp6kegHAHg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] drm: adp: Use spin_lock_irqsave for drm device
 event_lock
Message-ID: <aAAZZjM5rA1_ON0e@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-1-772699f13293@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-1-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:27PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> The lock is used in the interrupt handler so use spin_lock_irqsave to
> disable interrupts and avoid deadlocks with the irq handler.
> 
> Fixes: 332122eba628 ("drm: adp: Add Apple Display Pipe driver")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c98c647f981d5383149647126762a5cdec8f4e4b..157298a8ff42b95275411dd4a7a0c70780fd86fd 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -310,6 +310,7 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
>  				  struct drm_atomic_state *state)
>  {
>  	u32 frame_num = 1;
> +	unsigned long flags;
>  	struct adp_drv_private *adp = crtc_to_adp(crtc);
>  	struct drm_crtc_state *new_state = drm_atomic_get_new_crtc_state(state, crtc);
>  	u64 new_size = ALIGN(new_state->mode.hdisplay *
> @@ -330,13 +331,13 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
>  	}
>  	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
>  	//FIXME: use adbe flush interrupt
> -	spin_lock_irq(&crtc->dev->event_lock);
> +	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  	if (crtc->state->event) {
>  		drm_crtc_vblank_get(crtc);
>  		adp->event = crtc->state->event;
>  	}
>  	crtc->state->event = NULL;
> -	spin_unlock_irq(&crtc->dev->event_lock);
> +	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  }
>  
>  static const struct drm_crtc_funcs adp_crtc_funcs = {
> 
> -- 
> 2.49.0
> 
> 
