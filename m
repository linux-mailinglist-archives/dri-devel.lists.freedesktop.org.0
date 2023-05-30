Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A747156F2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51F10E356;
	Tue, 30 May 2023 07:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5336F10E353
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:38:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3094910b150so4109061f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432299; x=1688024299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=H9GrfKlBF3uVurPFmefbKJfWru3/7wSGOSyj3+jmqDo=;
 b=UdzwLLktPT1Q/eyMWmwifgCD93nYxk7PPN8Jiz93W9ynFgOxKdkXgj4myo5/nZlOU/
 US7Wn1CVLuutl1ynBYdjRJIJbPmd17TmvnEGvFlxZ6DEMEju8Qm6ivyAFj222zVdGPsw
 2/ZPkuRkubplqtcP1mRSuQGTj9PVolWUZgdpm/Ke4gFPy2X2L7upwWNcTmrTeUedjibf
 gkhBwb+7jdFNnzar+s5NWLcNpM/ltYG2Fumpa35P7YxIb7yC1A1Noe3KrTttSrkgdaW0
 wofq6NzXoH3IsUxJUCFsqyuHwVFF2deM7H+la/FO+/wtiBVkiKAjb1Rt4cr0KQvuc8fg
 ZhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432299; x=1688024299;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H9GrfKlBF3uVurPFmefbKJfWru3/7wSGOSyj3+jmqDo=;
 b=hiAKCxKG2O/xPM0JUF93IkEEVmfDmHtpnp2l/8TZoHfAk4JRs3eXg3PyrnEPzxS7Tf
 Lmn6KvFqUTnSHLmr1LwP41gI3vuedaWPKWa1NnoLKuGopVCWyWqdH8Q7riPV9rwU6Ldh
 0vCKEBBsKgIyD4zLJHwOsT5PkanmRMGWa0JusoNXAig7HFGz6chQfe/IeNXY2bp5g74d
 45QJy+EuL3Pehohg326M6bd8jo5QmGTdPEc4CwVNuvj7PoCsTPHU6/ZBsit8ZqcbDm5y
 zvHD3eoe4zs2m1ujpFr7VWJVo+YB/QG21He3QJ5LVEcZgop8T6EAFgXeVx1JCTDtZgvw
 szqQ==
X-Gm-Message-State: AC+VfDwG5aBqlidRyCS/6v+jr7hVdH7JjWG5MAbK4Ceab/1DT0HvAzzM
 hFwxlSw0Ddp7qMe8NetpJTQ0kw==
X-Google-Smtp-Source: ACHHUZ5dRdepA/BtldVErIZACdgyd20larUkGKwJdI4/szqglmDOT6UkPYJN5zi2Pe0BCYMfnJ2vCA==
X-Received: by 2002:adf:fc0a:0:b0:30a:e98c:419b with SMTP id
 i10-20020adffc0a000000b0030ae98c419bmr879956wrr.59.1685432299376; 
 Tue, 30 May 2023 00:38:19 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 00:38:19 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:06 +0200
Subject: [PATCH v5 05/17] clk: meson: g12a: make VCLK2 and ENCL clock path
 configurable by CCF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-5-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9613;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+XJ9aZ98iLsHwf0CobukwKNcpgF5lqURjM2mDz6q1H8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdaffMGvykLRpSPKfew1O10/x+UtE/mLcevN0AmHb
 tHRkNJyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn3wAKCRB33NvayMhJ0TdID/
 45+NwYoTriDcOi/kx1GdFiN8LlAc68BlWfDkBs3pNRf4YTxbycmwitdw4VzZpnJbvz/nrTM6rm9CSv
 cgNw51IFIS11DW9W0ZwBFZkmGWp9BarIYpxGzWHEraeLlUjtufIN8mLXs+NnwAVT64+9sklRUPnFRf
 27iyQpV0riaSiktb4w+ag77VyJ0QVuo/s/YhQvAm6M4wXt6/el5ePUag0Aom1ybMY1vsavGlgsdkvT
 GE7Q1zvt+/3Rgogr0WSh11cCZu1S8OUdK4uAKheooXhLSgijG2WS1mb5sXEa42IV6c9cAsCnsYtO6Y
 KDSGdXkxeernGA0Ju3eoWaVPtMYQ6RocVLj2ibDAqr7UO7Km2D3eJoBkFAx4s+dHI3c9qGHgcoI/kp
 DlEHQdlam0wGDmW0rOW7vfZsWP6z7S/zEdfp8Sx2YmQOGqz8EjsWUzDaZKS5BohHbTnLeITRlr9DDE
 TI6PwlMvwuwJlT0oeWVKkxOL3BHRUFQL42S8jA6CZ20WOSIsxKo9/RTpCrWeQNASwgkA0nggoHXGD8
 OsDR2LbmJ/mq+xIIVLwYr8DHawNgWlTKSu0ThLQg6L8rQDlk3fTxz8eBUrtHZcyCWH8sX6nAZLy6xW
 Olyoq8DmMJJQY1YgdxEvlFA/6Q6YsauAzHZ5bzz6NTqPXWsjRYKa5cNRpawg==
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
 linux-amlogic@lists.infradead.org, "Lukas F. Hartmann" <lukas@mntre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
index 461ebd79497c..e4053f4957d5 100644
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

