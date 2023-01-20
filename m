Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81F675A3A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651FD10EAAB;
	Fri, 20 Jan 2023 16:41:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB3710EAA9;
 Fri, 20 Jan 2023 16:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232882; x=1705768882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6+aUMB2iz+HbeSZBYeZVNCBJQoqRwKY+t40FMKs6J3c=;
 b=A2Tn2dTjQSQXNYyD99OmpMCJ5apSPf+i5WpwRHhQkZJ0KeGEJVRlO3lw
 eBN7lj1ukjxQvDm+4MTvQzI55RLmqxbneo3ezNpXU0ytLWCseBMXN+H6r
 HjZnqq3+M8VwgzKV6bL6n29TuGlIJouYEAWgi/huagHg6FXb5qZ1RIvLc
 3iHvm/AM27ncPpc4VAc3oXoPb+CNTzfORbd1iOHz75eeSsflqi8f2eV8a
 rSaOAdivjumiol1lVHvYwtW/eDoDX0HvT9qvm/ZpxFeQB740ec8Davj+I
 FLdHZm+J9uSQQCl3/tVypzIEoDfkZLOioArLgHy9+KWGogNNpMXPWBvSh Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323309836"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="323309836"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691109966"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="691109966"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 08:41:21 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfb023485; Fri, 20 Jan 2023 16:41:20 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] drm/i915/guc: Add GuC oriented print macros
Date: Fri, 20 Jan 2023 17:40:43 +0100
Message-Id: <20230120164050.1765-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
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

