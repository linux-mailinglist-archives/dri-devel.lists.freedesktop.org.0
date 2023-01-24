Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D5679FB7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F8F10E6DD;
	Tue, 24 Jan 2023 17:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8963B10E6D7;
 Tue, 24 Jan 2023 17:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674579993; x=1706115993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+aUMB2iz+HbeSZBYeZVNCBJQoqRwKY+t40FMKs6J3c=;
 b=c+xf4cGJIdkZotTeo/iYkZLrEMs4bwsVWX5eDZ9XigMeiMkTz4HCo2cD
 R3RzqH34XQuK/23b9/Jh2EWLQX9GpcxXjFEpupXtlBmb4pr0RdQXkiRKo
 Hj9pZ4SqtUnFNy+PLIyx+C9d41ntUtxx0T7Bh6o6tKF/qbVgxslf1pln9
 AEcIuE1GmD21gWo5IYMjGHIhvQ6Myzf6s1551DnnGB2xr7BA9q+RKPfwv
 GGGEZAyErOHTPlX1uWxUm6xUsdz/6XdI1EWv89O1EDc9CTZYa0pmkzowe
 Dl0XrvEV8v5UnnQdq9QCUnMYN8NqcPbTbPk1guL7NQnEpL9IrZZhPZay4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306007400"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306007400"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750895782"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750895782"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 09:05:24 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0C4C837E22;
 Tue, 24 Jan 2023 17:05:22 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/8] drm/i915/guc: Add GuC oriented print macros
Date: Tue, 24 Jan 2023 18:05:15 +0100
Message-Id: <20230124170522.1808-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230124170522.1808-1-michal.wajdeczko@intel.com>
References: <20230124170522.1808-1-michal.wajdeczko@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While we do have GT oriented print macros, add few more GuC
specific to have common look and feel across all messages
related to the GuC and to avoid chasing the gt pointer.

We will use these macros shortly in upcoming patches.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
new file mode 100644
index 000000000000..e75989d4ba06
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_GUC_PRINT__
+#define __INTEL_GUC_PRINT__
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
+
+#define guc_printk(_guc, _level, _fmt, ...) \
+	gt_##_level(guc_to_gt(_guc), "GUC: " _fmt, ##__VA_ARGS__)
+
+#define guc_err(_guc, _fmt, ...) \
+	guc_printk((_guc), err, _fmt, ##__VA_ARGS__)
+
+#define guc_warn(_guc, _fmt, ...) \
+	guc_printk((_guc), warn, _fmt, ##__VA_ARGS__)
+
+#define guc_notice(_guc, _fmt, ...) \
+	guc_printk((_guc), notice, _fmt, ##__VA_ARGS__)
+
+#define guc_info(_guc, _fmt, ...) \
+	guc_printk((_guc), info, _fmt, ##__VA_ARGS__)
+
+#define guc_dbg(_guc, _fmt, ...) \
+	guc_printk((_guc), dbg, _fmt, ##__VA_ARGS__)
+
+#define guc_err_ratelimited(_guc, _fmt, ...) \
+	guc_printk((_guc), err_ratelimited, _fmt, ##__VA_ARGS__)
+
+#define guc_probe_error(_guc, _fmt, ...) \
+	guc_printk((_guc), probe_error, _fmt, ##__VA_ARGS__)
+
+#define guc_WARN(_guc, _cond, _fmt, ...) \
+	gt_WARN(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
+
+#define guc_WARN_ONCE(_guc, _cond, _fmt, ...) \
+	gt_WARN_ONCE(guc_to_gt(_guc), _cond, "GUC: " _fmt, ##__VA_ARGS__)
+
+#define guc_WARN_ON(_guc, _cond) \
+	gt_WARN(guc_to_gt(_guc), _cond, "%s(%s)", "guc_WARN_ON", __stringify(_cond))
+
+#define guc_WARN_ON_ONCE(_guc, _cond) \
+	gt_WARN_ONCE(guc_to_gt(_guc), _cond, "%s(%s)", "guc_WARN_ON_ONCE", __stringify(_cond))
+
+#endif /* __INTEL_GUC_PRINT__ */
-- 
2.25.1

