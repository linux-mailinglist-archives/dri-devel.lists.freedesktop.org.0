Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F82969C1F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAF010E4F5;
	Tue,  3 Sep 2024 11:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="auU0S1I/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21EB10E4EE
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B4mDjfLV7OAnvVKb4h3wcvxirCud+mre7CyjFzqqSY0=;
 b=auU0S1I/1aC7+INcD1bBxFsA/kKs7XKk9CCwmtKu8yjxWfSPaIJzETp4iBhSrZB+57QHF8
 ewnmx9rWyb3XEV9XsvJsE8eCA8jWREcVgxmq1L+qHJ+WrZvv3lXtyWu8PXFzzGIRoSAnkU
 En+5WdxazQhQBG41yAPbmtYrg+Dv3Z8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-qLCLqdhYNHibNXrEJpf1Cg-1; Tue, 03 Sep 2024 07:39:30 -0400
X-MC-Unique: qLCLqdhYNHibNXrEJpf1Cg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b385b146so1955185f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 04:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363569; x=1725968369;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4mDjfLV7OAnvVKb4h3wcvxirCud+mre7CyjFzqqSY0=;
 b=cRrF0tqd2Ux2JsT6s8e/srmGRRDcyTtLQVv47dXTEG0vXC0+uo6mGro3jPsF0Y4Tbb
 cIQC8beer5UfQVfLOJu251CX2I+ILH2GLqUn2ONefh8Mn2e5ZXat4SSXgIJ2ekH5/UDl
 dn6xSmDEiXZea6wZ6nZfzfZJ29c6jGYPB74brKIOyKzCbSWdw8+4XURncVbUytIOs18p
 ELl5gfJmEEQ2rlDmiD2iylUob0VMrNZ1/GJ1IDzgvEtj86isapbKbj9KsuIxGX6jvYM1
 KZNgDMwBprFVLWd0XKDc1MiBtsXKN++SCrdRTl74slZ2x076JSSDOSk9VR9UlwOqtxeb
 NsyA==
X-Gm-Message-State: AOJu0Ywh7xV+Mj1XX4etzEXF4zVxIL+5R0nLsCMj7F1sceApoc4bUYYi
 8TjmXPZw8zPotLRBjov2F3DOGBmrK47vgerd3JyjkkHLfkbgX5kY9AgQZUPVHAZSdponoJPhdMo
 q7bNkG5/DHfvMz4hmsDIjXI4Zm8fYEEKhRvB3yej1h2Si2Lj75yyCwlJT5aLmL2cjfw==
X-Received: by 2002:a5d:6e42:0:b0:374:c56c:fbc7 with SMTP id
 ffacd0b85a97d-376dd15a895mr357671f8f.15.1725363568988; 
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQSUDUfzSKG3LOW3MagIfuHvjKQDUVhkyVId3Miv17du6YGeJMV1X8eK/OXklKwkOqAbQaAQ==
X-Received: by 2002:a5d:6e42:0:b0:374:c56c:fbc7 with SMTP id
 ffacd0b85a97d-376dd15a895mr357651f8f.15.1725363568458; 
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749eea50dasm14014489f8f.56.2024.09.03.04.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 50/81] drm/fbdev-shmem: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-51-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-51-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:39:27 +0200
Message-ID: <87le09dl00.fsf@minerva.mail-host-address-is-not-set>
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
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of SHMEM-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_shmem.c | 60 ++++++++++++++++++-------------
>  include/drm/drm_fbdev_shmem.h     | 11 ++++++
>  2 files changed, 47 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 0c785007f11b..3bca333917d1 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -107,6 +107,40 @@ static struct page *drm_fbdev_shmem_get_page(struct fb_info *info, unsigned long
>  
>  static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  					   struct drm_fb_helper_surface_size *sizes)
> +{

I was going to ask if this whould be static inline too but I guess is just
a transition change and will be removed by a later patch, as was the case
for the fbdev-dma setup function. So it doesn't really matter that much...

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

