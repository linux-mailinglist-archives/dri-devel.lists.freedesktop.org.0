Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC73666219
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E321D10E7B9;
	Wed, 11 Jan 2023 17:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC8B10E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M6dLSSXWPTXHD495TvvFtj63ymqVq8XZJDcxHou6zuo=; b=TXxZsiFuTBymS1xiETYH9dTM3+
 Yn29+8W/b2LZxab5ier8Jlx+O3iXHaqnZfB0pETWxXHpOskhgEIw0TSdXX8OzJywrWg0Z9zaqGaO3
 VeW1noDkoD4dxYTwmHjRvgZixdpr9v7Jd6h/Dh+gpYu0Q6PYepaAhmPxiLvjmssoRzVn2Emhi91wh
 +AXpjR7gd4f4ZcPpHBESANB+irTy44PxReUNNlA0bklOpKGTDjJhMtOeGfz52j+7BtdsMY2l7PDVj
 eO2hfe5j2XmwUanC3MpTroAzCx6rh2Z5U1w39I6fQrZ5HznK4YZSZLPgKNzW3AdIJt3wis3JkFjNr
 GCJxe5Gw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf48-005Sku-9I; Wed, 11 Jan 2023 18:39:08 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 10/13] drm/sti: Use the connectors' debugfs infrastructure
Date: Wed, 11 Jan 2023 14:37:45 -0300
Message-Id: <20230111173748.752659-11-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111173748.752659-1-mcanal@igalia.com>
References: <20230111173748.752659-1-mcanal@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the use of drm_debugfs_add_files() with the new
drm_debugfs_connector_add_files() function, which centers the debugfs files
management on the drm_connector instead of drm_device. Using this function
on late register callbacks is more adequate as the callback passes a
drm_connector as parameter.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/sti/sti_dvo.c  | 21 +++++----------------
 drivers/gpu/drm/sti/sti_hda.c  | 21 +++++----------------
 drivers/gpu/drm/sti/sti_hdmi.c | 21 +++++----------------
 3 files changed, 15 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index f3a5616b7daf..b617c288b893 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -178,8 +178,8 @@ static void dvo_dbg_awg_microcode(struct seq_file *s, void __iomem *reg)
 
 static int dvo_dbg_show(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_dvo *dvo = (struct sti_dvo *)node->info_ent->data;
+	struct drm_debugfs_connector_entry *entry = s->private;
+	struct sti_dvo *dvo = (struct sti_dvo *)entry->file.data;
 
 	seq_printf(s, "DVO: (vaddr = 0x%p)", dvo->regs);
 	DBGFS_DUMP(DVO_AWG_DIGSYNC_CTRL);
@@ -192,20 +192,9 @@ static int dvo_dbg_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static struct drm_info_list dvo_debugfs_files[] = {
-	{ "dvo", dvo_dbg_show, 0, NULL },
-};
-
-static void dvo_debugfs_init(struct sti_dvo *dvo, struct drm_minor *minor)
+static void dvo_debugfs_init(struct sti_dvo *dvo, struct drm_connector *connector)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(dvo_debugfs_files); i++)
-		dvo_debugfs_files[i].data = dvo;
-
-	drm_debugfs_create_files(dvo_debugfs_files,
-				 ARRAY_SIZE(dvo_debugfs_files),
-				 minor->debugfs_root, minor);
+	drm_debugfs_connector_add_file(connector, "dvo", dvo_dbg_show, dvo);
 }
 
 static void sti_dvo_disable(struct drm_bridge *bridge)
@@ -403,7 +392,7 @@ static int sti_dvo_late_register(struct drm_connector *connector)
 		= to_sti_dvo_connector(connector);
 	struct sti_dvo *dvo = dvo_connector->dvo;
 
-	dvo_debugfs_init(dvo, dvo->drm_dev->primary);
+	dvo_debugfs_init(dvo, connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
index ec6656b9ee7c..9560f29db6e1 100644
--- a/drivers/gpu/drm/sti/sti_hda.c
+++ b/drivers/gpu/drm/sti/sti_hda.c
@@ -345,8 +345,8 @@ static void hda_dbg_video_dacs_ctrl(struct seq_file *s, void __iomem *reg)
 
 static int hda_dbg_show(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_hda *hda = (struct sti_hda *)node->info_ent->data;
+	struct drm_debugfs_connector_entry *entry = s->private;
+	struct sti_hda *hda = (struct sti_hda *)entry->file.data;
 
 	seq_printf(s, "HD Analog: (vaddr = 0x%p)", hda->regs);
 	DBGFS_DUMP(HDA_ANA_CFG);
@@ -364,20 +364,9 @@ static int hda_dbg_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static struct drm_info_list hda_debugfs_files[] = {
-	{ "hda", hda_dbg_show, 0, NULL },
-};
-
-static void hda_debugfs_init(struct sti_hda *hda, struct drm_minor *minor)
+static void hda_debugfs_init(struct sti_hda *hda, struct drm_connector *connector)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(hda_debugfs_files); i++)
-		hda_debugfs_files[i].data = hda;
-
-	drm_debugfs_create_files(hda_debugfs_files,
-				 ARRAY_SIZE(hda_debugfs_files),
-				 minor->debugfs_root, minor);
+	drm_debugfs_connector_add_file(connector, "hda", hda_dbg_show, hda);
 }
 
 /**
@@ -643,7 +632,7 @@ static int sti_hda_late_register(struct drm_connector *connector)
 		= to_sti_hda_connector(connector);
 	struct sti_hda *hda = hda_connector->hda;
 
-	hda_debugfs_init(hda, hda->drm_dev->primary);
+	hda_debugfs_init(hda, connector);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index fcc2194869d6..9b82d9b7db6a 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -668,8 +668,8 @@ static void hdmi_dbg_sw_di_cfg(struct seq_file *s, int val)
 
 static int hdmi_dbg_show(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_hdmi *hdmi = (struct sti_hdmi *)node->info_ent->data;
+	struct drm_debugfs_connector_entry *entry = s->private;
+	struct sti_hdmi *hdmi = (struct sti_hdmi *)entry->file.data;
 
 	seq_printf(s, "HDMI: (vaddr = 0x%p)", hdmi->regs);
 	DBGFS_DUMP("\n", HDMI_CFG);
@@ -730,20 +730,9 @@ static int hdmi_dbg_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static struct drm_info_list hdmi_debugfs_files[] = {
-	{ "hdmi", hdmi_dbg_show, 0, NULL },
-};
-
-static void hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_minor *minor)
+static void hdmi_debugfs_init(struct sti_hdmi *hdmi, struct drm_connector *connector)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(hdmi_debugfs_files); i++)
-		hdmi_debugfs_files[i].data = hdmi;
-
-	drm_debugfs_create_files(hdmi_debugfs_files,
-				 ARRAY_SIZE(hdmi_debugfs_files),
-				 minor->debugfs_root, minor);
+	drm_debugfs_connector_add_file(connector, "hdmi", hdmi_dbg_show, hdmi);
 }
 
 static void sti_hdmi_disable(struct drm_bridge *bridge)
@@ -1120,7 +1109,7 @@ static int sti_hdmi_late_register(struct drm_connector *connector)
 		= to_sti_hdmi_connector(connector);
 	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
 
-	hdmi_debugfs_init(hdmi, hdmi->drm_dev->primary);
+	hdmi_debugfs_init(hdmi, connector);
 
 	return 0;
 }
-- 
2.39.0

