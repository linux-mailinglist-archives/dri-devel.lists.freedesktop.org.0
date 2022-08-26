Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07C15A30CA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA3810E442;
	Fri, 26 Aug 2022 21:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3010E431;
 Fri, 26 Aug 2022 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661547788; x=1693083788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I2SN9EGS+6hqdL+ZOpgJrb+oEjcsv1YE8crMa96e1Fg=;
 b=WT2pXSknfvnX0teE3soV06uHm91b3UpnYHvifbsCsztm0RSPSBxlYxMw
 +gnIp0oe0aRW+LlX8WL1LVncb/kOMMhOpO2HqqeJaynTveLbsOEy2IF2H
 JSWwwmzD164cy2OaVTbO1JfrDuttn4FOreJFTIooFkljjt3F7oVppNkHB
 oKJnHQu4glXQdizkEBLCdUpQ4tiyJvVGcKPDt0up7v1yvhcK00eOrDOI/
 EqOlWByj9InF/wC5rEg3+Rmsj0vRrQj9fpXHVlnX1cv9eoUk7w2dWDhy+
 cH4DnsAhyjtCQGwDSTYM0E2bPCs/LjPaNuMHZxil2K915T4imSA5cHGNY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="356311215"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="356311215"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:03:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="561569592"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:03:07 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] Revert "drm/i915/dg2: Add preemption changes for
 Wa_14015141709"
Date: Fri, 26 Aug 2022 14:02:33 -0700
Message-Id: <20220826210233.406482-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit ca6920811aa5428270dd78af0a7a36b10119065a.

The intent of Wa_14015141709 was to inform us that userspace can no
longer control object-level preemption as it has on past platforms
(i.e., by twiddling register bit CS_CHICKEN1[0]).  The description of
the workaround in the spec wasn't terribly well-written, and when we
requested clarification from the hardware teams we were told that on the
kernel side we should also probably stop setting
FF_SLICE_CS_CHICKEN1[14], which is the register bit that directs the
hardware to honor the settings in per-context register CS_CHICKEN1.  It
turns out that this guidance about FF_SLICE_CS_CHICKEN1[14] was a
mistake; even though CS_CHICKEN1[0] is non-operational and useless to
userspace, there are other bits in the register that do still work and
might need to be adjusted by userspace in the future (e.g., to implement
other workarounds that show up).  If we don't set
FF_SLICE_CS_CHICKEN1[14] in i915, then those future workarounds would
not take effect.

This miscommunication came to light because another workaround
(Wa_16013994831) has now shown up that requires userspace to adjust the
value of CS_CHICKEN[10] in certain circumstances.  To ensure userspace's
updates to this chicken bit are handled properly by the hardware, we
need to make sure that FF_SLICE_CS_CHICKEN1[14] is once again set by the
kernel.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 drivers/gpu/drm/i915/i915_drv.h             | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3cdb8294e13f..69a0c6a74474 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2389,7 +2389,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 			     FF_DOP_CLOCK_GATE_DISABLE);
 	}
 
-	if (HAS_PERCTX_PREEMPT_CTRL(i915)) {
+	if (IS_GRAPHICS_VER(i915, 9, 12)) {
 		/* FtrPerCtxtPreemptionGranularityControl:skl,bxt,kbl,cfl,cnl,icl,tgl */
 		wa_masked_en(wal,
 			     GEN7_FF_SLICE_CS_CHICKEN1,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 2b00ef3626db..d6a1ab6f65de 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1352,9 +1352,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_GUC_DEPRIVILEGE(dev_priv) \
 	(INTEL_INFO(dev_priv)->has_guc_deprivilege)
 
-#define HAS_PERCTX_PREEMPT_CTRL(i915) \
-	((GRAPHICS_VER(i915) >= 9) &&  GRAPHICS_VER_FULL(i915) < IP_VER(12, 55))
-
 #define HAS_D12_PLANE_MINIMIZATION(dev_priv) (IS_ROCKETLAKE(dev_priv) || \
 					      IS_ALDERLAKE_S(dev_priv))
 
-- 
2.37.2

