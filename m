Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8E7278704
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92346ECC3;
	Fri, 25 Sep 2020 12:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63C6ECBF;
 Fri, 25 Sep 2020 12:21:10 +0000 (UTC)
IronPort-SDR: z1/9MdWENyzVUELKV8Z8o6zQVsxz768zp3dBviLQyAN/X/E/IBUULKp2yZ8e04X3d/m+inL+nZ
 mUD3IHEstMkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="149163881"
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="149163881"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 05:21:10 -0700
IronPort-SDR: UmhRfvv3/iBh/KUvTE/ctggRM0r73KjXEQUUyZKpS7waNT9yAFIqxMSFSQcKw5mCzAFv+xyYSE
 7ikLG4198CxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,301,1596524400"; d="scan'208";a="383460404"
Received: from unknown (HELO linux-akn.iind.intel.com) ([10.223.34.148])
 by orsmga001.jf.intel.com with ESMTP; 25 Sep 2020 05:21:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 5/7] drm/i915: Check for FRL training before DP Link training
Date: Fri, 25 Sep 2020 17:43:38 +0530
Message-Id: <20200925121340.29497-6-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
References: <20200925121340.29497-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org, swati2.sharma@intel.com
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

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 ++
 drivers/gpu/drm/i915/display/intel_dp.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4d06178cd76c..cf8a8e2a64f7 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3389,6 +3389,8 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 
+	intel_dp_check_frl_training(intel_dp);
+
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
 	/*
 	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 3a8e69e5bbfb..b6e53e4f06ee 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4129,6 +4129,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp_sink_dpms(intel_dp, DRM_MODE_DPMS_ON);
 	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_check_frl_training(intel_dp);
 	intel_dp_start_link_train(intel_dp);
 	intel_dp_stop_link_train(intel_dp);
 
@@ -6050,6 +6051,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 							      intel_crtc_pch_transcoder(crtc), false);
 	}
 
+	intel_dp_check_frl_training(intel_dp);
 	intel_dp_start_link_train(intel_dp);
 	intel_dp_stop_link_train(intel_dp);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
