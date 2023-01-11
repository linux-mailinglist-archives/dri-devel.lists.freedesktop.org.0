Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD4666215
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA4210E7B7;
	Wed, 11 Jan 2023 17:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B582E10E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4gl2pFWgYrzPZmPcG8qvunz/5tzwPpFB+A9QyO3wfi0=; b=a14S5VeRJoqGQJ4KqX5PyWddv4
 EQftU2k8hrhNQHBDAY9YI8/N9T1YIHr0tfDZARFmYKnTsQmGA4Jc1BxfcZDZf3Vn9gjsVRdlGqryf
 tZs1JSSSdaG2Lc/ofYWBuIgO+MfnPRdU76WslmjP3nlL8gJLk9p77cVtvJH1gM0e484Rq808PBWbJ
 CJP/T5Ah31yEOuUN+x16MYzkPc3jK1UCERyd/+5bOH/DzWWgXrkgmYN8pddZ6aCGpiF/3zLUK9COD
 oaSlqO6FX+uhZ6H6LGV6HJP5nMW8K/bcGHZZL6Knwr8Se3a4f4024i5xtk1o8hnzz1JvTP7y9Is1e
 WMQ5za/g==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3z-005Sku-FU; Wed, 11 Jan 2023 18:39:00 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 08/13] drm/vc4: Use the crtc's debugfs infrastructure
Date: Wed, 11 Jan 2023 14:37:43 -0300
Message-Id: <20230111173748.752659-9-mcanal@igalia.com>
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
 drivers/gpu/drm/vc4/vc4_crtc.c    |  5 ++---
 drivers/gpu/drm/vc4/vc4_debugfs.c | 17 +++++++++++++++++
 drivers/gpu/drm/vc4/vc4_drv.h     |  8 ++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cdc0559221f0..3e5c71c0bed3 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1104,12 +1104,11 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
 
 int vc4_crtc_late_register(struct drm_crtc *crtc)
 {
-	struct drm_device *drm = crtc->dev;
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 
-	vc4_debugfs_add_regset32(drm, crtc_data->debugfs_name,
-				 &vc4_crtc->regset);
+	vc4_debugfs_crtc_add_regset32(crtc, crtc_data->debugfs_name,
+				      &vc4_crtc->regset);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index c71e4d6ec4c4..33023ae32ddf 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -57,6 +57,16 @@ static int vc4_debugfs_dev_regset32(struct seq_file *m, void *unused)
 	return vc4_debugfs_regset32(drm, regset, &p);
 }
 
+static int vc4_debugfs_crtc_regset32(struct seq_file *m, void *unused)
+{
+	struct drm_debugfs_crtc_entry *entry = m->private;
+	struct drm_device *drm = entry->crtc->dev;
+	struct debugfs_regset32 *regset = entry->file.data;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	return vc4_debugfs_regset32(drm, regset, &p);
+}
+
 static int vc4_debugfs_encoder_regset32(struct seq_file *m, void *unused)
 {
 	struct drm_debugfs_encoder_entry *entry = m->private;
@@ -74,6 +84,13 @@ void vc4_debugfs_add_regset32(struct drm_device *drm,
 	drm_debugfs_add_file(drm, name, vc4_debugfs_dev_regset32, regset);
 }
 
+void vc4_debugfs_crtc_add_regset32(struct drm_crtc *crtc,
+				   const char *name,
+				   struct debugfs_regset32 *regset)
+{
+	drm_debugfs_crtc_add_file(crtc, name, vc4_debugfs_crtc_regset32, regset);
+}
+
 void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
 				      const char *name,
 				      struct debugfs_regset32 *regset)
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8aaa8d00bc45..9a1b777afee2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -969,6 +969,9 @@ void vc4_debugfs_init(struct drm_minor *minor);
 void vc4_debugfs_add_regset32(struct drm_device *drm,
 			      const char *filename,
 			      struct debugfs_regset32 *regset);
+void vc4_debugfs_crtc_add_regset32(struct drm_crtc *crtc,
+				   const char *name,
+				   struct debugfs_regset32 *regset);
 void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
 				      const char *name,
 				      struct debugfs_regset32 *regset);
@@ -979,6 +982,11 @@ static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
 					    struct debugfs_regset32 *regset)
 {}
 
+static inline void vc4_debugfs_crtc_add_regset32(struct drm_crtc *crtc,
+						 const char *name,
+						 struct debugfs_regset32 *regset)
+{}
+
 static inline void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
 						    const char *name,
 						    struct debugfs_regset32 *regset)
-- 
2.39.0

