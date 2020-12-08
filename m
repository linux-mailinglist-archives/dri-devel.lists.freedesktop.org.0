Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214A2D2B20
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C1F6E97D;
	Tue,  8 Dec 2020 12:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC9189D8E;
 Tue,  8 Dec 2020 12:34:37 +0000 (UTC)
IronPort-SDR: wo2M9opqG18MI37H0B/GdSAVMeKZSaiPnylb6ILfp322CSxI3RvseiyWpJGcCkhIDDsvMZSrDH
 paLi5ZjLYuNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235479455"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="235479455"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:37 -0800
IronPort-SDR: vC7RqbtewHcsZv7fQSLEwZaZZq3zq+bmefEDc1LnmQ1beVagGqgLApFGwQ45Avfyx/IJFl5IRx
 t6YXJhO1ld+Q==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="407603897"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:35 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/i915/bios: fill in DSC rc_model_size from VBT
Date: Tue,  8 Dec 2020 14:33:54 +0200
Message-Id: <43fba75d89525413aed0bdbb082c26b09458bd46.1607429866.git.jani.nikula@intel.com>
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

The VBT fields match the DPCD data, so use the same helper.

Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4cc949b228f2..06c3310446a2 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2555,16 +2555,11 @@ static void fill_dsc(struct intel_crtc_state *crtc_state,
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
