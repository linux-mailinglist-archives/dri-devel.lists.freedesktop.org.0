Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8514B67FA9D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6115D10E1F8;
	Sat, 28 Jan 2023 19:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FA810E078;
 Sat, 28 Jan 2023 19:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935960; x=1706471960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1kJ99avfGpNFfO9Ujr5BLqvmNxDmIuAlcOTeYzk9f6I=;
 b=AzqgZfgIt4ioFtmYVHxXIsn9CRZbUkBkIs5O7BTaPZx4u64nVjdVDYki
 IM4lqKPksS4MYhpmAAuEOmypx9wCJuOf082aL7Z5VV4KejOQwXpBfasUI
 jSzCm/3F398VjngRRffzMO5bWvny3kViTiRM6jymezKV/+m+mFSvpBUet
 6/COV1gTsTBjzgmILY4wnJwUQPJiilWgp3c7W2RAuPgF9KtGc5/wu0oap
 sFj9wY8yzLa3GInMJJnWxxKdFLvsu1fj0q3dO4nom12+BARhRk1oq53pj
 EwUri26jV908AqP+OfeDTv7GNA7q/a1BqTZMEawmaEM5K9e7unFxNDoow Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978115"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567924"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567924"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:18 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CCA3A333EE;
 Sat, 28 Jan 2023 19:59:17 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/8] drm/i915/guc: Add GuC oriented print macros
Date: Sat, 28 Jan 2023 20:59:00 +0100
Message-Id: <20230128195907.1837-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
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
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
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

