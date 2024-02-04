Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C7848F92
	for <lists+dri-devel@lfdr.de>; Sun,  4 Feb 2024 18:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06345112237;
	Sun,  4 Feb 2024 17:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F35112237
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Feb 2024 17:04:48 +0000 (UTC)
Received: from Marijn-Arch-Book.localdomain
 (2a02-a420-2a-6767-164f-8aff-fee4-5930.mobile6.kpn.net
 [IPv6:2a02:a420:2a:6767:164f:8aff:fee4:5930])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 541161F6CF;
 Sun,  4 Feb 2024 18:04:42 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 04 Feb 2024 18:04:39 +0100
Subject: [PATCH] drm/msm/dsi: Replace dsi_get_bpp() with mipi_dsi header
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240204-drm-msm-dsi-remove-open-coded-get-bpp-v1-1-c16212de7e86@somainline.org>
X-B4-Tracking: v=1; b=H4sIAKbDv2UC/x3NywrCQAxG4VcpWRuYVPH2KuLCaX5rFnMhU4pQ+
 u4OLr/NORs1uKHRfdjIsVqzkjvkMND0eeUZbNpNYxiPEuTG6olTS6zN2JHKCi4VmaeiUJ6xcKy
 VcbmeTzFEEVXqrep42/f/eTz3/QdOocv9dwAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.12.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_mipi_dsi.h already provides a conversion function from MIPI_DSI_FMT_
to bpp, named mipi_dsi_pixel_format_to_bpp().

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index deeecdfd6c4e..9fa0053fac74 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -183,16 +183,6 @@ struct msm_dsi_host {
 	int irq;
 };
 
-static u32 dsi_get_bpp(const enum mipi_dsi_pixel_format fmt)
-{
-	switch (fmt) {
-	case MIPI_DSI_FMT_RGB565:		return 16;
-	case MIPI_DSI_FMT_RGB666_PACKED:	return 18;
-	case MIPI_DSI_FMT_RGB666:
-	case MIPI_DSI_FMT_RGB888:
-	default:				return 24;
-	}
-}
 
 static inline u32 dsi_read(struct msm_dsi_host *msm_host, u32 reg)
 {
@@ -567,7 +557,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	u8 lanes = msm_host->lanes;
-	u32 bpp = dsi_get_bpp(msm_host->format);
+	u32 bpp = mipi_dsi_pixel_format_to_bpp(msm_host->format);
 	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
 	unsigned long pclk_bpp;
 
@@ -610,7 +600,7 @@ int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
-	u32 bpp = dsi_get_bpp(msm_host->format);
+	u32 bpp = mipi_dsi_pixel_format_to_bpp(msm_host->format);
 	unsigned int esc_mhz, esc_div;
 	unsigned long byte_mhz;
 
@@ -993,7 +983,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 		/* image data and 1 byte write_memory_start cmd */
 		if (!msm_host->dsc)
-			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
+			wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
@@ -1413,7 +1403,7 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 {
 	int len, ret;
 	int bllp_len = msm_host->mode->hdisplay *
-			dsi_get_bpp(msm_host->format) / 8;
+			mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8;
 
 	len = dsi_cmd_dma_add(msm_host, msg);
 	if (len < 0) {

---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20231019-drm-msm-dsi-remove-open-coded-get-bpp-e7864b0b11dd

Best regards,
-- 
Marijn Suijten <marijn.suijten@somainline.org>

