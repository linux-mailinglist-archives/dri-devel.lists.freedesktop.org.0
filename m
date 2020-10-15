Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DE028F080
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 13:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A6189D60;
	Thu, 15 Oct 2020 11:00:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DAB6E091;
 Thu, 15 Oct 2020 11:00:10 +0000 (UTC)
IronPort-SDR: PNAGHKj3AgMW78rZS2WAK4+0a8ECijw03edb9ryBGTr9wAfkeIcSS5Bx8VST4BTN0oQ+emg6yr
 5zBtiYXvNggw==
X-IronPort-AV: E=McAfee;i="6000,8403,9774"; a="163686076"
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="163686076"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2020 04:00:10 -0700
IronPort-SDR: 5Df4tH3Jy7E5GkdG0Q1PajgLiglAlLOHryUsaLdYSqAw+VtaztXQi3oNOH6VMhCT8+obTtWS1B
 A+GMZMP4zEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,378,1596524400"; d="scan'208";a="356949642"
Received: from linux-akn.iind.intel.com ([10.223.34.148])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Oct 2020 04:00:08 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC 04/13] drm/i915: Capture max frl rate for PCON in dfp cap
 structure
Date: Thu, 15 Oct 2020 16:22:50 +0530
Message-Id: <20201015105259.27934-5-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
References: <20201015105259.27934-1-ankit.k.nautiyal@intel.com>
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

HDMI2.1 PCON advertises Max FRL bandwidth supported by the PCON and
by the sink.

This patch captures these in dfp cap structure in intel_dp and uses
these to prune connector modes that cannot be supported by the PCON
and sink FRL bandwidth.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 33 +++++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0b5df8e44966..e2f58d0575a2 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1398,6 +1398,7 @@ struct intel_dp {
 	struct {
 		int min_tmds_clock, max_tmds_clock;
 		int max_dotclock;
+		int pcon_max_frl, sink_max_frl;
 		u8 max_bpc;
 		bool ycbcr_444_to_420;
 	} dfp;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0902a9aeeda1..cd6934f28f32 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -683,6 +683,24 @@ intel_dp_mode_valid_downstream(struct intel_connector *connector,
 	const struct drm_display_info *info = &connector->base.display_info;
 	int tmds_clock;
 
+	/* If PCON and HDMI2.1 sink both support FRL MODE, check FRL
+	 * bandwidth constraints.
+	 */
+	if (intel_dp->dfp.pcon_max_frl) {
+		int target_bw;
+		int max_frl_bw;
+		int bpp = intel_dp_mode_min_output_bpp(&connector->base, mode);
+
+		target_bw = bpp * DIV_ROUND_UP(target_clock, 1000000);
+
+		max_frl_bw = min(intel_dp->dfp.pcon_max_frl,
+				 intel_dp->dfp.sink_max_frl);
+		if (target_bw > max_frl_bw)
+			return MODE_CLOCK_HIGH;
+
+		return MODE_OK;
+	}
+
 	if (intel_dp->dfp.max_dotclock &&
 	    target_clock > intel_dp->dfp.max_dotclock)
 		return MODE_CLOCK_HIGH;
@@ -6383,13 +6401,21 @@ intel_dp_update_dfp(struct intel_dp *intel_dp,
 						 intel_dp->downstream_ports,
 						 edid);
 
+	intel_dp->dfp.pcon_max_frl =
+		drm_dp_get_pcon_max_frl_bw(intel_dp->dpcd,
+					   intel_dp->downstream_ports);
+
+	intel_dp->dfp.sink_max_frl = drm_dp_get_hdmi_max_frl_bw(&intel_dp->aux);
+
 	drm_dbg_kms(&i915->drm,
-		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d\n",
+		    "[CONNECTOR:%d:%s] DFP max bpc %d, max dotclock %d, TMDS clock %d-%d, PCON Max FRL BW %dGbps, Sink Max FRL BW %dGbps\n",
 		    connector->base.base.id, connector->base.name,
 		    intel_dp->dfp.max_bpc,
 		    intel_dp->dfp.max_dotclock,
 		    intel_dp->dfp.min_tmds_clock,
-		    intel_dp->dfp.max_tmds_clock);
+		    intel_dp->dfp.max_tmds_clock,
+		    intel_dp->dfp.pcon_max_frl,
+		    intel_dp->dfp.sink_max_frl);
 }
 
 static void
@@ -6479,6 +6505,9 @@ intel_dp_unset_edid(struct intel_dp *intel_dp)
 	intel_dp->dfp.min_tmds_clock = 0;
 	intel_dp->dfp.max_tmds_clock = 0;
 
+	intel_dp->dfp.pcon_max_frl = 0;
+	intel_dp->dfp.sink_max_frl = 0;
+
 	intel_dp->dfp.ycbcr_444_to_420 = false;
 	connector->base.ycbcr_420_allowed = false;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
