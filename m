Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2E77FF0C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 22:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639CE10E03E;
	Thu, 17 Aug 2023 20:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA29A10E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 20:30:24 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bbff6b2679so1802775ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692304224; x=1692909024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ePLHPBs2lEPLiyOyP2Z9O6mDkyFMIeuRe9yuhA2Bzms=;
 b=WiakFm7lv/iBJ0k2jjoGfNVzfEcmVwelvqtpsJmVNOOwUPj6YvJxJyatustjy8W1W4
 nM5X2DEQ/A7UdvLN0DtseUcjeCvy7/W36yL2/9hmC94vn/2gDhYQkc8us3Uq0Ox9s0wa
 ryUbd7OJJBvNkVKUPjkmhYz4O0WHiGY6G2KSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692304224; x=1692909024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ePLHPBs2lEPLiyOyP2Z9O6mDkyFMIeuRe9yuhA2Bzms=;
 b=gTfHtohy1NWg8FJcOTerlsdH4+m6dM1u0sSkLTLfn+OqWqP9XAZpqrgqXkA9V4sBdG
 OAXyxlrdoF+piDYHcL/EynTUisfPvNoQIjxC34YJA1TeStpM5HVKsTnnRzSfRXsTAw44
 AwrrvXnql7a5L5Je/N0KXqoORps3EweANaEPXUAbOgs205uDoZJRE66/3gpt1+5yWkKA
 5E0JVvIcrJxX2ZhwTKkVhQzKqGDqacPjpUh4AHzGRNuaGPxMHYiaJ4IuRLwuI2MQq0O+
 jinDcRZKlFp6Wk0+XAFoRsXJhr7i+to/ukzDPnhG3PcaeN6t0n2M6QsFR2a0fLfJ2Klw
 6UGg==
X-Gm-Message-State: AOJu0Yy2/ph3MWUdcj6eF+cfbY007pvMt1C8W4iE8ArAhh9aY0YbISjm
 IeBHZvZB5hy1fqgA4pzuH1YLQg==
X-Google-Smtp-Source: AGHT+IG/++lebuPXOTGcWVkGR0Azo7GoArTEfqeEPnjd7zxuUflMdqVFSy0P4ogm05eSsJZ7pUaJ1g==
X-Received: by 2002:a17:902:f690:b0:1bd:ea88:7b93 with SMTP id
 l16-20020a170902f69000b001bdea887b93mr494923plg.54.1692304224308; 
 Thu, 17 Aug 2023 13:30:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a16-20020a170902b59000b001bba3650448sm171152pls.258.2023.08.17.13.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:30:23 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: Annotate struct clk_hw_onecell_data with __counted_by
Date: Thu, 17 Aug 2023 13:30:22 -0700
Message-Id: <20230817203019.never.795-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10606; i=keescook@chromium.org;
 h=from:subject:message-id; bh=XUDNIGZF7Cd68CTXufwLImFXIviJ7LfwFBJnpkVIkok=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk3oNejG7VEW35Oqe+PrP8iCTNz+BEJ+r64JJBG
 RsN4/THccSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZN6DXgAKCRCJcvTf3G3A
 JrEMD/wPRcgmMjNftw5pFqX1WtITK2MAuEViYU/iF0Fz0vJi3Z80H2azQxbicH8pYfj0Qv7KuNn
 rRz4ulbGlAtkKsQjYNKOWUMJyOPZmnyH8Q+8xsNfW7q/MtnrXk9MQMnE+VCJL91OqH8Ghg3zXqw
 2w+SotPIguqWZmywVOxJ+rz/8eBf012S2qRY7LxKxw5y43BXAdVRceODtMkDqAIqB/ntxxO50vi
 PcQnm5RbALCVpuzwECUu7SRdZkBhhFs0FOzlC1B4abLQEqvvJwpwkEcgk1YegYjaHyW6FpEJbIb
 4yfQN7GC6B5GWhxC0raUN1jsaOGNbFKE8UxTAaM1g1VbhxQCrSIzlI/CYnhaND4Ex7gt5acCI4u
 not7RfxJ4ONgGz0Z7FFAEv44JFXoYNGw5fHcPlYLrfA4ksmx3W3D23C+h7UDGzIBZN5c4KMJVqx
 aYcPJwEG1bexh0FJkZNEWDmayP73tyVuDU9SSXjCx9K14nlfR5M1ppLy6wWIKAAI50lc9xA8kAb
 cGOpHFnIViAhVU6lKiX7zVzQFNY7GM+Xem0jYIC659r6rKlagRfwOFwNkhGbXvE59UaROAtCy33
 ioDMK0F0OpKpqrd0yL06uYQkHzh9JhxRZh9KrYHhfIRpxerV3ZSmV9uIGaoi2qTSQyPS5a4rQ8D
 h+iSVr MCum3DnJA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Tom Rix <trix@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Kees Cook <keescook@chromium.org>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Qin Jian <qinjian@cqplus1.com>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Takao Orito <orito.takao@socionext.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct clk_hw_onecell_data.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Taichi Sugaya <sugaya.taichi@socionext.com>
Cc: Takao Orito <orito.takao@socionext.com>
Cc: Qin Jian <qinjian@cqplus1.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-phy@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/clk/clk-aspeed.c                    | 3 +--
 drivers/clk/clk-ast2600.c                   | 2 +-
 drivers/clk/clk-gemini.c                    | 2 +-
 drivers/clk/clk-milbeaut.c                  | 3 +--
 drivers/clk/clk-sp7021.c                    | 3 +--
 drivers/clk/mvebu/cp110-system-controller.c | 2 +-
 drivers/clk/qcom/clk-cpu-8996.c             | 2 +-
 drivers/clk/ralink/clk-mt7621.c             | 3 +--
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c      | 3 +--
 drivers/phy/qualcomm/phy-qcom-edp.c         | 2 +-
 include/linux/clk-provider.h                | 2 +-
 11 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 284710adaef5..ff84191d0fe8 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -701,6 +701,7 @@ static void __init aspeed_cc_init(struct device_node *np)
 				  GFP_KERNEL);
 	if (!aspeed_clk_data)
 		return;
+	aspeed_clk_data->num = ASPEED_NUM_CLKS;
 
 	/*
 	 * This way all clocks fetched before the platform device probes,
@@ -732,8 +733,6 @@ static void __init aspeed_cc_init(struct device_node *np)
 		aspeed_ast2500_cc(map);
 	else
 		pr_err("unknown platform, failed to add clocks\n");
-
-	aspeed_clk_data->num = ASPEED_NUM_CLKS;
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_clk_data);
 	if (ret)
 		pr_err("failed to add DT provider: %d\n", ret);
diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index f9e27f95a967..909c3137c428 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -839,6 +839,7 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 				      ASPEED_G6_NUM_CLKS), GFP_KERNEL);
 	if (!aspeed_g6_clk_data)
 		return;
+	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
 
 	/*
 	 * This way all clocks fetched before the platform device probes,
@@ -860,7 +861,6 @@ static void __init aspeed_g6_cc_init(struct device_node *np)
 	}
 
 	aspeed_g6_cc(map);
-	aspeed_g6_clk_data->num = ASPEED_G6_NUM_CLKS;
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, aspeed_g6_clk_data);
 	if (ret)
 		pr_err("failed to add DT provider: %d\n", ret);
diff --git a/drivers/clk/clk-gemini.c b/drivers/clk/clk-gemini.c
index a23fa6d47ef1..2572d15aadd0 100644
--- a/drivers/clk/clk-gemini.c
+++ b/drivers/clk/clk-gemini.c
@@ -404,6 +404,7 @@ static void __init gemini_cc_init(struct device_node *np)
 				  GFP_KERNEL);
 	if (!gemini_clk_data)
 		return;
+	gemini_clk_data->num = GEMINI_NUM_CLKS;
 
 	/*
 	 * This way all clock fetched before the platform device probes,
@@ -457,7 +458,6 @@ static void __init gemini_cc_init(struct device_node *np)
 	gemini_clk_data->hws[GEMINI_CLK_APB] = hw;
 
 	/* Register the clocks to be accessed by the device tree */
-	gemini_clk_data->num = GEMINI_NUM_CLKS;
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, gemini_clk_data);
 }
 CLK_OF_DECLARE_DRIVER(gemini_cc, "cortina,gemini-syscon", gemini_cc_init);
diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 050fd4fb588f..18c20aff45f7 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -618,6 +618,7 @@ static void __init m10v_cc_init(struct device_node *np)
 
 	if (!m10v_clk_data)
 		return;
+	m10v_clk_data->num = M10V_NUM_CLKS;
 
 	base = of_iomap(np, 0);
 	if (!base) {
@@ -654,8 +655,6 @@ static void __init m10v_cc_init(struct device_node *np)
 					base + CLKSEL(1), 0, 3, 0, rclk_table,
 					&m10v_crglock, NULL);
 	m10v_clk_data->hws[M10V_RCLK_ID] = hw;
-
-	m10v_clk_data->num = M10V_NUM_CLKS;
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, m10v_clk_data);
 }
 CLK_OF_DECLARE_DRIVER(m10v_cc, "socionext,milbeaut-m10v-ccu", m10v_cc_init);
diff --git a/drivers/clk/clk-sp7021.c b/drivers/clk/clk-sp7021.c
index 11d22043ddd7..01d3c4c7b0b2 100644
--- a/drivers/clk/clk-sp7021.c
+++ b/drivers/clk/clk-sp7021.c
@@ -621,6 +621,7 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = CLK_MAX;
 
 	hws = clk_data->hws;
 	pd_ext.index = 0;
@@ -688,8 +689,6 @@ static int sp7021_clk_probe(struct platform_device *pdev)
 			return PTR_ERR(hws[i]);
 	}
 
-	clk_data->num = CLK_MAX;
-
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 }
 
diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 84c8900542e4..03c59bf22106 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -240,9 +240,9 @@ static int cp110_syscon_common_probe(struct platform_device *pdev,
 				      GFP_KERNEL);
 	if (!cp110_clk_data)
 		return -ENOMEM;
+	cp110_clk_data->num = CP110_CLK_NUM;
 
 	cp110_clks = cp110_clk_data->hws;
-	cp110_clk_data->num = CP110_CLK_NUM;
 
 	/* Register the PLL0 which is the root of the hw tree */
 	pll0_name = ap_cp_unique_name(dev, syscon_node, "pll0");
diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 592c7c3cdeb7..72689448a653 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -590,6 +590,7 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 	data = devm_kzalloc(dev, struct_size(data, hws, 2), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->num = 2;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -605,7 +606,6 @@ static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
 
 	data->hws[0] = &pwrcl_pmux.clkr.hw;
 	data->hws[1] = &perfcl_pmux.clkr.hw;
-	data->num = 2;
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, data);
 }
diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
index d95a33293b0a..92d14350c4b3 100644
--- a/drivers/clk/ralink/clk-mt7621.c
+++ b/drivers/clk/ralink/clk-mt7621.c
@@ -521,6 +521,7 @@ static int mt7621_clk_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = count;
 
 	for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++)
 		clk_data->hws[i] = mt7621_clk_early[i];
@@ -537,8 +538,6 @@ static int mt7621_clk_probe(struct platform_device *pdev)
 		goto unreg_clk_fixed;
 	}
 
-	clk_data->num = count;
-
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret) {
 		dev_err(dev, "Couldn't add clk hw provider\n");
diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index 6f076cf4b403..a1ca3916f42b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -141,6 +141,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
+	clk_data->num = CLK_NUM;
 	tcon_top->clk_data = clk_data;
 
 	spin_lock_init(&tcon_top->reg_lock);
@@ -213,8 +214,6 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 			goto err_unregister_gates;
 		}
 
-	clk_data->num = CLK_NUM;
-
 	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
 				     clk_data);
 	if (ret)
diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index e0e722b9be31..8e5078304646 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -744,6 +744,7 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
 	data = devm_kzalloc(edp->dev, struct_size(data, hws, 2), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
+	data->num = 2;
 
 	snprintf(name, sizeof(name), "%s::link_clk", dev_name(edp->dev));
 	init.ops = &qcom_edp_dp_link_clk_ops;
@@ -763,7 +764,6 @@ static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
 
 	data->hws[0] = &edp->dp_link_hw;
 	data->hws[1] = &edp->dp_pixel_hw;
-	data->num = 2;
 
 	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0f0cd01906b4..ec32ec58c59f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1379,7 +1379,7 @@ struct clk_onecell_data {
 
 struct clk_hw_onecell_data {
 	unsigned int num;
-	struct clk_hw *hws[];
+	struct clk_hw *hws[] __counted_by(num);
 };
 
 #define CLK_OF_DECLARE(name, compat, fn) \
-- 
2.34.1

