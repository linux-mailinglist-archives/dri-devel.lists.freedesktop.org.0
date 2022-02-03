Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B18C4A8580
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC4E10F920;
	Thu,  3 Feb 2022 13:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A809F10F919;
 Thu,  3 Feb 2022 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643896073; x=1675432073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V+Hlacjoieg7QITq1D02nrZ1qJypbsww0OaAMPzrIJQ=;
 b=cAlbUtXJ9kBff9ZbwP0uHiW2qzs62+j6OV4gemRTmnCiPYStxg6pIDyE
 Kxqp2v4BvBVTxrv9LFtqiiTElNkQ5M+SUEbByLoq8bJNskMVf+YO4KReM
 ZirYrOZ2Mu6VkoZxVqQ0UH+Wx2A9hZLlfVTZAW+3K0rPY8/WAY3cgnDDJ
 cZOuybLTM6Ppq0e8xbhS88qv5soJOaNhJ3AsRX1ZnxMe2+p97effQ2VKV
 4I5L1BNokOJZR7Gx0YB7gPecb1Xr5K7U80hB6dalZpbG1m6B9KWHOwjmI
 VtwMYg5Uyp6S6Ax+SvxmW86KzVGbwitUesKqbo/fBD2KWQvCx6Ez1/Nj7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="308872272"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="308872272"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; d="scan'208";a="583793067"
Received: from unknown (HELO vandita-Z390-AORUS-ULTRA.iind.intel.com)
 ([10.190.238.8])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 05:47:31 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/5] drm/hdmi21: Add non dsc frl capacity computation helpers
Date: Thu,  3 Feb 2022 11:20:09 +0530
Message-Id: <20220203055012.14568-3-vandita.kulkarni@intel.com>
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

Add helper functions for computing non dsc frl
link characteristics

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/drm_frl_dfm_helper.c | 396 +++++++++++++++++++++++++++
 1 file changed, 396 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_frl_dfm_helper.c

diff --git a/drivers/gpu/drm/drm_frl_dfm_helper.c b/drivers/gpu/drm/drm_frl_dfm_helper.c
new file mode 100644
index 000000000000..8498083adf72
--- /dev/null
+++ b/drivers/gpu/drm/drm_frl_dfm_helper.c
@@ -0,0 +1,396 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corp
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <drm/drm_frl_dfm_helper.h>
+#include <drm/drm_connector.h>
+
+/* Total frl charecters per super block */
+static u32 drm_get_frl_char_per_super_blk(u32 lanes)
+{
+	u32 frl_char_per_sb;
+
+	frl_char_per_sb = (4 * FRL_CHAR_PER_CHAR_BLK) + lanes;
+	return frl_char_per_sb;
+}
+
+/*
+ * Determine the overhead due to the inclusion of
+ * the SR and SSB FRL charecters used for
+ * super block framing
+ */
+static u32 drm_get_overhead_super_blk(u32 lanes)
+{
+	return (lanes * EFFICIENCY_MULTIPLIER) / drm_get_frl_char_per_super_blk(lanes);
+}
+
+/*
+ * Determine the overhead due to the inclusion of RS FEC pairity
+ * symbols. Each charecter block uses 8 FRL charecters for RS Pairity
+ * and there are 4 charecter blocks per super block
+ */
+static u32 drm_get_overhead_rs(u32 lanes)
+{
+	return (8 * 4 * EFFICIENCY_MULTIPLIER) /  drm_get_frl_char_per_super_blk(lanes);
+}
+
+/* Determine the overhead due to FRL Map charecters.
+ * In a bandwidth constrained application, the FRL packets will be long,
+ * there will typically be two FRL Map Charecters per Super Block most of the time.
+ * When a tracnsition occurs between Hactive and Hblank (uncomperssed video) or
+ * HCactive and HCblank (compressed video transport), there may be a
+ * third FRL Map Charected. Therefore this spec assumes 2.5 FRL Map Charecters
+ * per Super Block.
+ */
+static u32 drm_get_overhead_frl_map_char(u32 lanes)
+{
+	return (25  * EFFICIENCY_MULTIPLIER) / (10 * drm_get_frl_char_per_super_blk(lanes));
+}
+
+/* Total minimum overhead multiplied by EFFICIENCY_MULIPLIER */
+static u32 drm_get_total_minimum_overhead(u32 lanes)
+{
+	u32 total_overhead_min;
+	u32 overhead_sb = drm_get_overhead_super_blk(lanes);
+	u32 overhead_rs = drm_get_overhead_rs(lanes);
+	u32 overhead_map = drm_get_overhead_frl_map_char(lanes);
+
+	total_overhead_min = overhead_sb + overhead_rs + overhead_map;
+
+	return total_overhead_min;
+}
+
+/*
+ * Additional margin to the overhead is provided to account for the possibility
+ * of more Map Charecters, zero padding at the end of HCactive, and other minor
+ * items
+ */
+static u32 drm_get_max_overhead(u32 total_overhead_min)
+{
+	u32 total_overhead_max;
+
+	total_overhead_max = total_overhead_min + OVERHEAD_M;
+	return total_overhead_max;
+}
+
+/* Collect the link charecteristics */
+
+/* Determine the maximum legal pixel rate */
+static u32 drm_get_max_legal_pixel_rate(u32 fpixel_clock_nominal_k)
+{
+	u32 fpixel_clock_max_k = (fpixel_clock_nominal_k *
+				  (1000 + TOLERANCE_PIXEL_CLOCK)) / 1000;
+	return fpixel_clock_max_k;
+}
+
+/* Determine the minimum Video Line period */
+static u32 drm_get_min_video_line_period(u32 hactive, u32 hblank,
+					 u32 fpixel_clock_max_k)
+{
+	u32 line_time_ns;
+
+	line_time_ns = ((hactive + hblank) * FRL_TIMING_NS_MULTIPLIER) /
+		       fpixel_clock_max_k;
+	return line_time_ns;
+}
+
+/* Determine the worst-case slow FRL Bit Rate in kbps*/
+static u32 drm_get_min_frl_bit_rate(u32 frl_bit_rate_nominal_k)
+{
+	u32 frl_bit_rate_min_k;
+
+	frl_bit_rate_min_k = (frl_bit_rate_nominal_k / 1000000) *
+			     (1000000 - TOLERANCE_FRL_BIT_RATE);
+	return frl_bit_rate_min_k;
+}
+
+/* Determine the worst-case slow FRL Charecter Rate */
+static u32 drm_get_min_frl_char_rate(u32 frl_bit_rate_min_k)
+{
+	u32 frl_char_rate_min_k;
+
+	frl_char_rate_min_k = frl_bit_rate_min_k / 18;
+	return frl_char_rate_min_k;
+}
+
+/* Determine the Minimum Total FRL charecters per line period */
+static u32
+drm_get_total_frl_char_per_line_period(u32 line_time_ns, u32 frl_char_rate_min_k,
+				      u32 lanes)
+{
+	u32 frl_char_per_line_period;
+
+	frl_char_per_line_period = (line_time_ns * frl_char_rate_min_k * lanes *
+				    1000) / FRL_TIMING_NS_MULTIPLIER;
+	return frl_char_per_line_period;
+}
+
+/* Audio Support Verification Computations */
+
+/*
+ * Determine Audio Related Packet Rate considering the audio clock
+ * increased to maximim rate permitted by Tolerance Audio clock
+ */
+static u32
+drm_get_audio_pkt_rate(u32 f_audio, u32 num_audio_pkt)
+{
+	u32 audio_pkt_rate;
+
+	audio_pkt_rate = ((f_audio *  num_audio_pkt + (2 * ACR_RATE_MAX)) *
+			 (1000000 + TOLERANCE_AUDIO_CLOCK)) / 1000000;
+	return audio_pkt_rate;
+}
+
+/*
+ * Average required packets per line is
+ * Number of audio packets needed during Hblank
+ */
+static u32
+drm_get_audio_pkts_hblank(u32 audio_pkt_rate, u32 line_time_ns)
+{
+	u32 avg_audio_pkts_per_line;
+
+	avg_audio_pkts_per_line = DIV_ROUND_UP(audio_pkt_rate * line_time_ns,
+					       FRL_TIMING_NS_MULTIPLIER);
+	return avg_audio_pkts_per_line;
+}
+
+/*
+ * Minimum required Hblank assuming no Control Period RC Compression
+ * This includes Video Guard band, Two Island Guard bands, two 12 character
+ * Control Periods and 32 * AudioPackets_Line.
+ * In addition, 32 character periods are allocated for the transmission of an
+ * ACR packet
+ */
+static u32
+drm_get_audio_hblank_min(u32 audio_pkts_line)
+{
+	u32  hblank_audio_min;
+
+	hblank_audio_min = 32 + 32 * audio_pkts_line;
+	return hblank_audio_min;
+}
+
+/*
+ * During the Hblank period, Audio packets (32 frl characters each),
+ * ACR packets (32 frl characters each), Island guard band (4 total frl characters)
+ * and Video guard band (3 frl characters) do not benefit from RC compression
+ * Therefore start by determining the number of Control Characters that maybe
+ * RC compressible
+ */
+static u32
+drm_get_num_char_rc_compressible(u32 color_format,
+				 u32 bpc, u32 audio_packets_line, u32 hblank)
+{
+	u32 cfrl_free;
+	u32 kcd, k420;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR420)
+		k420 = 2;
+	else
+		k420 = 1;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR422)
+		kcd = 1;
+	else
+		kcd = bpc/8;
+
+	cfrl_free = max(((hblank * kcd) / k420 - 32 * audio_packets_line - 7),
+			 U32_MIN);
+	return cfrl_free;
+}
+
+/*
+ * Determine the actual number of characters made available by
+ * RC compression
+ */
+static u32
+drm_get_num_char_compression_savings(u32 cfrl_free)
+{
+	/*In order to be conservative, situations are considered where
+	 * maximum RC compression may not be possible.
+	 * Add one character each for RC break caused by:
+	 * • Island Preamble not aligned to the RC Compression
+	 * • Video Preamble not aligned to the RC Compression
+	 * • HSYNC lead edge not aligned to the RC Compression
+	 * • HSYNC trail edge not aligned to the RC Compression
+	 */
+	const u32 cfrl_margin = 4;
+	u32 cfrl_savings = max(((7 * cfrl_free) / 8) - cfrl_margin, U32_MIN);
+	return cfrl_savings;
+}
+
+static u32
+drm_get_frl_bits_per_pixel(u32 color_format, u32 bpc)
+{
+	u32 kcd, k420, bpp;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR420)
+		k420 = 2;
+	else
+		k420 = 1;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR422)
+		kcd = 1;
+	else
+		kcd = bpc / 8;
+
+	bpp = (24 * kcd) / k420;
+	return bpp;
+}
+
+static u32
+drm_get_video_bytes_per_line(u32 bpp, u32 hactive)
+{
+	u32 bytes_per_line;
+
+	bytes_per_line = (bpp * hactive) / 8;
+	return bytes_per_line;
+}
+
+/*
+ * Determine the required number of tribytes to carry active video
+ * per line
+ */
+static u32
+drm_get_active_video_tribytes_reqd(u32 bytes_per_line)
+{
+	u32 tribyte_active;
+
+	tribyte_active = DIV_ROUND_UP(bytes_per_line, 3);
+	return tribyte_active;
+}
+
+/* Determine the total available tribytes during the blanking period */
+static u32
+drm_get_blanking_tribytes_avail(u32 color_format,
+				u32 hblank, u32 bpc)
+{
+	u32 tribytes_blank;
+	u32 kcd, k420;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR420)
+		k420 = 2;
+	else
+		k420 = 1;
+
+	if (color_format == DRM_COLOR_FORMAT_YCBCR422)
+		kcd = 1;
+	else
+		kcd = bpc / 8;
+
+	tribytes_blank = (hblank * kcd) / k420;
+	return tribytes_blank;
+}
+
+/* Determine the average tribyte rate in kilo tribytes per sec */
+static u32
+drm_get_avg_tribyte_rate(u32 pixel_clk_max_khz, u32 tb_active, u32 tb_blank,
+			 u32 hactive, u32 hblank)
+{
+	u32 ftb_avg_k;
+
+	ftb_avg_k = (pixel_clk_max_khz * (tb_active + tb_blank)) / (hactive + hblank);
+	return ftb_avg_k;
+}
+
+/*
+ * Determine the time required to transmit the active portion of the
+ * minimum possible active line period in the base timing
+ */
+static u32
+drm_get_tactive_ref(u32 line_time_ns, u32 hblank, u32 hactive)
+{
+	u32 tactive_ref_ns;
+
+	tactive_ref_ns = (line_time_ns * hactive) / (hblank + hactive);
+	return tactive_ref_ns;
+}
+
+/*
+ * Determine the time required to transmit the Video blanking portion
+ * of the minimum possible active line period in the base timing
+ */
+static u32
+drm_get_tblank_ref(u32 line_time_ns, u32 hblank, u32 hactive)
+{
+	u32 tblank_ref_ns;
+
+	tblank_ref_ns = (line_time_ns * hactive) / (hblank + hactive);
+	return tblank_ref_ns;
+}
+
+/*
+ * Determine the minimum time necessary to transmit the active tribytes
+ * considering frl bandwidth limitation.
+ * Given the available bandwidth (i.e after overhead is considered),
+ * tactive_min represents the amount of time needed to transmit all the
+ * active data
+ */
+static u32
+drm_get_tactive_min(u32 num_lanes, u32 tribyte_active,
+		    u32 overhead_max_k, u32 frl_char_min_rate_k)
+{
+	u32 tactive_min_ns, nr, dr;
+
+	nr = 3/2 * tribyte_active * FRL_TIMING_NS_MULTIPLIER;
+	dr = (num_lanes * frl_char_min_rate_k * 1000 *
+	      (EFFICIENCY_MULTIPLIER - overhead_max_k)) / EFFICIENCY_MULTIPLIER;
+	tactive_min_ns = nr / dr;
+
+	return tactive_min_ns;
+}
+
+/*
+ * Determine the minimum time necessary to transmit the video blanking
+ * tribytes considering frl bandwidth limitations
+ */
+static u32
+drm_get_tblank_min(u32 num_lanes, u32 tribyte_blank,
+		    u32 overhead_max_k, u32 frl_char_min_rate_k)
+{
+	u32 tblank_min_ns, nr, dr;
+
+	nr = tribyte_blank * FRL_TIMING_NS_MULTIPLIER;
+	dr = (num_lanes * frl_char_min_rate_k * 1000 *
+	      (EFFICIENCY_MULTIPLIER - overhead_max_k)) / EFFICIENCY_MULTIPLIER;
+	tblank_min_ns = nr / dr;
+	return tblank_min_ns;
+}
+
+/* Determine the disparity in tribytes */
+static u32
+drm_get_tribytes_borrowed(u32 tborrowed_ns, u32 ftb_avg_k)
+{
+	u32 tribytes_borrowed;
+
+	tribytes_borrowed = DIV_ROUND_UP((tborrowed_ns * ftb_avg_k * 1000),
+					 FRL_TIMING_NS_MULTIPLIER);
+	return tribytes_borrowed;
+}
+
+/*
+ * Determine the actual number of payload FRL characters required to carry each
+ * video line
+ */
+static u32
+drm_get_frl_char_payload_actual(u32 tribytes_active, u32 tribytes_blank, u32 cfrl_savings)
+{
+	u32 frl_char_payload_actual;
+
+	frl_char_payload_actual = DIV_ROUND_UP(3 * tribytes_active, 2) + tribytes_blank - cfrl_savings;
+	return frl_char_payload_actual;
+}
+
+/* Determine the payload utilization of the total number of FRL characters */
+static u32
+drm_compute_payload_utilization(u32 frl_char_payload_actual, u32 frl_char_per_line_period)
+{
+	u32 utilization;
+
+	utilization = (frl_char_payload_actual * EFFICIENCY_MULTIPLIER) / frl_char_per_line_period;
+	return utilization;
+}
-- 
2.32.0

