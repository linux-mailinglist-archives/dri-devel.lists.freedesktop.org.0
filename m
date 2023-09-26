Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224B27AEE66
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FAF10E3F4;
	Tue, 26 Sep 2023 14:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F91810E120;
 Tue, 26 Sep 2023 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695737936; x=1727273936;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=orC1Y5MsbpMtL9pwprjABjckPCdp3jG22p6Kg+5Am58=;
 b=Gc/qTvZQc0zoKovI9280Qu9Bkafq9lwNXuzDStpEfYwk2rwxKr5qOXnI
 XCIDSjjZu6IJVP44znNaOiaDAk+lixAO6ZZB/UFtgohmemKC9KhbvMrhy
 jaC12irxFPWw0WW89vqRXG6ecqUsWiE7fK3X5I2PJ2pCCpFpNUZPSoNi8
 glMgLK5whKZwWHdOPBg9k3Fh6zjKfKO7Xj9k+6cL6vwV5a+azmUzLHqUP
 ReoD/6yW9vpQ+D5h0+rjfHOTADcomd8p+rrTUDYt0C9KQxVJmnH6C9YSj
 QjEvFZXa7ionDPeandAf4Zp9RNYJdFHtGpTbxx8nmgevNNZ9lzyJBOD1Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="378852105"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="378852105"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:18:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="872518667"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; d="scan'208";a="872518667"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 07:18:50 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Skip MCR ops for ring fault register
Date: Tue, 26 Sep 2023 16:18:42 +0200
Message-ID: <20230926141842.8681-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL GEN12_RING_FAULT_REG is not replicated so don't
do mcr based operation for this register.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c      | 14 +++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  1 +
 drivers/gpu/drm/i915/i915_gpu_error.c   | 11 ++++++++++-
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 93062c35e072..d4de692e8be1 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -262,10 +262,22 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
 				   I915_MASTER_ERROR_INTERRUPT);
 	}
 
-	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
+	/*
+	 * for media tile this ring fault register is not replicated
+	 * so skip doing mcr ops on it.
+	 */
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
+	    gt->type == GT_MEDIA) {
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
index f4ebcfb70289..83f1a729da8b 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1234,7 +1234,16 @@ static void engine_record_registers(struct intel_engine_coredump *ee)
 	if (GRAPHICS_VER(i915) >= 6) {
 		ee->rc_psmi = ENGINE_READ(engine, RING_PSMI_CTL);
 
-		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+		/*
+		 * for media tile this ring fault register is not replicated
+		 * so skip doing mcr ops on it.
+		 */
+		if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
+		    engine->gt->type == GT_MEDIA)
+			ee->fault_reg = intel_uncore_read(engine->uncore,
+							  XELPMP_RING_FAULT_REG);
+
+		else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
 			ee->fault_reg = intel_gt_mcr_read_any(engine->gt,
 							      XEHP_RING_FAULT_REG);
 		else if (GRAPHICS_VER(i915) >= 12)
-- 
2.41.0

