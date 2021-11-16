Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B43AE453911
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 18:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D0B6E0FC;
	Tue, 16 Nov 2021 17:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A0E6E102;
 Tue, 16 Nov 2021 17:58:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="233606392"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="233606392"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:27 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="672056351"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 09:48:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/i915/dg2: Add Wa_14010547955
Date: Tue, 16 Nov 2021 09:48:15 -0800
Message-Id: <20211116174818.2128062-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211116174818.2128062-1-matthew.d.roper@intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
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
index 0ceee8ac6671..1639bdbe2091 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -988,6 +988,10 @@ static void icl_set_pipe_chicken(const struct intel_crtc_state *crtc_state)
 	else if (DISPLAY_VER(dev_priv) >= 13)
 		tmp |= UNDERRUN_RECOVERY_DISABLE_ADLP;
 
+	/* Wa_14010547955:dg2 */
+	if (IS_DG2_DISPLAY_STEP(dev_priv, STEP_B0, STEP_FOREVER))
+		tmp |= DG2_RENDER_CCSTAG_4_3_EN;
+
 	intel_de_write(dev_priv, PIPE_CHICKEN(pipe), tmp);
 }
 
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index f15ffc53e858..c187ec122fdb 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -8568,8 +8568,9 @@ enum {
 							   _PIPEB_CHICKEN)
 #define   UNDERRUN_RECOVERY_DISABLE_ADLP	REG_BIT(30)
 #define   UNDERRUN_RECOVERY_ENABLE_DG2		REG_BIT(30)
-#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
-#define   PER_PIXEL_ALPHA_BYPASS_EN		(1 << 7)
+#define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU	REG_BIT(15)
+#define   DG2_RENDER_CCSTAG_4_3_EN		REG_BIT(12)
+#define   PER_PIXEL_ALPHA_BYPASS_EN		REG_BIT(7)
 
 #define VFLSKPD				_MMIO(0x62a8)
 #define   DIS_OVER_FETCH_CACHE		REG_BIT(1)
-- 
2.33.0

