Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B022DBAC3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 06:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F6A89FC5;
	Wed, 16 Dec 2020 05:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A44B89D66;
 Wed, 16 Dec 2020 05:37:58 +0000 (UTC)
IronPort-SDR: v5DKwhbPN4WYKn+5DxJtT2gMcN0MN8+mRrKf3O9J0dCwvhfxkGtSiC2kRtukMDFXVg1JGO90RZ
 jALlxao/OCfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9836"; a="172437339"
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="172437339"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 21:37:58 -0800
IronPort-SDR: U1Yig692D9CqTBw65YpOgWq64uEX1r82yElt1WIDOnMnO29BamBSQYh8XCQD5vI56zcoiAL4BC
 nbxdJALmKzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,423,1599548400"; d="scan'208";a="556647139"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga006.fm.intel.com with ESMTP; 15 Dec 2020 21:37:55 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 10/15] drm/i915: Check for FRL training before DP Link
 training
Date: Wed, 16 Dec 2020 11:01:16 +0530
Message-Id: <20201216053121.18819-11-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
References: <20201216053121.18819-1-ankit.k.nautiyal@intel.com>
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
Cc: swati2.sharma@intel.com, airlied@linux.ie, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch calls functions to check FRL training requirements
for an HDMI2.1 sink, when connected through PCON.
The call is made before the DP link training. In case FRL is not
required or failure during FRL training, the TMDS mode is selected
for the pcon.

v2: moved check_frl_training() just after FEC READY, before
starting DP link training.

v3: rebase

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
 drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 6863236df1d0..974cf42351bc 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3652,6 +3652,8 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	 */
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
 
+	intel_dp_check_frl_training(intel_dp);
+
 	/*
 	 * 7.i Follow DisplayPort specification training sequence (see notes for
 	 *     failure handling)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1fdcb7672ad0..9d0adce14613 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4256,6 +4256,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_check_frl_training(intel_dp);
 	intel_dp_start_link_train(intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
 
@@ -6177,6 +6178,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 		    !intel_dp_mst_is_master_trans(crtc_state))
 			continue;
 
+		intel_dp_check_frl_training(intel_dp);
 		intel_dp_start_link_train(intel_dp, crtc_state);
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 		break;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
