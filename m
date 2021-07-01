Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D134D3B976E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FAF6EC01;
	Thu,  1 Jul 2021 20:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02416EC03;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436157"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436157"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564462"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 23/53] drm/i915/xehpsdv: Read correct RP_STATE_CAP register
Date: Thu,  1 Jul 2021 13:23:57 -0700
Message-Id: <20210701202427.1547543-24-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The RP_STATE_CAP register is no longer part of the MCHBAR on XEHPSDV; this
register is now a per-tile register at GTTMMADDR offset 0x250014.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 4 +++-
 drivers/gpu/drm/i915/i915_reg.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 490bc1513480..8e7b70248392 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -1937,7 +1937,9 @@ u32 intel_rps_read_state_cap(struct intel_rps *rps)
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
 
-	if (IS_GEN9_LP(i915))
+	if (IS_XEHPSDV(i915))
+		return intel_uncore_read(uncore, XEHPSDV_RP_STATE_CAP);
+	else if (IS_GEN9_LP(i915))
 		return intel_uncore_read(uncore, BXT_RP_STATE_CAP);
 	else
 		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 0231f42226db..2992e8585399 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -4110,6 +4110,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
 #define BXT_RP_STATE_CAP        _MMIO(0x138170)
 #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
+#define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
 
 /*
  * Logical Context regs
-- 
2.25.4

