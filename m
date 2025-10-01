Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622C5BB04D3
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C3D10E6CD;
	Wed,  1 Oct 2025 12:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="i9Ogzb3K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukogHI2z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i9Ogzb3K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ukogHI2z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F89310E06D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 12:19:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 855581F80F;
 Wed,  1 Oct 2025 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759321137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UvNqxy9SfcL5wzPG2sM3K+77DZbvMc4NGq38UvRrrJk=;
 b=i9Ogzb3KhP3BtpBbwxAoetl9kDwaR71evGFF+qwdcFbAjkGZbsPcPyX61Fy2FS7/MC9YwV
 IagPI7mmoc6LN+qJO946G+Gr6NDsiJnP6axcrypZRI91EVBQkQp0tie0k81aS0heYqawsL
 +IvjMHDASQUo1jocz8PdXw/S9NM8Kow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759321137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UvNqxy9SfcL5wzPG2sM3K+77DZbvMc4NGq38UvRrrJk=;
 b=ukogHI2z7Ccdwm3ddE40MxNIZL9s8yjaV6mHsroitkLARrCxWqEKj2yFpukdWlY029aBNY
 4HC//fEoWF2CUGBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759321137; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UvNqxy9SfcL5wzPG2sM3K+77DZbvMc4NGq38UvRrrJk=;
 b=i9Ogzb3KhP3BtpBbwxAoetl9kDwaR71evGFF+qwdcFbAjkGZbsPcPyX61Fy2FS7/MC9YwV
 IagPI7mmoc6LN+qJO946G+Gr6NDsiJnP6axcrypZRI91EVBQkQp0tie0k81aS0heYqawsL
 +IvjMHDASQUo1jocz8PdXw/S9NM8Kow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759321137;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UvNqxy9SfcL5wzPG2sM3K+77DZbvMc4NGq38UvRrrJk=;
 b=ukogHI2z7Ccdwm3ddE40MxNIZL9s8yjaV6mHsroitkLARrCxWqEKj2yFpukdWlY029aBNY
 4HC//fEoWF2CUGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0865513A42;
 Wed,  1 Oct 2025 12:18:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rdejADEc3WhKewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Oct 2025 12:18:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, lyude@redhat.com,
 dakr@kernel.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/client: Remove holds_console_lock parameter from
 suspend/resume
Date: Wed,  1 Oct 2025 14:15:16 +0200
Message-ID: <20251001121610.367243-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_TWELVE(0.00)[18];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

No caller of the client resume/suspend helpers holds the console
lock. The last such cases were removed from radeon in the patch
series at [1]. Now remove the related parameter and the TODO items.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/series/151624/ # [1]
---
This patch would preferably be merged through drm-misc.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  8 ++++----
 drivers/gpu/drm/clients/drm_fbdev_client.c | 14 ++++----------
 drivers/gpu/drm/clients/drm_log.c          |  4 ++--
 drivers/gpu/drm/drm_client_event.c         | 16 ++++++++--------
 drivers/gpu/drm/drm_modeset_helper.c       |  6 +++---
 drivers/gpu/drm/i915/i915_driver.c         |  6 +++---
 drivers/gpu/drm/nouveau/nouveau_display.c  |  4 ++--
 drivers/gpu/drm/radeon/radeon_device.c     |  4 ++--
 drivers/gpu/drm/xe/display/xe_display.c    |  6 +++---
 include/drm/drm_client.h                   | 14 ++------------
 include/drm/drm_client_event.h             |  4 ++--
 11 files changed, 35 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index a77000c2e0bb..f068e26d5080 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -5212,7 +5212,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool notify_clients)
 		dev_warn(adev->dev, "smart shift update failed\n");
 
 	if (notify_clients)
-		drm_client_dev_suspend(adev_to_drm(adev), false);
+		drm_client_dev_suspend(adev_to_drm(adev));
 
 	cancel_delayed_work_sync(&adev->delayed_init_work);
 
@@ -5346,7 +5346,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
 	flush_delayed_work(&adev->delayed_init_work);
 
 	if (notify_clients)
-		drm_client_dev_resume(adev_to_drm(adev), false);
+		drm_client_dev_resume(adev_to_drm(adev));
 
 	amdgpu_ras_resume(adev);
 
@@ -5951,7 +5951,7 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
-				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
+				drm_client_dev_resume(adev_to_drm(tmp_adev));
 
 				/*
 				 * The GPU enters bad state once faulty pages
@@ -6286,7 +6286,7 @@ static void amdgpu_device_halt_activities(struct amdgpu_device *adev,
 		 */
 		amdgpu_unregister_gpu_instance(tmp_adev);
 
-		drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
+		drm_client_dev_suspend(adev_to_drm(tmp_adev));
 
 		/* disable ras on ALL IPs */
 		if (!need_emergency_restart && !amdgpu_reset_in_dpc(adev) &&
diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index f894ba52bdb5..ec5ab9f30547 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -62,26 +62,20 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	return ret;
 }
 
-static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+static int drm_fbdev_client_suspend(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (holds_console_lock)
-		drm_fb_helper_set_suspend(fb_helper, true);
-	else
-		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
+	drm_fb_helper_set_suspend_unlocked(fb_helper, true);
 
 	return 0;
 }
 
-static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+static int drm_fbdev_client_resume(struct drm_client_dev *client)
 {
 	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
 
-	if (holds_console_lock)
-		drm_fb_helper_set_suspend(fb_helper, false);
-	else
-		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
+	drm_fb_helper_set_suspend_unlocked(fb_helper, false);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index d239f1e3c456..fd8556dd58ed 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -319,7 +319,7 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
 	return 0;
 }
 
-static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
+static int drm_log_client_suspend(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
 
@@ -328,7 +328,7 @@ static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_l
 	return 0;
 }
 
-static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lock)
+static int drm_log_client_resume(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
 
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index c83196ad8b59..c3baeb4d4e6b 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -122,7 +122,7 @@ void drm_client_dev_restore(struct drm_device *dev)
 	mutex_unlock(&dev->clientlist_mutex);
 }
 
-static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+static int drm_client_suspend(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
 	int ret = 0;
@@ -131,7 +131,7 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
 		return 0;
 
 	if (client->funcs && client->funcs->suspend)
-		ret = client->funcs->suspend(client, holds_console_lock);
+		ret = client->funcs->suspend(client);
 	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 
 	client->suspended = true;
@@ -139,20 +139,20 @@ static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_
 	return ret;
 }
 
-void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
+void drm_client_dev_suspend(struct drm_device *dev)
 {
 	struct drm_client_dev *client;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_for_each_entry(client, &dev->clientlist, list) {
 		if (!client->suspended)
-			drm_client_suspend(client, holds_console_lock);
+			drm_client_suspend(client);
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
 EXPORT_SYMBOL(drm_client_dev_suspend);
 
-static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+static int drm_client_resume(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
 	int ret = 0;
@@ -161,7 +161,7 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
 		return 0;
 
 	if (client->funcs && client->funcs->resume)
-		ret = client->funcs->resume(client, holds_console_lock);
+		ret = client->funcs->resume(client);
 	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 
 	client->suspended = false;
@@ -172,14 +172,14 @@ static int drm_client_resume(struct drm_client_dev *client, bool holds_console_l
 	return ret;
 }
 
-void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
+void drm_client_dev_resume(struct drm_device *dev)
 {
 	struct drm_client_dev *client;
 
 	mutex_lock(&dev->clientlist_mutex);
 	list_for_each_entry(client, &dev->clientlist, list) {
 		if  (client->suspended)
-			drm_client_resume(client, holds_console_lock);
+			drm_client_resume(client);
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 988735560570..a57f6a10ada4 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -203,10 +203,10 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
 	if (dev->mode_config.poll_enabled)
 		drm_kms_helper_poll_disable(dev);
 
-	drm_client_dev_suspend(dev, false);
+	drm_client_dev_suspend(dev);
 	state = drm_atomic_helper_suspend(dev);
 	if (IS_ERR(state)) {
-		drm_client_dev_resume(dev, false);
+		drm_client_dev_resume(dev);
 
 		/*
 		 * Don't enable polling if it was never initialized
@@ -252,7 +252,7 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
 		DRM_ERROR("Failed to resume (%d)\n", ret);
 	dev->mode_config.suspend_state = NULL;
 
-	drm_client_dev_resume(dev, false);
+	drm_client_dev_resume(dev);
 
 	/*
 	 * Don't enable polling if it is not initialized
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 95165e45de74..162e50315beb 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -978,7 +978,7 @@ void i915_driver_shutdown(struct drm_i915_private *i915)
 	intel_runtime_pm_disable(&i915->runtime_pm);
 	intel_power_domains_disable(display);
 
-	drm_client_dev_suspend(&i915->drm, false);
+	drm_client_dev_suspend(&i915->drm);
 	if (intel_display_device_present(display)) {
 		drm_kms_helper_poll_disable(&i915->drm);
 		intel_display_driver_disable_user_access(display);
@@ -1060,7 +1060,7 @@ static int i915_drm_suspend(struct drm_device *dev)
 	/* We do a lot of poking in a lot of registers, make sure they work
 	 * properly. */
 	intel_power_domains_disable(display);
-	drm_client_dev_suspend(dev, false);
+	drm_client_dev_suspend(dev);
 	if (intel_display_device_present(display)) {
 		drm_kms_helper_poll_disable(dev);
 		intel_display_driver_disable_user_access(display);
@@ -1257,7 +1257,7 @@ static int i915_drm_resume(struct drm_device *dev)
 
 	intel_opregion_resume(display);
 
-	drm_client_dev_resume(dev, false);
+	drm_client_dev_resume(dev);
 
 	intel_power_domains_enable(display);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 54aed3656a4c..00515623a2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -765,7 +765,7 @@ nouveau_display_suspend(struct drm_device *dev, bool runtime)
 {
 	struct nouveau_display *disp = nouveau_display(dev);
 
-	drm_client_dev_suspend(dev, false);
+	drm_client_dev_suspend(dev);
 
 	if (drm_drv_uses_atomic_modeset(dev)) {
 		if (!runtime) {
@@ -796,7 +796,7 @@ nouveau_display_resume(struct drm_device *dev, bool runtime)
 		}
 	}
 
-	drm_client_dev_resume(dev, false);
+	drm_client_dev_resume(dev);
 }
 
 int
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 9e35b14e2bf0..60afaa8e56b4 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1635,7 +1635,7 @@ int radeon_suspend_kms(struct drm_device *dev, bool suspend,
 	}
 
 	if (notify_clients)
-		drm_client_dev_suspend(dev, false);
+		drm_client_dev_suspend(dev);
 
 	return 0;
 }
@@ -1739,7 +1739,7 @@ int radeon_resume_kms(struct drm_device *dev, bool resume, bool notify_clients)
 		radeon_pm_compute_clocks(rdev);
 
 	if (notify_clients)
-		drm_client_dev_resume(dev, false);
+		drm_client_dev_resume(dev);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
index 19e691fccf8c..d3cc6181842c 100644
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@ -324,7 +324,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
 	 * properly.
 	 */
 	intel_power_domains_disable(display);
-	drm_client_dev_suspend(&xe->drm, false);
+	drm_client_dev_suspend(&xe->drm);
 
 	if (intel_display_device_present(display)) {
 		drm_kms_helper_poll_disable(&xe->drm);
@@ -356,7 +356,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
 		return;
 
 	intel_power_domains_disable(display);
-	drm_client_dev_suspend(&xe->drm, false);
+	drm_client_dev_suspend(&xe->drm);
 
 	if (intel_display_device_present(display)) {
 		drm_kms_helper_poll_disable(&xe->drm);
@@ -481,7 +481,7 @@ void xe_display_pm_resume(struct xe_device *xe)
 
 	intel_opregion_resume(display);
 
-	drm_client_dev_resume(&xe->drm, false);
+	drm_client_dev_resume(&xe->drm);
 
 	intel_power_domains_enable(display);
 }
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bdd845e383ef..3556928d3938 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -70,13 +70,8 @@ struct drm_client_funcs {
 	 * Called when suspending the device.
 	 *
 	 * This callback is optional.
-	 *
-	 * FIXME: Some callers hold the console lock when invoking this
-	 *        function. This interferes with fbdev emulation, which
-	 *        also tries to acquire the lock. Push the console lock
-	 *        into the callback and remove 'holds_console_lock'.
 	 */
-	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
+	int (*suspend)(struct drm_client_dev *client);
 
 	/**
 	 * @resume:
@@ -84,13 +79,8 @@ struct drm_client_funcs {
 	 * Called when resuming the device from suspend.
 	 *
 	 * This callback is optional.
-	 *
-	 * FIXME: Some callers hold the console lock when invoking this
-	 *        function. This interferes with fbdev emulation, which
-	 *        also tries to acquire the lock. Push the console lock
-	 *        into the callback and remove 'holds_console_lock'.
 	 */
-	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
+	int (*resume)(struct drm_client_dev *client);
 };
 
 /**
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 1d544d3a3228..c3f318788b71 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -11,8 +11,8 @@ struct drm_device;
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
 void drm_client_dev_restore(struct drm_device *dev);
-void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
-void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
+void drm_client_dev_suspend(struct drm_device *dev);
+void drm_client_dev_resume(struct drm_device *dev);
 #else
 static inline void drm_client_dev_unregister(struct drm_device *dev)
 { }
-- 
2.51.0

