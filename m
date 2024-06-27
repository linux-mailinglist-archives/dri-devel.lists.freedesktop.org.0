Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFC691AE5B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 19:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C3010EB17;
	Thu, 27 Jun 2024 17:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Z0QkpHXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B102D10EB15
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 17:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719510151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XGSfXbPPJUEKh22ZKmG3sSq8FqJ5we+pYCxi+DTxmLA=;
 b=Z0QkpHXevrEy5lWxCVR388Z4d/UWcTtaqVI09duRdvYBdO34DSapET9IJuPoV09sBCDyAI
 oUWYaSqVj30UTlrCGKJMr9EQFw+X2Fq9YnDXQC55pvsWccn2Um51f8wc/ZOTD3nhEYaLNS
 oaqFx8+IPY1GlR3E3JUnQRQrY/TtKZw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-Scwvm1m1MQW8F-aingC7MQ-1; Thu, 27 Jun 2024 13:42:30 -0400
X-MC-Unique: Scwvm1m1MQW8F-aingC7MQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-36743ab5fb3so439068f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719510149; x=1720114949;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XGSfXbPPJUEKh22ZKmG3sSq8FqJ5we+pYCxi+DTxmLA=;
 b=vjUd679dmOC8Tq+lGazk/ngK/WnyoKUVxDUPxOEp7lGbABdbU7jw00PLyKuOMEmUI3
 fqf6zR9I+se8+7NGOgmJ75vyxlg4RWMvp4doCSlcto1sNCWFi1y/b4PVA+Alu3R5YV34
 YhJppzDdUX9Sprlm32hkk7tT5nHP+txgLkif8sy0kl14YatbOyww2amsKad+IlL+wvPf
 DwJJRn2s3NbHN79zVjJZyTDD6yRVU+3CBgK+RJLg+AldRT/l4B7YxHGZ09GBkCOb35Og
 pLxmasGhkHmFJxBPF3aciHoGoUPgzyq9hEhkWVI6bcqokjWnkVPD6Rgd65ljbiOfnucw
 g/0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjQeuVRmKc/JXVahSDNzh6pxemz7TEbqsBL9MdUINvCvsULDAYG0WL5P/156CeNuxjvUoSpTgbG4t8oK4Ma8cJ4Csl9oT7JCVzZKSnDgn5
X-Gm-Message-State: AOJu0YxWIEo4neMXfsutyyEOb4So672TFjP1KLP7cg7IPiRdAHRFIHlx
 J0EZvJQOdcmS1WqBVyX/hOZolHiv9HbmyHeC2NW5tfp1WqZdrgppqZhNzvqcEKtSjBc3BQF2C2F
 wCF2YlYb8owJitWkBugXsCClBwn7xC3I8Krs3p95hJJhTKVCVP7IGxdu7WjWZnMRQSQ==
X-Received: by 2002:a5d:5904:0:b0:361:e909:60c3 with SMTP id
 ffacd0b85a97d-36741783c38mr2188529f8f.9.1719510149036; 
 Thu, 27 Jun 2024 10:42:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3Y5AubVJoQM/z0xq/mp72IULX27NmhHEyumxH4auepDgA554eX1h1C0ROcXp0rCBXygvrFg==
X-Received: by 2002:a5d:5904:0:b0:361:e909:60c3 with SMTP id
 ffacd0b85a97d-36741783c38mr2188515f8f.9.1719510148615; 
 Thu, 27 Jun 2024 10:42:28 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674357ff03sm2565025f8f.45.2024.06.27.10.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 10:42:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Huth <thuth@redhat.com>, dri-devel@lists.freedesktop.org, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/fbdev-generic: Fix framebuffer on big endian devices
In-Reply-To: <20240627173530.460615-1-thuth@redhat.com>
References: <20240627173530.460615-1-thuth@redhat.com>
Date: Thu, 27 Jun 2024 19:42:26 +0200
Message-ID: <87r0cie0zh.fsf@minerva.mail-host-address-is-not-set>
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

> Starting with kernel 6.7, the framebuffer text console is not working
> anymore with the virtio-gpu device on s390x hosts. Such big endian fb
> devices are usinga different pixel ordering than little endian devices,
> e.g. DRM_FORMAT_BGRX8888 instead of DRM_FORMAT_XRGB8888.
>
> This used to work fine as long as drm_client_buffer_addfb() was still
> calling drm_mode_addfb() which called drm_driver_legacy_fb_format()
> internally to get the right format. But drm_client_buffer_addfb() has
> recently been reworked to call drm_mode_addfb2() instead with the
> format value that has been passed to it as a parameter (see commit
> 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()").
>
> That format parameter is determined in drm_fbdev_generic_helper_fb_probe()
> via the drm_mode_legacy_fb_format() function - which only generates
> formats suitable for little endian devices. So to fix this issue
> switch to drm_driver_legacy_fb_format() here instead to take the
> device endianness into consideration.
>
> Fixes: 6ae2ff23aa43 ("drm/client: Convert drm_client_buffer_addfb() to drm_mode_addfb2()")
> Closes: https://issues.redhat.com/browse/RHEL-45158
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  drivers/gpu/drm/drm_fbdev_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
> index 97e579c33d84..1e200d815e1a 100644
> --- a/drivers/gpu/drm/drm_fbdev_generic.c
> +++ b/drivers/gpu/drm/drm_fbdev_generic.c
> @@ -84,7 +84,8 @@ static int drm_fbdev_generic_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  		    sizes->surface_width, sizes->surface_height,
>  		    sizes->surface_bpp);
>  
> -	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
> +	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
> +					     sizes->surface_depth);
>  	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
>  					       sizes->surface_height, format);
>  	if (IS_ERR(buffer))

Indeed. Thanks a lot for the detailed explanation and the patch.
Your fix makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

