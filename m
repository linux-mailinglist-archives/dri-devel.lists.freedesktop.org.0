Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED927E6602
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8010E1EA;
	Thu,  9 Nov 2023 09:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4689E10E1ED
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:00:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so10231775e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 01:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699520421; x=1700125221; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
 b=EW1viKJm0spFqq9JamSlKEUd31ArQPWN3owqPDeNyK3uqTg9rqbCX7hTbfy8fN3s80
 tALH61HblKI9pIV4fhhKNfJLXaC1lhbr0ZQZ3uc/bYGiYFu6mFifPLOZxq4DxnRLRgKH
 mnG99EYi5NS4LYYTpHIPdrhs/DcLzM5uD8nRBHhfhRofuZQi9NORmyrz6xJp6RJYt4ik
 63kicL+C+uBkM0MpoLV7Mf4LkRVRx2j8RR1xndmy97x4OPLuDu1tFt9Xpfv3BOFKy7bW
 hJdtLynPDS+0C0c/QZlhG1kM0sJRnL6Lj2MN2TbRZzF7SdITFrs2N2W9Pv0q5BXgaCO3
 lUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699520421; x=1700125221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NufD4rIrXXVswDRLLGN1v8mzear6C88bLMu3144o0cg=;
 b=dekd0fBYZf8rExSMDQTHnICAIIJO6qMFzabFn9wV1ha321122dU9Od/dvW7jFIQNG9
 Ob1d2fKDADCRa3Bw/N4LFp+0Yd3DHIPE4O/SCXqF0i4Q6Uth5MAMGWjwMWHfXtZc3imt
 DrbaG4UCmDZ6dNfgZfYtUIBmRyi+MFb3e8skro2u/mJFU9e87THxM9kLd/czm15+7jMz
 WjbVeqO/R0lVzaWTV9F07tqqz1id5YZPssdA+iUFInHaXzyzMYoaRBqbZY1Ae5nWjbzL
 F84IayhZ2dxXjzfeBr75WTZ35jAespLwEelQ842tSab7UjeN4AwwWsh1LF3hbh5q9yAc
 iVmQ==
X-Gm-Message-State: AOJu0YzJL/wIYGFjs4s8jDP6vhX+jZnhh33xfdzMhoFuVkgy6i4a6WL8
 vyiOjfy3BMqbcR+Nl8RlX4bMEQ==
X-Google-Smtp-Source: AGHT+IGxSg1mr5xDwzqGjpnOTb8EnhbM3pbNiRU5Y/NFrQeBwQ2mIGRMQXdWeExekl2i8P6EQzzQLg==
X-Received: by 2002:a05:600c:c0c:b0:401:b425:2414 with SMTP id
 fm12-20020a05600c0c0c00b00401b4252414mr9733730wmb.18.1699520420735; 
 Thu, 09 Nov 2023 01:00:20 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:00:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:07 +0100
Subject: [PATCH v8 06/12] clk: meson: g12a: add CTS_ENCL & CTS_ENCL_SEL clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-6-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zJsrzxQnYGg+gnkYOtONfQmErbGuCQDfLn/cHrjnMZI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+XAu9aFd+uhj7htL8zXg0s1UYgLC9HzlrM/vb4
 7lZkuhuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflwAKCRB33NvayMhJ0U3HEA
 CdCArUDEZEXlIJe4yS07vvou6fhXSMQ4+VKD50M2Cpocdho1yVp9ljgu+juoADLrWaxgggx0GB0HTH
 HUVdkEg3LXGMIi3A2TfFN+c7PuG/XbssgQs2uT3CobUB0iXYxs4N5mIoUuXGv7npd++vHnUgcBHajb
 kr3OfFXiyizbVmwTUVnh385tnaxA6nuqml63JKc4Dji79cj7Rfm5qYwtAaiTYAFAajctkmFzZA4wBm
 eHhzLTTFm7/L64tSi0pLWFtNlHFkmJdQsBv73F2E6sLrnlh3y82CEYgyGs3a7juDZQz2tHr13ldPfp
 K0ZQn1m3i3O84j6ESpDbg2ACUXdj8VjOlTVCxgIuDLSU7et7KrRMkthobvNZldMj88dJG9aBWrDp1l
 29U/gqY/2IkEjzYb6ShdvDYxmCuiJDi9TKFV0HB+UWqno8dRILizN+Uz9Fc5k+kXkczn2Y20p70/r3
 qy1OX52Zvv6PX2m52IKcHUzBJxAfNLKbrkh75p9RBULC2R07t0FqgkUzaIbJuCanVjLhho/WBjep1u
 AIgEtL21blXgV3rvovIRyFwtioa1KL/Ft4iCq9xlNOBNZJBH311LTTPoxzPryMZIOa/JNtewQ3R0BS
 7/6UYmNTEGu2LYBw1znMHPDco9mcFduu9KVdb23siKUtffeZict4FLLxVfwA==
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

