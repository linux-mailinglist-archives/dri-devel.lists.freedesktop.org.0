Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2676624D3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1A410E3F0;
	Mon,  9 Jan 2023 11:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361B510E3F1;
 Mon,  9 Jan 2023 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LR2BmqUdwmoWBTz74beWCNgvi++bH5MdyHG+fcowqXI=; b=QQvI5nMAd8dVcIqOCFcuXgw7R9
 1Q3kmAV9MWNTJKOeQqT6yAsCD00HSEfDcoaLng5Fz7YSofDEeljCjVJSIjD92i2urAH1QmxLWQQ80
 HUuat5f0slPXaTRfLxKr/QKlAwr5t6Qd9BjfxXU4jjrUMpj2vQsfRHJ+42EBWcVmcObx1GrAnGgCg
 w5qQWM/IrTyvSS7xEjr9XBbVlgKNKoZa8s+ihfkbBIIIorj445ijm9c6Jm9NN0Q4cokhRFoRmGQHc
 Sh2anVJap3HVBG4NIxX+bCJP2YDfP+Lb4E+AmQmNYhitrYlruFgTwwRgY3xs2JbSZDh2XZFcz1gYH
 XYEN1lRA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEqlc-003LkJ-LI; Mon, 09 Jan 2023 12:56:41 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Emma Anholt <emma@anholt.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 2/7] drm/pl111: use new debugfs device-centered functions
Date: Mon,  9 Jan 2023 08:55:16 -0300
Message-Id: <20230109115520.40088-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109115520.40088-1-mcanal@igalia.com>
References: <20230109115520.40088-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_file() function, which centers the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on pl111_amba_probe(),
before drm_dev_register().

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/pl111/Makefile        |  4 ++--
 drivers/gpu/drm/pl111/pl111_debugfs.c | 17 +++++------------
 drivers/gpu/drm/pl111/pl111_drm.h     |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c     |  6 ++----
 4 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/pl111/Makefile b/drivers/gpu/drm/pl111/Makefile
index 67d430d433e0..8e4d53fdf314 100644
--- a/drivers/gpu/drm/pl111/Makefile
+++ b/drivers/gpu/drm/pl111/Makefile
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 pl111_drm-y +=	pl111_display.o \
 		pl111_versatile.o \
-		pl111_drv.o
+		pl111_drv.o \
+		pl111_debugfs.o
 
 pl111_drm-$(CONFIG_ARCH_NOMADIK) += pl111_nomadik.o
-pl111_drm-$(CONFIG_DEBUG_FS) += pl111_debugfs.o
 
 obj-$(CONFIG_DRM_PL111) += pl111_drm.o
diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 6744fa16f464..d7cda31ceb2a 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -30,10 +30,10 @@ static const struct {
 	REGDEF(CLCD_PL111_LCUR),
 };
 
-static int pl111_debugfs_regs(struct seq_file *m, void *unused)
+static int __maybe_unused pl111_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct pl111_drm_dev_private *priv = dev->dev_private;
 	int i;
 
@@ -46,14 +46,7 @@ static int pl111_debugfs_regs(struct seq_file *m, void *unused)
 	return 0;
 }
 
-static const struct drm_info_list pl111_debugfs_list[] = {
-	{"regs", pl111_debugfs_regs, 0},
-};
-
-void
-pl111_debugfs_init(struct drm_minor *minor)
+void pl111_debugfs_init(struct drm_device *drm)
 {
-	drm_debugfs_create_files(pl111_debugfs_list,
-				 ARRAY_SIZE(pl111_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_file(drm, "regs", pl111_debugfs_regs, NULL);
 }
diff --git a/drivers/gpu/drm/pl111/pl111_drm.h b/drivers/gpu/drm/pl111/pl111_drm.h
index 2a46b5bd8576..7fe74be917f1 100644
--- a/drivers/gpu/drm/pl111/pl111_drm.h
+++ b/drivers/gpu/drm/pl111/pl111_drm.h
@@ -157,6 +157,6 @@ struct pl111_drm_dev_private {
 
 int pl111_display_init(struct drm_device *dev);
 irqreturn_t pl111_irq(int irq, void *data);
-void pl111_debugfs_init(struct drm_minor *minor);
+void pl111_debugfs_init(struct drm_device *drm);
 
 #endif /* _PL111_DRM_H_ */
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 00deba0b7271..c031eb4abc0d 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -228,10 +228,6 @@ static const struct drm_driver pl111_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
 	.gem_prime_mmap = drm_gem_prime_mmap,
-
-#if defined(CONFIG_DEBUG_FS)
-	.debugfs_init = pl111_debugfs_init,
-#endif
 };
 
 static int pl111_amba_probe(struct amba_device *amba_dev,
@@ -304,6 +300,8 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	if (ret != 0)
 		goto dev_put;
 
+	pl111_debugfs_init(drm);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret < 0)
 		goto dev_put;
-- 
2.39.0

