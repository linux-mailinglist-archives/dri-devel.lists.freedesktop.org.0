Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCE98D427
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F31110E73C;
	Wed,  2 Oct 2024 13:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pXKYg3Vs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mL6Ek96K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSEObPvk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8+a8GFai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DE510E72E;
 Wed,  2 Oct 2024 13:13:15 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E45C021C68;
 Wed,  2 Oct 2024 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtOoTi2Jkxhz7dyzOEGf0fnikaCMvA+qBc+jw1fPK20=;
 b=pXKYg3Vsr9XXKcmuNzAlsUqA0qo2jU77hJcX3aGXi1FRts5NZ3KhmhzSYTGPlipYhczwIp
 ZACb3pvfLxQyP1t0ThIYSHA9J6Ea6fz2BRPtCPAzGxue/udFAC3hWeKHkZ6QZLLag+4J5w
 f5mj5lfOz8Io1iBBSC/ApQQdG4EE0QM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtOoTi2Jkxhz7dyzOEGf0fnikaCMvA+qBc+jw1fPK20=;
 b=mL6Ek96KH5Lq3gJz/Xmga6nC7s5tTfCL5oLP+DjaEXfCZIydWLhGAMCyla4WvFw6D84yKS
 iwkSR7xv0qTD3NAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sSEObPvk;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8+a8GFai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtOoTi2Jkxhz7dyzOEGf0fnikaCMvA+qBc+jw1fPK20=;
 b=sSEObPvktN+112YNk/J+kQNQ7kKBrzngb2BvL1w74vZ6hVqfHb7nWeLfTuMkcBfVnPsS10
 /iuoe18GlgTOG1gfZUvLlWlzGRpTJ8DkW9NGXOSXMCuj1OQRCNkpQcoVBQEmkZuhmz0ps3
 tWF9t1H5+Y02xYrqrLCa71DtyZyGox8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KtOoTi2Jkxhz7dyzOEGf0fnikaCMvA+qBc+jw1fPK20=;
 b=8+a8GFaiA9ntpxXujSzfPOqu1Cx0MBfLagEBB2t36QPoJT348Qlf7jFGsaH753QL40UQo1
 0ecCyQsSpHaWWmDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 939EE13A91;
 Wed,  2 Oct 2024 13:13:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aKDFIulG/Wa/GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 13:13:13 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
Subject: [PATCH v2 09/11] drm/radeon: Suspend and resume clients with client
 helpers
Date: Wed,  2 Oct 2024 15:04:35 +0200
Message-ID: <20241002131306.288618-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241002131306.288618-1-tzimmermann@suse.de>
References: <20241002131306.288618-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E45C021C68
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 
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

Replace calls to drm_fb_helper_set_suspend() with calls to the client
functions drm_client_dev_suspend() and drm_client_dev_resume(). Any
registered in-kernel client will now receive suspend and resume events.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
---
 drivers/gpu/drm/radeon/radeon_device.c | 19 ++++++++++---------
 drivers/gpu/drm/radeon/radeon_fbdev.c  |  6 ------
 drivers/gpu/drm/radeon/radeon_mode.h   |  3 ---
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 554b236c2328..6f071e61f764 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -35,6 +35,7 @@
 #include <linux/vgaarb.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
@@ -1542,7 +1543,7 @@ void radeon_device_fini(struct radeon_device *rdev)
  * Called at driver suspend.
  */
 int radeon_suspend_kms(struct drm_device *dev, bool suspend,
-		       bool fbcon, bool freeze)
+		       bool notify_clients, bool freeze)
 {
 	struct radeon_device *rdev;
 	struct pci_dev *pdev;
@@ -1634,9 +1635,9 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 		pci_set_power_state(pdev, PCI_D3hot);
 	}
 
-	if (fbcon) {
+	if (notify_clients) {
 		console_lock();
-		radeon_fbdev_set_suspend(rdev, 1);
+		drm_client_dev_suspend(dev, true);
 		console_unlock();
 	}
 	return 0;
@@ -1649,7 +1650,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
  * Returns 0 for success or an error on failure.
  * Called at driver resume.
  */
-int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
+int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
 {
 	struct drm_connector *connector;
 	struct radeon_device *rdev = dev->dev_private;
@@ -1660,14 +1661,14 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
 		return 0;
 
-	if (fbcon) {
+	if (notify_clients) {
 		console_lock();
 	}
 	if (resume) {
 		pci_set_power_state(pdev, PCI_D0);
 		pci_restore_state(pdev);
 		if (pci_enable_device(pdev)) {
-			if (fbcon)
+			if (notify_clients)
 				console_unlock();
 			return -1;
 		}
@@ -1730,7 +1731,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	/* reset hpd state */
 	radeon_hpd_init(rdev);
 	/* blat the mode back in */
-	if (fbcon) {
+	if (notify_clients) {
 		drm_helper_resume_force_mode(dev);
 		/* turn on display hw */
 		drm_modeset_lock_all(dev);
@@ -1746,8 +1747,8 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon)
 	if ((rdev->pm.pm_method == PM_METHOD_DPM) && rdev->pm.dpm_enabled)
 		radeon_pm_compute_clocks(rdev);
 
-	if (fbcon) {
-		radeon_fbdev_set_suspend(rdev, 0);
+	if (notify_clients) {
+		drm_client_dev_resume(dev, true);
 		console_unlock();
 	}
 
diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 0aa20c8df546..d4a58bd679db 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -288,12 +288,6 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
-{
-	if (rdev_to_drm(rdev)->fb_helper)
-		drm_fb_helper_set_suspend(rdev_to_drm(rdev)->fb_helper, state);
-}
-
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
 	struct drm_fb_helper *fb_helper = rdev_to_drm(rdev)->fb_helper;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 12a1d99a1815..4063d3801e81 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -942,13 +942,10 @@ int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes);
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = radeon_fbdev_driver_fbdev_probe
-void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
 #else
 #define RADEON_FBDEV_DRIVER_OPS \
 	.fbdev_probe = NULL
-static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
-{ }
 static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
 {
 	return false;
-- 
2.46.0

