Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89311B1591E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A8A10E406;
	Wed, 30 Jul 2025 06:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EW3GKlWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE37D10E406;
 Wed, 30 Jul 2025 06:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753858284; x=1785394284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fOCQPRj8uPcTjIf5sLaBak84squSevnSJSbBT8+CZp0=;
 b=EW3GKlWYa5DtGWeElVIGyRdpSYKAZnPQXe5HtUxoDu8M30AjUNeQA5yl
 eq2p1DirBoY1X2VvSJOrQenkkZYQ5cMxGNKAgd/dwMN4zWgCp6KWq5NAV
 +/0GqFmV3b6P+ZBHSrbcQSUDv5yFJWz7VnigsRWV2hpS2zLtIKdhImCpk
 FaPhktGdZF0yCkdRgInA+DgnWGNFoqUVIt5jl31WrF3O4f20ERXfXUtDH
 HfgTr0xDKn8XPBpfN1ECryevbrUa673/dGitxEMi+tt+T+wpyq8e/zaKg
 nJNZGM/QnoXY0Fdn/VO1kMjuHLunc/reBjJ7qmJMSzelyUWtvWXgTVDru w==;
X-CSE-ConnectionGUID: dFvxFn1cTaOz7TqCeAZi4g==
X-CSE-MsgGUID: +8PZY3N1RQ6omttIL9nYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="66847935"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="66847935"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:23 -0700
X-CSE-ConnectionGUID: bi6QYybiS1uEBtIwSu0AQQ==
X-CSE-MsgGUID: KQf0ffTcRf2oQJaW4wQAEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162178272"
Received: from aravind-dev.iind.intel.com ([10.190.239.36])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2025 23:51:19 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
	Michael J <michael.j.ruhl@intel.com>,
	Riana Tauro <riana.tauro@intel.com>,
	Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [RFC v5 2/5] drm/xe/RAS: Register netlink capability
Date: Wed, 30 Jul 2025 12:19:53 +0530
Message-Id: <20250730064956.1385855-3-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
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

v3: compile only if CONFIG_NET is enabled

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  2 ++
 drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_device_types.h |  1 +
 drivers/gpu/drm/xe/xe_netlink.c      | 26 ++++++++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_netlink.c

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 80eecd35e807..e960c2dbe658 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -304,6 +304,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/skl_universal_plane.o \
 	i915-display/skl_watermark.o
 
+xe-$(CONFIG_NET) += xe_netlink.o
+
 ifeq ($(CONFIG_ACPI),y)
 	xe-$(CONFIG_DRM_XE_DISPLAY) += \
 		i915-display/intel_acpi.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 806dbdf8118c..ca7a17c16aa5 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -363,6 +363,8 @@ static const struct file_operations xe_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
+extern const struct driver_genl_ops xe_genl_ops[];
+
 static struct drm_driver driver = {
 	/* Don't use MTRRs here; the Xserver or userspace app should
 	 * deal with them for Intel hardware.
@@ -381,6 +383,10 @@ static struct drm_driver driver = {
 #ifdef CONFIG_PROC_FS
 	.show_fdinfo = xe_drm_client_fdinfo,
 #endif
+#ifdef CONFIG_NET
+	.genl_ops = xe_genl_ops,
+#endif
+
 	.ioctls = xe_ioctls,
 	.num_ioctls = ARRAY_SIZE(xe_ioctls),
 	.fops = &xe_driver_fops,
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 3a851c7a55dd..08d3e53e4b37 100644
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
index 000000000000..9e588fb19631
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_netlink.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <net/genetlink.h>
+#include <uapi/drm/drm_netlink.h>
+
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

