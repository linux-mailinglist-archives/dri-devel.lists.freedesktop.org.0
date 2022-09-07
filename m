Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A25B0F13
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 23:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B18510E8C6;
	Wed,  7 Sep 2022 21:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794FE10E8C6;
 Wed,  7 Sep 2022 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662585915; x=1694121915;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=stjOlK+Zfq9XJOg5EUTTZehZcWwEPk42985eDYvcrvA=;
 b=dGsIHVN/wAhXoJmwN+2OVidhZwBMsrasPLeIWAqC/ID+SMOQOe7Ehryb
 sTeM/X3PrNTvX7Slk24E7LFbpqmQ0271zx4t0fOgKLOmGXIvikK57LTn2
 Hs0dCCPpEa07TATnbBfD2fCDZAmd6Sncn5wOqGM4EnlfNKfw8YcHgZetU
 9z+x7u7mOIeZuIdyhGgGki9/FKzmK0ljpecx7FTT5WcPjMt/UAFlyzJgS
 ZnTFTCQqOnLwuelqZVOy2h7BzBS0mtBa+RiK0BOIQn2NQAJSV+ynJdGux
 lRiQGMqIJOspinYk9RcRK8AbR7yK/OYojnEDiQ7bStXsnSgExgK759z/O g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="360965313"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="360965313"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 14:25:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="565682743"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 14:25:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Document and future-proof preemption control policy
Date: Wed,  7 Sep 2022 14:24:10 -0700
Message-Id: <20220907212410.22623-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Intel hardware allows some preemption settings to be controlled either
by the kernel-mode driver exclusively, or placed under control of the
user-mode drivers; on Linux we always select the userspace control
option.  The various registers involved in this are not documented very
clearly; let's add some clarifying comments to help explain how this all
works and provide some history on why our Linux drivers take the
approach they do (which I believe differs from the path taken by certain
other operating systems' drivers).

While we're at it, let's also remove the graphics version 12 upper bound
on this programming.  As described, we don't have any plans to move away
from UMD control of preemption settings on future platforms, and there's
currently no reason to believe that the hardware will fundamentally
change how these registers and settings work after version 12.

Bspec: 45921, 45858, 45863
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 58 +++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 6d2003d598e6..3e5a41378e81 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2389,12 +2389,64 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
-	if (IS_GRAPHICS_VER(i915, 9, 12)) {
-		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
+	/*
+	 * Intel platforms that support fine-grained preemption (i.e., gen9 and
+	 * beyond) allow the kernel-mode driver to choose between two different
+	 * options for controlling preemption granularity and behavior.
+	 *
+	 * Option 1 (hardware default):
+	 *   Preemption settings are controlled in a global manner via
+	 *   kernel-only register CS_DEBUG_MODE1 (0x20EC).  Any granularity
+	 *   and settings chosen by the kernel-mode driver will apply to all
+	 *   userspace clients.
+	 *
+	 * Option 2:
+	 *   Preemption settings are controlled on a per-context basis via
+	 *   register CS_CHICKEN1 (0x2580).  CS_CHICKEN1 is saved/restored on
+	 *   context switch and is writable by userspace (e.g., via
+	 *   MI_LOAD_REGISTER_IMMEDIATE instructions placed in a batch buffer)
+	 *   which allows different userspace drivers/clients to select
+	 *   different settings, or to change those settings on the fly in
+	 *   response to runtime needs.  This option was known by name
+	 *   "FtrPerCtxtPreemptionGranularityControl" at one time, although
+	 *   that name is somewhat misleading as other non-granularity
+	 *   preemption settings are also impacted by this decision.
+	 *
+	 * On Linux, our policy has always been to let userspace drivers
+	 * control preemption granularity/settings (Option 2).  This was
+	 * originally mandatory on gen9 to prevent ABI breakage (old gen9
+	 * userspace developed before object-level preemption was enabled would
+	 * not behave well if i915 were to go with Option 1 and enable that
+	 * preemption in a global manner).  On gen9 each context would have
+	 * object-level preemption disabled by default (see
+	 * WaDisable3DMidCmdPreemption in gen9_ctx_workarounds_init), but
+	 * userspace drivers could opt-in to object-level preemption as they
+	 * saw fit.  For post-gen9 platforms, we continue to utilize Option 2;
+	 * even though it is no longer necessary for ABI compatibility when
+	 * enabling a new platform, it does ensure that userspace will be able
+	 * to implement any workarounds that show up requiring temporary
+	 * adjustments to preemption behavior at runtime.
+	 *
+	 * Notes/Workarounds:
+	 *  - Wa_14015141709:  On DG2 and early steppings of MTL,
+	 *      CS_CHICKEN1[0] does not disable object-level preemption as
+	 *      it is supposed to (nor does CS_DEBUG_MODE1[0] if we had been
+	 *      using Option 1).  Effectively this means userspace is unable
+	 *      to disable object-level preemption on these platforms/steppings
+	 *      despite the setting here.
+	 *
+	 *  - Wa_16013994831:  May require that userspace program
+	 *      CS_CHICKEN1[10] when certain runtime conditions are true.
+	 *      Userspace requires Option 2 to be in effect for their update of
+	 *      CS_CHICKEN1[10] to be effective.
+	 *
+	 * Other workarounds may appear in the future that will also require
+	 * Option 2 behavior to allow proper userspace implementation.
+	 */
+	if (GRAPHICS_VER(i915) >= 9)
 		wa_masked_en(wal,
 			     GEN7_FF_SLICE_CS_CHICKEN1,
 			     GEN9_FFSC_PERCTX_PREEMPT_CTRL);
-	}
 
 	if (IS_SKYLAKE(i915) ||
 	    IS_KABYLAKE(i915) ||
-- 
2.37.2

