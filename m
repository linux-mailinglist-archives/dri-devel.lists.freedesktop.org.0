Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A938D4C66
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 15:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B7F510F59F;
	Thu, 30 May 2024 13:19:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmMZ8kwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3390B10F16D;
 Thu, 30 May 2024 13:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717075163; x=1748611163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p06VUY4KWhUjAgNP0/HLknNnN295aRhmM4BDAeAbnBI=;
 b=MmMZ8kwKOk9/RopQ+Ql9nu/HxNS+yUddb+SIpnUOWUbOCsxrovWyiYU+
 MKlic08zcPRGkKjethBfvDJBD9tM7ZTzvadwdLMljnSsSoGaednFPqp7Q
 QBxtYTVyk18SDDa5ZUQFoTFGBSc04qsV5IJQXmzApgEfF2Rm4vbIGUq2G
 gUIqk0GpIJVN/o5LHC/ZMLmiwZOxkdK8wQVbMJNGduHeURo+QvQPM/zJD
 axlrMUvgTpsdlSg8tXiHQNKYvcbnUUO3idSnK9gIFTkV1FzZ802j5gkl6
 4tuCXBvInzG8HZEow50d58ZiIUGaZTS8wS+8Mx0+h6me0S9wtA8UHkG1G A==;
X-CSE-ConnectionGUID: vG1U2dQwR+mq3XEaZUCPtw==
X-CSE-MsgGUID: tR8Hr0WLSh+NgZYFJVt6Og==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24168120"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="24168120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:23 -0700
X-CSE-ConnectionGUID: 66ks9SaXQwKdeC7zKdN9uw==
X-CSE-MsgGUID: jXoVqjVIQ5+sgZmBo8EZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="66671532"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 06:19:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 01/10] drm: move intel-gtt.h under include/drm/intel
Date: Thu, 30 May 2024 16:19:02 +0300
Message-Id: <ae224504d99cc6428da6dced9dcde2b7953624ef.1717075103.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717075103.git.jani.nikula@intel.com>
References: <cover.1717075103.git.jani.nikula@intel.com>
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
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
index 626b166e67ef..a6c69a706fd7 100644
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

