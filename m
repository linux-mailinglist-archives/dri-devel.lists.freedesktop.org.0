Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D24A857B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC210F91B;
	Thu,  3 Feb 2022 13:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340E010F91B;
 Thu,  3 Feb 2022 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896073; x=1675432073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cg05xtvKL6Tekcvd485yshIb+0IICTfNZBcRrqvmX8=;
 b=UEHtadv3ZWV2TYwjyB4Fre8lZ8TkQ8N8khg46yzSw9oOw/ybOXTroXTo
 gFa/DUSoM0F/xDaNfuLzYh2gkTNmilyNh6+p9pd0F6EWzHBTQvwny2dwD
 qwTCMWW65HFU6QeSta9tTMmD/pkJpEIgEipzC3W9mzd/018WhYFdc3XDI
 u1jbaNbDHs8NaQ9Ni9RuGr7vbaQyUsXmByRcDrEZlZyBTMGwbEVvAjTgI
 IZJ8Yag/0v6qvzDN2kb6RkpCKyaX1HFnr+6MDxV6nCbGW28LZyPDDFrmK
 pgkpLJT64z4kXiJICYFQQeSpaHtA0kJFx6pmoRKlukELVVlqksCVfwan9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308872260"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308872260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583793063"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:29 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 1/5] drm/hdmi21: Define frl_dfm structure
Date: Thu,  3 Feb 2022 11:20:08 +0530
Message-Id: <20220203055012.14568-2-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220203055012.14568-1-vandita.kulkarni@intel.com>
References: <20220203055012.14568-1-vandita.kulkarni@intel.com>
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define frl_dfm structure to hold frl characteristics
needed for frl capacity computation in order to
meet the data flow metering requirement.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 include/drm/drm_frl_dfm_helper.h | 126 +++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/drm/drm_frl_dfm_helper.h

diff --git a/include/drm/drm_frl_dfm_helper.h b/include/drm/drm_frl_dfm_helper.h
new file mode 100644
index 000000000000..16b8fcc7cbcc
--- /dev/null
+++ b/include/drm/drm_frl_dfm_helper.h
@@ -0,0 +1,126 @@
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
+
+	/*
+	 * Pixel clock rate kHz, when FVA is
+	 * enabled this rate is the rate after adjustment
+	 */
+	u32 pixel_clock_nominal_khz;
+
+	/* active pixels per line */
+	u32 hactive;
+
+	/* Blanking pixels per line */
+	u32 hblank;
+
+	/* Bits per component */
+	u32 bpc;
+
+	/* Pixel encoding */
+	u32 color_format;
+
+	/* FRL bit rate in kbps */
+	u32 bit_rate_kbps;
+
+	/* FRL lanes */
+	u32 lanes;
+
+	/* Number of audio channels */
+	u32 audio_channels;
+
+	/* Audio rate in Hz */
+	u32 audio_hz;
+
+	/* Selected bpp target value */
+	u32 target_bpp_16;
+
+	/*
+	 * Number of horizontal pixels in a slice.
+	 * Equivalent to PPS parameter slice_width
+	 */
+	u32 slice_width;
+};
+
+/* Computed dfm parameters as per the HDMI2.1 spec */
+struct drm_frl_dfm_params {
+
+	/*
+	 * Link overhead in percentage
+	 * multiplied by 1000 (efficiency multiplier)
+	 */
+	u32 overhead_max;
+
+	/* Maximum pixel rate in kHz */
+	u32 pixel_clock_max_khz;
+
+	/* Minimum video line period in nano sec */
+	u32 line_time_ns;
+
+	/* worst case slow frl character rate in kbps */
+	u32 char_rate_min_kbps;
+
+	/* minimum total frl charecters per line perios */
+	u32 cfrl_line;
+
+	/* Average tribyte rate in khz */
+	u32 ftb_avg_k;
+
+	/* Audio characteristics */
+
+	/*  number of audio packets needed during hblank */
+	u32 num_audio_pkts_line;
+
+	/*
+	 *  Minimum required hblank assuming no control preiod
+	 *  RC compression
+	 */
+	u32 hblank_audio_min;
+
+	/* Number of tribytes required to carry active video */
+	u32 tb_active;
+
+	/* Total available tribytes during the blanking period */
+	u32 tb_blank;
+
+	/*
+	 * Number of tribytes required to be transmitted during
+	 * the hblank period
+	 */
+	u32 tb_borrowed;
+
+	/* DSC frl characteristics */
+
+	/* Tribytes required to carry the target bpp */
+	u32 hcactive_target;
+
+	/* tribytes available during blanking with target bpp */
+	u32 hcblank_target;
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

