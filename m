Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9D3D43D3
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941126FD51;
	Sat, 24 Jul 2021 00:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE2C6FD21;
 Sat, 24 Jul 2021 00:11:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563459"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563459"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434270020"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:32 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/30] drm/i915/display: rename CNL references in skl_scaler.c
Date: Fri, 23 Jul 2021 17:11:01 -0700
Message-Id: <20210724001114.249295-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724001114.249295-1-lucas.demarchi@intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the removal of CNL, let's consider GLK as the first platform using
those constants since GLK has DISPLAY_VER == 10.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/display/skl_scaler.c | 10 +++++-----
 drivers/gpu/drm/i915/i915_reg.h           |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 911a113ee006..ebdd3115de16 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -341,12 +341,12 @@ static u16 cnl_nearest_filter_coef(int t)
  *
  */
 
-static void cnl_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
+static void glk_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
 					     enum pipe pipe, int id, int set)
 {
 	int i;
 
-	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set),
+	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(pipe, id, set),
 			  PS_COEE_INDEX_AUTO_INC);
 
 	for (i = 0; i < 17 * 7; i += 2) {
@@ -359,11 +359,11 @@ static void cnl_program_nearest_filter_coefs(struct drm_i915_private *dev_priv,
 		t = cnl_coef_tap(i + 1);
 		tmp |= cnl_nearest_filter_coef(t) << 16;
 
-		intel_de_write_fw(dev_priv, CNL_PS_COEF_DATA_SET(pipe, id, set),
+		intel_de_write_fw(dev_priv, GLK_PS_COEF_DATA_SET(pipe, id, set),
 				  tmp);
 	}
 
-	intel_de_write_fw(dev_priv, CNL_PS_COEF_INDEX_SET(pipe, id, set), 0);
+	intel_de_write_fw(dev_priv, GLK_PS_COEF_INDEX_SET(pipe, id, set), 0);
 }
 
 static u32 skl_scaler_get_filter_select(enum drm_scaling_filter filter, int set)
@@ -386,7 +386,7 @@ static void skl_scaler_setup_filter(struct drm_i915_private *dev_priv, enum pipe
 	case DRM_SCALING_FILTER_DEFAULT:
 		break;
 	case DRM_SCALING_FILTER_NEAREST_NEIGHBOR:
-		cnl_program_nearest_filter_coefs(dev_priv, pipe, id, set);
+		glk_program_nearest_filter_coefs(dev_priv, pipe, id, set);
 		break;
 	default:
 		MISSING_CASE(filter);
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 91e93f3e9649..d198b1a2d4b5 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7726,11 +7726,11 @@ enum {
 #define SKL_PS_ECC_STAT(pipe, id)  _MMIO_PIPE(pipe,     \
 			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
 			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
-#define CNL_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
+#define GLK_PS_COEF_INDEX_SET(pipe, id, set)  _MMIO_PIPE(pipe,    \
 			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A) + (set) * 8, \
 			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B) + (set) * 8)
 
-#define CNL_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
+#define GLK_PS_COEF_DATA_SET(pipe, id, set)  _MMIO_PIPE(pipe,     \
 			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A) + (set) * 8, \
 			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B) + (set) * 8)
 /* legacy palette */
-- 
2.31.1

