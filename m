Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB6F4D282E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 06:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C310E913;
	Wed,  9 Mar 2022 05:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58B910E92F;
 Wed,  9 Mar 2022 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646803018; x=1678339018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vJ1RVc0neVd7qGRykD93Y7dXSsxyfzaTYiPGsb+2Do4=;
 b=FXJuUxXFk5VYdn2WF0AgdHiaZ9SDhhx/evyGfh8o2sLp9ymX1pRSYkNJ
 FzWmkIJfI6AnpTAqA1iAhOWdFxA6zrZPPCPFSzunj0bcPWzHNvFVsLRnq
 FXsl8WT13pM5VcOWc1YxOCwysUm3jk5xbOj5HBX4Xgttc+ba0Hp7Kulr4
 0Q31L+3Ndi3qukGYVtNY/tsLREO3L4qtjdMS3DiEmtwjwSOLIayRsvhOl
 cI6RChjg8Vvt6VIGN6FfJRm+WnimZjUzH951CbPRE/p5TJ4wo/AEGi2fL
 a/xZomGjK71JTJal2pfGlpo3y/B/hGk6uKVciqgsYdp4aH1EdIl3+OHI1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="255081140"
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="255081140"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:58 -0800
X-IronPort-AV: E=Sophos;i="5.90,166,1643702400"; d="scan'208";a="711807544"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 21:16:52 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/i915/selftests: Check for incomplete LRI from the
 context image
Date: Wed,  9 Mar 2022 10:47:05 +0530
Message-Id: <20220309051708.22644-6-ramalingam.c@intel.com>
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

In order to keep the context image parser simple, we assume that all
commands follow a similar format. A few, especially not MI commands on
the render engines, have fixed lengths not encoded in a length field.
This caused us to incorrectly skip over 3D state commands, and start
interpretting context data as instructions. Eventually, as Daniele
discovered, this would lead us to find addition LRI as part of the data
and mistakenly add invalid LRI commands to the context probes.

Stop parsing after we see the first !MI command, as we know we will have
seen all the context registers by that point. (Mostly true for all gen
so far, though the render context does have LRI after the first page that
we have been ignoring so far. It would be useful to extract those as well
so that we have the full list of user accesisble registers.)

Similarly, emit a warning if we do try to emit an invalid zero-length
LRI.

Reported-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 63 ++++++++++++++++++++++----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 2149b2c92793..6717ecaed178 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -27,6 +27,9 @@
 #define NUM_GPR 16
 #define NUM_GPR_DW (NUM_GPR * 2) /* each GPR is 2 dwords */
 
+#define LRI_HEADER MI_INSTR(0x22, 0)
+#define LRI_LENGTH_MASK GENMASK(7, 0)
+
 static struct i915_vma *create_scratch(struct intel_gt *gt)
 {
 	return __vm_create_scratch_for_read_pinned(&gt->ggtt->vm, PAGE_SIZE);
@@ -180,7 +183,7 @@ static int live_lrc_layout(void *arg)
 				continue;
 			}
 
-			if ((lri & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
+			if ((lri & GENMASK(31, 23)) != LRI_HEADER) {
 				pr_err("%s: Expected LRI command at dword %d, found %08x\n",
 				       engine->name, dw, lri);
 				err = -EINVAL;
@@ -948,21 +951,43 @@ store_context(struct intel_context *ce,
 	hw = defaults;
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
-		u32 len = hw[dw] & 0x7f;
+		u32 len = hw[dw] & LRI_LENGTH_MASK;
 		u32 cmd = MI_STORE_REGISTER_MEM_GEN8;
 		u32 offset = 0;
 		u32 mask = ~0;
 
+		/*
+		 * Keep it simple, skip parsing complex commands
+		 *
+		 * At present, there are no more MI_LOAD_REGISTER_IMM
+		 * commands after the first 3D state command. Rather
+		 * than include a table (see i915_cmd_parser.c) of all
+		 * the possible commands and their instruction lengths
+		 * (or mask for variable length instructions), assume
+		 * we have gathered the complete list of registers and
+		 * bail out.
+		 */
+		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
+			break;
+
 		if (hw[dw] == 0) {
 			dw++;
 			continue;
 		}
 
-		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
+		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
+			/* Assume all other MI commands match LRI length mask */
 			dw += len + 2;
 			continue;
 		}
 
+		if (!len) {
+			pr_err("%s: invalid LRI found in context image\n",
+			       engine->name);
+			igt_hexdump(defaults, PAGE_SIZE);
+			break;
+		}
+
 		if (hw[dw] & MI_LRI_LRM_CS_MMIO) {
 			mask = 0xfff;
 			if (relative)
@@ -1162,21 +1187,32 @@ load_context(struct intel_context *ce,
 	hw = defaults;
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
-		u32 cmd = MI_INSTR(0x22, 0);
-		u32 len = hw[dw] & 0x7f;
+		u32 len = hw[dw] & LRI_LENGTH_MASK;
+		u32 cmd = LRI_HEADER;
 		u32 offset = 0;
 		u32 mask = ~0;
 
+		/* For simplicity, break parsing at the first complex command */
+		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
+			break;
+
 		if (hw[dw] == 0) {
 			dw++;
 			continue;
 		}
 
-		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
+		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
 			dw += len + 2;
 			continue;
 		}
 
+		if (!len) {
+			pr_err("%s: invalid LRI found in context image\n",
+			       engine->name);
+			igt_hexdump(defaults, PAGE_SIZE);
+			break;
+		}
+
 		if (hw[dw] & MI_LRI_LRM_CS_MMIO) {
 			mask = 0xfff;
 			if (relative)
@@ -1327,19 +1363,30 @@ static int compare_isolation(struct intel_engine_cs *engine,
 	hw = defaults;
 	hw += LRC_STATE_OFFSET / sizeof(*hw);
 	do {
-		u32 len = hw[dw] & 0x7f;
+		u32 len = hw[dw] & LRI_LENGTH_MASK;
 		bool is_relative = relative;
 
+		/* For simplicity, break parsing at the first complex command */
+		if ((hw[dw] >> INSTR_CLIENT_SHIFT) != INSTR_MI_CLIENT)
+			break;
+
 		if (hw[dw] == 0) {
 			dw++;
 			continue;
 		}
 
-		if ((hw[dw] & GENMASK(31, 23)) != MI_INSTR(0x22, 0)) {
+		if ((hw[dw] & GENMASK(31, 23)) != LRI_HEADER) {
 			dw += len + 2;
 			continue;
 		}
 
+		if (!len) {
+			pr_err("%s: invalid LRI found in context image\n",
+			       engine->name);
+			igt_hexdump(defaults, PAGE_SIZE);
+			break;
+		}
+
 		if (!(hw[dw] & MI_LRI_LRM_CS_MMIO))
 			is_relative = false;
 
-- 
2.20.1

