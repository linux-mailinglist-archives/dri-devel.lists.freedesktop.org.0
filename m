Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E327B2F07
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 11:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BC610E0F3;
	Fri, 29 Sep 2023 09:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF9710E0F3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695978974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lyRUWglKe2AD9iRYIzYnkgLFl1AXZDK+hElEB92z3H0=;
 b=a0Withu2lNsGLIS4yjTBU798TjLisWmDFXvSKKrwWOMGztxVxeAb6msnont1rAB37Ja/wq
 hD/dBvSQJl5r4H4Z64865MRKYWz0JS0QDIBCleYSmKlPGN9K5/5mR3WtnVu6HWGAr+QE+L
 U4XPXF7rf1Q7vDuB4n6tNT4wx7YJdVQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-l8N_r1ihMfKM7Usd5TDbeA-1; Fri, 29 Sep 2023 05:16:10 -0400
X-MC-Unique: l8N_r1ihMfKM7Usd5TDbeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4053e4195c6so107179675e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 02:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695978969; x=1696583769;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lyRUWglKe2AD9iRYIzYnkgLFl1AXZDK+hElEB92z3H0=;
 b=m5zas6hiAXVTHfNeJR9fkdkOTVyNXiQEho31H6Ij3teutxVuO+qLqZ6be03ETwm1MI
 s6PpWmIHms+xgb/OSjrBEc8vYS5yoi14q/i0FtfNSlfgOpXrUhsoR0qq09fcyNVGKJoB
 VZ2Reo5Ayv1XgrnzvXqA72rZyPBR6G9pUuFKjo0CfvxEeZPKJI4K+/J9b+7UoNKBtg0O
 9GTLEAvcS3+QQUCJm7B5znP47MgttVExnt6tJsGpYoH+akG7RFa9t16MhiHxsVEdA4OY
 JFb92hcMdrCyRxvo7LCgvNNodEXmWZDSUX7/oZgT+43G0NbiN8pKTIDEaaAS+H6kdfAX
 waWA==
X-Gm-Message-State: AOJu0YyF/HgUksIosnQ2UaTzGQTYgBHICOh71LsumxtrPzdBj8S9Lhfo
 touOnePR2uyPoI5+DV6lJHTrXxb4Ulq5XG3tHo4WAk5Uzknd8siJBKZnsUffuRQM2ld+eRd5G8x
 WUhWP+k5IuXBWhZbVX37Ra10q8XWB
X-Received: by 2002:a05:600c:230f:b0:3fc:dd9:91fd with SMTP id
 15-20020a05600c230f00b003fc0dd991fdmr3437080wmo.40.1695978968785; 
 Fri, 29 Sep 2023 02:16:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUBsh3d/VVIZ1YgqwUqD09qq6oJanIe7EfaOaBvW6k9AuBp2NW/PuA+hdI+qbWTLJr1qCyDg==
X-Received: by 2002:a05:600c:230f:b0:3fc:dd9:91fd with SMTP id
 15-20020a05600c230f00b003fc0dd991fdmr3437057wmo.40.1695978968337; 
 Fri, 29 Sep 2023 02:16:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x16-20020a05600c2a5000b003fe23b10fdfsm1001101wme.36.2023.09.29.02.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 02:16:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v2 5/5] drm/ssd130x: Store xfrm buffer in device instance
In-Reply-To: <20230920142535.19321-6-tzimmermann@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-6-tzimmermann@suse.de>
Date: Fri, 29 Sep 2023 11:16:07 +0200
Message-ID: <87edih49wo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Store and instance of struct drm_xfrm_buf in struct ssd130x_device and
> keep the allocated memory allocated across display updates. Avoid
> possibly reallocating temporary memory on each display update. Instead
> preallocate temporary memory during initialization. Releasing the DRM
> device also releases the xfrm buffer.
>
> v2:
> 	* reserve storage during probe
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> @@ -1084,6 +1081,8 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  	struct ssd130x_device *ssd130x;
>  	struct backlight_device *bl;
>  	struct drm_device *drm;
> +	const struct drm_format_info *fi;
> +	void *buf;
>  	int ret;
>  
>  	ssd130x = devm_drm_dev_alloc(dev, &ssd130x_drm_driver,
> @@ -1117,6 +1116,18 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  	bl->props.max_brightness = MAX_CONTRAST;
>  	ssd130x->bl_dev = bl;
>  
> +	ret = drmm_xfrm_buf_init(drm, &ssd130x->xfrm);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	fi = drm_format_info(DRM_FORMAT_R1);
> +	if (!fi)
> +		return ERR_PTR(-EINVAL);
> +	buf = drm_xfrm_buf_reserve(&ssd130x->xfrm,
> +				   drm_format_info_min_pitch(fi, 0, ssd130x->width),
> +				   GFP_KERNEL);
> +	if (!buf)
> +		return ERR_PTR(-ENOMEM);
> +
  
I think this is OK but then I wonder if we should not just allocate all
the buffers in the probe function. Right now, what the driver does is to
have two structures to keep the driver-private atomic state:

1) struct ssd130x_crtc_state that has a .data_array to store the pixels
   in the HW format (e.g: R1) and written to the panel.

2) struct ssd130x_plane_state that has a .buffer to store the pixels that
   are converted from the emulated XRGB8888 used by the shadow-plane, to
   the HW pixel format.

The (2) will be optional once Geert's R1 support lands. Now we are adding
a third buffer so I wonder if should be part of one of these private state
or not.

I said that should be a field of struct ssd130x_plane_state in a previous
email, but on a second thought it makes more sense if is a field of the
struct ssd130x_crtc_state.

That way the allocation will only be in ssd130x_crtc_atomic_check() and
the release in the ssd130x_crtc_destroy_state(). If you do that on patch
#2, then this patch #5 could be dropped.

The reason why I added those private state structures is twofold: because
the buffers are tied to the CRTC and planes and to show how a driver can
maintain their own private atomic state.

After all, one of my goals of this driver is to be used for educational
purposes and provide a simple driver that people can use as a reference.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

