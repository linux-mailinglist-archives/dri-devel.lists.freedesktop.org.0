Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 204467B9CC4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726810E1D1;
	Thu,  5 Oct 2023 11:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED89410E1EB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 11:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696505839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PTdoKjEVTqKstCwmpa8K7LCKs8UUEFAcUU4yzgI4+4Q=;
 b=cOPU84nnD2OOkgN1MaU89x5IOQbGpSbqAOwHyYPJJXss7Vpx/iOb2YLuLQTKhk1en3qvM3
 jA4QpX7ANvfTKacicLp5Ey0NCr9amhXvoG9ZsWhm3uBAcASvOZ/s6ZdCx448A2L+yV5lvL
 /hGXWlg8HXFFEzj+yjFlT54C9Baui5E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-a0grXZJsOtqiDVVfZli2-w-1; Thu, 05 Oct 2023 07:37:17 -0400
X-MC-Unique: a0grXZJsOtqiDVVfZli2-w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40524bc3c5cso5348345e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Oct 2023 04:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696505836; x=1697110636;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PTdoKjEVTqKstCwmpa8K7LCKs8UUEFAcUU4yzgI4+4Q=;
 b=UmwC1PftrB49WNZnG6ZMENWvnOIbNSvBo9yxt/xbg1PW4Ggm4mHS+6bcp7Xrh7xapM
 V6t+34ELxI3u4tJQadTZGE1MPH6/iE3DLenq9shwtOsR2VbnRmuRIUIc/gT4aLftiPO5
 QPINyB6TCQDne4UenolHdqCIOHYWZXHdRtm6F84dzpZ3uiFRSrZoQ2p6LBdHUgnawMc9
 v6ofXr3JzZXY3QTGdHEJpYX5XXO+myNS2WXWM4UkMZnuqYWA+VnrusbrkXB9gCjxMFv9
 RylnSStpzAoAIi0q+9eJooit9crRbm/0GlZCgNRPI9xE878crPnO9FWvG6f4v2VirneV
 8yLw==
X-Gm-Message-State: AOJu0YyJUp4MmYVgwfp9s+Zx7pze1RuLRLBs0OqAu2PJUGUkh0Zm5nQq
 ihfahkM+eqPx8oP7W99K2RiOGx5BiZguOrilmTfe4PQiWih76uArNII6YHDTfIbeDoDFmPn1VVz
 sEu+rz+yFx/za9RtyvTcbeT7Ui6pB
X-Received: by 2002:adf:f546:0:b0:317:634c:46e9 with SMTP id
 j6-20020adff546000000b00317634c46e9mr4886022wrp.43.1696505836451; 
 Thu, 05 Oct 2023 04:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC5Wr6HRBOmeqxoL159OHtoAn1IB7DRRB4TDWcY8/PYw0BpT9gqz8RAPZrjlsTYHOhf56k/w==
X-Received: by 2002:adf:f546:0:b0:317:634c:46e9 with SMTP id
 j6-20020adff546000000b00317634c46e9mr4886007wrp.43.1696505836082; 
 Thu, 05 Oct 2023 04:37:16 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b10-20020a05600010ca00b003271be8440csm1588855wrx.101.2023.10.05.04.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Oct 2023 04:37:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 6/7] drm/ssd130x: Fix atomic_check for disabled planes
In-Reply-To: <20231005090520.16511-7-tzimmermann@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-7-tzimmermann@suse.de>
Date: Thu, 05 Oct 2023 13:37:15 +0200
Message-ID: <8734ypwb9w.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

Thanks for your patch.

> The plane's atomic_check returns -EINVAL if the CRTC has not been
> set. This is the case for disabled planes, for which atomic_check
> should return 0. For disabled planes, it also omits the mandatory
> call to drm_atomic_helper_check_plane_state().
>
> Replace the test with the boiler-plate code that first invokes
> drm_atomic_helper_check_plane_state() and then tests for the plane
> to be visible. Return early for non-visible planes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d51f9fbd98b6 ("drm/ssd130x: Store the HW buffer in the driver-private CRTC state")
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 3dd8e8a444b6f..dccbfe33edb5e 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -639,21 +639,22 @@ static int ssd130x_primary_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
>  	struct ssd130x_plane_state *ssd130x_state = to_ssd130x_plane_state(plane_state);
>  	struct drm_crtc *crtc = plane_state->crtc;
> -	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc_state *crtc_state = NULL;
>  	const struct drm_format_info *fi;
>  	unsigned int pitch;
>  	int ret;
>  
> -	if (!crtc)
> -		return -EINVAL;
> -
> -	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> -	if (IS_ERR(crtc_state))
> -		return PTR_ERR(crtc_state);
> +	if (crtc)
> +		crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>  
> -	ret = drm_plane_helper_atomic_check(plane, state);
> +	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> +						  DRM_PLANE_NO_SCALING,
> +						  DRM_PLANE_NO_SCALING,
> +						  false, false);

As Geert mentioned you are open coding here what the called helper already
does. I prefer to keep doing that, instead of adding boiler plate code.

One question, the reason to return -EINVAL was to prevent the callback
ssd130x_primary_plane_atomic_update() to be executed, since that attempts
to get the CRTC state to pass the HW buffer to ssd130x_fb_blit_rect().

I believe this patch will introduce a regression and cause a NULL pointer
dereference when !plane_state->crtc and you should also add a check for
plane_state->visible in ssd130x_primary_plane_atomic_update() to bail ?

I haven't tested your patch yet though, so maybe I'm wrong about this.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

