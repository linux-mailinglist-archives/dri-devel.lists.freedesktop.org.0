Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D919575A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 13:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CFCA6EA1B;
	Fri, 27 Mar 2020 12:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9066B6EA1A;
 Fri, 27 Mar 2020 12:43:08 +0000 (UTC)
IronPort-SDR: dBGYCYdImuSbsiwGfHvZVidcxcFQQjuU7KTbXQ74Sppj1LCAYqMA7kc+xBYOX8Pz8gMT1ohuMe
 YTgXtScwFi5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:43:07 -0700
IronPort-SDR: hAabxKWdvwMpO8fVU70CBTW3ZqFqAbm7SCuLy5O4FueqazwdhEdQZ9owhSCZ8gI4eJ5YtLLJGn
 6RzCln7oveIA==
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="271567174"
Received: from defretin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.231])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:43:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 6/7] drm/i915/bios: fill in DSC rc_model_size from VBT
Date: Fri, 27 Mar 2020 14:42:28 +0200
Message-Id: <20200327124229.26461-6-jani.nikula@intel.com>
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

The VBT fields match the DPCD data, so use the same helper.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 839124647202..a4ea0e6c3286 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2494,16 +2494,11 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
 			      crtc_state->dsc.slice_count);
 
 	/*
-	 * FIXME: Use VBT rc_buffer_block_size and rc_buffer_size for the
-	 * implementation specific physical rate buffer size. Currently we use
-	 * the required rate buffer model size calculated in
-	 * drm_dsc_compute_rc_parameters() according to VESA DSC Annex E.
-	 *
 	 * The VBT rc_buffer_block_size and rc_buffer_size definitions
-	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63. The DP DSC
-	 * implementation should also use the DPCD (or perhaps VBT for eDP)
-	 * provided value for the buffer size.
+	 * correspond to DP 1.4 DPCD offsets 0x62 and 0x63.
 	 */
+	vdsc_cfg->rc_model_size = drm_dsc_dp_rc_buffer_size(dsc->rc_buffer_block_size,
+							    dsc->rc_buffer_size);
 
 	/* FIXME: DSI spec says bpc + 1 for this one */
 	vdsc_cfg->line_buf_depth = VBT_DSC_LINE_BUFFER_DEPTH(dsc->line_buffer_depth);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
