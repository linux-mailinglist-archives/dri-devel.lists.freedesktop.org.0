Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 177FA14570E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0763E6F519;
	Wed, 22 Jan 2020 13:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7794B6F50D;
 Wed, 22 Jan 2020 13:46:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 05:45:53 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="245054755"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 05:45:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/dsc: make rc_model_size an encoder defined value
Date: Wed, 22 Jan 2020 15:45:11 +0200
Message-Id: <92da6a5fee9b2aa3304503496053e0bb941063fe.1579700414.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579700414.git.jani.nikula@intel.com>
References: <cover.1579700414.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the intialization of the rc_model_size from the common code into
encoder code, allowing different encoders to specify the size according
to their needs. Keep using the hard coded value in the encoders for now
to make this a non-functional change.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/icl_dsi.c    | 3 +++
 drivers/gpu/drm/i915/display/intel_dp.c   | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_vdsc.c | 2 --
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index a7457303c62e..2ca4b0382eb9 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1352,6 +1352,9 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 
 	vdsc_cfg->convert_rgb = true;
 
+	/* FIXME: initialize from VBT */
+	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+
 	ret = intel_dsc_compute_params(encoder, crtc_state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 748e4614d25a..297e4d309b19 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2034,6 +2034,14 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
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
index 484853deb5d3..b48adb53291f 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -457,8 +457,6 @@ int intel_dsc_compute_params(struct intel_encoder *encoder,
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
