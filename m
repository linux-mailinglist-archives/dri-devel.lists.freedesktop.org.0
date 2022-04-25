Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD650E444
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 17:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27BB10EFC9;
	Mon, 25 Apr 2022 15:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3141310EF6A;
 Mon, 25 Apr 2022 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650900143; x=1682436143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+gkSllZRfRS0AkEyN2TQaHqveCxY8bhyICvlmipDVlI=;
 b=nh5e5OydYTHz76hKGH87UZHomTACnKs27BgMoGe8Rlr8xZ0mTKdbgUhr
 UFjdvuzGDhRxkM9NrpMnQWFXiGxm98KkG4dKJOK4yUabP5VH1S8UcFiek
 Ta0Hdt8VmVNMgrGYP5JVfqb0aZmtsN4YfI3mkpcL4aKzWQZ5fxA7+EfuD
 m335vNWKNJTFFuhRm49+F34KBcOMQ/rXWcr1DeNo9EvYxUIf+4KcRxSNv
 zyQiul/7fIXZRUiu9jyzOvC1h3nn2QcdTTEi6/o8Zh01WeNM/tEvOSVWZ
 RG4DHMxE8ObpqRcyDJkdNgdMV0XVN1q1lojDTykJUd/iZeL0X3DD7QgzX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="262875132"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="262875132"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="512681577"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 08:22:20 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915/xehpsdv/dg1/tgl: Fix issue with LRI relative
 addressing
Date: Mon, 25 Apr 2022 20:53:15 +0530
Message-Id: <20220425152317.4275-2-ramalingam.c@intel.com>
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
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>

When bit 19 of MI_LOAD_REGISTER_IMM instruction opcode is set on tgl+
devices, HW does not care about certain register address offsets, but
instead check the following for valid address ranges on specific engines:
	RCS && CCS: BITS(0 - 10)
	BCS: BITS(0 - 11)
	VECS && VCS: BITS(0 - 13)
Also, tgl+ now support relative addressing for BCS engine - So, this
patch fixes issue with live_gt_lrc selftest that is failing where there is
mismatch between LRC register layout generated during init and HW
default register offsets.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 36 +++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index 6ba52ef1acb8..8dc7b88cdca0 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -128,6 +128,27 @@ static int context_flush(struct intel_context *ce, long timeout)
 	return err;
 }
 
+static int get_lri_mask(struct intel_engine_cs *engine, u32 lri)
+{
+	if ((lri & MI_LRI_LRM_CS_MMIO) == 0)
+		return ~0u;
+
+	if (GRAPHICS_VER(engine->i915) < 12)
+		return 0xfff;
+
+	switch (engine->class) {
+	default:
+	case RENDER_CLASS:
+	case COMPUTE_CLASS:
+		return 0x07ff;
+	case COPY_ENGINE_CLASS:
+		return 0x0fff;
+	case VIDEO_DECODE_CLASS:
+	case VIDEO_ENHANCEMENT_CLASS:
+		return 0x3fff;
+	}
+}
+
 static int live_lrc_layout(void *arg)
 {
 	struct intel_gt *gt = arg;
@@ -167,6 +188,7 @@ static int live_lrc_layout(void *arg)
 		dw = 0;
 		do {
 			u32 lri = READ_ONCE(hw[dw]);
+			u32 lri_mask;
 
 			if (lri == 0) {
 				dw++;
@@ -194,6 +216,18 @@ static int live_lrc_layout(void *arg)
 				break;
 			}
 
+			/*
+			 * When bit 19 of MI_LOAD_REGISTER_IMM instruction
+			 * opcode is set on Gen12+ devices, HW does not
+			 * care about certain register address offsets, and
+			 * instead check the following for valid address
+			 * ranges on specific engines:
+			 * RCS && CCS: BITS(0 - 10)
+			 * BCS: BITS(0 - 11)
+			 * VECS && VCS: BITS(0 - 13)
+			 */
+			lri_mask = get_lri_mask(engine, lri);
+
 			lri &= 0x7f;
 			lri++;
 			dw++;
@@ -201,7 +235,7 @@ static int live_lrc_layout(void *arg)
 			while (lri) {
 				u32 offset = READ_ONCE(hw[dw]);
 
-				if (offset != lrc[dw]) {
+				if ((offset ^ lrc[dw]) & lri_mask) {
 					pr_err("%s: Different registers found at dword %d, expected %x, found %x\n",
 					       engine->name, dw, offset, lrc[dw]);
 					err = -EINVAL;
-- 
2.20.1

