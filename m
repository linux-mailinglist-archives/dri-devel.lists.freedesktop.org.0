Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EDD2CBFBE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 15:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F206F6EA65;
	Wed,  2 Dec 2020 14:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546E76EA60;
 Wed,  2 Dec 2020 14:31:32 +0000 (UTC)
IronPort-SDR: g8mDcUXYZT/J9oD7/71JAtBL0kFb/dKYo0HpTaPwbZyZVu0e8MxmYJTRi6BusLXI4AmqK8YqCa
 prbBdnrWEiNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="257733870"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="257733870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 06:30:58 -0800
IronPort-SDR: 2OIJU8bAcd+MFWqS9IlKXERcX6tAMIAtDXsZD9AGEU0bn++3u5kC5JLiL5riAWzMnwFAtbB2cf
 OIx2zYTjBXaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="373191577"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by orsmga007.jf.intel.com with ESMTP; 02 Dec 2020 06:30:55 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 09/13] drm/i915: Check for FRL training before DP Link
 training
Date: Wed,  2 Dec 2020 19:54:01 +0530
Message-Id: <20201202142405.14951-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
References: <20201202142405.14951-1-ankit.k.nautiyal@intel.com>
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
index 76e975b4765b..1c2fdaa4f81a 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3651,6 +3651,8 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	 */
 	intel_dp_sink_set_fec_ready(intel_dp, crtc_state);
 
+	intel_dp_check_frl_training(intel_dp, crtc_state);
+
 	/*
 	 * 7.i Follow DisplayPort specification training sequence (see notes for
 	 *     failure handling)
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 1396ee25812c..58c7e080d918 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4279,6 +4279,7 @@ static void intel_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 	intel_dp_configure_protocol_converter(intel_dp);
+	intel_dp_check_frl_training(intel_dp, pipe_config);
 	intel_dp_start_link_train(intel_dp, pipe_config);
 	intel_dp_stop_link_train(intel_dp, pipe_config);
 
@@ -6200,6 +6201,7 @@ int intel_dp_retrain_link(struct intel_encoder *encoder,
 		    !intel_dp_mst_is_master_trans(crtc_state))
 			continue;
 
+		intel_dp_check_frl_training(intel_dp, crtc_state);
 		intel_dp_start_link_train(intel_dp, crtc_state);
 		intel_dp_stop_link_train(intel_dp, crtc_state);
 		break;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
