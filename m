Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4368598402F
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84C10E65F;
	Tue, 24 Sep 2024 08:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K04ztJn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4539810E65C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727165909; x=1758701909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qEe2Aow5wqOTeic8ZOvFcNKQhMd7OIOz2sc32nYA4eo=;
 b=K04ztJn/qSxy34kbyvLxX3zKnWtKbK5r2u3pE5yO3NB2AdgDA+F9u2GL
 XPrRik1tUCbF3ljrIzFHQlEv2ikf03pvuDUutDnaRxIuSYWmNkeGkF1hr
 /GjhmSCLYVuFKRdsibQmiX/X4DyxIOdaJCgPhgDtqHINgojGNyqDRDE0w
 7Ddcqdd/ss+XyTHWBu6lGfGlH4DBRAOb24qE4BrPkkB6qVZRQTuNve1hz
 2S2C3GaII1e3cJLG6aF/weIqA4BDAEGPhg5XPVU+goITW/y9guRtWEmLd
 AxgvKbryx5OQXEdARnFOXSUli9OOdgxNMI8e/N6EATooruryYHRHnqDC4 w==;
X-CSE-ConnectionGUID: GXQCmELRT8CF5tbYJJtRXg==
X-CSE-MsgGUID: b5FdgEVMRrSFQfSSn7A2TQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37506926"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="37506926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:29 -0700
X-CSE-ConnectionGUID: QVxTcsV6RlCJO4t8Rp7LsQ==
X-CSE-MsgGUID: DvVEWpGDSbC9XTyZ2FEATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; d="scan'208";a="102170673"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 01:18:24 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Karol Wachowski <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 09/29] accel/ivpu: Add FW version debugfs entry
Date: Tue, 24 Sep 2024 10:17:34 +0200
Message-ID: <20240924081754.209728-10-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Karol Wachowski <karol.wachowski@intel.com>

Add debugfs that prints current firmware version string on read.

Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_debugfs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_debugfs.c
index cd3ac08f0409a..65245f45cc701 100644
--- a/drivers/accel/ivpu/ivpu_debugfs.c
+++ b/drivers/accel/ivpu/ivpu_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/debugfs.h>
+#include <linux/firmware.h>
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
@@ -20,6 +21,8 @@
 #include "ivpu_jsm_msg.h"
 #include "ivpu_pm.h"
 
+#include "vpu_boot_api.h"
+
 static inline struct ivpu_device *seq_to_ivpu(struct seq_file *s)
 {
 	struct drm_debugfs_entry *entry = s->private;
@@ -45,6 +48,14 @@ static int fw_name_show(struct seq_file *s, void *v)
 	return 0;
 }
 
+static int fw_version_show(struct seq_file *s, void *v)
+{
+	struct ivpu_device *vdev = seq_to_ivpu(s);
+
+	seq_printf(s, "%s\n", (const char *)vdev->fw->file->data + VPU_FW_HEADER_SIZE);
+	return 0;
+}
+
 static int fw_trace_capability_show(struct seq_file *s, void *v)
 {
 	struct ivpu_device *vdev = seq_to_ivpu(s);
@@ -111,6 +122,7 @@ static int reset_pending_show(struct seq_file *s, void *v)
 static const struct drm_debugfs_info vdev_debugfs_list[] = {
 	{"bo_list", bo_list_show, 0},
 	{"fw_name", fw_name_show, 0},
+	{"fw_version", fw_version_show, 0},
 	{"fw_trace_capability", fw_trace_capability_show, 0},
 	{"fw_trace_config", fw_trace_config_show, 0},
 	{"last_bootmode", last_bootmode_show, 0},
-- 
2.45.1

