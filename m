Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1CC348283
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 21:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620986EA82;
	Wed, 24 Mar 2021 20:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116CD6EA81;
 Wed, 24 Mar 2021 20:05:29 +0000 (UTC)
IronPort-SDR: bmIDiZKNgatSqnTrtWAzwsrJ/2NOupYTzWsAJJ4mf4mb9PDgnEoRkkBQRZVUhpF4BM75dc0NKt
 WI8XPtCUfyvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="188482331"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="188482331"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:23 -0700
IronPort-SDR: o7uvb5urogkqqkMpS4kLnwLrd1CToPrS66oSifcJgWdAaLPWdid6kwESfAfVxZ1msZ5GJDkDHo
 Zj8S7aCFy2fw==
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; d="scan'208";a="391423641"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 13:05:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Add Wa_14011060649
Date: Wed, 24 Mar 2021 13:05:02 -0700
Message-Id: <20210324200502.1731265-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200502.1731265-1-lucas.demarchi@intel.com>
References: <20210324200502.1731265-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>

This is a permanent workaround for TGL,RKL,DG1 and ADLS.

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 26 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index aeb5fb54fb0a..3678f6fbee46 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1123,11 +1123,37 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 }
 
+/*
+ * Though there are per-engine instances of these registers,
+ * they retain their value through engine resets and should
+ * only be provided on the GT workaround list rather than
+ * the engine-specific workaround list.
+ */
+static void
+wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
+{
+	struct intel_engine_cs *engine;
+	struct intel_gt *gt = &i915->gt;
+	int id;
+
+	for_each_engine(engine, gt, id) {
+		if (engine->class != VIDEO_DECODE_CLASS ||
+		    (engine->instance % 2))
+			continue;
+
+		wa_write_or(wal, VDBOX_CGCTL3F10(engine->mmio_base),
+			    IECPUNIT_CLKGATE_DIS);
+	}
+}
+
 static void
 gen12_gt_workarounds_init(struct drm_i915_private *i915,
 			  struct i915_wa_list *wal)
 {
 	wa_init_mcr(i915, wal);
+
+	/* Wa_14011060649:tgl,rkl,dg1,adls */
+	wa_14011060649(i915, wal);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index cbf7a60afe54..e087bcd21911 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2715,6 +2715,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define RING_INDIRECT_CTX_OFFSET(base)	_MMIO((base) + 0x1c8) /* gen8+ */
 #define RING_CTX_TIMESTAMP(base)	_MMIO((base) + 0x3a8) /* gen8+ */
 
+#define VDBOX_CGCTL3F10(base)		_MMIO((base) + 0x3f10)
+#define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
+
 #define ERROR_GEN6	_MMIO(0x40a0)
 #define GEN7_ERR_INT	_MMIO(0x44040)
 #define   ERR_INT_POISON		(1 << 31)
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
