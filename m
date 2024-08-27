Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3056961209
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 17:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F1510E350;
	Tue, 27 Aug 2024 15:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="iUY18HRY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6EA10E351
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1724772359;
 bh=yU1HRW3itAcyR9oaVPrkFjRYW6YZAfrAKd8xjgvUGtk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=iUY18HRYTEem0/qjmhokwz2FVxdlGRX4smmQMntU+vzzcP5p1PhlqfanMz0zdFngm
 GRCY/Wq6TDzcPI420yStpLPZGadcmeEjWL9DMMbUbQ02Kq2chKgYQpKEkflbnPr6vJ
 PROZx+XDTdMjaaXH6wa5FrXUhpH7AOR5XTGKsK4Q=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 27 Aug 2024 17:25:14 +0200
Subject: [PATCH 3/5] fbdev: Introduce devm_register_framebuffer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
In-Reply-To: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
To: Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>, 
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724772358; l=2207;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=yU1HRW3itAcyR9oaVPrkFjRYW6YZAfrAKd8xjgvUGtk=;
 b=bu4ONSTKd3WZjVd+jzRq5fuyqvqHuGJ/m8lrieSml0bQiOp9hlbHZIyqEkp+oq6l/xlFSO579
 jXLouV3SJFODtjYY/3KU23UVYxNlKmhAAU6Sugwp1NnEutR8EKtmroX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

Introduce a device-managed variant of register_framebuffer() which
automatically unregisters the framebuffer on device destruction.
This can simplify the error handling and resource management in drivers.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/video/fbdev/core/fbmem.c | 24 ++++++++++++++++++++++++
 include/linux/fb.h               |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 4c4ad0a86a50..d17a2daa2483 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -544,6 +544,30 @@ unregister_framebuffer(struct fb_info *fb_info)
 }
 EXPORT_SYMBOL(unregister_framebuffer);
 
+static void devm_unregister_framebuffer(void *data)
+{
+	struct fb_info *info = data;
+
+	unregister_framebuffer(info);
+}
+
+/**
+ *	devm_register_framebuffer - resource-managed frame buffer device registration
+ *	@dev: device the framebuffer belongs to
+ *	@fb_info: frame buffer info structure
+ *
+ *	Registers a frame buffer device @fb_info to device @dev.
+ *
+ *	Returns negative errno on error, or zero for success.
+ *
+ */
+int
+devm_register_framebuffer(struct device *dev, struct fb_info *fb_info)
+{
+	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb_info);
+}
+EXPORT_SYMBOL(devm_register_framebuffer);
+
 /**
  *	fb_set_suspend - low level driver signals suspend
  *	@info: framebuffer affected
diff --git a/include/linux/fb.h b/include/linux/fb.h
index db7d97b10964..abf6643ebcaf 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -601,6 +601,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 /* fbmem.c */
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
+extern int devm_register_framebuffer(struct device *dev, struct fb_info *fb_info);
 extern char* fb_get_buffer_offset(struct fb_info *info, struct fb_pixmap *buf, u32 size);
 extern void fb_pad_unaligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 idx,
 				u32 height, u32 shift_high, u32 shift_low, u32 mod);

-- 
2.46.0

