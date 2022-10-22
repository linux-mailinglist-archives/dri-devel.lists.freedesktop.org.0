Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D0608FD7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 23:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A46E10E027;
	Sat, 22 Oct 2022 21:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0610E10E027
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 21:46:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7426AB80B2B;
 Sat, 22 Oct 2022 21:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F8E7C433B5;
 Sat, 22 Oct 2022 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666475205;
 bh=JT2MdfhPjVKgCMdlk30ipJOMxC3nOP4IAilx6SwpDDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pEBsdeAa58flKMA4VionziKr3zqsUSRY1cnJyKDgbsF0LJSFfqgdMtY6cw9V+lOYx
 TnRf+pvMjZESTeAPoZyoK2FilsWtWaGIMI6wczbzcPQDSk/uRK/bEG2lRDwAAcDZnr
 rYgFoxaSLFlLgEIVlzamAF7mFQzMvtoKTx4WjbS6KZgm8+lYsOhw1UVjpfOS3iLoBc
 cvHpc/yqKNglXaLh0WR3sPx3gTTDEWjsEw3FWNT52adPZRmMACdY3aVuyi4GTNsoKN
 S0q4ej1oEXoQ9CIhkzziHO3ZjECZgvY6c8yzPXSGX2G1XqSi/mdK44I+jMM1faz2A1
 Bibmi/RfaFYeQ==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 2/3] drm: define new accel major and register it
Date: Sun, 23 Oct 2022 00:46:21 +0300
Message-Id: <20221022214622.18042-3-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022214622.18042-1-ogabbay@kernel.org>
References: <20221022214622.18042-1-ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jiho Chu <jiho.chu@samsung.com>,
 Christoph Hellwig <hch@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The accelerator devices will be exposed to the user space with a new,
dedicated major number - 261.

The drm core registers the new major number as a char device and create
corresponding sysfs and debugfs root entries, same as for the drm major.

In case CONFIG_ACCEL is not selected, this code is not compiled in.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 Documentation/admin-guide/devices.txt |  5 +++
 drivers/gpu/drm/drm_drv.c             | 45 +++++++++++++++++++++++
 drivers/gpu/drm/drm_internal.h        |  3 ++
 drivers/gpu/drm/drm_sysfs.c           | 52 +++++++++++++++++++++++++++
 include/drm/drm_ioctl.h               |  1 +
 5 files changed, 106 insertions(+)

diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
index 9764d6edb189..06c525e01ea5 100644
--- a/Documentation/admin-guide/devices.txt
+++ b/Documentation/admin-guide/devices.txt
@@ -3080,6 +3080,11 @@
 		  ...
 		  255 = /dev/osd255	256th OSD Device
 
+ 261 char	Compute Acceleration Devices
+		  0 = /dev/accel/accel0	First acceleration device
+		  1 = /dev/accel/accel1	Second acceleration device
+		    ...
+
  384-511 char	RESERVED FOR DYNAMIC ASSIGNMENT
 		Character devices that request a dynamic allocation of major
 		number will take numbers starting from 511 and downward,
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 8214a0b1ab7f..b58ffb1433d6 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -67,6 +67,10 @@ static bool drm_core_init_complete;
 
 static struct dentry *drm_debugfs_root;
 
+#ifdef CONFIG_ACCEL
+static struct dentry *accel_debugfs_root;
+#endif
+
 DEFINE_STATIC_SRCU(drm_unplug_srcu);
 
 /*
@@ -1031,9 +1035,19 @@ static const struct file_operations drm_stub_fops = {
 	.llseek = noop_llseek,
 };
 
+static void accel_core_exit(void)
+{
+#ifdef CONFIG_ACCEL
+	unregister_chrdev(ACCEL_MAJOR, "accel");
+	debugfs_remove(accel_debugfs_root);
+	accel_sysfs_destroy();
+#endif
+}
+
 static void drm_core_exit(void)
 {
 	drm_privacy_screen_lookup_exit();
+	accel_core_exit();
 	unregister_chrdev(DRM_MAJOR, "drm");
 	debugfs_remove(drm_debugfs_root);
 	drm_sysfs_destroy();
@@ -1041,6 +1055,33 @@ static void drm_core_exit(void)
 	drm_connector_ida_destroy();
 }
 
+static int __init accel_core_init(void)
+{
+#ifdef CONFIG_ACCEL
+	int ret;
+
+	ret = accel_sysfs_init();
+	if (ret < 0) {
+		DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
+		goto error;
+	}
+
+	accel_debugfs_root = debugfs_create_dir("accel", NULL);
+
+	ret = register_chrdev(ACCEL_MAJOR, "accel", &drm_stub_fops);
+	if (ret < 0)
+		goto error;
+
+error:
+	/* Any cleanup will be done in drm_core_exit() that will call
+	 * to accel_core_exit()
+	 */
+	return ret;
+#else
+	return 0;
+#endif
+}
+
 static int __init drm_core_init(void)
 {
 	int ret;
@@ -1061,6 +1102,10 @@ static int __init drm_core_init(void)
 	if (ret < 0)
 		goto error;
 
+	ret = accel_core_init();
+	if (ret < 0)
+		goto error;
+
 	drm_privacy_screen_lookup_init();
 
 	drm_core_init_complete = true;
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 7bb98e6a446d..cbeb9bd3c312 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -147,9 +147,12 @@ void drm_master_internal_release(struct drm_device *dev);
 
 /* drm_sysfs.c */
 extern struct class *drm_class;
+extern struct class *accel_class;
 
 int drm_sysfs_init(void);
 void drm_sysfs_destroy(void);
+int accel_sysfs_init(void);
+void accel_sysfs_destroy(void);
 struct device *drm_sysfs_minor_alloc(struct drm_minor *minor);
 int drm_sysfs_connector_add(struct drm_connector *connector);
 void drm_sysfs_connector_remove(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 430e00b16eec..70b2a28f55c4 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -56,6 +56,7 @@ static struct device_type drm_sysfs_device_connector = {
 };
 
 struct class *drm_class;
+struct class *accel_class;
 
 #ifdef CONFIG_ACPI
 static bool drm_connector_acpi_bus_match(struct device *dev)
@@ -148,6 +149,57 @@ static void drm_sysfs_release(struct device *dev)
 	kfree(dev);
 }
 
+static char *accel_devnode(struct device *dev, umode_t *mode)
+{
+	return kasprintf(GFP_KERNEL, "accel/%s", dev_name(dev));
+}
+
+static CLASS_ATTR_STRING(accel_version, 0444, "accel 1.0.0 20221018");
+
+/**
+ * accel_sysfs_init - initialize sysfs helpers
+ *
+ * This is used to create the ACCEL class, which is the implicit parent of any
+ * other top-level ACCEL sysfs objects.
+ *
+ * You must call accel_sysfs_destroy() to release the allocated resources.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int accel_sysfs_init(void)
+{
+	int err;
+
+	accel_class = class_create(THIS_MODULE, "accel");
+	if (IS_ERR(accel_class))
+		return PTR_ERR(accel_class);
+
+	err = class_create_file(accel_class, &class_attr_accel_version.attr);
+	if (err) {
+		class_destroy(accel_class);
+		accel_class = NULL;
+		return err;
+	}
+
+	accel_class->devnode = accel_devnode;
+
+	return 0;
+}
+
+/**
+ * accel_sysfs_destroy - destroys ACCEL class
+ *
+ * Destroy the ACCEL device class.
+ */
+void accel_sysfs_destroy(void)
+{
+	if (IS_ERR_OR_NULL(accel_class))
+		return;
+	class_remove_file(accel_class, &class_attr_accel_version.attr);
+	class_destroy(accel_class);
+	accel_class = NULL;
+}
+
 /*
  * Connector properties
  */
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 6ed61c371f6c..88e4926208e7 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -70,6 +70,7 @@ typedef int drm_ioctl_compat_t(struct file *filp, unsigned int cmd,
 #define DRM_IOCTL_NR(n)                _IOC_NR(n)
 #define DRM_IOCTL_TYPE(n)              _IOC_TYPE(n)
 #define DRM_MAJOR       226
+#define ACCEL_MAJOR     261
 
 /**
  * enum drm_ioctl_flags - DRM ioctl flags
-- 
2.34.1

