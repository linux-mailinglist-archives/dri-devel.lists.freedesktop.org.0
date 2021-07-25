Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED633D4F3B
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3436E43F;
	Sun, 25 Jul 2021 17:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB086E441
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:44:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C36111FE1F;
 Sun, 25 Jul 2021 17:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627235083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzmSLwzWbVTMO9Yz181cTmwvP8FysWwcJYqdecOPxs0=;
 b=IcGH+XxoQ2wPytAqxKdR4Dsi3WuopBJJf8888okdz1OPzBUzakWn4X76uxEFMKvW1YG+8e
 GJZue+1YSRCb+XUEMKddnCN90mcUz0ZDLXcF3qnaJi8nYf7JagjvR/Aw5JqnPiVtYw58QC
 w+wbnfs17f6gLwkfmWjPpTo2xH/N6tA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627235083;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gzmSLwzWbVTMO9Yz181cTmwvP8FysWwcJYqdecOPxs0=;
 b=Fkcvz/jkDKgnPPuxlBsEMcowgTjOObMNC/nbFm4irHzm992e6JEReEwi5am/+MqQ7vnw8m
 YhnH7M44oTakidDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8ECF313A1A;
 Sun, 25 Jul 2021 17:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uPzxIQuj/WCmMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 25 Jul 2021 17:44:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v2 5/5] drm/vkms: Map output framebuffer BOs with
 drm_gem_fb_vmap()
Date: Sun, 25 Jul 2021 19:44:38 +0200
Message-Id: <20210725174438.24493-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725174438.24493-1-tzimmermann@suse.de>
References: <20210725174438.24493-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Abstract the framebuffer details by mappings its BOs with a call
to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunamp().

Before, the output address with stored as raw pointer in the priv
field of struct drm_writeback_job. Introduce the new type
struct vkms_writeback_job, which holds the output mappings addresses
while the writeback job is active.

The patchset also cleans up some internal casting an setup of the
output addresses. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  6 +++++-
 drivers/gpu/drm/vkms/vkms_writeback.c | 21 ++++++++++-----------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index ead8fff81f30..49f109c3a2b3 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -257,7 +257,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback;
+		vaddr_out = crtc_state->active_writeback->map[0].vaddr;
 
 	ret = compose_active_planes(&vaddr_out, primary_composer,
 				    crtc_state);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8c731b6dcba7..8bc9e3f52e1f 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -20,6 +20,10 @@
 #define XRES_MAX  8192
 #define YRES_MAX  8192
 
+struct vkms_writeback_job {
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+};
+
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
@@ -57,7 +61,7 @@ struct vkms_crtc_state {
 	int num_active_planes;
 	/* stack of active planes for crc computation, should be in z order */
 	struct vkms_plane_state **active_planes;
-	void *active_writeback;
+	struct vkms_writeback_job *active_writeback;
 
 	/* below four are protected by vkms_output.composer_lock */
 	bool crc_pending;
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 0935686475a0..765bb85ba76c 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -65,21 +65,23 @@ static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 			       struct drm_writeback_job *job)
 {
-	struct drm_gem_object *gem_obj;
-	struct dma_buf_map map;
+	struct vkms_writeback_job *vkmsjob;
 	int ret;
 
 	if (!job->fb)
 		return 0;
 
-	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
-	ret = drm_gem_shmem_vmap(gem_obj, &map);
+	vkmsjob = kzalloc(sizeof(*vkmsjob), GFP_KERNEL);
+	if (!vkmsjob)
+		return -ENOMEM;
+
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		return ret;
 	}
 
-	job->priv = map.vaddr;
+	job->priv = vkmsjob;
 
 	return 0;
 }
@@ -87,18 +89,15 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 				struct drm_writeback_job *job)
 {
-	struct drm_gem_object *gem_obj;
+	struct vkms_writeback_job *vkmsjob = job->priv;
 	struct vkms_device *vkmsdev;
-	struct dma_buf_map map;
 
 	if (!job->fb)
 		return;
 
-	gem_obj = drm_gem_fb_get_obj(job->fb, 0);
-	dma_buf_map_set_vaddr(&map, job->priv);
-	drm_gem_shmem_vunmap(gem_obj, &map);
+	drm_gem_fb_vunmap(job->fb, vkmsjob->map);
 
-	vkmsdev = drm_device_to_vkms_device(gem_obj->dev);
+	vkmsdev = drm_device_to_vkms_device(job->fb->dev);
 	vkms_set_composer(&vkmsdev->output, false);
 }
 
-- 
2.32.0

