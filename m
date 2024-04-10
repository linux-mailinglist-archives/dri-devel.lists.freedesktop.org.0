Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED50889FB4A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED3010F3AD;
	Wed, 10 Apr 2024 15:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R6zdOqY7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847EB10ECBF
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712762086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4s+LRADSs6Gl4AVRrVhPfozR1TKGnIWwCrZe8gSLUfM=;
 b=R6zdOqY7GESHw2d7KTZB7i22tFkbpUZa3BbiDo9FMUp7WPSuMWHzqoaltbBS5iKqd3+0J9
 AGhe8l3L2bwQKwsUEes56wchImr4eKztHvSAB0+RJyp67/xLtUn10MY4c+BLZDPFY801Mr
 rWI1XcDwB0qLxMqO5Cu5LhVOh+eTAh8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-lBi9SS_iP5ipXhII000F7g-1; Wed, 10 Apr 2024 11:14:44 -0400
X-MC-Unique: lBi9SS_iP5ipXhII000F7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-345aa380e51so1793959f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 08:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712762083; x=1713366883;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4s+LRADSs6Gl4AVRrVhPfozR1TKGnIWwCrZe8gSLUfM=;
 b=SkBCyE8LJNllvn5AyCr4BzRxFK5rR/JBiOPvMhe+0h/FqCsxr/MGUFk1uGmr6Y7Mu8
 +ARdQ2fnzMJjty6iEVuRGzqJs6ewfuZyE+fi2jSP62i79v8/4OhaC6+XSp8C8uymcGYj
 WIH8QP7TMNLCg8eYYrXh5oMv18d+7pBW7pRXTq96ZDbHa8gYnCHTtN7lK8xO9iXx51NF
 U8v90tGtEUXyiMRuF1PxATPlh6VqxDJeE20TsbbzmM46Z4ifq27mSGKDAKWJrrdlGWTn
 zBGSQdt+MLpW+GrsOeq75zwwp4ngPMOGoAB+6oJo1x+6A7kpZRyCaQGEgHzMF1x0yM+L
 cTjw==
X-Gm-Message-State: AOJu0YySODPd7XCm3mIkIE4jAkC/E/bv6qe5AKH0iXXChsPoTBX+ybAC
 OlzN5j3TPFoU6Pso8HoDS1ZU0im6JljdC7DmE5YkCGTM5YjZw9+vp0qKAiDcMEG+5ePcPHqhY8w
 5e45l3Ib7TN3/23UjSmvURiwCEmo0QREpK72Cps5c56DQ5bqM14cTf6VmhpPjpHDzrQ==
X-Received: by 2002:a05:6000:1ac8:b0:343:c58f:7af4 with SMTP id
 i8-20020a0560001ac800b00343c58f7af4mr2067893wry.59.1712762083417; 
 Wed, 10 Apr 2024 08:14:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo1CDNTsWDXaafAyPrwnN/RALB3O/4rHrGqaXhLkkV5Mch3ep4I6VhaQ16EKSH26FfQOBGmA==
X-Received: by 2002:a05:6000:1ac8:b0:343:c58f:7af4 with SMTP id
 i8-20020a0560001ac800b00343c58f7af4mr2067869wry.59.1712762082914; 
 Wed, 10 Apr 2024 08:14:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:f101:edd0:5929:7a40?
 ([2a01:e0a:d5:a000:f101:edd0:5929:7a40])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d47cf000000b0034353b9c26bsm14257974wrc.9.2024.04.10.08.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 08:14:42 -0700 (PDT)
Message-ID: <8bb2db80-31ab-4e34-b03e-0ab6b61d7edb@redhat.com>
Date: Wed, 10 Apr 2024 17:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/9] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com, 
 bluescreen_avenger@verizon.net, noralf@tronnes.org, sui.jingfeng@linux.dev,
 gpiccoli@igalia.com
References: <20240409163432.352518-1-jfalempe@redhat.com>
 <20240409163432.352518-3-jfalempe@redhat.com>
 <ZhZJc16hJfYgCJTj@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZhZJc16hJfYgCJTj@phenom.ffwll.local>
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

Hi,

On 10/04/2024 10:10, Daniel Vetter wrote:
> On Tue, Apr 09, 2024 at 06:30:41PM +0200, Jocelyn Falempe wrote:
>> This module displays a user friendly message when a kernel panic
>> occurs. It currently doesn't contain any debug information,
>> but that can be added later.
>>
>> v2
>>   * Use get_scanout_buffer() instead of the drm client API.
>>    (Thomas Zimmermann)
>>   * Add the panic reason to the panic message (Nerdopolis)
>>   * Add an exclamation mark (Nerdopolis)
>>
>> v3
>>   * Rework the drawing functions, to write the pixels line by line and
>>   to use the drm conversion helper to support other formats.
>>   (Thomas Zimmermann)
>>
>> v4
>>   * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>>   * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>>   * Add foreground/background color config option
>>   * Fix the bottom lines not painted if the framebuffer height
>>     is not a multiple of the font height.
>>   * Automatically register the device to drm_panic, if the function
>>     get_scanout_buffer exists. (Thomas Zimmermann)
>>
>> v5
>>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>>   * Also add drm_fb_fill() to fill area with background color.
>>   * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>>   * Add a flush() callback for drivers that needs to synchronize the buffer.
>>   * Add a void *private field, so drivers can pass private data to
>>     draw_pixel_xy() and flush().
>>
>> v6
>>   * Fix sparse warning for panic_msg and logo.
>>
>> v7
>>   * Add select DRM_KMS_HELPER for the color conversion functions.
>>
>> v8
>>   * Register directly each plane to the panic notifier (Sima)
>>   * Add raw_spinlock to properly handle concurrency (Sima)
>>   * Register plane instead of device, to avoid looping through plane
>>     list, and simplify code.
>>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>>    (Thomas Zimmermann)
>>   * Removed the draw_pixel_xy() API, will see later if it can be added back.
>>
>> v9
>>   * Revert to using get_scanout_buffer() (Sima)
>>   * Move get_scanout_buffer() and panic_flush() to the plane helper
>>     functions (Thomas Zimmermann)
>>   * Register all planes with get_scanout_buffer() to the panic notifier
>>   * Use drm_panic_lock() to protect against race (Sima)
>>
>> v10
>>   * Move blit and fill functions back in drm_panic (Thomas Zimmermann).
>>   * Simplify the text drawing functions.
>>   * Use kmsg_dumper instead of panic_notifier (Sima).
>>
>> v12
>>   * Use array for map and pitch in struct drm_scanout_buffer
>>     to support multi-planar format later. (Thomas Zimmermann)
>>   * Better indent struct drm_scanout_buffer declaration. (Thomas Zimmermann)
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Some detail suggestions for the kerneldoc but those aside Acked-by: Daniel
> Vetter <daniel.vetter@ffwll.ch>

Thanks for the review.
I fixed the documentation, and make sure the links are working.

>> ---
>>   Documentation/gpu/drm-kms.rst            |  12 +
>>   drivers/gpu/drm/Kconfig                  |  23 ++
>>   drivers/gpu/drm/Makefile                 |   1 +
>>   drivers/gpu/drm/drm_drv.c                |   4 +
>>   drivers/gpu/drm/drm_panic.c              | 289 +++++++++++++++++++++++
>>   include/drm/drm_modeset_helper_vtables.h |  37 +++
>>   include/drm/drm_panic.h                  |  57 +++++
>>   include/drm/drm_plane.h                  |   6 +
>>   8 files changed, 429 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>
>> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
>> index 13d3627d8bc0..b64334661aeb 100644
>> --- a/Documentation/gpu/drm-kms.rst
>> +++ b/Documentation/gpu/drm-kms.rst
>> @@ -398,6 +398,18 @@ Plane Damage Tracking Functions Reference
>>   .. kernel-doc:: include/drm/drm_damage_helper.h
>>      :internal:
>>   
>> +Plane Panic Feature
>> +-------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_panic.c
>> +   :doc: overview
>> +
>> +Plane Panic Functions Reference
>> +-------------------------------
>> +
>> +.. kernel-doc:: drivers/gpu/drm/drm_panic.c
>> +   :export:
>> +
>>   Display Modes Function Reference
>>   ================================
>>   
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 3914aaf443a8..f8a26423369e 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -104,6 +104,29 @@ config DRM_KMS_HELPER
>>   	help
>>   	  CRTC helpers for KMS drivers.
>>   
>> +config DRM_PANIC
>> +	bool "Display a user-friendly message when a kernel panic occurs"
>> +	depends on DRM && !FRAMEBUFFER_CONSOLE
>> +	select DRM_KMS_HELPER
>> +	select FONT_SUPPORT
>> +	help
>> +	  Enable a drm panic handler, which will display a user-friendly message
>> +	  when a kernel panic occurs. It's useful when using a user-space
>> +	  console instead of fbcon.
>> +	  It will only work if your graphic driver supports this feature.
>> +	  To support Hi-DPI Display, you can enable bigger fonts like
>> +	  FONT_TER16x32
>> +
>> +config DRM_PANIC_FOREGROUND_COLOR
>> +	hex "Drm panic screen foreground color, in RGB"
>> +	depends on DRM_PANIC
>> +	default 0xffffff
>> +
>> +config DRM_PANIC_BACKGROUND_COLOR
>> +	hex "Drm panic screen background color, in RGB"
>> +	depends on DRM_PANIC
>> +	default 0x000000
>> +
>>   config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>>           bool "Enable refcount backtrace history in the DP MST helpers"
>>   	depends on STACKTRACE_SUPPORT
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index a73c04d2d7a3..f9ca4f8fa6c5 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -88,6 +88,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
>>   	drm_privacy_screen.o \
>>   	drm_privacy_screen_x86.o
>>   drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>> +drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>>   obj-$(CONFIG_DRM)	+= drm.o
>>   
>>   obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index c157500b3135..535b624d4c9d 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -43,6 +43,7 @@
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/drm_mode_object.h>
>> +#include <drm/drm_panic.h>
>>   #include <drm/drm_print.h>
>>   #include <drm/drm_privacy_screen_machine.h>
>>   
>> @@ -944,6 +945,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>>   		if (ret)
>>   			goto err_unload;
>>   	}
>> +	drm_panic_register(dev);
>>   
>>   	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
>>   		 driver->name, driver->major, driver->minor,
>> @@ -988,6 +990,8 @@ void drm_dev_unregister(struct drm_device *dev)
>>   {
>>   	dev->registered = false;
>>   
>> +	drm_panic_unregister(dev);
>> +
>>   	drm_client_dev_unregister(dev);
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_MODESET))
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> new file mode 100644
>> index 000000000000..fa4b220534a4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -0,0 +1,289 @@
>> +// SPDX-License-Identifier: GPL-2.0 or MIT
>> +/*
>> + * Copyright (c) 2023 Red Hat.
>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>> + * inspired by the drm_log driver from David Herrmann <dh.herrmann@gmail.com>
>> + * Tux Ascii art taken from cowsay written by Tony Monroe
>> + */
>> +
>> +#include <linux/font.h>
>> +#include <linux/iosys-map.h>
>> +#include <linux/kdebug.h>
>> +#include <linux/kmsg_dump.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_format_helper.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_framebuffer.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>> +#include <drm/drm_panic.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_print.h>
>> +
>> +
>> +MODULE_AUTHOR("Jocelyn Falempe");
>> +MODULE_DESCRIPTION("DRM panic handler");
>> +MODULE_LICENSE("GPL");
>> +
>> +/**
>> + * DOC: overview
>> + *
>> + * To enable DRM panic for a driver, the primary plane must implement a
>> + * get_scanout_buffer() helper function. It is then automatically registered to
>> + * the drm panic handler.
>> + * When a panic occurs, the get_scanout_buffer() will be called, and the driver
>> + * can provide a framebuffer so the panic handler can draw the panic screen on
>> + * it. The buffer provided must be linear, and use a supported color format.
>> + * Optionally the driver can also provide a panic_flush() callback, that will
>> + * be called after that, to send additional commands to the hardware to make the
>> + * scanout buffer visible.
>> + */
>> +
>> +/*
>> + * This module displays a user friendly message on screen when a kernel panic
>> + * occurs. This is conflicting with fbcon, so you can only enable it when fbcon
>> + * is disabled.
>> + * It's intended for end-user, so have minimal technical/debug information.
>> + *
>> + * Implementation details:
>> + *
>> + * It is a panic handler, so it can't take lock, allocate memory, run tasks/irq,
>> + * or attempt to sleep. It's a best effort, and it may not be able to display
>> + * the message in all situations (like if the panic occurs in the middle of a
>> + * modesetting).
>> + * It will display only one static frame, so performance optimizations are low
>> + * priority as the machine is already in an unusable state.
>> + */
>> +
>> +struct drm_panic_line {
>> +	u32 len;
>> +	const char *txt;
>> +};
>> +
>> +#define PANIC_LINE(s) {.len = sizeof(s) - 1, .txt = s}
>> +
>> +static struct drm_panic_line panic_msg[] = {
>> +	PANIC_LINE("KERNEL PANIC !"),
>> +	PANIC_LINE(""),
>> +	PANIC_LINE("Please reboot your computer."),
>> +};
>> +
>> +static const struct drm_panic_line logo[] = {
>> +	PANIC_LINE("     .--.        _"),
>> +	PANIC_LINE("    |o_o |      | |"),
>> +	PANIC_LINE("    |:_/ |      | |"),
>> +	PANIC_LINE("   //   \\ \\     |_|"),
>> +	PANIC_LINE("  (|     | )     _"),
>> +	PANIC_LINE(" /'\\_   _/`\\    (_)"),
>> +	PANIC_LINE(" \\___)=(___/"),
>> +};
>> +
>> +static void drm_panic_fill32(struct iosys_map *map, unsigned int pitch,
>> +			     unsigned int height, unsigned int width,
>> +			     u32 color)
>> +{
>> +	unsigned int y, x;
>> +
>> +	for (y = 0; y < height; y++)
>> +		for (x = 0; x < width; x++)
>> +			iosys_map_wr(map, y * pitch + x * sizeof(u32), u32, color);
>> +}
>> +
>> +static void drm_panic_blit32(struct iosys_map *dmap, unsigned int dpitch,
>> +			     const u8 *sbuf8, unsigned int spitch,
>> +			     unsigned int height, unsigned int width,
>> +			     u32 fg32, u32 bg32)
>> +{
>> +	unsigned int y, x;
>> +	u32 val32;
>> +
>> +	for (y = 0; y < height; y++) {
>> +		for (x = 0; x < width; x++) {
>> +			val32 = (sbuf8[(y * spitch) + x / 8] & (0x80 >> (x % 8))) ? fg32 : bg32;
>> +			iosys_map_wr(dmap, y * dpitch + x * sizeof(u32), u32, val32);
>> +		}
>> +	}
>> +}
>> +
>> +static const u8 *get_char_bitmap(const struct font_desc *font, char c, size_t font_pitch)
>> +{
>> +	return font->data + (c * font->height) * font_pitch;
>> +}
>> +
>> +static unsigned int get_max_line_len(const struct drm_panic_line *lines, int len)
>> +{
>> +	int i;
>> +	unsigned int max = 0;
>> +
>> +	for (i = 0; i < len; i++)
>> +		max = max(lines[i].len, max);
>> +	return max;
>> +}
>> +/*
>> + * Draw a text in a rectangle on a framebuffer. The text is truncated if it overflows the rectangle
>> + */
>> +static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>> +				const struct font_desc *font,
>> +				const struct drm_panic_line *msg,
>> +				unsigned int msg_lines,
>> +				bool centered,
>> +				struct drm_rect *clip,
>> +				u32 fg_color,
>> +				u32 bg_color)
>> +{
>> +	int i, j;
>> +	const u8 *src;
>> +	size_t font_pitch = DIV_ROUND_UP(font->width, 8);
>> +	struct iosys_map dst;
>> +	unsigned int px_width = sb->format->cpp[0];
>> +	int left = 0;
>> +
>> +	msg_lines = min(msg_lines,  drm_rect_height(clip) / font->height);
>> +	for (i = 0; i < msg_lines; i++) {
>> +		size_t line_len = min(msg[i].len, drm_rect_width(clip) / font->width);
>> +
>> +		if (centered)
>> +			left = (drm_rect_width(clip) - (line_len * font->width)) / 2;
>> +
>> +		dst = sb->map[0];
>> +		iosys_map_incr(&dst, (clip->y1 + i * font->height) * sb->pitch[0] +
>> +				     (clip->x1 + left) * px_width);
>> +		for (j = 0; j < line_len; j++) {
>> +			src = get_char_bitmap(font, msg[i].txt[j], font_pitch);
>> +			drm_panic_blit32(&dst, sb->pitch[0], src, font_pitch,
>> +					 font->height, font->width,
>> +					 fg_color, bg_color);
>> +			iosys_map_incr(&dst, font->width * px_width);
>> +		}
>> +	}
>> +}
>> +
>> +/*
>> + * Draw the panic message at the center of the screen
>> + */
>> +static void draw_panic_static(struct drm_scanout_buffer *sb)
>> +{
>> +	size_t msg_lines = ARRAY_SIZE(panic_msg);
>> +	size_t logo_lines = ARRAY_SIZE(logo);
>> +	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
>> +	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
>> +	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>> +	struct drm_rect r_logo, r_msg;
>> +
>> +	if (!font)
>> +		return;
>> +
>> +	r_logo = DRM_RECT_INIT(0, 0,
>> +			       get_max_line_len(logo, logo_lines) * font->width,
>> +			       logo_lines * font->height);
>> +	r_msg = DRM_RECT_INIT(0, 0,
>> +			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
>> +			      min(msg_lines * font->height, sb->height));
>> +
>> +	/* Center the panic message */
>> +	drm_rect_translate(&r_msg, (sb->width - r_msg.x2) / 2, (sb->height - r_msg.y2) / 2);
>> +
>> +	/* Fill with the background color, and draw text on top */
>> +	drm_panic_fill32(&sb->map[0], sb->pitch[0], sb->height, sb->width, bg_color);
>> +
>> +	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
>> +	     drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
>> +		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color, bg_color);
>> +	}
>> +	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color, bg_color);
>> +}
>> +
>> +/*
>> + * drm_panic_is_format_supported()
>> + * @format: a fourcc color code
>> + * Returns: true if supported, false otherwise.
>> + *
>> + * Check if drm_panic will be able to use this color format.
>> + */
>> +static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>> +{
>> +	if (format->num_planes != 1)
>> +		return false;
>> +	return format->format == DRM_FORMAT_XRGB8888;
>> +}
>> +
>> +static void draw_panic_plane(struct drm_plane *plane)
>> +{
>> +	struct drm_scanout_buffer sb;
>> +	int ret;
>> +	unsigned long flags;
>> +
>> +	if (!drm_panic_trylock(plane->dev, flags))
>> +		return;
>> +
>> +	ret = plane->helper_private->get_scanout_buffer(plane, &sb);
>> +
>> +	if (!ret && drm_panic_is_format_supported(sb.format)) {
>> +		draw_panic_static(&sb);
>> +		if (plane->helper_private->panic_flush)
>> +			plane->helper_private->panic_flush(plane);
>> +	}
>> +	drm_panic_unlock(plane->dev, flags);
>> +}
>> +
>> +static struct drm_plane *to_drm_plane(struct kmsg_dumper *kd)
>> +{
>> +	return container_of(kd, struct drm_plane, kmsg_panic);
>> +}
>> +
>> +static void drm_panic(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)
>> +{
>> +	struct drm_plane *plane = to_drm_plane(dumper);
>> +
>> +	if (reason == KMSG_DUMP_PANIC)
>> +		draw_panic_plane(plane);
>> +}
>> +
>> +/**
>> + * drm_panic_register() - Initialize DRM panic for a device
>> + * @dev: the drm device on which the panic screen will be displayed.
>> + */
>> +void drm_panic_register(struct drm_device *dev)
>> +{
>> +	struct drm_plane *plane;
>> +	int registered_plane = 0;
>> +
>> +	if (!dev->mode_config.num_total_plane)
>> +		return;
>> +
>> +	drm_for_each_plane(plane, dev) {
>> +		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
>> +			continue;
>> +		plane->kmsg_panic.dump = drm_panic;
>> +		plane->kmsg_panic.max_reason = KMSG_DUMP_PANIC;
>> +		if (kmsg_dump_register(&plane->kmsg_panic))
>> +			drm_warn(dev, "Failed to register panic handler\n");
>> +		else
>> +			registered_plane++;
>> +	}
>> +	if (registered_plane)
>> +		drm_info(dev, "Registered %d planes with drm panic\n", registered_plane);
>> +}
>> +EXPORT_SYMBOL(drm_panic_register);
>> +
>> +/**
>> + * drm_panic_unregister()
>> + * @dev: the drm device previously registered.
>> + */
>> +void drm_panic_unregister(struct drm_device *dev)
>> +{
>> +	struct drm_plane *plane;
>> +
>> +	if (!dev->mode_config.num_total_plane)
>> +		return;
>> +
>> +	drm_for_each_plane(plane, dev) {
>> +		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
>> +			continue;
>> +		kmsg_dump_unregister(&plane->kmsg_panic);
>> +	}
>> +}
>> +EXPORT_SYMBOL(drm_panic_unregister);
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
>> index 9ed42469540e..5470ba1ced00 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -48,6 +48,7 @@
>>    * To make this clear all the helper vtables are pulled together in this location here.
>>    */
>>   
>> +struct drm_scanout_buffer;
>>   struct drm_writeback_connector;
>>   struct drm_writeback_job;
>>   
>> @@ -1443,6 +1444,42 @@ struct drm_plane_helper_funcs {
>>   	 */
>>   	void (*atomic_async_update)(struct drm_plane *plane,
>>   				    struct drm_atomic_state *state);
>> +
>> +	/**
>> +	 * @get_scanout_buffer:
>> +	 *
>> +	 * Get the current scanout buffer, to display a message with drm_panic.
>> +	 * The driver should do the minimum changes to provide a linear buffer,
>> +	 * that can be used to display the panic screen.
> 
> I'd change this to note that currently only linear buffers are supported,
> and supporting tiled formats or other more special formats is a todo item
> when we get around to adding support for that.

Yes, I agree, we want to support non-linear format in the future.
> 
>> +	 * The device dev->mode_config.panic_lock is taken before calling this
>> +	 * function, so you can safely access the plane->state
> 		&drm_mode_config.panic_lock and &drm_plane.state for nice
> 		links.
> 
>> +	 * It is called from a panic callback, and must follow its restrictions.
>> +	 * (no locks, no memory allocation, no sleep, no thread/workqueue, ...)
> 
> Maybe instead of just "it's restrictions" add "Please look the
> documentation at drm_panic_trylock() for an in-depth discussions of what's
> safe and what is not allowed."Done

> 
>> +	 * It's a best effort mode, so it's expected that in some complex cases
>> +	 * the panic screen won't be displayed.
>> +	 * The returned scanout_buffer->map must be valid if no error code is
> 
> 		    	&drm_scanout_buffer.map so it's a nice link
> 			please.
> 
Sure, I fixed a bunch of links in this documentation.

>> +	 * returned.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * Zero on success, negative errno on failure.
>> +	 */
>> +	int (*get_scanout_buffer)(struct drm_plane *plane,
>> +				  struct drm_scanout_buffer *sb);
>> +
>> +	/**
>> +	 * @panic_flush:
>> +	 *
>> +	 * It is used by drm_panic, and is called after the panic screen is
>> +	 * drawn to the scanout buffer. In this function, the driver
>> +	 * can send additional commands to the hardware, to make the scanout
>> +	 * buffer visible.
>> +	 * The device dev->mode_config.panic_lock is taken before calling this
>> +	 * function, so you can safely access the plane->state
>> +	 * It is called from a panic callback, and must follow its restrictions.
>> +	 * (no locks, no memory allocation, no sleep, no thread/workqueue, ...)
> 
> I'd add here that this is only called when @get_scanout_buffer has
> returned successfully, and it's all done while holding
> &drm_mode_config.panic_lock for the entire sequence.

Done too.
>> +	 */
>> +	void (*panic_flush)(struct drm_plane *plane);
>>   };
>>   
>>   /**
>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>> index 68f57710d2d1..2a2346cd0040 100644
>> --- a/include/drm/drm_panic.h
>> +++ b/include/drm/drm_panic.h
>> @@ -2,11 +2,56 @@
>>   #ifndef __DRM_PANIC_H__
>>   #define __DRM_PANIC_H__
>>   
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/iosys-map.h>
>> +
>>   #include <drm/drm_device.h>
>> +#include <drm/drm_fourcc.h>
>>   /*
>>    * Copyright (c) 2024 Intel
>>    */
>>   
>> +/**
>> + * struct drm_scanout_buffer - DRM scanout buffer
>> + *
>> + * This structure holds the information necessary for drm_panic to draw the
>> + * panic screen, and display it.
>> + */
>> +struct drm_scanout_buffer {
>> +	/**
>> +	 * @format:
>> +	 *
>> +	 * drm format of the scanout buffer.
>> +	 */
>> +	const struct drm_format_info *format;
>> +
>> +	/**
>> +	 * @map:
>> +	 *
>> +	 * Virtual address of the scanout buffer, either in memory or iomem.
>> +	 * The scanout buffer should be in linear format, and can be directly
>> +	 * sent to the display hardware. Tearing is not an issue for the panic
>> +	 * screen.
>> +	 */
>> +	struct iosys_map map[DRM_FORMAT_MAX_PLANES];
>> +
>> +	/**
>> +	 * @width: Width of the scanout buffer, in pixels.
>> +	 */
>> +	unsigned int width;
>> +
>> +	/**
>> +	 * @height: Height of the scanout buffer, in pixels.
>> +	 */
>> +	unsigned int height;
>> +
>> +	/**
>> +	 * @pitch: Length in bytes between the start of two consecutive lines.
>> +	 */
>> +	unsigned int pitch[DRM_FORMAT_MAX_PLANES];
>> +};
>> +
>>   /**
>>    * drm_panic_trylock - try to enter the panic printing critical section
>>    * @dev: struct drm_device
>> @@ -97,4 +142,16 @@
>>   #define drm_panic_unlock(dev, flags) \
>>   	raw_spin_unlock_irqrestore(&dev->mode_config.panic_lock, flags)
>>   
>> +#ifdef CONFIG_DRM_PANIC
>> +
>> +void drm_panic_register(struct drm_device *dev);
>> +void drm_panic_unregister(struct drm_device *dev);
>> +
>> +#else
>> +
>> +static inline void drm_panic_register(struct drm_device *dev) {}
>> +static inline void drm_panic_unregister(struct drm_device *dev) {}
>> +
>> +#endif
>> +
>>   #endif /* __DRM_PANIC_H__ */
>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>> index 641fe298052d..b9a2fc0a820d 100644
>> --- a/include/drm/drm_plane.h
>> +++ b/include/drm/drm_plane.h
>> @@ -25,6 +25,7 @@
>>   
>>   #include <linux/list.h>
>>   #include <linux/ctype.h>
>> +#include <linux/kmsg_dump.h>
>>   #include <drm/drm_mode_object.h>
>>   #include <drm/drm_color_mgmt.h>
>>   #include <drm/drm_rect.h>
>> @@ -779,6 +780,11 @@ struct drm_plane {
>>   	 * @hotspot_y_property: property to set mouse hotspot y offset.
>>   	 */
>>   	struct drm_property *hotspot_y_property;
>> +
>> +	/**
>> +	 * @kmsg_panic: Used to register a panic notifier for this plane
>> +	 */
>> +	struct kmsg_dumper kmsg_panic;
>>   };
>>   
>>   #define obj_to_plane(x) container_of(x, struct drm_plane, base)
>> -- 
>> 2.44.0
>>
> 

Best regards,

-- 

Jocelyn

