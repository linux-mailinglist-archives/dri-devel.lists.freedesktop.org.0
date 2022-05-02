Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021351745F
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8524C10F096;
	Mon,  2 May 2022 16:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4C10F02B;
 Mon,  2 May 2022 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509262; x=1683045262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UmPAbMUV9KfChzYVAJbMQEukr5dfl17fUGYL9Nk/j3s=;
 b=FQmCozYIPDi8hGbmuaEi/+EkD4ttNDNOWf1jpF8ntj66HnZ4cmeBfiZz
 755ps/kMhv9MAn+YMZVyWRfEDHWqG4OfduAMG3kuBl83t66Lt8zKZjjgR
 0bGEBbzmzUnY0yGfi2zqnyp7JlTDopQXq0IFRy22deqBL9I/qqPSEyOxG
 3XH4fd//j3R2PTk9g6Wm2Uh5QwtNCF8aLAnuKrgbV0KRTaZZrpcQvA7TN
 NbPEhFKbIKKA9Ilpdg6rksNc25UKwmjPGmfo+44opW1Wp4mjkqVKkUYR/
 7s586N1d5BrvCbrjGVrLiPGpu7wL6a2iEHS5txWNnXqJuGT2N6YJ4Uhjl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266105003"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266105003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781845"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/11] drm/i915/pvc: Engines definitions for new copy engines
Date: Mon,  2 May 2022 09:34:13 -0700
Message-Id: <20220502163417.2635462-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds the basic definitions needed to support
new copy engines. Also updating the cmd_info to accommodate
new engines, as the engine id's of legacy engines have been
changed.

Original-author: CQ Tang
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 56 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 10 +++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  8 +++
 drivers/gpu/drm/i915/gvt/cmd_parser.c        |  2 +-
 drivers/gpu/drm/i915/i915_reg.h              |  8 +++
 5 files changed, 82 insertions(+), 2 deletions(-)

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
index 298f2cc7a879..356c15cdccf0 100644
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
@@ -107,6 +107,14 @@ struct i915_ctx_workarounds {
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
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index b9eb75a2b400..0ba2a3455d99 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -428,7 +428,7 @@ struct cmd_info {
 #define R_VECS	BIT(VECS0)
 #define R_ALL (R_RCS | R_VCS | R_BCS | R_VECS)
 	/* rings that support this cmd: BLT/RCS/VCS/VECS */
-	u16 rings;
+	intel_engine_mask_t rings;
 
 	/* devices that support this cmd: SNB/IVB/HSW/... */
 	u16 devices;
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

