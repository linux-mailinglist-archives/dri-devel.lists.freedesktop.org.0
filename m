Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373657008B9
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 15:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D73C10E6A3;
	Fri, 12 May 2023 13:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4968410E69F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 13:11:58 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315712406so321518025e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897116; x=1686489116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3VuIbCx20TTpR/DBboXFqn83DPCA6IHbWMkxzYqY/qU=;
 b=hEqBoLIYKMjSP5zaaA6cdtONtXwFXJG8Ff9NbZIJEsu25H4laCCB1KTX8Yw/v/UUZJ
 J/Ljv8bVlz1hQbo3egogT+hVHqIAJ4D60MGc7PPa0y3wHCItLuzRoYrcyhck9JBYDhnr
 ybZD+VJc9j/aQdFU1SyWjat21lR8ua2G52Y5KwOcjD1h5W+c2DzW8m5+yxBSZRDCP0HB
 8IiOKHx6YKAit1d1zVUYvA/7Q8j26/LaU2rzajml4yHHmjiDbstLGXF5MdH8I9kjaOHl
 cdHLi/O0+Uy13nnFrxbRcz/AysoXF2Cn3OgavIsTlHwzKC2h/OkP6Yn8TjAZiAXSOWtO
 UYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897116; x=1686489116;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3VuIbCx20TTpR/DBboXFqn83DPCA6IHbWMkxzYqY/qU=;
 b=Uc2w+VR4Az4xO3VyRakZCneLV7yCrdEdypnfpeob5u1aimT3sJxQeHPinH52MPPlEQ
 +1J+/22GWz1MJ38XDto9hFlYJJcp0uraLC54wbbzjArQlYsLyVOWDJulEqS1KnSW0+/o
 HLNrxOW6eUjjiWzq4UWkdtpxXoOERZd7RFQW8fZRf+GjubML90VAAbetNQt5eASdjlma
 JP+fFEYcGfYz10aT4g/vkvkGQKNq/65tFqnlX4Vd75ntelZ0E4UYNC2gPeOeY1X+5jhD
 8vfqT4PJ3chP21EWYB+DgzVSc1HtVYa7gVpUpG1dA5bCqZBm8Ih5rjtKJB5TsxCr16s1
 qz+Q==
X-Gm-Message-State: AC+VfDxehBUBCT8AaCLJfE/Kh/+DtAUrR00iLM+/b0cLMQZQ3Hysfso6
 ThGWcsLSBrqAGYbztCknPi+xPA==
X-Google-Smtp-Source: ACHHUZ6XIxerX9e765ivw8MdcoAdGgyTxj+QXrARCZ2MAkNv/aMJ0ed9SzUGsEDjWfhgTAwFk7hPBQ==
X-Received: by 2002:a05:6000:d0:b0:307:bb47:75de with SMTP id
 q16-20020a05600000d000b00307bb4775demr6374661wrx.26.1683897116216; 
 Fri, 12 May 2023 06:11:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 06:11:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:34 +0200
Subject: [PATCH v4 03/13] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-3-2592c29ea263@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9613;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W3WugYKLnj4mCF89oe7ieYFGmEpR6eGqhlqz6ewczZw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsTr3lyPdG9br9ZAKUgPwVwY3VqeA5VGyCqnYh3
 5oxck3GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47EwAKCRB33NvayMhJ0enmD/
 4zRSR4ccXkS+FjzBu+Tcl2YGvq2ZcccP8rIMQNo5E5oUpOnP2xeQDLyb5KJndw/3xjIk4sdtSFW0D9
 /Zjm2UVKmeb4qakW8R6YsA1Xt1eMwTYY2xTTbHxNJiT0jzdx4lQ9DnGcwnUaAmgdA0RyxH+uByxd5j
 S09zbkhEpbw+LIsPXlyWw8tQOdVMkwJw+WKumijTbnX53xqcx2Q0EjcwVLMDF5nG8NgjQIzGHJr9nj
 3Kb1FoCsgHGmpnJO6JHPJz0JqqONMJ3btHwIqKhL5Qq1YXPob++k98Wx3NhYgPZHtfPE/xWzN5oXfp
 TrtjOIKbXcgdwrSrqAk5cImMv80+9o2vu+gz4IbUN6n0VzKlQ2uyjuAIIL5+kFEt3fGTiKLYLi9viT
 EzlIiVMoZ0pGsSyEfqfIcGUJTQuHD1pr73yMWZI2u35YhOPlbyXx0E/byahPWycQKS7edtixzPunpW
 gCaLV/s95OEh1CsIPAN9iyIOWUDEzjgKvL1dpYfpvnHkTew2NUUJdymdesxe+SzfFpR+UzHvzfRvpd
 WlbEGGtcMlHfl2juVPe8Qbiedx+2TpJjvF7aPQ4w+5c2dgJi4vLdDTXQlcwA+J8y3sjdzm0J2CRPZv
 +g3/g9Me27HpOrnoDdZM9QDUisyb+PnwKeFwtMmoPD5n3Kls52iq1BoVcqLQ==
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

In order to setup the DSI clock, let's make the unused VCLK2 clock path
configuration via CCF.

The nocache option is removed from following clocks:
- vclk2_sel
- vclk2_input
- vclk2_div
- vclk2
- vclk_div1
- vclk2_div2_en
- vclk2_div4_en
- vclk2_div6_en
- vclk2_div12_en
- vclk2_div2
- vclk2_div4
- vclk2_div6
- vclk2_div12
- cts_encl_sel

The missing vclk2 reset sequence is handled via new clkc notifiers
in order to reset the vclk2 after each rate change as done by Amlogic
in the vendor implementation.

In order to set a rate on cts_encl via the vclk2 clock path,
the NO_REPARENT flag is set on cts_encl_sel & vclk2_sel in order
to keep CCF from selection a parent.
The parents of cts_encl_sel & vclk2_sel are expected to be defined
in DT.

The following clock scheme is to be used for DSI:

xtal
\_ gp0_pll_dco
   \_ gp0_pll
      |- vclk2_sel
      |  \_ vclk2_input
      |     \_ vclk2_div
      |        \_ vclk2
      |           \_ vclk2_div1
      |              \_ cts_encl_sel
      |                 \_ cts_encl	-> to VPU LCD Encoder
      |- mipi_dsi_pxclk_sel
      \_ mipi_dsi_pxclk_div
         \_ mipi_dsi_pxclk		-> to DSI controller

The mipi_dsi_pxclk_div is set as RO in order to use the same GP0
for mipi_dsi_pxclk and vclk2_input.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 131 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 120 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0b4fe88d3108..1142bd93b994 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3163,7 +3163,7 @@ static struct clk_regmap g12a_vclk2_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_vclk_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_vclk_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -3191,7 +3191,6 @@ static struct clk_regmap g12a_vclk2_input = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_sel.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 	},
 };
 
@@ -3212,6 +3211,40 @@ static struct clk_regmap g12a_vclk_div = {
 	},
 };
 
+struct g12a_vclk_div_notifier {
+	struct clk_regmap *clk;
+	unsigned int offset;
+	u8 en_bit_idx;
+	u8 reset_bit_idx;
+	struct notifier_block nb;
+};
+
+static int g12a_vclk_div_notifier_cb(struct notifier_block *nb,
+				  unsigned long event, void *data)
+{
+	struct g12a_vclk_div_notifier *nb_data =
+		container_of(nb, struct g12a_vclk_div_notifier, nb);
+
+	switch (event) {
+	case PRE_RATE_CHANGE:
+		/* disable and reset vclk2 divider */
+		regmap_update_bits(nb_data->clk->map, nb_data->offset,
+				   BIT(nb_data->en_bit_idx) |
+				   BIT(nb_data->reset_bit_idx),
+				   BIT(nb_data->reset_bit_idx));
+		return NOTIFY_OK;
+	case POST_RATE_CHANGE:
+		/* enabled and release reset */
+		regmap_update_bits(nb_data->clk->map, nb_data->offset,
+				   BIT(nb_data->en_bit_idx) |
+				   BIT(nb_data->reset_bit_idx),
+				   BIT(nb_data->en_bit_idx));
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	};
+};
+
 static struct clk_regmap g12a_vclk2_div = {
 	.data = &(struct clk_regmap_div_data){
 		.offset = HHI_VIID_CLK_DIV,
@@ -3225,10 +3258,18 @@ static struct clk_regmap g12a_vclk2_div = {
 			&g12a_vclk2_input.hw
 		},
 		.num_parents = 1,
-		.flags = CLK_GET_RATE_NOCACHE,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 };
 
+static struct g12a_vclk_div_notifier g12a_vclk2_div_data = {
+	.clk = &g12a_vclk2_div,
+	.offset = HHI_VIID_CLK_DIV,
+	.en_bit_idx = 16,
+	.reset_bit_idx = 17,
+	.nb.notifier_call = g12a_vclk_div_notifier_cb,
+};
+
 static struct clk_regmap g12a_vclk = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
@@ -3243,6 +3284,33 @@ static struct clk_regmap g12a_vclk = {
 	},
 };
 
+struct g12a_vclk_reset_notifier {
+	struct clk_regmap *clk;
+	unsigned int offset;
+	u8 bit_idx;
+	struct notifier_block nb;
+};
+
+static int g12a_vclk_notifier_cb(struct notifier_block *nb,
+				  unsigned long event, void *data)
+{
+	struct g12a_vclk_reset_notifier *nb_data =
+		container_of(nb, struct g12a_vclk_reset_notifier, nb);
+
+	switch (event) {
+	case POST_RATE_CHANGE:
+		/* reset vclk2 */
+		regmap_update_bits(nb_data->clk->map, nb_data->offset,
+				   BIT(nb_data->bit_idx), BIT(nb_data->bit_idx));
+		regmap_update_bits(nb_data->clk->map, nb_data->offset,
+				   BIT(nb_data->bit_idx), 0);
+
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	};
+}
+
 static struct clk_regmap g12a_vclk2 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VIID_CLK_CNTL,
@@ -3253,10 +3321,17 @@ static struct clk_regmap g12a_vclk2 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
+static struct g12a_vclk_reset_notifier g12a_vclk2_data = {
+	.clk = &g12a_vclk2,
+	.offset = HHI_VIID_CLK_CNTL,
+	.bit_idx = 15,
+	.nb.notifier_call = g12a_vclk_notifier_cb,
+};
+
 static struct clk_regmap g12a_vclk_div1 = {
 	.data = &(struct clk_regmap_gate_data){
 		.offset = HHI_VID_CLK_CNTL,
@@ -3337,7 +3412,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3351,7 +3426,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3365,7 +3440,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3379,7 +3454,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3393,7 +3468,7 @@ static struct clk_regmap g12a_vclk2_div12_en = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3459,6 +3534,7 @@ static struct clk_fixed_factor g12a_vclk2_div2 = {
 			&g12a_vclk2_div2_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3472,6 +3548,7 @@ static struct clk_fixed_factor g12a_vclk2_div4 = {
 			&g12a_vclk2_div4_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3485,6 +3562,7 @@ static struct clk_fixed_factor g12a_vclk2_div6 = {
 			&g12a_vclk2_div6_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3498,6 +3576,7 @@ static struct clk_fixed_factor g12a_vclk2_div12 = {
 			&g12a_vclk2_div12_en.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3559,7 +3638,7 @@ static struct clk_regmap g12a_cts_encl_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = g12a_cts_parent_hws,
 		.num_parents = ARRAY_SIZE(g12a_cts_parent_hws),
-		.flags = CLK_SET_RATE_NO_REPARENT | CLK_GET_RATE_NOCACHE,
+		.flags = CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -3727,7 +3806,7 @@ static struct clk_regmap g12a_mipi_dsi_pxclk_div = {
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "mipi_dsi_pxclk_div",
-		.ops = &clk_regmap_divider_ops,
+		.ops = &clk_regmap_divider_ro_ops,
 		.parent_hws = (const struct clk_hw *[]) {
 			&g12a_mipi_dsi_pxclk_sel.hw
 		},
@@ -5421,6 +5500,32 @@ static int meson_g12a_dvfs_setup(struct platform_device *pdev)
 	return 0;
 }
 
+static int meson_g12a_vclk_setup(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct clk *notifier_clk;
+	int ret;
+
+	/* Setup clock notifier for vclk2 */
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_vclk2.hw, DVFS_CON_ID);
+	ret = devm_clk_notifier_register(dev, notifier_clk, &g12a_vclk2_data.nb);
+	if (ret) {
+		dev_err(dev, "failed to register the vlkc2 notifier\n");
+		return ret;
+	}
+
+	/* Setup clock notifier for vclk2_div */
+	notifier_clk = devm_clk_hw_get_clk(dev, &g12a_vclk2_div.hw, DVFS_CON_ID);
+	ret = devm_clk_notifier_register(dev, notifier_clk,
+					 &g12a_vclk2_div_data.nb);
+	if (ret) {
+		dev_err(dev, "failed to register the vclk2_div notifier\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 struct meson_g12a_data {
 	const struct meson_eeclkc_data eeclkc_data;
 	int (*dvfs_setup)(struct platform_device *pdev);
@@ -5443,6 +5548,10 @@ static int meson_g12a_probe(struct platform_device *pdev)
 	g12a_data = container_of(eeclkc_data, struct meson_g12a_data,
 				 eeclkc_data);
 
+	ret = meson_g12a_vclk_setup(pdev);
+	if (ret)
+		return ret;
+
 	if (g12a_data->dvfs_setup)
 		return g12a_data->dvfs_setup(pdev);
 

-- 
2.34.1

