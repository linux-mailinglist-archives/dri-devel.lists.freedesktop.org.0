Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD6A51CB66
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C85710FA4F;
	Thu,  5 May 2022 21:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A924410FA3B;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786702; x=1683322702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KS2DYBhqUac1AYCJV/ZgWKbjWMRKGcdAevXhNdjTWq8=;
 b=S0jVqvDmlNxxlhk/BJUES1YLrpb0GV4dT4peFPr3o/FfVNZWuQkslQWi
 7LNzjxSFDAT+zkL4mYCoaPZ8IM+Av26VcaKrgHGZ6P3ybK1NyvHbKvvzY
 oOkQrHi0tUKqiITnZg7jdZQeiV2KSwVLdtlpFXB9vVaGxw/fShGJLOSjf
 3CRj/3HfPeCk0Y41ENSqJgbwFUfTSbynrabnm10q+Fnyv+gEXegdcblKi
 F5LQRjNZ7jE7B7idqcbj3JomtfNd9g4uzxbIRe4cvg/2mf50azzxBsnBn
 UdguWf13Bw0EG1EGVOYivs1IKX3BT+RW+FdM829mBhyPhnOvN1uU288Lo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248166067"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248166067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553282"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/12] drm/i915/pvc: Engine definitions for new copy engines
Date: Thu,  5 May 2022 14:38:08 -0700
Message-Id: <20220505213812.3979301-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the basic definitions needed to support
new copy engines. Also updating the cmd_info to accommodate
new engines, as the engine id's of legacy engines have been
changed.

v2:
 - Add _BCS(n) definition, similar to other engines.  (Tvrtko)
 - Add I915_MAX_BCS definition, similar to other engnes.  (Prathap)
 - Move GVT change to avoid u16 overflow to its own patch.  (Tvrtko)

Original-author: CQ Tang
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 56 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 12 ++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  8 +++
 drivers/gpu/drm/i915/i915_reg.h              |  8 +++
 4 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 14c6ddbbfde8..4532c3ea9ace 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -71,6 +71,62 @@ static const struct engine_info intel_engines[] = {
 			{ .graphics_ver = 6, .base = BLT_RING_BASE }
 		},
 	},
+	[BCS1] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 1,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS1_RING_BASE }
+		},
+	},
+	[BCS2] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 2,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS2_RING_BASE }
+		},
+	},
+	[BCS3] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 3,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS3_RING_BASE }
+		},
+	},
+	[BCS4] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 4,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS4_RING_BASE }
+		},
+	},
+	[BCS5] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 5,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS5_RING_BASE }
+		},
+	},
+	[BCS6] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 6,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS6_RING_BASE }
+		},
+	},
+	[BCS7] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 7,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS7_RING_BASE }
+		},
+	},
+	[BCS8] = {
+		.class = COPY_ENGINE_CLASS,
+		.instance = 8,
+		.mmio_bases = {
+			{ .graphics_ver = 12, .base = XEHPC_BCS8_RING_BASE }
+		},
+	},
 	[VCS0] = {
 		.class = VIDEO_DECODE_CLASS,
 		.instance = 0,
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 298f2cc7a879..2286f96f5f87 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -35,7 +35,7 @@
 #define OTHER_CLASS		4
 #define COMPUTE_CLASS		5
 #define MAX_ENGINE_CLASS	5
-#define MAX_ENGINE_INSTANCE	7
+#define MAX_ENGINE_INSTANCE	8
 
 #define I915_MAX_SLICES	3
 #define I915_MAX_SUBSLICES 8
@@ -99,6 +99,7 @@ struct i915_ctx_workarounds {
 #define I915_MAX_SFC	(I915_MAX_VCS / 2)
 #define I915_MAX_CCS	4
 #define I915_MAX_RCS	1
+#define I915_MAX_BCS	9
 
 /*
  * Engine IDs definitions.
@@ -107,6 +108,15 @@ struct i915_ctx_workarounds {
 enum intel_engine_id {
 	RCS0 = 0,
 	BCS0,
+	BCS1,
+	BCS2,
+	BCS3,
+	BCS4,
+	BCS5,
+	BCS6,
+	BCS7,
+	BCS8,
+#define _BCS(n) (BCS0 + (n))
 	VCS0,
 	VCS1,
 	VCS2,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index a0a49c16babd..aa2c0974b02c 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1476,6 +1476,14 @@
 #define   GEN11_KCR				(19)
 #define   GEN11_GTPM				(16)
 #define   GEN11_BCS				(15)
+#define   XEHPC_BCS1				(14)
+#define   XEHPC_BCS2				(13)
+#define   XEHPC_BCS3				(12)
+#define   XEHPC_BCS4				(11)
+#define   XEHPC_BCS5				(10)
+#define   XEHPC_BCS6				(9)
+#define   XEHPC_BCS7				(8)
+#define   XEHPC_BCS8				(23)
 #define   GEN12_CCS3				(7)
 #define   GEN12_CCS2				(6)
 #define   GEN12_CCS1				(5)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4a3d7b96ef43..ab64ab4317b3 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -976,6 +976,14 @@
 #define GEN12_COMPUTE2_RING_BASE	0x1e000
 #define GEN12_COMPUTE3_RING_BASE	0x26000
 #define BLT_RING_BASE		0x22000
+#define XEHPC_BCS1_RING_BASE	0x3e0000
+#define XEHPC_BCS2_RING_BASE	0x3e2000
+#define XEHPC_BCS3_RING_BASE	0x3e4000
+#define XEHPC_BCS4_RING_BASE	0x3e6000
+#define XEHPC_BCS5_RING_BASE	0x3e8000
+#define XEHPC_BCS6_RING_BASE	0x3ea000
+#define XEHPC_BCS7_RING_BASE	0x3ec000
+#define XEHPC_BCS8_RING_BASE	0x3ee000
 #define DG1_GSC_HECI1_BASE	0x00258000
 #define DG1_GSC_HECI2_BASE	0x00259000
 #define DG2_GSC_HECI1_BASE	0x00373000
-- 
2.35.1

