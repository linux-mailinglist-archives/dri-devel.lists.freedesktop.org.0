Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5C8A55D5
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 17:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283DA112053;
	Mon, 15 Apr 2024 15:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="czECd7rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F468112053
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713193236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJRSoAkdpM6dnlBK4fABXfyyb2kNSk6KIKjvb0c2XjI=;
 b=czECd7rv+xnTfTJpha1Z+TEyxhCNSx6bVZfpWQEjPTURB+fsnhQeDWoDahJfgLQ03EpovN
 TI9Boxwf6AG87JIjW0afiHY56PqlgE/xI58nOEToSjb0tpiTcLjlZBsxtoJQ5oKPpCWsIp
 COrhGw/ATPrgpTps1UCGfb+cLZTZ4HQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-8ZELEOFUMnmedAhnjkOB6Q-1; Mon, 15 Apr 2024 11:00:34 -0400
X-MC-Unique: 8ZELEOFUMnmedAhnjkOB6Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-41552c04845so12359055e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:00:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713193233; x=1713798033;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XJRSoAkdpM6dnlBK4fABXfyyb2kNSk6KIKjvb0c2XjI=;
 b=PnDeA5I7BEoQ1i8QHmYHfODSIGPeNk5juPUQYU17fDEhJK5YWNuIqcWgtE84P2pTEx
 ziVzCXsfj/m7mtYO6Z5B/VWCKvGHIGnfgtfx97RHFB9uYKr5k/p7zbJohMKgZ26SsMOZ
 6RfluheqAGC8K+i32kmmIebLjNsuJg2/SWDatZLgRh+EXXH4295wEhvdW8SWU7Zkrti8
 hjbvW0QRiLTniEfteX23V5iYfsI040CXxinET7TIYl8uGRc9NeIYyUj94cfgTj2HiALL
 k1PXWdZKsgZppEOXc9hRUZctad/GDY5gbUSv7BmwqzOL9qJyXC2EcmCHK7P6uYZ3gJEg
 4m9Q==
X-Gm-Message-State: AOJu0Yybrnfb2GndCqw+ubryzQUGwf92AQvtzNVEtls6ouO1jQPSTG0x
 00mCxGw2wlHO/UNPjQcjwS2H3d6D/oTB8iN722UBVAE5nOVTga3xVTpN1fkG8UmReYdpcQLXLdg
 7MwQ7lQIKAiAJV0vPiF9UK6aKRuqHmykrJO0dK6bLgettwFjAu5i3EIciJzlgXno05Q==
X-Received: by 2002:a05:600c:1d97:b0:418:6eb6:5ccb with SMTP id
 p23-20020a05600c1d9700b004186eb65ccbmr1331348wms.3.1713193233102; 
 Mon, 15 Apr 2024 08:00:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESlLI7cxAqvXxZmAuxSf9fJiusfTdWxbCHEhOkr8Jccj0RLjRY2cbl+9r9BJp4O2/Ba9+TAQ==
X-Received: by 2002:a05:600c:1d97:b0:418:6eb6:5ccb with SMTP id
 p23-20020a05600c1d9700b004186eb65ccbmr1331324wms.3.1713193232676; 
 Mon, 15 Apr 2024 08:00:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a05600c19ce00b0041884b79b81sm296999wmq.1.2024.04.15.08.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 08:00:32 -0700 (PDT)
Message-ID: <aea2aa01-7f03-453b-8b30-8f4d90b1b47f@redhat.com>
Date: Mon, 15 Apr 2024 17:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/9] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com, 
 bluescreen_avenger@verizon.net, noralf@tronnes.org, sui.jingfeng@linux.dev,
 gpiccoli@igalia.com
References: <20240409163432.352518-1-jfalempe@redhat.com>
 <ZhZJ0p5R4jUqrP9f@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZhZJ0p5R4jUqrP9f@phenom.ffwll.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 10/04/2024 10:12, Daniel Vetter wrote:
> On Tue, Apr 09, 2024 at 06:30:39PM +0200, Jocelyn Falempe wrote:
>> drm/panic: Add a drm panic handler
>>
>> This introduces a new drm panic handler, which displays a message when a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>>
>> It works with simpledrm, mgag200, ast, and imx.
>>
>> To test it, make sure you're using one of the supported driver, and trigger a panic:
>> echo c > /proc/sysrq-trigger
>>
>> or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0
>>
>> Even if this is not yet useful, it will allows to work on more driver support, and better debug information to be added.
>>
>> v2:
>>   * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
>>   * Add the panic reason to the panic message (Nerdopolis)
>>   * Add an exclamation mark (Nerdopolis)
>>   
>> v3:
>>   * Rework the drawing functions, to write the pixels line by line and
>>   to use the drm conversion helper to support other formats.
>>   (Thomas Zimmermann)
>>   
>> v4:
>>   * Fully support all simpledrm formats using drm conversion helpers
>>   * Rename dpanic_* to drm_panic_*, and have more coherent function name.
>>     (Thomas Zimmermann)
>>   * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>>   * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>>   * Add foreground/background color config option
>>   * Fix the bottom lines not painted if the framebuffer height
>>     is not a multiple of the font height.
>>   * Automatically register the driver to drm_panic, if the function
>>     get_scanout_buffer() exists. (Thomas Zimmermann)
>>   * Add mgag200 support.
>>   
>> v5:
>>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>>     (Thomas Zimmermann)
>>   * Also add drm_fb_fill() to fill area with background color.
>>   * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>>   * Add a flush() callback for drivers that needs to synchronize the buffer.
>>   * Add a void *private field, so drivers can pass private data to
>>     draw_pixel_xy() and flush().
>>   * Add ast support.
>>   * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripard)
>>
>> v6:
>>   * Fix sparse and __le32 warnings
>>   * Drop the IMX/IPUV3 experiment, it was just to show that it works also on
>>     ARM devices.
>>
>> v7:
>>   * Add a check to see if the 4cc format is supported by drm_panic.
>>   * Add a drm/plane helper to loop over all visible primary buffer,
>>     simplifying the get_scanout_buffer implementations
>>   * Add a generic implementation for drivers that uses drm_fb_dma. (Maxime Ripard)
>>   * Add back the IMX/IPUV3 support, and use the generic implementation. (Maxime Ripard)
>>
>> v8:
>>   * Directly register each plane to the panic notifier (Sima)
>>   * Replace get_scanout_buffer() with set_scanout_buffer() to simplify
>>     the locking. (Thomas Zimmermann)
>>   * Add a debugfs entry, to trigger the drm_panic without a real panic (Sima)
>>   * Fix the drm_panic Documentation, and include it in drm-kms.rst
>>
>> v9:
>>   * Revert to using get_scanout_buffer() (Sima)
>>   * Move get_scanout_buffer() and panic_flush() to the plane helper
>>     functions (Thomas Zimmermann)
>>   * Register all planes with get_scanout_buffer() to the panic notifier
>>   * Use drm_panic_lock() to protect against race (Sima)
>>   * Create a debugfs file for each plane in the device's debugfs
>>     directory. This allows to test for each plane of each GPU
>>     independently.
>> v10:
>>   * Move blit and fill functions back in drm_panic (Thomas Zimmermann).
>>   * Simplify the text drawing functions.
>>   * Use kmsg_dumper instead of panic_notifier (Sima).
>>   * Use spinlock_irqsave/restore (John Ogness)
>>
>> v11:
>>   * Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)
>>
>> v12:
>>   * Use array for map and pitch in struct drm_scanout_buffer
>>     to support multi-planar format later. (Thomas Zimmermann)
>>   * Rename drm_panic_gem_get_scanout_buffer to drm_fb_dma_get_scanout_buffer
>>     and build it unconditionally (Thomas Zimmermann)
>>   * Better indent struct drm_scanout_buffer declaration. (Thomas Zimmermann)
> 
> On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> And apologies for the detours this patch set took and my part in the (too
> many) revisions. I think we should land this and do anything more once
> it's merged and we extend the panic support to more drivers.

Thanks for your help, I just pushed it to drm-misc-next.

Best regards,

-- 

Jocelyn
> 
> Thanks a lot to you for seeing this through!
> 
> Cheers, Sima
>>
>>
>> Best regards,
>>
>>
>> Daniel Vetter (1):
>>    drm/panic: Add drm panic locking
>>
>> Jocelyn Falempe (8):
>>    drm/panic: Add a drm panic handler
>>    drm/panic: Add support for color format conversion
>>    drm/panic: Add debugfs entry to test without triggering panic.
>>    drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
>>    drm/simpledrm: Add drm_panic support
>>    drm/mgag200: Add drm_panic support
>>    drm/imx: Add drm_panic support
>>    drm/ast: Add drm_panic support
>>
>>   Documentation/gpu/drm-kms.rst            |  12 +
>>   drivers/gpu/drm/Kconfig                  |  32 ++
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/ast/ast_mode.c           |  18 +
>>   drivers/gpu/drm/drm_atomic_helper.c      |   4 +
>>   drivers/gpu/drm/drm_drv.c                |   5 +
>>   drivers/gpu/drm/drm_fb_dma_helper.c      |  42 ++
>>   drivers/gpu/drm/drm_panic.c              | 583 +++++++++++++++++++++++
>>   drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c  |  11 +-
>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |   7 +-
>>   drivers/gpu/drm/mgag200/mgag200_mode.c   |  18 +
>>   drivers/gpu/drm/tiny/simpledrm.c         |  16 +
>>   include/drm/drm_fb_dma_helper.h          |   4 +
>>   include/drm/drm_mode_config.h            |  10 +
>>   include/drm/drm_modeset_helper_vtables.h |  37 ++
>>   include/drm/drm_panic.h                  | 157 ++++++
>>   include/drm/drm_plane.h                  |   6 +
>>   17 files changed, 961 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>>
>> base-commit: 935a92a1c400285545198ca2800a4c6c519c650a
>> -- 
>> 2.44.0
>>
> 

