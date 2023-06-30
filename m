Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED9743FB8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 18:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82010E4B6;
	Fri, 30 Jun 2023 16:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B6B10E4B5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 16:29:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3113dabc549so2475421f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688142562; x=1690734562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=agCUhn/8LSgqkRC+TGbYPlU94ThrQwri2McEeBSjgT0=;
 b=QamhUe19zrr27U1pgtrt5KJJXeWtzGaODKr1P3iXnhMILEH46IWrhPsxqWLPdJTh+O
 e/rXaUo+eASTI7giqLrvtUz4S5FSaF7J9U3V87fnraV8+xBYZk/4Cs5+apF0YmL2PYPf
 W/rprOLM10XxzK+Q5+bOW2MbXe5NK3A2ZGHXLtNZdxp9YWzW0UOuseOtqp5kX7ZF4K/b
 PCdf9OtzVH85LZ3fYeU2ZCQjJui/R3h2Y5fKEmqFPHZao2wsYO7yhAY2QjSUgmCCLcDQ
 vwy0fSWuGaNtWh7WQypPhtJYcRY4avBCNtOmrQ+v3/yqhvcBChB4+KUqXBk2BXVKeO/2
 nHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688142562; x=1690734562;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=agCUhn/8LSgqkRC+TGbYPlU94ThrQwri2McEeBSjgT0=;
 b=fbd5OTdchIum5BZ79I02ZfAZuRDGD5oEM3qVVEilTwNWJtaSqo5ShjfmdVJRz1Ouk3
 Bct35HrE/cx+4oia771C3IgFjyyIDX/48cXgWEB21O3+5/cdHKDBlijo05hxJ2ud85vh
 aF1n4v3mqdYbhhGyNDnE46ytPfcfaDs6t3wwUqVAAOnzw/Ch1GojkJRPPnjaoYUb8t9M
 b5P7vkNPrxkpqMWCz4pap+e8LlwH1v1tHmfmBlXUsWDKLCD9Yrf4QW9hmBNAlLgKdHUf
 K9BxXT5KtDykQCUOzlhsTKUMER2AoFKFxWZYIVbVO7Zs01Ja6Ak84lKQsh/SVy2DCt1R
 Tnfw==
X-Gm-Message-State: ABy/qLZtl9sqvB01mYpZcgMhlqXbRDdHnXgsiguRattisSwKnP76bDQY
 JnQEkS3LSeisFlyMef0oMQfSLg==
X-Google-Smtp-Source: APBJJlHikretm5n4xlJzzhjMZTiRRnP+HGMQneFqm6dOuTAnk8LEumLOzV+kvWMu58qwMBZ9a7UTKQ==
X-Received: by 2002:adf:f389:0:b0:314:1e3e:611d with SMTP id
 m9-20020adff389000000b003141e3e611dmr3154315wro.71.1688142562429; 
 Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 09:29:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:10 +0200
Subject: [PATCH v6 3/9] clk: meson: add vclk driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-3-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9036;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QRCNRMlZZPU+/GYJx9LR/JWNNbQG1u0cT+Nsy+8OVWo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLb2DX08JpGYWxGnt9ictmBQymge53zpoD7pUjF
 QRa0ZQSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C2wAKCRB33NvayMhJ0feOD/
 43MAQIIMHj/ev5F+H4eUu3fwjKo6waNz+2PDwX7w3GMPP1FPz0wrAI0ZPpzzEXOASNOT/qOJypi9bj
 3p2RuxuLyZW3MKT2KT+vau+RrjPABY+miBe1H/VtbB9V95bBXLyZo0kP7wR1WgOTYfepyeFV1NmUsV
 T8J56BFi2ObC4OIOqa36KbXu6PHYWBexoO/zsKVXzl0fEH+LCsryDB/4Xr4dLSEE+m4xCly/IPhxUP
 n+FTbF1p2ZViM6xpoEPuOIruAH9noG0BxVFZCmZqTsTOdrLV2wo/faOC6esiyGbd8vZuqasWtQdBQe
 xDkTMjLbd15EyVuMQKzshkz1DxWUc+8vlHwIAwFvjwCft7UNu6zWeRWsvqPsemYcqu2yJ3CmTRlBg5
 WeTPEnSZxjBN/nNIcWSGyTs1IQF+Zsidr2UOJj4c4GwU+WW3yUPBT0jkEgKrqYqaO3infGpT/7nR7O
 IXgeliqEtTdUiFDQqUMHCJ1B/wkZMzXko1a2TCANNAkV2l8FOYKzfLtDEzwPeUiL67J9mSBeOU+j6B
 JUszaIbNyRGqjH9lIOdnMMQ6yCQQDEYooMMnDsaQJhQop7YCOa4MToAOgYIWYgwBcwtFoh4Ufb2B2X
 s+zCFk9WP1aeoQHSh4Y+6nyX/SsaQ5ovggeft4DvFSnGzGpCpBxu2sr/kjBA==
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

The VCLK and VCLK_DIV clocks have supplementary bits.

The VCLK has a "SOFT RESET" bit to toggle after the whole
VCLK sub-tree rate has been set, this is implemented in
the gate enable callback.

The VCLK_DIV clocks as enable and reset bits used to disable
and reset the divider, associated with CLK_SET_RATE_GATE it ensures
the rate is set while the divider is disabled and in reset mode.

The VCLK_DIV enable bit isn't implemented as a gate since it's part
of the divider logic and vendor does this exact sequence to ensure
the divider is correctly set.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig  |   5 ++
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/vclk.c   | 146 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  68 +++++++++++++++++++++
 4 files changed, 220 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 135da8f2d0b1..83f629515e96 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -30,6 +30,10 @@ config COMMON_CLK_MESON_VID_PLL_DIV
 	tristate
 	select COMMON_CLK_MESON_REGMAP
 
+config COMMON_CLK_MESON_VCLK
+	tristate
+	select COMMON_CLK_MESON_REGMAP
+
 config COMMON_CLK_MESON_CLKC_UTILS
 	tristate
 
@@ -140,6 +144,7 @@ config COMMON_CLK_G12A
 	select COMMON_CLK_MESON_EE_CLKC
 	select COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
+	select COMMON_CLK_MESON_VCLK
 	select MFD_SYSCON
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index cd961cc4f4db..6efeb8c7bd2a 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_COMMON_CLK_MESON_PLL) += clk-pll.o
 obj-$(CONFIG_COMMON_CLK_MESON_REGMAP) += clk-regmap.o
 obj-$(CONFIG_COMMON_CLK_MESON_SCLK_DIV) += sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_VID_PLL_DIV) += vid-pll-div.o
+obj-$(CONFIG_COMMON_CLK_MESON_VCLK) += vclk.o
 
 # Amlogic Clock controllers
 
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
new file mode 100644
index 000000000000..0df84403b17f
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,146 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/module.h>
+#include "vclk.h"
+
+/* The VCLK gate has a supplementary reset bit to pulse after ungating */
+
+static int clk_regmap_vclk_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+
+	/* Do a reset pulse */
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+
+	return 0;
+}
+
+static void clk_regmap_vclk_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+}
+
+static int clk_regmap_vclk_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_data *vclk = clk_get_regmap_vclk_data(clk);
+	unsigned int val;
+
+	regmap_read(clk->map, vclk->offset, &val);
+
+	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
+}
+
+const struct clk_ops clk_regmap_vclk_ops = {
+	.enable = clk_regmap_vclk_enable,
+	.disable = clk_regmap_vclk_disable,
+	.is_enabled = clk_regmap_vclk_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_ops);
+
+/* The VCLK Divider has supplementary reset & enable bits */
+
+static unsigned long clk_regmap_vclk_div_recalc_rate(struct clk_hw *hw,
+						     unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, vclk->offset, &val);
+	if (ret)
+		/* Gives a hint that something is wrong */
+		return 0;
+
+	val >>= vclk->shift;
+	val &= clk_div_mask(vclk->width);
+
+	return divider_recalc_rate(hw, prate, val, vclk->table, vclk->flags,
+				   vclk->width);
+}
+
+static int clk_regmap_vclk_div_determine_rate(struct clk_hw *hw,
+					      struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->width,
+				      vclk->flags);
+}
+
+static int clk_regmap_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->width,
+			      vclk->flags);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << vclk->shift;
+	return regmap_update_bits(clk->map, vclk->offset,
+				  clk_div_mask(vclk->width) << vclk->shift, val);
+};
+
+static int clk_regmap_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+
+	return regmap_set_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+}
+
+static void clk_regmap_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	regmap_clear_bits(clk->map, vclk->offset, BIT(vclk->enable_bit_idx));
+
+	regmap_set_bits(clk->map, vclk->offset, BIT(vclk->reset_bit_idx));
+}
+
+static int clk_regmap_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_vclk_div_data *vclk = clk_get_regmap_vclk_div_data(clk);
+	unsigned int val;
+
+	regmap_read(clk->map, vclk->offset, &val);
+
+	return val & BIT(vclk->enable_bit_idx) ? 1 : 0;
+}
+
+const struct clk_ops clk_regmap_vclk_div_ops = {
+	.recalc_rate = clk_regmap_vclk_div_recalc_rate,
+	.determine_rate = clk_regmap_vclk_div_determine_rate,
+	.set_rate = clk_regmap_vclk_div_set_rate,
+	.enable = clk_regmap_vclk_div_enable,
+	.disable = clk_regmap_vclk_div_disable,
+	.is_enabled = clk_regmap_vclk_div_is_enabled,
+};
+EXPORT_SYMBOL_GPL(clk_regmap_vclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic vclk clock driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
new file mode 100644
index 000000000000..90786552a7f3
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+
+/**
+ * struct clk_regmap_vclk_data - vclk regmap backed specific data
+ *
+ * @offset:		offset of the register controlling gate
+ * @enable_bit_idx:	single bit controlling vclk enable
+ * @reset_bit_idx:	single bit controlling vclk reset
+ * @flags:		hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_data {
+	unsigned int	offset;
+	u8		enable_bit_idx;
+	u8		reset_bit_idx;
+	u8		flags;
+};
+
+static inline struct clk_regmap_vclk_data *
+clk_get_regmap_vclk_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_data *)clk->data;
+}
+
+extern const struct clk_ops clk_regmap_vclk_ops;
+
+/**
+ * struct clk_regmap_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @offset:	offset of the register controlling the divider
+ * @shift:	shift to the divider bit field
+ * @width:	width of the divider bit field
+ * @enable_bit_idx:	single bit controlling vclk divider enable
+ * @reset_bit_idx:	single bit controlling vclk divider reset
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct clk_regmap_vclk_div_data {
+	unsigned int	offset;
+	u8		shift;
+	u8		width;
+	u8		enable_bit_idx;
+	u8		reset_bit_idx;
+	const struct clk_div_table      *table;
+	u8		flags;
+};
+
+static inline struct clk_regmap_vclk_div_data *
+clk_get_regmap_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct clk_regmap_vclk_div_data *)clk->data;
+}
+
+extern const struct clk_ops clk_regmap_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1

