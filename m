Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7388D63443E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DF910E449;
	Tue, 22 Nov 2022 19:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6665410E449
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B63H70OP84tRUjEx6gv/fqRSzwu76nMaa1xXHe5fJyI=; b=VeoQkwUY4PLz7Sf8oEfaIviPWj
 pUMKetzlsJXoljrUD8QTe00yrk5wD5fI0Bm71m/d6R2Cai+0lZn7C4WXkzMJQSyrZWREclLuz/aqp
 8Z290ys+O7yC3LW+hxV1JoSsVYlQEDdJxmGU9xjn0nJLMU3wVTVP3fErazwV/G9H6MGMRRGP323PH
 pgP83lL1YZlB+/Uwwy5l8CUGS2SKPL8CyUGn3hfFWaL7U1GFXugPyUv1z4oVBkHKrqm8erpWH3puJ
 pld2RRO8vUa/1gdWpVEL1HYvd08ShzxYOqAwMxTGPoXivYkWX4L481pNp+oZlgMXykguKnmbtDzPA
 nb5yBNNw==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxYZc-007AP3-JZ; Tue, 22 Nov 2022 20:04:49 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 2/6] drm: use new debugfs device-centered functions on DRM
 core files
Date: Tue, 22 Nov 2022 16:03:10 -0300
Message-Id: <20221122190314.185015-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221122190314.185015-1-mcanal@igalia.com>
References: <20221122190314.185015-1-mcanal@igalia.com>
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
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function in all DRM core files, centering the
debugfs files management on the drm_device instead of drm_minor.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c          | 11 +++++------
 drivers/gpu/drm/drm_client.c          | 11 +++++------
 drivers/gpu/drm/drm_debugfs.c         | 18 ++++++++----------
 drivers/gpu/drm/drm_framebuffer.c     | 11 +++++------
 drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++------
 5 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f197f59f6d99..c7f23cf2552c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1756,8 +1756,8 @@ EXPORT_SYMBOL(drm_state_dump);
 #ifdef CONFIG_DEBUG_FS
 static int drm_state_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	__drm_state_dump(dev, &p, true);
@@ -1766,14 +1766,13 @@ static int drm_state_info(struct seq_file *m, void *data)
 }
 
 /* any use in debugfs files to dump individual planes/crtc/etc? */
-static const struct drm_info_list drm_atomic_debugfs_list[] = {
+static const struct drm_debugfs_info drm_atomic_debugfs_list[] = {
 	{"state", drm_state_info, 0},
 };
 
 void drm_atomic_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_atomic_debugfs_list,
-				 ARRAY_SIZE(drm_atomic_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_atomic_debugfs_list,
+			      ARRAY_SIZE(drm_atomic_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index fd67efe37c63..262ec64d4397 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -480,8 +480,8 @@ EXPORT_SYMBOL(drm_client_framebuffer_flush);
 #ifdef CONFIG_DEBUG_FS
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_client_dev *client;
 
@@ -493,14 +493,13 @@ static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_client_debugfs_list[] = {
+static const struct drm_debugfs_info drm_client_debugfs_list[] = {
 	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
 };
 
 void drm_client_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_client_debugfs_list,
-				 ARRAY_SIZE(drm_client_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_client_debugfs_list,
+			      ARRAY_SIZE(drm_client_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index ca27c2b05051..83f7530e7b46 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -51,9 +51,8 @@
 
 static int drm_name_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_minor *minor = node->minor;
-	struct drm_device *dev = minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_master *master;
 
 	mutex_lock(&dev->master_mutex);
@@ -73,8 +72,8 @@ static int drm_name_info(struct seq_file *m, void *data)
 
 static int drm_clients_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_file *priv;
 	kuid_t uid;
 
@@ -125,8 +124,8 @@ static int drm_gem_one_name_info(int id, void *ptr, void *data)
 
 static int drm_gem_name_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 
 	seq_printf(m, "  name     size handles refcount\n");
 
@@ -137,7 +136,7 @@ static int drm_gem_name_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_debugfs_list[] = {
+static const struct drm_debugfs_info drm_debugfs_list[] = {
 	{"name", drm_name_info, 0},
 	{"clients", drm_clients_info, 0},
 	{"gem_names", drm_gem_name_info, DRIVER_GEM},
@@ -231,8 +230,7 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
 	sprintf(name, "%d", minor_id);
 	minor->debugfs_root = debugfs_create_dir(name, root);
 
-	drm_debugfs_create_files(drm_debugfs_list, DRM_DEBUGFS_ENTRIES,
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_debugfs_list, DRM_DEBUGFS_ENTRIES);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		drm_atomic_debugfs_init(minor);
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 2dd97473ca10..aff3746dedfb 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -1203,8 +1203,8 @@ void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 #ifdef CONFIG_DEBUG_FS
 static int drm_framebuffer_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	struct drm_framebuffer *fb;
 
@@ -1218,14 +1218,13 @@ static int drm_framebuffer_info(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_framebuffer_debugfs_list[] = {
+static const struct drm_debugfs_info drm_framebuffer_debugfs_list[] = {
 	{ "framebuffer", drm_framebuffer_info, 0 },
 };
 
 void drm_framebuffer_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_framebuffer_debugfs_list,
-				 ARRAY_SIZE(drm_framebuffer_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_framebuffer_debugfs_list,
+			      ARRAY_SIZE(drm_framebuffer_debugfs_list));
 }
 #endif
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b6c7e3803bb3..c06368dcacb2 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -956,8 +956,8 @@ static struct ttm_device_funcs bo_driver = {
 
 static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
-	struct drm_vram_mm *vmm = node->minor->dev->vram_mm;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct ttm_resource_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -965,7 +965,7 @@ static int drm_vram_mm_debugfs(struct seq_file *m, void *data)
 	return 0;
 }
 
-static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
+static const struct drm_debugfs_info drm_vram_mm_debugfs_list[] = {
 	{ "vram-mm", drm_vram_mm_debugfs, 0, NULL },
 };
 
@@ -977,9 +977,8 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
  */
 void drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
-	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
-				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
-				 minor->debugfs_root, minor);
+	drm_debugfs_add_files(minor->dev, drm_vram_mm_debugfs_list,
+			      ARRAY_SIZE(drm_vram_mm_debugfs_list));
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
-- 
2.38.1

