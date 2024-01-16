Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313D82ED31
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 11:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE1D10E47E;
	Tue, 16 Jan 2024 10:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790610E32F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 10:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705402492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d11WXy83QT0RS6jGfuxBoN/OoXu3tfqMYJXhJ7jNoIw=;
 b=Yha9RdR6ItXgfYP2OddcX1BrW0+vswc4KvcVUCtHk4rFv709RdK1I/sf++yotis6oViVls
 k5cAiJ3+17TEgljpN4F28maElzumoZsrH9fqsfqXS1DUaPMhbwTbipJt5dCTMl+pSQlPyD
 oE32+PTb9D1lBFeOrgCihE+EhxahLF4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-MdMs-wyjPMK-Eg_U0rkuXA-1; Tue, 16 Jan 2024 05:54:45 -0500
X-MC-Unique: MdMs-wyjPMK-Eg_U0rkuXA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-40e4576b7e6so67547265e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 02:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705402484; x=1706007284;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d11WXy83QT0RS6jGfuxBoN/OoXu3tfqMYJXhJ7jNoIw=;
 b=Hw1OTSuLoqevbWcl+jwY/TGnq+Yw1PulFtohZMKCM+HkFDIemZjYQ96fr9L7AY86Nc
 zdxcLx0/ESlVv/M8KU8iJndgVZyWHqiYMgSSKGyHGmYFxzOoy+buZ0V6wMVR2sQg2j+p
 YiXPJ0dGQUH6TGKYZ49B8VLHX1GGK/h1OWOHMliHdFW7EOnWeVrFo9YtNI5xDr2pT3L3
 qi7uG8x8vaOBPi479zVR16FSfIJjIadnYl+aRJnJ9Q01fvEezVSPT0mtvX/2Ct4J4gFc
 aLyz+8GbOJ9sdvbmhSXF2zmHWbmg55qhEzrlEfv3Y6EXY9sDNPTlEtVZ9WFY3W42WZW9
 IEfw==
X-Gm-Message-State: AOJu0Yw3AF+F6yT6sdF316Cnsswpetjz7nooe1lkK0jvuHdCk4pxj7Ob
 PKUeim7ugtNxzRBW3ML3mkzc9P3hGAdCXZkUB4/XBFenbwuL0ZaodZv0F3+98IOHHKuw7EU0FtF
 UAdYJiVbyFoHPTfeGA4Qu4VkhF7muVFD1srDd
X-Received: by 2002:a05:600c:4e8a:b0:40d:4502:741c with SMTP id
 f10-20020a05600c4e8a00b0040d4502741cmr2703748wmq.125.1705402484300; 
 Tue, 16 Jan 2024 02:54:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXDxjhz1zZBSoRl6CsH6z0bbRz+TRvDi5EUQXgtvaE4Dh0andrhImr9q8R0/6BBaccxKqH8w==
X-Received: by 2002:a05:600c:4e8a:b0:40d:4502:741c with SMTP id
 f10-20020a05600c4e8a00b0040d4502741cmr2703738wmq.125.1705402483783; 
 Tue, 16 Jan 2024 02:54:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a05600c4f0d00b0040e85f86515sm1049542wmq.29.2024.01.16.02.54.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 02:54:43 -0800 (PST)
Message-ID: <31d0f162-421e-4b42-8b3f-bc3e6c852eb0@redhat.com>
Date: Tue, 16 Jan 2024 11:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
To: Daniel Vetter <daniel@ffwll.ch>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
 <ZaE_TPjzOeoMBM4f@phenom.ffwll.local>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ZaE_TPjzOeoMBM4f@phenom.ffwll.local>
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



On 12/01/2024 14:31, Daniel Vetter wrote:
> On Thu, Jan 04, 2024 at 05:00:46PM +0100, Jocelyn Falempe wrote:
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
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Bunch of comments on the glue, I didn't look at the drawing function in
> detail assuming that that's all working :-)

Thanks a lot for that detailed review.
> -Sima
> 
>> ---
>>   drivers/gpu/drm/Kconfig     |  23 +++
>>   drivers/gpu/drm/Makefile    |   1 +
>>   drivers/gpu/drm/drm_drv.c   |   8 +
>>   drivers/gpu/drm/drm_panic.c | 369 ++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_drv.h       |  21 ++
>>   include/drm/drm_panic.h     |  97 ++++++++++
>>   6 files changed, 519 insertions(+)
>>   create mode 100644 drivers/gpu/drm/drm_panic.c
>>   create mode 100644 include/drm/drm_panic.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 628f90ed8a9b..a8219c98c8d6 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -103,6 +103,29 @@ config DRM_KMS_HELPER
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
>> index 8ac6f4b9546e..fdf3d3fe0c78 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -60,6 +60,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += \
>>   	drm_privacy_screen.o \
>>   	drm_privacy_screen_x86.o
>>   drm-$(CONFIG_DRM_ACCEL) += ../../accel/drm_accel.o
>> +drm-$(CONFIG_DRM_PANIC) += drm_panic.o
>>   obj-$(CONFIG_DRM)	+= drm.o
>>   
>>   obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 243cacb3575c..998942e6d687 100644
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
>> @@ -944,6 +945,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>>   			goto err_unload;
>>   	}
>>   
>> +	if (driver->get_scanout_buffer)
>> +		drm_panic_register(dev);
>> +
>>   	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
>>   		 driver->name, driver->major, driver->minor,
>>   		 driver->patchlevel, driver->date,
>> @@ -987,6 +991,8 @@ void drm_dev_unregister(struct drm_device *dev)
>>   {
>>   	dev->registered = false;
>>   
>> +	drm_panic_unregister(dev);
>> +
>>   	drm_client_dev_unregister(dev);
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_MODESET))
>> @@ -1066,6 +1072,7 @@ static void drm_core_exit(void)
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>>   	debugfs_remove(drm_debugfs_root);
>>   	drm_sysfs_destroy();
>> +	drm_panic_exit();
>>   	idr_destroy(&drm_minors_idr);
>>   	drm_connector_ida_destroy();
>>   }
>> @@ -1077,6 +1084,7 @@ static int __init drm_core_init(void)
>>   	drm_connector_ida_init();
>>   	idr_init(&drm_minors_idr);
>>   	drm_memcpy_init_early();
>> +	drm_panic_init();
>>   
>>   	ret = drm_sysfs_init();
>>   	if (ret < 0) {
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> new file mode 100644
>> index 000000000000..362a696ec48a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -0,0 +1,369 @@
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
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/panic_notifier.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_format_helper.h>
>> +#include <drm/drm_fourcc.h>
>> +#include <drm/drm_panic.h>
>> +#include <drm/drm_print.h>
>> +
>> +
>> +MODULE_AUTHOR("Jocelyn Falempe");
>> +MODULE_DESCRIPTION("DRM panic handler");
>> +MODULE_LICENSE("GPL");
>> +
>> +/**
>> + * DOC: DRM Panic
> 
> You need to tie these nice kerneldocs into the overall documentation tree,
> or they're not getting built. Please then also check that all the links
> and formatting works correctly.

oh yes, I need to add it to the Documentation/drm/xx.rst.
I'm not sure where drm panic fits there.
If I move get_scanout_buffer() pointer to the drm_mode_config struct, 
adding drm_panic docs to drm-kms.rst makes sense ?

> 
>> + *
>> + * This module displays a user friendly message on screen when a kernel panic
>> + * occurs. This is conflicting with fbcon, so you can only enable it when fbcon
>> + * is disabled.
>> + * It's intended for end-user, so have minimal technical/debug information.
>> + */
>> +
>> +/*
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
>> +/*
>> + * List of active drm devices that can render a panic
>> + */
>> +struct drm_panic_device {
>> +	struct list_head head;
>> +	struct drm_device *dev;
>> +};
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
>> +	PANIC_LINE(""),
>> +	PANIC_LINE(""), /* overwritten with panic reason */
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
>> +static LIST_HEAD(drm_panic_devices);
>> +static DEFINE_MUTEX(drm_panic_lock);
>> +
>> +static void draw_empty_line_map(struct drm_scanout_buffer *sb, size_t top, size_t height, u32 color)
>> +{
>> +	struct iosys_map dst = sb->map;
>> +
>> +	iosys_map_incr(&dst, top * sb->pitch);
>> +	drm_fb_fill(&dst, sb->pitch, height, sb->width, color, sb->format->cpp[0]);
>> +}
>> +
>> +static void draw_txt_line_map(const struct drm_panic_line *msg, size_t left, size_t top,
>> +			      struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color,
>> +			      const struct font_desc *font)
>> +{
>> +	size_t i;
>> +	const u8 *src;
>> +	size_t src_stride = DIV_ROUND_UP(font->width, 8);
>> +	struct iosys_map dst = sb->map;
>> +	size_t end_text;
>> +	unsigned int px_width = sb->format->cpp[0];
>> +
>> +	iosys_map_incr(&dst, top * sb->pitch);
>> +	drm_fb_fill(&dst, sb->pitch, font->height, left, bg_color, px_width);
>> +	iosys_map_incr(&dst, left * px_width);
>> +	for (i = 0; i < msg->len; i++) {
>> +		src = font->data + (msg->txt[i] * font->height) * src_stride;
>> +		drm_fb_blit_from_r1(&dst, sb->pitch, src, src_stride, font->height, font->width,
>> +				    fg_color, bg_color, px_width);
>> +		iosys_map_incr(&dst, font->width * px_width);
>> +	}
>> +	end_text = (msg->len * font->width) + left;
>> +	if (sb->width > end_text)
>> +		drm_fb_fill(&dst, sb->pitch, font->height, sb->width - end_text,
>> +			    bg_color, px_width);
>> +}
>> +
>> +static void draw_empty_line_px(struct drm_scanout_buffer *sb, size_t top, size_t height, u32 color)
>> +{
>> +	unsigned int x, y;
>> +
>> +	for (y = 0; y < height; y++)
>> +		for (x = 0; x < sb->width; x++)
>> +			sb->draw_pixel_xy(x, y + top, color, sb->private);
>> +}
>> +
>> +static void draw_txt_line_px(const struct drm_panic_line *msg, size_t left, size_t top,
>> +			     struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color,
>> +			     const struct font_desc *font)
>> +{
>> +	unsigned int x, y, i;
>> +	const u8 *src;
>> +	u32 color;
>> +	size_t src_stride = DIV_ROUND_UP(font->width, 8);
>> +	size_t end_text = msg->len * font->width + left;
>> +	size_t right = sb->width > end_text ? sb->width - end_text : 0;
>> +
>> +	for (y = 0; y < font->height; y++) {
>> +		for (x = 0; x < left; x++)
>> +			sb->draw_pixel_xy(x, y + top, bg_color, sb->private);
>> +
>> +		for (i = 0; i < msg->len; i++) {
>> +			src = font->data + (msg->txt[i] * font->height + y) * src_stride;
>> +			for (x = 0; x < font->width; x++) {
>> +				color = (src[x / 8] & (0x80 >> (x % 8))) ? fg_color : bg_color;
>> +				sb->draw_pixel_xy(x + left + font->width * i, y + top, color,
>> +						  sb->private);
>> +			}
>> +		}
>> +
>> +		for (x = 0; x < right; x++)
>> +			sb->draw_pixel_xy(x + end_text, y + top, bg_color, sb->private);
>> +	}
>> +}
>> +
>> +static void draw_empty_line(struct drm_scanout_buffer *sb, size_t top, size_t height, u32 color)
>> +{
>> +	if (sb->draw_pixel_xy)
>> +		draw_empty_line_px(sb, top, height, color);
>> +	else
>> +		draw_empty_line_map(sb, top, height, color);
>> +}
>> +
>> +static void draw_txt_line(const struct drm_panic_line *msg, size_t left, size_t top,
>> +			  struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color,
>> +			  const struct font_desc *font)
>> +{
>> +	if (sb->draw_pixel_xy)
>> +		draw_txt_line_px(msg, left, top, sb, fg_color, bg_color, font);
>> +	else
>> +		draw_txt_line_map(msg, left, top, sb, fg_color, bg_color, font);
>> +}
>> +
>> +
>> +static size_t panic_msg_needed_lines(size_t chars_per_line)
>> +{
>> +	size_t msg_len = ARRAY_SIZE(panic_msg);
>> +	size_t lines = 0;
>> +	size_t i;
>> +
>> +	for (i = 0; i < msg_len; i++)
>> +		lines += panic_msg[i].len ? DIV_ROUND_UP(panic_msg[i].len, chars_per_line) : 1;
>> +	return lines;
>> +}
>> +
>> +static bool can_draw_logo(size_t chars_per_line, size_t lines, size_t msg_lines)
>> +{
>> +	size_t i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(logo); i++) {
>> +		if (logo[i].len > chars_per_line)
>> +			return false;
>> +	}
>> +	if (lines < msg_lines + ARRAY_SIZE(logo))
>> +		return false;
>> +	return true;
>> +}
>> +
>> +static size_t get_start_line(size_t lines, size_t msg_lines, bool draw_logo)
>> +{
>> +	size_t remaining;
>> +	size_t logo_len = ARRAY_SIZE(logo);
>> +
>> +	if (lines < msg_lines)
>> +		return 0;
>> +	remaining = lines - msg_lines;
>> +	if (draw_logo && remaining / 2 <= logo_len)
>> +		return logo_len + (remaining - logo_len) / 4;
>> +	return remaining / 2;
>> +}
>> +
>> +/*
>> + * Draw the panic message at the center of the screen
>> + */
>> +static void draw_panic_static(struct drm_scanout_buffer *sb, const char *msg)
>> +{
>> +	size_t lines, msg_lines, l, msg_start_line, remaining, msgi;
>> +	size_t chars_per_line;
>> +	bool draw_logo;
>> +	struct drm_panic_line panic_line;
>> +	size_t msg_len = ARRAY_SIZE(panic_msg);
>> +	size_t logo_len = ARRAY_SIZE(logo);
>> +	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
>> +	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
>> +	const struct font_desc *font = get_default_font(sb->width, sb->height, 0x8080, 0x8080);
>> +
>> +	if (!font)
>> +		return;
>> +
>> +	/* Set the panic reason */
>> +	panic_msg[msg_len - 1].len = strlen(msg);
>> +	panic_msg[msg_len - 1].txt = msg;
>> +
>> +	lines = sb->height / font->height;
>> +	chars_per_line = sb->width / font->width;
>> +
>> +	msg_lines = panic_msg_needed_lines(chars_per_line);
>> +	draw_logo = can_draw_logo(chars_per_line, lines, msg_lines);
>> +	msg_start_line = get_start_line(lines, msg_lines, draw_logo);
>> +
>> +	fg_color = drm_fb_convert_from_xrgb8888(fg_color, sb->format->format);
>> +	bg_color = drm_fb_convert_from_xrgb8888(bg_color, sb->format->format);
>> +
>> +	msgi = 0;
>> +	panic_line.len = 0;
>> +	for (l = 0; l < lines; l++) {
>> +		if (draw_logo && l < logo_len)
>> +			draw_txt_line(&logo[l], 0, l * font->height, sb, fg_color, bg_color, font);
>> +		else if (l >= msg_start_line && msgi < msg_len) {
>> +			if (!panic_line.len) {
>> +				panic_line.txt = panic_msg[msgi].txt;
>> +				panic_line.len = panic_msg[msgi].len;
>> +			}
>> +			if (!panic_line.len) {
>> +				draw_empty_line(sb, l * font->height, font->height, bg_color);
>> +				msgi++;
>> +			} else if (panic_line.len > chars_per_line) {
>> +				remaining = panic_line.len - chars_per_line;
>> +				panic_line.len = chars_per_line;
>> +				draw_txt_line(&panic_line, 0, l * font->height, sb, fg_color,
>> +					      bg_color, font);
>> +				panic_line.txt += chars_per_line;
>> +				panic_line.len = remaining;
>> +			} else {
>> +				draw_txt_line(&panic_line,
>> +					      font->width * (chars_per_line - panic_line.len) / 2,
>> +					      l * font->height, sb, fg_color, bg_color, font);
>> +				panic_line.len = 0;
>> +				msgi++;
>> +			}
>> +		} else {
>> +			draw_empty_line(sb, l * font->height, font->height, bg_color);
>> +		}
>> +	}
>> +	/* Fill the bottom of the screen, if sb->height is not a multiple of font->height */
>> +	if (sb->height % font->height)
>> +		draw_empty_line(sb, l * font->height, sb->height - l * font->height, bg_color);
>> +}
>> +
>> +static void draw_panic_device(struct drm_device *dev, const char *msg)
>> +{
>> +	struct drm_scanout_buffer sb = {0};
>> +
>> +	if (dev->driver->get_scanout_buffer(dev, &sb))
>> +		return;
>> +	draw_panic_static(&sb, msg);
>> +	if (sb.flush)
>> +		sb.flush(sb.private);
>> +}
>> +
>> +static int drm_panic(struct notifier_block *this, unsigned long event,
>> +		     void *ptr)
>> +{
>> +	struct drm_panic_device *drm_panic_device;
>> +
>> +	list_for_each_entry(drm_panic_device, &drm_panic_devices, head) {
>> +		draw_panic_device(drm_panic_device->dev, ptr);
> 
> The locking here is busted. Which is why the atomic notifier chain is
> special and uses atomic semantics - I would just avoid this issue and
> directly register each drm_panic_device instead of trying to maintain a
> drm-local list and getting the locking rules wrong.

It's a bit complex to get the drm_device pointer in the callback.
I think I can add a "struct notifier_block" in the struct 
drm_mode_config, and use the container_of macro, to retrieve it.
This also makes it easy to unregister.

> 
>> +	}
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block drm_panic_notifier = {
>> +	.notifier_call = drm_panic,
>> +};
>> +
>> +/**
>> + * drm_panic_register() - Initialize DRM panic for a device
>> + * @dev: the DRM device on which the panic screen will be displayed.
>> + */
>> +void drm_panic_register(struct drm_device *dev)
>> +{
>> +	struct drm_panic_device *new;
>> +
>> +	new = kzalloc(sizeof(*new), GFP_KERNEL);
>> +	if (!new)
>> +		return;
>> +
>> +	new->dev = dev;
>> +	mutex_lock(&drm_panic_lock);
>> +	list_add_tail(&new->head, &drm_panic_devices);
>> +	mutex_unlock(&drm_panic_lock);
>> +
>> +	drm_info(dev, "Registered with drm panic\n");
>> +}
>> +EXPORT_SYMBOL(drm_panic_register);
>> +
>> +/**
>> + * drm_panic_unregister()
>> + * @dev: the DRM device previously registered.
>> + */
>> +void drm_panic_unregister(struct drm_device *dev)
>> +{
>> +	struct drm_panic_device *drm_panic_device;
>> +	struct drm_panic_device *found = NULL;
>> +
>> +	mutex_lock(&drm_panic_lock);
>> +	list_for_each_entry(drm_panic_device, &drm_panic_devices, head) {
> 
> Can't we just store a pointer in drm_device (or embed the entire thing
> outright) instead of this dance?

If I store the struct notifier_block in the struct drm_mode_config,
then this dance is no more needed.

> 
>> +		if (drm_panic_device->dev == dev)
>> +			found = drm_panic_device;
>> +	}
>> +	if (found) {
>> +		list_del(&found->head);
>> +		kfree(found);
>> +		drm_info(dev, "Unregistered with drm panic\n");
>> +	}
>> +	mutex_unlock(&drm_panic_lock);
>> +}
>> +EXPORT_SYMBOL(drm_panic_unregister);
>> +
>> +/**
>> + * drm_panic_init() - Initialize drm-panic subsystem
>> + *
>> + * register the panic notifier
>> + */
>> +void drm_panic_init(void)
>> +{
>> +	atomic_notifier_chain_register(&panic_notifier_list,
>> +				       &drm_panic_notifier);
>> +}
>> +
>> +/**
>> + * drm_panic_exit() - Shutdown drm-panic subsystem
>> + */
>> +void drm_panic_exit(void)
>> +{
>> +	atomic_notifier_chain_unregister(&panic_notifier_list,
>> +					 &drm_panic_notifier);
>> +}
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 8878260d7529..99e5bcf13975 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -43,6 +43,7 @@ struct dma_buf_attachment;
>>   struct drm_display_mode;
>>   struct drm_mode_create_dumb;
>>   struct drm_printer;
>> +struct drm_scanout_buffer;
>>   struct sg_table;
>>   
>>   /**
>> @@ -401,6 +402,26 @@ struct drm_driver {
>>   	 */
>>   	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>   
>> +	/**
>> +	 * @get_scanout_buffer:
>> +	 *
>> +	 * Get the current scanout buffer, to display a panic message with drm_panic.
>> +	 * The driver should do the minimum changes to provide a linear buffer, that
>> +	 * can be used to display the panic screen.
>> +	 * It is called from a panic callback, and must follow its restrictions.
>> +	 * (no locks, no memory allocation, no sleep, no thread/workqueue, ...)
>> +	 * It's a best effort mode, so it's expected that in some complex cases the
>> +	 * panic screen won't be displayed.
> 
>> +	 * Some hardware cannot provide a linear buffer, so there is a draw_pixel_xy()
>> +	 * callback in the struct drm_scanout_buffer that can be used in this case.
> 
> I'd move this to the documentation of drm_scanout_buffer and just put a
> kernel-doc hyperlink in here referencing that for further information.

Agreed
> 
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * Zero on success, negative errno on failure.
>> +	 */
>> +	int (*get_scanout_buffer)(struct drm_device *dev,
>> +				  struct drm_scanout_buffer *sb);
> 
> Please put this hook into drm_mode_config_funcs and not into the overall
> drm_driver struct. At least for kms we're trying to keep a clean design
> (and I know that stuff like dumb buffers got misplaced, not a good reason
> to do it again ...).

sure, I'm moving it there.
> 
>> +
>>   	/** @major: driver major number */
>>   	int major;
>>   	/** @minor: driver minor number */
>> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
>> new file mode 100644
>> index 000000000000..bcf392b6fa1b
>> --- /dev/null
>> +++ b/include/drm/drm_panic.h
>> @@ -0,0 +1,97 @@
>> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
>> +#ifndef __DRM_PANIC_H__
>> +#define __DRM_PANIC_H__
>> +
>> +/*
>> + * Copyright (c) 2023 Red Hat.
>> + * Author: Jocelyn Falempe <jfalempe@redhat.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +#include <linux/iosys-map.h>
>> +
>> +struct drm_device;
>> +
>> +/**
>> + * struct drm_scanout_buffer - DRM scanout buffer
>> + *
>> + * This structure holds the information necessary for drm_panic to draw the
>> + * panic screen, and display it.
> 
>> + * If the driver can't provide a linear buffer, it must clear @map with
>> + * iosys_map_clear() and provide a draw_pixel_xy() function.
> 
> I think it's better to move this to the documentation of @map and
> @draw_pixel_xy.

ok, I will move it there.
> 
>> + */
>> +struct drm_scanout_buffer {
>> +	/**
>> +	 * @format:
>> +	 *
>> +	 * drm format of the scanout buffer.
>> +	 */
>> +	const struct drm_format_info *format;
>> +	/**
>> +	 * @map:
>> +	 *
>> +	 * Virtual address of the scanout buffer, either in memory or iomem.
>> +	 * The scanout buffer should be in linear format, and can be directly
> 
> The should here is confusing, because it's an either/or.
> 
> 
>> +	 * sent to the display hardware. Tearing is not an issue for the panic
>> +	 * screen.
>> +	 */
>> +	struct iosys_map map;
> 
> I think you're a bit unclear on whether you allow non-null @map for the
> case when @draw_pixel_xy is set. Current docs says it's either/or, but you
> don't have any checks for iosys_map_is_null(). I'd add something like
> 
> 	WARN_ON(sb->draw_pixel_xy && !iosys_map_is_null(sb->map));
> 
> right after the call to ->get_scanout_buffer to lock down this rule.

ok, yes, I can add that check to avoid misuse of the API.
> 
>> +	/**
>> +	 * @width: Width of the scanout buffer, in pixels.
>> +	 */
>> +	unsigned int width;
>> +	/**
>> +	 * @height: Height of the scanout buffer, in pixels.
>> +	 */
>> +	unsigned int height;
>> +	/**
>> +	 * @pitch: Length in bytes between the start of two consecutive lines.
>> +	 */
>> +	unsigned int pitch;
>> +	/**
>> +	 * @private:
>> +	 *
>> +	 * In case the driver can't provide a linear buffer, this is a pointer to
>> +	 * some private data, that will be passed when calling @draw_pixel_xy()
>> +	 * and @flush()
>> +	 */
>> +	void *private;
>> +	/**
>> +	 * @draw_pixel_xy:
>> +	 *
>> +	 * In case the driver can't provide a linear buffer, this is a function
>> +	 * that drm_panic will call for each pixel to draw.
>> +	 * Color will be converted to the format specified by @format.
>> +	 */
> 
>> +	void (*draw_pixel_xy)(unsigned int x, unsigned int y, u32 color, void *private);
>> +	/**
>> +	 * @flush:
>> +	 *
>> +	 * This function is called after the panic screen is drawn, either using
>> +	 * the iosys_map or the draw_pixel_xy path. In this function, the driver
>> +	 * can send additional commands to the hardware, to make the buffer
>> +	 * visible.
> 
> Uh how does flush work for the @map path? I'd just pass the overall
> drm_scanout_buffer struct to both of these hooks as the first parameter
> and let the driver figure out what it needs.

I can add the drm_scanout_buffer struct to both. There are probably some 
drivers that will need it.
I use the flush callback for the virtio-gpu support (which I didn't send 
yet), and didn't need the drm_scanout_buffer in this case, but there are 
probably other drivers that will need it.

> 
>> +	 */
>> +	void (*flush)(void *private);
>> +};
>> +
>> +#ifdef CONFIG_DRM_PANIC
>> +
>> +void drm_panic_init(void);
>> +void drm_panic_exit(void);
>> +
>> +void drm_panic_register(struct drm_device *dev);
>> +void drm_panic_unregister(struct drm_device *dev);
>> +
>> +#else
>> +
>> +static inline void drm_panic_init(void) {}
>> +static inline void drm_panic_exit(void) {}
>> +
>> +static inline void drm_panic_register(struct drm_device *dev) {}
>> +static inline void drm_panic_unregister(struct drm_device *dev) {}
>> +
>> +#endif
>> +
>> +#endif /* __DRM_PANIC_H__ */
>> -- 
>> 2.43.0
>>
> 


-- 

Jocelyn

