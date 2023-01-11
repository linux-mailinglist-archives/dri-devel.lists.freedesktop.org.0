Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA487666216
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB1B10E7B8;
	Wed, 11 Jan 2023 17:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D6810E7B7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=saDsxy6VkRFo0MSUyGyDe1iXynIh/Kf/w3cWZNTzadk=; b=f4UXaNDAkwRuyIzLtvHmtrGK1r
 cZLu3Rq31rIAg+UxmhSJc7h8xZPw01RTKtd+DCte51cmRwUXwkWRFUuIzdOc1vXkIGM18NVqXBqUq
 LPe4/38PrTNwgJUAYt2n/N+e/cvCi3te4yENTa/wwoBAzFXkMYpoAPooKPhAPtUx573A4OiKVvZD5
 I+amIV4TNtoVbMwWwxa1k8CuCGc2fjxVWMIy0L8GYdPrtmlyzBwpPG539MfV3d6A9P5Nm9OsHzZLl
 srPFLJPSOktk53+fR9AEyc628zB+Ty8sQzsyLpmNoce8pnjZ0pXzrs3r7/rq2tAIMKn+QrhM+A96M
 XQPgF5RQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf43-005Sku-NY; Wed, 11 Jan 2023 18:39:04 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 09/13] drm/sti: Use the crtc's debugfs infrastructure
Date: Wed, 11 Jan 2023 14:37:44 -0300
Message-Id: <20230111173748.752659-10-mcanal@igalia.com>
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
drm_debugfs_crtc_add_files() function, which centers the debugfs files
management on the drm_crtc instead of drm_device. Using this function
on late register callbacks is more adequate as the callback passes a
drm_crtc as parameter.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/sti/sti_compositor.c |  6 +++---
 drivers/gpu/drm/sti/sti_compositor.h |  2 +-
 drivers/gpu/drm/sti/sti_crtc.c       |  2 +-
 drivers/gpu/drm/sti/sti_mixer.c      | 31 +++++-----------------------
 drivers/gpu/drm/sti/sti_mixer.h      |  2 +-
 drivers/gpu/drm/sti/sti_vid.c        | 19 ++++-------------
 drivers/gpu/drm/sti/sti_vid.h        |  2 +-
 7 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 142a8e1b4436..822da9d2879c 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -44,17 +44,17 @@ static const struct sti_compositor_data stih407_compositor_data = {
 };
 
 void sti_compositor_debugfs_init(struct sti_compositor *compo,
-				 struct drm_minor *minor)
+				 struct drm_crtc *crtc)
 {
 	unsigned int i;
 
 	for (i = 0; i < STI_MAX_VID; i++)
 		if (compo->vid[i])
-			vid_debugfs_init(compo->vid[i], minor);
+			vid_debugfs_init(compo->vid[i], crtc);
 
 	for (i = 0; i < STI_MAX_MIXER; i++)
 		if (compo->mixer[i])
-			sti_mixer_debugfs_init(compo->mixer[i], minor);
+			sti_mixer_debugfs_init(compo->mixer[i], crtc);
 }
 
 static int sti_compositor_bind(struct device *dev,
diff --git a/drivers/gpu/drm/sti/sti_compositor.h b/drivers/gpu/drm/sti/sti_compositor.h
index 25bb01bdd013..f5e9a2e4b6b5 100644
--- a/drivers/gpu/drm/sti/sti_compositor.h
+++ b/drivers/gpu/drm/sti/sti_compositor.h
@@ -80,6 +80,6 @@ struct sti_compositor {
 };
 
 void sti_compositor_debugfs_init(struct sti_compositor *compo,
-				 struct drm_minor *minor);
+				 struct drm_crtc *crtc);
 
 #endif
diff --git a/drivers/gpu/drm/sti/sti_crtc.c b/drivers/gpu/drm/sti/sti_crtc.c
index 3c7154f2d5f3..176c74db8bb7 100644
--- a/drivers/gpu/drm/sti/sti_crtc.c
+++ b/drivers/gpu/drm/sti/sti_crtc.c
@@ -318,7 +318,7 @@ static int sti_crtc_late_register(struct drm_crtc *crtc)
 	struct sti_compositor *compo = dev_get_drvdata(mixer->dev);
 
 	if (drm_crtc_index(crtc) == 0)
-		sti_compositor_debugfs_init(compo, crtc->dev->primary);
+		sti_compositor_debugfs_init(compo, crtc);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_mixer.c b/drivers/gpu/drm/sti/sti_mixer.c
index 7e5f14646625..ce775c64db2e 100644
--- a/drivers/gpu/drm/sti/sti_mixer.c
+++ b/drivers/gpu/drm/sti/sti_mixer.c
@@ -147,8 +147,8 @@ static void mixer_dbg_mxn(struct seq_file *s, void *addr)
 
 static int mixer_dbg_show(struct seq_file *s, void *arg)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_mixer *mixer = (struct sti_mixer *)node->info_ent->data;
+	struct drm_debugfs_crtc_entry *entry = s->private;
+	struct sti_mixer *mixer = (struct sti_mixer *)entry->file.data;
 
 	seq_printf(s, "%s: (vaddr = 0x%p)",
 		   sti_mixer_to_str(mixer), mixer->regs);
@@ -170,39 +170,18 @@ static int mixer_dbg_show(struct seq_file *s, void *arg)
 	return 0;
 }
 
-static struct drm_info_list mixer0_debugfs_files[] = {
-	{ "mixer_main", mixer_dbg_show, 0, NULL },
-};
-
-static struct drm_info_list mixer1_debugfs_files[] = {
-	{ "mixer_aux", mixer_dbg_show, 0, NULL },
-};
-
-void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor)
+void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_crtc *crtc)
 {
-	unsigned int i;
-	struct drm_info_list *mixer_debugfs_files;
-	int nb_files;
-
 	switch (mixer->id) {
 	case STI_MIXER_MAIN:
-		mixer_debugfs_files = mixer0_debugfs_files;
-		nb_files = ARRAY_SIZE(mixer0_debugfs_files);
+		drm_debugfs_crtc_add_file(crtc, "mixer_main", mixer_dbg_show, mixer);
 		break;
 	case STI_MIXER_AUX:
-		mixer_debugfs_files = mixer1_debugfs_files;
-		nb_files = ARRAY_SIZE(mixer1_debugfs_files);
+		drm_debugfs_crtc_add_file(crtc, "mixer_aux", mixer_dbg_show, mixer);
 		break;
 	default:
 		return;
 	}
-
-	for (i = 0; i < nb_files; i++)
-		mixer_debugfs_files[i].data = mixer;
-
-	drm_debugfs_create_files(mixer_debugfs_files,
-				 nb_files,
-				 minor->debugfs_root, minor);
 }
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable)
diff --git a/drivers/gpu/drm/sti/sti_mixer.h b/drivers/gpu/drm/sti/sti_mixer.h
index ab06beb7b258..973f7058092b 100644
--- a/drivers/gpu/drm/sti/sti_mixer.h
+++ b/drivers/gpu/drm/sti/sti_mixer.h
@@ -58,7 +58,7 @@ int sti_mixer_active_video_area(struct sti_mixer *mixer,
 
 void sti_mixer_set_background_status(struct sti_mixer *mixer, bool enable);
 
-void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_minor *minor);
+void sti_mixer_debugfs_init(struct sti_mixer *mixer, struct drm_crtc *crtc);
 
 /* depth in Cross-bar control = z order */
 #define GAM_MIXER_NB_DEPTH_LEVEL 6
diff --git a/drivers/gpu/drm/sti/sti_vid.c b/drivers/gpu/drm/sti/sti_vid.c
index 2d818397918d..98f2f4c8c2db 100644
--- a/drivers/gpu/drm/sti/sti_vid.c
+++ b/drivers/gpu/drm/sti/sti_vid.c
@@ -92,8 +92,8 @@ static void vid_dbg_mst(struct seq_file *s, int val)
 
 static int vid_dbg_show(struct seq_file *s, void *arg)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_vid *vid = (struct sti_vid *)node->info_ent->data;
+	struct drm_debugfs_crtc_entry *entry = s->private;
+	struct sti_vid *vid = (struct sti_vid *)entry->file.data;
 
 	seq_printf(s, "VID: (vaddr= 0x%p)", vid->regs);
 
@@ -120,20 +120,9 @@ static int vid_dbg_show(struct seq_file *s, void *arg)
 	return 0;
 }
 
-static struct drm_info_list vid_debugfs_files[] = {
-	{ "vid", vid_dbg_show, 0, NULL },
-};
-
-void vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor)
+void vid_debugfs_init(struct sti_vid *vid, struct drm_crtc *crtc)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(vid_debugfs_files); i++)
-		vid_debugfs_files[i].data = vid;
-
-	drm_debugfs_create_files(vid_debugfs_files,
-				 ARRAY_SIZE(vid_debugfs_files),
-				 minor->debugfs_root, minor);
+	drm_debugfs_crtc_add_file(crtc, "vid", vid_dbg_show, vid);
 }
 
 void sti_vid_commit(struct sti_vid *vid,
diff --git a/drivers/gpu/drm/sti/sti_vid.h b/drivers/gpu/drm/sti/sti_vid.h
index 991849ba50b5..a14577a8df48 100644
--- a/drivers/gpu/drm/sti/sti_vid.h
+++ b/drivers/gpu/drm/sti/sti_vid.h
@@ -26,6 +26,6 @@ void sti_vid_disable(struct sti_vid *vid);
 struct sti_vid *sti_vid_create(struct device *dev, struct drm_device *drm_dev,
 			       int id, void __iomem *baseaddr);
 
-void vid_debugfs_init(struct sti_vid *vid, struct drm_minor *minor);
+void vid_debugfs_init(struct sti_vid *vid, struct drm_crtc *crtc);
 
 #endif
-- 
2.39.0

