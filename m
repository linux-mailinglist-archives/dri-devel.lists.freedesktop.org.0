Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A1951524E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 19:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A110EF00;
	Fri, 29 Apr 2022 17:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E7610EF00;
 Fri, 29 Apr 2022 17:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651253567; x=1682789567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zY2yJnOgOSdpT5JECMJSpP+xiSyRzCQ8AbUe+XwUUkQ=;
 b=QZbWgP6yXHpFqeT+k7FWgDsObttj9K0/Plk6HkwMp4w7wb1pyFn2D24x
 v9EBUBn9qUPM0vkhyRZRoAhujq5G3pxTuDqV1+zs/DyeZ0niVpAUxWK65
 4DYYxllaZYSaA52+LWNSVHM4Bt0QPGeEDU3rTm93xYsuS4Y6HCt84yDOv
 nxxX66gup4cu3tNUffiiQTKI6JeTWIBAjUUyungfsCaV6lCxM+Es9r6zR
 J+P4ffx7nCmHF2mxWiNAz2gxy4aI3L2P+KFDRYRmRN9A4abW8GJsJpQCi
 Hw+gNi44mEJqiXJRT4f4yTUCAnXapuyLzrb3OqmpbVS+782THxyynJIPg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10332"; a="329657093"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="329657093"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="534590212"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 10:31:02 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/4] drm/i915/gt: Explicitly clear BB_OFFSET for new
 contexts
Date: Fri, 29 Apr 2022 23:01:58 +0530
Message-Id: <20220429173201.20499-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220429173201.20499-1-ramalingam.c@intel.com>
References: <20220429173201.20499-1-ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Even though the initial protocontext we load onto HW has the register
cleared, by the time we save it into the default image, BB_OFFSET has
had the enable bit set. Reclear BB_OFFSET for each new context.

Testcase: igt/i915_selftests/gt_lrc

v2:
  Extend it for gen8.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/selftest_lrc.c      |  5 +++++
 3 files changed, 25 insertions(+)

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
index 3f83a9038e13..5f6479dadea7 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -662,6 +662,20 @@ static int lrc_ring_mi_mode(const struct intel_engine_cs *engine)
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
+	else if (GRAPHICS_VER(engine->i915) >= 8)
+		return 0xc4;
+	else
+		return -1;
+}
+
 static int lrc_ring_gpr0(const struct intel_engine_cs *engine)
 {
 	if (GRAPHICS_VER_FULL(engine->i915) >= IP_VER(12, 50))
@@ -768,6 +782,7 @@ static void init_common_regs(u32 * const regs,
 			     bool inhibit)
 {
 	u32 ctl;
+	int loc;
 
 	ctl = _MASKED_BIT_ENABLE(CTX_CTRL_INHIBIT_SYN_CTX_SWITCH);
 	ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT);
@@ -779,6 +794,10 @@ static void init_common_regs(u32 * const regs,
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

