Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBCE7008B4
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B960610E69D;
	Fri, 12 May 2023 13:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3799810E69D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:11:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3078c092056so4907292f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897115; x=1686489115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vxRcviaE6R0pdI5hk3Pe3Bt1xVG5YfiiMZ7npzY4iJE=;
 b=j6hIGvp4NhHgeXLqQeXATQgzmYknWS9RVtQJWtj8vd3difrD/ry3UAOGwHHK55OgsJ
 TqQzzfIBz7BwssDYJWX+KndkADVZvCBMc1bqTCq5u+eXqfQApKfTwsqeklvyd8RXAoeb
 mOdEX6s3Z0FIksi6Ejl9+8gIgrkPQ2O+uTQmeMuNpdWrER3MJHbQtUyE7mrVsOTRcJVm
 h4FOVOc6c+lwWTdTRjRVAHIWp7Z1hen53rNZLZgtIV/t80YPcJB/64rmd6u9ubj9dWCh
 NUXK4mQZqUI9Jd1jIW71XxA6Z/A2DmTDLoFj0IhKUkfv95cGErCq1I6UQbiDEi/QMYCW
 Aeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897115; x=1686489115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxRcviaE6R0pdI5hk3Pe3Bt1xVG5YfiiMZ7npzY4iJE=;
 b=a/CqZLr1NjNR2zXmGE0sNrZJPkfaunsO8IYwYbhCP2/A4CBszQjxoX9md27lChxu/m
 NJIFYpnqLUbNdLac8urxNPiYfltEOC0Y82m/Nw9qUETrjczKwdAnkN1+mVIsDjuyUvvW
 KfSnlapvhwcdSN3wb92egLaeMlmRVpzcE7KknO7Z2NqVPTs6mboKltefITpfDrFTQEMr
 6uNlNZxNepMWGpbDsM138xhBGGi11BM4XAO0bgfydg0Wz8+w75ScH+ABHLqxm/D/7h1C
 85Dz4yflmwokx4xpaq7vsRbzIyQCBVhfb/LWWDzD1NMJHfuJRsy1DgTl8pHo45/w3Xbq
 0YgA==
X-Gm-Message-State: AC+VfDx+/iFTyDQcgwmlg4wHlzYJMFP0w12IycG7Rx4KIJ0TDxm/BXs4
 npMXL/AbtcqWXAq895eV7mddcw==
X-Google-Smtp-Source: ACHHUZ6LgnNd0fqFNErcnRuUz3xQIgjEAWegQmGYWTXd6VjmXWlYzs61ALh5Mk93lgxtvciGFeIfNw==
X-Received: by 2002:adf:f142:0:b0:306:3435:f85c with SMTP id
 y2-20020adff142000000b003063435f85cmr16778628wro.30.1683897115079; 
 Fri, 12 May 2023 06:11:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:33 +0200
Subject: [PATCH v4 02/13] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-2-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4549;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=iIgA0y1H5o2Wto1ffhy2Nb88xLAE/N+ajqdymO+oQ0E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsSQvvJGGh9p5FgUTPEH4HM0GWsvsYdF3WiSmrt
 iA0IBn+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EgAKCRB33NvayMhJ0c9QD/
 9uzic1mYXkBarHyol2JLplrtOEqXu6WpBbAClnA77sVvgCyh580OAcA5QQpptLYQ6xgjMeB8sqh/Nu
 FstX2LxbCie3VDEBBav3RNuvf/LZDzw02BWa0lq8yEEcHZOEguXhqpzEp2KnToP5077ohB6Xq1qdQ4
 jYZEetE3C8bGzcjNdyzw6TnjSOr5b2A/ySVp0PDJKdFERd8Lqmg066Pvk1nfk+iPQmqPiCuASf3ZOQ
 0KpXQXbE/WY5fdnAlDIsAMKT8gXwouR+Pd8HmionyOYk3oH4krHkdTi8L08NYm9qwxaCXji6OEsBrd
 UWbAK3u7zr3dO6CfRvsbZCnvOfBarCysiIDeNV8gjvuZfM3Pry4LW/NrezFzgFwxHuDzsZhhWjBFpu
 7nyWY2A4EGelOVig2IwkDcVHJ9WifgBhqgsuPL/VK1rksAPxWBBZ++dER8YH0aHxx/6aWCqmrElNUC
 ppklfS8TaS7DB3h3u1QLAjQfngZpD9ER32N+45ikmeOmu7NGaTop/v/lO0pIZM2t5XaruQWkCmmHZW
 j49UpbxFSQzMgCso/UNZzzrT1lm3y0liQ3upkou1wa96UePlvAJpzEAEu+qVAgohpW6waJXdz1kTKO
 Mc7oBUrcnBuDkz6X5Gh8LD5bNWY0CtvzYL1B7gk33wWCfwO1vFaZnElBO20g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicolas Belin <nbelin@baylibre.com>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  2 +-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 310accf94830..0b4fe88d3108 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3547,6 +3547,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_VIID_CLK_DIV,
+		.mask = 0xf,
+		.shift = 12,
+		.table = mux_table_cts_sel,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_encl_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = g12a_cts_parent_hws,
+		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -3626,6 +3642,22 @@ static struct clk_regmap g12a_cts_encp = {
 	},
 };
 
+static struct clk_regmap g12a_cts_encl = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_VID_CLK_CNTL2,
+		.bit_idx = 3,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_encl",
+		.ops = &clk_regmap_gate_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&g12a_cts_encl_sel.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+	},
+};
+
 static struct clk_regmap g12a_cts_vdac = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL2,
@@ -4406,10 +4438,12 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4635,10 +4669,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4899,10 +4935,12 @@ static struct clk_hw_onecell_data sm1_hw_onecell_data = {
 		[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 		[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 		[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+		[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 		[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 		[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 		[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 		[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+		[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 		[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 		[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 		[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -5133,10 +5171,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vclk2_div12_en,
 	&g12a_cts_enci_sel,
 	&g12a_cts_encp_sel,
+	&g12a_cts_encl_sel,
 	&g12a_cts_vdac_sel,
 	&g12a_hdmi_tx_sel,
 	&g12a_cts_enci,
 	&g12a_cts_encp,
+	&g12a_cts_encl,
 	&g12a_cts_vdac,
 	&g12a_hdmi_tx,
 	&g12a_hdmi_sel,
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 1a4a626c2c63..80fe5e4532a7 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -265,7 +265,7 @@
 #define CLKID_NNA_CORE_CLK_DIV			266
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 
-#define NR_CLKS					271
+#define NR_CLKS					273
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>

-- 
2.34.1

