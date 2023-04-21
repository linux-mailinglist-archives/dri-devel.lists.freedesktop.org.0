Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB86EA330
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 07:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29B410ED97;
	Fri, 21 Apr 2023 05:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACFB10ED7C;
 Fri, 21 Apr 2023 05:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682055256; x=1713591256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pslmGnDjMWfMXHcBgEjWwSIrT6JHHUXPYGzCk6OwpY4=;
 b=QZR9IdBqw9WGCy4RQFYAq9/MzBT2tHZpt9p2RFOQGTC/q4RN8B+Mx00I
 9YKa4qa7YPsg+wiambGrQqAAqE1++ul311wfo+Wh7cMin9DklefORblMJ
 Y7KsGW4ZofcxIa2cSIiee9R5iXpRs0iccivnLAvQb5MXOtRFJ/iqq6AQT
 q20YUbFEwW4rnQayq5wYfxiuM81xwwpR5Gwa7A+qVU/BQvc7crN8uU+mN
 YLULm4+Jg9ESrIx5xE0yHwpHstl2ThYc7KzM3U26sADR6pZfUYtzvvHUY
 Q0gpK5XJMF0cwGV6GxsA6I9WSr/AtNqd/vRffgOjzX59FET0+6d/gMBg/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="411186941"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="411186941"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 22:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="669612113"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="669612113"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 20 Apr 2023 22:34:15 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 6/8] drm/i915/uapi/pxp: Add a GET_PARAM for PXP
Date: Thu, 20 Apr 2023 22:34:07 -0700
Message-Id: <20230421053410.1836241-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
References: <20230421053410.1836241-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Juston Li <justonli@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because of the additional firmware, component-driver and
initialization depedencies required on MTL platform before a
PXP context can be created, UMD calling for PXP creation as a
way to get-caps can take a long time. An actual real world
customer stack has seen this happen in the 4-to-8 second range
after the kernel starts (which sees MESA's init appear in the
middle of this range as the compositor comes up). To avoid
unncessary delays experienced by the UMD for get-caps purposes,
add a GET_PARAM for I915_PARAM_PXP_SUPPORT.

However, some failures can still occur after all the depedencies
are met (such as firmware init flow failure, bios configurations
or SOC fusing not allowing PXP enablement). Those scenarios will
only be known to user space when it attempts creating a PXP context.

With this change, large delays are only met by user-space processes
that explicitly need to create a PXP context and boot very early.
There is no way to avoid this today.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c |  5 +++++
 include/uapi/drm/i915_drm.h          | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 2238e096c957..9729384f033f 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -5,6 +5,8 @@
 #include "gem/i915_gem_mman.h"
 #include "gt/intel_engine_user.h"
 
+#include "pxp/intel_pxp.h"
+
 #include "i915_cmd_parser.h"
 #include "i915_drv.h"
 #include "i915_getparam.h"
@@ -102,6 +104,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		if (value < 0)
 			return value;
 		break;
+	case I915_PARAM_PXP_STATUS:
+		value = intel_pxp_is_enabled(i915->pxp) ? 0 : -ENODEV;
+		break;
 	case I915_PARAM_MMAP_GTT_VERSION:
 		/* Though we've started our numbering from 1, and so class all
 		 * earlier versions as 0, in effect their value is undefined as
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index b15dd9cc2ffb..e21991cd6c3d 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -771,6 +771,20 @@ typedef struct drm_i915_irq_wait {
  */
 #define I915_PARAM_OA_TIMESTAMP_FREQUENCY 57
 
+/*
+ * Query the status of PXP support in i915.
+ *
+ * The query can fail in the following scenarios with the listed error codes:
+ *  -ENODEV = PXP support is not available on the GPU device or in the kernel
+ *            due to missing component drivers or kernel configs.
+ * If the IOCTL is successful, the returned parameter will be set to one of the
+ * following values:
+ *   0 = PXP support maybe available but underlying SOC fusing, BIOS or firmware
+ *       configuration is unknown and a PXP-context-creation would be required
+ *       for final verification of feature availibility.
+ */
+#define I915_PARAM_PXP_STATUS		 58
+
 /* Must be kept compact -- no holes and well documented */
 
 /**
-- 
2.39.0

