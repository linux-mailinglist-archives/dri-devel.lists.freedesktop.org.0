Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D954650B37
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 13:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8F10E299;
	Mon, 19 Dec 2022 12:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD4110E234
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PLXz+qy+cWluMALi8dB4e4IiR1ElTBm+/4xDcUNaucQ=; b=dJFnVKFyYz1Wn05X/1qO41AxYV
 Wcq/Z0MS7qqVauG527dEh/dgMO75SGLGZEJHxDc3SFuE62l3Rsw3fM4LHNf7UjpXbh8iJfhWmBHZj
 Fs7iePTcGlBY9vYrtH6O6gK2sk4SToHMmfs/o8kC6TNqeJpFRJ8OTPWcTfXzeAdkUgDjBkeAww6hs
 v9VZUkr79WfkqhY036u6ZHDvviURZiArgp3xxFuVq2G9DqmoYDUCPub468ii01O6FFwtYZwiBwXYi
 OaGb6YfwpbvEY3KMShCQ9IbcI2pCLSyh9Z9rczPCWgh12KhegRWuRS4mPEAzDy0ZifIUO8Hmm0ea8
 zvaLbb5A==;
Received: from [177.34.169.227] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p7EvD-006HsS-Hv; Mon, 19 Dec 2022 13:07:08 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v4 4/7] drm/vc4: use new debugfs device-centered functions
Date: Mon, 19 Dec 2022 09:06:18 -0300
Message-Id: <20221219120621.15086-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219120621.15086-1-mcanal@igalia.com>
References: <20221219120621.15086-1-mcanal@igalia.com>
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
 Wambui Karuga <wambui@karuga.org>, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, vc4 has its own debugfs infrastructure that adds the debugfs
files on drm_dev_register(). With the introduction of the new debugfs,
functions, replace the vc4 debugfs structure with the DRM debugfs
device-centered function, drm_debugfs_add_file().

Moreover, remove the explicit error handling of debugfs related functions,
considering that the only failure mode is -ENOMEM and also that error
handling is not recommended for debugfs functions, as pointed out in [1].

[1] https://lore.kernel.org/all/YWAmZdRwnAt6wh9B@kroah.com/

Reviewed-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c      | 10 +++------
 drivers/gpu/drm/vc4/vc4_crtc.c    |  7 ++----
 drivers/gpu/drm/vc4/vc4_debugfs.c | 36 ++++++-------------------------
 drivers/gpu/drm/vc4/vc4_dpi.c     |  5 +----
 drivers/gpu/drm/vc4/vc4_drv.c     |  1 -
 drivers/gpu/drm/vc4/vc4_drv.h     | 32 ++++++---------------------
 drivers/gpu/drm/vc4/vc4_dsi.c     |  6 +-----
 drivers/gpu/drm/vc4/vc4_hdmi.c    | 12 ++++-------
 drivers/gpu/drm/vc4/vc4_hvs.c     | 24 ++++++---------------
 drivers/gpu/drm/vc4/vc4_v3d.c     | 14 ++++--------
 drivers/gpu/drm/vc4/vc4_vec.c     |  6 +-----
 11 files changed, 37 insertions(+), 116 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 43d9b3a6a352..c2b7573bd92b 100644
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
 
@@ -993,15 +993,11 @@ int vc4_bo_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *drm = minor->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
-	int ret;
 
 	if (!vc4->v3d)
 		return -ENODEV;
 
-	ret = vc4_debugfs_add_file(minor, "bo_stats",
-				   vc4_bo_stats_debugfs, NULL);
-	if (ret)
-		return ret;
+	drm_debugfs_add_file(drm, "bo_stats", vc4_bo_stats_debugfs, NULL);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index a1a3465948c4..35a6b5907278 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1090,12 +1090,9 @@ int vc4_crtc_late_register(struct drm_crtc *crtc)
 	struct drm_device *drm = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
-	int ret;
 
-	ret = vc4_debugfs_add_regset32(drm->primary, crtc_data->debugfs_name,
-				       &vc4_crtc->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, crtc_data->debugfs_name,
+				 &vc4_crtc->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 19cda4f91a82..fac624a663ea 100644
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
+void vc4_debugfs_add_regset32(struct drm_device *drm,
+			      const char *name,
+			      struct debugfs_regset32 *regset)
 {
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
-int vc4_debugfs_add_regset32(struct drm_minor *minor,
-			     const char *name,
-			     struct debugfs_regset32 *regset)
-{
-	return vc4_debugfs_add_file(minor, name, vc4_debugfs_regset32, regset);
+	drm_debugfs_add_file(drm, name, vc4_debugfs_regset32, regset);
 }
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index d31a02af1e53..f518d6e59ed6 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -267,11 +267,8 @@ static int vc4_dpi_late_register(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
-	int ret;
 
-	ret = vc4_debugfs_add_regset32(drm->primary, "dpi_regs", &dpi->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 3b0ae2c3e33c..0ccaee57fe9a 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -320,7 +320,6 @@ static int vc4_drm_bind(struct device *dev)
 
 	drm = &vc4->base;
 	platform_set_drvdata(pdev, drm);
-	INIT_LIST_HEAD(&vc4->debugfs_list);
 
 	if (!is_vc5) {
 		ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 78fda5332cb3..95069bb16821 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -226,11 +226,6 @@ struct vc4_dev {
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
@@ -971,28 +966,15 @@ void vc4_crtc_get_margins(struct drm_crtc_state *state,
 /* vc4_debugfs.c */
 void vc4_debugfs_init(struct drm_minor *minor);
 #ifdef CONFIG_DEBUG_FS
-int vc4_debugfs_add_file(struct drm_minor *minor,
-			 const char *filename,
-			 int (*show)(struct seq_file*, void*),
-			 void *data);
-int vc4_debugfs_add_regset32(struct drm_minor *minor,
-			     const char *filename,
-			     struct debugfs_regset32 *regset);
+void vc4_debugfs_add_regset32(struct drm_device *drm,
+			      const char *filename,
+			      struct debugfs_regset32 *regset);
 #else
-static inline int vc4_debugfs_add_file(struct drm_minor *minor,
-				       const char *filename,
-				       int (*show)(struct seq_file*, void*),
-				       void *data)
-{
-	return 0;
-}
 
-static inline int vc4_debugfs_add_regset32(struct drm_minor *minor,
-					   const char *filename,
-					   struct debugfs_regset32 *regset)
-{
-	return 0;
-}
+static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
+					    const char *filename,
+					    struct debugfs_regset32 *regset)
+{}
 #endif
 
 /* vc4_drv.c */
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 0ee9ada428ab..e05be9a34156 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1427,12 +1427,8 @@ static int vc4_dsi_late_register(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
-	int ret;
 
-	ret = vc4_debugfs_add_regset32(drm->primary, dsi->variant->debugfs_name,
-				       &dsi->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 12a00d644b61..0d3313c71f2f 100644
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
@@ -1995,13 +1995,9 @@ static int vc4_hdmi_late_register(struct drm_encoder *encoder)
 	struct drm_device *drm = encoder->dev;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
-	int ret;
 
-	ret = vc4_debugfs_add_file(drm->primary, variant->debugfs_name,
-				   vc4_hdmi_debugfs_regs,
-				   vc4_hdmi);
-	if (ret)
-		return ret;
+	drm_debugfs_add_file(drm, variant->debugfs_name,
+			     vc4_hdmi_debugfs_regs, vc4_hdmi);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 94c29f8547bb..024a2cdff5b2 100644
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
@@ -740,7 +740,6 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 	struct drm_device *drm = minor->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = vc4->hvs;
-	int ret;
 
 	if (!vc4->hvs)
 		return -ENODEV;
@@ -750,20 +749,11 @@ int vc4_hvs_debugfs_init(struct drm_minor *minor)
 				    minor->debugfs_root,
 				    &vc4->load_tracker_enabled);
 
-	ret = vc4_debugfs_add_file(minor, "hvs_dlists",
-				   vc4_hvs_debugfs_dlist, NULL);
-	if (ret)
-		return ret;
+	drm_debugfs_add_file(drm, "hvs_dlists", vc4_hvs_debugfs_dlist, NULL);
 
-	ret = vc4_debugfs_add_file(minor, "hvs_underrun",
-				   vc4_hvs_debugfs_underrun, NULL);
-	if (ret)
-		return ret;
+	drm_debugfs_add_file(drm, "hvs_underrun", vc4_hvs_debugfs_underrun, NULL);
 
-	ret = vc4_debugfs_add_regset32(minor, "hvs_regs",
-				       &hvs->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, "hvs_regs", &hvs->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 56abb0d6bc39..29a664c8bf44 100644
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
 
@@ -404,19 +404,13 @@ int vc4_v3d_debugfs_init(struct drm_minor *minor)
 	struct drm_device *drm = minor->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_v3d *v3d = vc4->v3d;
-	int ret;
 
 	if (!vc4->v3d)
 		return -ENODEV;
 
-	ret = vc4_debugfs_add_file(minor, "v3d_ident",
-				   vc4_v3d_debugfs_ident, NULL);
-	if (ret)
-		return ret;
+	drm_debugfs_add_file(drm, "v3d_ident", vc4_v3d_debugfs_ident, NULL);
 
-	ret = vc4_debugfs_add_regset32(minor, "v3d_regs", &v3d->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, "v3d_regs", &v3d->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index f589ab918f4d..d8bf00b442e9 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -716,12 +716,8 @@ static int vc4_vec_late_register(struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
-	int ret;
 
-	ret = vc4_debugfs_add_regset32(drm->primary, "vec_regs",
-				       &vec->regset);
-	if (ret)
-		return ret;
+	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
 
 	return 0;
 }
-- 
2.38.1

