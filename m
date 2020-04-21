Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1C51B2609
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 14:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47596E930;
	Tue, 21 Apr 2020 12:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B63266E930
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 12:29:56 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z6so3476449wml.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xrAZS1nO5bjTBwhM2o+ERENfnqrRAvPah02F2/o2fss=;
 b=R7MqcRa+AKMzsCn3a2u67yrA7VVoS2hfpOs3FFcPeJ995lq0w1TmRsr+QQyigRSW97
 S6b2EutJ1oVJoS3FBW5Vwevz61TORAAVqGfX0368N4IrEVzkxYOYjKphBdwo/ImqI38x
 dKlHNQxrEtE2nrRS3uONXQq7skAAVq1fyu37g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=xrAZS1nO5bjTBwhM2o+ERENfnqrRAvPah02F2/o2fss=;
 b=fGBT0xD4ZMXNrr1ZmLQoDErzpNrABhjEPXgZNFtmVxRU2S+WjdxdqN8ueZPIlaix9b
 cPIhwTLXiPelmPhWAiajl3lJRVheBk1zT7j4T7ucDXN3uM6NfUqzwfwIXD49v48FY8Q7
 TsytSF9XWiIB5KjUXJetUdZgM7oLNvHdTt0LrXOep0Lqh8Oqrk9auUAir0gh8OYj/lez
 YK2vvlVYpvVsKWMGvGRwTGng6z2vPJ90KYRQq7h8hhIYXdSIE/vZz610ztNZ1h55GmMw
 mAcCipwAa13n5YVxf/FRtV2AVtjCa6Bmn7bZL/twh/wRYX+hdrubQi39W1J8adVS9LCo
 QPOA==
X-Gm-Message-State: AGi0PuZ/B465tKulWpqdv7Lk3F4biFR2fSjXJcBwSwirVK81ofdQ5y87
 Gr9XlJSUHejre5FTsb6nW/9MnQ==
X-Google-Smtp-Source: APiQypJkgi7mb4hB7eQdKB38H51uXum0dmvB/gOW1e5Kl5ByipesokboMKiIw9H+fkPFvNkTvLGq6Q==
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr4569354wmb.130.1587472195424; 
 Tue, 21 Apr 2020 05:29:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m14sm3546680wrs.76.2020.04.21.05.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 05:29:54 -0700 (PDT)
Date: Tue, 21 Apr 2020 14:29:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC v3 01/11] drm/vblank: Register drmm cleanup action once per
 drm_vblank_crtc
Message-ID: <20200421122952.GX3456981@phenom.ffwll.local>
Mail-Followup-To: Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20200417194145.36350-1-lyude@redhat.com>
 <20200417194145.36350-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417194145.36350-2-lyude@redhat.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 03:40:48PM -0400, Lyude Paul wrote:
> Since we'll be allocating resources for kthread_create_worker() in the
> next commit (which could fail and require us to clean up the mess),
> let's simplify the cleanup process a bit by registering a
> drm_vblank_init_release() action for each drm_vblank_crtc so they're
> still cleaned up if we fail to initialize one of them.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/drm_vblank.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 758bf74e1cab..bf8de10c131f 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -491,16 +491,12 @@ static void vblank_disable_fn(struct timer_list *t)
>  
>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
> -	unsigned int pipe;
> -
> -	for (pipe = 0; pipe < dev->num_crtcs; pipe++) {
> -		struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank = ptr;
>  
> -		WARN_ON(READ_ONCE(vblank->enabled) &&
> -			drm_core_check_feature(dev, DRIVER_MODESET));
> +	WARN_ON(READ_ONCE(vblank->enabled) &&
> +		drm_core_check_feature(dev, DRIVER_MODESET));
>  
> -		del_timer_sync(&vblank->disable_timer);
> -	}
> +	del_timer_sync(&vblank->disable_timer);
>  }
>  
>  /**
> @@ -529,10 +525,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  
>  	dev->num_crtcs = num_crtcs;
>  
> -	ret = drmm_add_action(dev, drm_vblank_init_release, NULL);
> -	if (ret)
> -		return ret;
> -
>  	for (i = 0; i < num_crtcs; i++) {
>  		struct drm_vblank_crtc *vblank = &dev->vblank[i];
>  
> @@ -541,6 +533,12 @@ int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs)
>  		init_waitqueue_head(&vblank->queue);
>  		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
>  		seqlock_init(&vblank->seqlock);
> +
> +		ret = drmm_add_action(dev, drm_vblank_init_release, vblank);

drmm_add_action_or_reset probably what you want. I've gone so far an
unexport the plain variant.
-Daniel

> +		if (ret) {
> +			del_timer_sync(&vblank->disable_timer);
> +			return ret;
> +		}
>  	}
>  
>  	DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n");
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
