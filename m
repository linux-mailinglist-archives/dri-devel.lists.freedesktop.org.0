Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9AE46D0E1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 11:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5976F51F;
	Wed,  8 Dec 2021 10:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1C36F510;
 Wed,  8 Dec 2021 10:21:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261878384"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="261878384"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 02:20:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="679842493"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 02:20:53 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/i915: Test all device memory on probing
Date: Wed,  8 Dec 2021 15:50:30 +0530
Message-Id: <20211208102031.4397-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208102031.4397-1-ramalingam.c@intel.com>
References: <20211208102031.4397-1-ramalingam.c@intel.com>
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
Cc: Andi <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

This extends the previous sanitychecking of device memory to read/write
all the memory on the device during the device probe, ala memtest86,
as an optional module parameter: i915.memtest=1. This is not expected to
be fast, but a reasonably thorough verfification that the device memory
is accessible and doesn't return bit errors.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/i915_params.c         |  3 ++
 drivers/gpu/drm/i915/i915_params.h         |  1 +
 drivers/gpu/drm/i915/intel_memory_region.c | 36 ++++++++++++++--------
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index e07f4cfea63a..525ae832aa9a 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -140,6 +140,9 @@ i915_param_named_unsafe(invert_brightness, int, 0400,
 i915_param_named(disable_display, bool, 0400,
 	"Disable display (default: false)");
 
+i915_param_named(memtest, bool, 0400,
+	"Perform a read/write test of all device memory on module load (default: off)");
+
 i915_param_named(mmio_debug, int, 0400,
 	"Enable the MMIO debug code for the first N failures (default: off). "
 	"This may negatively affect performance.");
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 8d725b64592d..c9d53ff910a0 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -64,6 +64,7 @@ struct drm_printer;
 	param(char *, guc_firmware_path, NULL, 0400) \
 	param(char *, huc_firmware_path, NULL, 0400) \
 	param(char *, dmc_firmware_path, NULL, 0400) \
+	param(bool, memtest, false, 0400) \
 	param(int, mmio_debug, -IS_ENABLED(CONFIG_DRM_I915_DEBUG_MMIO), 0600) \
 	param(int, edp_vswing, 0, 0400) \
 	param(unsigned int, reset, 3, 0600) \
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index c53e07f1d0c0..95adc2cf5dde 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -93,9 +93,12 @@ static resource_size_t random_page(resource_size_t last)
 	return prandom_u32_max(last >> PAGE_SHIFT) << PAGE_SHIFT;
 }
 
-static int iomemtest(struct intel_memory_region *mem, const void *caller)
+static int iomemtest(struct intel_memory_region *mem,
+		     bool test_all,
+		     const void *caller)
 {
 	resource_size_t last = resource_size(&mem->region) - PAGE_SIZE;
+	resource_size_t page;
 	int err;
 
 	/*
@@ -109,17 +112,25 @@ static int iomemtest(struct intel_memory_region *mem, const void *caller)
 	 * a random offset within as a quick spot check for bad memory.
 	 */
 
-	err = iopagetest(mem, 0, caller);
-	if (err)
-		return err;
+	if (test_all) {
+		for (page = 0; page <= last; page += PAGE_SIZE) {
+			err = iopagetest(mem, page, caller);
+			if (err)
+				return err;
+		}
+	} else {
+		err = iopagetest(mem, 0, caller);
+		if (err)
+			return err;
 
-	err = iopagetest(mem, last, caller);
-	if (err)
-		return err;
+		err = iopagetest(mem, last, caller);
+		if (err)
+			return err;
 
-	err = iopagetest(mem, random_page(last), caller);
-	if (err)
-		return err;
+		err = iopagetest(mem, random_page(last), caller);
+		if (err)
+			return err;
+	}
 
 	return 0;
 }
@@ -221,8 +232,9 @@ intel_memory_region_create(struct drm_i915_private *i915,
 			goto err_free;
 	}
 
-	if (io_start && IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)) {
-		err = iomemtest(mem, (void *)_RET_IP_);
+	if (io_start &&
+	    (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM) || i915->params.memtest)) {
+		err = iomemtest(mem, i915->params.memtest, (void *)_RET_IP_);
 		if (err)
 			goto err_release;
 	}
-- 
2.20.1

