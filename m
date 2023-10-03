Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61CC7B6B63
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 16:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CCF10E00A;
	Tue,  3 Oct 2023 14:25:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC1B10E2CC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696343125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/S03oaW+e0aHVsLBCQIEaytB9y/7cdgwrjvSaDPFiKQ=;
 b=XrbXNLpT3elXWtkxkS/ejI+/fSWfTc+ZCHM9TwFCPITSMLKoxDyRL2EJGAo92gc7AGcIoE
 wiXLyDlbmlMbukrpxfiWrvjnjGtzQBiXAyNBKgDAMxpOlpYSMUSKxsrs/dsNUSlc/8uBZ5
 yKl8K6DkvAeKMRpMLpwsxWDqTHzZbi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-tuIkHp_5MrybGkabFX_zLw-1; Tue, 03 Oct 2023 10:25:21 -0400
X-MC-Unique: tuIkHp_5MrybGkabFX_zLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C748893C3;
 Tue,  3 Oct 2023 14:25:21 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C3C22156701;
 Tue,  3 Oct 2023 14:25:18 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 javierm@redhat.com, bluescreen_avenger@verizon.net
Subject: [RFC][PATCH v4 0/4] drm/panic: Add a drm panic handler
Date: Tue,  3 Oct 2023 16:22:43 +0200
Message-ID: <20231003142508.190246-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 
With mgag200 support, I was able to test that the xrgb8888 to rgb565 conversion is working.

A few more though:
 1) what about gpu with multiple monitor connected ?
maybe get_scanout_buffer() could return a list of scanout buffers ?
 2) I think for some GPU drivers, there might need a flush_scanout_buffer() function, that should be called after the scanout buffer has been filled ?


Best regards,


Jocelyn Falempe (4):
  drm/format-helper: Export line conversion helper for drm_panic
  drm/panic: Add a drm panic handler
  drm/simpledrm: Add drm_panic support
  drm/mgag200: Add drm_panic support

 drivers/gpu/drm/Kconfig               |  22 ++
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/drm_drv.c             |   8 +
 drivers/gpu/drm/drm_format_helper.c   |  88 +++++-
 drivers/gpu/drm/drm_panic.c           | 413 ++++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c |  24 ++
 drivers/gpu/drm/tiny/simpledrm.c      |  15 +
 include/drm/drm_drv.h                 |  14 +
 include/drm/drm_format_helper.h       |   9 +
 include/drm/drm_panic.h               |  41 +++
 10 files changed, 627 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_panic.c
 create mode 100644 include/drm/drm_panic.h


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
2.41.0

