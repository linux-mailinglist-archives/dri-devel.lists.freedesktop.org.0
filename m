Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C47D1342
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 17:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5C10E5D4;
	Fri, 20 Oct 2023 15:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426E310E0F7;
 Fri, 20 Oct 2023 15:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697817366; x=1729353366;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JqCT+/uFqs8dr/7DDg6QssbfdFXWgJeKvvet4LKFO2c=;
 b=PSjpyu+gru72wpcPPMsKtWjm+8W6maUdlxeu5DSkC70QL4fahCdMik7x
 JHcyO39InlTRsUZWG6lF7GHPNlYv+v6uxFyHD6NmnP/EI8WoslTGiSL2B
 mmCiIqUXOm+Emzmu2+8iW5MFGY47/YG2ecKPAYDUH2zOi3bANAeIC19YC
 hiIF/JDybxRuHOc0ZbM7G5VjisoWz1u5tY60YKjSYn8hAxpfi1LMXPmgc
 HD2dbVXzYCqio3jiQH9MqPTRzroctWtAEMS1XA8wTRkaxFyRlIXiaOA6A
 t9G7fC0LbLFXu775j6Hcl7fs/PTL+yZE+HjdW222MmrRMTTWJZA/oBVU3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453000007"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="453000007"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="1088778587"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="1088778587"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 08:56:01 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 joonas.lahtinen@linux.intel.com, ogabbay@kernel.org, ttayar@habana.ai,
 Hawking.Zhang@amd.com, Harish.Kasiviswanathan@amd.com,
 Felix.Kuehling@amd.com, Luben.Tuikov@amd.com, michael.j.ruhl@intel.com
Subject: [RFC v2 2/5] drm/xe/RAS: Register netlink capability
Date: Fri, 20 Oct 2023 21:28:32 +0530
Message-Id: <20231020155835.1295524-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
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
index ed772f440689..048f9a23e2f0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -87,6 +87,7 @@ xe-y += xe_bb.o \
 	xe_mmio.o \
 	xe_mocs.o \
 	xe_module.o \
+	xe_netlink.o \
 	xe_pat.o \
 	xe_pci.o \
 	xe_pcode.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 628cb46a2509..8c928719a537 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -151,6 +151,8 @@ static void xe_driver_release(struct drm_device *dev)
 	pci_set_drvdata(to_pci_dev(xe->drm.dev), NULL);
 }
 
+extern const struct driver_genl_ops xe_genl_ops[];
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -159,6 +161,7 @@ static struct drm_driver driver = {
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
 	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
+
 	.open = xe_file_open,
 	.postclose = xe_file_close,
 
@@ -170,6 +173,7 @@ static struct drm_driver driver = {
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
 	.release = &xe_driver_release,
+	.genl_ops = xe_genl_ops,
 
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index a1bacf820d37..8201f3644b86 100644
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

