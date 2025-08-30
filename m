Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF53B3CFF4
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 00:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1D610E288;
	Sat, 30 Aug 2025 22:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="g3cu9yVk";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="3nxQIofJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477E10E031;
 Sat, 30 Aug 2025 22:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756593504; bh=Xsd7+bBBC8QfJD56Rt5bDFh
 lGwWmileHCwDuLOnT9k8=; b=g3cu9yVkR8pRBru5IknV75CjHQM/uLJooEGI4juzLH71610pYP
 eF2pQS4JNRZ3usIWCb4oaz+Uhcs0wjdwhP1c/VoMsET8HEsUIG/xXxECX2FbSuKJsVXt5XddEKg
 iN2lBnDle0fMvX5+9cJedEttFOrX2HbXp7JlqkNO/EtAxFVYCsAmTGEy+L44NQQy82zYI8wiDVJ
 RrmA571755oJkxIDkVO+JD4fFnKNrXkGnKjkTwHdF0MqQUejnUQ8KT029+fZBASrmQZ9zKMJjvc
 4dOMmrj3ObRFgqxcPWSLSzzfHLKEc7j6x/Gu4muACtznx1S1ZC4M30MY4W3W4F/yrsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org;
 c=relaxed/relaxed; 
 h=To:Message-Id:Subject:Date:From; t=1756593504; bh=Xsd7+bBBC8QfJD56Rt5bDFh
 lGwWmileHCwDuLOnT9k8=; b=3nxQIofJrGSpzArgIEpZHwyW8cI24Q2NdUUQ4IeUSlMV/Djopc
 mGoDGJ3ogrKXK3TZv25Aa1G3whZdApw8nYCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Sun, 31 Aug 2025 00:38:14 +0200
Subject: [PATCH v7 2/6] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250831-msm8937-v7-2-232a9fb19ab7@mainlining.org>
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
In-Reply-To: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Adam Skladowski <a_skl39@protonmail.com>, 
 Sireesh Kodali <sireeshkodali@protonmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Daniil Titov <daniilt971@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756593498; l=30637;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=6PPGqcunREI/Dc6bwQw/3mJ+6PxNgSLlxJYGDC1bq+c=;
 b=Zfoo6dBN0OZZ5oYne+j7VTy4BM/dc8AKMyev5TAZO1Ki0E3E9rcp/gLIv2dHY6QJl0c6UJxUI
 gAyqmYXEXA+CjZ9Zo3oZyIdQhyn3Pfg5i34EtB11E+m59hMIU5Jd9YQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

From: Daniil Titov <daniilt971@gmail.com>

Modify existing MSM8917 driver to support MSM8937 SoC. Override frequencies
which are different in this chip. Register all the clocks to the framework
for the clients to be able to request for them. Add new variant of GDSC for
new chip.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 drivers/clk/qcom/Kconfig       |   6 +-
 drivers/clk/qcom/gcc-msm8917.c | 617 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 616 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index aeb6197d7c902098459c9b2cba75072bd519b0f3..e5de50354125445edcfdcfa03aa218ee66859b9a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -332,12 +332,12 @@ config MSM_GCC_8916
 	  SD/eMMC, display, graphics, camera etc.
 
 config MSM_GCC_8917
-	tristate "MSM8917/QM215 Global Clock Controller"
+	tristate "MSM89(17/37)/QM215 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on msm8917 and qm215
-	  devices.
+	  Support for the global clock controller on msm8917, msm8937
+	  and qm215 devices.
 	  Say Y if you want to use devices such as UART, SPI i2c, USB,
 	  SD/eMMC, display, graphics, camera etc.
 
diff --git a/drivers/clk/qcom/gcc-msm8917.c b/drivers/clk/qcom/gcc-msm8917.c
index 3e2a2ae2ee6e9e647fb68c493ae7b0e49af79968..0a1aa623cd49af55d9d81148df7809b170fea60b 100644
--- a/drivers/clk/qcom/gcc-msm8917.c
+++ b/drivers/clk/qcom/gcc-msm8917.c
@@ -37,6 +37,8 @@ enum {
 	DT_SLEEP_CLK,
 	DT_DSI0PLL,
 	DT_DSI0PLL_BYTE,
+	DT_DSI1PLL,
+	DT_DSI1PLL_BYTE,
 };
 
 enum {
@@ -48,6 +50,8 @@ enum {
 	P_GPLL6,
 	P_DSI0PLL,
 	P_DSI0PLL_BYTE,
+	P_DSI1PLL,
+	P_DSI1PLL_BYTE,
 };
 
 static struct clk_alpha_pll gpll0_sleep_clk_src = {
@@ -102,7 +106,11 @@ static const struct pll_vco gpll3_p_vco[] = {
 	{ 700000000, 1400000000, 0 },
 };
 
-static const struct alpha_pll_config gpll3_early_config = {
+static const struct pll_vco gpll3_p_vco_msm8937[] = {
+	{ 525000000, 1066000000, 0 },
+};
+
+static struct alpha_pll_config gpll3_early_config = {
 	.l = 63,
 	.config_ctl_val = 0x4001055b,
 	.early_output_mask = 0,
@@ -273,6 +281,19 @@ static const struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] = {
 	{ }
 };
 
+static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x0200c,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.cmd_rcgr = 0x03000,
 	.hid_width = 5,
@@ -351,6 +372,19 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	}
 };
 
+static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
+	.cmd_rcgr = 0x18000,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_i2c_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup4_i2c_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_blsp_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
@@ -362,6 +396,20 @@ static const struct freq_tbl ftbl_blsp_spi_apps_clk_src[] = {
 	{ }
 };
 
+static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
+	.cmd_rcgr = 0x02024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp1_qup1_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.cmd_rcgr = 0x03014,
 	.hid_width = 5,
@@ -446,6 +494,20 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	}
 };
 
+static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
+	.cmd_rcgr = 0x18024,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.freq_tbl = ftbl_blsp_spi_apps_clk_src,
+	.parent_map = gcc_xo_gpll0_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "blsp2_qup4_spi_apps_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_blsp_uart_apps_clk_src[] = {
 	F(3686400, P_GPLL0, 1, 72, 15625),
 	F(7372800, P_GPLL0, 1, 144, 15625),
@@ -525,11 +587,19 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 static const struct parent_map gcc_byte0_map[] = {
 	{ P_XO, 0 },
 	{ P_DSI0PLL_BYTE, 1 },
+	{ P_DSI1PLL_BYTE, 3 },
+};
+
+static const struct parent_map gcc_byte1_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL_BYTE, 3 },
+	{ P_DSI1PLL_BYTE, 1 },
 };
 
 static const struct clk_parent_data gcc_byte_data[] = {
 	{ .index = DT_XO },
 	{ .index = DT_DSI0PLL_BYTE },
+	{ .index = DT_DSI1PLL_BYTE },
 };
 
 static struct clk_rcg2 byte0_clk_src = {
@@ -545,6 +615,19 @@ static struct clk_rcg2 byte0_clk_src = {
 	}
 };
 
+static struct clk_rcg2 byte1_clk_src = {
+	.cmd_rcgr = 0x4d0b0,
+	.hid_width = 5,
+	.parent_map = gcc_byte1_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "byte1_clk_src",
+		.parent_data = gcc_byte_data,
+		.num_parents = ARRAY_SIZE(gcc_byte_data),
+		.ops = &clk_byte2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct freq_tbl ftbl_camss_gp_clk_src[] = {
 	F(100000000, P_GPLL0, 8, 0, 0),
 	F(160000000, P_GPLL0, 5, 0, 0),
@@ -642,6 +725,17 @@ static const struct freq_tbl ftbl_cpp_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_cpp_clk_src_msm8937[] = {
+	F(133330000, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 5, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	F(308570000, P_GPLL6, 3.5, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(360000000, P_GPLL6, 3, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 cpp_clk_src = {
 	.cmd_rcgr = 0x58018,
 	.hid_width = 5,
@@ -655,6 +749,13 @@ static struct clk_rcg2 cpp_clk_src = {
 	}
 };
 
+static struct clk_init_data vcodec0_clk_src_init_msm8937 = {
+	.name = "vcodec0_clk_src",
+	.parent_data = gcc_cpp_data,
+	.num_parents = ARRAY_SIZE(gcc_cpp_data),
+	.ops = &clk_rcg2_ops,
+};
+
 static const struct freq_tbl ftbl_crypto_clk_src[] = {
 	F(50000000, P_GPLL0, 16, 0, 0),
 	F(80000000, P_GPLL0, 10, 0, 0),
@@ -730,6 +831,13 @@ static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_csi_phytimer_clk_src_msm8937[] = {
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 csi0phytimer_clk_src = {
 	.cmd_rcgr = 0x4e000,
 	.hid_width = 5,
@@ -774,6 +882,19 @@ static struct clk_rcg2 esc0_clk_src = {
 	}
 };
 
+static struct clk_rcg2 esc1_clk_src = {
+	.cmd_rcgr = 0x4d0a8,
+	.hid_width = 5,
+	.freq_tbl = ftbl_esc0_1_clk_src,
+	.parent_map = gcc_xo_gpll0_out_aux_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "esc1_clk_src",
+		.parent_data = gcc_xo_gpll0_data,
+		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_data),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct parent_map gcc_gfx3d_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
@@ -817,6 +938,25 @@ static const struct freq_tbl ftbl_gfx3d_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_gfx3d_clk_src_msm8937[] = {
+	F(19200000, P_XO, 1, 0, 0),
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(216000000, P_GPLL6, 5, 0, 0),
+	F(228570000, P_GPLL0, 3.5, 0, 0),
+	F(240000000, P_GPLL6, 4.5, 0, 0),
+	F(266670000, P_GPLL0, 3, 0, 0),
+	F(300000000, P_GPLL3, 1, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(375000000, P_GPLL3, 1, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	F(450000000, P_GPLL3, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 gfx3d_clk_src = {
 	.cmd_rcgr = 0x59000,
 	.hid_width = 5,
@@ -973,21 +1113,29 @@ static struct clk_rcg2 mdp_clk_src = {
 	}
 };
 
-static const struct parent_map gcc_pclk_map[] = {
+static const struct parent_map gcc_pclk0_map[] = {
 	{ P_XO, 0 },
 	{ P_DSI0PLL, 1 },
+	{ P_DSI1PLL, 3 },
+};
+
+static const struct parent_map gcc_pclk1_map[] = {
+	{ P_XO, 0 },
+	{ P_DSI0PLL, 3 },
+	{ P_DSI1PLL, 1 },
 };
 
 static const struct clk_parent_data gcc_pclk_data[] = {
 	{ .index = DT_XO },
 	{ .index = DT_DSI0PLL },
+	{ .index = DT_DSI1PLL },
 };
 
 static struct clk_rcg2 pclk0_clk_src = {
 	.cmd_rcgr = 0x4d000,
 	.hid_width = 5,
 	.mnd_width = 8,
-	.parent_map = gcc_pclk_map,
+	.parent_map = gcc_pclk0_map,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pclk0_clk_src",
 		.parent_data = gcc_pclk_data,
@@ -997,6 +1145,20 @@ static struct clk_rcg2 pclk0_clk_src = {
 	}
 };
 
+static struct clk_rcg2 pclk1_clk_src = {
+	.cmd_rcgr = 0x4d0b8,
+	.hid_width = 5,
+	.mnd_width = 8,
+	.parent_map = gcc_pclk1_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pclk1_clk_src",
+		.parent_data = gcc_pclk_data,
+		.num_parents = ARRAY_SIZE(gcc_pclk_data),
+		.ops = &clk_pixel_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 static const struct freq_tbl ftbl_pdm2_clk_src[] = {
 	F(64000000, P_GPLL0, 12.5, 0, 0),
 	{ }
@@ -1108,6 +1270,14 @@ static const struct freq_tbl ftbl_usb_hs_system_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_usb_hs_system_clk_src_msm8937[] = {
+	F(57142857, P_GPLL0, 14, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	F(177777778, P_GPLL0, 4.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 usb_hs_system_clk_src = {
 	.cmd_rcgr = 0x41010,
 	.hid_width = 5,
@@ -1132,6 +1302,15 @@ static const struct freq_tbl ftbl_vcodec0_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_vcodec0_clk_src_msm8937[] = {
+	F(166150000, P_GPLL6, 6.5, 0, 0),
+	F(240000000, P_GPLL6, 4.5, 0, 0),
+	F(308571428, P_GPLL6, 3.5, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(360000000, P_GPLL6, 3, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 vcodec0_clk_src = {
 	.cmd_rcgr = 0x4c000,
 	.hid_width = 5,
@@ -1160,6 +1339,23 @@ static const struct freq_tbl ftbl_vfe_clk_src[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_vfe_clk_src_msm8937[] = {
+	F(50000000, P_GPLL0, 16, 0, 0),
+	F(80000000, P_GPLL0, 10, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
+	F(133333333, P_GPLL0, 6, 0, 0),
+	F(160000000, P_GPLL0, 5, 0, 0),
+	F(177777778, P_GPLL0, 4.5, 0, 0),
+	F(200000000, P_GPLL0, 4, 0, 0),
+	F(266666667, P_GPLL0, 3, 0, 0),
+	F(308571428, P_GPLL6, 3.5, 0, 0),
+	F(320000000, P_GPLL0, 2.5, 0, 0),
+	F(360000000, P_GPLL6, 3, 0, 0),
+	F(400000000, P_GPLL0, 2, 0, 0),
+	F(432000000, P_GPLL6, 2.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 vfe0_clk_src = {
 	.cmd_rcgr = 0x58000,
 	.hid_width = 5,
@@ -1269,6 +1465,24 @@ static struct clk_branch gcc_blsp2_ahb_clk = {
 	}
 };
 
+static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
+	.halt_reg = 0x02008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 	.halt_reg = 0x03010,
 	.halt_check = BRANCH_HALT,
@@ -1377,6 +1591,42 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 	}
 };
 
+static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
+	.halt_reg = 0x18020,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x18020,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp2_qup4_i2c_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup4_i2c_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
+static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
+	.halt_reg = 0x02004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x02004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp1_qup1_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 	.halt_reg = 0x0300c,
 	.halt_check = BRANCH_HALT,
@@ -1485,6 +1735,24 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 	}
 };
 
+static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
+	.halt_reg = 0x1801c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1801c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_blsp2_qup4_spi_apps_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp2_qup4_spi_apps_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 	.halt_reg = 0x0203c,
 	.halt_check = BRANCH_HALT,
@@ -2521,6 +2789,24 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 	}
 };
 
+static struct clk_branch gcc_mdss_byte1_clk = {
+	.halt_reg = 0x4d0a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d0a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_byte1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&byte1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_esc0_clk = {
 	.halt_reg = 0x4d098,
 	.halt_check = BRANCH_HALT,
@@ -2539,6 +2825,24 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 	}
 };
 
+static struct clk_branch gcc_mdss_esc1_clk = {
+	.halt_reg = 0x4d09c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d09c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_esc1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&esc1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_mdp_clk = {
 	.halt_reg = 0x4d088,
 	.halt_check = BRANCH_HALT,
@@ -2575,6 +2879,24 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 	}
 };
 
+static struct clk_branch gcc_mdss_pclk1_clk = {
+	.halt_reg = 0x4d0a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4d0a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mdss_pclk1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_mdss_vsync_clk = {
 	.halt_reg = 0x4d090,
 	.halt_check = BRANCH_HALT,
@@ -2632,6 +2954,24 @@ static struct clk_branch gcc_oxili_ahb_clk = {
 	}
 };
 
+static struct clk_branch gcc_oxili_aon_clk = {
+	.halt_reg = 0x5904c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5904c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_oxili_aon_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+			.flags = CLK_SET_RATE_PARENT,
+		},
+	},
+};
+
 static struct clk_branch gcc_oxili_gfx3d_clk = {
 	.halt_reg = 0x59020,
 	.halt_check = BRANCH_HALT,
@@ -2650,6 +2990,19 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
 	}
 };
 
+static struct clk_branch gcc_oxili_timer_clk = {
+	.halt_reg = 0x59040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x59040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_oxili_timer_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_pdm2_clk = {
 	.halt_reg = 0x4400c,
 	.halt_check = BRANCH_HALT,
@@ -3027,6 +3380,28 @@ static struct gdsc oxili_gx_gdsc = {
 	.flags = CLAMP_IO,
 };
 
+static struct gdsc oxili_gx_gdsc_msm8937 = {
+	.gdscr = 0x5901c,
+	.clamp_io_ctrl = 0x5b00c,
+	.cxcs = (unsigned int []){ 0x59000 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "oxili_gx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = CLAMP_IO,
+};
+
+static struct gdsc oxili_cx_gdsc = {
+	.gdscr = 0x59044,
+	.cxcs = (unsigned int []){ 0x59020 },
+	.cxc_count = 1,
+	.pd = {
+		.name = "oxili_cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
 static struct gdsc cpp_gdsc = {
 	.gdscr = 0x58078,
 	.cxcs = (unsigned int []){ 0x5803c, 0x58064 },
@@ -3207,6 +3582,188 @@ static struct clk_regmap *gcc_msm8917_clocks[] = {
 	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
 };
 
+static struct clk_regmap *gcc_msm8937_clocks[] = {
+	[GPLL0] = &gpll0.clkr,
+	[GPLL0_EARLY] = &gpll0_early.clkr,
+	[GPLL0_SLEEP_CLK_SRC] = &gpll0_sleep_clk_src.clkr,
+	[GPLL3] = &gpll3.clkr,
+	[GPLL3_EARLY] = &gpll3_early.clkr,
+	[GPLL4] = &gpll4.clkr,
+	[GPLL4_EARLY] = &gpll4_early.clkr,
+	[GPLL6] = &gpll6,
+	[GPLL6_EARLY] = &gpll6_early.clkr,
+	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
+	[MSM8937_BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
+	[MSM8937_BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,
+	[BLSP1_QUP2_I2C_APPS_CLK_SRC] = &blsp1_qup2_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP2_SPI_APPS_CLK_SRC] = &blsp1_qup2_spi_apps_clk_src.clkr,
+	[BLSP1_QUP3_I2C_APPS_CLK_SRC] = &blsp1_qup3_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP3_SPI_APPS_CLK_SRC] = &blsp1_qup3_spi_apps_clk_src.clkr,
+	[BLSP1_QUP4_I2C_APPS_CLK_SRC] = &blsp1_qup4_i2c_apps_clk_src.clkr,
+	[BLSP1_QUP4_SPI_APPS_CLK_SRC] = &blsp1_qup4_spi_apps_clk_src.clkr,
+	[BLSP1_UART1_APPS_CLK_SRC] = &blsp1_uart1_apps_clk_src.clkr,
+	[BLSP1_UART2_APPS_CLK_SRC] = &blsp1_uart2_apps_clk_src.clkr,
+	[BLSP2_QUP1_I2C_APPS_CLK_SRC] = &blsp2_qup1_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP1_SPI_APPS_CLK_SRC] = &blsp2_qup1_spi_apps_clk_src.clkr,
+	[BLSP2_QUP2_I2C_APPS_CLK_SRC] = &blsp2_qup2_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP2_SPI_APPS_CLK_SRC] = &blsp2_qup2_spi_apps_clk_src.clkr,
+	[BLSP2_QUP3_I2C_APPS_CLK_SRC] = &blsp2_qup3_i2c_apps_clk_src.clkr,
+	[BLSP2_QUP3_SPI_APPS_CLK_SRC] = &blsp2_qup3_spi_apps_clk_src.clkr,
+	[MSM8937_BLSP2_QUP4_I2C_APPS_CLK_SRC] = &blsp2_qup4_i2c_apps_clk_src.clkr,
+	[MSM8937_BLSP2_QUP4_SPI_APPS_CLK_SRC] = &blsp2_qup4_spi_apps_clk_src.clkr,
+	[BLSP2_UART1_APPS_CLK_SRC] = &blsp2_uart1_apps_clk_src.clkr,
+	[BLSP2_UART2_APPS_CLK_SRC] = &blsp2_uart2_apps_clk_src.clkr,
+	[BYTE0_CLK_SRC] = &byte0_clk_src.clkr,
+	[MSM8937_BYTE1_CLK_SRC] = &byte1_clk_src.clkr,
+	[CAMSS_GP0_CLK_SRC] = &camss_gp0_clk_src.clkr,
+	[CAMSS_GP1_CLK_SRC] = &camss_gp1_clk_src.clkr,
+	[CAMSS_TOP_AHB_CLK_SRC] = &camss_top_ahb_clk_src.clkr,
+	[CCI_CLK_SRC] = &cci_clk_src.clkr,
+	[CPP_CLK_SRC] = &cpp_clk_src.clkr,
+	[CRYPTO_CLK_SRC] = &crypto_clk_src.clkr,
+	[CSI0PHYTIMER_CLK_SRC] = &csi0phytimer_clk_src.clkr,
+	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
+	[CSI1PHYTIMER_CLK_SRC] = &csi1phytimer_clk_src.clkr,
+	[CSI1_CLK_SRC] = &csi1_clk_src.clkr,
+	[CSI2_CLK_SRC] = &csi2_clk_src.clkr,
+	[ESC0_CLK_SRC] = &esc0_clk_src.clkr,
+	[MSM8937_ESC1_CLK_SRC] = &esc1_clk_src.clkr,
+	[GFX3D_CLK_SRC] = &gfx3d_clk_src.clkr,
+	[GP1_CLK_SRC] = &gp1_clk_src.clkr,
+	[GP2_CLK_SRC] = &gp2_clk_src.clkr,
+	[GP3_CLK_SRC] = &gp3_clk_src.clkr,
+	[JPEG0_CLK_SRC] = &jpeg0_clk_src.clkr,
+	[MCLK0_CLK_SRC] = &mclk0_clk_src.clkr,
+	[MCLK1_CLK_SRC] = &mclk1_clk_src.clkr,
+	[MCLK2_CLK_SRC] = &mclk2_clk_src.clkr,
+	[MDP_CLK_SRC] = &mdp_clk_src.clkr,
+	[PCLK0_CLK_SRC] = &pclk0_clk_src.clkr,
+	[MSM8937_PCLK1_CLK_SRC] = &pclk1_clk_src.clkr,
+	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
+	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
+	[SDCC1_ICE_CORE_CLK_SRC] = &sdcc1_ice_core_clk_src.clkr,
+	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
+	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
+	[VCODEC0_CLK_SRC] = &vcodec0_clk_src.clkr,
+	[VFE0_CLK_SRC] = &vfe0_clk_src.clkr,
+	[VFE1_CLK_SRC] = &vfe1_clk_src.clkr,
+	[VSYNC_CLK_SRC] = &vsync_clk_src.clkr,
+	[GCC_APSS_TCU_CLK] = &gcc_apss_tcu_clk.clkr,
+	[GCC_BIMC_GFX_CLK] = &gcc_bimc_gfx_clk.clkr,
+	[GCC_BIMC_GPU_CLK] = &gcc_bimc_gpu_clk.clkr,
+	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
+	[MSM8937_GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
+	[MSM8937_GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_I2C_APPS_CLK] = &gcc_blsp1_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP3_SPI_APPS_CLK] = &gcc_blsp1_qup3_spi_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_I2C_APPS_CLK] = &gcc_blsp1_qup4_i2c_apps_clk.clkr,
+	[GCC_BLSP1_QUP4_SPI_APPS_CLK] = &gcc_blsp1_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP1_UART1_APPS_CLK] = &gcc_blsp1_uart1_apps_clk.clkr,
+	[GCC_BLSP1_UART2_APPS_CLK] = &gcc_blsp1_uart2_apps_clk.clkr,
+	[GCC_BLSP2_AHB_CLK] = &gcc_blsp2_ahb_clk.clkr,
+	[GCC_BLSP2_QUP1_I2C_APPS_CLK] = &gcc_blsp2_qup1_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP1_SPI_APPS_CLK] = &gcc_blsp2_qup1_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_I2C_APPS_CLK] = &gcc_blsp2_qup2_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP2_SPI_APPS_CLK] = &gcc_blsp2_qup2_spi_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_I2C_APPS_CLK] = &gcc_blsp2_qup3_i2c_apps_clk.clkr,
+	[GCC_BLSP2_QUP3_SPI_APPS_CLK] = &gcc_blsp2_qup3_spi_apps_clk.clkr,
+	[MSM8937_GCC_BLSP2_QUP4_I2C_APPS_CLK] = &gcc_blsp2_qup4_i2c_apps_clk.clkr,
+	[MSM8937_GCC_BLSP2_QUP4_SPI_APPS_CLK] = &gcc_blsp2_qup4_spi_apps_clk.clkr,
+	[GCC_BLSP2_UART1_APPS_CLK] = &gcc_blsp2_uart1_apps_clk.clkr,
+	[GCC_BLSP2_UART2_APPS_CLK] = &gcc_blsp2_uart2_apps_clk.clkr,
+	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
+	[GCC_CAMSS_AHB_CLK] = &gcc_camss_ahb_clk.clkr,
+	[GCC_CAMSS_CCI_AHB_CLK] = &gcc_camss_cci_ahb_clk.clkr,
+	[GCC_CAMSS_CCI_CLK] = &gcc_camss_cci_clk.clkr,
+	[GCC_CAMSS_CPP_AHB_CLK] = &gcc_camss_cpp_ahb_clk.clkr,
+	[GCC_CAMSS_CPP_CLK] = &gcc_camss_cpp_clk.clkr,
+	[GCC_CAMSS_CSI0PHYTIMER_CLK] = &gcc_camss_csi0phytimer_clk.clkr,
+	[GCC_CAMSS_CSI0PHY_CLK] = &gcc_camss_csi0phy_clk.clkr,
+	[GCC_CAMSS_CSI0PIX_CLK] = &gcc_camss_csi0pix_clk.clkr,
+	[GCC_CAMSS_CSI0RDI_CLK] = &gcc_camss_csi0rdi_clk.clkr,
+	[GCC_CAMSS_CSI0_AHB_CLK] = &gcc_camss_csi0_ahb_clk.clkr,
+	[GCC_CAMSS_CSI0_CLK] = &gcc_camss_csi0_clk.clkr,
+	[GCC_CAMSS_CSI1PHYTIMER_CLK] = &gcc_camss_csi1phytimer_clk.clkr,
+	[GCC_CAMSS_CSI1PHY_CLK] = &gcc_camss_csi1phy_clk.clkr,
+	[GCC_CAMSS_CSI1PIX_CLK] = &gcc_camss_csi1pix_clk.clkr,
+	[GCC_CAMSS_CSI1RDI_CLK] = &gcc_camss_csi1rdi_clk.clkr,
+	[GCC_CAMSS_CSI1_AHB_CLK] = &gcc_camss_csi1_ahb_clk.clkr,
+	[GCC_CAMSS_CSI1_CLK] = &gcc_camss_csi1_clk.clkr,
+	[GCC_CAMSS_CSI2PHY_CLK] = &gcc_camss_csi2phy_clk.clkr,
+	[GCC_CAMSS_CSI2PIX_CLK] = &gcc_camss_csi2pix_clk.clkr,
+	[GCC_CAMSS_CSI2RDI_CLK] = &gcc_camss_csi2rdi_clk.clkr,
+	[GCC_CAMSS_CSI2_AHB_CLK] = &gcc_camss_csi2_ahb_clk.clkr,
+	[GCC_CAMSS_CSI2_CLK] = &gcc_camss_csi2_clk.clkr,
+	[GCC_CAMSS_CSI_VFE0_CLK] = &gcc_camss_csi_vfe0_clk.clkr,
+	[GCC_CAMSS_CSI_VFE1_CLK] = &gcc_camss_csi_vfe1_clk.clkr,
+	[GCC_CAMSS_GP0_CLK] = &gcc_camss_gp0_clk.clkr,
+	[GCC_CAMSS_GP1_CLK] = &gcc_camss_gp1_clk.clkr,
+	[GCC_CAMSS_ISPIF_AHB_CLK] = &gcc_camss_ispif_ahb_clk.clkr,
+	[GCC_CAMSS_JPEG0_CLK] = &gcc_camss_jpeg0_clk.clkr,
+	[GCC_CAMSS_JPEG_AHB_CLK] = &gcc_camss_jpeg_ahb_clk.clkr,
+	[GCC_CAMSS_JPEG_AXI_CLK] = &gcc_camss_jpeg_axi_clk.clkr,
+	[GCC_CAMSS_MCLK0_CLK] = &gcc_camss_mclk0_clk.clkr,
+	[GCC_CAMSS_MCLK1_CLK] = &gcc_camss_mclk1_clk.clkr,
+	[GCC_CAMSS_MCLK2_CLK] = &gcc_camss_mclk2_clk.clkr,
+	[GCC_CAMSS_MICRO_AHB_CLK] = &gcc_camss_micro_ahb_clk.clkr,
+	[GCC_CAMSS_TOP_AHB_CLK] = &gcc_camss_top_ahb_clk.clkr,
+	[GCC_CAMSS_VFE0_AHB_CLK] = &gcc_camss_vfe0_ahb_clk.clkr,
+	[GCC_CAMSS_VFE0_AXI_CLK] = &gcc_camss_vfe0_axi_clk.clkr,
+	[GCC_CAMSS_VFE0_CLK] = &gcc_camss_vfe0_clk.clkr,
+	[GCC_CAMSS_VFE1_AHB_CLK] = &gcc_camss_vfe1_ahb_clk.clkr,
+	[GCC_CAMSS_VFE1_AXI_CLK] = &gcc_camss_vfe1_axi_clk.clkr,
+	[GCC_CAMSS_VFE1_CLK] = &gcc_camss_vfe1_clk.clkr,
+	[GCC_CPP_TBU_CLK] = &gcc_cpp_tbu_clk.clkr,
+	[GCC_CRYPTO_AHB_CLK] = &gcc_crypto_ahb_clk.clkr,
+	[GCC_CRYPTO_AXI_CLK] = &gcc_crypto_axi_clk.clkr,
+	[GCC_CRYPTO_CLK] = &gcc_crypto_clk.clkr,
+	[GCC_DCC_CLK] = &gcc_dcc_clk.clkr,
+	[GCC_GP1_CLK] = &gcc_gp1_clk.clkr,
+	[GCC_GP2_CLK] = &gcc_gp2_clk.clkr,
+	[GCC_GP3_CLK] = &gcc_gp3_clk.clkr,
+	[GCC_JPEG_TBU_CLK] = &gcc_jpeg_tbu_clk.clkr,
+	[GCC_MDP_TBU_CLK] = &gcc_mdp_tbu_clk.clkr,
+	[GCC_MDSS_AHB_CLK] = &gcc_mdss_ahb_clk.clkr,
+	[GCC_MDSS_AXI_CLK] = &gcc_mdss_axi_clk.clkr,
+	[GCC_MDSS_BYTE0_CLK] = &gcc_mdss_byte0_clk.clkr,
+	[MSM8937_GCC_MDSS_BYTE1_CLK] = &gcc_mdss_byte1_clk.clkr,
+	[GCC_MDSS_ESC0_CLK] = &gcc_mdss_esc0_clk.clkr,
+	[MSM8937_GCC_MDSS_ESC1_CLK] = &gcc_mdss_esc1_clk.clkr,
+	[GCC_MDSS_MDP_CLK] = &gcc_mdss_mdp_clk.clkr,
+	[GCC_MDSS_PCLK0_CLK] = &gcc_mdss_pclk0_clk.clkr,
+	[MSM8937_GCC_MDSS_PCLK1_CLK] = &gcc_mdss_pclk1_clk.clkr,
+	[GCC_MDSS_VSYNC_CLK] = &gcc_mdss_vsync_clk.clkr,
+	[GCC_MSS_CFG_AHB_CLK] = &gcc_mss_cfg_ahb_clk.clkr,
+	[GCC_MSS_Q6_BIMC_AXI_CLK] = &gcc_mss_q6_bimc_axi_clk.clkr,
+	[GCC_OXILI_AHB_CLK] = &gcc_oxili_ahb_clk.clkr,
+	[MSM8937_GCC_OXILI_AON_CLK] = &gcc_oxili_aon_clk.clkr,
+	[GCC_OXILI_GFX3D_CLK] = &gcc_oxili_gfx3d_clk.clkr,
+	[MSM8937_GCC_OXILI_TIMER_CLK] = &gcc_oxili_timer_clk.clkr,
+	[GCC_PDM2_CLK] = &gcc_pdm2_clk.clkr,
+	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
+	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
+	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
+	[GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
+	[GCC_SDCC1_APPS_CLK] = &gcc_sdcc1_apps_clk.clkr,
+	[GCC_SDCC1_ICE_CORE_CLK] = &gcc_sdcc1_ice_core_clk.clkr,
+	[GCC_SDCC2_AHB_CLK] = &gcc_sdcc2_ahb_clk.clkr,
+	[GCC_SDCC2_APPS_CLK] = &gcc_sdcc2_apps_clk.clkr,
+	[GCC_SMMU_CFG_CLK] = &gcc_smmu_cfg_clk.clkr,
+	[GCC_USB2A_PHY_SLEEP_CLK] = &gcc_usb2a_phy_sleep_clk.clkr,
+	[GCC_USB_HS_AHB_CLK] = &gcc_usb_hs_ahb_clk.clkr,
+	[GCC_USB_HS_PHY_CFG_AHB_CLK] = &gcc_usb_hs_phy_cfg_ahb_clk.clkr,
+	[GCC_USB_HS_SYSTEM_CLK] = &gcc_usb_hs_system_clk.clkr,
+	[GCC_VENUS0_AHB_CLK] = &gcc_venus0_ahb_clk.clkr,
+	[GCC_VENUS0_AXI_CLK] = &gcc_venus0_axi_clk.clkr,
+	[GCC_VENUS0_CORE0_VCODEC0_CLK] = &gcc_venus0_core0_vcodec0_clk.clkr,
+	[GCC_VENUS0_VCODEC0_CLK] = &gcc_venus0_vcodec0_clk.clkr,
+	[GCC_VENUS_TBU_CLK] = &gcc_venus_tbu_clk.clkr,
+	[GCC_VFE1_TBU_CLK] = &gcc_vfe1_tbu_clk.clkr,
+	[GCC_VFE_TBU_CLK] = &gcc_vfe_tbu_clk.clkr,
+};
+
 static const struct qcom_reset_map gcc_msm8917_resets[] = {
 	[GCC_CAMSS_MICRO_BCR]		= { 0x56008 },
 	[GCC_MSS_BCR]			= { 0x71000 },
@@ -3234,6 +3791,18 @@ static struct gdsc *gcc_msm8917_gdscs[] = {
 	[VFE1_GDSC] = &vfe1_gdsc,
 };
 
+static struct gdsc *gcc_msm8937_gdscs[] = {
+	[CPP_GDSC] = &cpp_gdsc,
+	[JPEG_GDSC] = &jpeg_gdsc,
+	[MDSS_GDSC] = &mdss_gdsc,
+	[OXILI_GX_GDSC] = &oxili_gx_gdsc_msm8937,
+	[MSM8937_OXILI_CX_GDSC] = &oxili_cx_gdsc,
+	[VENUS_CORE0_GDSC] = &venus_core0_gdsc,
+	[VENUS_GDSC] = &venus_gdsc,
+	[VFE0_GDSC] = &vfe0_gdsc,
+	[VFE1_GDSC] = &vfe1_gdsc,
+};
+
 static const struct qcom_cc_desc gcc_msm8917_desc = {
 	.config = &gcc_msm8917_regmap_config,
 	.clks = gcc_msm8917_clocks,
@@ -3254,6 +3823,41 @@ static const struct qcom_cc_desc gcc_qm215_desc = {
 	.num_gdscs = ARRAY_SIZE(gcc_msm8917_gdscs),
 };
 
+static const struct qcom_cc_desc gcc_msm8937_desc = {
+	.config = &gcc_msm8917_regmap_config,
+	.clks = gcc_msm8937_clocks,
+	.num_clks = ARRAY_SIZE(gcc_msm8937_clocks),
+	.resets = gcc_msm8917_resets,
+	.num_resets = ARRAY_SIZE(gcc_msm8917_resets),
+	.gdscs = gcc_msm8937_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_msm8937_gdscs),
+};
+
+static void msm8937_clock_override(void)
+{
+	/* GPLL3 750MHz configuration */
+	gpll3_early_config.l = 47;
+	gpll3_early.vco_table = gpll3_p_vco_msm8937;
+	gpll3_early.num_vco = ARRAY_SIZE(gpll3_p_vco_msm8937);
+
+	/*
+	 * Set below clocks for use specific msm8937 parent map.
+	 */
+	vcodec0_clk_src.parent_map = gcc_cpp_map;
+	vcodec0_clk_src.clkr.hw.init = &vcodec0_clk_src_init_msm8937;
+
+	/*
+	 * Set below clocks for use specific msm8937 freq table.
+	 */
+	vfe0_clk_src.freq_tbl = ftbl_vfe_clk_src_msm8937;
+	vfe1_clk_src.freq_tbl = ftbl_vfe_clk_src_msm8937;
+	cpp_clk_src.freq_tbl = ftbl_cpp_clk_src_msm8937;
+	vcodec0_clk_src.freq_tbl = ftbl_vcodec0_clk_src_msm8937;
+	csi0phytimer_clk_src.freq_tbl = ftbl_csi_phytimer_clk_src_msm8937;
+	csi1phytimer_clk_src.freq_tbl = ftbl_csi_phytimer_clk_src_msm8937;
+	usb_hs_system_clk_src.freq_tbl = ftbl_usb_hs_system_clk_src_msm8937;
+}
+
 static int gcc_msm8917_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
@@ -3261,8 +3865,12 @@ static int gcc_msm8917_probe(struct platform_device *pdev)
 
 	gcc_desc = of_device_get_match_data(&pdev->dev);
 
-	if (gcc_desc == &gcc_qm215_desc)
+	if (gcc_desc == &gcc_qm215_desc) {
 		gfx3d_clk_src.parent_map = gcc_gfx3d_map_qm215;
+	} else if (gcc_desc == &gcc_msm8937_desc) {
+		msm8937_clock_override();
+		gfx3d_clk_src.freq_tbl = ftbl_gfx3d_clk_src_msm8937;
+	}
 
 	regmap = qcom_cc_map(pdev, gcc_desc);
 	if (IS_ERR(regmap))
@@ -3276,6 +3884,7 @@ static int gcc_msm8917_probe(struct platform_device *pdev)
 static const struct of_device_id gcc_msm8917_match_table[] = {
 	{ .compatible = "qcom,gcc-msm8917", .data = &gcc_msm8917_desc },
 	{ .compatible = "qcom,gcc-qm215", .data = &gcc_qm215_desc },
+	{ .compatible = "qcom,gcc-msm8937", .data = &gcc_msm8937_desc },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gcc_msm8917_match_table);

-- 
2.51.0
