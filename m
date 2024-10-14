Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC099C45B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 10:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B53810E3FD;
	Mon, 14 Oct 2024 08:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xYdXVjZe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrZWmRuu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xYdXVjZe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PrZWmRuu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E13E10E3EA;
 Mon, 14 Oct 2024 08:57:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B65B21C36;
 Mon, 14 Oct 2024 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3szjnAHWrG6zV13o5SF+WK9fyL5tCBRyGd0lY13/Dok=;
 b=xYdXVjZewZS3CUcLGBquvh/5N3bctJMmCxz5ecMeqUtGr+8XXDyv/W9CSslz+odXDSApXc
 spRDh9tsmvUSy11PPVm3zEt9cxZ+wYKWXZ9WKQ9Pw2nuwPbMbK2ow2/AOGhC4Rpzjxaupn
 8aB4IDVXUUDmlsxPHU9y6RGMGX6BCdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3szjnAHWrG6zV13o5SF+WK9fyL5tCBRyGd0lY13/Dok=;
 b=PrZWmRuubob8H3QAOSx5a50axUlDzFWEmPhsBU5XHhI+PXX5Ankd4lsUxGYiMejsC726OW
 zcTc9I6Re9L95JAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xYdXVjZe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PrZWmRuu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1728896268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3szjnAHWrG6zV13o5SF+WK9fyL5tCBRyGd0lY13/Dok=;
 b=xYdXVjZewZS3CUcLGBquvh/5N3bctJMmCxz5ecMeqUtGr+8XXDyv/W9CSslz+odXDSApXc
 spRDh9tsmvUSy11PPVm3zEt9cxZ+wYKWXZ9WKQ9Pw2nuwPbMbK2ow2/AOGhC4Rpzjxaupn
 8aB4IDVXUUDmlsxPHU9y6RGMGX6BCdk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1728896268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3szjnAHWrG6zV13o5SF+WK9fyL5tCBRyGd0lY13/Dok=;
 b=PrZWmRuubob8H3QAOSx5a50axUlDzFWEmPhsBU5XHhI+PXX5Ankd4lsUxGYiMejsC726OW
 zcTc9I6Re9L95JAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAB9F13A79;
 Mon, 14 Oct 2024 08:57:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YLA3MAvdDGfXfAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Oct 2024 08:57:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v4 07/12] drm/client: Move suspend/resume into DRM client
 callbacks
Date: Mon, 14 Oct 2024 10:55:21 +0200
Message-ID: <20241014085740.582287-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241014085740.582287-1-tzimmermann@suse.de>
References: <20241014085740.582287-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1B65B21C36
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim,suse.de:mid,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[10];
 R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Suspend and resume is still tied to fbdev emulation. Modeset helpers
and several drivers call drm_fb_helper_set_suspend_unlocked() to inform
the fbdev client about suspend/resume events.

To make it work with arbitrary clients, add per-client callback
functions for suspend and resume. Implement them for fbdev emulation
with the existing drm_fb_helper_set_suspend_unlocked(). Then update
DRM's modeset helpers to call the new interface.

Clients that are not fbdev can now implement suspend/resume to their
requirements.

The callback parameter holds_console_lock is a workaround for i915,
radeon and xe, which possibly call the interface while having the
console lock acquired. Even though the commit doesn't modify these
drivers, it already adds the flag to avoid churn later on. New code
should not hold the console lock.

v4:
- clarify holds_console_lock in commit description (Jonathan)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/drm_client_event.c   | 60 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fbdev_client.c   | 30 +++++++++++++-
 drivers/gpu/drm/drm_modeset_helper.c | 14 ++++---
 include/drm/drm_client.h             | 35 ++++++++++++++++
 include/drm/drm_client_event.h       |  2 +
 5 files changed, 133 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
index d13d44320c5c..c52e93643672 100644
--- a/drivers/gpu/drm/drm_client_event.c
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -107,6 +107,66 @@ void drm_client_dev_restore(struct drm_device *dev)
 	mutex_unlock(&dev->clientlist_mutex);
 }
 
+static int drm_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_device *dev = client->dev;
+	int ret = 0;
+
+	if (drm_WARN_ON_ONCE(dev, client->suspended))
+		return 0;
+
+	if (client->funcs && client->funcs->suspend)
+		ret = client->funcs->suspend(client, holds_console_lock);
+	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+
+	client->suspended = true;
+
+	return ret;
+}
+
+void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock)
+{
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->suspended)
+			drm_client_suspend(client, holds_console_lock);
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_suspend);
+
+static int drm_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_device *dev = client->dev;
+	int ret = 0;
+
+	if (drm_WARN_ON_ONCE(dev, !client->suspended))
+		return 0;
+
+	if (client->funcs && client->funcs->resume)
+		ret = client->funcs->resume(client, holds_console_lock);
+	drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+
+	client->suspended = false;
+
+	return ret;
+}
+
+void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock)
+{
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if  (client->suspended)
+			drm_client_resume(client, holds_console_lock);
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_resume);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
 {
diff --git a/drivers/gpu/drm/drm_fbdev_client.c b/drivers/gpu/drm/drm_fbdev_client.c
index a09382afe2fb..246fb63ab250 100644
--- a/drivers/gpu/drm/drm_fbdev_client.c
+++ b/drivers/gpu/drm/drm_fbdev_client.c
@@ -61,11 +61,37 @@ static int drm_fbdev_client_hotplug(struct drm_client_dev *client)
 	return ret;
 }
 
+static int drm_fbdev_client_suspend(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (holds_console_lock)
+		drm_fb_helper_set_suspend(fb_helper, true);
+	else
+		drm_fb_helper_set_suspend_unlocked(fb_helper, true);
+
+	return 0;
+}
+
+static int drm_fbdev_client_resume(struct drm_client_dev *client, bool holds_console_lock)
+{
+	struct drm_fb_helper *fb_helper = drm_fb_helper_from_client(client);
+
+	if (holds_console_lock)
+		drm_fb_helper_set_suspend(fb_helper, false);
+	else
+		drm_fb_helper_set_suspend_unlocked(fb_helper, false);
+
+	return 0;
+}
+
 static const struct drm_client_funcs drm_fbdev_client_funcs = {
 	.owner		= THIS_MODULE,
 	.unregister	= drm_fbdev_client_unregister,
 	.restore	= drm_fbdev_client_restore,
 	.hotplug	= drm_fbdev_client_hotplug,
+	.suspend	= drm_fbdev_client_suspend,
+	.resume		= drm_fbdev_client_resume,
 };
 
 /**
@@ -76,8 +102,8 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
  *
  * This function sets up fbdev emulation. Restore, hotplug events and
  * teardown are all taken care of. Drivers that do suspend/resume need
- * to call drm_fb_helper_set_suspend_unlocked() themselves. Simple
- * drivers might use drm_mode_config_helper_suspend().
+ * to call drm_client_dev_suspend() and drm_client_dev_resume() by
+ * themselves. Simple drivers might use drm_mode_config_helper_suspend().
  *
  * This function is safe to call even when there are no connectors present.
  * Setup will be retried on the next hotplug event.
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 2c582020cb42..5565464c1734 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -21,7 +21,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper.h>
@@ -185,7 +185,7 @@ EXPORT_SYMBOL(drm_crtc_init);
  * Zero on success, negative error code on error.
  *
  * See also:
- * drm_kms_helper_poll_disable() and drm_fb_helper_set_suspend_unlocked().
+ * drm_kms_helper_poll_disable() and drm_client_dev_suspend().
  */
 int drm_mode_config_helper_suspend(struct drm_device *dev)
 {
@@ -199,10 +199,11 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
 	if (dev->mode_config.poll_enabled)
 		drm_kms_helper_poll_disable(dev);
 
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
+	drm_client_dev_suspend(dev, false);
 	state = drm_atomic_helper_suspend(dev);
 	if (IS_ERR(state)) {
-		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
+		drm_client_dev_resume(dev, false);
+
 		/*
 		 * Don't enable polling if it was never initialized
 		 */
@@ -230,7 +231,7 @@ EXPORT_SYMBOL(drm_mode_config_helper_suspend);
  * Zero on success, negative error code on error.
  *
  * See also:
- * drm_fb_helper_set_suspend_unlocked() and drm_kms_helper_poll_enable().
+ * drm_client_dev_resume() and drm_kms_helper_poll_enable().
  */
 int drm_mode_config_helper_resume(struct drm_device *dev)
 {
@@ -247,7 +248,8 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
 		DRM_ERROR("Failed to resume (%d)\n", ret);
 	dev->mode_config.suspend_state = NULL;
 
-	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
+	drm_client_dev_resume(dev, false);
+
 	/*
 	 * Don't enable polling if it is not initialized
 	 */
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index dfd5afcc9463..c03c4b0f3e94 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -63,6 +63,34 @@ struct drm_client_funcs {
 	 * This callback is optional.
 	 */
 	int (*hotplug)(struct drm_client_dev *client);
+
+	/**
+	 * @suspend:
+	 *
+	 * Called when suspending the device.
+	 *
+	 * This callback is optional.
+	 *
+	 * FIXME: Some callers hold the console lock when invoking this
+	 *        function. This interferes with fbdev emulation, which
+	 *        also tries to acquire the lock. Push the console lock
+	 *        into the callback and remove 'holds_console_lock'.
+	 */
+	int (*suspend)(struct drm_client_dev *client, bool holds_console_lock);
+
+	/**
+	 * @resume:
+	 *
+	 * Called when resuming the device from suspend.
+	 *
+	 * This callback is optional.
+	 *
+	 * FIXME: Some callers hold the console lock when invoking this
+	 *        function. This interferes with fbdev emulation, which
+	 *        also tries to acquire the lock. Push the console lock
+	 *        into the callback and remove 'holds_console_lock'.
+	 */
+	int (*resume)(struct drm_client_dev *client, bool holds_console_lock);
 };
 
 /**
@@ -107,6 +135,13 @@ struct drm_client_dev {
 	 */
 	struct drm_mode_set *modesets;
 
+	/**
+	 * @suspended:
+	 *
+	 * The client has been suspended.
+	 */
+	bool suspended;
+
 	/**
 	 * @hotplug_failed:
 	 *
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
index 2c8915241120..72c97d111169 100644
--- a/include/drm/drm_client_event.h
+++ b/include/drm/drm_client_event.h
@@ -8,5 +8,7 @@ struct drm_device;
 void drm_client_dev_unregister(struct drm_device *dev);
 void drm_client_dev_hotplug(struct drm_device *dev);
 void drm_client_dev_restore(struct drm_device *dev);
+void drm_client_dev_suspend(struct drm_device *dev, bool holds_console_lock);
+void drm_client_dev_resume(struct drm_device *dev, bool holds_console_lock);
 
 #endif
-- 
2.46.0

