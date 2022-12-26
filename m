Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316606563F0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9A10E1C2;
	Mon, 26 Dec 2022 15:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA2310E1C2;
 Mon, 26 Dec 2022 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2KQSyzc12nremCtqn5TfrmPqMZix6V9Y7uEbsEysZ74=; b=E6wMkrPtAOJTUVxMLtofbSjOor
 q/qpy2TaRaukkyayFYrKbWrsggAh7dlAVA+XekCX8h7ZUMCf0a0SH/Yd8lLZyODiOKtJWOuPpmmJU
 02poneDirwjMMF0vlNz1+61U+CMNKuEOfzNA8B/VaCVuqI0LgoiOtyL6RzgpAMBxfn91kUjsGaqkn
 61m3d+9o8JMWyrBp2zp5q71gN9Bb8r8kjKJtZIrHS/dLxHQTAgCk+v6bll3GB6exLihLlsY0e079e
 OPh6SbONn32vjgVc2s9+qY9h/0XWj2caWQ6liu1Xbw/IUDRz1jdFMmLZzPWoWj3+g7deA5V96A2Yb
 cB9nJLOQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9pmM-00AXBr-3s; Mon, 26 Dec 2022 16:52:42 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] drm/omap: use new debugfs device-centered functions
Date: Mon, 26 Dec 2022 12:50:27 -0300
Message-Id: <20221226155029.244355-8-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221226155029.244355-1-mcanal@igalia.com>
References: <20221226155029.244355-1-mcanal@igalia.com>
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
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, etnaviv@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which center the debugfs files
management on the drm_device instead of drm_minor. Moreover, remove the
debugfs_init hook and add the debugfs files directly on omapdrm_init(),
before drm_dev_register().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/omapdrm/omap_debugfs.c | 29 +++++++++-----------------
 drivers/gpu/drm/omapdrm/omap_drv.c     |  7 ++++---
 drivers/gpu/drm/omapdrm/omap_drv.h     |  2 +-
 3 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index bfb2ccb40bd1..491aa74eb2ec 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -19,8 +19,8 @@
 
 static int gem_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 
 	seq_printf(m, "All Objects:\n");
@@ -33,8 +33,8 @@ static int gem_show(struct seq_file *m, void *arg)
 
 static int mm_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	drm_mm_print(&dev->vma_offset_manager->vm_addr_space_mm, &p);
@@ -45,8 +45,8 @@ static int mm_show(struct seq_file *m, void *arg)
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static int fb_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb;
 
@@ -68,7 +68,7 @@ static int fb_show(struct seq_file *m, void *arg)
 #endif
 
 /* list of debufs files that are applicable to all devices */
-static struct drm_info_list omap_debugfs_list[] = {
+static struct drm_debugfs_info omap_debugfs_list[] = {
 	{"gem", gem_show, 0},
 	{"mm", mm_show, 0},
 #ifdef CONFIG_DRM_FBDEV_EMULATION
@@ -76,21 +76,12 @@ static struct drm_info_list omap_debugfs_list[] = {
 #endif
 };
 
-/* list of debugfs files that are specific to devices with dmm/tiler */
-static struct drm_info_list omap_dmm_debugfs_list[] = {
-	{"tiler_map", tiler_map_show, 0},
-};
-
-void omap_debugfs_init(struct drm_minor *minor)
+void omap_debugfs_init(struct drm_device *drm)
 {
-	drm_debugfs_create_files(omap_debugfs_list,
-				 ARRAY_SIZE(omap_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(drm, omap_debugfs_list, ARRAY_SIZE(omap_debugfs_list));
 
 	if (dmm_is_available())
-		drm_debugfs_create_files(omap_dmm_debugfs_list,
-					 ARRAY_SIZE(omap_dmm_debugfs_list),
-					 minor->debugfs_root, minor);
+		drm_debugfs_add_file(drm, "tiler_map", tiler_map_show, NULL);
 }
 
 #endif
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..06fc1bc0aa07 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -691,9 +691,6 @@ static const struct drm_driver omap_drm_driver = {
 		DRIVER_ATOMIC | DRIVER_RENDER,
 	.open = dev_open,
 	.lastclose = drm_fb_helper_lastclose,
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init = omap_debugfs_init,
-#endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = omap_gem_prime_import,
@@ -781,6 +778,10 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	omap_fbdev_init(ddev);
 
+#ifdef CONFIG_DEBUG_FS
+	omap_debugfs_init(ddev);
+#endif
+
 	drm_kms_helper_poll_init(ddev);
 	omap_modeset_enable_external_hpd(ddev);
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
index 825960fd3ea9..1e0d9e10cd6b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.h
+++ b/drivers/gpu/drm/omapdrm/omap_drv.h
@@ -103,7 +103,7 @@ struct omap_drm_private {
 };
 
 
-void omap_debugfs_init(struct drm_minor *minor);
+void omap_debugfs_init(struct drm_device *drm);
 
 struct omap_global_state * __must_check omap_get_global_state(struct drm_atomic_state *s);
 
-- 
2.38.1

