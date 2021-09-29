Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5108041CF40
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 00:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78E26EAE1;
	Wed, 29 Sep 2021 22:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C8A6EADF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 22:28:41 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b20so17133413lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 15:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vu1bg27zpBZFAW9ugoY4QUd74f8yJ+aYRMq1iAEA5Hc=;
 b=QsmE3IO0pmn6OobIw4C1lBtD43vEgn4Nr24hOvgw6mVDSXiAyjCh+0YggiKfqH4E5N
 ML2WJLedqprAwMcKN4eK3pHCdpDeyWCSipx7uuKl6mYbIKjHFEkwmFdIywFCxGvXyqfW
 B3ri5ijaa/ooCLbZbWz24KTcwu9ZuELlJAyKp4BcGt6R23XUb9RLSKaX4ZIMC8dFuql3
 s5atHYVydtIq0sBC0VBSCA6Y8qWsvt74ZAV+AGHecda3D8l35Sn1Cq7JKydI9sGowdbJ
 AFG2N1Ndu8P6eZNehmu9qIxL0rMBcj3vfD5Cf5L1zLS55U8UJIfLsoK9zZ2vORQWVxVn
 6TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vu1bg27zpBZFAW9ugoY4QUd74f8yJ+aYRMq1iAEA5Hc=;
 b=5ZKEkYmH5VSptxy+EUTt/+YcvqXQClK5ra7yHBdP1wpunZNWMa5CByFhBy6H0CoAjG
 UiECsFyhaabsC9e/ZLHnZVyGidwglpgvNohYPW0bjWIYmBibDWXXr5S7/t9CHhzjuGSO
 UuAcyCvYDhAKaqf1Dja21lxdxul3+T287i7ljNZNyryZ0QqGHUxa7o6UuvL40ZYv5mSv
 hvoehjDuoa20olLNekFX+aZf+Tg2UCnBGIsMmerp2rVx48ildcatCF+UAcDOEYszppsS
 h7mFBhyIyiK0DCtNBC2rl4n0L/ytH+phdAMeXD3aqvKbMGWPGMcLsFtq13NqLHgU7SD5
 JxAg==
X-Gm-Message-State: AOAM532nHnLDermwAHV6/TNuFuOI9aEKDnFV3Bx7E6c/s011AIGOgU71
 kE+yK1gN8s/twyF/21M+sW8=
X-Google-Smtp-Source: ABdhPJx8+O803LKEtmOcKfQoXSfXwfU+MJtrRiiBlP9O0v26slvNcQY3cm7wqbpdSHrJm9pewyTZVw==
X-Received: by 2002:a2e:154a:: with SMTP id 10mr2563338ljv.397.1632954519847; 
 Wed, 29 Sep 2021 15:28:39 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.gmail.com with ESMTPSA id br40sm137782lfb.64.2021.09.29.15.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 15:28:39 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] drm/tegra: dc: rgb: Allow changing PLLD rate on
 Tegra30+
Date: Thu, 30 Sep 2021 01:28:05 +0300
Message-Id: <20210929222805.16511-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929222805.16511-1-digetx@gmail.com>
References: <20210929222805.16511-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Asus Transformer TF700T is a Tegra30 tablet device which uses RGB->DSI
bridge that requires a precise clock rate in order to operate properly.
Tegra30 has a dedicated PLL for each display controller, hence the PLL
rate can be changed freely. Allow PLL rate changes on Tegra30+ for RGB
output. Configure the clock rate before display controller is enabled
since DC itself may be running off this PLL and it's not okay to change
the rate of the active PLL that doesn't support dynamic frequency
switching since hardware will hang.

Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c  | 27 ++++++++++++--------
 drivers/gpu/drm/tegra/dc.h  |  1 +
 drivers/gpu/drm/tegra/rgb.c | 49 +++++++++++++++++++++++++++++++++++--
 3 files changed, 65 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index a582ce28b632..de4a7cb271ce 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1762,10 +1762,9 @@ int tegra_dc_state_setup_clock(struct tegra_dc *dc,
 	return 0;
 }
 
-static void tegra_dc_commit_state(struct tegra_dc *dc,
-				  struct tegra_dc_state *state)
+static void tegra_dc_set_clock_rate(struct tegra_dc *dc,
+				    struct tegra_dc_state *state)
 {
-	u32 value;
 	int err;
 
 	err = clk_set_parent(dc->clk, state->clk);
@@ -1796,11 +1795,6 @@ static void tegra_dc_commit_state(struct tegra_dc *dc,
 	DRM_DEBUG_KMS("rate: %lu, div: %u\n", clk_get_rate(dc->clk),
 		      state->div);
 	DRM_DEBUG_KMS("pclk: %lu\n", state->pclk);
-
-	if (!dc->soc->has_nvdisplay) {
-		value = SHIFT_CLK_DIVIDER(state->div) | PIXEL_CLK_DIVIDER_PCD1;
-		tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
-	}
 }
 
 static void tegra_dc_stop(struct tegra_dc *dc)
@@ -2002,6 +1996,9 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 	u32 value;
 	int err;
 
+	/* apply PLL changes */
+	tegra_dc_set_clock_rate(dc, crtc_state);
+
 	err = host1x_client_resume(&dc->client);
 	if (err < 0) {
 		dev_err(dc->dev, "failed to resume: %d\n", err);
@@ -2076,8 +2073,11 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 	else
 		tegra_dc_writel(dc, 0, DC_DISP_BORDER_COLOR);
 
-	/* apply PLL and pixel clock changes */
-	tegra_dc_commit_state(dc, crtc_state);
+	/* apply pixel clock changes */
+	if (!dc->soc->has_nvdisplay) {
+		value = SHIFT_CLK_DIVIDER(crtc_state->div) | PIXEL_CLK_DIVIDER_PCD1;
+		tegra_dc_writel(dc, value, DC_DISP_DISP_CLOCK_CONTROL);
+	}
 
 	/* program display mode */
 	tegra_dc_set_timings(dc, mode);
@@ -2691,6 +2691,7 @@ static const struct tegra_dc_soc_info tegra20_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = true,
 	.has_win_c_without_vert_filter = true,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.has_pll_d2_out0 = false,
 };
 
 static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
@@ -2713,6 +2714,7 @@ static const struct tegra_dc_soc_info tegra30_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = true,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = true,
+	.has_pll_d2_out0 = true,
 };
 
 static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
@@ -2735,6 +2737,7 @@ static const struct tegra_dc_soc_info tegra114_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = true,
+	.has_pll_d2_out0 = true,
 };
 
 static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
@@ -2757,6 +2760,7 @@ static const struct tegra_dc_soc_info tegra124_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.has_pll_d2_out0 = true,
 };
 
 static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
@@ -2779,6 +2783,7 @@ static const struct tegra_dc_soc_info tegra210_dc_soc_info = {
 	.has_win_b_vfilter_mem_client = false,
 	.has_win_c_without_vert_filter = false,
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.has_pll_d2_out0 = true,
 };
 
 static const struct tegra_windowgroup_soc tegra186_dc_wgrps[] = {
@@ -2829,6 +2834,7 @@ static const struct tegra_dc_soc_info tegra186_dc_soc_info = {
 	.wgrps = tegra186_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra186_dc_wgrps),
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.has_pll_d2_out0 = false,
 };
 
 static const struct tegra_windowgroup_soc tegra194_dc_wgrps[] = {
@@ -2879,6 +2885,7 @@ static const struct tegra_dc_soc_info tegra194_dc_soc_info = {
 	.wgrps = tegra194_dc_wgrps,
 	.num_wgrps = ARRAY_SIZE(tegra194_dc_wgrps),
 	.plane_tiled_memory_bandwidth_x2 = false,
+	.has_pll_d2_out0 = false,
 };
 
 static const struct of_device_id tegra_dc_of_match[] = {
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 40378308d527..c9c4c45c0518 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -76,6 +76,7 @@ struct tegra_dc_soc_info {
 	bool has_win_b_vfilter_mem_client;
 	bool has_win_c_without_vert_filter;
 	bool plane_tiled_memory_bandwidth_x2;
+	bool has_pll_d2_out0;
 };
 
 struct tegra_dc {
diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 933e14e4609f..ff8fce36d2aa 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -17,6 +17,8 @@ struct tegra_rgb {
 	struct tegra_output output;
 	struct tegra_dc *dc;
 
+	struct clk *pll_d_out0;
+	struct clk *pll_d2_out0;
 	struct clk *clk_parent;
 	struct clk *clk;
 };
@@ -119,6 +121,18 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder)
 	tegra_dc_commit(rgb->dc);
 }
 
+static bool tegra_rgb_pll_rate_change_allowed(struct tegra_rgb *rgb)
+{
+	if (!rgb->pll_d2_out0)
+		return false;
+
+	if (!clk_is_match(rgb->clk_parent, rgb->pll_d_out0) &&
+	    !clk_is_match(rgb->clk_parent, rgb->pll_d2_out0))
+		return false;
+
+	return true;
+}
+
 static int
 tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
@@ -147,8 +161,17 @@ tegra_rgb_encoder_atomic_check(struct drm_encoder *encoder,
 	 * and hope that the desired frequency can be matched (or at least
 	 * matched sufficiently close that the panel will still work).
 	 */
-	div = ((clk_get_rate(rgb->clk) * 2) / pclk) - 2;
-	pclk = 0;
+	if (tegra_rgb_pll_rate_change_allowed(rgb)) {
+		/*
+		 * Set display controller clock to x2 of PCLK in order to
+		 * produce higher resolution pulse positions.
+		 */
+		div = 2;
+		pclk *= 2;
+	} else {
+		div = ((clk_get_rate(rgb->clk) * 2) / pclk) - 2;
+		pclk = 0;
+	}
 
 	err = tegra_dc_state_setup_clock(dc, crtc_state, rgb->clk_parent,
 					 pclk, div);
@@ -206,6 +229,22 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 		return err;
 	}
 
+	rgb->pll_d_out0 = clk_get_sys(NULL, "pll_d_out0");
+	if (IS_ERR(rgb->pll_d_out0)) {
+		err = PTR_ERR(rgb->pll_d_out0);
+		dev_err(dc->dev, "failed to get pll_d_out0: %d\n", err);
+		return err;
+	}
+
+	if (dc->soc->has_pll_d2_out0) {
+		rgb->pll_d2_out0 = clk_get_sys(NULL, "pll_d2_out0");
+		if (IS_ERR(rgb->pll_d2_out0)) {
+			err = PTR_ERR(rgb->pll_d2_out0);
+			dev_err(dc->dev, "failed to get pll_d2_out0: %d\n", err);
+			return err;
+		}
+	}
+
 	dc->rgb = &rgb->output;
 
 	return 0;
@@ -213,9 +252,15 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
 
 int tegra_dc_rgb_remove(struct tegra_dc *dc)
 {
+	struct tegra_rgb *rgb;
+
 	if (!dc->rgb)
 		return 0;
 
+	rgb = to_rgb(dc->rgb);
+	clk_put(rgb->pll_d2_out0);
+	clk_put(rgb->pll_d_out0);
+
 	tegra_output_remove(dc->rgb);
 	dc->rgb = NULL;
 
-- 
2.32.0

