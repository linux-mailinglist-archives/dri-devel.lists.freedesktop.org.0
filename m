Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B134582C1F2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 15:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7035610E11F;
	Fri, 12 Jan 2024 14:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF25D10E052
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705070192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3n6/2pG1/s6/3lZEYQmz06g0CHDHf1tMAqyM+J4KFSU=;
 b=R6tNvywtvmKd+v6j8FO/UrvtnYW8aSUKESrCV6eDDJB/sqItVrJRamP4Lp2zisofjAiDsq
 s/1lyfxAWoLuACxBTwFt+AXO08iU+RAeh/9v8+Gm2xpjMf/xY6uMhlO+zKwsaG0/bW9lEc
 CDTdbGqj4gTRAz3cvDJh1m01SCTbiOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-CIL-jLjePeu08RwO31dNFg-1; Fri, 12 Jan 2024 09:36:31 -0500
X-MC-Unique: CIL-jLjePeu08RwO31dNFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40d6e7334cfso58980495e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 06:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705070190; x=1705674990;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3n6/2pG1/s6/3lZEYQmz06g0CHDHf1tMAqyM+J4KFSU=;
 b=EoE7XjEMPI4QtsSniGdY8ud0/ofAMiDeWhOIAfPQtMznywFtTIYL+COt+33gYQvH68
 CgZgy2AqoX3uKFNJgdFCwMzPEvMXGm2hNZTg405yyleCo8ddouTlsQxMZiNsL4xvv2wW
 j20i+muV6UPLMb3f3d++2k7cynVviuIYM6jFeXHTbB/nbJBgi9J5Tkkk2InGacn8L+cw
 qnT0dWPCkeo5Eolx2o6ehEEUvkg835gJz/RHG5kbdw2V5p+MDvP2u/+i0g0h7f8AriTn
 8J1STmCg+nIL6PpUcS8fUwePrlfvjm95ywVRxfn3Ev6XXXOtRVv4sSdiXxiO+p5+8Qbr
 WrWg==
X-Gm-Message-State: AOJu0Yxxh0hU2/ne8QNyEslBpk3qgcFu/siVW6QeyPMFDv+LSHWny7jx
 Frj8Jt4TmipCrLCCDuHCl1cM93OBdifraWYbWxK5OOXVCYrNVLoKOVlHfGTQBJJ2Y1A7aitiJ9S
 i2DGlHNdO00rV02SOCkudYxxFvkZUKqCTZKAX
X-Received: by 2002:a7b:c5d7:0:b0:40e:4cb5:272c with SMTP id
 n23-20020a7bc5d7000000b0040e4cb5272cmr827455wmk.234.1705070190085; 
 Fri, 12 Jan 2024 06:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuvynNpPzDsibtj0c4DKM6fQ21/j7qpG10JhisXyKZkOf1+o7IaLtZYrkjJIr4gidRVt4gVg==
X-Received: by 2002:a7b:c5d7:0:b0:40e:4cb5:272c with SMTP id
 n23-20020a7bc5d7000000b0040e4cb5272cmr827451wmk.234.1705070189689; 
 Fri, 12 Jan 2024 06:36:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b0040e4bcfd826sm6135225wmp.47.2024.01.12.06.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 06:36:29 -0800 (PST)
Message-ID: <1af6272a-df93-4a87-b58f-889e2e9be40a@redhat.com>
Date: Fri, 12 Jan 2024 15:36:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v7 0/9] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <ZaFF4lhL5dHmWtuh@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZaFF4lhL5dHmWtuh@phenom.ffwll.local>
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
Cc: bluescreen_avenger@verizon.net, javierm@redhat.com, mripard@kernel.org,
 gpiccoli@igalia.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/01/2024 15:00, Daniel Vetter wrote:
> On Thu, Jan 04, 2024 at 05:00:44PM +0100, Jocelyn Falempe wrote:
>> This introduces a new drm panic handler, which displays a message when a panic occurs.
>> So when fbcon is disabled, you can still see a kernel panic.
>>
>> This is one of the missing feature, when disabling VT/fbcon in the kernel:
>> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
>> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>>
>> This is a proof of concept, and works with simpledrm, mgag200, ast, and imx using a new get_scanout_buffer() api
>>
>> To test it, make sure you're using the simpledrm driver, and trigger a panic:
>> echo c > /proc/sysrq-trigger
> 
> Uh this is not great for testing in CI, we need something better. A
> drm-specific solution would be a debugfs file that triggers the panic
> dumping (which is the reason we should correctly unlock all locks we've
> taken too).

Yes, I already use a dumb file in debugfs to trigger the panic handler 
for development purpose. So it's a bit easier than crashing the machine.
I didn't add it in the series, because it's a bit rough, and the panic 
handler assumes there are no other thread running, and that it's the 
last frame the gpu will display before rebooting.

It gives some beautiful effect (if your driver uses double buffering, 
only one of them will be repainted with the panic screen, so it's 
flashing a bit afterward. It's also a good way to see if your driver 
uses the damage API correctly).

So I will add it in the next series.

> 
> Even better would be if the core code provides this infrastructure, so
> that ideally we could exercise running from an nmi context. For the drm
> testing the best we can probably do is disable local interrupts or maybe
> run from a timer that immediately fires.
> 
> I think adding that test infrastructure plus an igt that exercises should
> be done as part of merging the initial version. Otherwise there's just no
> way we can make sure that this code doesn't immediately bitrot like all
> the previous panic handlers.

ok, I will look into that. I didn't use igt yet, so I will see what I 
can do.
> 
> Cheers, Sima
> 
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
>>
>> Best regards,
>>
>> Jocelyn Falempe (9):
>>    drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
>>    drm/panic: Add a drm panic handler
>>    drm/plane: Add drm_for_each_primary_visible_plane macro
>>    drm/panic: Add drm_panic_is_format_supported()
>>    drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
>>    drm/simpledrm: Add drm_panic support
>>    drm/mgag200: Add drm_panic support
>>    drm/ast: Add drm_panic support
>>    drm/imx: Add drm_panic support
>>
>>   drivers/gpu/drm/Kconfig                  |  23 ++
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/ast/ast_drv.c            |  26 +-
>>   drivers/gpu/drm/drm_drv.c                |   8 +
>>   drivers/gpu/drm/drm_fb_dma_helper.c      |  55 +++
>>   drivers/gpu/drm/drm_format_helper.c      | 432 ++++++++++++++++++-----
>>   drivers/gpu/drm/drm_panic.c              | 382 ++++++++++++++++++++
>>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c |   2 +
>>   drivers/gpu/drm/mgag200/mgag200_drv.c    |  22 ++
>>   drivers/gpu/drm/tiny/simpledrm.c         |  15 +
>>   include/drm/drm_drv.h                    |  21 ++
>>   include/drm/drm_fb_dma_helper.h          |   4 +
>>   include/drm/drm_format_helper.h          |   9 +
>>   include/drm/drm_panic.h                  | 101 ++++++
>>   include/drm/drm_plane.h                  |  15 +
>>   15 files changed, 1033 insertions(+), 83 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>>
>> base-commit: 50a3c772bd927dd409c484832ddd9f6bf00b7389
>> -- 
>> 2.43.0
>>
> 

