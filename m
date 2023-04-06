Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F46D9F14
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 19:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCA810EC89;
	Thu,  6 Apr 2023 17:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D45510EC72;
 Thu,  6 Apr 2023 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680803069; x=1712339069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dT6Sl2eDrvNeTYuGb922fAYDEai8sPR7JcrlaJg87QQ=;
 b=WlV/D/rmZdHLJPk02ILk8cg+n0R3C/VplbIr1gNVodAxM4oSOyESzG8a
 SdlGooUjjowiF4pPUCdls30QZUX+9H7Yu86+i2iA3V2eux02va3bEPoeR
 mXCeASWnei3qXnOBSNuj0DE7KOazUn5tg45MuNfHD25GmnF+3lKU2btH6
 L0u18V8Fes06iqoD34FiptXcgMZmIkMSK74JktVf5I2oSwRniyHn26NlG
 vshuf3XEMseI3CgRD3aryccnrjFGZdnT8ngTDc6LpIX/ZkrxRlptvXRBU
 X1uQvldoJIjhgQ573VeG5O6zUlxGW6utHEoZnHMoR2hhZCIvleSMw7ZZb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345432464"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="345432464"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 10:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="680757361"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; d="scan'208";a="680757361"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga007.jf.intel.com with ESMTP; 06 Apr 2023 10:44:28 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 6/8] drm/i915/uapi/pxp: Fix UAPI spec comments and add
 GET_PARAM for PXP
Date: Thu,  6 Apr 2023 10:44:17 -0700
Message-Id: <20230406174419.471256-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
References: <20230406174419.471256-1-alan.previn.teres.alexis@intel.com>
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

1. UAPI update:
Without actually changing backward compatible behavior, update
i915's drm-uapi comments that describe the possible error values
when creating a context with I915_CONTEXT_PARAM_PROTECTED_CONTENT.
Since the first merge of PXP support on ADL, i915 returns
-ENXIO if a dependency such as firmware or component driver
was yet to be loaded or returns -EIO if the creation attempt
failed when requested by the PXP firmware (specific firmware
error responses are reported in dmesg).

2. GET_PARAM for PXP:
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

With this change, large delays are only met by user-space procsses
that explicitly need to create a PXP context and boot very early.
There is no way to avoid this today.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c |  5 +++++
 include/uapi/drm/i915_drm.h          | 22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index dba7c5a5b25e..0c1729bd911d 100644
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
@@ -2096,6 +2110,14 @@ struct drm_i915_gem_context_param {
  *
  * -ENODEV: feature not available
  * -EPERM: trying to mark a recoverable or not bannable context as protected
+ * -ENXIO: A dependency such as a component driver or firmware is not yet
+ *         loaded and user space may attempt again. Depending on the device
+ *         this error may be reported if the protected context creation is
+ *         attempted very early from kernel start (numbers vary depending on
+ *         system and kernel config):
+ *            - ADL/RPL: up to 3 seconds
+ *            - MTL: up to 8 seconds
+ * -EIO: The firmware did not succeed in creating the protected context.
  */
 #define I915_CONTEXT_PARAM_PROTECTED_CONTENT    0xd
 /* Must be kept compact -- no holes and well documented */
-- 
2.39.0

