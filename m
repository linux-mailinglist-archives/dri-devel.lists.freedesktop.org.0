Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA64695F6E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767D10E84D;
	Tue, 14 Feb 2023 09:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2D810E84A;
 Tue, 14 Feb 2023 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676367635; x=1707903635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2LkRNjn+NJMBuOn3PZ2LJRw7lFsa8KRGibd7LNjjMCk=;
 b=RXXAk1ANmaCaHcw4KbfIa7lernADzSC6bk6ld72wz6R0SuXhIBSP3KPc
 TUTmUA3PR42RxaFLGlP3nNMIfKXjYmIwoP983UgLorUp5KImJl3f/CIIV
 yjv2P0qoWTuQoQpEzlUvdIFe8EZz3Q9sWfkmA9ckpXei2V/sCbzCgjRAG
 JM3+brNXYg7yEhcQBwsh9NPR4pu9FWcAd4DL/UjggM3vUTdOdxRJWfSpU
 6p9BJh6V9qhaV8XN1b0bgqlgX9dlzCVjXLqloXwSEWokqKa6+zf3KqR1E
 AbbgkQA+JFaLp6OfETS/28tgH173aGMjMKziTyGPh84RQ19TpoSLvUc52 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328831634"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="328831634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="757924120"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="757924120"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 01:40:28 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [RESEND PATCHv2 2/2] i915/display/dp: SDP CRC16 for 128b132b link
 layer
Date: Tue, 14 Feb 2023 15:04:59 +0530
Message-Id: <20230214093459.3617293-3-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214093459.3617293-1-arun.r.murthy@intel.com>
References: <20230214093459.3617293-1-arun.r.murthy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable SDP error detection configuration, this will set CRC16 in
128b/132b link layer.
For Display version 13 a hardware bit31 in register VIDEO_DIP_CTL is
added to enable/disable SDP CRC applicable for DP2.0 only, but the
default value of this bit will enable CRC16 in 128b/132b hence
skipping this write.
Corrective actions on SDP corruption is yet to be defined.

v2: Moved the CRC enable to link training init(Jani N)
v3: Moved crc enable to ddi pre enable <Jani N>

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 254559abedfb..fa995341614d 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -2330,6 +2330,18 @@ static void tgl_ddi_pre_enable_dp(struct intel_atomic_state *state,
 				 crtc_state->port_clock,
 				 crtc_state->lane_count);
 
+	/* DP v2.0 SCR on SDP CRC16 for 128b/132b Link Layer */
+	if (intel_dp_is_uhbr(crtc_state))
+		drm_dp_dpcd_writeb(&intel_dp->aux,
+				   DP_SDP_ERROR_DETECTION_CONFIGURATION,
+				   DP_SDP_CRC16_128B132B_EN);
+		/*
+		 * VIDEO_DIP_CTL register bit 31 should be set to '0' to not
+		 * disable SDP CRC. This is applicable for Display version 13.
+		 * Default value of bit 31 is '0' hence discarding the write
+		 */
+		/* TODO: Corrective actions on SDP corruption yet to be defined */
+
 	/*
 	 * We only configure what the register value will be here.  Actual
 	 * enabling happens during link training farther down.
-- 
2.25.1

