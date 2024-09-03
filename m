Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC90969D19
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D814410E54E;
	Tue,  3 Sep 2024 12:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZTQpq464";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E0510E54C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R6oqVtZkZYzhkxJdcEF+JnHmdH0woa7sKCreAIvD2Zk=;
 b=ZTQpq464hwFTUsoUdDTB8Z7inh9xfiNN8nAzyvGCV9KFkahQB1z5EphFXDBlZ8IFo0Aba7
 tmv4Sc39gM1syNDPwoQVDxeJAeJdl8z8Kyc4xrlY7Tgze58Sq/+vm9BzG48whNagoDqO1x
 ZgDjPrlvTqVmccARjnQ2OviFTvFU7zY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-EVcidxw9MgK_KDXbG5HuPg-1; Tue, 03 Sep 2024 08:11:38 -0400
X-MC-Unique: EVcidxw9MgK_KDXbG5HuPg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374bb1e931cso1606489f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365497; x=1725970297;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R6oqVtZkZYzhkxJdcEF+JnHmdH0woa7sKCreAIvD2Zk=;
 b=RmoDeKacqMJbqPN3Y19Iq3CZ+FXQEyeISgjOxhgSzuyTvEU8TdXyzwW0LtG++RuLKo
 6f+xev09gnzUrAqO4lCPvATszs1rQeAP8C2hGe00VFYA/0q65gXiLEpWFH2bZ8WtAutQ
 QFFqR2SmUAbvX1NeR1hqNjRDbD8T6v+desHq/1QCPZFuQt9JW3+kfknlMskMq9LlI9g9
 1nMZmCbROXGBfJjvFpp+sbjD+u0DMAgQtrv7i+b2Q4RqR36olIb2jppGH08OrcIM1xBj
 WoP3gy0O59HlX9XpXzu0tf6fXxDFaqvTaKo+HmKUp4iBVwtakLLdBI4e1R9LFudHKfxz
 OlFQ==
X-Gm-Message-State: AOJu0YyUCHmu9j1T4Bh+g2grWQ9S22H59eKcKcKBd/Ey5Qa19WNZjyOh
 gogIsBJMJ09xW0SD9KdNzZQrhzXZ5r823HbYuuVYCMc3G+9Ej16rr+Jqtr1k4UaPXGN8vN5NsR3
 EatWs20M4FP1Vfjre/R/rLTW+PRWTx1Bywc8TV+MBgk2qxxm9M/xuGHl46imCT0cMLA==
X-Received: by 2002:adf:ef0d:0:b0:374:bfd8:eeee with SMTP id
 ffacd0b85a97d-374bfd8ef74mr5930154f8f.10.1725365497315; 
 Tue, 03 Sep 2024 05:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERvbdAv4hAfT4n2R5Np2Y7GbE2qpmGlaAyuiqXE1NHLsi+UL/iWiTzAJvbEe5cokIXq/FQXA==
X-Received: by 2002:adf:ef0d:0:b0:374:bfd8:eeee with SMTP id
 ffacd0b85a97d-374bfd8ef74mr5930122f8f.10.1725365496783; 
 Tue, 03 Sep 2024 05:11:36 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b960ef94sm10978885f8f.103.2024.09.03.05.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:11:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v3 74/81] drm/armada: Run DRM default client setup
In-Reply-To: <20240830084456.77630-75-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-75-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:11:35 +0200
Message-ID: <87h6axc4y0.fsf@minerva.mail-host-address-is-not-set>
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The armada driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>
> ---
>  drivers/gpu/drm/armada/armada_drm.h   |  11 ++-
>  drivers/gpu/drm/armada/armada_drv.c   |   4 +-
>  drivers/gpu/drm/armada/armada_fbdev.c | 115 ++------------------------
>  3 files changed, 17 insertions(+), 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/armada/armada_drm.h b/drivers/gpu/drm/armada/armada_drm.h
> index c303e8c7ff6c..3c0ff221a43b 100644

[...]

> @@ -108,113 +111,7 @@ static int armada_fbdev_create(struct drm_fb_helper *fbh,
>  
>  	return 0;
>  
> - err_fballoc:
> +err_fballoc:

Unrelated cleanup but probably not worth to split in a separate patch...

>  	dfb->fb.funcs->destroy(&dfb->fb);
>  	return ret;
>  }

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

