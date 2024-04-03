Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E198966FF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429D91126FB;
	Wed,  3 Apr 2024 07:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WzdUr3ul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0821126FB
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:46:46 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-343719ce021so681298f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 00:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712130404; x=1712735204; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JjX+wh1bRD3ldA1+jq/CQZyaZOXNMv4h1ExYZAwSzD4=;
 b=WzdUr3ulkxNWCLaBPfi/RaXAnwvP0OcypdPjWP+pJcfpvvV0skYLIRM+eWQt0+edmy
 3q3CUfYSRHOPZ2ykU+g38eurEtYC0sNB5ddBGsx6vNFLFngwnb9CHVqWC5EFSACOuLOH
 epIa/jqS+8f7rOi3qxHPADyfML2bEJdu0H6CuPv/SpUDXFoAzdUFEIOnrW5CFoUCtHqm
 oJtoDaG84JXVPlzy0OU8RqJeN90Aagia9D5ibX5SX7E4STFrWUVO1whklnVPSc/DvR5s
 kJHA6Ldq24sN3r8GNjWl+XKkvHurEp6n17sjQUaOm0g+zvLWj/duWNl1hfGNpA+528JZ
 V9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712130404; x=1712735204;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjX+wh1bRD3ldA1+jq/CQZyaZOXNMv4h1ExYZAwSzD4=;
 b=Un3yWLkF7n8v3y+QemSEW63ydqdhiKbiLD2L9AePXcpHb4inFl2Ulf9IJupQrNmPfS
 /68n0RmJqwv3c/UzD9uNzgekFMAGjhoqPUVT63GxqDuu+ZjC0aDLNKPQlr1io05yTyLU
 qyh8gU8HqfBy41DUXAMFUKZyDakukc5TcPkeNmhLYIF/w82J1j4dZHS4UuIuUpqPTzmz
 9ObtO2wr0Jf2Bnx9MX3ejwicCJtuxRgYZwFExezsAzrbRiZuL3mmjXodQELraUpf0K9g
 VHDC7/Ywhjz7emkheh68B4ovqjuYezU1VfWCzrFYkNwx292LnvgZtO9HUm1Bx/71fnsI
 +JHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgsn1mvOsH4xQKh7qNpp3DLlnMBp5COt+OMtAsmFLy6tqkB/v/0CB5thZtQ2BKuIEqIoknZTGNJuQOu2G6raLMe52SNYisiJgT6C4mG6jC
X-Gm-Message-State: AOJu0YxSLSt3gMDoRnh5ldHFXZhqlop4RB4iR16wMHTpbCu4co9RBSwH
 mzG+9JKQDxuE3+bgyzcLCMkE8pXnkWzRt8FAXmxJmbB/4ZQ3LbZyoyFUuuLd6XE=
X-Google-Smtp-Source: AGHT+IFN8QbGpg5Hq14IAnAJ+YjeGl9Qf/ercNdgniUbwDbtDT+LZjiMBCX1TiuclnO8MtOOl36V5g==
X-Received: by 2002:adf:ef4f:0:b0:341:6869:3b54 with SMTP id
 c15-20020adfef4f000000b0034168693b54mr9152334wrp.66.1712130403467; 
 Wed, 03 Apr 2024 00:46:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 00:46:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:33 +0200
Subject: [PATCH v12 2/7] clk: meson: add vclk driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-2-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=7695;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=J0uRmpukuSPVkPHeT6NGEM0S0WgQ/zvdw36800/3LLA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQldwMqCCJtTri7GZrmyuS7K1vZtM+7EEngbNJve
 KYiJ5ySJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXQAKCRB33NvayMhJ0Uj3D/
 0dcco/JXVgNh35vjWgpMVzzRmmCF8cKqSyqXb4qxMz7L1eTyt4sD7mVVxRBx2+/ehPOHfkWn4JKmNs
 esDkEo9wAlRqW+HGurcO3+MkYfviFMyPPzozdoM5otk52Xl8jObrLZAHgQ0sXp5YRONCd7k+w2DdE5
 4NWpNRMmvVmQbS0MvYqODktdYzq8BUa/Iu1PaxyeGp0OIHmXy1LH8tN9zA7QeGGigwCXSZ/5bmNKc4
 3Pn0jaBdOWiTuJI3a77O7dO1asNheJJbpLP/OKYmouOXtr1zzwjD6tHw3wDiNzYNY8SL1ko/FkCX2i
 WBvlEV6EbtxBFiLUI0yBF+W9w6YzckLYuMorRFCgRfRC7i2GH+pNVoeiaeXyPggWZ9yvq5jay+Sslp
 nC8P3n0SeW2Uyku7DTSB+TZX626kWIGP1n3bS2zb5giwueX9OaySfMQX83E10nP1HFPbQEwWqGad9x
 KwiIt8c/wnVgPKXV8LBISt6AN8Tgs3bY5VvMQcII6ZCLgPrOwgYxLTzZVOisWRkRQOx06SfwEs6ybT
 fCtR5zoNeYSdTs3GiG88uttFArZdMZqtwgYRij60nd/oLvGk+NvABRN0HctSvpRiP8ZL57rWnuEiwJ
 8Zfpoy252LXrksVllBjVq/wrwnXZkxaVOfW9KrLrgiWpRqwkCr0I/NzvX9HQ==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VCLK and VCLK_DIV clocks have supplementary bits.

The VCLK gate has a "SOFT RESET" bit to toggle after the whole
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
 drivers/clk/meson/Kconfig  |   4 ++
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/vclk.c   | 141 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/vclk.h   |  51 ++++++++++++++++
 4 files changed, 197 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 29ffd14d267b..8a9823789fa3 100644
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
 
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 9ee4b954c896..9ba43fe7a07a 100644
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
index 000000000000..45dc216941ea
--- /dev/null
+++ b/drivers/clk/meson/vclk.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/module.h>
+#include "vclk.h"
+
+/* The VCLK gate has a supplementary reset bit to pulse after ungating */
+
+static inline struct meson_vclk_gate_data *
+clk_get_meson_vclk_gate_data(struct clk_regmap *clk)
+{
+	return (struct meson_vclk_gate_data *)clk->data;
+}
+
+static int meson_vclk_gate_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	/* Do a reset pulse */
+	meson_parm_write(clk->map, &vclk->reset, 1);
+	meson_parm_write(clk->map, &vclk->reset, 0);
+
+	return 0;
+}
+
+static void meson_vclk_gate_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
+
+	meson_parm_write(clk->map, &vclk->enable, 0);
+}
+
+static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_gate_data *vclk = clk_get_meson_vclk_gate_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops meson_vclk_gate_ops = {
+	.enable = meson_vclk_gate_enable,
+	.disable = meson_vclk_gate_disable,
+	.is_enabled = meson_vclk_gate_is_enabled,
+};
+EXPORT_SYMBOL_GPL(meson_vclk_gate_ops);
+
+/* The VCLK Divider has supplementary reset & enable bits */
+
+static inline struct meson_vclk_div_data *
+clk_get_meson_vclk_div_data(struct clk_regmap *clk)
+{
+	return (struct meson_vclk_div_data *)clk->data;
+}
+
+static unsigned long meson_vclk_div_recalc_rate(struct clk_hw *hw,
+						unsigned long prate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return divider_recalc_rate(hw, prate, meson_parm_read(clk->map, &vclk->div),
+				   vclk->table, vclk->flags, vclk->div.width);
+}
+
+static int meson_vclk_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return divider_determine_rate(hw, req, vclk->table, vclk->div.width,
+				      vclk->flags);
+}
+
+static int meson_vclk_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, vclk->table, vclk->div.width,
+			      vclk->flags);
+	if (ret < 0)
+		return ret;
+
+	meson_parm_write(clk->map, &vclk->div, ret);
+
+	return 0;
+};
+
+static int meson_vclk_div_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	/* Unreset the divider when ungating */
+	meson_parm_write(clk->map, &vclk->reset, 0);
+	meson_parm_write(clk->map, &vclk->enable, 1);
+
+	return 0;
+}
+
+static void meson_vclk_div_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	/* Reset the divider when gating */
+	meson_parm_write(clk->map, &vclk->enable, 0);
+	meson_parm_write(clk->map, &vclk->reset, 1);
+}
+
+static int meson_vclk_div_is_enabled(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_vclk_div_data *vclk = clk_get_meson_vclk_div_data(clk);
+
+	return meson_parm_read(clk->map, &vclk->enable);
+}
+
+const struct clk_ops meson_vclk_div_ops = {
+	.recalc_rate = meson_vclk_div_recalc_rate,
+	.determine_rate = meson_vclk_div_determine_rate,
+	.set_rate = meson_vclk_div_set_rate,
+	.enable = meson_vclk_div_enable,
+	.disable = meson_vclk_div_disable,
+	.is_enabled = meson_vclk_div_is_enabled,
+};
+EXPORT_SYMBOL_GPL(meson_vclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic vclk clock driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vclk.h b/drivers/clk/meson/vclk.h
new file mode 100644
index 000000000000..20b0b181db09
--- /dev/null
+++ b/drivers/clk/meson/vclk.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __VCLK_H
+#define __VCLK_H
+
+#include "clk-regmap.h"
+#include "parm.h"
+
+/**
+ * struct meson_vclk_gate_data - vclk_gate regmap backed specific data
+ *
+ * @enable:	vclk enable field
+ * @reset:	vclk reset field
+ * @flags:	hardware-specific flags
+ *
+ * Flags:
+ * Same as clk_gate except CLK_GATE_HIWORD_MASK which is ignored
+ */
+struct meson_vclk_gate_data {
+	struct parm enable;
+	struct parm reset;
+	u8 flags;
+};
+
+extern const struct clk_ops meson_vclk_gate_ops;
+
+/**
+ * struct meson_vclk_div_data - vclk_div regmap back specific data
+ *
+ * @div:	divider field
+ * @enable:	vclk divider enable field
+ * @reset:	vclk divider reset field
+ * @table:	array of value/divider pairs, last entry should have div = 0
+ *
+ * Flags:
+ * Same as clk_divider except CLK_DIVIDER_HIWORD_MASK which is ignored
+ */
+struct meson_vclk_div_data {
+	struct parm div;
+	struct parm enable;
+	struct parm reset;
+	const struct clk_div_table *table;
+	u8 flags;
+};
+
+extern const struct clk_ops meson_vclk_div_ops;
+
+#endif /* __VCLK_H */

-- 
2.34.1

