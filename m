Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972E798F25
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 21:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADF610E10D;
	Fri,  8 Sep 2023 19:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4190E10E108;
 Fri,  8 Sep 2023 19:29:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA7FAB821D4;
 Fri,  8 Sep 2023 19:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA99C433C8;
 Fri,  8 Sep 2023 19:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694201391;
 bh=iU2LSsE8udcY7pOIWc3im6Sq5bOK1xZJUvAgxMZFTLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jlPO9SIt3WSVk/MeOPrAzGQCZoBD+2TQn45scmLAspNFNU6ajsd2jCTWBtXBnu/j6
 hNzwlLCsGdY/5y3N/7H7x9oVxsy3RIDuIX9wEwmMsMdzvIlp5mvA3Dwk/rGMKt99Vb
 D5/5mu1DSA9qisj0jIO/KpcEBt+p+e9lLb9KmhK20ULE/ctgnx6jxDG+SDnADf6iLA
 LY44IuRV5Z5IgA/RnPKuz5F7d6GTqPW+/mLYhX4zfyZj/kbalYhLF1NqjjNGw/7UyV
 a2G4JxO+mYyzUN7XjkjxM1OMulvVS3lpXoQj/uZRo75aHhpAvSFTit4TFCdPCH2fQa
 M1578HEQDfNJA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 11/36] drm/amd/display: Add stream overhead in BW
 calculations for 128b/132b
Date: Fri,  8 Sep 2023 15:28:22 -0400
Message-Id: <20230908192848.3462476-11-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908192848.3462476-1-sashal@kernel.org>
References: <20230908192848.3462476-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.2
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 hamza.mahfooz@amd.com, jun.lei@amd.com, nasir.osman@amd.com,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, alvin.lee2@amd.com,
 George Shen <george.shen@amd.com>, Alan Liu <haoping.liu@amd.com>,
 sunpeng.li@amd.com, Daniel Wheeler <daniel.wheeler@amd.com>,
 Mike.Hsieh@amd.com, qingqing.zhuo@amd.com, Xinhui.Pan@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: George Shen <george.shen@amd.com>

[ Upstream commit 974764180838516f80a13257da67a1ec6afb87d4 ]

[Why]
Current BW calculations do not account for the additional padding added
for uncompressed pixel-to-symbol packing.

This results in X.Y being too low for 128b/132b SST streams in certain
scenarios. If X.Y is too low, end user can observe image corruption.

[How]
Add function to calculate stream overhead to timing BW calculation for
128b/132b SST cases.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Alan Liu <haoping.liu@amd.com>
Signed-off-by: George Shen <george.shen@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dc.h         |  2 +
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 42 +++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 63948170fd6d9..3d4180f7ba349 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1409,6 +1409,8 @@ struct dc_plane_state *dc_get_surface_for_mpcc(struct dc *dc,
 
 uint32_t dc_get_opp_for_plane(struct dc *dc, struct dc_plane_state *plane);
 
+void dc_set_disable_128b_132b_stream_overhead(bool disable);
+
 /* The function returns minimum bandwidth required to drive a given timing
  * return - minimum required timing bandwidth in kbps.
  */
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 58dd62cce4bb9..aed0d3dafa247 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -40,6 +40,8 @@ static bool dsc_policy_enable_dsc_when_not_needed;
 
 static bool dsc_policy_disable_dsc_stream_overhead;
 
+static bool disable_128b_132b_stream_overhead;
+
 #ifndef MAX
 #define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
 #endif
@@ -47,6 +49,41 @@ static bool dsc_policy_disable_dsc_stream_overhead;
 #define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
 #endif
 
+/* Need to account for padding due to pixel-to-symbol packing
+ * for uncompressed 128b/132b streams.
+ */
+static uint32_t apply_128b_132b_stream_overhead(
+	const struct dc_crtc_timing *timing, const uint32_t kbps)
+{
+	uint32_t total_kbps = kbps;
+
+	if (disable_128b_132b_stream_overhead)
+		return kbps;
+
+	if (!timing->flags.DSC) {
+		struct fixed31_32 bpp;
+		struct fixed31_32 overhead_factor;
+
+		bpp = dc_fixpt_from_int(kbps);
+		bpp = dc_fixpt_div_int(bpp, timing->pix_clk_100hz / 10);
+
+		/* Symbols_per_HActive = HActive * bpp / (4 lanes * 32-bit symbol size)
+		 * Overhead_factor = ceil(Symbols_per_HActive) / Symbols_per_HActive
+		 */
+		overhead_factor = dc_fixpt_from_int(timing->h_addressable);
+		overhead_factor = dc_fixpt_mul(overhead_factor, bpp);
+		overhead_factor = dc_fixpt_div_int(overhead_factor, 128);
+		overhead_factor = dc_fixpt_div(
+			dc_fixpt_from_int(dc_fixpt_ceil(overhead_factor)),
+			overhead_factor);
+
+		total_kbps = dc_fixpt_ceil(
+			dc_fixpt_mul_int(overhead_factor, total_kbps));
+	}
+
+	return total_kbps;
+}
+
 uint32_t dc_bandwidth_in_kbps_from_timing(
 	const struct dc_crtc_timing *timing)
 {
@@ -1165,6 +1202,11 @@ void dc_dsc_policy_set_disable_dsc_stream_overhead(bool disable)
 	dsc_policy_disable_dsc_stream_overhead = disable;
 }
 
+void dc_set_disable_128b_132b_stream_overhead(bool disable)
+{
+	disable_128b_132b_stream_overhead = disable;
+}
+
 void dc_dsc_get_default_config_option(const struct dc *dc, struct dc_dsc_config_options *options)
 {
 	options->dsc_min_slice_height_override = dc->debug.dsc_min_slice_height_override;
-- 
2.40.1

