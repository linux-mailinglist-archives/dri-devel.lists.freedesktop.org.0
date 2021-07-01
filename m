Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED33B9744
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D746EB9F;
	Thu,  1 Jul 2021 20:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67896EB97;
 Thu,  1 Jul 2021 20:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208567509"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208567509"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564431"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/53] drm/i915/xehp: Extra media engines - Part 3 (reset)
Date: Thu,  1 Jul 2021 13:23:43 -0700
Message-Id: <20210701202427.1547543-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Xe_HP can have a lot of extra media engines. This patch adds the reset
support for them.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 6 ++++++
 drivers/gpu/drm/i915/i915_reg.h       | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 72251638d4ea..9586613ee399 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -515,8 +515,14 @@ static int gen11_reset_engines(struct intel_gt *gt,
 		[VCS1]  = GEN11_GRDOM_MEDIA2,
 		[VCS2]  = GEN11_GRDOM_MEDIA3,
 		[VCS3]  = GEN11_GRDOM_MEDIA4,
+		[VCS4]  = GEN11_GRDOM_MEDIA5,
+		[VCS5]  = GEN11_GRDOM_MEDIA6,
+		[VCS6]  = GEN11_GRDOM_MEDIA7,
+		[VCS7]  = GEN11_GRDOM_MEDIA8,
 		[VECS0] = GEN11_GRDOM_VECS,
 		[VECS1] = GEN11_GRDOM_VECS2,
+		[VECS2] = GEN11_GRDOM_VECS3,
+		[VECS3] = GEN11_GRDOM_VECS4,
 	};
 	struct intel_engine_cs *engine;
 	intel_engine_mask_t tmp;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cb1716b6ce72..dbc233442dd0 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -395,10 +395,18 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define  GEN11_GRDOM_MEDIA2		(1 << 6)
 #define  GEN11_GRDOM_MEDIA3		(1 << 7)
 #define  GEN11_GRDOM_MEDIA4		(1 << 8)
+#define  GEN11_GRDOM_MEDIA5		(1 << 9)
+#define  GEN11_GRDOM_MEDIA6		(1 << 10)
+#define  GEN11_GRDOM_MEDIA7		(1 << 11)
+#define  GEN11_GRDOM_MEDIA8		(1 << 12)
 #define  GEN11_GRDOM_VECS		(1 << 13)
 #define  GEN11_GRDOM_VECS2		(1 << 14)
+#define  GEN11_GRDOM_VECS3		(1 << 15)
+#define  GEN11_GRDOM_VECS4		(1 << 16)
 #define  GEN11_GRDOM_SFC0		(1 << 17)
 #define  GEN11_GRDOM_SFC1		(1 << 18)
+#define  GEN11_GRDOM_SFC2		(1 << 19)
+#define  GEN11_GRDOM_SFC3		(1 << 20)
 
 #define  GEN11_VCS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << ((instance) >> 1))
 #define  GEN11_VECS_SFC_RESET_BIT(instance)	(GEN11_GRDOM_SFC0 << (instance))
-- 
2.25.4

