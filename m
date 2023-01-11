Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03363666217
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229910E7BD;
	Wed, 11 Jan 2023 17:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545D710E7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oi+V6e0DSIlcwpc457pwLqM6HXb1h4o60/pcYsijnfI=; b=U7TgwudrGtcub6TPmNlgXFDFzf
 PHQy1W/FLEXJOZF6hCsHCeNJzd5gLsK0uNrjkMN0GA50NX4t6doLxiJqSB9Om1DJkPg/aHL/2wZii
 RhlzifQRVCUM5VkhzPDPzZbBLzT7ShVkT3kJFUqcozb9NeHW0c9FWHHegKdiW0bJD3Ynm9YPvbRPa
 JY7DUwDKcK0pfJixZPGaCwXNUWeJxJgz1x+4MIQb2RJD6BTuSbesurMbM1IIOFlGa9LgFSmL0xRJ4
 tuQvAA4sNs8ngEmvofI94ZQS9rOrOTGif/4eq4zNMo9+uUtI7ECQIR3URh028QyXshZUuLeW2hlAS
 0bUOs8TQ==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf4C-005Sku-MS; Wed, 11 Jan 2023 18:39:13 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 11/13] drm/sti: Use the encoders' debugfs infrastructure
Date: Wed, 11 Jan 2023 14:37:46 -0300
Message-Id: <20230111173748.752659-12-mcanal@igalia.com>
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
 drivers/gpu/drm/sti/sti_tvout.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index 2499715a69b7..5601888caec4 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -496,8 +496,8 @@ static void tvout_dbg_hd_dac_cfg(struct seq_file *s, int val)
 
 static int tvout_dbg_show(struct seq_file *s, void *data)
 {
-	struct drm_info_node *node = s->private;
-	struct sti_tvout *tvout = (struct sti_tvout *)node->info_ent->data;
+	struct drm_debugfs_encoder_entry *entry = s->private;
+	struct sti_tvout *tvout = (struct sti_tvout *)entry->file.data;
 	struct drm_crtc *crtc;
 
 	seq_printf(s, "TVOUT: (vaddr = 0x%p)", tvout->regs);
@@ -566,20 +566,9 @@ static int tvout_dbg_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static struct drm_info_list tvout_debugfs_files[] = {
-	{ "tvout", tvout_dbg_show, 0, NULL },
-};
-
-static void tvout_debugfs_init(struct sti_tvout *tvout, struct drm_minor *minor)
+static void tvout_debugfs_init(struct sti_tvout *tvout, struct drm_encoder *encoder)
 {
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(tvout_debugfs_files); i++)
-		tvout_debugfs_files[i].data = tvout;
-
-	drm_debugfs_create_files(tvout_debugfs_files,
-				 ARRAY_SIZE(tvout_debugfs_files),
-				 minor->debugfs_root, minor);
+	drm_debugfs_encoder_add_file(encoder, "tvout", tvout_dbg_show, tvout);
 }
 
 static void sti_tvout_encoder_dpms(struct drm_encoder *encoder, int mode)
@@ -607,7 +596,7 @@ static int sti_tvout_late_register(struct drm_encoder *encoder)
 	if (tvout->debugfs_registered)
 		return 0;
 
-	tvout_debugfs_init(tvout, encoder->dev->primary);
+	tvout_debugfs_init(tvout, encoder);
 
 	tvout->debugfs_registered = true;
 	return 0;
-- 
2.39.0

