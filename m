Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158333E150
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 23:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DD26E07F;
	Tue, 16 Mar 2021 22:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D316E07F;
 Tue, 16 Mar 2021 22:23:15 +0000 (UTC)
IronPort-SDR: ZwU1/TLw8bYadcxnAH5yF9Q51hZcFZweWAI3GcajNkMrFXYxOlnM4YKywu50wK+th0SFJCjHuo
 o3WteXzI2TcA==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="168615445"
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="168615445"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 15:23:15 -0700
IronPort-SDR: 053bkLXgKe+VxN9RugWgcwVp7JUVuJYPT4ckoq8I936Y2yAhvWdju7uaPF7QIIXICVJ3U3c26a
 ZrcND/wSoyVg==
X-IronPort-AV: E=Sophos;i="5.81,254,1610438400"; d="scan'208";a="412397950"
Received: from sdhanava-desk2.jf.intel.com ([10.165.21.144])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2021 15:23:15 -0700
From: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Add Wa_14011060649
Date: Tue, 16 Mar 2021 15:12:51 -0700
Message-Id: <20210316221251.19650-1-swathi.dhanavanthri@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a permanent workaround for TGL,RKL,DG1 and ADLS.

Signed-off-by: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 23 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3b4a7da60f0b..683a0446337a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1117,11 +1117,34 @@ icl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 			    L3_CLKGATE_DIS | L3_CR2X_CLKGATE_DIS);
 }
 
+/*
+ * This is a common function for WA 14011060649
+ */
+static void
+wa_14011060649(struct drm_i915_private *i915, struct i915_wa_list *wal)
+{
+	struct intel_engine_cs *engine;
+	struct intel_gt *gt = &i915->gt;
+	int id;
+
+	for_each_engine(engine, gt, id) {
+		if ((engine->class != VIDEO_DECODE_CLASS) ||
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
index e5dd0203991b..cc60556306e2 100644
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
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
