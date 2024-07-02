Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A1923DF1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 14:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5410E5EB;
	Tue,  2 Jul 2024 12:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HAS+20eI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DC210E5E6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719923676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OJJl1XdsZbN/nrhzL8kDmExeBA4K2F968qXwb+izwJ0=;
 b=HAS+20eITHvUyfN8lUnEUYgMr9gHwbKgyr3MgbyMTSL6SypnH8cluVRvOdqILmNVHAb2zk
 VRRW/gyyoa+9M6xNcPS6hLePkGJZ5iTrITGMWHI/7umku0U8hd2Er8BweTQS000yx10w1y
 cSxO0CfdScwr0eQIW47f4SOb/yf/ePA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-66PRCtAMMqyIsqO9sAjCrA-1; Tue, 02 Jul 2024 08:34:35 -0400
X-MC-Unique: 66PRCtAMMqyIsqO9sAjCrA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3678e523e32so186998f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 05:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719923674; x=1720528474;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OJJl1XdsZbN/nrhzL8kDmExeBA4K2F968qXwb+izwJ0=;
 b=iBFP2HHbUuZekh7s6OEWM8QfKklL0sbUPGSjU1lDSLGi8LuL/DjQBRpiRQEDhwt8Tc
 QNQHq/Yj+JT+DVAFlTLEl0wA7MTJ6R8b43rPyV31PHyQ+zGPMztBeeX50BX8zYhPhL0F
 NKf6HWyZoVNFrFVir78sLsM2FvINcMwcy0ZlAUGIekvQyPB7QzFr5v2cv8sdiNiE6Rro
 LbzeJYVAPvS0oWLtcqcOcYtQK8O+mnMBb4vPysapAhWYEX/ceSx0oZ1AjgZB5f7IR79t
 /FLb8odGxKAQYK0A9J/OKI8Vv57sJwA/2v9db70i2K83kEn+P3/ZR5J4rnJaSjVMFMCm
 DEqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+uMKJus861DgGehYBBHXfAPT5dEijZIgY7ZEBPFsR8Wxi091mn7E+RZpBgv0cT+xbv29np7xzd9BiIm966x0ZdhRb5CqpX8ZxUjNfotdV
X-Gm-Message-State: AOJu0YxUFhLpo5JG7d+sPPzHR7uiyDzu73FMQ9gSZIQaoJ+1j7RBnEGD
 7IBsEqVgsp1s8+3i6yjBscfuGDvLBytpCR40exgZ4olQLi/6UGpKR6X6RmpfhMAHLEYAMRjOvhn
 wYh+ft6ZEjgCKIkO9UeX73IVMpgCharxeIgED+nwADDqlmvFRkoaIWKjloivdt+YGJQ==
X-Received: by 2002:a05:6000:401f:b0:364:ee85:e6e4 with SMTP id
 ffacd0b85a97d-36775724906mr7434289f8f.53.1719923673871; 
 Tue, 02 Jul 2024 05:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+M0i7qjFWDaCOkZBrFAY0zMWbhrnTGVMNJwTg7YQzPp1pRXF9LAHlA3zU/fuNw0+XU4dLw==
X-Received: by 2002:a05:6000:401f:b0:364:ee85:e6e4 with SMTP id
 ffacd0b85a97d-36775724906mr7434270f8f.53.1719923673534; 
 Tue, 02 Jul 2024 05:34:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3678c379cc6sm786301f8f.49.2024.07.02.05.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 05:34:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Huth <thuth@redhat.com>, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] drm/fbdev-dma: Fix framebuffer mode for big endian devices
In-Reply-To: <20240702121737.522878-1-thuth@redhat.com>
References: <20240702121737.522878-1-thuth@redhat.com>
Date: Tue, 02 Jul 2024 14:34:32 +0200
Message-ID: <87bk3gm0pz.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Huth <thuth@redhat.com> writes:

Hello Thomas,

> The drm_mode_legacy_fb_format() function only generates formats suitable
> for little endian devices. switch to drm_driver_legacy_fb_format() here
> instead to take the device endianness into consideration, too.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: Patch has only been compile-tested since I lack an environment
>        for testing it. But it's the same fix as I required for the
>        drm_mode_legacy_fb_format() in drm_fbdev_generic.c / drm_fbdev_ttm.c
>        so I think this should be fine.
>
>  drivers/gpu/drm/drm_fbdev_dma.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 97ef6300d47e..fdef4a2f883f 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -101,7 +101,8 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  		    sizes->surface_width, sizes->surface_height,
>  		    sizes->surface_bpp);
>  
> -	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
> +					     sizes->surface_depth);
>  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
>  					       sizes->surface_height, format);
>  	if (IS_ERR(buffer))

Makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

