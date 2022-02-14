Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1FC4B48D3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DE610E307;
	Mon, 14 Feb 2022 10:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C710E2E4;
 Mon, 14 Feb 2022 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832879; x=1676368879;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7xVn7vqsWJP347O5nlTQsHxfP99/kjdvqaUPmMHyrE=;
 b=dGkmXmH/pjInp9kGRMKkEIsBUDPSm6wY6O9aSN2Nv5GUVc63/PcyVdik
 NKwkfQT6hZhrYk/HutVpoENXcQZAYZhzouKevg8IntD91XPVjzOpTs05T
 p9aEwc11fXNDK17wSY6imPKQ34BURMB0gOU24QXMEsvL+EmW9npY0Y6Tv
 J3T5HID21kLJ3bUCVpVoBUwbkrUTi+uXasgyIV6PtCuuzRtXeD7ddfJmx
 EoVbRD3kbZHpV1MbR712ERdHfChCCoezG9EIVq1h7sLKfdOwImz19IbeQ
 i/zPTU8t4BG4nzVa4RtAXXOvOyG/J2LkxdbUwOYFYCfqxXlX0bGpn3AH+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="274628542"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="274628542"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="543383161"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:01:17 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v2 1/5] drm/hdmi21: Define frl_dfm structure
Date: Mon, 14 Feb 2022 07:33:53 +0530
Message-Id: <20220214020357.10063-2-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214020357.10063-1-vandita.kulkarni@intel.com>
References: <20220214020357.10063-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define frl_dfm structure to hold frl characteristics
needed for frl capacity computation in order to
meet the data flow metering requirement.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 include/drm/drm_frl_dfm_helper.h | 124 +++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 include/drm/drm_frl_dfm_helper.h

diff --git a/include/drm/drm_frl_dfm_helper.h b/include/drm/drm_frl_dfm_helper.h
new file mode 100644
index 000000000000..5cab102fe25f
--- /dev/null
+++ b/include/drm/drm_frl_dfm_helper.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2022 Intel Corp
+ */
+
+#ifndef DRM_FRL_DFM_H_
+#define DRM_FRL_DFM_H_
+
+/* DFM constraints and tolerance values from HDMI2.1 spec */
+#define TB_BORROWED_MAX			400
+#define FRL_CHAR_PER_CHAR_BLK		510
+/* Tolerance pixel clock unit is in  mHz */
+#define TOLERANCE_PIXEL_CLOCK		5
+#define TOLERANCE_FRL_BIT_RATE		300
+#define TOLERANCE_AUDIO_CLOCK		1000
+#define ACR_RATE_MAX			1500
+#define EFFICIENCY_MULTIPLIER		1000
+#define OVERHEAD_M			(3 * EFFICIENCY_MULTIPLIER / 1000)
+#define BPP_MULTIPLIER			16
+#define FRL_TIMING_NS_MULTIPLIER	1000000000
+
+/* ALl the input config needed to compute DFM requirements */
+struct drm_frl_dfm_input_config {
+	/*
+	 * Pixel clock rate kHz, when FVA is
+	 * enabled this rate is the rate after adjustment
+	 */
+	unsigned int pixel_clock_nominal_khz;
+
+	/* active pixels per line */
+	unsigned int hactive;
+
+	/* Blanking pixels per line */
+	unsigned int hblank;
+
+	/* Bits per component */
+	unsigned int bpc;
+
+	/* Pixel encoding */
+	unsigned int color_format;
+
+	/* FRL bit rate in kbps */
+	unsigned int bit_rate_kbps;
+
+	/* FRL lanes */
+	unsigned int lanes;
+
+	/* Number of audio channels */
+	unsigned int audio_channels;
+
+	/* Audio rate in Hz */
+	unsigned int audio_hz;
+
+	/* Selected bpp target value */
+	unsigned int target_bpp_16;
+
+	/*
+	 * Number of horizontal pixels in a slice.
+	 * Equivalent to PPS parameter slice_width
+	 */
+	unsigned int slice_width;
+};
+
+/* Computed dfm parameters as per the HDMI2.1 spec */
+struct drm_frl_dfm_params {
+	/*
+	 * Link overhead in percentage
+	 * multiplied by 1000 (efficiency multiplier)
+	 */
+	unsigned int overhead_max;
+
+	/* Maximum pixel rate in kHz */
+	unsigned int pixel_clock_max_khz;
+
+	/* Minimum video line period in nano sec */
+	unsigned int line_time_ns;
+
+	/* worst case slow frl character rate in kbps */
+	unsigned int char_rate_min_kbps;
+
+	/* minimum total frl charecters per line perios */
+	unsigned int cfrl_line;
+
+	/* Average tribyte rate in khz */
+	unsigned int ftb_avg_k;
+
+	/* Audio characteristics */
+
+	/*  number of audio packets needed during hblank */
+	unsigned int num_audio_pkts_line;
+
+	/*
+	 *  Minimum required hblank assuming no control preiod
+	 *  RC compression
+	 */
+	unsigned int hblank_audio_min;
+
+	/* Number of tribytes required to carry active video */
+	unsigned int tb_active;
+
+	/* Total available tribytes during the blanking period */
+	unsigned int tb_blank;
+
+	/*
+	 * Number of tribytes required to be transmitted during
+	 * the hblank period
+	 */
+	unsigned int tb_borrowed;
+
+	/* DSC frl characteristics */
+
+	/* Tribytes required to carry the target bpp */
+	unsigned int hcactive_target;
+
+	/* tribytes available during blanking with target bpp */
+	unsigned int hcblank_target;
+};
+
+/* FRL DFM structure to hold involved in DFM computation */
+struct drm_hdmi_frl_dfm {
+	struct drm_frl_dfm_input_config config;
+	struct drm_frl_dfm_params params;
+};
+
+#endif
-- 
2.32.0

