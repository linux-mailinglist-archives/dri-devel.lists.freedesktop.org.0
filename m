Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39847965D48
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 11:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC71510EA2B;
	Fri, 30 Aug 2024 09:46:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="Gv1wHL/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FE010EA1D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1725011169;
 bh=f2u18U78PGc6vCLjwSxdZlzpzyLhmRleTuFw0CDjKSo=;
 h=From:Date:Subject:To:Cc:From;
 b=Gv1wHL/DYorIvqIofEcjqy5UMbyvU+wFcvn0/aUdOjo1Oz0zVX4KaNsfKlAlEGpvv
 jPUneDRnpv3MvpCvBI+NFIhm1DfPkIGmgSoPnoWw/mJxKaj4uWIrnUDTZWdP7DAcv4
 dfXuGaimarSeCtc8IpvAcjEj3i/Vb1g6MHjneSHo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 30 Aug 2024 11:45:57 +0200
Subject: [PATCH] fbdev: Introduce devm_register_framebuffer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240830-fbdev-devm_register_framebuffer-v1-1-6d4186519c68@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANSU0WYC/x2NwQqDMBAFf0X2bCBRsdpfkSKJvrV7iJaNlYL47
 w0e5jCXmZMSVJDoWZykOCTJtmZxZUHT268LjMzZqbJVY7vaGg4zDpOJo2KRtENHVh8RvsxQ0zY
 P9JOzdeg95cpHwfK7D8Pruv4uF5RhcQAAAA==
To: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Bert Karwatzki <spasswolf@web.de>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 intel-gfx@lists.freedesktop.org, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
 "Saarinen, Jani" <jani.saarinen@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725011169; l=3061;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=f2u18U78PGc6vCLjwSxdZlzpzyLhmRleTuFw0CDjKSo=;
 b=Mz1jJr3pHf9RMWLe6E/G+EHhq5gmfD2w28fH7mzcTv9RaLymYk6C8XPHHMAV96BTAWmMNkwPS
 gjySbQr5RlCB+7Xco6NBHo1jsoIUjMZ884OBXGoj8Ms2QKgTPED8k1F
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
This is a fixed resend of [0], which was broken.
Thanks to Bert [1], and Chaitanya Kumar [2]
for reporting the issue.

[0] https://lore.kernel.org/lkml/20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net/
[1] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de/
[2] https://lore.kernel.org/lkml/SJ1PR11MB612925C1C533C09F8F62F7CBB9972@SJ1PR11MB6129.namprd11.prod.outlook.com/

Helge, I didn't document the function devm_unregister_framebuffer() as
it is only an internal helper and will ever only used by one user,
similar to other helpers in fbmem.c.
---
 drivers/video/fbdev/core/fbmem.c | 30 ++++++++++++++++++++++++++++++
 include/linux/fb.h               |  1 +
 2 files changed, 31 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 4c4ad0a86a50..3c568cff2913 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -544,6 +544,36 @@ unregister_framebuffer(struct fb_info *fb_info)
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
+	int ret;
+
+	ret = register_framebuffer(fb_info);
+	if (ret)
+		return ret;
+
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

---
base-commit: 20371ba120635d9ab7fc7670497105af8f33eb08
change-id: 20240830-fbdev-devm_register_framebuffer-647e9c103b9a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

