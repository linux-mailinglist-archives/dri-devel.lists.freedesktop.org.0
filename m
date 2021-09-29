Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23941CC67
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 21:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8166E1AA;
	Wed, 29 Sep 2021 19:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53F16E88A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 19:12:15 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id F14C120A37;
 Wed, 29 Sep 2021 21:12:13 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Cc: peter@stuge.se, =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 3/6] drm/format-helper: Add drm_fb_xrgb8888_to_rgb888()
Date: Wed, 29 Sep 2021 21:11:58 +0200
Message-Id: <20210929191201.34456-4-noralf@tronnes.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929191201.34456-1-noralf@tronnes.org>
References: <20210929191201.34456-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=NPX7BXyg c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=tPL1tCCEqSU9nWG0KxwA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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

Add XRGB8888 emulation support for devices that can only do RGB888.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_format_helper.c | 38 +++++++++++++++++++++++++++++
 include/drm/drm_format_helper.h     |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index dab4f382d469..69fde60e36b3 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -300,6 +300,44 @@ static void drm_fb_xrgb8888_to_rgb888_line(u8 *dbuf, u32 *sbuf,
 	}
 }
 
+/**
+ * drm_fb_xrgb8888_to_rgb888 - Convert XRGB8888 to RGB888 clip buffer
+ * @dst: RGB888 destination buffer
+ * @src: XRGB8888 source buffer
+ * @fb: DRM framebuffer
+ * @clip: Clip rectangle area to copy
+ *
+ * Drivers can use this function for RGB888 devices that don't natively
+ * support XRGB8888.
+ *
+ * This function does not apply clipping on dst, i.e. the destination
+ * is a small buffer containing the clip rect only.
+ */
+void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
+			       struct drm_rect *clip)
+{
+	size_t width = drm_rect_width(clip);
+	size_t src_len = width * sizeof(u32);
+	unsigned int y;
+	void *sbuf;
+
+	/* Use a buffer to speed up access on buffers with uncached read mapping (i.e. WC) */
+	sbuf = kmalloc(src_len, GFP_KERNEL);
+	if (!sbuf)
+		return;
+
+	src += clip_offset(clip, fb->pitches[0], sizeof(u32));
+	for (y = 0; y < drm_rect_height(clip); y++) {
+		memcpy(sbuf, src, src_len);
+		drm_fb_xrgb8888_to_rgb888_line(dst, sbuf, width);
+		src += fb->pitches[0];
+		dst += width * 3;
+	}
+
+	kfree(sbuf);
+}
+EXPORT_SYMBOL(drm_fb_xrgb8888_to_rgb888);
+
 /**
  * drm_fb_xrgb8888_to_rgb888_dstclip - Convert XRGB8888 to RGB888 clip buffer
  * @dst: RGB565 destination buffer (iomem)
diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
index d0809aff5cf8..e86925cf07b9 100644
--- a/include/drm/drm_format_helper.h
+++ b/include/drm/drm_format_helper.h
@@ -24,6 +24,8 @@ void drm_fb_xrgb8888_to_rgb565(void *dst, void *vaddr,
 void drm_fb_xrgb8888_to_rgb565_dstclip(void __iomem *dst, unsigned int dst_pitch,
 				       void *vaddr, struct drm_framebuffer *fb,
 				       struct drm_rect *clip, bool swab);
+void drm_fb_xrgb8888_to_rgb888(void *dst, void *src, struct drm_framebuffer *fb,
+			       struct drm_rect *clip);
 void drm_fb_xrgb8888_to_rgb888_dstclip(void __iomem *dst, unsigned int dst_pitch,
 				       void *vaddr, struct drm_framebuffer *fb,
 				       struct drm_rect *clip);
-- 
2.32.0

