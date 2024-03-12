Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44828794F6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 14:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59B210E680;
	Tue, 12 Mar 2024 13:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="cWC7Fho/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E1B10EF6B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 13:19:05 +0000 (UTC)
Message-ID: <43a752f1-7ad5-49e0-b64b-66fdebbaa1ab@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710249543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWuysqdh6xQVvAU/J8TCCfwgkKsHZSINdORwJc3eljg=;
 b=cWC7Fho/jb8ZYzObNLXvo41PUN1cR2TKUmxz8YawqnQZiR++FYHBVirlwkZDmmGragLGCE
 O+7rpYaPXCd2yzV4oZUl7i2OFm3ngnXpA/MzH3vSbr5d0ab7G8JovUdYvIgDsBgrHTdYn3
 vWaL2mM7Saxh2N3i3mmU0u7BA6Zeock=
Date: Tue, 12 Mar 2024 21:18:54 +0800
MIME-Version: 1.0
Subject: Re: [v9,3/9] drm/panic: Add a drm panic handler
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-4-jfalempe@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240307091936.576689-4-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On 2024/3/7 17:14, Jocelyn Falempe wrote:
> This module displays a user friendly message when a kernel panic
> occurs. It currently doesn't contain any debug information,
> but that can be added later.
>
> v2
>   * Use get_scanout_buffer() instead of the drm client API.
>    (Thomas Zimmermann)
>   * Add the panic reason to the panic message (Nerdopolis)
>   * Add an exclamation mark (Nerdopolis)
>
> v3
>   * Rework the drawing functions, to write the pixels line by line and
>   to use the drm conversion helper to support other formats.
>   (Thomas Zimmermann)
>
> v4
>   * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
>   * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
>   * Add foreground/background color config option
>   * Fix the bottom lines not painted if the framebuffer height
>     is not a multiple of the font height.
>   * Automatically register the device to drm_panic, if the function
>     get_scanout_buffer exists. (Thomas Zimmermann)
>
> v5
>   * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
>   * Also add drm_fb_fill() to fill area with background color.
>   * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
>   * Add a flush() callback for drivers that needs to synchronize the buffer.
>   * Add a void *private field, so drivers can pass private data to
>     draw_pixel_xy() and flush().
>
> v6
>   * Fix sparse warning for panic_msg and logo.
>
> v7
>   * Add select DRM_KMS_HELPER for the color conversion functions.
>
> v8
>   * Register directly each plane to the panic notifier (Sima)
>   * Add raw_spinlock to properly handle concurrency (Sima)
>   * Register plane instead of device, to avoid looping through plane
>     list, and simplify code.
>   * Replace get_scanout_buffer() logic with drm_panic_set_buffer()
>    (Thomas Zimmermann)
>   * Removed the draw_pixel_xy() API, will see later if it can be added back.
>
> v9
>   * Revert to using get_scanout_buffer() (Sima)
>   * Move get_scanout_buffer() and panic_flush() to the plane helper
>     functions (Thomas Zimmermann)
>   * Register all planes with get_scanout_buffer() to the panic notifier
>   * Use drm_panic_lock() to protect against race (Sima)
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   Documentation/gpu/drm-kms.rst            |  12 +
>   drivers/gpu/drm/Kconfig                  |  23 ++
>   drivers/gpu/drm/Makefile                 |   1 +
>   drivers/gpu/drm/drm_drv.c                |   4 +
>   drivers/gpu/drm/drm_panic.c              | 322 +++++++++++++++++++++++
>   drivers/gpu/drm/drm_plane.c              |   1 +
>   include/drm/drm_modeset_helper_vtables.h |  37 +++
>   include/drm/drm_panic.h                  |  52 ++++
>   include/drm/drm_plane.h                  |   5 +
>   9 files changed, 457 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_panic.c


While applying you patch, there is new blank line at EOF reported, see below.
This is not an issue, but I want to report this to you.


git am ../drm-panic-Add-a-drm-panic-handler.mbox
Applying: drm/panic: Add drm panic locking
Applying: drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
Applying: drm/panic: Add a drm panic handler
.git/rebase-apply/patch:439: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Applying: drm/panic: Add debugfs entry to test without triggering panic.
Applying: drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
Applying: drm/simpledrm: Add drm_panic support
Applying: drm/mgag200: Add drm_panic support
Applying: drm/imx: Add drm_panic support
Applying: drm/ast: Add drm_panic support

