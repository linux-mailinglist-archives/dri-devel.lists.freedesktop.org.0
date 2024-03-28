Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094988FE9D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE061123F5;
	Thu, 28 Mar 2024 12:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xbbf3e6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007C21123F5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711627617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IZj83//kPwvI5Y1VPh3kXbqWFCREqpREj76Wt4/kCDU=;
 b=Xbbf3e6NHm8w8gaD7GbFiMziYRDUZX8UhxR/Xg23znfDBphvQiys1tyVXyqau7NC1vvLsS
 mRN8qb8zMAHusGVkoiAC4M6uRYkVLWJJCGuGuDK4zk9IakkU92KsLjoJTAmYAyDVQaOZMh
 e9WPbdniUohETeYNEJ2+wQVQL/FAxhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-9PLdBcy-MOGx9iQ6N1ekgQ-1; Thu, 28 Mar 2024 08:06:53 -0400
X-MC-Unique: 9PLdBcy-MOGx9iQ6N1ekgQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28637800266;
 Thu, 28 Mar 2024 12:06:53 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40B5A200A384;
 Thu, 28 Mar 2024 12:06:50 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org,
 sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v11 0/9] drm/panic: Add a drm panic handler
Date: Thu, 28 Mar 2024 13:03:42 +0100
Message-ID: <20240328120638.468738-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

This introduces a new drm panic handler, which displays a message when a panic occurs.
So when fbcon is disabled, you can still see a kernel panic.

This is one of the missing feature, when disabling VT/fbcon in the kernel:
https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.

It works with simpledrm, mgag200, ast, and imx.

To test it, make sure you're using one of the supported driver, and trigger a panic:
echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

There were not many comments on v10, so I think we're close to something that can be merged.
Even if this is not yet useful, it will allows to work on more driver support, and
better debug information.

v2:
 * Use get_scanout_buffer() instead of the drm client API. (Thomas Zimmermann)
 * Add the panic reason to the panic message (Nerdopolis)
 * Add an exclamation mark (Nerdopolis)
 
v3:
 * Rework the drawing functions, to write the pixels line by line and
 to use the drm conversion helper to support other formats.
 (Thomas Zimmermann)
 
v4:
 * Fully support all simpledrm formats using drm conversion helpers
 * Rename dpanic_* to drm_panic_*, and have more coherent function name.
   (Thomas Zimmermann)
 * Use drm_fb_r1_to_32bit for fonts (Thomas Zimmermann)
 * Remove the default y to DRM_PANIC config option (Thomas Zimmermann)
 * Add foreground/background color config option
 * Fix the bottom lines not painted if the framebuffer height
   is not a multiple of the font height.
 * Automatically register the driver to drm_panic, if the function
   get_scanout_buffer() exists. (Thomas Zimmermann)
 * Add mgag200 support.
 
v5:
 * Change the drawing API, use drm_fb_blit_from_r1() to draw the font.
   (Thomas Zimmermann)
 * Also add drm_fb_fill() to fill area with background color.
 * Add draw_pixel_xy() API for drivers that can't provide a linear buffer.
 * Add a flush() callback for drivers that needs to synchronize the buffer.
 * Add a void *private field, so drivers can pass private data to
   draw_pixel_xy() and flush(). 
 * Add ast support.
 * Add experimental imx/ipuv3 support, to test on an ARM hw. (Maxime Ripard)

v6:
 * Fix sparse and __le32 warnings
 * Drop the IMX/IPUV3 experiment, it was just to show that it works also on
   ARM devices.

v7:
 * Add a check to see if the 4cc format is supported by drm_panic.
 * Add a drm/plane helper to loop over all visible primary buffer,
   simplifying the get_scanout_buffer implementations
 * Add a generic implementation for drivers that uses drm_fb_dma. (Maxime Ripard)
 * Add back the IMX/IPUV3 support, and use the generic implementation. (Maxime Ripard)

v8:
 * Directly register each plane to the panic notifier (Sima)
 * Replace get_scanout_buffer() with set_scanout_buffer() to simplify
   the locking. (Thomas Zimmermann)
 * Add a debugfs entry, to trigger the drm_panic without a real panic (Sima)
 * Fix the drm_panic Documentation, and include it in drm-kms.rst

v9:
 * Revert to using get_scanout_buffer() (Sima)
 * Move get_scanout_buffer() and panic_flush() to the plane helper
   functions (Thomas Zimmermann)
 * Register all planes with get_scanout_buffer() to the panic notifier
 * Use drm_panic_lock() to protect against race (Sima)
 * Create a debugfs file for each plane in the device's debugfs
   directory. This allows to test for each plane of each GPU
   independently.
v10:
 * Move blit and fill functions back in drm_panic (Thomas Zimmermann).
 * Simplify the text drawing functions.
 * Use kmsg_dumper instead of panic_notifier (Sima).
 * Use spinlock_irqsave/restore (John Ogness)

v11:
 * Use macro instead of inline functions for drm_panic_lock/unlock (John Ogness)


Best regards,

Daniel Vetter (1):
  drm/panic: Add drm panic locking

Jocelyn Falempe (8):
  drm/panic: Add a drm panic handler
  drm/panic: Add support for color format conversion
  drm/panic: Add debugfs entry to test without triggering panic.
  drm/fb_dma: Add generic get_scanout_buffer() for drm_panic
  drm/simpledrm: Add drm_panic support
  drm/mgag200: Add drm_panic support
  drm/imx: Add drm_panic support
  drm/ast: Add drm_panic support

 Documentation/gpu/drm-kms.rst            |  12 +
 drivers/gpu/drm/Kconfig                  |  32 ++
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/ast/ast_mode.c           |  18 +
 drivers/gpu/drm/drm_atomic_helper.c      |   4 +
 drivers/gpu/drm/drm_drv.c                |   5 +
 drivers/gpu/drm/drm_fb_dma_helper.c      |  47 ++
 drivers/gpu/drm/drm_panic.c              | 581 +++++++++++++++++++++++
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c  |  11 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |   7 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  18 +
 drivers/gpu/drm/tiny/simpledrm.c         |  16 +
 include/drm/drm_fb_dma_helper.h          |   4 +
 include/drm/drm_mode_config.h            |  10 +
 include/drm/drm_modeset_helper_vtables.h |  37 ++
 include/drm/drm_panic.h                  | 152 ++++++
 include/drm/drm_plane.h                  |   6 +
 17 files changed, 959 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: 6376eb8b911534735fec104c1a0d780e4cf3116a
-- 
2.44.0

