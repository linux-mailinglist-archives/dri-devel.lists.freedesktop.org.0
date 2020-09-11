Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779D2660EA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 16:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 303516EA74;
	Fri, 11 Sep 2020 14:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ABF6EA74
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599833268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bRmoS0Xs5IV7x566G6Y/aCIB8602RVKsBGYpTrBtCg=;
 b=GIyfuDGczbKxcNPazvIrxKU35bNTpwwDvdFlr09UPqAXsv34W0NGRCZxhF2VeAKTlXddtD
 eeDLtFV6m+ye8U24MTw/1TAXoSHDIBYe2bov4BW+l4lebDAXqO8j5Tf5cA5nspKg59jNCq
 awke+zuB1H5HS8VmMfzNIEuDVP4q4Ho=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-Gh7wnoEPOzmCeooV2XlIWw-1; Fri, 11 Sep 2020 10:07:46 -0400
X-MC-Unique: Gh7wnoEPOzmCeooV2XlIWw-1
Received: by mail-ej1-f72.google.com with SMTP id w17so4707083eja.10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 07:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9bRmoS0Xs5IV7x566G6Y/aCIB8602RVKsBGYpTrBtCg=;
 b=iwJKOPaGyln57TnyPdJIJy3CxYlA0a1ODNXiJFE8ar7+okYeSmQ89rvPsyxwtACtbA
 KJLBrpLk3PMc2NQFUWlDeogIE+XiZITtt4LbQHFqE276HRhZvPWe/Q5jUNoiLMJg8J6A
 5HNN7qENXXfnywNIy3VhWlkQP8ec+kK8SjadT+I4lGBrXuXy89yhY1owJC9/lE0yX4Tg
 XE8R12Z2hAfnJEO89v/qXF3VLzS1JDI5HJlx0BvUwYPJCr/l9MqHbvzTFB4RI1yFTmoP
 pmnp74UC5236jXf16I+i/Bj5rvS/YcIUnXybIsLXvxZt+8Ps9XrSXsz6G/G3S79F4jZj
 ulOg==
X-Gm-Message-State: AOAM532KQoPqos7YE3oGVUBoLd+SsqJZnIYq5CCazZD+MO0h93mW6pY+
 5Ac+Fm0JvjXfRqlWfLj5Dvzvx4/5XhRX/nw8+BYJxZL2fVyIFOlajJ3QfEBr3G944wAApmXyKSU
 HZtRte0jJ6mhSA7MrMH6P+/38ODtM
X-Received: by 2002:a17:906:2659:: with SMTP id
 i25mr2167871ejc.16.1599833264651; 
 Fri, 11 Sep 2020 07:07:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx9Cb5m0Fvy74zzgiLlXm8jZbWKLtfpdKl7ho1H6KjoYnXM6/p0+GXIDFwDWtnuYKXUfynJA==
X-Received: by 2002:a17:906:2659:: with SMTP id
 i25mr2167849ejc.16.1599833264381; 
 Fri, 11 Sep 2020 07:07:44 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id op24sm1693572ejb.87.2020.09.11.07.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 07:07:43 -0700 (PDT)
Subject: Re: [PATCH] drm/vboxvideo: Use drm_gem_vram_vmap() interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20200911075922.19317-1-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <df0975cb-9ed2-0cde-e499-d1b63e2c9faa@redhat.com>
Date: Fri, 11 Sep 2020 16:07:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911075922.19317-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/11/20 9:59 AM, Thomas Zimmermann wrote:
> VRAM helpers support ref counting for pin and vmap operations, no need
> to avoid these operations, by employing the internal kmap interface. Just
> use drm_gem_vram_vmap() and let it handle the details.
> 
> Also unexport the kmap interfaces from VRAM helpers. Vboxvideo was the
> last user of these internal functions.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice cleanup.

I've given this a test-run in an actual VirtualBox vm, focussing on
cursor sprite changes and I don't see any regressions, so:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Thomas, I assume that you will push this upstream yourself?

Regards,

Hans


> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 56 +--------------------------
>   drivers/gpu/drm/vboxvideo/vbox_mode.c | 10 +++--
>   include/drm/drm_gem_vram_helper.h     |  3 --
>   3 files changed, 8 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 07447abb4134..0e3cdc40379c 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -97,8 +97,8 @@ static const struct drm_gem_object_funcs drm_gem_vram_object_funcs;
>    * hardware's draing engine.
>    *
>    * To access a buffer object's memory from the DRM driver, call
> - * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
> - * space and returns the memory address. Use drm_gem_vram_kunmap() to
> + * drm_gem_vram_vmap(). It maps the buffer into kernel address
> + * space and returns the memory address. Use drm_gem_vram_vunmap() to
>    * release the mapping.
>    */
>   
> @@ -436,39 +436,6 @@ static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
>   	return kmap->virtual;
>   }
>   
> -/**
> - * drm_gem_vram_kmap() - Maps a GEM VRAM object into kernel address space
> - * @gbo:	the GEM VRAM object
> - * @map:	establish a mapping if necessary
> - * @is_iomem:	returns true if the mapped memory is I/O memory, or false \
> -	otherwise; can be NULL
> - *
> - * This function maps the buffer object into the kernel's address space
> - * or returns the current mapping. If the parameter map is false, the
> - * function only queries the current mapping, but does not establish a
> - * new one.
> - *
> - * Returns:
> - * The buffers virtual address if mapped, or
> - * NULL if not mapped, or
> - * an ERR_PTR()-encoded error code otherwise.
> - */
> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
> -			bool *is_iomem)
> -{
> -	int ret;
> -	void *virtual;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, true, false, NULL);
> -	if (ret)
> -		return ERR_PTR(ret);
> -	virtual = drm_gem_vram_kmap_locked(gbo, map, is_iomem);
> -	ttm_bo_unreserve(&gbo->bo);
> -
> -	return virtual;
> -}
> -EXPORT_SYMBOL(drm_gem_vram_kmap);
> -
>   static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>   {
>   	if (WARN_ON_ONCE(!gbo->kmap_use_count))
> @@ -484,22 +451,6 @@ static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
>   	 */
>   }
>   
> -/**
> - * drm_gem_vram_kunmap() - Unmaps a GEM VRAM object
> - * @gbo:	the GEM VRAM object
> - */
> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo)
> -{
> -	int ret;
> -
> -	ret = ttm_bo_reserve(&gbo->bo, false, false, NULL);
> -	if (WARN_ONCE(ret, "ttm_bo_reserve_failed(): ret=%d\n", ret))
> -		return;
> -	drm_gem_vram_kunmap_locked(gbo);
> -	ttm_bo_unreserve(&gbo->bo);
> -}
> -EXPORT_SYMBOL(drm_gem_vram_kunmap);
> -
>   /**
>    * drm_gem_vram_vmap() - Pins and maps a GEM VRAM object into kernel address
>    *                       space
> @@ -511,9 +462,6 @@ EXPORT_SYMBOL(drm_gem_vram_kunmap);
>    * permanently. Call drm_gem_vram_vunmap() with the returned address to
>    * unmap and unpin the GEM VRAM object.
>    *
> - * If you have special requirements for the pinning or mapping operations,
> - * call drm_gem_vram_pin() and drm_gem_vram_kmap() directly.
> - *
>    * Returns:
>    * The buffer's virtual address on success, or
>    * an ERR_PTR()-encoded error code otherwise.
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> index d9a5af62af89..4fcc0a542b8a 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
> @@ -397,11 +397,13 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>   
>   	vbox_crtc->cursor_enabled = true;
>   
> -	/* pinning is done in prepare/cleanup framebuffer */
> -	src = drm_gem_vram_kmap(gbo, true, NULL);
> +	src = drm_gem_vram_vmap(gbo);
>   	if (IS_ERR(src)) {
> +		/*
> +		 * BUG: we should have pinned the BO in prepare_fb().
> +		 */
>   		mutex_unlock(&vbox->hw_mutex);
> -		DRM_WARN("Could not kmap cursor bo, skipping update\n");
> +		DRM_WARN("Could not map cursor bo, skipping update\n");
>   		return;
>   	}
>   
> @@ -414,7 +416,7 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
>   	data_size = width * height * 4 + mask_size;
>   
>   	copy_cursor_image(src, vbox->cursor_data, width, height, mask_size);
> -	drm_gem_vram_kunmap(gbo);
> +	drm_gem_vram_vunmap(gbo, src);
>   
>   	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
>   		VBOX_MOUSE_POINTER_ALPHA;
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
> index 035332f3723f..b34f1da89cc7 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -101,9 +101,6 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo);
>   s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo);
>   int drm_gem_vram_pin(struct drm_gem_vram_object *gbo, unsigned long pl_flag);
>   int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo);
> -void *drm_gem_vram_kmap(struct drm_gem_vram_object *gbo, bool map,
> -			bool *is_iomem);
> -void drm_gem_vram_kunmap(struct drm_gem_vram_object *gbo);
>   void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo);
>   void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo, void *vaddr);
>   
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
