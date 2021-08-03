Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFE83DEE96
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371196E858;
	Tue,  3 Aug 2021 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084026E853
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 12:59:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91337200CF;
 Tue,  3 Aug 2021 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627995576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7ylt/LkXCFDYa0trOnuiQMZfBkOMCMsvTE5vWeTxxo=;
 b=03nHvHKcmElHbm95QNo2MKi4qepvs2P2xu9gsNwgST1B8H8y5nhu/OJPvkABzNbq2kYt0q
 OSVSf6jBKduaNFLtfhSe9+yNqZrqloTQ7VjI7xOasOrxJollu2r4AJuwiGnPy0MM8OGi7Y
 iG/+kAmtLPsmCXcCG8lA0q8ko+mDaeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627995576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W7ylt/LkXCFDYa0trOnuiQMZfBkOMCMsvTE5vWeTxxo=;
 b=+sLddtzuh2lb/DJOhOg7H28j5jphT87tEFrrijEV4Z6O6Cd5eIJ1bWiB67MhmrbM+4Uona
 a0JI8LUeE2xPswCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 19A2E13CD6;
 Tue,  3 Aug 2021 12:59:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ELDgBLg9CWExZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 12:59:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 drawat.floss@gmail.com, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/11] drm/vkms: Use offset-adjusted shadow-plane mappings and
 output
Date: Tue,  3 Aug 2021 14:59:28 +0200
Message-Id: <20210803125928.27780-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210803125928.27780-1-tzimmermann@suse.de>
References: <20210803125928.27780-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For framebuffers with non-zero offset fields, shadow-plane helpers
provide a pointer to the first byte of the contained data. Use it in
vkms.

Also provide use the offset-adjusted data address for the writeback
job's output buffers. Output framebuffers with non-zero offsets now
have their content written to the correct location.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vkms/vkms_composer.c  | 2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 1 +
 drivers/gpu/drm/vkms/vkms_plane.c     | 2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 49f109c3a2b3..9e8204be9a14 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -257,7 +257,7 @@ void vkms_composer_worker(struct work_struct *work)
 		return;
 
 	if (wb_pending)
-		vaddr_out = crtc_state->active_writeback->map[0].vaddr;
+		vaddr_out = crtc_state->active_writeback->data[0].vaddr;
 
 	ret = compose_active_planes(&vaddr_out, primary_composer,
 				    crtc_state);
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8bc9e3f52e1f..d48c23d40ce5 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -22,6 +22,7 @@
 
 struct vkms_writeback_job {
 	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
+	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
 };
 
 struct vkms_composer {
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 8a56fbf572b0..32409e15244b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -111,7 +111,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 	memcpy(&composer->src, &new_state->src, sizeof(struct drm_rect));
 	memcpy(&composer->dst, &new_state->dst, sizeof(struct drm_rect));
 	memcpy(&composer->fb, fb, sizeof(struct drm_framebuffer));
-	memcpy(&composer->map, &shadow_plane_state->map, sizeof(composer->map));
+	memcpy(&composer->map, &shadow_plane_state->data, sizeof(composer->map));
 	drm_framebuffer_get(&composer->fb);
 	composer->offset = fb->offsets[0];
 	composer->pitch = fb->pitches[0];
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 3a8e2ed93e7c..8694227f555f 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -75,7 +75,7 @@ static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
 	if (!vkmsjob)
 		return -ENOMEM;
 
-	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, NULL);
+	ret = drm_gem_fb_vmap(job->fb, vkmsjob->map, vkmsjob->data);
 	if (ret) {
 		DRM_ERROR("vmap failed: %d\n", ret);
 		goto err_kfree;
-- 
2.32.0

