Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F9E950496
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F2810E319;
	Tue, 13 Aug 2024 12:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZaeDJ4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541E510E318;
 Tue, 13 Aug 2024 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551178; x=1755087178;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2lZuZVFeOiclAWcSJwOscUKhucFNwAH+bKElI+hlcyc=;
 b=PZaeDJ4Bp6ovs1TGgzRxCbEjxYO3MET2FY1kP+r/EzJ+Jt14GjJzq6TH
 Lt7y+WkqkcmafO9ZKl6cwzR38ya/fzz+V97chzOxCd/Wh8vH9qzp8xVPm
 BxyACvA7Z1bZnnNnINTfOvt0HtA1ModPCpq9MkXrwbN1NTdDWnacskYm5
 KTXupd45f5y2dvHvgTCC5/o16i8L1pcESnCXNUhhAxg6B8pB/oTW8T5By
 DPfUtHjtGva5iWfltSwUt0gkf+V5jRWLiuXy4/xgdVrZtLaqmS2+66itu
 o8iRrE9zP5WC5v9xs8QvoWXXK0p9ExNJ3s3C6mKdNTR6PoyoZYpIIowwO w==;
X-CSE-ConnectionGUID: l2QyyDHlSGmQyYExlAXXHw==
X-CSE-MsgGUID: cqOsJ2zfRna//+indnlNpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21682588"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21682588"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:12:57 -0700
X-CSE-ConnectionGUID: bY9oRFrmQqqvfHNNywmgKw==
X-CSE-MsgGUID: /ax/e25sT9C32TZD7ytYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="89450926"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:12:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, akinobu.mita@gmail.com,
 akpm@linux-foundation.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, jani.nikula@intel.com
Subject: [PATCH 1/3] fault-inject: improve build for CONFIG_FAULT_INJECTION=n
Date: Tue, 13 Aug 2024 15:12:35 +0300
Message-Id: <20240813121237.2382534-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The fault-inject.h users across the kernel need to add a lot of #ifdef
CONFIG_FAULT_INJECTION to cater for shortcomings in the header. Make
fault-inject.h self-contained for CONFIG_FAULT_INJECTION=n, and add
stubs for DECLARE_FAULT_ATTR(), setup_fault_attr(), should_fail_ex(),
and should_fail() to allow removal of conditional compilation.

Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/linux/fault-inject.h | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
index 354413950d34..8c829d28dcf3 100644
--- a/include/linux/fault-inject.h
+++ b/include/linux/fault-inject.h
@@ -2,13 +2,17 @@
 #ifndef _LINUX_FAULT_INJECT_H
 #define _LINUX_FAULT_INJECT_H
 
+#include <linux/err.h>
+#include <linux/types.h>
+
+struct dentry;
+struct kmem_cache;
+
 #ifdef CONFIG_FAULT_INJECTION
 
-#include <linux/types.h>
-#include <linux/debugfs.h>
+#include <linux/atomic.h>
 #include <linux/configfs.h>
 #include <linux/ratelimit.h>
-#include <linux/atomic.h>
 
 /*
  * For explanation of the elements of this struct, see
@@ -51,6 +55,28 @@ int setup_fault_attr(struct fault_attr *attr, char *str);
 bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags);
 bool should_fail(struct fault_attr *attr, ssize_t size);
 
+#else /* CONFIG_FAULT_INJECTION */
+
+struct fault_attr {
+};
+
+#define DECLARE_FAULT_ATTR(name) struct fault_attr name = {}
+
+static inline int setup_fault_attr(struct fault_attr *attr, char *str)
+{
+	return 0; /* Note: 0 means error for __setup() handlers! */
+}
+static inline bool should_fail_ex(struct fault_attr *attr, ssize_t size, int flags)
+{
+	return false;
+}
+static inline bool should_fail(struct fault_attr *attr, ssize_t size)
+{
+	return false;
+}
+
+#endif /* CONFIG_FAULT_INJECTION */
+
 #ifdef CONFIG_FAULT_INJECTION_DEBUG_FS
 
 struct dentry *fault_create_debugfs_attr(const char *name,
@@ -87,10 +113,6 @@ static inline void fault_config_init(struct fault_config *config,
 
 #endif /* CONFIG_FAULT_INJECTION_CONFIGFS */
 
-#endif /* CONFIG_FAULT_INJECTION */
-
-struct kmem_cache;
-
 #ifdef CONFIG_FAIL_PAGE_ALLOC
 bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order);
 #else
-- 
2.39.2

