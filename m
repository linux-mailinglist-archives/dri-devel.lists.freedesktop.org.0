Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9179850DF83
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 13:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3B310E59E;
	Mon, 25 Apr 2022 11:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8430510E586;
 Mon, 25 Apr 2022 11:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650887854; x=1682423854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6p1EL5+p7XgKUJ61u3cn/khIRsDAp/S17ueUeH7Sp88=;
 b=YQ8wfdSf+18mi3iPwCmZJwxQdW7D16BQo/iNQdVOb9K2trhSGm0NIAst
 xkwUJOWs+DJuqipfkEuEo7oDnj8K8+NMzFjfaJ3IrUXUi0d4Lv4/0BPvt
 rlAD/gxSYUH18qG87/wqhoIMay3SpjfOur9acH008nOdK5JPWcDk81FXT
 B61/oyVKUXK5mD9v1ogYccNVxSMB446AYDtyxD9AftPyn/VSXHQb5V9vW
 DZWqqE1PURJG3x+7f8tjI2Oe+w91zMaiaMNm3zNJdkU8ZwZtLzJTB0I8Q
 S6qr4HSUK7vJn4szGDuUo0o+QGSg0z9/3/XARpfFeunIVETn1Bm4v3pRF g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="290363120"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290363120"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="557695893"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 04:57:32 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/i915/gt: Explicitly clear BB_OFFSET for new
 contexts
Date: Mon, 25 Apr 2022 17:28:25 +0530
Message-Id: <20220425115828.21473-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425115828.21473-1-ramalingam.c@intel.com>
References: <20220425115828.21473-1-ramalingam.c@intel.com>
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Even though the initial protocontext we load onto HW has the register
cleared, by the time we save it into the default image, BB_OFFSET has
had the enable bit set. Reclear BB_OFFSET for each new context.

Testcase: igt/i915_selftests/gt_lrc

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 17 +++++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_lrc.c      |  5 +++++
 3 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
index 594a629cb28f..d4b02d36d2a6 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
@@ -109,6 +109,7 @@
 #define RING_SBBSTATE(base)			_MMIO((base) + 0x118) /* hsw+ */
 #define RING_SBBADDR_UDW(base)			_MMIO((base) + 0x11c) /* gen8+ */
 #define RING_BBADDR(base)			_MMIO((base) + 0x140)
+#define RING_BB_OFFSET(base)			_MMIO((base) + 0x158)
 #define RING_BBADDR_UDW(base)			_MMIO((base) + 0x168) /* gen8+ */
 #define CCID(base)				_MMIO((base) + 0x180)
 #define   CCID_EN				BIT(0)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 3f83a9038e13..63f0b44084cf 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -662,6 +662,18 @@ static int lrc_ring_mi_mode(const struct intel_engine_cs *engine)
 		return -1;
 }
 
+static int lrc_ring_bb_offset(const struct intel_engine_cs *engine)
+{
+	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
+		return 0x80;
+	else if (GRAPHICS_VER(engine->i915) >= 12)
+		return 0x70;
+	else if (GRAPHICS_VER(engine->i915) >= 9)
+		return 0x64;
+	else
+		return -1;
+}
+
 static int lrc_ring_gpr0(const struct intel_engine_cs *engine)
 {
 	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
@@ -768,6 +780,7 @@ static void init_common_regs(u32 * const regs,
 			     bool inhibit)
 {
 	u32 ctl;
+	int loc;
 
 	ctl = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH);
 	ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
@@ -779,6 +792,10 @@ static void init_common_regs(u32 * const regs,
 	regs[CTX_CONTEXT_CONTROL] = ctl;
 
 	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
+
+	loc = lrc_ring_bb_offset(engine);
+	if (loc != -1)
+		regs[loc + 1] = 0;
 }
 
 static void init_wa_bb_regs(u32 * const regs,
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 6ba52ef1acb8..33f22f17e358 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -323,6 +323,11 @@ static int live_lrc_fixed(void *arg)
 				lrc_ring_cmd_buf_cctl(engine),
 				"RING_CMD_BUF_CCTL"
 			},
+			{
+				i915_mmio_reg_offset(RING_BB_OFFSET(engine->mmio_base)),
+				lrc_ring_bb_offset(engine),
+				"RING_BB_OFFSET"
+			},
 			{ },
 		}, *t;
 		u32 *hw;
-- 
2.20.1

