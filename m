Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7B78C927
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4F710E411;
	Tue, 29 Aug 2023 15:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339C910E3F6;
 Tue, 29 Aug 2023 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324794; x=1724860794;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYg5lYB+tJMLJfNr78dxtogN6tMe17OacfEWMUp0UHI=;
 b=CBWfv8mTalrGFIdPwFS3FHgCTfaywWog2fTd0BfvCyZUy7TDrhU542LW
 eZxZZCFhyfPTlVTfP5/45yR5eHq69RDpPKXYbQvTOZ3sJPtKYTSed1hT3
 Dm1qi6KtWYG0Lx1HEETIJENgk2tacbS1QO1JlesA0TZamiwucGpWNiIw8
 4Sd5Kmi/wQWsJQ0DSgZEL6jAD/duF/IQ+YodWRYJJy99lARA3sO+sE2h0
 0b8mIfh/c7PfFYfbfznqCAdIl3oGwb/hHTKZXFtnj5BwZfLlrvq3N0KI2
 Tq1kBVfoS0vKQND/NxgeR+fwRrcjDXO9bevKOV2J6X59WnN50IrSuxohn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769443"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769443"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555087"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555087"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:30 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 24/33] drm/i915/xelpd: Add plane color check to
 glk_plane_color_ctl
Date: Tue, 29 Aug 2023 21:34:13 +0530
Message-ID: <20230829160422.1251087-25-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extended glk_plane_color_ctl to have plane color checks. This helps
enabling the csc, degamma or gamma block based on user inputs.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 13 ++++++++++++-
 drivers/gpu/drm/i915/i915_reg.h                    |  1 +
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ce7c367fe2da..c08875fa965e 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -965,7 +965,18 @@ static u32 glk_plane_color_ctl(const struct intel_crtc_state *crtc_state,
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	u32 plane_color_ctl = 0;
 
-	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
+	/* FIXME needs hw.gamma_lut */
+	if (!plane_state->uapi.color.pre_csc_lut)
+		plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
+
+	/* FIXME needs hw.degamma_lut */
+	if (plane_state->uapi.color.post_csc_lut)
+		plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
+
+	/* FIXME needs hw.ctm */
+	if (plane_state->uapi.color.ctm)
+		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
+
 	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
 
 	if (fb->format->is_yuv && !icl_is_hdr_plane(dev_priv, plane->id)) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index e00e4d569ba9..d50bfe1000d3 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -3730,6 +3730,7 @@
 #define   PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709		REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 2)
 #define   PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 3)
 #define   PLANE_COLOR_CSC_MODE_RGB709_TO_RGB2020	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 4)
+#define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
 #define   PLANE_COLOR_PLANE_GAMMA_DISABLE		REG_BIT(13)
 #define   PLANE_COLOR_ALPHA_MASK			REG_GENMASK(5, 4)
 #define   PLANE_COLOR_ALPHA_DISABLE			REG_FIELD_PREP(PLANE_COLOR_ALPHA_MASK, 0)
-- 
2.38.1

