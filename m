Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB48A6A96
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076810F05E;
	Tue, 16 Apr 2024 12:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="biSSFnj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB61810ED0F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713269910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JExSW1bgx6Guvm51zO+5lwyoRpmXnChQqd095oH6F3E=;
 b=biSSFnj4Ep+k1CHf6Vyl6szhb3udJGZa8aLI+oEtbtOx9VslZphSNcWnp+QBiG5gSHpUGF
 CiA+WzJuPzvVZlwu15MMfQfAIN8ZHycOfiD2mARYaxEWtN5VW2fhcXvCkQyip9tfQZy7vE
 CEKvMwgvaQC69+8eWgIs8XVLcuzrE0M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-V1-RL5FrPMaQR4ougUkETA-1; Tue, 16 Apr 2024 08:18:28 -0400
X-MC-Unique: V1-RL5FrPMaQR4ougUkETA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343da0a889dso3337101f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713269907; x=1713874707;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JExSW1bgx6Guvm51zO+5lwyoRpmXnChQqd095oH6F3E=;
 b=nuvn/FE57yWvm3yto5hEkcmNPnMDsrQvnWud9p4qnrqenn329CWH53DkioTuOdq98w
 dh6xBc/nleObkLNDkC+FQGqtThN/r6/K24Wz03uwntKZi6Q+qAkxz8GuAe/wi+tqTqwX
 k6cyx4P4Y5WZ3sKDxF4SFT+eNYmi0oXRdb6YZfBbK6cb7qILkKG9ddSez2qs38WjFtkV
 gQOJLfh67dVO/EnYibxWjo8X93Nu6/tHW2dJR6HwdGL4Qe2BRZR8Wzh7pehcdG7Pwg1L
 ww2ZlbdZx6aLktITHZvhK3pH+SJEG2ExAVyfslzk3ud7SH+hwq+qNKtEdhus+XwhNDXE
 CdAg==
X-Gm-Message-State: AOJu0Yw1Q34pM1zzzNfHF7TBeZGmypw30OtPl6TDvCxMIN9gV/XJkg38
 DAJNHTgG6LxwnmD1rJp626UnyeSuN8yMQOfC02hL+6gT/rlA4Aoaosgi4NtKBPoN2GETja6H1CV
 pVQquC2MVcUc6i6w1uhHn0dzTdtsBwZ0Ae55WwORAO/hDj5tsKO2trYOmNvR4JTibSQ==
X-Received: by 2002:a5d:4647:0:b0:347:5354:887d with SMTP id
 j7-20020a5d4647000000b003475354887dmr6696527wrs.29.1713269907703; 
 Tue, 16 Apr 2024 05:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkRrL2ulGispYQmJGW59tbmsI+WOXUHqw3GeE49fNHEQvJ6OWcSSkCiy/0rKbUjewdpOtz2A==
X-Received: by 2002:a5d:4647:0:b0:347:5354:887d with SMTP id
 j7-20020a5d4647000000b003475354887dmr6696511wrs.29.1713269907261; 
 Tue, 16 Apr 2024 05:18:27 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 df10-20020a5d5b8a000000b003437799a373sm14633199wrb.83.2024.04.16.05.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:18:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
In-Reply-To: <20240410130557.31572-22-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-22-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 14:18:24 +0200
Message-ID: <871q757b73.fsf@minerva.mail-host-address-is-not-set>
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

> Add support for damage handling and deferred I/O to fbdev-dma. This
> enables fbdev-dma to support all DMA-memory-based DRM drivers, even
> such with a dirty callback in their framebuffers.
>
> The patch adds the code for deferred I/O and also sets a dedicated
> helper for struct fb_ops.fb_mmap that support coherent mappings.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 65 ++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 6c9427bb4053b..8ffd072368bca 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -4,6 +4,7 @@
>  
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_drv.h>
> +#include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -35,6 +36,22 @@ static int drm_fbdev_dma_fb_release(struct fb_info *info, int user)
>  	return 0;
>  }
>  
> +FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(drm_fbdev_dma,
> +				   drm_fb_helper_damage_range,
> +				   drm_fb_helper_damage_area);
> +

Shouldn't this be FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS() instead ?

I know that right now the macros are the same but I believe that it was
added it for a reason ?

> +static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_framebuffer *fb = fb_helper->fb;
> +	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
> +
> +	if (!dma->map_noncoherent)
> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);

I noticed that some drivers do:

                 vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));

I see that vm_get_page_prot() is a per-architecture function, but I don't
know about the implications of getting the pgprot_t from the vma->vm_flags
set or just using the current vma->vm_page_prot value...

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

