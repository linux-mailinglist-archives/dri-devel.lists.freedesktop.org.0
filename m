Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C87B1D2F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 15:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2984110E646;
	Thu, 28 Sep 2023 13:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A859410E641;
 Thu, 28 Sep 2023 13:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695906029; x=1727442029;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yVYOjD16lPxS35jtyj3M+NlpDlByKS0O7iJodZZ3QME=;
 b=D58QlLxnZR1eSzv7XXQWv+oDk+GllzoM60f13IQxIk0elcw//dU/3R6I
 K6pbJtzKKq8QROoW7ZTKVMYozLeL3qRUL1oG6UkKnVQFRQUn8T9mDSBUc
 aXkICh/bNi45Lq/SjTj71cZIR4SG7wsK+2kmKnH/GK3uSYrD9IqU2Ugfl
 UHPhPQ70/O0yuUJrKY9xi9dldQ8h+Jp2DVaANC8UUCcAxCw4i5LwimnOI
 cvGncK5YJ4p0ai8hYsaJ4bjjcm//njoZzKg01bNTi2j4YG+ZyyR9Md/PI
 lZLRAnQSSCl90/Z8QEHKCflsRovMK+uMWT0f1cTlBEbQhf3RbdHzzqKQm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380925510"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="380925510"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="865247807"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; d="scan'208";a="865247807"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 06:00:27 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 4/4] drm/i915/mtl: Skip MCR ops for ring fault register
Date: Thu, 28 Sep 2023 15:00:15 +0200
Message-ID: <20230928130015.6758-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928130015.6758-1-nirmoy.das@intel.com>
References: <20230928130015.6758-1-nirmoy.das@intel.com>
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
index 93062c35e072..dff8bba1f5d4 100644
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

