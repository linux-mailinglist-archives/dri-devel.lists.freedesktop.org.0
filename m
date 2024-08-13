Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A995049E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 14:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FB610E31E;
	Tue, 13 Aug 2024 12:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwSHt200";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEA110E31D;
 Tue, 13 Aug 2024 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723551204; x=1755087204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kIIgzNfbPPOeGVzqpET5xjIMVCHKwtwP40zzL2GwutI=;
 b=XwSHt200BS3drkk+8bJgjZkiqFcKOFDid78V46htBuyOj+zDjfaPbiD4
 cgN8fELXISXizRSU+1GOCmCePxbzxsJ3Q2khqTmlJLh51FiCcNdJrJV/Y
 4SJ+KyIgsZImw9yN25E72O4S0S8e4yLEvlTpRCE/L4F+DgIwP3M2h763j
 hZbmdO5sZJXJEr2NvAjIPmI9/1ZQIcpHF5eXcMmYzm1EH/jG+xibSDH2g
 sly2Rdh7Xjnel+SwZ5HkPGnXvtcAW/S8pUUOa3DgV0Cd1X52xbtvOgQpR
 HciVNB/Z+sX3mhZoMXQlbeebiZxtKPVsOdNwWX9MJX6ENcRzy8aItWOwT g==;
X-CSE-ConnectionGUID: 9RdN7gGZSlazq0AYuJdvMA==
X-CSE-MsgGUID: +0/wCFQoSca9SykxT40ZVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21682776"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="21682776"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:13:12 -0700
X-CSE-ConnectionGUID: lGY95YNjTQ+6J6x1sGUetw==
X-CSE-MsgGUID: rQdXfg7pS2OG+6k4DkMosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="89451014"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 05:13:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, akinobu.mita@gmail.com,
 akpm@linux-foundation.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, jani.nikula@intel.com
Subject: [PATCH 3/3] drm/xe: clean up fault injection usage
Date: Tue, 13 Aug 2024 15:12:37 +0300
Message-Id: <20240813121237.2382534-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

With the proper stubs in place in linux/fault-inject.h, we can remove a
bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c |  7 +------
 drivers/gpu/drm/xe/xe_gt.h      | 10 ++--------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..b381bfb634f7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,6 +6,7 @@
 #include "xe_debugfs.h"
 
 #include <linux/debugfs.h>
+#include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
@@ -26,10 +27,7 @@
 #include "xe_vm.h"
 #endif
 
-#ifdef CONFIG_FAULT_INJECTION
-#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
 DECLARE_FAULT_ATTR(gt_reset_failure);
-#endif
 
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
@@ -214,8 +212,5 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
-#ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
-#endif
-
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8b1a5027dcf2..ee138e9768a2 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_H_
 #define _XE_GT_H_
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_util.h>
 
 #include "xe_device.h"
@@ -19,19 +21,11 @@
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
 
-#ifdef CONFIG_FAULT_INJECTION
-#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
 {
 	return should_fail(&gt_reset_failure, 1);
 }
-#else
-static inline bool xe_fault_inject_gt_reset(void)
-{
-	return false;
-}
-#endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_hwconfig(struct xe_gt *gt);
-- 
2.39.2

