Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBE7EDDEA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 10:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F54910E25A;
	Thu, 16 Nov 2023 09:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D647510E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700128018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GUnAkharhaI3GMz15hJttOkxbY1QE99PMsSD7T59uqo=;
 b=HN1+Ep/yd8gsSnNYwoidLvqMhp5rzgGGO2HlJxWqMKrGhM7K4zJW7bVd93EGZ8Ua4XEFHX
 xmPYioC0BZXapPPD/QAAUDd5wAccgfkZ1vKfd+hYX6JwH548vfU7QjHuHpB6xpqjF4H55+
 ebDREFp8saFbUWMPPJY1kDvDr0qAQbY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-w9F8kTjTOxet7RUPuIlKhA-1; Thu, 16 Nov 2023 04:46:54 -0500
X-MC-Unique: w9F8kTjTOxet7RUPuIlKhA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32d83fd3765so280818f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 01:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700128013; x=1700732813;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUnAkharhaI3GMz15hJttOkxbY1QE99PMsSD7T59uqo=;
 b=d4BREo+d1itaNLHjO1qSP/fUW6pGP7E5VQlGAlK1jj3J/lMtWYgIBQY7DnH9o4SOdC
 iziHtFULEjk4PmnemH5RWas6qW906g4KkFroWyA7bRHV9ROzrIVH3ew3Icf4iNP/fNxi
 Gm5N9aDkf6ZyIDgVxc+0vA2cIcRql38SkwFsajaEAT7vgUsWR52zamFCVu4ThXyDzkXk
 EvqoTCOxLcSDSOHNNEIsecZYSffZ8742swIjNsIQ+yTSOxbE/XM0++W6v5Q9117qr1Hs
 QEvc7tKZmMPDfJZ5Kko5TAAxNGMPjB7F3Itw+sanLxlyGDLKI9U0XxTCksfRPoDoyf7F
 I5lg==
X-Gm-Message-State: AOJu0YxM+UhgQ6coVsOwMBrfU4DeRomLMGGGa41eVlJDY+0bw+ityuzH
 qrOUhPHlbUvs9ZfuHGAak2a0wevX1RoHYc8Yg7WYApRyL1CBcAZsdv6J/mhLx6szoMgTS5Q5Iil
 0JP6S745kMPUmoDnblgKBVLYzc4FE
X-Received: by 2002:adf:d1c7:0:b0:32d:a10d:90dd with SMTP id
 b7-20020adfd1c7000000b0032da10d90ddmr13048191wrd.50.1700128013568; 
 Thu, 16 Nov 2023 01:46:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo/GoeXnzkXSs+8oHstaaykO4BVH3SjALigbkXo0pwn68Vaum7b6oJA+SZlF0dwNkE6vhExQ==
X-Received: by 2002:adf:d1c7:0:b0:32d:a10d:90dd with SMTP id
 b7-20020adfd1c7000000b0032da10d90ddmr13048173wrd.50.1700128013245; 
 Thu, 16 Nov 2023 01:46:53 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0032db8cccd3asm13041667wrw.114.2023.11.16.01.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 01:46:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 02/32] fbdev/sm712fb: Use correct initializer macros for
 struct fb_ops
In-Reply-To: <20231115102954.7102-3-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-3-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 10:46:52 +0100
Message-ID: <87edgq58tv.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Only initialize mmap and draw helpers with macros; leave read/write
> callbacks to driver implementations. Fixes the following warnings:
>
>   CC [M]  drivers/video/fbdev/sm712fb.o
>   sm712fb.c:1355:25: warning: initialized field overwritten [-Woverride-init]
>   1355 |         .fb_fillrect  = cfb_fillrect,
>        |                         ^~~~~~~~~~~~
>   sm712fb.c:1355:25: note: (near initialization for 'smtcfb_ops.fb_fillrect')
>   sm712fb.c:1356:25: warning: initialized field overwritten [-Woverride-init]
>   1356 |         .fb_imageblit = cfb_imageblit,
>        |                         ^~~~~~~~~~~~~
>   sm712fb.c:1356:25: note: (near initialization for 'smtcfb_ops.fb_imageblit')
>   sm712fb.c:1357:25: warning: initialized field overwritten [-Woverride-init]
>   1357 |         .fb_copyarea  = cfb_copyarea,
>        |                         ^~~~~~~~~~~~
>   sm712fb.c:1357:25: note: (near initialization for 'smtcfb_ops.fb_copyarea')
>   sm712fb.c:1358:25: warning: initialized field overwritten [-Woverride-init]
>   1358 |         .fb_read      = smtcfb_read,
>        |                         ^~~~~~~~~~~
>   sm712fb.c:1358:25: note: (near initialization for 'smtcfb_ops.fb_read')
>   sm712fb.c:1359:25: warning: initialized field overwritten [-Woverride-init]
>   1359 |         .fb_write     = smtcfb_write,
>        |                         ^~~~~~~~~~~~
>   sm712fb.c:1359:25: note: (near initialization for 'smtcfb_ops.fb_write')
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 586132cf1d38 ("fbdev/sm712fb: Initialize fb_ops to fbdev I/O-memory helpers")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-fbdev@vger.kernel.org
> ---
>  drivers/video/fbdev/sm712fb.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

