Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D42969CF0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574AF10E534;
	Tue,  3 Sep 2024 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FCjn/aZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3E10E534
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=FCjn/aZbq3IU6mc9taUpXCVGF6R8ylKCcKp7sl7TFF8U/nmuzrPSvOw3smnue9DVtl4Hlg
 dBh+W7umYlnx1UdwVgHEeQZJN78O/EtfIZyF25R/DTxIwkOI77iI/cNm+S56uAY/OTrnSE
 gB87w05UI7NzMjbjZJ0rQK8q7bcAjgE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-OtclWQ5aO2-srZ0kTSwXPA-1; Tue, 03 Sep 2024 08:07:23 -0400
X-MC-Unique: OtclWQ5aO2-srZ0kTSwXPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c90d24e3so1960877f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365242; x=1725970042;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=i4LASiM4Aua31hIN/q9jtpf8pk/ijM6KyU3c50otRXVq46ZJA6RqJeVHrpNzsCu6j3
 dJCzOZ4SDnR3fjfjODUQs2k/a6cl1d+17kvc4gSpGs/D5NKAd1QRc7pZ7FNRNQ8H8AEv
 F6tgIWACq1pJXRCOpb6n/yIKmfcRIKwQ3Nl7Nbrc0kqsiClhBl1mWdKmETFqRYhNxixo
 Ajm9YOWUpn4H9sITKAFDG+E7AVRMunFjKGrpnf8EOz0xfsxcdHgInEIEMnBmfYqQTxZr
 mDQBqpAuhShKtm26iOzUEdqy59cWdIQG2F+YQQALngOlTsQUmsQL61c4K4GH/6AQ2Rtr
 HO0w==
X-Gm-Message-State: AOJu0YyuotnMEtHpPXGRf2hjFNSvMG+vEFh9XLByCo2AwfXXNW1YsQHY
 twdTga1bx6PHRhVMQfpBvmcP7I4dck95nXua6PrbYcLUpleRC2rc29ThI/cKRuHviaFC+pp9W7C
 N586r+07dkiHr0TTxANpJ0EOyLd3J2EYcbVvWoW8NyDTl1DK+uSA4K3xEMZdPCOhqi1+nW9XsSA
 ==
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863878f8f.12.1725365241916; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NHKd/OZS0qGl6rQ/cQL7X9ho+DUsYgIVLhqFSVXN311ZJ1N/JkOGUvCE3TFPMHJvuHGT6Q==
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863856f8f.12.1725365241536; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c88c624f7sm27274635e9.39.2024.09.03.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 71/81] drm/vboxvideo: Run DRM default client setup
In-Reply-To: <20240830084456.77630-72-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-72-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:20 +0200
Message-ID: <87plplc553.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The vboxvideo driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

