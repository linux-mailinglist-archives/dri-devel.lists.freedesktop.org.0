Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523742D2535
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293346E94D;
	Tue,  8 Dec 2020 07:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14CB6E94D;
 Tue,  8 Dec 2020 07:58:58 +0000 (UTC)
IronPort-SDR: U6+ldd+GucOVG2nCBeMTyR+lvO5MAtl5I05SDVP6oqtnFezMYvvhpr3kgTCEsMhy2xoLoMvpuZ
 162R+c2nVBaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="161614288"
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="161614288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 23:58:58 -0800
IronPort-SDR: UIAGwbbSnhrY9IFcBnlFQ7It+dj6R9ShjBWjFJT63xNuTVabsZOrDr4Q8meDkg4cOOyuGcctPT
 CvShNVyz/RFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,401,1599548400"; d="scan'208";a="317686664"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2020 23:58:50 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 16/16] drm/i915: Enable PCON configuration for Color
 Conversion for TGL
Date: Tue,  8 Dec 2020 13:21:45 +0530
Message-Id: <20201208075145.17389-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
References: <20201208075145.17389-1-ankit.k.nautiyal@intel.com>
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

This patch enables PCON configuration for color space conversion for
TGL+ platfrom. This will help in supporting 8k@60 YUV420 modes common
in HDMI 8k panels, through a capable PCON.
Also allow 8k@60 YUV420 modes, only if PCON claims to support the
color space conversion.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
 drivers/gpu/drm/i915/display/intel_dp.c  | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 721a47bbc009..ed6b8ea85408 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3644,6 +3644,7 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 	if (!is_mst)
 		intel_dp_set_power(intel_dp, DP_SET_POWER_D0);
 
+	intel_dp_configure_protocol_converter(intel_dp);
 	intel_dp_sink_set_decompression_state(intel_dp, crtc_state, true);
 	/*
 	 * DDI FEC: "anticipates enabling FEC encoding sets the FEC_READY bit
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b3f1190d8150..86289c925612 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -720,6 +720,11 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int tmds_clock;
 
+	/* Allow 8k YUV420 modes, only if PCON supports RGB->YUV conversion */
+	if (mode->hdisplay == 7680 && drm_mode_is_420_only(info, mode) &&
+	    !intel_dp->dfp.rgb_to_ycbcr)
+		return MODE_NO_420;
+
 	/*
 	 * If PCON and HDMI2.1 sink both support FRL MODE, check FRL
 	 * bandwidth constraints.
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
