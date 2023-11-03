Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7497E050E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 15:55:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C2210E9FF;
	Fri,  3 Nov 2023 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31C910E478
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699023346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rgz5JkbibRVJ/2jxfqAY4ThriWGLhMaLpOmWznroEsY=;
 b=Yg7LM6icYXhmBgE0ZTBocaB2VbBKzYSe5gQHJtMrrKlxUo6oKYg/0/P/d2nqBfX+YnbzTr
 PWjcVEjPL24f2npZLuLG9zPOrdariVaMbjna8Bp+xa5jXI+YYu+ZMdQAjb7xIBeF/e64IN
 H8rm5NSE5HT0d9KRvo+Rtb0VMmpV33Q=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-394-gsM0XvwiPz-PTP-1UrThMQ-1; Fri,
 03 Nov 2023 10:55:44 -0400
X-MC-Unique: gsM0XvwiPz-PTP-1UrThMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E55D8280A9C4;
 Fri,  3 Nov 2023 14:55:43 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7BD1C060BA;
 Fri,  3 Nov 2023 14:55:41 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net, noralf@tronnes.org
Subject: [RFC][PATCH v5 0/6] drm/panic: Add a drm panic handler
Date: Fri,  3 Nov 2023 15:53:24 +0100
Message-ID: <20231103145526.628138-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: gpiccoli@igalia.com, Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This introduces a new drm panic handler, which displays a message when a panic occurs.
So when fbcon is disabled, you can still see a kernel panic.

This is one of the missing feature, when disabling VT/fbcon in the kernel:
https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.

This is a proof of concept, and works with simpledrm and mgag200, using a new get_scanout_buffer() api

To test it, make sure you're using the simpledrm driver, and trigger a panic:
echo c > /proc/sysrq-trigger

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
 
 
With mgag200 support, I was able to test that the xrgb8888 to rgb565 conversion is working.

IMX/IPUV3 support is not complete, I wasn't able to have etnaviv working on my board.
But it shows that it can still work on ARM with DMA buffer in this case.

Best regards,


Jocelyn Falempe (6):
  drm/format-helper: Add drm_fb_blit_from_r1 and drm_fb_fill
  drm/panic: Add a drm panic handler
  drm/simpledrm: Add drm_panic support
  drm/mgag200: Add drm_panic support
  drm/ast: Add drm_panic support
  drm/imx: Add drm_panic support

 drivers/gpu/drm/Kconfig                  |  22 ++
 drivers/gpu/drm/Makefile                 |   1 +
 drivers/gpu/drm/ast/ast_drv.c            |   4 +-
 drivers/gpu/drm/ast/ast_drv.h            |   3 +
 drivers/gpu/drm/ast/ast_mode.c           |  26 ++
 drivers/gpu/drm/drm_drv.c                |   8 +
 drivers/gpu/drm/drm_format_helper.c      | 421 ++++++++++++++++++-----
 drivers/gpu/drm/drm_panic.c              | 368 ++++++++++++++++++++
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c |  30 ++
 drivers/gpu/drm/mgag200/mgag200_drv.c    |  25 ++
 drivers/gpu/drm/tiny/simpledrm.c         |  15 +
 include/drm/drm_drv.h                    |  21 ++
 include/drm/drm_format_helper.h          |   9 +
 include/drm/drm_panic.h                  |  96 ++++++
 14 files changed, 966 insertions(+), 83 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.41.0

