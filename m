Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF40C40533
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A826F10EAE6;
	Fri,  7 Nov 2025 14:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RUIjDtkE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Z/IMIdn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RUIjDtkE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2Z/IMIdn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B78510EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:26:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D3DC3211E6;
 Fri,  7 Nov 2025 14:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30p6DGTzodWistJvn41sxFejrL9hqXgES5amSqdrf/0=;
 b=RUIjDtkE2cyHarOk7m70l7EcWp2VL2u05aTmP5qN3+NHOUlBaxMBuOa/cHisYdonjhcJCD
 Yt5k8AffQ8nA36vHmWEkxlnUTTnIZFMSF+QdL8zOGXB87jtVtZwQjk1BD2We6Ec0DtQ/8a
 gONUotzJi5U8xoIMCoxXrAE4KlaVoFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30p6DGTzodWistJvn41sxFejrL9hqXgES5amSqdrf/0=;
 b=2Z/IMIdnmlGC3khe7mDKVBPDGIzMNvjKFxIX01miSszELPu3JM126jO9586zDxuZiHqkk0
 djKA5w2Ee2DHqPAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30p6DGTzodWistJvn41sxFejrL9hqXgES5amSqdrf/0=;
 b=RUIjDtkE2cyHarOk7m70l7EcWp2VL2u05aTmP5qN3+NHOUlBaxMBuOa/cHisYdonjhcJCD
 Yt5k8AffQ8nA36vHmWEkxlnUTTnIZFMSF+QdL8zOGXB87jtVtZwQjk1BD2We6Ec0DtQ/8a
 gONUotzJi5U8xoIMCoxXrAE4KlaVoFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525576;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30p6DGTzodWistJvn41sxFejrL9hqXgES5amSqdrf/0=;
 b=2Z/IMIdnmlGC3khe7mDKVBPDGIzMNvjKFxIX01miSszELPu3JM126jO9586zDxuZiHqkk0
 djKA5w2Ee2DHqPAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 882AD13A60;
 Fri,  7 Nov 2025 14:26:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GJMMIIgBDmkaLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Nov 2025 14:26:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/client: Pass force parameter to client restore
Date: Fri,  7 Nov 2025 15:19:25 +0100
Message-ID: <20251107142612.467817-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107142612.467817-1-tzimmermann@suse.de>
References: <20251107142612.467817-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linuxfoundation.org];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

Add force parameter to client restore and pass value through the
layers. The only currently used value is false.

If force is true, the client should restore its display even if it
does not hold the DRM master lock. This is be required for emergency
output, such as sysrq.

While at it, inline drm_fb_helper_lastclose(), which is a trivial
wrapper around drm_fb_helper_restore_fbdev_mode_unlocked().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_fbdev_client.c |  6 ++++--
 drivers/gpu/drm/drm_client_event.c         |  4 ++--
 drivers/gpu/drm/drm_fb_helper.c            | 24 ++++++----------------
 drivers/gpu/drm/drm_file.c                 |  2 +-
 include/drm/drm_client.h                   |  8 +++++---
 include/drm/drm_client_event.h             |  4 ++--
 include/drm/drm_fb_helper.h                |  8 ++------
 7 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/drm/clients/drm_fbdev_client.c
index 47e5f27eee58..28951e392482 100644
--- a/drivers/gpu/drm/clients/drm_fbdev_client.c
+++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
@@ -38,9 +38,11 @@ static void drm_fbdev_client_unregister(struct drm_client_dev *client)
 	}
 }
 
-static int drm_fbdev_client_restore(struct drm_client_dev *client)
+static int drm_fbdev_client_restore(struct drm_client_dev *client, bool force)
 {
-	drm_fb_helper_lastclose(client->dev);
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index d25dc5250983..7b3e362f7926 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -102,7 +102,7 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_client_dev_hotplug);
 
-void drm_client_dev_restore(struct drm_device *dev)
+void drm_client_dev_restore(struct drm_device *dev, bool force)
 {
 	struct drm_client_dev *client;
 	int ret;
@@ -115,7 +115,7 @@ void drm_client_dev_restore(struct drm_device *dev)
 		if (!client->funcs || !client->funcs->restore)
 			continue;
 
-		ret = client->funcs->restore(client);
+		ret = client->funcs->restore(client, force);
 		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 		if (!ret) /* The first one to return zero gets the privilege to restore */
 			break;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 53e9dc0543de..1392738ce2fe 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -255,6 +255,7 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
 /**
  * drm_fb_helper_restore_fbdev_mode_unlocked - restore fbdev configuration
  * @fb_helper: driver-allocated fbdev helper, can be NULL
+ * @force: ignore present DRM master
  *
  * This helper should be called from fbdev emulation's &drm_client_funcs.restore
  * callback. It ensures that the user isn't greeted with a black screen when the
@@ -263,9 +264,9 @@ __drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
  * Returns:
  * 0 on success, or a negative errno code otherwise.
  */
-int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper)
+int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper, bool force)
 {
-	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, false);
+	return __drm_fb_helper_restore_fbdev_mode_unlocked(fb_helper, force);
 }
 EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
 
@@ -1328,9 +1329,9 @@ int drm_fb_helper_set_par(struct fb_info *info)
 	 * the KDSET IOCTL with KD_TEXT, and only after that drops the master
 	 * status when exiting.
 	 *
-	 * In the past this was caught by drm_fb_helper_lastclose(), but on
-	 * modern systems where logind always keeps a drm fd open to orchestrate
-	 * the vt switching, this doesn't work.
+	 * In the past this was caught by drm_fb_helper_restore_fbdev_mode_unlocked(),
+	 * but on modern systems where logind always keeps a drm fd open to
+	 * orchestrate the vt switching, this doesn't work.
 	 *
 	 * To not break the userspace ABI we have this special case here, which
 	 * is only used for the above case. Everything else uses the normal
@@ -1955,16 +1956,3 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 	return 0;
 }
 EXPORT_SYMBOL(drm_fb_helper_hotplug_event);
-
-/**
- * drm_fb_helper_lastclose - DRM driver lastclose helper for fbdev emulation
- * @dev: DRM device
- *
- * This function is obsolete. Call drm_fb_helper_restore_fbdev_mode_unlocked()
- * instead.
- */
-void drm_fb_helper_lastclose(struct drm_device *dev)
-{
-	drm_fb_helper_restore_fbdev_mode_unlocked(dev->fb_helper);
-}
-EXPORT_SYMBOL(drm_fb_helper_lastclose);
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index eebd1a05ee97..be5e617ceb9f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -405,7 +405,7 @@ EXPORT_SYMBOL(drm_open);
 
 static void drm_lastclose(struct drm_device *dev)
 {
-	drm_client_dev_restore(dev);
+	drm_client_dev_restore(dev, false);
 
 	if (dev_is_pci(dev->dev))
 		vga_switcheroo_process_delayed_switch();
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 5ecde0f6f591..c972a8a3385b 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -57,12 +57,14 @@ struct drm_client_funcs {
 	 *
 	 * Note that the core does not guarantee exclusion against concurrent
 	 * drm_open(). Clients need to ensure this themselves, for example by
-	 * using drm_master_internal_acquire() and
-	 * drm_master_internal_release().
+	 * using drm_master_internal_acquire() and drm_master_internal_release().
+	 *
+	 * If the caller passes force, the client should ignore any present DRM
+	 * master and restore the display anyway.
 	 *
 	 * This callback is optional.
 	 */
-	int (*restore)(struct drm_client_dev *client);
+	int (*restore)(struct drm_client_dev *client, bool force);
 
 	/**
 	 * @hotplug:
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 985d6f02a4c4..79369c755bc9 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -10,7 +10,7 @@ struct drm_device;
 #if defined(CONFIG_DRM_CLIENT)
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
-void drm_client_dev_restore(struct drm_device *dev);
+void drm_client_dev_restore(struct drm_device *dev, bool force);
 void drm_client_dev_suspend(struct drm_device *dev);
 void drm_client_dev_resume(struct drm_device *dev);
 #else
@@ -18,7 +18,7 @@ static inline void drm_client_dev_unregister(struct drm_device *dev)
 { }
 static inline void drm_client_dev_hotplug(struct drm_device *dev)
 { }
-static inline void drm_client_dev_restore(struct drm_device *dev)
+static inline void drm_client_dev_restore(struct drm_device *dev, bool force)
 { }
 static inline void drm_client_dev_suspend(struct drm_device *dev)
 { }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index c1d38d54a112..63e3af8dd5ed 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -254,7 +254,8 @@ int drm_fb_helper_set_par(struct fb_info *info);
 int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
 			    struct fb_info *info);
 
-int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper);
+int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper,
+					      bool force);
 
 struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper);
 void drm_fb_helper_release_info(struct drm_fb_helper *fb_helper);
@@ -283,7 +284,6 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper);
 int drm_fb_helper_debug_enter(struct fb_info *info);
 int drm_fb_helper_debug_leave(struct fb_info *info);
-void drm_fb_helper_lastclose(struct drm_device *dev);
 #else
 static inline void drm_fb_helper_prepare(struct drm_device *dev,
 					 struct drm_fb_helper *helper,
@@ -409,10 +409,6 @@ static inline int drm_fb_helper_debug_leave(struct fb_info *info)
 {
 	return 0;
 }
-
-static inline void drm_fb_helper_lastclose(struct drm_device *dev)
-{
-}
 #endif
 
 #endif
-- 
2.51.1

