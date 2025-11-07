Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCEFC4053C
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06DA10EAE7;
	Fri,  7 Nov 2025 14:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="zU4ycOPN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LUcXeH6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zU4ycOPN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6LUcXeH6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68E10EAE7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:26:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 37065211F7;
 Fri,  7 Nov 2025 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IJ8SMZfglc9SeMZthZTk39PHOnrpfNId5Z49aJR2fc=;
 b=zU4ycOPNiDpGRoK1ELlDpTcy4DcgpLgnwLT4atdGnDCo1kkk5BJXW+/ia+TPI9wbw97Tj2
 dE6M5fTt3UR1a8sjswkx96J4Np5UYddCRoBpEZYmAUhnVNCpkWX8MaJoE1fmHgAoZ9OSqi
 SK29DtXiC+FNkLsWhUTGlpQASBLIg9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IJ8SMZfglc9SeMZthZTk39PHOnrpfNId5Z49aJR2fc=;
 b=6LUcXeH62ZYOkZyCU/3ublX5PYaPrgkLwOF1DrAyFDtiubcpfUxMb4u0BX9Dwf3gbkFQbR
 wqA6w0yIfeXmrtBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762525577; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IJ8SMZfglc9SeMZthZTk39PHOnrpfNId5Z49aJR2fc=;
 b=zU4ycOPNiDpGRoK1ELlDpTcy4DcgpLgnwLT4atdGnDCo1kkk5BJXW+/ia+TPI9wbw97Tj2
 dE6M5fTt3UR1a8sjswkx96J4Np5UYddCRoBpEZYmAUhnVNCpkWX8MaJoE1fmHgAoZ9OSqi
 SK29DtXiC+FNkLsWhUTGlpQASBLIg9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762525577;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IJ8SMZfglc9SeMZthZTk39PHOnrpfNId5Z49aJR2fc=;
 b=6LUcXeH62ZYOkZyCU/3ublX5PYaPrgkLwOF1DrAyFDtiubcpfUxMb4u0BX9Dwf3gbkFQbR
 wqA6w0yIfeXmrtBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D966B1395F;
 Fri,  7 Nov 2025 14:26:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iJvVM4gBDmkaLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Nov 2025 14:26:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/client: Support emergency restore via sysrq for all
 clients
Date: Fri,  7 Nov 2025 15:19:26 +0100
Message-ID: <20251107142612.467817-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107142612.467817-1-tzimmermann@suse.de>
References: <20251107142612.467817-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[12];
 MIME_TRACE(0.00)[0:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com,linuxfoundation.org];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Move the sysrq functionality from DRM fb-helpers to the DRM device
and in-kernel clients, so that all it becomes available on all clients.

DRM fbdev helpers support emergency restoration of the console output
via a special key combination. Press SysRq+v to replace the current
compositor with the kernel's output on the text-mode console. This
allows users to see the log messages during system emergencies.

By moving the functionality from fb-helper to DRM devices, any
in-kernel client can serve as emergency output. This can be used to
bring up drm_log, for example.

Each DRM device registers itself to the list possible sysrq handlers.
On receiving SysRq+v, the DRM core goes over all registered devices and
restores an in-kernel DRM client for each of them.

See Documentation/admin-guide/sysrq.rst on how to invoke SysRq. Switch
VTs to bring back the user-space compositor.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile           |  3 +-
 drivers/gpu/drm/drm_client.c       |  1 +
 drivers/gpu/drm/drm_client_sysrq.c | 65 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c          |  3 ++
 drivers/gpu/drm/drm_fb_helper.c    | 45 +--------------------
 drivers/gpu/drm/drm_internal.h     | 11 +++++
 include/drm/drm_device.h           |  8 ++++
 7 files changed, 91 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_sysrq.c

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index c2672f369aed..9901534948e5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -76,7 +76,8 @@ drm-y := \
 drm-$(CONFIG_DRM_CLIENT) += \
 	drm_client.o \
 	drm_client_event.o \
-	drm_client_modeset.o
+	drm_client_modeset.o \
+	drm_client_sysrq.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 504ec5bdfa2c..a82d741e6630 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/drm_client_sysrq.c b/drivers/gpu/drm/drm_client_sysrq.c
new file mode 100644
index 000000000000..eea660096f1b
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_sysrq.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <linux/sysrq.h>
+
+#include <drm/drm_client_event.h>
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+
+#include "drm_internal.h"
+
+#ifdef CONFIG_MAGIC_SYSRQ
+static LIST_HEAD(drm_client_sysrq_dev_list);
+static DEFINE_MUTEX(drm_client_sysrq_dev_lock);
+
+/* emergency restore, don't bother with error reporting */
+static void drm_client_sysrq_restore_work_fn(struct work_struct *ignored)
+{
+	struct drm_device *dev;
+
+	guard(mutex)(&drm_client_sysrq_dev_lock);
+
+	list_for_each_entry(dev, &drm_client_sysrq_dev_list, client_sysrq_list) {
+		if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
+			continue;
+
+		drm_client_dev_restore(dev, true);
+	}
+}
+
+static DECLARE_WORK(drm_client_sysrq_restore_work, drm_client_sysrq_restore_work_fn);
+
+static void drm_client_sysrq_restore_handler(u8 ignored)
+{
+	schedule_work(&drm_client_sysrq_restore_work);
+}
+
+static const struct sysrq_key_op drm_client_sysrq_restore_op = {
+	.handler = drm_client_sysrq_restore_handler,
+	.help_msg = "force-fb(v)",
+	.action_msg = "Restore framebuffer console",
+};
+
+void drm_client_sysrq_register(struct drm_device *dev)
+{
+	guard(mutex)(&drm_client_sysrq_dev_lock);
+
+	if (list_empty(&drm_client_sysrq_dev_list))
+		register_sysrq_key('v', &drm_client_sysrq_restore_op);
+
+	list_add(&dev->client_sysrq_list, &drm_client_sysrq_dev_list);
+}
+
+void drm_client_sysrq_unregister(struct drm_device *dev)
+{
+	guard(mutex)(&drm_client_sysrq_dev_lock);
+
+	/* remove device from global restore list */
+	if (!drm_WARN_ON(dev, list_empty(&dev->client_sysrq_list)))
+		list_del(&dev->client_sysrq_list);
+
+	/* no devices left; unregister key */
+	if (list_empty(&drm_client_sysrq_dev_list))
+		unregister_sysrq_key('v', &drm_client_sysrq_restore_op);
+}
+#endif
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8e3cb08241c8..2915118436ce 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -733,6 +733,7 @@ static int drm_dev_init(struct drm_device *dev,
 	INIT_LIST_HEAD(&dev->filelist);
 	INIT_LIST_HEAD(&dev->filelist_internal);
 	INIT_LIST_HEAD(&dev->clientlist);
+	INIT_LIST_HEAD(&dev->client_sysrq_list);
 	INIT_LIST_HEAD(&dev->vblank_event_list);
 
 	spin_lock_init(&dev->event_lock);
@@ -1100,6 +1101,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 			goto err_unload;
 	}
 	drm_panic_register(dev);
+	drm_client_sysrq_register(dev);
 
 	DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -1144,6 +1146,7 @@ void drm_dev_unregister(struct drm_device *dev)
 {
 	dev->registered = false;
 
+	drm_client_sysrq_unregister(dev);
 	drm_panic_unregister(dev);
 
 	drm_client_dev_unregister(dev);
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 1392738ce2fe..9a734017756b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -32,7 +32,6 @@
 #include <linux/console.h>
 #include <linux/export.h>
 #include <linux/pci.h>
-#include <linux/sysrq.h>
 #include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
@@ -270,42 +269,6 @@ int drm_fb_helper_restore_fbdev_mode_unlocked(struct drm_fb_helper *fb_helper, b
 }
 EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
 
-#ifdef CONFIG_MAGIC_SYSRQ
-/* emergency restore, don't bother with error reporting */
-static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)
-{
-	struct drm_fb_helper *helper;
-
-	mutex_lock(&kernel_fb_helper_lock);
-	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {
-		struct drm_device *dev = helper->dev;
-
-		if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
-			continue;
-
-		mutex_lock(&helper->lock);
-		drm_client_modeset_commit_locked(&helper->client);
-		mutex_unlock(&helper->lock);
-	}
-	mutex_unlock(&kernel_fb_helper_lock);
-}
-
-static DECLARE_WORK(drm_fb_helper_restore_work, drm_fb_helper_restore_work_fn);
-
-static void drm_fb_helper_sysrq(u8 dummy1)
-{
-	schedule_work(&drm_fb_helper_restore_work);
-}
-
-static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = {
-	.handler = drm_fb_helper_sysrq,
-	.help_msg = "force-fb(v)",
-	.action_msg = "Restore framebuffer console",
-};
-#else
-static const struct sysrq_key_op sysrq_drm_fb_helper_restore_op = { };
-#endif
-
 static void drm_fb_helper_dpms(struct fb_info *info, int dpms_mode)
 {
 	struct drm_fb_helper *fb_helper = info->par;
@@ -602,11 +565,8 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
 	drm_fb_helper_release_info(fb_helper);
 
 	mutex_lock(&kernel_fb_helper_lock);
-	if (!list_empty(&fb_helper->kernel_fb_list)) {
+	if (!list_empty(&fb_helper->kernel_fb_list))
 		list_del(&fb_helper->kernel_fb_list);
-		if (list_empty(&kernel_fb_helper_list))
-			unregister_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
-	}
 	mutex_unlock(&kernel_fb_helper_lock);
 
 	if (!fb_helper->client.funcs)
@@ -1840,9 +1800,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 		 info->node, info->fix.id);
 
 	mutex_lock(&kernel_fb_helper_lock);
-	if (list_empty(&kernel_fb_helper_list))
-		register_sysrq_key('v', &sysrq_drm_fb_helper_restore_op);
-
 	list_add(&fb_helper->kernel_fb_list, &kernel_fb_helper_list);
 	mutex_unlock(&kernel_fb_helper_lock);
 
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 5a3bed48ab1f..59cbac12a6d6 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -56,6 +56,17 @@ static inline void drm_client_debugfs_init(struct drm_device *dev)
 { }
 #endif
 
+/* drm_client_sysrq.c */
+#if defined(CONFIG_DRM_CLIENT) && defined(CONFIG_MAGIC_SYSRQ)
+void drm_client_sysrq_register(struct drm_device *dev);
+void drm_client_sysrq_unregister(struct drm_device *dev);
+#else
+void drm_client_sysrq_register(struct drm_device *dev)
+{ }
+void drm_client_sysrq_unregister(struct drm_device *dev)
+{ }
+#endif
+
 /* drm_file.c */
 extern struct mutex drm_global_mutex;
 bool drm_dev_needs_global_mutex(struct drm_device *dev);
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 778b2cca6c49..5af49c5c3778 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -238,6 +238,14 @@ struct drm_device {
 	 */
 	struct list_head clientlist;
 
+	/**
+	 * @client_sysrq_list:
+	 *
+	 * Entry into list of devices registered for sysrq. Allows in-kernel
+	 * clients on this device to handle sysrq keys.
+	 */
+	struct list_head client_sysrq_list;
+
 	/**
 	 * @vblank_disable_immediate:
 	 *
-- 
2.51.1

