Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E785A01E4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 21:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802C8C358F;
	Wed, 24 Aug 2022 19:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34D710E277;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866151; x=1692402151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xGQDS/i9Ej4d+vuzoYhYvXD0SDdxQY9cGkH9iMkRuCo=;
 b=Uu03HMIetkzhjzdcjMzwV2oYDKj+8DZc5JzvkbVGo7Lk++ggBR3aBUPP
 LCZiN4q6wNlKaz58LHSPOLYq/gvLnhUX79F4AyyauVGru8ZCTmpat12K9
 BwWUm0TDjawPDM3c+Yiju5kG0HM3Cc8wzVz2BysNDZ0qdnqNdHT+IkmkF
 tfAPgPhA6D215uXnTIfCSagGn97lIt1ogDtHIHYR8yuzRLb4FGOcMgH6f
 DPu9mMJ7BnSfPTzMq+SX2bZSjDHcQXfEwrposmMMUjoWXvLDZ+3hehZsw
 UOm9apfwldklTgejpwNYR7lKjXtM1/cMreLOe2NmBx+FOZ0OfszBD9JnV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938519"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953291"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/21] drm/i915/mtl: Add VBT port and AUX_CH mapping
Date: Thu, 18 Aug 2022 16:41:49 -0700
Message-Id: <20220818234202.451742-9-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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

From: Imre Deak <imre.deak@intel.com>

Add the proper VBT port,AUX_CH -> i915 port,AUX_CH mapping which just
follows the ADL_P one.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 198a2f4920cc..81d6cfbd2615 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2420,7 +2420,7 @@ static enum port dvo_port_to_port(struct drm_i915_private *i915,
 		[PORT_TC4] = { DVO_PORT_HDMII, DVO_PORT_DPI, -1 },
 	};
 
-	if (DISPLAY_VER(i915) == 13)
+	if (DISPLAY_VER(i915) >= 13)
 		return __dvo_port_to_port(ARRAY_SIZE(xelpd_port_mapping),
 					  ARRAY_SIZE(xelpd_port_mapping[0]),
 					  xelpd_port_mapping,
@@ -3578,7 +3578,7 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *i915,
 			aux_ch = AUX_CH_C;
 		break;
 	case DP_AUX_D:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_D_XELPD;
 		else if (IS_ALDERLAKE_S(i915))
 			aux_ch = AUX_CH_USBC3;
@@ -3588,7 +3588,7 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *i915,
 			aux_ch = AUX_CH_D;
 		break;
 	case DP_AUX_E:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_E_XELPD;
 		else if (IS_ALDERLAKE_S(i915))
 			aux_ch = AUX_CH_USBC4;
@@ -3596,25 +3596,25 @@ enum aux_ch intel_bios_port_aux_ch(struct drm_i915_private *i915,
 			aux_ch = AUX_CH_E;
 		break;
 	case DP_AUX_F:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_USBC1;
 		else
 			aux_ch = AUX_CH_F;
 		break;
 	case DP_AUX_G:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_USBC2;
 		else
 			aux_ch = AUX_CH_G;
 		break;
 	case DP_AUX_H:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_USBC3;
 		else
 			aux_ch = AUX_CH_H;
 		break;
 	case DP_AUX_I:
-		if (DISPLAY_VER(i915) == 13)
+		if (DISPLAY_VER(i915) >= 13)
 			aux_ch = AUX_CH_USBC4;
 		else
 			aux_ch = AUX_CH_I;
-- 
2.25.1

