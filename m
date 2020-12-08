Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA832D2B1C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8696B6E97C;
	Tue,  8 Dec 2020 12:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A0F6E97B;
 Tue,  8 Dec 2020 12:34:24 +0000 (UTC)
IronPort-SDR: nyR/wX6w6izRHMvHWRgwpU/UEAQoIfj90M9wRLyBzM8QpwI8obvYRhvqwnaZ1AtoqMbvKa3zZT
 x1S9zDDVG9BQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="160928879"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="160928879"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:23 -0800
IronPort-SDR: Gi4y61XcR189/va0ZTcJLZyc/ci8Y18TQR/T5pGUKmJPw9gT6yhtWIa/MvBrB8exe24VaQf4DN
 CqFpqtr472UQ==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="317774370"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915/dsc: make rc_model_size an encoder defined value
Date: Tue,  8 Dec 2020 14:33:52 +0200
Message-Id: <6843c4f6958619f7389180aa92fded7b9fdbb4ba.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
References: <cover.1607429866.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the intialization of the rc_model_size from the common code into
encoder code, allowing different encoders to specify the size according
to their needs. Keep using the hard coded value in the encoders for now
to make this a non-functional change.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c    | 3 +++
 drivers/gpu/drm/i915/display/intel_dp.c   | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 --
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index a9439b415603..676e40172fe9 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1535,6 +1535,9 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 
 	vdsc_cfg->convert_rgb = true;
 
+	/* FIXME: initialize from VBT */
+	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+
 	ret = intel_dsc_compute_params(encoder, crtc_state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cb5e42c3ecd5..b2bc0c8c39c7 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2289,6 +2289,14 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
 	u8 line_buf_depth;
 	int ret;
 
+	/*
+	 * RC_MODEL_SIZE is currently a constant across all configurations.
+	 *
+	 * FIXME: Look into using sink defined DPCD DP_DSC_RC_BUF_BLK_SIZE and
+	 * DP_DSC_RC_BUF_SIZE for this.
+	 */
+	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+
 	ret = intel_dsc_compute_params(encoder, crtc_state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 22d08679844f..f58cc5700784 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -454,8 +454,6 @@ int intel_dsc_compute_params(struct intel_encoder *encoder,
 	else if (vdsc_cfg->bits_per_component == 12)
 		vdsc_cfg->mux_word_size = DSC_MUX_WORD_SIZE_12_BPC;
 
-	/* RC_MODEL_SIZE is a constant across all configurations */
-	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
 	/* InitialScaleValue is a 6 bit value with 3 fractional bits (U3.3) */
 	vdsc_cfg->initial_scale_value = (vdsc_cfg->rc_model_size << 3) /
 		(vdsc_cfg->rc_model_size - vdsc_cfg->initial_offset);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
