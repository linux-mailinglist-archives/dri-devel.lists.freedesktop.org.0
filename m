Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC997B01BA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABA610E4CC;
	Wed, 27 Sep 2023 10:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B303910E4BB;
 Wed, 27 Sep 2023 10:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695810200; x=1727346200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K2N7K7b2CBJleyEFFu1+qlWNRuDuXmgQ3yRUHH2HaVY=;
 b=ErDLkQiITvFOBY/q9kxF6Ty5Aja2Py8gDwN/ui4Bg45Bmd54mETa0QNW
 zBSX68DdlwHfXRt1tzo/0p245u5qCQgUN2BInxt52jAG2Mk5Ummz8Hvo8
 bkPZ1uJ+1da5QAlcLrIlRDj1t+g9QLrqpWiX9Ozb2JnOkSPB3CL6kCigd
 7YSAVqmHCs1uhfNsc4HLeUzV9iBogfMaK6tlwovqkOoLf6aoUIIhsCAam
 W1hkxpE06yZdLJOdfjz6zgSiUKctnRhpH3MYt1t6paeQaKaPHjpu7YtEf
 ofNjHXccGlE0h5bKdK4W3lFoPt4L+4FrAphXpesFRXkL9rP3EOoO053y7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384579332"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="384579332"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080093630"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080093630"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:22:49 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/mtl: Skip MCR ops for ring fault register
Date: Wed, 27 Sep 2023 12:22:37 +0200
Message-ID: <20230927102237.30773-3-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927102237.30773-1-nirmoy.das@intel.com>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL GEN12_RING_FAULT_REG is not replicated so don't
do mcr based operation for this register.

v2: use MEDIA_VER() instead of GRAPHICS_VER()(Matt).
v3: s/"MEDIA_VER(i915) == 13"/"MEDIA_VER(i915) >= 13"(Matt)
    improve comment.
v4: improve the comment further(Andi)

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c      | 13 ++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 drivers/gpu/drm/i915/i915_gpu_error.c   | 11 ++++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f6d9aba9ebb0..3578b78d5a2f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -262,10 +262,21 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
 				   I915_MASTER_ERROR_INTERRUPT);
 	}
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	/*
+	 * For the media GT, this ring fault register is not replicated,
+	 * so don't do multicast/replicated register read/write operation on it.
+	 */
+	if (MEDIA_VER(i915) >= 13 && gt->type == GT_MEDIA) {
+		intel_uncore_rmw(uncore, XELPMP_RING_FAULT_REG,
+				 RING_FAULT_VALID, 0);
+		intel_uncore_posting_read(uncore,
+					  XELPMP_RING_FAULT_REG);
+
+	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
 		intel_gt_mcr_multicast_rmw(gt, XEHP_RING_FAULT_REG,
 					   RING_FAULT_VALID, 0);
 		intel_gt_mcr_read_any(gt, XEHP_RING_FAULT_REG);
+
 	} else if (GRAPHICS_VER(i915) >= 12) {
 		intel_uncore_rmw(uncore, GEN12_RING_FAULT_REG, RING_FAULT_VALID, 0);
 		intel_uncore_posting_read(uncore, GEN12_RING_FAULT_REG);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index cca4bac8f8b0..eecd0a87a647 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1084,6 +1084,7 @@
 
 #define GEN12_RING_FAULT_REG			_MMIO(0xcec4)
 #define XEHP_RING_FAULT_REG			MCR_REG(0xcec4)
+#define XELPMP_RING_FAULT_REG			_MMIO(0xcec4)
 #define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
 #define   RING_FAULT_GTTSEL_MASK		(1 << 11)
 #define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index f4ebcfb70289..b4e31e59c799 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1234,7 +1234,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
 	if (GRAPHICS_VER(i915) >= 6) {
 		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
 
-		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+		/*
+		 * For the media GT, this ring fault register is not replicated,
+		 * so don't do multicast/replicated register read/write
+		 * operation on it.
+		 */
+		if (MEDIA_VER(i915) >= 13 && engine->gt->type == GT_MEDIA)
+			ee->fault_reg = intel_uncore_read(engine->uncore,
+							  XELPMP_RING_FAULT_REG);
+
+		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
 			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
 							      XEHP_RING_FAULT_REG);
 		else if (GRAPHICS_VER(i915) >= 12)
-- 
2.41.0

