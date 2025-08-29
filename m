Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B53B3B6E7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:17:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5E0310EB72;
	Fri, 29 Aug 2025 09:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="dgrQH8kR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Z0/s6Z9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dgrQH8kR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3Z0/s6Z9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3591D10E124
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:17:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9B1765BF96;
 Fri, 29 Aug 2025 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756459054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CWQr3MM4ZUYgJ8qKDrjxba4oYvnTyGS+2E+MEV6S3ZQ=;
 b=dgrQH8kRIUCVG26GBX1l8JGACf+O/A+VyCq477gnYdSAVh1dGZpsX7JGGKtDbPQYYQqNlX
 sdZl6jhE0J7ZIkLiiGDP6rdk+LB4Pj4KoKiTABweU/ZZimju8MCO/3qZmN3wLLQQyRZfJz
 GjKF5JgWkRJV+2qPKm6rQ8onucHIib0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756459054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CWQr3MM4ZUYgJ8qKDrjxba4oYvnTyGS+2E+MEV6S3ZQ=;
 b=3Z0/s6Z90PGz3KD4dlFIJ6DyEYY0F9sBzbbagJk1xXP+sNZk6s7JaC9lvo9phAeRZEx61m
 FF5ECN2uj7/3rkDg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dgrQH8kR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="3Z0/s6Z9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756459054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CWQr3MM4ZUYgJ8qKDrjxba4oYvnTyGS+2E+MEV6S3ZQ=;
 b=dgrQH8kRIUCVG26GBX1l8JGACf+O/A+VyCq477gnYdSAVh1dGZpsX7JGGKtDbPQYYQqNlX
 sdZl6jhE0J7ZIkLiiGDP6rdk+LB4Pj4KoKiTABweU/ZZimju8MCO/3qZmN3wLLQQyRZfJz
 GjKF5JgWkRJV+2qPKm6rQ8onucHIib0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756459054;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CWQr3MM4ZUYgJ8qKDrjxba4oYvnTyGS+2E+MEV6S3ZQ=;
 b=3Z0/s6Z90PGz3KD4dlFIJ6DyEYY0F9sBzbbagJk1xXP+sNZk6s7JaC9lvo9phAeRZEx61m
 FF5ECN2uj7/3rkDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 635FD13326;
 Fri, 29 Aug 2025 09:17:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HzIZFy5wsWhPLwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Aug 2025 09:17:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, javierm@redhat.com,
 sam@ravnborg.org, simona@ffwll.ch, airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4] drm/fb-helper: Synchronize dirty worker with vblank
Date: Fri, 29 Aug 2025 11:13:45 +0200
Message-ID: <20250829091447.46719-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,redhat.com,ravnborg.org,ffwll.ch,gmail.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9B1765BF96
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Before updating the display from the console's shadow buffer, the dirty
worker now waits for a vblank. This allows several screen updates to pile
up and acts as a rate limiter. If a DRM master is present, it could
interfere with the vblank. Don't wait in this case.

v4:
	* share code with WAITFORVSYNC ioctl (Emil)
	* use lock guard
v3:
	* add back helper->lock
	* acquire DRM master status while waiting for vblank
v2:
	* don't hold helper->lock while waiting for vblank

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
The previous reviews of this patch can be found as part of the series at
https://patchwork.freedesktop.org/series/66442/#rev3 .
---
 drivers/gpu/drm/drm_client_modeset.c | 44 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c      | 30 ++++---------------
 include/drm/drm_client.h             |  1 +
 3 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 9c2c3b0c8c47..fc4caf7da5fc 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1293,6 +1293,50 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 }
 EXPORT_SYMBOL(drm_client_modeset_dpms);
 
+/**
+ * drm_client_modeset_wait_for_vblank() - Wait for the next VBLANK to occur
+ * @client: DRM client
+ * @crtc_index: The ndex of the CRTC to wait on
+ *
+ * Block the caller until the given CRTC has seen a VBLANK. Do nothing
+ * if the CRTC is disabled. If there's another DRM master present, fail
+ * with -EBUSY.
+ *
+ * Returns:
+ * 0 on success, or negative error code otherwise.
+ */
+int drm_client_modeset_wait_for_vblank(struct drm_client_dev *client, unsigned int crtc_index)
+{
+	struct drm_device *dev = client->dev;
+	struct drm_crtc *crtc;
+	int ret;
+
+	/*
+	 * Rate-limit update frequency to vblank. If there's a DRM master
+	 * present, it could interfere while we're waiting for the vblank
+	 * event. Don't wait in this case.
+	 */
+	if (!drm_master_internal_acquire(dev))
+		return -EBUSY;
+
+	crtc = client->modesets[crtc_index].crtc;
+
+	/*
+	 * Only wait for a vblank event if the CRTC is enabled, otherwise
+	 * just don't do anything, not even report an error.
+	 */
+	ret = drm_crtc_vblank_get(crtc);
+	if (!ret) {
+		drm_crtc_wait_one_vblank(crtc);
+		drm_crtc_vblank_put(crtc);
+	}
+
+	drm_master_internal_release(dev);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_client_modeset_wait_for_vblank);
+
 #ifdef CONFIG_DRM_KUNIT_TEST
 #include "tests/drm_client_modeset_test.c"
 #endif
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 11a5b60cb9ce..53e9dc0543de 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -368,6 +368,10 @@ static void drm_fb_helper_fb_dirty(struct drm_fb_helper *helper)
 	unsigned long flags;
 	int ret;
 
+	mutex_lock(&helper->lock);
+	drm_client_modeset_wait_for_vblank(&helper->client, 0);
+	mutex_unlock(&helper->lock);
+
 	if (drm_WARN_ON_ONCE(dev, !helper->funcs->fb_dirty))
 		return;
 
@@ -1068,15 +1072,9 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 			unsigned long arg)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_crtc *crtc;
 	int ret = 0;
 
-	mutex_lock(&fb_helper->lock);
-	if (!drm_master_internal_acquire(dev)) {
-		ret = -EBUSY;
-		goto unlock;
-	}
+	guard(mutex)(&fb_helper->lock);
 
 	switch (cmd) {
 	case FBIO_WAITFORVSYNC:
@@ -1096,28 +1094,12 @@ int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 		 * make. If we're not smart enough here, one should
 		 * just consider switch the userspace to KMS.
 		 */
-		crtc = fb_helper->client.modesets[0].crtc;
-
-		/*
-		 * Only wait for a vblank event if the CRTC is
-		 * enabled, otherwise just don't do anythintg,
-		 * not even report an error.
-		 */
-		ret = drm_crtc_vblank_get(crtc);
-		if (!ret) {
-			drm_crtc_wait_one_vblank(crtc);
-			drm_crtc_vblank_put(crtc);
-		}
-
-		ret = 0;
+		ret = drm_client_modeset_wait_for_vblank(&fb_helper->client, 0);
 		break;
 	default:
 		ret = -ENOTTY;
 	}
 
-	drm_master_internal_release(dev);
-unlock:
-	mutex_unlock(&fb_helper->lock);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fb_helper_ioctl);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 146ca80e35db..bdd845e383ef 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -220,6 +220,7 @@ int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
+int drm_client_modeset_wait_for_vblank(struct drm_client_dev *client, unsigned int crtc_index);
 
 /**
  * drm_client_for_each_modeset() - Iterate over client modesets
-- 
2.50.1

