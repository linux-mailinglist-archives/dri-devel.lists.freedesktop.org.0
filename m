Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1A44DD60
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 22:57:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685AD6E4F3;
	Thu, 11 Nov 2021 21:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5CC6E32F;
 Thu, 11 Nov 2021 21:56:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233264834"
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="233264834"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 13:56:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,227,1631602800"; d="scan'208";a="643240217"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 13:56:52 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/dg2: Add Wa_14010547955
Date: Thu, 11 Nov 2021 13:56:41 -0800
Message-Id: <20211111215644.1123373-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111215644.1123373-1-matthew.d.roper@intel.com>
References: <20211111215644.1123373-1-matthew.d.roper@intel.com>
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

This workaround is documented a bit strangely in the bspec; it's listed
as an A0 workaround, but the description clarifies that the workaround
is implicitly handled by the hardware and what the driver really needs
to do is program a chicken bit to reenable some internal behavior.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 4 ++++
 drivers/gpu/drm/i915/i915_reg.h              | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0ceee8ac6671..5d50d06f4eb7 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -988,6 +988,10 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 	else if (DISPLAY_VER(dev_priv) >= 13)
 		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
 
+	/* Wa_14010547955:dg2 */
+	if (IS_DG2_DISP_STEP(dev_priv, STEP_B0, STEP_FOREVER))
+		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
+
 	intel_de_write(dev_priv, PIPE_CHICKEN(pipe), tmp);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 07d6cf76c389..680ace373e00 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8480,8 +8480,9 @@ enum {
 							   _PIPEB_CHICKEN)
 #define   UNDERRUN_RECOVERY_DISABLE_ADLP	REG_BIT(30)
 #define   UNDERRUN_RECOVERY_ENABLE_DG2		REG_BIT(30)
-#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
-#define   PER_PIXEL_ALPHA_BYPASS_EN		(1 << 7)
+#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU	REG_BIT(15)
+#define   DG2_RENDER_CCSTAG_4_3_EN		REG_BIT(12)
+#define   PER_PIXEL_ALPHA_BYPASS_EN		REG_BIT(7)
 
 #define FF_MODE2			_MMIO(0x6604)
 #define   FF_MODE2_GS_TIMER_MASK	REG_GENMASK(31, 24)
-- 
2.33.0

