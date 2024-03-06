Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3986872C67
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 02:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AFF10E813;
	Wed,  6 Mar 2024 01:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gtkD4Yg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0BCD10FA61
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 01:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709690307;
 bh=5rE0UzIqG/TgQuHQBk0s7Cli9GVhBHPra6IpsjHEOAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gtkD4Yg8/Zl9njf3BiUYTmU3NvQuba8U246DN7LqoChFvxiHwlDnrfDpIIuDZUzEt
 NUhlKj2qWQ4rnD3WSLWBGGoN9XtpMEJkGi2GeiDzfqlgbQbqOjZHtxaYi1Yym3YrkV
 tNR/E3pzDXLbSQE4cpgCc0jMwhbDFKeh24HSJlPCZgkbAymmxB5dKX/8+GYjCIDBkD
 exwVibTjP0CgWV9nDn+XVBYqXoAoMKeGOhkOB+hrFR8x+bMwXKLXA478nTRPkiBBrg
 JPRuHtEgxDKRoDa36wWFRQN/gsvRGGJIPYFdiCzu8JOVzFD/1c8MpzvxQlm8/9xssR
 SqZVzioYpQ8gA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BBA7B37820BB;
 Wed,  6 Mar 2024 01:58:26 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Cc: kernel@collabora.com, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v3 1/1] drm/panfrost: Replace fdinfo's profiling debugfs knob
 with sysfs
Date: Wed,  6 Mar 2024 01:56:36 +0000
Message-ID: <20240306015819.822128-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306015819.822128-1-adrian.larumbe@collabora.com>
References: <20240306015819.822128-1-adrian.larumbe@collabora.com>
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

Debugfs isn't always available in production builds that try to squeeze
every single byte out of the kernel image, but we still need a way to
toggle the timestamp and cycle counter registers so that jobs can be
profiled for fdinfo's drm engine and cycle calculations.

Drop the debugfs knob and replace it with a sysfs file that accomplishes
the same functionality, and document its ABI in a separate file.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 .../testing/sysfs-driver-panfrost-profiling   | 10 +++++
 Documentation/gpu/panfrost.rst                |  9 ++++
 drivers/gpu/drm/panfrost/Makefile             |  2 -
 drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ----------
 drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 -------
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 41 ++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 8 files changed, 57 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h

diff --git a/Documentation/ABI/testing/sysfs-driver-panfrost-profiling b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
new file mode 100644
index 000000000000..1d8bb0978920
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-panfrost-profiling
@@ -0,0 +1,10 @@
+What:		/sys/bus/platform/drivers/panfrost/.../profiling
+Date:		February 2024
+KernelVersion:	6.8.0
+Contact:	Adrian Larumbe <adrian.larumbe@collabora.com>
+Description:
+		Get/set drm fdinfo's engine and cycles profiling status.
+		Valid values are:
+		0: Don't enable fdinfo job profiling sources.
+		1: Enable fdinfo job profiling sources, this enables both the GPU's
+		   timestamp and cycle counter registers.
\ No newline at end of file
diff --git a/Documentation/gpu/panfrost.rst b/Documentation/gpu/panfrost.rst
index b80e41f4b2c5..51ba375fd80d 100644
--- a/Documentation/gpu/panfrost.rst
+++ b/Documentation/gpu/panfrost.rst
@@ -38,3 +38,12 @@ the currently possible format options:
 
 Possible `drm-engine-` key names are: `fragment`, and  `vertex-tiler`.
 `drm-curfreq-` values convey the current operating frequency for that engine.
+
+Users must bear in mind that engine and cycle sampling are disabled by default,
+because of power saving concerns. `fdinfo` users and benchmark applications which
+query the fdinfo file must make sure to toggle the job profiling status of the
+driver by writing into the appropriate sysfs node::
+
+    echo <N> > /sys/bus/platform/drivers/panfrost/[a-f0-9]*.gpu/profiling
+
+Where `N` is either `0` or `1`, depending on the desired enablement status.
diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 2c01c1e7523e..7da2b3f02ed9 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -12,6 +12,4 @@ panfrost-y := \
 	panfrost_perfcnt.o \
 	panfrost_dump.o
 
-panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
-
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
deleted file mode 100644
index 72d4286a6bf7..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_debugfs.c
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright 2023 Collabora ltd. */
-/* Copyright 2023 Amazon.com, Inc. or its affiliates. */
-
-#include <linux/debugfs.h>
-#include <linux/platform_device.h>
-#include <drm/drm_debugfs.h>
-#include <drm/drm_file.h>
-#include <drm/panfrost_drm.h>
-
-#include "panfrost_device.h"
-#include "panfrost_gpu.h"
-#include "panfrost_debugfs.h"
-
-void panfrost_debugfs_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
-
-	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
-}
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
deleted file mode 100644
index c5af5f35877f..000000000000
--- a/drivers/gpu/drm/panfrost/panfrost_debugfs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright 2023 Collabora ltd.
- * Copyright 2023 Amazon.com, Inc. or its affiliates.
- */
-
-#ifndef PANFROST_DEBUGFS_H
-#define PANFROST_DEBUGFS_H
-
-#ifdef CONFIG_DEBUG_FS
-void panfrost_debugfs_init(struct drm_minor *minor);
-#endif
-
-#endif  /* PANFROST_DEBUGFS_H */
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 62f7e3527385..cffcb0ac7c11 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -130,7 +130,7 @@ struct panfrost_device {
 	struct list_head scheduled_jobs;
 
 	struct panfrost_perfcnt *perfcnt;
-	atomic_t profile_mode;
+	bool profile_mode;
 
 	struct mutex sched_lock;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a926d71e8131..9696702800a4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,7 +20,6 @@
 #include "panfrost_job.h"
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
-#include "panfrost_debugfs.h"
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -600,10 +599,6 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-
-#ifdef CONFIG_DEBUG_FS
-	.debugfs_init		= panfrost_debugfs_init,
-#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
@@ -692,6 +687,41 @@ static void panfrost_remove(struct platform_device *pdev)
 	drm_dev_put(ddev);
 }
 
+static ssize_t profiling_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", pfdev->profile_mode);
+}
+
+
+static ssize_t profiling_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t len)
+{
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
+	bool value;
+	int err;
+
+	err = kstrtobool(buf, &value);
+	if (err)
+		return err;
+
+	pfdev->profile_mode = value;
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(profiling);
+
+static struct attribute *panfrost_attrs[] = {
+	&dev_attr_profiling.attr,
+	NULL,
+};
+
+ATTRIBUTE_GROUPS(panfrost);
+
 /*
  * The OPP core wants the supply names to be NULL terminated, but we need the
  * correct num_supplies value for regulator core. Hence, we NULL terminate here
@@ -789,6 +819,7 @@ static struct platform_driver panfrost_driver = {
 		.name	= "panfrost",
 		.pm	= pm_ptr(&panfrost_pm_ops),
 		.of_match_table = dt_match,
+		.dev_groups = panfrost_groups,
 	},
 };
 module_platform_driver(panfrost_driver);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 0c2dbf6ef2a5..a61ef0af9a4e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -243,7 +243,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	subslot = panfrost_enqueue_job(pfdev, js, job);
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
-		if (atomic_read(&pfdev->profile_mode)) {
+		if (pfdev->profile_mode) {
 			panfrost_cycle_counter_get(pfdev);
 			job->is_profiled = true;
 			job->start_time = ktime_get();
-- 
2.43.0

