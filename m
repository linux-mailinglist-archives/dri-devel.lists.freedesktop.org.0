Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E20792D95
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 20:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4B010E340;
	Tue,  5 Sep 2023 18:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F09610E1A7;
 Tue,  5 Sep 2023 18:45:46 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DCE59660728F;
 Tue,  5 Sep 2023 19:45:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693939545;
 bh=MhxhJBJbBzaBTGhs6JZKNFkL0G+t+vvnmMffEkd8aFk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c65tNdljPU4DPTedFXeJd+X/GP8ohzlgh8/44ZVw7K7d7+vv/Obg37TR0Qw09qS8f
 Zdh/UVc4balNx+Z7hgXdXOi/SgLPqkY5kRjJPFP5Nzr/fgKINnorLQpNhxlnJjbsL6
 lsTx6MV97psqo5Dr+C4KiZaxYs7n7cZUTVMUgVYX4My/j3DxH3W6tPHuxrCispOCgH
 fczr4qDm3NRre6dEf++Rlow1zVhjZZlTxZ3omEHS5UFAk2AXKWBc9QitMHV3yx/dB9
 lOIe5rHQ+oqCQQ5r2rZgC8ucvcDmXwHiueUN7m6qs5QwV5zJH1qL/MmFDWi82sHCXK
 JdhXxeav0pjuw==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, robh@kernel.org, steven.price@arm.com
Subject: [PATCH v3 3/8] drm/panfrost: Enable debugfs toggling of cycle counter
 register
Date: Tue,  5 Sep 2023 19:45:19 +0100
Message-ID: <20230905184533.959171-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905184533.959171-1-adrian.larumbe@collabora.com>
References: <20230905184533.959171-1-adrian.larumbe@collabora.com>
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
Cc: linux-arm-msm@vger.kernel.org, adrian.larumbe@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 healych@amazon.com, kernel@collabora.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow user space to decide whether the cycle counting register should be
enabled. The main goal is letting tools like nvtop or IGT's gputop access
this information in debug builds to obtain engine utilisation numbers.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/Makefile           |  2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 51 +++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 ++
 4 files changed, 71 insertions(+)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h

diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 7da2b3f02ed9..2c01c1e7523e 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -12,4 +12,6 @@ panfrost-y := \
 	panfrost_perfcnt.o \
 	panfrost_dump.o
 
+panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
+
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
new file mode 100644
index 000000000000..48d5ddfcb1c6
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/debugfs.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/panfrost_drm.h>
+
+#include "panfrost_device.h"
+#include "panfrost_gpu.h"
+#include "panfrost_debugfs.h"
+
+static int
+profile_get(void *data, u64 *val)
+{
+	struct drm_device *dev = data;
+	struct panfrost_device *pfdev = dev->dev_private;
+
+	*val = atomic_read(&pfdev->profile_mode);
+
+	return 0;
+}
+
+static int
+profile_set(void *data, u64 val)
+{
+	struct drm_device *dev = data;
+	struct panfrost_device *pfdev = dev->dev_private;
+
+	if (atomic_read(&pfdev->profile_mode) == val)
+		return 0;
+
+	if (val == false)
+		panfrost_cycle_counter_stop(pfdev);
+	else
+		atomic_set(&pfdev->profile_mode, 1);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(profile_fops,
+			 profile_get, profile_set,
+			 "%llu\n");
+
+void panfrost_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+
+	debugfs_create_file("profile", 0600, minor->debugfs_root,
+		dev, &profile_fops);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
new file mode 100644
index 000000000000..db1c158bcf2f
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2023 Collabora ltd.
+ */
+
+#ifndef PANFROST_DEBUGFS_H
+#define PANFROST_DEBUGFS_H
+
+#ifdef CONFIG_DEBUG_FS
+void panfrost_debugfs_init(struct drm_minor *minor);
+#endif
+
+#endif  /* PANFROST_DEBUGFS_H */
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a2ab99698ca8..2dfd9f79a31b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,6 +20,7 @@
 #include "panfrost_job.h"
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
+#include "panfrost_debugfs.h"
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -546,6 +547,10 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init		= panfrost_debugfs_init,
+#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
-- 
2.42.0

