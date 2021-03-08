Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17843330EB7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 13:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AA46E51D;
	Mon,  8 Mar 2021 12:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB026E866
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 12:55:26 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A9BDC3A6A4B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 12:34:47 +0000 (UTC)
X-Originating-IP: 86.247.11.12
Received: from haruko.lan (lfbn-idf2-1-654-12.w86-247.abo.wanadoo.fr
 [86.247.11.12]) (Authenticated sender: schroder@emersion.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B7DD5E0009;
 Mon,  8 Mar 2021 12:34:24 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/uapi: document kernel capabilities
Date: Mon,  8 Mar 2021 13:34:21 +0100
Message-Id: <20210308123421.747836-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document all of the DRM_CAP_* defines.

v2 (Pekka):
- Describe what the bit depth is
- Expand on preferred dumb buffer memory access patterns
- Explain what a PRIME buffer is
- Mention DRM_IOCTL_PRIME_FD_TO_HANDLE and DRM_IOCTL_PRIME_HANDLE_TO_FD
- Explicitly reference CLOCK_REALTIME and CLOCK_MONOTONIC
- Make it clear DRM_CAP_CRTC_IN_VBLANK_EVENT applies to both DRM_EVENT_VBLANK
  and DRM_EVENT_FLIP_COMPLETE

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm.h | 112 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 108 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 0827037c5484..79e9c9d5e7a9 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -625,30 +625,134 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * DRM_CAP_DUMB_BUFFER
+ *
+ * If set to 1, the driver supports creating dumb buffers via the
+ * &DRM_IOCTL_MODE_CREATE_DUMB ioctl.
+ */
 #define DRM_CAP_DUMB_BUFFER		0x1
+/**
+ * DRM_CAP_VBLANK_HIGH_CRTC
+ *
+ * If set to 1, the kernel supports specifying a CRTC index in the high bits of
+ * &drm_wait_vblank_request.type.
+ */
 #define DRM_CAP_VBLANK_HIGH_CRTC	0x2
+/**
+ * DRM_CAP_DUMB_PREFERRED_DEPTH
+ *
+ * The preferred bit depth for dumb buffers.
+ *
+ * The bit depth is the number of bits used to indicate the color of a single
+ * pixel excluding any padding. This is different from the number of bits per
+ * pixel. For instance, XRGB8888 has a bit depth of 24 but has 32 bits per
+ * pixel.
+ */
 #define DRM_CAP_DUMB_PREFERRED_DEPTH	0x3
+/**
+ * DRM_CAP_DUMB_PREFER_SHADOW
+ *
+ * If set to 1, the driver prefers userspace to render to a shadow buffer
+ * instead of directly rendering to a dumb buffer. For best speed, userspace
+ * should do streaming ordered memory copies into the dumb buffer and never
+ * read from it.
+ */
 #define DRM_CAP_DUMB_PREFER_SHADOW	0x4
+/**
+ * DRM_CAP_PRIME
+ *
+ * Bitfield of supported PRIME sharing capabilities. See &DRM_PRIME_CAP_IMPORT
+ * and &DRM_PRIME_CAP_EXPORT.
+ *
+ * PRIME buffers are exposed as dma-buf file descriptors. See
+ * Documentation/gpu/drm-mm.rst, section "PRIME Buffer Sharing".
+ */
 #define DRM_CAP_PRIME			0x5
+/**
+ * DRM_PRIME_CAP_IMPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports importing PRIME
+ * buffers via the &DRM_IOCTL_PRIME_FD_TO_HANDLE ioctl.
+ */
 #define  DRM_PRIME_CAP_IMPORT		0x1
+/**
+ * DRM_PRIME_CAP_EXPORT
+ *
+ * If this bit is set in &DRM_CAP_PRIME, the driver supports exporting PRIME
+ * buffers via the &DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl.
+ */
 #define  DRM_PRIME_CAP_EXPORT		0x2
+/**
+ * DRM_CAP_TIMESTAMP_MONOTONIC
+ *
+ * If set to 0, the kernel will report timestamps with ``CLOCK_REALTIME`` in
+ * struct drm_event_vblank. If set to 1, the kernel will report timestamps with
+ * ``CLOCK_MONOTONIC``. See ``clock_gettime(2)`` for the definition of these
+ * clocks.
+ */
 #define DRM_CAP_TIMESTAMP_MONOTONIC	0x6
+/**
+ * DRM_CAP_ASYNC_PAGE_FLIP
+ *
+ * If set to 1, the driver supports &DRM_MODE_PAGE_FLIP_ASYNC.
+ */
 #define DRM_CAP_ASYNC_PAGE_FLIP		0x7
-/*
- * The CURSOR_WIDTH and CURSOR_HEIGHT capabilities return a valid widthxheight
- * combination for the hardware cursor. The intention is that a hardware
- * agnostic userspace can query a cursor plane size to use.
+/**
+ * DRM_CAP_CURSOR_WIDTH
+ *
+ * The ``CURSOR_WIDTH`` and ``CURSOR_HEIGHT`` capabilities return a valid
+ * width x height combination for the hardware cursor. The intention is that a
+ * hardware agnostic userspace can query a cursor plane size to use.
  *
  * Note that the cross-driver contract is to merely return a valid size;
  * drivers are free to attach another meaning on top, eg. i915 returns the
  * maximum plane size.
  */
 #define DRM_CAP_CURSOR_WIDTH		0x8
+/**
+ * DRM_CAP_CURSOR_HEIGHT
+ *
+ * See &DRM_CAP_CURSOR_WIDTH.
+ */
 #define DRM_CAP_CURSOR_HEIGHT		0x9
+/**
+ * DRM_CAP_ADDFB2_MODIFIERS
+ *
+ * If set to 1, the driver supports supplying modifiers in the
+ * &DRM_IOCTL_MODE_ADDFB2 ioctl.
+ */
 #define DRM_CAP_ADDFB2_MODIFIERS	0x10
+/**
+ * DRM_CAP_PAGE_FLIP_TARGET
+ *
+ * If set to 1, the driver supports the &DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE and
+ * &DRM_MODE_PAGE_FLIP_TARGET_RELATIVE flags in
+ * &drm_mode_crtc_page_flip_target.flags for the &DRM_IOCTL_MODE_PAGE_FLIP
+ * ioctl.
+ */
 #define DRM_CAP_PAGE_FLIP_TARGET	0x11
+/**
+ * DRM_CAP_CRTC_IN_VBLANK_EVENT
+ *
+ * If set to 1, the kernel supports reporting the CRTC ID in
+ * &drm_event_vblank.crtc_id for the &DRM_EVENT_VBLANK and
+ * &DRM_EVENT_FLIP_COMPLETE events.
+ */
 #define DRM_CAP_CRTC_IN_VBLANK_EVENT	0x12
+/**
+ * DRM_CAP_SYNCOBJ
+ *
+ * If set to 1, the driver supports sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ		0x13
+/**
+ * DRM_CAP_SYNCOBJ_TIMELINE
+ *
+ * If set to 1, the driver supports timeline operations on sync objects. See
+ * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
+ */
 #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
 
 /* DRM_IOCTL_GET_CAP ioctl argument type */
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
