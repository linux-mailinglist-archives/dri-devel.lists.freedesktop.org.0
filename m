Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C38F897842
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 20:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05716112E25;
	Wed,  3 Apr 2024 18:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AmTBmM3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC040112E25
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1712169033;
 bh=X3gawQizTTZ2izaFT0MnlQyxFRjnWmFQBSZh9Jvcdpw=;
 h=From:To:Cc:Subject:Date:From;
 b=AmTBmM3Bjo9n+afuIZfqGHOst3XC2oURKpvaNsUIq+gCXkNBiBQrx7K2jSL6vdVeS
 mpTA8LNdX705fFs9Nek8/IvpOVhesw9n9sAWtO9DjCWkcRJj1YfqMVtKLzPSaNNQJQ
 kS5YPp/vbg+dd01t8P2RSK2w2QRTcXiHyMS/SJezDmcqenIkX14SKxnK4PM29OZDCl
 wrtBM8bNJeV2a7ev9wFY/Xwob2+7jQWDbWHgbmKtzeAya49/8IwZNpPX8dZDY+tMDj
 2kmSQbillZk1vbXiMjh5GC2KxlCJqxwpZ9TmBm2KHKDqWedBVRjHMRab3+7ZhJzZMv
 QxuXGkbciCslA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 62EFA37813D7;
 Wed,  3 Apr 2024 18:30:32 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sysfs: Add drm class-wide attribute to get active device
 clients
Date: Wed,  3 Apr 2024 19:29:39 +0100
Message-ID: <20240403182951.724488-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Up to this day, all fdinfo-based GPU profilers must traverse the entire
/proc directory structure to find open DRM clients with fdinfo file
descriptors. This is inefficient and time-consuming.

This patch adds a new device class attribute that will install a sysfs file
per DRM device, which can be queried by profilers to get a list of PIDs for
their open clients. This file isn't human-readable, and it's meant to be
queried only by GPU profilers like gputop and nvtop.

Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Christopher Healy <healych@amazon.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/drm_internal.h       |  2 +-
 drivers/gpu/drm/drm_privacy_screen.c |  2 +-
 drivers/gpu/drm/drm_sysfs.c          | 89 ++++++++++++++++++++++------
 3 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 2215baef9a3e..9a399b03d11c 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -145,7 +145,7 @@ bool drm_master_internal_acquire(struct drm_device *dev);
 void drm_master_internal_release(struct drm_device *dev);
 
 /* drm_sysfs.c */
-extern struct class *drm_class;
+extern struct class drm_class;
 
 int drm_sysfs_init(void);
 void drm_sysfs_destroy(void);
diff --git a/drivers/gpu/drm/drm_privacy_screen.c b/drivers/gpu/drm/drm_privacy_screen.c
index 6cc39e30781f..2fbd24ba5818 100644
--- a/drivers/gpu/drm/drm_privacy_screen.c
+++ b/drivers/gpu/drm/drm_privacy_screen.c
@@ -401,7 +401,7 @@ struct drm_privacy_screen *drm_privacy_screen_register(
 	mutex_init(&priv->lock);
 	BLOCKING_INIT_NOTIFIER_HEAD(&priv->notifier_head);
 
-	priv->dev.class = drm_class;
+	priv->dev.class = &drm_class;
 	priv->dev.type = &drm_privacy_screen_type;
 	priv->dev.parent = parent;
 	priv->dev.release = drm_privacy_screen_device_release;
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index a953f69a34b6..56ca9e22c720 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -58,8 +58,6 @@ static struct device_type drm_sysfs_device_connector = {
 	.name = "drm_connector",
 };
 
-struct class *drm_class;
-
 #ifdef CONFIG_ACPI
 static bool drm_connector_acpi_bus_match(struct device *dev)
 {
@@ -128,6 +126,62 @@ static const struct component_ops typec_connector_ops = {
 
 static CLASS_ATTR_STRING(version, S_IRUGO, "drm 1.1.0 20060810");
 
+static ssize_t clients_show(struct device *cd, struct device_attribute *attr, char *buf)
+{
+	struct drm_minor *minor = cd->driver_data;
+	struct drm_device *ddev = minor->dev;
+	struct drm_file *priv;
+	ssize_t offset = 0;
+	void *pid_buf;
+
+	if (minor->type != DRM_MINOR_RENDER)
+		return 0;
+
+	pid_buf = kvmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!pid_buf)
+		return 0;
+
+	mutex_lock(&ddev->filelist_mutex);
+	list_for_each_entry_reverse(priv, &ddev->filelist, lhead) {
+		struct pid *pid;
+
+		if (drm_WARN_ON(ddev, (PAGE_SIZE - offset) < sizeof(pid_t)))
+			break;
+
+		rcu_read_lock();
+		pid = rcu_dereference(priv->pid);
+		(*(pid_t *)(pid_buf + offset)) = pid_vnr(pid);
+		rcu_read_unlock();
+
+		offset += sizeof(pid_t);
+	}
+	mutex_unlock(&ddev->filelist_mutex);
+
+	if (offset < PAGE_SIZE)
+		(*(pid_t *)(pid_buf + offset)) = 0;
+
+	memcpy(buf, pid_buf, offset);
+
+	kvfree(pid_buf);
+
+	return offset;
+
+}
+static DEVICE_ATTR_RO(clients);
+
+static struct attribute *drm_device_attrs[] = {
+	&dev_attr_clients.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(drm_device);
+
+struct class drm_class = {
+	.name		= "drm",
+	.dev_groups	= drm_device_groups,
+};
+
+static bool drm_class_initialised;
+
 /**
  * drm_sysfs_init - initialize sysfs helpers
  *
@@ -142,18 +196,19 @@ int drm_sysfs_init(void)
 {
 	int err;
 
-	drm_class = class_create("drm");
-	if (IS_ERR(drm_class))
-		return PTR_ERR(drm_class);
+	err = class_register(&drm_class);
+	if (err)
+		return err;
 
-	err = class_create_file(drm_class, &class_attr_version.attr);
+	err = class_create_file(&drm_class, &class_attr_version.attr);
 	if (err) {
-		class_destroy(drm_class);
-		drm_class = NULL;
+		class_destroy(&drm_class);
 		return err;
 	}
 
-	drm_class->devnode = drm_devnode;
+	drm_class.devnode = drm_devnode;
+
+	drm_class_initialised = true;
 
 	drm_sysfs_acpi_register();
 	return 0;
@@ -166,12 +221,12 @@ int drm_sysfs_init(void)
  */
 void drm_sysfs_destroy(void)
 {
-	if (IS_ERR_OR_NULL(drm_class))
+	if (!drm_class_initialised)
 		return;
 	drm_sysfs_acpi_unregister();
-	class_remove_file(drm_class, &class_attr_version.attr);
-	class_destroy(drm_class);
-	drm_class = NULL;
+	class_remove_file(&drm_class, &class_attr_version.attr);
+	class_destroy(&drm_class);
+	drm_class_initialised = false;
 }
 
 static void drm_sysfs_release(struct device *dev)
@@ -372,7 +427,7 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 		return -ENOMEM;
 
 	device_initialize(kdev);
-	kdev->class = drm_class;
+	kdev->class = &drm_class;
 	kdev->type = &drm_sysfs_device_connector;
 	kdev->parent = dev->primary->kdev;
 	kdev->groups = connector_dev_groups;
@@ -550,7 +605,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
 			minor_str = "card%d";
 
 		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
-		kdev->class = drm_class;
+		kdev->class = &drm_class;
 		kdev->type = &drm_sysfs_device_minor;
 	}
 
@@ -579,10 +634,10 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
  */
 int drm_class_device_register(struct device *dev)
 {
-	if (!drm_class || IS_ERR(drm_class))
+	if (!drm_class_initialised)
 		return -ENOENT;
 
-	dev->class = drm_class;
+	dev->class = &drm_class;
 	return device_register(dev);
 }
 EXPORT_SYMBOL_GPL(drm_class_device_register);

base-commit: 45c734fdd43db14444025910b4c59dd2b8be714a
-- 
2.44.0

