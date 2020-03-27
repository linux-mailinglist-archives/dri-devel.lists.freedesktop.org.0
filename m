Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8564195757
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 13:43:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74366EA17;
	Fri, 27 Mar 2020 12:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696B06EA1A;
 Fri, 27 Mar 2020 12:43:03 +0000 (UTC)
IronPort-SDR: 6jMdo+EJNheGlYI/mBcRHEWWFkMyazmvZ/h+nG8PVq1eWcEGT/h2s3KRT0fauDpbSgSPty3AsJ
 6dDAURx82zuw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:43:02 -0700
IronPort-SDR: ho0OVl68YmyilnlfQflVxfp4zqZw0SyTjaQ3Q2/V8WESPdKPENW74WolLs+MNe727AUqx6ScWT
 hHyiT/+7Gvog==
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="394365162"
Received: from defretin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:43:00 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 5/7] drm/i915/dsc: make rc_model_size an encoder
 defined value
Date: Fri, 27 Mar 2020 14:42:27 +0200
Message-Id: <20200327124229.26461-5-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327124229.26461-1-jani.nikula@intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Manasi Navare <manasi.d.navare@intel.com>,
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
index 5a83df2fd723..ca299ae5a393 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -1490,6 +1490,9 @@ static int gen11_dsi_dsc_compute_config(struct intel_encoder *encoder,
 
 	vdsc_cfg->convert_rgb = true;
 
+	/* FIXME: initialize from VBT */
+	vdsc_cfg->rc_model_size = DSC_RC_MODEL_SIZE_CONST;
+
 	ret = intel_dsc_compute_params(encoder, crtc_state);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index c33a39065704..dc54b31c0108 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2071,6 +2071,14 @@ static int intel_dp_dsc_compute_params(struct intel_encoder *encoder,
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
index 1f74b0174b1a..0ccb72cf3696 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -455,8 +455,6 @@ int intel_dsc_compute_params(struct intel_encoder *encoder,
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
