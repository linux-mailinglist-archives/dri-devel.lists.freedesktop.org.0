Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6566621A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F76D10E7BB;
	Wed, 11 Jan 2023 17:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4CC10E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mmq7zwhPobz29pXWwkxNg2hoJg/zKhte437K+vYc8rI=; b=YoAdj28KT847bQXmS2y2cwSoM5
 VbW5KOHCqeR2MtrtqNQTvg6/NVye/pNE07iOejwtQKNCN61GUBk1FEA1CtvH7RyafNJRcZnws42Cb
 b9y86UHUjUX8blYImxRO8kenSZaHhnoQGnCIPDIau6KKiszFKUiDlJBBuMqWIyoYVOZn+s9EiMzQi
 bPWRIAyMuCtPMMWsiM1EHwWNqFd8+A5VMjvT5whTQmQcH5UqDSlC3H9xPhZHJZelFjT9jHW3KJDs5
 YRXBVImSGnx8RfBQWPueZmeZZdpIGj7oScyerzDobp6WMgh4WRTZgn3Cw5oESS+g/3pLsozEylvmv
 +O3jgO1A==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3u-005Sku-S4; Wed, 11 Jan 2023 18:38:55 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 07/13] drm/vc4: Use the encoders' debugfs infrastructure
Date: Wed, 11 Jan 2023 14:37:42 -0300
Message-Id: <20230111173748.752659-8-mcanal@igalia.com>
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
drm_debugfs_encoder_add_files() function, which centers the debugfs files
management on the drm_encoder instead of drm_device. Using this function
on late register callbacks is more adequate as the callback passes a
drm_encoder as parameter.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 17 +++++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c     |  3 +--
 drivers/gpu/drm/vc4/vc4_drv.h     |  8 ++++++++
 drivers/gpu/drm/vc4/vc4_dsi.c     |  3 +--
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  5 ++---
 drivers/gpu/drm/vc4/vc4_vec.c     |  3 +--
 6 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index 80afc69200f0..c71e4d6ec4c4 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -57,9 +57,26 @@ static int vc4_debugfs_dev_regset32(struct seq_file *m, void *unused)
 	return vc4_debugfs_regset32(drm, regset, &p);
 }
 
+static int vc4_debugfs_encoder_regset32(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_encoder_entry *entry = m->private;
+	struct drm_device *drm = entry->encoder->dev;
+	struct debugfs_regset32 *regset = entry->file.data;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	return vc4_debugfs_regset32(drm, regset, &p);
+}
+
 void vc4_debugfs_add_regset32(struct drm_device *drm,
 			      const char *name,
 			      struct debugfs_regset32 *regset)
 {
 	drm_debugfs_add_file(drm, name, vc4_debugfs_dev_regset32, regset);
 }
+
+void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
+				      const char *name,
+				      struct debugfs_regset32 *regset)
+{
+	drm_debugfs_encoder_add_file(encoder, name, vc4_debugfs_encoder_regset32, regset);
+}
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f518d6e59ed6..084f7825dfa4 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -265,10 +265,9 @@ static const struct drm_encoder_helper_funcs vc4_dpi_encoder_helper_funcs = {
 
 static int vc4_dpi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
 	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
 
-	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
+	vc4_debugfs_encoder_add_regset32(encoder, "dpi_regs", &dpi->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 95069bb16821..8aaa8d00bc45 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -969,12 +969,20 @@ void vc4_debugfs_init(struct drm_minor *minor);
 void vc4_debugfs_add_regset32(struct drm_device *drm,
 			      const char *filename,
 			      struct debugfs_regset32 *regset);
+void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
+				      const char *name,
+				      struct debugfs_regset32 *regset);
 #else
 
 static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
 					    const char *filename,
 					    struct debugfs_regset32 *regset)
 {}
+
+static inline void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
+						    const char *name,
+						    struct debugfs_regset32 *regset)
+{}
 #endif
 
 /* vc4_drv.c */
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 2a71321b9222..00751b76bfe0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1424,10 +1424,9 @@ static const struct drm_bridge_funcs vc4_dsi_bridge_funcs = {
 
 static int vc4_dsi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
 	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
 
-	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
+	vc4_debugfs_encoder_add_regset32(encoder, dsi->variant->debugfs_name, &dsi->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 14628864487a..221cef11d4dd 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2002,12 +2002,11 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
 
 static int vc4_hdmi_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
 
-	drm_debugfs_add_file(drm, variant->debugfs_name,
-			     vc4_hdmi_debugfs_regs, vc4_hdmi);
+	drm_debugfs_encoder_add_file(encoder, variant->debugfs_name,
+				     vc4_hdmi_debugfs_regs, vc4_hdmi);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a3782d05cd66..4c5bd733d524 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -716,10 +716,9 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
 
 static int vc4_vec_late_register(struct drm_encoder *encoder)
 {
-	struct drm_device *drm = encoder->dev;
 	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
 
-	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
+	vc4_debugfs_encoder_add_regset32(encoder, "vec_regs", &vec->regset);
 
 	return 0;
 }
-- 
2.39.0

