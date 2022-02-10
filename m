Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F7B4B17C6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 22:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49E10E965;
	Thu, 10 Feb 2022 21:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDCB10E965;
 Thu, 10 Feb 2022 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644529341; x=1676065341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ePOQcL5uULY5Y1iZrPk0F0WwGnMrNbwGSaNNLLAu0ck=;
 b=mg1oioO5i4MnHLyVMHivbqEJLXBGl3gzDMDAAylYdUCEoGH1S8ibQGfS
 tMXziLBK4ccaDUwRGkhU4pjnr/b16j6sOjpS2oTNIIOjc36v86sMolRgh
 mar7hljnJFoa6xX+Ub1IlFNei7lQS8WQx5I3Ps9MIWVvHtGCPU53IuvoX
 os/WiCfeimnU5UaFJ4TlFNBj9674naJmajWlZ4i2A4iUPDmzT4m7V6OqQ
 atk1RaunkaMAbo7OvVSvpXd6dgmo+0hTmDx51UF2c6XcQXCl0beIxcIPw
 kBkLRbHwSiKkRARBv3kre0BrSGEIor2ajzrFH59j+iHxeHWiXK3fXEPkV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249547368"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249547368"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 13:42:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="485949870"
Received: from lmoua-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.169.226])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 13:42:20 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/i915/gt: Move wbvind_on_all_cpus #define
Date: Thu, 10 Feb 2022 13:42:16 -0800
Message-Id: <20220210214216.1227694-2-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210214216.1227694-1-michael.cheng@intel.com>
References: <20220210214216.1227694-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move wbvind_on_all_cpus to intel_gt.h. This will allow other wbind_on_all_cpus
calls to benefit from the #define logic, and prevent compiler errors
when building for non-x86 architectures.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c | 7 -------
 drivers/gpu/drm/i915/gt/intel_gt.h     | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
index 6da68b38f00f..ff7340ae5ac8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pm.c
@@ -12,13 +12,6 @@
 
 #include "i915_drv.h"
 
-#if defined(CONFIG_X86)
-#include <asm/smp.h>
-#else
-#define wbinvd_on_all_cpus() \
-	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
-#endif
-
 void i915_gem_suspend(struct drm_i915_private *i915)
 {
 	GEM_TRACE("%s\n", dev_name(i915->drm.dev));
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 2dad46c3eff2..149e8c13e402 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -10,6 +10,13 @@
 #include "intel_gt_types.h"
 #include "intel_reset.h"
 
+#if defined(CONFIG_X86)
+#include <asm/smp.h>
+#else
+#define wbinvd_on_all_cpus() \
+         pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
+#endif
+
 struct drm_i915_private;
 struct drm_printer;
 
-- 
2.25.1

