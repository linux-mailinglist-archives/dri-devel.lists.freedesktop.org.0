Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53108988754
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA1B10ECB5;
	Fri, 27 Sep 2024 14:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="b5BQyM51";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x1r/99Vm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YhFYXl54";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v0bec0/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249A10EC99;
 Fri, 27 Sep 2024 14:42:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EF3BD21B53;
 Fri, 27 Sep 2024 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHq4RY6ojtJsieBz5NENn6TMgvt2r6L3WBIUlvUSJ2o=;
 b=b5BQyM51xsi5w5ByBN+yjTF14/NJ517xvRPB423GAo+uhPXiCcVmGyOM7AoOLxCgez0ldT
 jy5YO63Yuzh5E15aS2x8N8b54elHUkYzfsEt2G5kWNU9ZpmJO08EjF6JZRblbwmJi3OGK/
 fo1TeCpoDZCV4SHFlI1/dMJDbk79zYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHq4RY6ojtJsieBz5NENn6TMgvt2r6L3WBIUlvUSJ2o=;
 b=x1r/99Vm5HX6AoLO0ExZBbvaZekKatHbkLvP//Y9GSmCcswemCvf094Nz/eaQCIhxuxQXP
 Y20+/JwUHD/3MDAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1727448176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHq4RY6ojtJsieBz5NENn6TMgvt2r6L3WBIUlvUSJ2o=;
 b=YhFYXl54lDaI8LHSSsTq3GlF45f9suSyZHGZG3U5XuyBTZ2CPNg8OxKBf0Wo+BeOQRSL0g
 t9n9UAVNyM3mr412TYRbP68g2Wha+wC0VDApx49iiFzLNaMuY1WMRIEJnH86EYJFq7A2LL
 eZ9BEqRrM8vKlYnXvpkiVwAqrsmzoQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1727448176;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHq4RY6ojtJsieBz5NENn6TMgvt2r6L3WBIUlvUSJ2o=;
 b=v0bec0/c8+vdeUnyd7K74uKDX49EA2pmaB14mCX76tAEDQ3EW+PQ1a559PidMkkRgt7J8s
 MyC1cPpRMOveZiAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B03BF13AA0;
 Fri, 27 Sep 2024 14:42:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IBa0KXDE9mYFKwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Sep 2024 14:42:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] drm: Move client-device functions in to drm_client_dev.c
Date: Fri, 27 Sep 2024 16:37:28 +0200
Message-ID: <20240927144252.31813-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
References: <20240927144252.31813-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-7.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:email,
 suse.de:mid]
X-Spam-Score: -7.30
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
operations to client code. Move them info a separate file, so that
the other client functions can be moved into a different module.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-client.rst |   3 +
 drivers/gpu/drm/Makefile         |   1 +
 drivers/gpu/drm/drm_client.c     | 121 ---------------------------
 drivers/gpu/drm/drm_client_dev.c | 138 +++++++++++++++++++++++++++++++
 4 files changed, 142 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_client_dev.c

diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-client.rst
index 58b5a1d1219d..6d8142f159a1 100644
--- a/Documentation/gpu/drm-client.rst
+++ b/Documentation/gpu/drm-client.rst
@@ -13,3 +13,6 @@ Kernel clients
 
 .. kernel-doc:: drivers/gpu/drm/drm_client_modeset.c
    :export:
+
+.. kernel-doc:: drivers/gpu/drm/drm_client_dev.c
+   :export:
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 3894f43f6d47..c50443756457 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -42,6 +42,7 @@ drm-y := \
 	drm_bridge.o \
 	drm_cache.o \
 	drm_client.o \
+	drm_client_dev.o \
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
diff --git a/drivers/gpu/drm/drm_client_dev.c b/drivers/gpu/drm/drm_client_dev.c
new file mode 100644
index 000000000000..3e41fd1f0771
--- /dev/null
+++ b/drivers/gpu/drm/drm_client_dev.c
@@ -0,0 +1,138 @@
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
+#include <drm/drm_debugfs.h>
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+
+/**
+ * DOC: overview
+ *
+ * This library provides support for clients running in the kernel like fbdev and bootsplash.
+ *
+ * GEM drivers which provide a GEM based dumb buffer with a virtual address are supported.
+ */
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
+		if (client->funcs && !drm_WARN_ON(dev, !client->funcs->unregister))
+			client->funcs->unregister(client);
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
-- 
2.46.0

