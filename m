Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDC450E445
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 17:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597010EFE2;
	Mon, 25 Apr 2022 15:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9BB10EFC9;
 Mon, 25 Apr 2022 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650900145; x=1682436145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s6WSnVVhmtHQd64IoTOJzWVy5YJSxb7gckdNJl86SQo=;
 b=aAWabwl7RgVnQ71E2tWJXOuZIRgR56Wwmo0Aogzr1YBoiALsVLyLb23G
 ANtVKGC32te3lUB9SQy7BDpZfT6MHjgOc+CfDk6Agk0KijHOI6k+TNdIQ
 XGy7tAIVTbYqu7EhYk1tGSuEfY7+uwvA0F3SVrxW61YegjfDvEB1x5zni
 Y1vJftvkB24+nFs5I64BofOJOrOs4g4J/H/7SKnNAHbSqekAlLelXsqOc
 Cn345mMBL6ykyQA/k1IGDYwlmoQ1sSEWU1cLLZYij+zsw6JDKEuPnt7A5
 LEFT933VzS1yBq666yuwmoULsFtUH0TAKBFrnWn0kb7pe8Ul1mqHxYeh1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="262875142"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="262875142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="512681600"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:22 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/i915/selftests: Skip poisoning SET_PREDICATE_RESULT
 on dg2
Date: Mon, 25 Apr 2022 20:53:16 +0530
Message-Id: <20220425152317.4275-3-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425152317.4275-1-ramalingam.c@intel.com>
References: <20220425152317.4275-1-ramalingam.c@intel.com>
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
Cc: CQ Tang <cq.tang@intel.com>, Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

When predication is enabled all commands baring a few (such as MI_BB_END)
are nop'ed. If we accidentally enable predication while poisoning the
context, not only is the rest of the poisoning skipped (thus disabling
the test), but the closing instructions of the poison request are
nop'ed. Not only do we then not signal the waiting context, but we even
prevent re-enabling arbitration and the GPU will not perform a context
switch at the end of the request.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
 drivers/gpu/drm/i915/gt/selftest_lrc.c      | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
index 594a629cb28f..1dab554bf640 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
@@ -193,6 +193,7 @@
 #define RING_TIMESTAMP_UDW(base)		_MMIO((base) + 0x358 + 4)
 #define RING_CONTEXT_STATUS_PTR(base)		_MMIO((base) + 0x3a0)
 #define RING_CTX_TIMESTAMP(base)		_MMIO((base) + 0x3a8) /* gen8+ */
+#define RING_PREDICATE_RESULT(base)		_MMIO((base) + 0x3b8)
 #define RING_FORCE_TO_NONPRIV(base, i)		_MMIO(((base) + 0x4D0) + (i) * 4)
 #define   RING_FORCE_TO_NONPRIV_ADDRESS_MASK	REG_GENMASK(25, 2)
 #define   RING_FORCE_TO_NONPRIV_ACCESS_RW	(0 << 28)    /* CFL+ & Gen11+ */
diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 8dc7b88cdca0..8b2c11dbe354 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -945,6 +945,19 @@ create_user_vma(struct i915_address_space *vm, unsigned long size)
 	return vma;
 }
 
+static u32 safe_poison(u32 offset, u32 poison)
+{
+	/*
+	 * Do not enable predication as it will nop all subsequent commands,
+	 * not only disabling the tests (by preventing all the other SRM) but
+	 * also preventing the arbitration events at the end of the request.
+	 */
+	if (offset == i915_mmio_reg_offset(RING_PREDICATE_RESULT(0)))
+		poison &= ~REG_BIT(0);
+
+	return poison;
+}
+
 static struct i915_vma *
 store_context(struct intel_context *ce, struct i915_vma *scratch)
 {
@@ -1154,7 +1167,9 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 		*cs++ = MI_LOAD_REGISTER_IMM(len);
 		while (len--) {
 			*cs++ = hw[dw];
-			*cs++ = poison;
+			*cs++ = safe_poison(hw[dw] & get_lri_mask(ce->engine,
+								  MI_LRI_LRM_CS_MMIO),
+					    poison);
 			dw += 2;
 		}
 	} while (dw < PAGE_SIZE / sizeof(u32) &&
-- 
2.20.1

