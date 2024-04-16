Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5D8A6995
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B458B10EEEA;
	Tue, 16 Apr 2024 11:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QiG0SoZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C637210EFAB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ex8M2eUSrqol5mdKpIM6VBOTBreND3Uj020NiVxFyYY=;
 b=QiG0SoZQ3g87y3lp9aBTQmglSwDt6RpsD9sBt2AcmLInrK2yawLREtjcavMX4d0lDyDfJK
 Tc0Kcbob/lCg43VmaH/wfBPkOuNuPrARaqXNZro7tV3wnxnUYmxl+oH3iOrgEscvQJe0Kx
 XMkxNFdS8AtKLCqhSGARbbZmeoBTNNg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-MXHzOO31MqatomRArCCigg-1; Tue, 16 Apr 2024 07:26:14 -0400
X-MC-Unique: MXHzOO31MqatomRArCCigg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-343f08542f8so2830844f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713266718; x=1713871518;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ex8M2eUSrqol5mdKpIM6VBOTBreND3Uj020NiVxFyYY=;
 b=OA6AR2qHarAQTHaoR9ER0chTj+z1Ok+SUlo2XuTGiygTTFwea62M5f7o8jC2miGM6l
 PVN/2f5/35TcN8+nZJIco7WUuWKm1NoL7HkE78VO8XM5wiJCqT4bYCAJTTFTyBbsUh6Z
 Qyvqe6GK8FXn0DR7AGQZlwlmM8OdtXk/Z1EhUSetBefdEw3UHu/SNpJ4H9oaSoBNGr+d
 UM7rt4sxLJz6ro9hmTfWKBrqpWbHjqFJSDVPyupOmp7QWvTAl7+7itXH2HXjZT00J3oQ
 /VfSjhNvv1T+Jn4OULyta9C6trvQlpd1FBwVqNw1FAX1wcHD9uiIHlUw5/cH8xYNySjV
 ui3g==
X-Gm-Message-State: AOJu0YyMUaNDGuFFdo3xwIaBCWzpJ8ZHzCuvLxWZwMY459s4EhuouSFE
 tTg6pErmF5/jaeonpBcH2V+20PT6D2rE3ezQZr32NwcMw73REY992lwz2vxZAt79VUrVQqPIHF9
 HAotL0dY+b9mUWZPd9K5WyWgAsqDTuNZZvV35+tIjiaoX111+01ltwHLK6YP1Z1O+LQ==
X-Received: by 2002:a05:6000:2a5:b0:344:4bcc:ed1f with SMTP id
 l5-20020a05600002a500b003444bcced1fmr10733584wry.48.1713266718465; 
 Tue, 16 Apr 2024 04:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELh1gKQ5KIugCykRbfLLKHDM0Vqca/5AttN7+4ay1nW5utMb8nudTZjhnvKQ3OxjAJA2GeSg==
X-Received: by 2002:a05:6000:2a5:b0:344:4bcc:ed1f with SMTP id
 l5-20020a05600002a500b003444bcced1fmr10733566wry.48.1713266717981; 
 Tue, 16 Apr 2024 04:25:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m5-20020a5d6245000000b0034334af2957sm14613490wrv.37.2024.04.16.04.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:25:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/43] drm/fbdev: Add fbdev-shmem
In-Reply-To: <20240410130557.31572-9-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-9-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:25:16 +0200
Message-ID: <87r0f54kir.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Add an fbdev emulation for SHMEM-based memory managers. The code is
> similar to fbdev-generic, but does not require an addition shadow

"additional" I think ?

> buffer for mmap(). Fbdev-shmem operates directly on the buffer object's
> SHMEM pages. Fbdev's deferred-I/O mechanism updates the hardware state
> on write operations.
>
> v2:
> - use drm_driver_legacy_fb_format() (Geert)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Just a couple of questions below:

>  drivers/gpu/drm/Makefile          |   1 +
>  drivers/gpu/drm/drm_fbdev_shmem.c | 316 ++++++++++++++++++++++++++++++

Should fbdev-generic then be renamed to fbdev_shmem_shadow or something
like that ?

[...]

> +
> +	/* screen */
> +	info->flags |= FBINFO_VIRTFB; /* system memory */
> +	if (!shmem->map_wc)
> +		info->flags |= FBINFO_READS_FAST; /* signal caching */
> +	info->screen_size = sizes->surface_height * fb->pitches[0];
> +	info->screen_buffer = map.vaddr;
> +	info->fix.smem_len = info->screen_size;
> +

Do I understand correctly that info->fix.smem_start doesn't have to be set
because that's only used for I/O memory? 

Since drm_fbdev_shmem_fb_mmap() calls fb_deferred_io_mmap() which in turn
sets vma->vm_ops = &fb_deferred_io_vm_ops and struct vm_operations_struct
fb_deferred_io_vm_ops .fault function handler is fb_deferred_io_fault()
that calls fb_deferred_io_page() which uses info->fix.smem_start value.

I guess is OK because is_vmalloc_addr() is always true for this case ?

This also made me think why info->fix.smem_len is really needed. Can't we
make the fbdev core to only look at that if info->screen_size is not set ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

