Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6867F6EA6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 09:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4C10E7BF;
	Fri, 24 Nov 2023 08:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A75C10E7B0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 08:41:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so12150985e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 00:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700815292; x=1701420092; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
 b=KhH5sCz5gsIuIKQ3GhfIaxiWti4dfMu9j+DzEYLri6hBUXFh434Q78Z2FUCAlz4+z4
 FE5KNYiEy5Tz5U12bAD3n9fcLjIeonRyodk05Os/7Qtttwox5mwztqoEYujgdTTSxuNd
 XZAI35nSKLdKsrMxp4CowMjVtZGBhqqF1Td1yBlKJfnAbNeSWqua1fitFBbFJbOCx8aK
 oYJF7aHvSkGSerKYby9qZLTyJWYdbz66gFAir2iCjDmbAKcHpPeJbuvMp4E/3OGXpGNm
 W0aLCFRL3Q3W7v99ATZxeVhJixEczd7KfJUdQlFI+9OawYpoQLN1qGfUUVYcKfeM5bll
 mSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700815292; x=1701420092;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
 b=pV8mipeoJthhgl66ZKUrP5cynOw4le4yHCbfxxFuUuY8QS65Sbq4lUS3giuLfWSAgn
 Sbdg/Oto6RZW140c0KGu6CLTeEA64kHYKLgqMLkm8Ue2DDTRghZhr4hktJc8dtZ9/AsJ
 SxmxchHPp01nw/Czfq5TGLz/K0U4LQ7nzk6CVOW8sWgtqNEF+op+UoB6+y+2Qcs47frM
 tTQa43jVSNO3fxKyveblk13ACuJrHb5kv/xMngZzqWZUduAwF5+M/KsDeGGRT0x/hmGr
 U8yFwbEV+bHsSIq979Wbt35HQyQsKj3VykLW6WeV6penzZchXObDdKdZKzl18TD5ok26
 SdPg==
X-Gm-Message-State: AOJu0YwXEXCsU5g7PeZxYVM7FYRdwi9JpTNctVvXEzyQOj/RMikzTLZI
 TBnJyZ2HNgTZrIvRy+FZlDFdNw==
X-Google-Smtp-Source: AGHT+IEUvqbt1DC0+uUVhVOjCpWlb1bksQ3RH9iprckyOqtqXcIRgR+VEHZE3xWFIFmSj+o95DaHUQ==
X-Received: by 2002:a05:600c:1c81:b0:40b:3938:65fc with SMTP id
 k1-20020a05600c1c8100b0040b393865fcmr1676370wms.4.1700815292199; 
 Fri, 24 Nov 2023 00:41:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 00:41:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:17 +0100
Subject: [PATCH v9 06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-6-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zJsrzxQnYGg+gnkYOtONfQmErbGuCQDfLn/cHrjnMZI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGw1r3vVBeENP9OV0j71X8URZHXlJ+d/mBHQQda
 /IzcQvaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsAAKCRB33NvayMhJ0QTzD/
 4vRZ2aynVoS5fO5ARDE67DKlHGKuGgLC9GXQRtRgIUs3Mu+COUAIcaRtlW6kEVlJCYprA696aSv17H
 4HeQfr7gr42wp4r5752yquCQmT3szcXqLGJXPhyrZIlSm7UzyO+ZAkUVsQgilHpsqdBySdzYs2+OZf
 VnpNmODCpfZL8yRrbw5MFpWNu+cK6btltj1HbZ5i1mIO4gcPh59BmyDsA3MNjGnDDYJs5J9B/+Z55P
 rhnZV6IJYrHKDfXS2TfvlsrBdq7zbCutti5zW2ZodDX97FPXqiLtw9fGTU1CNL9veh5UH1izbk3c33
 EoL61SPGIFeX87mCtHhD6TBpaT0q3l14gfZMb9uLuAUoZIrL3zHmYK8CkZSaKobiIllK3pwXTeAT+8
 8JK/6AywyrQOKX17wq9vbVhYaZFDA7I0N5CL8mfNVv7qv1kBjgNa5mjjs9whc0QJ7fY8YGFhB3+BmP
 39NCJ4KwJaNC/DRbjSsHKaKUIaBmM/ysxcZ5Qq5QUcVzxCieZudSZNjjRmzhayMI2BfezwFpseU+nz
 NMDusiOD4vRwgOCwgLnSSILP/d7eF89rrFWvFakLyrhqdIaKsEaZKEHEVJTqUQmSuTJ/A/tdHwhNyX
 w4J61IQKvEPtgC4tNemh+iKu/uI4xTU2o+PO7pB4QBxmQ0TtV19P4BwInebw==
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
 linux-phy@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new CTS_ENCL & CTS_ENCL_SEL clocks for the G12A compatible
SoCs, they are used to feed the VPU LCD Pixel encoder used for
DSI display purposes.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index f373a8d48b1d..cadd824336ad 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3549,6 +3549,22 @@ static struct clk_regmap g12a_cts_encp_sel = {
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
@@ -3628,6 +3644,22 @@ static struct clk_regmap g12a_cts_encp = {
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
@@ -4407,10 +4439,12 @@ static struct clk_hw *g12a_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4632,10 +4666,12 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -4892,10 +4928,12 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_VCLK2_DIV12]		= &g12a_vclk2_div12.hw,
 	[CLKID_CTS_ENCI_SEL]		= &g12a_cts_enci_sel.hw,
 	[CLKID_CTS_ENCP_SEL]		= &g12a_cts_encp_sel.hw,
+	[CLKID_CTS_ENCL_SEL]		= &g12a_cts_encl_sel.hw,
 	[CLKID_CTS_VDAC_SEL]		= &g12a_cts_vdac_sel.hw,
 	[CLKID_HDMI_TX_SEL]		= &g12a_hdmi_tx_sel.hw,
 	[CLKID_CTS_ENCI]		= &g12a_cts_enci.hw,
 	[CLKID_CTS_ENCP]		= &g12a_cts_encp.hw,
+	[CLKID_CTS_ENCL]		= &g12a_cts_encl.hw,
 	[CLKID_CTS_VDAC]		= &g12a_cts_vdac.hw,
 	[CLKID_HDMI_TX]			= &g12a_hdmi_tx.hw,
 	[CLKID_HDMI_SEL]		= &g12a_hdmi_sel.hw,
@@ -5123,10 +5161,12 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
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

-- 
2.34.1

