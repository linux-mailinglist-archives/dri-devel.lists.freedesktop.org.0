Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04D889EF75
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 12:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B8DC10EA29;
	Wed, 10 Apr 2024 10:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3VWeaM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD7D10EA29;
 Wed, 10 Apr 2024 10:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743540; x=1744279540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rBF2oLNkI2E3iMi2kjJUABNNODuPtAWHFYKT/YeH6pU=;
 b=M3VWeaM7avLOTz4BJofAkXU3zBj0TZi30xi7JNhITn3o2v2awbIXwSx7
 9FfTMFcL7khTRLoD29T3pbAD/oZ4dZVfpL8FtNoFMvF9uvUt+hRDFhzlC
 vqMiv7RQmCbRljwQTxqH4DGyp6mD34lrbCU2km6uGfje2k3s+3OZT/tO6
 JOt4p1ipFrlRz+qGday+/INN5XsP5vRABOm8mCkh1ePxbX9NJ5ZCFJiG+
 EjrI+jtBkkCkJPIaiXGJZpnmVc8I4x2Qje8/p8/nR6IO/2yRGLo8Nnvi5
 4MjhQ0gph+74bF/2dlNEPE2YdtPYXebKU9v8FbKgnANPU4g79fcdWlGyL Q==;
X-CSE-ConnectionGUID: WyYYL0z9SUW8yIwAT/ATrQ==
X-CSE-MsgGUID: 1mc7qmx5RPqmNa06tSIBvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8320039"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8320039"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:38 -0700
X-CSE-ConnectionGUID: yDwubA+HQsCsdCT2Alu62A==
X-CSE-MsgGUID: hvZlR9L/TSO4qualNIs1dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20460976"
Received: from oakasatk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:05:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 02/10] drm: move intel-gtt.h under include/drm/intel
Date: Wed, 10 Apr 2024 13:05:09 +0300
Message-Id: <25b1e49297bcc2eda2a626e7fd0ee398df9e3f70.1712743191.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712743191.git.jani.nikula@intel.com>
References: <cover.1712743191.git.jani.nikula@intel.com>
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

Clean up the top level include/drm directory by grouping all the Intel
specific files under a common subdirectory.

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/char/agp/intel-agp.c              | 2 +-
 drivers/char/agp/intel-gtt.c              | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c        | 2 +-
 include/drm/{ => intel}/intel-gtt.h       | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename include/drm/{ => intel}/intel-gtt.h (100%)

diff --git a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
index c518b3a9db04..eec80db6402d 100644
--- a/drivers/char/agp/intel-agp.c
+++ b/drivers/char/agp/intel-agp.c
@@ -12,7 +12,7 @@
 #include <asm/smp.h>
 #include "agp.h"
 #include "intel-agp.h"
-#include <drm/intel-gtt.h>
+#include <drm/intel/intel-gtt.h>
 
 static int intel_fetch_size(void)
 {
diff --git a/drivers/char/agp/intel-gtt.c b/drivers/char/agp/intel-gtt.c
index bf6716ff863b..11f5cf853c46 100644
--- a/drivers/char/agp/intel-gtt.c
+++ b/drivers/char/agp/intel-gtt.c
@@ -25,7 +25,7 @@
 #include <asm/smp.h>
 #include "agp.h"
 #include "intel-agp.h"
-#include <drm/intel-gtt.h>
+#include <drm/intel/intel-gtt.h>
 #include <asm/set_memory.h>
 
 /*
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 0d0a0dc9f610..2717699c6591 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -10,7 +10,7 @@
 
 #include <drm/drm_managed.h>
 #include <drm/i915_drm.h>
-#include <drm/intel-gtt.h>
+#include <drm/intel/intel-gtt.h>
 
 #include "display/intel_display.h"
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
index 866c416afb73..59eed0a0ce90 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
@@ -5,7 +5,7 @@
 
 #include "intel_ggtt_gmch.h"
 
-#include <drm/intel-gtt.h>
+#include <drm/intel/intel-gtt.h>
 
 #include <linux/agp_backend.h>
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 580b5141ce1e..bab805ca4f0d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -4,7 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
-#include <drm/intel-gtt.h>
+#include <drm/intel/intel-gtt.h>
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
diff --git a/include/drm/intel-gtt.h b/include/drm/intel/intel-gtt.h
similarity index 100%
rename from include/drm/intel-gtt.h
rename to include/drm/intel/intel-gtt.h
-- 
2.39.2

