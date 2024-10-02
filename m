Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B198D433
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 15:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667A310E74E;
	Wed,  2 Oct 2024 13:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hW8w9sFP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UzZnTlRp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hW8w9sFP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UzZnTlRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E3710E71E;
 Wed,  2 Oct 2024 13:13:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8DCD91FD56;
 Wed,  2 Oct 2024 13:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCW7tuuzAnsCME1Hx9B6Kx1mMyjUEzvYpSBWlxqTuO4=;
 b=hW8w9sFPF2ljwAB3PEFMPR6vlnYjQtY06zNCiuRLue52/iWh790uDMvLxN6U/ZgBhlq2uN
 XyQ/YC7McqYcpzgNjMK4JNgMIO4DpMuv1Zb7AFOloIJtBcAxIq9LYuP1tE7FD0PVW0WL3X
 yZdo0A2OJvOvXFYNIYNzDCcflgAaVSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCW7tuuzAnsCME1Hx9B6Kx1mMyjUEzvYpSBWlxqTuO4=;
 b=UzZnTlRpi6H0VZGYSSsafvj3BE8rewxb6Xopx5JWF1twv12DJWixOV9oidJA/adJaJ/6BW
 FfkstU0jqmcNMuBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727874792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCW7tuuzAnsCME1Hx9B6Kx1mMyjUEzvYpSBWlxqTuO4=;
 b=hW8w9sFPF2ljwAB3PEFMPR6vlnYjQtY06zNCiuRLue52/iWh790uDMvLxN6U/ZgBhlq2uN
 XyQ/YC7McqYcpzgNjMK4JNgMIO4DpMuv1Zb7AFOloIJtBcAxIq9LYuP1tE7FD0PVW0WL3X
 yZdo0A2OJvOvXFYNIYNzDCcflgAaVSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727874792;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCW7tuuzAnsCME1Hx9B6Kx1mMyjUEzvYpSBWlxqTuO4=;
 b=UzZnTlRpi6H0VZGYSSsafvj3BE8rewxb6Xopx5JWF1twv12DJWixOV9oidJA/adJaJ/6BW
 FfkstU0jqmcNMuBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26FDF13A91;
 Wed,  2 Oct 2024 13:13:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MBE0COhG/Wa/GAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Oct 2024 13:13:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH v2 05/11] drm/client: Move client event handlers to
 drm_client_event.c
Date: Wed,  2 Oct 2024 15:04:31 +0200
Message-ID: <20241002131306.288618-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241002131306.288618-1-tzimmermann@suse.de>
References: <20241002131306.288618-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO
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

A number of DRM-client functions serve as entry points from device
operations to client code. Moving them info a separate file will later
allow for a more fine-grained kernel configuration. For most of the
users it is sufficient to include <drm/drm_client_event.h> instead of
the full driver-side interface in <drm/drm_client.h>

v2:
- rename new files to drm_client_event.{c,h}

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-client.rst              |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_client.c                  | 121 ----------------
 drivers/gpu/drm/drm_client_event.c            | 135 ++++++++++++++++++
 drivers/gpu/drm/drm_drv.c                     |   2 +-
 drivers/gpu/drm/drm_file.c                    |   2 +-
 drivers/gpu/drm/drm_probe_helper.c            |   2 +-
 .../drm/i915/display/intel_display_driver.c   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         |   2 +-
 include/drm/drm_client.h                      |   4 -
 include/drm/drm_client_event.h                |  12 ++
 11 files changed, 156 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_event.c
 create mode 100644 include/drm/drm_client_event.h

diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-client.rst
index 58b5a1d1219d..cbcfe30de777 100644
--- a/Documentation/gpu/drm-client.rst
+++ b/Documentation/gpu/drm-client.rst
@@ -13,3 +13,6 @@ Kernel clients
 
 .. kernel-doc:: drivers/gpu/drm/drm_client_modeset.c
    :export:
+
+.. kernel-doc:: drivers/gpu/drm/drm_client_event.c
+   :export:
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 3894f43f6d47..6b7d168ca790 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_bridge.o \
 	drm_cache.o \
 	drm_client.o \
+	drm_client_event.o \
 	drm_client_modeset.o \
 	drm_color_mgmt.o \
 	drm_connector.o \
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index bfedcbf516db..549b28a5918c 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 
 #include <drm/drm_client.h>
-#include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -172,99 +171,6 @@ void drm_client_release(struct drm_client_dev *client)
 }
 EXPORT_SYMBOL(drm_client_release);
 
-/**
- * drm_client_dev_unregister - Unregister clients
- * @dev: DRM device
- *
- * This function releases all clients by calling each client's
- * &drm_client_funcs.unregister callback. The callback function
- * is responsibe for releaseing all resources including the client
- * itself.
- *
- * The helper drm_dev_unregister() calls this function. Drivers
- * that use it don't need to call this function themselves.
- */
-void drm_client_dev_unregister(struct drm_device *dev)
-{
-	struct drm_client_dev *client, *tmp;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
-		list_del(&client->list);
-		if (client->funcs && client->funcs->unregister) {
-			client->funcs->unregister(client);
-		} else {
-			drm_client_release(client);
-			kfree(client);
-		}
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-EXPORT_SYMBOL(drm_client_dev_unregister);
-
-/**
- * drm_client_dev_hotplug - Send hotplug event to clients
- * @dev: DRM device
- *
- * This function calls the &drm_client_funcs.hotplug callback on the attached clients.
- *
- * drm_kms_helper_hotplug_event() calls this function, so drivers that use it
- * don't need to call this function themselves.
- */
-void drm_client_dev_hotplug(struct drm_device *dev)
-{
-	struct drm_client_dev *client;
-	int ret;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	if (!dev->mode_config.num_connector) {
-		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
-		return;
-	}
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list) {
-		if (!client->funcs || !client->funcs->hotplug)
-			continue;
-
-		if (client->hotplug_failed)
-			continue;
-
-		ret = client->funcs->hotplug(client);
-		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
-		if (ret)
-			client->hotplug_failed = true;
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-EXPORT_SYMBOL(drm_client_dev_hotplug);
-
-void drm_client_dev_restore(struct drm_device *dev)
-{
-	struct drm_client_dev *client;
-	int ret;
-
-	if (!drm_core_check_feature(dev, DRIVER_MODESET))
-		return;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list) {
-		if (!client->funcs || !client->funcs->restore)
-			continue;
-
-		ret = client->funcs->restore(client);
-		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
-		if (!ret) /* The first one to return zero gets the privilege to restore */
-			break;
-	}
-	mutex_unlock(&dev->clientlist_mutex);
-}
-
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	if (buffer->gem) {
@@ -584,30 +490,3 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 					0, 0, NULL, 0);
 }
 EXPORT_SYMBOL(drm_client_framebuffer_flush);
-
-#ifdef CONFIG_DEBUG_FS
-static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
-{
-	struct drm_debugfs_entry *entry = m->private;
-	struct drm_device *dev = entry->dev;
-	struct drm_printer p = drm_seq_file_printer(m);
-	struct drm_client_dev *client;
-
-	mutex_lock(&dev->clientlist_mutex);
-	list_for_each_entry(client, &dev->clientlist, list)
-		drm_printf(&p, "%s\n", client->name);
-	mutex_unlock(&dev->clientlist_mutex);
-
-	return 0;
-}
-
-static const struct drm_debugfs_info drm_client_debugfs_list[] = {
-	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
-};
-
-void drm_client_debugfs_init(struct drm_device *dev)
-{
-	drm_debugfs_add_files(dev, drm_client_debugfs_list,
-			      ARRAY_SIZE(drm_client_debugfs_list));
-}
-#endif
diff --git a/drivers/gpu/drm/drm_client_event.c b/drivers/gpu/drm/drm_client_event.c
new file mode 100644
index 000000000000..d13d44320c5c
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_event.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/*
+ * Copyright 2018 Noralf Trønnes
+ */
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/seq_file.h>
+
+#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+/**
+ * drm_client_dev_unregister - Unregister clients
+ * @dev: DRM device
+ *
+ * This function releases all clients by calling each client's
+ * &drm_client_funcs.unregister callback. The callback function
+ * is responsibe for releaseing all resources including the client
+ * itself.
+ *
+ * The helper drm_dev_unregister() calls this function. Drivers
+ * that use it don't need to call this function themselves.
+ */
+void drm_client_dev_unregister(struct drm_device *dev)
+{
+	struct drm_client_dev *client, *tmp;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry_safe(client, tmp, &dev->clientlist, list) {
+		list_del(&client->list);
+		if (client->funcs && client->funcs->unregister) {
+			client->funcs->unregister(client);
+		} else {
+			drm_client_release(client);
+			kfree(client);
+		}
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_unregister);
+
+/**
+ * drm_client_dev_hotplug - Send hotplug event to clients
+ * @dev: DRM device
+ *
+ * This function calls the &drm_client_funcs.hotplug callback on the attached clients.
+ *
+ * drm_kms_helper_hotplug_event() calls this function, so drivers that use it
+ * don't need to call this function themselves.
+ */
+void drm_client_dev_hotplug(struct drm_device *dev)
+{
+	struct drm_client_dev *client;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	if (!dev->mode_config.num_connector) {
+		drm_dbg_kms(dev, "No connectors found, will not send hotplug events!\n");
+		return;
+	}
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->funcs || !client->funcs->hotplug)
+			continue;
+
+		if (client->hotplug_failed)
+			continue;
+
+		ret = client->funcs->hotplug(client);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (ret)
+			client->hotplug_failed = true;
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+EXPORT_SYMBOL(drm_client_dev_hotplug);
+
+void drm_client_dev_restore(struct drm_device *dev)
+{
+	struct drm_client_dev *client;
+	int ret;
+
+	if (!drm_core_check_feature(dev, DRIVER_MODESET))
+		return;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list) {
+		if (!client->funcs || !client->funcs->restore)
+			continue;
+
+		ret = client->funcs->restore(client);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
+		if (!ret) /* The first one to return zero gets the privilege to restore */
+			break;
+	}
+	mutex_unlock(&dev->clientlist_mutex);
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int drm_client_debugfs_internal_clients(struct seq_file *m, void *data)
+{
+	struct drm_debugfs_entry *entry = m->private;
+	struct drm_device *dev = entry->dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+	struct drm_client_dev *client;
+
+	mutex_lock(&dev->clientlist_mutex);
+	list_for_each_entry(client, &dev->clientlist, list)
+		drm_printf(&p, "%s\n", client->name);
+	mutex_unlock(&dev->clientlist_mutex);
+
+	return 0;
+}
+
+static const struct drm_debugfs_info drm_client_debugfs_list[] = {
+	{ "internal_clients", drm_client_debugfs_internal_clients, 0 },
+};
+
+void drm_client_debugfs_init(struct drm_device *dev)
+{
+	drm_debugfs_add_files(dev, drm_client_debugfs_list,
+			      ARRAY_SIZE(drm_client_debugfs_list));
+}
+#endif
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index ac30b0ec9d93..c2c172eb25df 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -38,7 +38,7 @@
 
 #include <drm/drm_accel.h>
 #include <drm/drm_cache.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_color_mgmt.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ad1dc638c83b..7415abb7faca 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -40,7 +40,7 @@
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 92f21764246f..96b266b37ba4 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -33,7 +33,7 @@
 #include <linux/moduleparam.h>
 
 #include <drm/drm_bridge.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index c106fb2dd20b..673f9b965494 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -11,7 +11,7 @@
 #include <acpi/video.h>
 #include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_client.h>
+#include <drm/drm_client_event.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index ab4e11dc0b8a..a6c375a24154 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -2,7 +2,7 @@
 #include <linux/vgaarb.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_fb_helper.h>
+#include <drm/drm_client_event.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_acpi.h"
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..dfd5afcc9463 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -121,10 +121,6 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
 void drm_client_release(struct drm_client_dev *client);
 void drm_client_register(struct drm_client_dev *client);
 
-void drm_client_dev_unregister(struct drm_device *dev);
-void drm_client_dev_hotplug(struct drm_device *dev);
-void drm_client_dev_restore(struct drm_device *dev);
-
 /**
  * struct drm_client_buffer - DRM client buffer
  */
diff --git a/include/drm/drm_client_event.h b/include/drm/drm_client_event.h
new file mode 100644
index 000000000000..2c8915241120
--- /dev/null
+++ b/include/drm/drm_client_event.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+
+#ifndef _DRM_CLIENT_EVENT_H_
+#define _DRM_CLIENT_EVENT_H_
+
+struct drm_device;
+
+void drm_client_dev_unregister(struct drm_device *dev);
+void drm_client_dev_hotplug(struct drm_device *dev);
+void drm_client_dev_restore(struct drm_device *dev);
+
+#endif
-- 
2.46.0

