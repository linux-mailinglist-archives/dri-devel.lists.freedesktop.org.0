Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38F2874A97
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 10:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCAB10F345;
	Thu,  7 Mar 2024 09:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GgA2CBGU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FDA810F33D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709803186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mxxIiOMCdPd980lED7zXhQSahvrBrtFsewy6Hl1VYXQ=;
 b=GgA2CBGULRp0tvpqKpvoP41rjCEly5kJ9jda+/U3zwcbWUumjNeSf+qrRfIXICO4m/ZCks
 HOqjQHbsjvAOd8SCqUAkOQjNMsChIu9TU05peAumcYh/hUnc5mgIpv9aqe1dw4D0IEtclZ
 0VDMv7c+eBeGPbMQmDOl8lk8iv5d/yY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-ue5mhnpUM7qFangAX2ofmg-1; Thu, 07 Mar 2024 04:19:43 -0500
X-MC-Unique: ue5mhnpUM7qFangAX2ofmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15800186E122;
 Thu,  7 Mar 2024 09:19:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A05F1121306;
 Thu,  7 Mar 2024 09:19:39 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com,
	Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v9 0/9] drm/panic: Add a drm panic handler
Date: Thu,  7 Mar 2024 10:14:42 +0100
Message-ID: <20240307091936.576689-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

This is a proof of concept, and works with simpledrm, mgag200, ast, and imx.

To test it, make sure you're using one of the supported driver, and trigger a panic:
echo c > /proc/sysrq-trigger

or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0


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

Daniel Vetter (1):
  drm/panic: Add drm panic locking

Jocelyn Falempe (8):
  drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
  drm/panic: Add a drm panic handler
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
 drivers/gpu/drm/drm_atomic_helper.c      |   3 +
 drivers/gpu/drm/drm_drv.c                |   5 +
 drivers/gpu/drm/drm_fb_dma_helper.c      |  47 +++
 drivers/gpu/drm/drm_format_helper.c      | 432 ++++++++++++++++++-----
 drivers/gpu/drm/drm_panic.c              | 360 +++++++++++++++++++
 drivers/gpu/drm/drm_plane.c              |   1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c  |  11 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h    |   7 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  18 +
 drivers/gpu/drm/tiny/simpledrm.c         |  16 +
 include/drm/drm_fb_dma_helper.h          |   4 +
 include/drm/drm_format_helper.h          |   9 +
 include/drm/drm_mode_config.h            |  10 +
 include/drm/drm_modeset_helper_vtables.h |  37 ++
 include/drm/drm_panic.h                  | 151 ++++++++
 include/drm/drm_plane.h                  |   5 +
 20 files changed, 1096 insertions(+), 83 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: f89632a9e5fa6c4787c14458cd42a9ef42025434
-- 
2.43.2

