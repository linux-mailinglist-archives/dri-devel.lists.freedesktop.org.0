Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C115C227905
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 08:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BF36E094;
	Tue, 21 Jul 2020 06:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A926E094
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 06:51:02 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w3so1718167wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 23:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=uMFpsvsNNP6MKesBssmiMnuweAD24fW+1O/tLheu5Zg=;
 b=C2CLeA5To3e4BloeLaJunQeYGBKz2AvkS38RTnDVix5hHZ53zV06BFfemlXZHTokT+
 qNwNMA/jwqGGq76e3kzbWqBGBeZMTHksyT8ZCE7fDoPBRnJaULKrawpvJwgxCpW7O6v+
 yX0YO8xY6OWBdjzcqdKospdhBVh8EUOefn8Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=uMFpsvsNNP6MKesBssmiMnuweAD24fW+1O/tLheu5Zg=;
 b=Ul2bhzmbgkVTVRIzlgKujzXSNKg2x/FVW7adn/7YyUcgS8gqiH5CWD4Agu0tHlXdAi
 W+8s7bVRze+FNR8M/pf6Y1fzaKGD5jTyl/tlZvDpMp58JH9m7FVRPxRkZAkN8anzWbL3
 knP8pkgWf0Rzf1Jh5lH4y2lfakw1IHtMcuj2pPXBBNJFmD+PAQlyDgZ2hJQi/zZAR94S
 eGUVK3ldsZBdNtMKjcghSUqvS3pb+jwkXoqUrFoYMRi05JIYmA7PZaGirfhcV6/bMISC
 qTOI7IVaI19Upzw12+GBx38ZixT6/yXYszUGFvvGRrHLhY7rbtLJE/GMKNPwX+oEwJvR
 DVOw==
X-Gm-Message-State: AOAM5317/eSDwjhoeFWvw5WMFwGAzezAEDEoxsduONXkM2YMmSJENsuq
 7ROc5+NyFAadZMFCLz+8YLGCAw==
X-Google-Smtp-Source: ABdhPJwR2BSBICyGOtkpsVgNaBsnRWKDYhtYUDAraFMDIKTsjTTEKffnZSGzwig3Qiscu1XI79d80w==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr2431121wmh.96.1595314260655; 
 Mon, 20 Jul 2020 23:51:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y6sm36462880wrr.74.2020.07.20.23.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 23:51:00 -0700 (PDT)
Date: Tue, 21 Jul 2020 08:50:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 4/5] drm/vblank: Use spin_(un)lock_irq() in
 drm_queue_vblank_event()
Message-ID: <20200721065058.GA3278063@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20200720190736.180297-1-lyude@redhat.com>
 <20200720190736.180297-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720190736.180297-5-lyude@redhat.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 03:07:35PM -0400, Lyude Paul wrote:
> This one's easy - we're already calling kzalloc() in this function, so

Nit: "kzalloc(GFP_KERNEL)", since kzalloc(GFP_ATOMIC) is perfectly fine in
interrupt context. With that clarified for the entire series:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> we must already be guaranteed to have IRQs enabled when calling this.
> So, use the plain _irq() variants of spin_(un)lock() to make this more
> obvious.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_vblank.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 51f2e988205e7..64610070ba473 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -1611,7 +1611,6 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
>  	struct drm_pending_vblank_event *e;
>  	ktime_t now;
> -	unsigned long flags;
>  	u64 seq;
>  	int ret;
>  
> @@ -1633,7 +1632,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>  			e->event.vbl.crtc_id = crtc->base.id;
>  	}
>  
> -	spin_lock_irqsave(&dev->event_lock, flags);
> +	spin_lock_irq(&dev->event_lock);
>  
>  	/*
>  	 * drm_crtc_vblank_off() might have been called after we called
> @@ -1670,12 +1669,12 @@ static int drm_queue_vblank_event(struct drm_device *dev, unsigned int pipe,
>  		vblwait->reply.sequence = req_seq;
>  	}
>  
> -	spin_unlock_irqrestore(&dev->event_lock, flags);
> +	spin_unlock_irq(&dev->event_lock);
>  
>  	return 0;
>  
>  err_unlock:
> -	spin_unlock_irqrestore(&dev->event_lock, flags);
> +	spin_unlock_irq(&dev->event_lock);
>  	kfree(e);
>  err_put:
>  	drm_vblank_put(dev, pipe);
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
