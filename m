Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909570EFD9
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 09:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353C610E589;
	Wed, 24 May 2023 07:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D90F10E589
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 07:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684914583; x=1716450583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6anOSORczknS/n1eMEIVZRFlHnI+O+NwTTN+AcFx7A=;
 b=JTC0ST7ao7u9uiAsA8dricgNMtjfE+j8B1o8n5Fvj8nLtwzwmaKRYTSg
 cZwMf3qUdSZhWs/YHSuE9NdxMbbYoU55FTHCG2W5Yl72DSR9/bL+O7erg
 ft5zJJVHGyrqIjKMemCnVeWjwXjfkPL9QuWn93BqHzZ3bp0rNqjhlzZiC
 y/tsIMNYLNvecXbiaxOE4WdcIzw+c2Gr1PQ9NzJ6j3X+Szw7CjyO3opAS
 ZrB0bPA3uPAMLjXiv1KpwdAEGUh1QFCiNs8KJK7dTPQOywKHj4NntN8W4
 0i9WdH9xEX2tkNs95Ac6pA0dZNkrNOfa3li3wEppAG7hnvqgvWKpfSzzz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419200783"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="419200783"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="681767748"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="681767748"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 00:49:40 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] accel/ivpu: Initial debugfs support
Date: Wed, 24 May 2023 09:48:43 +0200
Message-Id: <20230524074847.866711-2-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
References: <20230524074847.866711-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add initial debugfs support. Provide below functionality:

- print buffer objects
- print latest boot mode
- trigger vpu engine reset

Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/Makefile       |  1 +
 drivers/accel/ivpu/ivpu_debugfs.c | 74 +++++++++++++++++++++++++++++++
 drivers/accel/ivpu/ivpu_debugfs.h | 13 ++++++
 drivers/accel/ivpu/ivpu_drv.c     |  5 +++
 4 files changed, 93 insertions(+)
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.c
 create mode 100644 drivers/accel/ivpu/ivpu_debugfs.h

diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
index 80f1fb3548ae..3ca2fb3936f6 100644
--- a/drivers/accel/ivpu/Makefile
+++ b/drivers/accel/ivpu/Makefile
@@ -2,6 +2,7 @@
 # Copyright (C) 2023 Intel Corporation
 
 intel_vpu-y := \
+	ivpu_debugfs.o \
 	ivpu_drv.o \
 	ivpu_fw.o \
 	ivpu_gem.o \
diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
new file mode 100644
index 000000000000..df51ec008fb5
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020-2023 Intel Corporation
+ */
+
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/drm_print.h>
+
+#include <uapi/drm/ivpu_accel.h>
+
+#include "ivpu_debugfs.h"
+#include "ivpu_drv.h"
+#include "ivpu_gem.h"
+#include "ivpu_jsm_msg.h"
+#include "ivpu_pm.h"
+
+static int bo_list_show(struct seq_file *s, void *v)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct drm_printer p = drm_seq_file_printer(s);
+
+	ivpu_bo_list(node->minor->dev, &p);
+
+	return 0;
+}
+
+static int last_bootmode_show(struct seq_file *s, void *v)
+{
+	struct drm_info_node *node = (struct drm_info_node *)s->private;
+	struct ivpu_device *vdev = to_ivpu_device(node->minor->dev);
+
+	seq_printf(s, "%s\n", (vdev->pm->is_warmboot) ? "warmboot" : "coldboot");
+
+	return 0;
+}
+
+static const struct drm_info_list vdev_debugfs_list[] = {
+	{"bo_list", bo_list_show, 0},
+	{"last_bootmode", last_bootmode_show, 0},
+};
+
+static ssize_t
+ivpu_reset_engine_fn(struct file *file, const char __user *user_buf, size_t size, loff_t *pos)
+{
+	struct ivpu_device *vdev = file->private_data;
+
+	if (!size)
+		return -EINVAL;
+
+	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COMPUTE))
+		return -ENODEV;
+	if (ivpu_jsm_reset_engine(vdev, DRM_IVPU_ENGINE_COPY))
+		return -ENODEV;
+
+	return size;
+}
+
+static const struct file_operations ivpu_reset_engine_fops = {
+	.owner = THIS_MODULE,
+	.open = simple_open,
+	.write = ivpu_reset_engine_fn,
+};
+
+void ivpu_debugfs_init(struct drm_minor *minor)
+{
+	struct ivpu_device *vdev = to_ivpu_device(minor->dev);
+
+	drm_debugfs_create_files(vdev_debugfs_list, ARRAY_SIZE(vdev_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	debugfs_create_file("reset_engine", 0200, minor->debugfs_root, vdev,
+			    &ivpu_reset_engine_fops);
+}
diff --git a/drivers/accel/ivpu/ivpu_debugfs.h b/drivers/accel/ivpu/ivpu_debugfs.h
new file mode 100644
index 000000000000..78f80c1e00e4
--- /dev/null
+++ b/drivers/accel/ivpu/ivpu_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020-2023 Intel Corporation
+ */
+
+#ifndef __IVPU_DEBUGFS_H__
+#define __IVPU_DEBUGFS_H__
+
+struct drm_minor;
+
+void ivpu_debugfs_init(struct drm_minor *minor);
+
+#endif /* __IVPU_DEBUGFS_H__ */
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 2df7643b843d..4c0345417c14 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -14,6 +14,7 @@
 #include <drm/drm_prime.h>
 
 #include "vpu_boot_api.h"
+#include "ivpu_debugfs.h"
 #include "ivpu_drv.h"
 #include "ivpu_fw.h"
 #include "ivpu_gem.h"
@@ -378,6 +379,10 @@ static const struct drm_driver driver = {
 	.gem_prime_import = ivpu_gem_prime_import,
 	.gem_prime_mmap = drm_gem_prime_mmap,
 
+#if defined(CONFIG_DEBUG_FS)
+	.debugfs_init = ivpu_debugfs_init,
+#endif
+
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
 	.fops = &ivpu_fops,
-- 
2.25.1

