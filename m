Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE8634443
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 20:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C3010E454;
	Tue, 22 Nov 2022 19:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D6210E449
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 19:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d/qI//+OQoEdsKqwLqt/SVzoshXizCJD9aKRGZJg7Dw=; b=dby7rT9cKHLWDj0TFoMMMHs8iq
 taXEyb6WQkCs+Sv0IAJiFvcJIpog+7TQfkqVsWfIMTWs5H7mFemM5e2ArW8Eiq7LlrLE8AEJAjE3c
 nPYbGQaisgVSmUP1EGz3Er2oN/oBF69W5yGC8IjzxlppqSf8UrzVVvR/wjVbgErJ7EsUWA+daT0WH
 WtSG594yiYv4aYJ07stMvtEdEgQiojvIrZjATdaqYYGqgIrjCOm56N92+Ix99hrMA7pRZFuB3GjI1
 TIvt2em/HWSsWXLsbCSVrCsBgTEsndA0tJJHMMLiSMlT0mbfNpoDujQNTei/ptYK0cjVeE0NLsy4w
 O9IuHxRQ==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oxYZi-007AP3-12; Tue, 22 Nov 2022 20:04:54 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 3/6] drm/vc4: use new debugfs device-centered functions
Date: Tue, 22 Nov 2022 16:03:11 -0300
Message-Id: <20221122190314.185015-4-mcanal@igalia.com>
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

Currently, vc4 has its own debugfs infrastructure that adds the debugfs
files on drm_dev_register(). With the introduction of the new debugfs,
functions, replace the vc4 debugfs structure with the DRM debugfs
device-centered function, drm_debugfs_add_file().

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c      |  6 +++---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 30 ++++--------------------------
 drivers/gpu/drm/vc4/vc4_drv.c     |  1 -
 drivers/gpu/drm/vc4/vc4_drv.h     | 16 ----------------
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  6 +++---
 drivers/gpu/drm/vc4/vc4_hvs.c     | 12 ++++++------
 drivers/gpu/drm/vc4/vc4_v3d.c     |  6 +++---
 7 files changed, 19 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 43d9b3a6a352..10823e054b83 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -69,8 +69,8 @@ static void vc4_bo_stats_print(struct drm_printer *p, struct vc4_dev *vc4)
 
 static int vc4_bo_stats_debugfs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -998,7 +998,7 @@ int vc4_bo_debugfs_init(struct drm_minor *minor)
 	if (!vc4->v3d)
 		return -ENODEV;
 
-	ret = vc4_debugfs_add_file(minor, "bo_stats",
+	ret = drm_debugfs_add_file(drm, "bo_stats",
 				   vc4_bo_stats_debugfs, NULL);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 19cda4f91a82..53f308357442 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -34,9 +34,9 @@ vc4_debugfs_init(struct drm_minor *minor)
 
 static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *drm = node->minor->dev;
-	struct debugfs_regset32 *regset = node->info_ent->data;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *drm = entry->dev;
+	struct debugfs_regset32 *regset = entry->file.data;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
 
@@ -50,31 +50,9 @@ static int vc4_debugfs_regset32(struct seq_file *m, void *unused)
 	return 0;
 }
 
-int vc4_debugfs_add_file(struct drm_minor *minor,
-			 const char *name,
-			 int (*show)(struct seq_file*, void*),
-			 void *data)
-{
-	struct drm_device *dev = minor->dev;
-	struct dentry *root = minor->debugfs_root;
-	struct drm_info_list *file;
-
-	file = drmm_kzalloc(dev, sizeof(*file), GFP_KERNEL);
-	if (!file)
-		return -ENOMEM;
-
-	file->name = name;
-	file->show = show;
-	file->data = data;
-
-	drm_debugfs_create_files(file, 1, root, minor);
-
-	return 0;
-}
-
 int vc4_debugfs_add_regset32(struct drm_minor *minor,
 			     const char *name,
 			     struct debugfs_regset32 *regset)
 {
-	return vc4_debugfs_add_file(minor, name, vc4_debugfs_regset32, regset);
+	return drm_debugfs_add_file(minor->dev, name, vc4_debugfs_regset32, regset);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index b66bf7aea632..6e21ae7240ce 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -320,7 +320,6 @@ static int vc4_drm_bind(struct device *dev)
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
-	INIT_LIST_HEAD(&vc4->debugfs_list);
 
 	if (!is_vc5) {
 		ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 515228682e8e..e2bf76bc0843 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -221,11 +221,6 @@ struct vc4_dev {
 	struct drm_private_obj hvs_channels;
 	struct drm_private_obj load_tracker;
 
-	/* List of vc4_debugfs_info_entry for adding to debugfs once
-	 * the minor is available (after drm_dev_register()).
-	 */
-	struct list_head debugfs_list;
-
 	/* Mutex for binner bo allocation. */
 	struct mutex bin_bo_lock;
 	/* Reference count for our binner bo. */
@@ -884,21 +879,10 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 /* vc4_debugfs.c */
 void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
-int vc4_debugfs_add_file(struct drm_minor *minor,
-			 const char *filename,
-			 int (*show)(struct seq_file*, void*),
-			 void *data);
 int vc4_debugfs_add_regset32(struct drm_minor *minor,
 			     const char *filename,
 			     struct debugfs_regset32 *regset);
 #else
-static inline int vc4_debugfs_add_file(struct drm_minor *minor,
-				       const char *filename,
-				       int (*show)(struct seq_file*, void*),
-				       void *data)
-{
-	return 0;
-}
 
 static inline int vc4_debugfs_add_regset32(struct drm_minor *minor,
 					   const char *filename,
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6b223a5fcf6f..086481632b7f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -160,8 +160,8 @@ static bool vc4_hdmi_is_full_range_rgb(struct vc4_hdmi *vc4_hdmi,
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct vc4_hdmi *vc4_hdmi = node->info_ent->data;
+	struct drm_debugfs_entry *entry = m->private;
+	struct vc4_hdmi *vc4_hdmi = entry->file.data;
 	struct drm_device *drm = vc4_hdmi->connector.dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 	int idx;
@@ -1985,7 +1985,7 @@ static int vc4_hdmi_late_register(struct drm_encoder *encoder)
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
 	int ret;
 
-	ret = vc4_debugfs_add_file(drm->primary, variant->debugfs_name,
+	ret = drm_debugfs_add_file(drm, variant->debugfs_name,
 				   vc4_hdmi_debugfs_regs,
 				   vc4_hdmi);
 	if (ret)
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c4453a5ae163..682e5276c5d7 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -93,8 +93,8 @@ void vc4_hvs_dump_state(struct vc4_hvs *hvs)
 
 static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -105,8 +105,8 @@ static int vc4_hvs_debugfs_underrun(struct seq_file *m, void *data)
 
 static int vc4_hvs_debugfs_dlist(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_hvs *hvs = vc4->hvs;
 	struct drm_printer p = drm_seq_file_printer(m);
@@ -750,12 +750,12 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 				    minor->debugfs_root,
 				    &vc4->load_tracker_enabled);
 
-	ret = vc4_debugfs_add_file(minor, "hvs_dlists",
+	ret = drm_debugfs_add_file(drm, "hvs_dlists",
 				   vc4_hvs_debugfs_dlist, NULL);
 	if (ret)
 		return ret;
 
-	ret = vc4_debugfs_add_file(minor, "hvs_underrun",
+	ret = drm_debugfs_add_file(drm, "hvs_underrun",
 				   vc4_hvs_debugfs_underrun, NULL);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 56abb0d6bc39..699b0299cb1a 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -96,8 +96,8 @@ static const struct debugfs_reg32 v3d_regs[] = {
 
 static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct drm_device *dev = node->minor->dev;
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret = vc4_v3d_pm_get(vc4);
 
@@ -409,7 +409,7 @@ int vc4_v3d_debugfs_init(struct drm_minor *minor)
 	if (!vc4->v3d)
 		return -ENODEV;
 
-	ret = vc4_debugfs_add_file(minor, "v3d_ident",
+	ret = drm_debugfs_add_file(drm, "v3d_ident",
 				   vc4_v3d_debugfs_ident, NULL);
 	if (ret)
 		return ret;
-- 
2.38.1

