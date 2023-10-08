Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA87BCD80
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 11:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E1510E0C8;
	Sun,  8 Oct 2023 09:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6E910E0C8;
 Sun,  8 Oct 2023 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696757031; x=1728293031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+woAk0TS50+MxZ4BmKLHK3OHQzUJ/1acgxT8qxwTyQw=;
 b=Id8Y7HzOOa+Hd3daQVyxaWsAfTfSwFKLL6UZIVpN+Zxy4/T1R09Kucb6
 L0qGSPMZ/CgrI/WxZtQdt1cJTo+r4C60r8aOEn959DymWc6plV09crpAc
 Nby3YF5IlW7gV2xPLpq+Yk79ZeSZbMaAhM7dEsRMfBg+rn/q2t8waoY/a
 sfcGA63th6vUyGx8fVa55BFdx7vWT74FIYcSnLnYyispF1gV2WpUZjtRx
 0SVaj6iy66QEXQ46zRjJZjaWZB9No3RVUTbTXRudqF/QQf+mCjFoQS7+P
 BjjkN1L9OAfEzYXAuNoYGbzZZPAIFfkJY+m7OWgIXRnwILhrvKrVphuHw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="364278971"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="364278971"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="1084007091"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="1084007091"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2023 02:23:48 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com
Subject: [RFC v2 2/5] drm/xe/RAS: Register netlink capability
Date: Sun,  8 Oct 2023 14:56:13 +0530
Message-Id: <20231008092616.1457995-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
References: <20231008092616.1457995-1-aravind.iddamsetty@linux.intel.com>
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

Register netlink capability with the DRM and register the driver
callbacks to DRM RAS netlink commands.

v2:
Move the netlink registration parts to DRM susbsytem (Tomer Tayar)

Cc: Tomer Tayar <ttayar@habana.ai>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  4 ++++
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_netlink.c      | 22 ++++++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index be1f3afec3dc..6bdea5ffb41b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -86,6 +86,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_netlink.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 687dc3d79a66..21bc304af70b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -150,6 +150,8 @@ static void xe_driver_release(struct drm_device *dev)
 	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
 }
 
+extern const struct driver_genl_ops xe_genl_ops[];
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -158,6 +160,7 @@ static struct drm_driver driver = {
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
+
 	.open = xe_file_open,
 	.postclose = xe_file_close,
 
@@ -169,6 +172,7 @@ static struct drm_driver driver = {
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
 	.release = &xe_driver_release,
+	.genl_ops = xe_genl_ops,
 
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index ff476a167be4..fc6e132954e1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_netlink.h>
 #include <drm/ttm/ttm_device.h>
 
 #include "xe_devcoredump_types.h"
diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
new file mode 100644
index 000000000000..81d785455632
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+#include "xe_device.h"
+
+static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
+{
+	return 0;
+}
+
+/* driver callbacks to DRM netlink commands*/
+const struct driver_genl_ops xe_genl_ops[] = {
+	[DRM_RAS_CMD_QUERY] =		{ .doit = xe_genl_list_errors },
+	[DRM_RAS_CMD_READ_ONE] =	{ .doit = xe_genl_read_error },
+	[DRM_RAS_CMD_READ_ALL] =	{ .doit = xe_genl_list_errors, },
+};
-- 
2.25.1

