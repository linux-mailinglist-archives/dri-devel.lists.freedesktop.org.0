Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B868512A62
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 06:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95FA10E33F;
	Thu, 28 Apr 2022 04:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58710E16E;
 Thu, 28 Apr 2022 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651119583; x=1682655583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MqZjNrwp3e6BwY563NnkxrCKPrXoS2eMyWhX4ik8H24=;
 b=fB7DKOVdrN3O3ZcQrC9uJESbcgFH0ifA1uXtk2S85uvjCSBIyYjzZyzx
 OqOuNxervoyvx+Se8Qxf1N356GsqfvzUumx+4jegvsf78wCyUFYRMeunB
 zWjlY8JefCkcrtbS/c6bMhjxgGv4VbForoDgM10hCgeFYQqtSNBqnH9vN
 o7l4tpNAgn4LZ6dmxiGKjDDaa4Fnw7w51IQDrY9uV3zUQ+I8Nmob6WqNg
 vMdKJnw4Kucb1QjhV8y1taYYjQuLzTId2Avma9t7yfTrVhREWT4xmk+fF
 OxXehytOCCp+1oyzboNkydGG4fx+UYFocwX9OH1VciJdv3p2clWnHOzgO A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="326645780"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="326645780"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559403040"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 21:19:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/i915/xehp: Add register for compute engine's
 MMIO-based TLB invalidation
Date: Wed, 27 Apr 2022 21:19:24 -0700
Message-Id: <20220428041926.1483683-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428041926.1483683-1-matthew.d.roper@intel.com>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compute engines have a separate register that the driver should use to
perform MMIO-based TLB invalidation.

Note that the term "context" in this register's bspec description is
used to refer to the engine instance (in the same way "context" is used
on bspec 46167).

Bspec: 43930
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c      | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 92394f13b42f..53307ca0eed0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1175,6 +1175,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
 		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
 		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
+		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
 	};
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore = gt->uncore;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index a39718a40cc3..a0a49c16babd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1007,6 +1007,7 @@
 #define GEN12_VD_TLB_INV_CR			_MMIO(0xcedc)
 #define GEN12_VE_TLB_INV_CR			_MMIO(0xcee0)
 #define GEN12_BLT_TLB_INV_CR			_MMIO(0xcee4)
+#define GEN12_COMPCTX_TLB_INV_CR		_MMIO(0xcf04)
 
 #define GEN12_MERT_MOD_CTRL			_MMIO(0xcf28)
 #define RENDER_MOD_CTRL				_MMIO(0xcf2c)
-- 
2.35.1

