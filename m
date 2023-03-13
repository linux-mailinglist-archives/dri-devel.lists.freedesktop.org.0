Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831856B848B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 23:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B8710E663;
	Mon, 13 Mar 2023 22:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693F810E663;
 Mon, 13 Mar 2023 22:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678745567; x=1710281567;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NZaqaH0TVurGxBhPAoKgiD07s4ubMLGH47FwctZ0fHk=;
 b=Rfxj1L/R/oD9CRYmovkkHZ4+ZfFWh5/fG6KKH3E0OyRizN+balBno+P0
 2xoTJ/XDI2/6pvnk9LRtsRBjz7qE2+17J1hO109HPwaxFAKPMox/JNN1W
 kAmAilVdbJcvk5xBbZBZx7v1mHrzm/ZkLbo1c52OQsJSgA1JMatCyJM8F
 bn9x9QOChNft7iWM8yYptY/UNfJksUQ18/E3zTrAUu5xpHt2LS3vGwPBz
 Nx1ULYV9oViTIo3WXEwZCR0XU4bcKsqPqwsbHnP2h/HoWP42YAiajA5G7
 Z5eupsv5+EU/RlqovsLLyZtsldmwZRVy0ZBEG7jVtAZzySj2OiR1O5eon Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="335967689"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="335967689"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 15:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="767871001"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="767871001"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 15:12:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/xe: Introduce GT oriented log messages
Date: Mon, 13 Mar 2023 23:12:33 +0100
Message-Id: <20230313221234.2628-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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

While debugging GT related problems, it's good to know which GT was
reporting problems. Introduce helper macros to allow prefix GT logs
with GT idetifier. We will use them in upcoming patches.

v2: use xe_ prefix (Lucas)

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_printk.h | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h

diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
new file mode 100644
index 000000000000..f01c8e5653a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_PRINTK_H_
+#define _XE_GT_PRINTK_H_
+
+#include <drm/drm_print.h>
+
+#include "xe_gt_types.h"
+
+#define xe_gt_printk(_gt, _level, _fmt, ...) \
+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_err(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_warn(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_notice(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_info(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_dbg(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_err_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define xe_gt_WARN(_gt, _condition, _fmt, ...) \
+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
+
+#define xe_gt_WARN_ON(_gt, _condition) \
+	xe_gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
+
+#define xe_gt_WARN_ON_ONCE(_gt, _condition) \
+	xe_gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
+
+#endif
-- 
2.25.1

