Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50BC4D2824
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE810E922;
	Wed,  9 Mar 2022 05:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDB10E709;
 Wed,  9 Mar 2022 05:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803009; x=1678339009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pkfs/4qmAOVc3lJBtO4iReUbZnZFWNyuS6w4/gXTMII=;
 b=e+JTpSCs6OTph7jEHiAz2KIhjP2b/POk1XIrgaJoZMTfmZg/PD99/guU
 bKcEsmtRr1HMoZeKlqPKZoncDhqXwZVJO8vUFEXznE+GBZTPsZ2Cq7zIb
 X7EJo9iqCaflzMlvl8C6ln9yzXNuLqDPISmvE5flOeVN2XhX8+26iHN+u
 buajJqe42dhaG3hcerMAaLMNtYHlb76h2CpIC9veSvqaVy+rvfZnGjNS7
 PVPdpYK+5hssN68Hvnw4ClL9502YtoUTOg71+p0SpHvxDzZkX6Or4M+m4
 HyVCtmKz7ZS09dloSooyKEgindKcLOZblGm+fHmAk0poM+WqUsbTo1FA1 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="234842528"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="234842528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807497"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:42 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/i915/selftests: Exercise relative mmio paths to
 non-privileged registers
Date: Wed,  9 Mar 2022 10:47:01 +0530
Message-Id: <20220309051708.22644-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220309051708.22644-1-ramalingam.c@intel.com>
References: <20220309051708.22644-1-ramalingam.c@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, lucas.demarchi@intel.com,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Verify that context isolation is also preserved when accessing
context-local registers with relative-mmio commands.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 88 ++++++++++++++++++++------
 1 file changed, 67 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 21c29d315cc0..073c9795f42f 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -912,7 +912,9 @@ create_user_vma(struct i915_address_space *vm, unsigned long size)
 }
 
 static struct i915_vma *
-store_context(struct intel_context *ce, struct i915_vma *scratch)
+store_context(struct intel_context *ce,
+	      struct i915_vma *scratch,
+	      bool relative)
 {
 	struct i915_vma *batch;
 	u32 dw, x, *cs, *hw;
@@ -941,6 +943,9 @@ store_context(struct intel_context *ce, struct i915_vma *scratch)
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
 		u32 len = hw[dw] & 0x7f;
+		u32 cmd = MI_STORE_REGISTER_MEM_GEN8;
+		u32 offset = 0;
+		u32 mask = ~0;
 
 		if (hw[dw] == 0) {
 			dw++;
@@ -952,11 +957,19 @@ store_context(struct intel_context *ce, struct i915_vma *scratch)
 			continue;
 		}
 
+		if (hw[dw] & MI_LRI_LRM_CS_MMIO) {
+			mask = 0xfff;
+			if (relative)
+				cmd |= MI_LRI_LRM_CS_MMIO;
+			else
+				offset = ce->engine->mmio_base;
+		}
+
 		dw++;
 		len = (len + 1) / 2;
 		while (len--) {
-			*cs++ = MI_STORE_REGISTER_MEM_GEN8;
-			*cs++ = hw[dw];
+			*cs++ = cmd;
+			*cs++ = (hw[dw] & mask) + offset;
 			*cs++ = lower_32_bits(scratch->node.start + x);
 			*cs++ = upper_32_bits(scratch->node.start + x);
 
@@ -995,6 +1008,7 @@ static struct i915_request *
 record_registers(struct intel_context *ce,
 		 struct i915_vma *before,
 		 struct i915_vma *after,
+		 bool relative,
 		 u32 *sema)
 {
 	struct i915_vma *b_before, *b_after;
@@ -1002,11 +1016,11 @@ record_registers(struct intel_context *ce,
 	u32 *cs;
 	int err;
 
-	b_before = store_context(ce, before);
+	b_before = store_context(ce, before, relative);
 	if (IS_ERR(b_before))
 		return ERR_CAST(b_before);
 
-	b_after = store_context(ce, after);
+	b_after = store_context(ce, after, relative);
 	if (IS_ERR(b_after)) {
 		rq = ERR_CAST(b_after);
 		goto err_before;
@@ -1076,7 +1090,8 @@ record_registers(struct intel_context *ce,
 	goto err_after;
 }
 
-static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
+static struct i915_vma *
+load_context(struct intel_context *ce, u32 poison, bool relative)
 {
 	struct i915_vma *batch;
 	u32 dw, *cs, *hw;
@@ -1103,7 +1118,10 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 	hw = defaults;
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
+		u32 cmd = MI_INSTR(0x22, 0);
 		u32 len = hw[dw] & 0x7f;
+		u32 offset = 0;
+		u32 mask = ~0;
 
 		if (hw[dw] == 0) {
 			dw++;
@@ -1115,11 +1133,19 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 			continue;
 		}
 
+		if (hw[dw] & MI_LRI_LRM_CS_MMIO) {
+			mask = 0xfff;
+			if (relative)
+				cmd |= MI_LRI_LRM_CS_MMIO;
+			else
+				offset = ce->engine->mmio_base;
+		}
+
 		dw++;
+		*cs++ = cmd | len;
 		len = (len + 1) / 2;
-		*cs++ = MI_LOAD_REGISTER_IMM(len);
 		while (len--) {
-			*cs++ = hw[dw];
+			*cs++ = (hw[dw] & mask) + offset;
 			*cs++ = poison;
 			dw += 2;
 		}
@@ -1136,14 +1162,18 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 	return batch;
 }
 
-static int poison_registers(struct intel_context *ce, u32 poison, u32 *sema)
+static int
+poison_registers(struct intel_context *ce,
+		 u32 poison,
+		 bool relative,
+		 u32 *sema)
 {
 	struct i915_request *rq;
 	struct i915_vma *batch;
 	u32 *cs;
 	int err;
 
-	batch = load_context(ce, poison);
+	batch = load_context(ce, poison, relative);
 	if (IS_ERR(batch))
 		return PTR_ERR(batch);
 
@@ -1193,7 +1223,7 @@ static int compare_isolation(struct intel_engine_cs *engine,
 			     struct i915_vma *ref[2],
 			     struct i915_vma *result[2],
 			     struct intel_context *ce,
-			     u32 poison)
+			     u32 poison, bool relative)
 {
 	u32 x, dw, *hw, *lrc;
 	u32 *A[2], *B[2];
@@ -1244,6 +1274,7 @@ static int compare_isolation(struct intel_engine_cs *engine,
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
 		u32 len = hw[dw] & 0x7f;
+		bool is_relative = relative;
 
 		if (hw[dw] == 0) {
 			dw++;
@@ -1255,6 +1286,9 @@ static int compare_isolation(struct intel_engine_cs *engine,
 			continue;
 		}
 
+		if (!(hw[dw] & MI_LRI_LRM_CS_MMIO))
+			is_relative = false;
+
 		dw++;
 		len = (len + 1) / 2;
 		while (len--) {
@@ -1266,9 +1300,10 @@ static int compare_isolation(struct intel_engine_cs *engine,
 					break;
 
 				default:
-					pr_err("%s[%d]: Mismatch for register %4x, default %08x, reference %08x, result (%08x, %08x), poison %08x, context %08x\n",
-					       engine->name, dw,
-					       hw[dw], hw[dw + 1],
+					pr_err("%s[%d]: Mismatch for register %4x [using relative? %s], default %08x, reference %08x, result (%08x, %08x), poison %08x, context %08x\n",
+					       engine->name, dw, hw[dw],
+					       is_relative ? "Yes" : "No",
+					       hw[dw + 1],
 					       A[0][x], B[0][x], B[1][x],
 					       poison, lrc[dw + 1]);
 					err = -EINVAL;
@@ -1294,7 +1329,8 @@ static int compare_isolation(struct intel_engine_cs *engine,
 	return err;
 }
 
-static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
+static int
+__lrc_isolation(struct intel_engine_cs *engine, u32 poison, bool relative)
 {
 	u32 *sema = memset32(engine->status_page.addr + 1000, 0, 1);
 	struct i915_vma *ref[2], *result[2];
@@ -1324,7 +1360,7 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 		goto err_ref0;
 	}
 
-	rq = record_registers(A, ref[0], ref[1], sema);
+	rq = record_registers(A, ref[0], ref[1], relative, sema);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
 		goto err_ref1;
@@ -1352,13 +1388,13 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 		goto err_result0;
 	}
 
-	rq = record_registers(A, result[0], result[1], sema);
+	rq = record_registers(A, result[0], result[1], relative, sema);
 	if (IS_ERR(rq)) {
 		err = PTR_ERR(rq);
 		goto err_result1;
 	}
 
-	err = poison_registers(B, poison, sema);
+	err = poison_registers(B, poison, relative, sema);
 	if (err) {
 		WRITE_ONCE(*sema, -1);
 		i915_request_put(rq);
@@ -1372,7 +1408,7 @@ static int __lrc_isolation(struct intel_engine_cs *engine, u32 poison)
 	}
 	i915_request_put(rq);
 
-	err = compare_isolation(engine, ref, result, A, poison);
+	err = compare_isolation(engine, ref, result, A, poison, relative);
 
 err_result1:
 	i915_vma_put(result[1]);
@@ -1434,13 +1470,23 @@ static int live_lrc_isolation(void *arg)
 		for (i = 0; i < ARRAY_SIZE(poison); i++) {
 			int result;
 
-			result = __lrc_isolation(engine, poison[i]);
+			result = __lrc_isolation(engine, poison[i], false);
 			if (result && !err)
 				err = result;
 
-			result = __lrc_isolation(engine, ~poison[i]);
+			result = __lrc_isolation(engine, ~poison[i], false);
 			if (result && !err)
 				err = result;
+
+			if (intel_engine_has_relative_mmio(engine)) {
+				result = __lrc_isolation(engine, poison[i], true);
+				if (result && !err)
+					err = result;
+
+				result = __lrc_isolation(engine, ~poison[i], true);
+				if (result && !err)
+					err = result;
+			}
 		}
 		intel_engine_pm_put(engine);
 		if (igt_flush_test(gt->i915)) {
-- 
2.20.1

