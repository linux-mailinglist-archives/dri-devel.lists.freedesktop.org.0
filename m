Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F282B616ED1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 21:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAB010E60D;
	Wed,  2 Nov 2022 20:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DF710E60D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 20:34:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5BDDAB82469;
 Wed,  2 Nov 2022 20:34:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E80C433B5;
 Wed,  2 Nov 2022 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667421260;
 bh=iJP0+58bg6H21ZtOSo1JNsjuytNpyr5vbaN+xzNBUTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vCJ8tsAOc9AwtQU93KtI6qVLtY0NAR7NDFFnFqFRzqJ5xGQJw1/wuUpvL/kJNh5gV
 lJLEPv91FtZbeDA9clLnWwWSiqKJSeC2jCWYcJBmjgyO7GOIqsjDKvCyXWq7h98SH4
 8qwutIHyRRtnJl0MS+ZF12lS3pVTlN5pZkPGk6iWdVzIia8Jy6U9qlP6kMHT2YdLlL
 ySnldnYE7n3mwcC7GPLOm/4EeHa7nja6+9xCJeD8Zdd6eX4fpnmcFJ7uJcfB2gPj+n
 DBAGFXJ4T5DcTaJjcsE3IIj+OSpWQPuRQu7ydTZ5q1fyuoaHadtgJKJ8EcNxQva/04
 mgETA+skfPIDw==
From: Oded Gabbay <ogabbay@kernel.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a new
 major
Date: Wed,  2 Nov 2022 22:34:03 +0200
Message-Id: <20221102203405.1797491-2-ogabbay@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102203405.1797491-1-ogabbay@kernel.org>
References: <20221102203405.1797491-1-ogabbay@kernel.org>
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

Add a new Kconfig for the accel subsystem. The Kconfig currently
contains only the basic CONFIG_ACCEL option that will be used to
decide whether to compile the accel registration code. That code will
be called directly from the DRM core code.

The accelerator devices will be exposed to the user space with a new,
dedicated major number - 261.

The accel init function registers the new major number as a char device
and create corresponding sysfs and debugfs root entries, similar to
what is done in DRM init function.

I added a new header called drm_accel.h to include/drm/, that will hold
the prototypes of the accel_drv.c functions. In case CONFIG_ACCEL is
set to 'N', that header will contain empty inline implementations of
those functions, to allow DRM core code to compile successfully
without dependency on CONFIG_ACCEL.

I Updated the MAINTAINERS file accordingly with the newly added folder
and I have taken the liberty to appropriate the dri-devel mailing list
and the dri-devel IRC channel for the accel subsystem.

Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
Changes in v2:
 - Created accel_drv.c that will hold the accel framework core functions,
   instead of embedding the code inside drm core functions.
 - Created drm/drm_accel.h
 - Removed all #ifdef CONFIG_ACCEL from drm_drv.c

 Documentation/admin-guide/devices.txt |   5 ++
 MAINTAINERS                           |   8 ++
 drivers/Kconfig                       |   2 +
 drivers/Makefile                      |   3 +
 drivers/accel/Kconfig                 |  24 ++++++
 drivers/accel/Makefile                |  10 +++
 drivers/accel/accel_drv.c             | 112 ++++++++++++++++++++++++++
 include/drm/drm_accel.h               |  31 +++++++
 8 files changed, 195 insertions(+)
 create mode 100644 drivers/accel/Kconfig
 create mode 100644 drivers/accel/Makefile
 create mode 100644 drivers/accel/accel_drv.c
 create mode 100644 include/drm/drm_accel.h

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
diff --git a/MAINTAINERS b/MAINTAINERS
index ab07cf28844e..9b34f756e343 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6825,6 +6825,14 @@ F:	include/drm/drm*
 F:	include/linux/vga*
 F:	include/uapi/drm/drm*

+DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
+M:	Oded Gabbay <ogabbay@kernel.org>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+C:	irc://irc.oftc.net/dri-devel
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
+F:	drivers/accel/
+
 DRM DRIVERS FOR ALLWINNER A10
 M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 19ee995bd0ae..968bd0a6fd78 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -99,6 +99,8 @@ source "drivers/media/Kconfig"

 source "drivers/video/Kconfig"

+source "drivers/accel/Kconfig"
+
 source "sound/Kconfig"

 source "drivers/hid/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index bdf1c66141c9..658199dcee96 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -62,6 +62,9 @@ obj-y				+= iommu/
 # gpu/ comes after char for AGP vs DRM startup and after iommu
 obj-y				+= gpu/

+# accel is part of drm so it must come after gpu
+obj-$(CONFIG_ACCEL)		+= accel/
+
 obj-$(CONFIG_CONNECTOR)		+= connector/

 # i810fb and intelfb depend on char/agp/
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
new file mode 100644
index 000000000000..282ea24f90c5
--- /dev/null
+++ b/drivers/accel/Kconfig
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Compute Acceleration device configuration
+#
+# This framework provides support for compute acceleration devices, such
+# as, but not limited to, Machine-Learning and Deep-Learning acceleration
+# devices
+#
+menuconfig ACCEL
+	tristate "Compute Acceleration Framework"
+	depends on DRM
+	help
+	  Framework for device drivers of compute acceleration devices, such
+	  as, but not limited to, Machine-Learning and Deep-Learning
+	  acceleration devices.
+	  If you say Y here, you need to select the module that's right for
+	  your acceleration device from the list below.
+	  This framework is integrated with the DRM subsystem as compute
+	  accelerators and GPUs share a lot in common and can use almost the
+	  same infrastructure code.
+	  Having said that, acceleration devices will have a different
+	  major number than GPUs, and will be exposed to user-space using
+	  different device files, called accel/accel* (in /dev, sysfs
+	  and debugfs)
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
new file mode 100644
index 000000000000..b5b7d812a8ef
--- /dev/null
+++ b/drivers/accel/Makefile
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# Makefile for the accel framework. This framework provides support for
+# compute acceleration devices, such as, but not limited to, Machine-Learning
+# and Deep-Learning acceleration devices
+
+accel-y := \
+	accel_drv.o
+
+obj-$(CONFIG_ACCEL)	+= accel.o
diff --git a/drivers/accel/accel_drv.c b/drivers/accel/accel_drv.c
new file mode 100644
index 000000000000..6132765ea054
--- /dev/null
+++ b/drivers/accel/accel_drv.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright 2022 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+
+#include <drm/drm_accel.h>
+#include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
+
+static struct dentry *accel_debugfs_root;
+struct class *accel_class;
+
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
+static int accel_sysfs_init(void)
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
+static void accel_sysfs_destroy(void)
+{
+	if (IS_ERR_OR_NULL(accel_class))
+		return;
+	class_remove_file(accel_class, &class_attr_accel_version.attr);
+	class_destroy(accel_class);
+	accel_class = NULL;
+}
+
+static int accel_stub_open(struct inode *inode, struct file *filp)
+{
+	DRM_DEBUG("Operation not supported");
+
+	return -EOPNOTSUPP;
+}
+
+static const struct file_operations accel_stub_fops = {
+	.owner = THIS_MODULE,
+	.open = accel_stub_open,
+	.llseek = noop_llseek,
+};
+
+void accel_core_exit(void)
+{
+	unregister_chrdev(ACCEL_MAJOR, "accel");
+	debugfs_remove(accel_debugfs_root);
+	accel_sysfs_destroy();
+}
+
+int __init accel_core_init(void)
+{
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
+	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
+	if (ret < 0)
+		goto error;
+
+error:
+	/* Any cleanup will be done in drm_core_exit() that will call
+	 * to accel_core_exit()
+	 */
+	return ret;
+}
diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
new file mode 100644
index 000000000000..cf43a7b30f34
--- /dev/null
+++ b/include/drm/drm_accel.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright 2022 HabanaLabs, Ltd.
+ * All Rights Reserved.
+ *
+ */
+
+#ifndef DRM_ACCEL_H_
+#define DRM_ACCEL_H_
+
+#define ACCEL_MAJOR     261
+
+#if IS_ENABLED(CONFIG_ACCEL)
+
+void accel_core_exit(void);
+int accel_core_init(void);
+
+#else
+
+static inline void accel_core_exit(void)
+{
+}
+
+static inline int __init accel_core_init(void)
+{
+	return 0;
+}
+
+#endif /* IS_ENABLED(CONFIG_ACCEL) */
+
+#endif /* DRM_ACCEL_H_ */
--
2.25.1

