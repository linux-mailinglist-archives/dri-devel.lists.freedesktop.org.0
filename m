Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5E937802
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 14:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3854010EC1C;
	Fri, 19 Jul 2024 12:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WAMuhAC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C23710EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 12:55:29 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2eefe705510so21992101fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 05:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721393728; x=1721998528; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jB0LDwWchQ1Y0yxYjXnm3lm5EUl7Kp4Z7xElCeC0Jdg=;
 b=WAMuhAC3edOLp6jwSbiPvmLro67319ekMbFQ3hSDLsUrd4+AoA9v684rrn/p7JFeuk
 tRzF5sEOnE7X5cR0q5SVYonpTh6Yp+n4x4ah18DG+4tPZAliIdqPoydjiG7C0N1jxfYi
 YZy1jvunuTE28flb23U+gHBa7AYyP3LOiqFoH5zQYG+25+H8bSdK3+bIBMN3alJ7/MkV
 K2NAxpsVuPEftTrjxpoWIt+yhMo6KHVEORWlncaRCL1IBXswItNF/bh83VjQD++VX3Ei
 BSBxi5ve2MlBVN1QFGLX4iNfI5yoKQf401d6hcosmjDDqpmSSqIIJydRdW5DmPHSBhva
 K0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721393728; x=1721998528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jB0LDwWchQ1Y0yxYjXnm3lm5EUl7Kp4Z7xElCeC0Jdg=;
 b=Adnj/vd78kCzesBAAoVDAjvJZOPDxzj+aPNcAKEntRDTQNfG7nH5NMxJaFDJ6FkcFE
 z76645hYGkS/67rBHDAc2xnSwr4obQOmqD1WwkUe3d/sNV1mOGD2OPjZ3MCQ4mhETJIi
 8VdvMuEyRjgC44QlLr37UU+jdsXsHNehDrhg/UA1TTUJtoHvVMu50BmcpB2bVfPbaeH7
 0HUGAzNwlUglGHE6+3/x57wVzPtJg5d4aFyW5j1ZCJNLuF890dFp6ZzbeiHaD198070w
 WcWa0PI/4cRrVyY+JrkHyhAyYrKN8LfHseo9NUZOxNZDg0NQfAlsnABhFNQeaEfq5NBE
 D2IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXg4HcbEsYHbD9hDwIxYBUPHLB4k5/DDH8Jper2RqSlmXFFO/pMFt3iXhBsWVJlpbiXkVIIkAMeMhzW3ImlI48/8oBx078wybRRKytBQ1ep
X-Gm-Message-State: AOJu0YyuWbgIlpB9j/SFtmblNrncaufgQczGJVaLJBu0EUV3HLYtnK52
 YkRV7t6I87KhFLOaaNn5gSrPKp+Y+VXLEYwr/zOOChyJZvgSNN6N
X-Google-Smtp-Source: AGHT+IENeGFObXn002bsJy2Dx3tz0dd31Uv3EzT5Ns+vSMFzFDzaKz3p4bXCxbraMenhS2L/IJQOgg==
X-Received: by 2002:a05:651c:2105:b0:2ee:8777:f868 with SMTP id
 38308e7fff4ca-2ef05d28994mr44112771fa.35.1721393721865; 
 Fri, 19 Jul 2024 05:55:21 -0700 (PDT)
Received: from debian.localdomain ([178.122.223.182])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30af84673sm1174448a12.50.2024.07.19.05.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 05:55:21 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
To: dmitry.baryshkov@linaro.org, Sebastian Reichel <sre@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 27/28] gcc-sdm845: Add general purpose clock ops
Date: Fri, 19 Jul 2024 15:55:04 +0300
Message-Id: <20240719-starqltechn_integration_upstream-v4-27-a7f644821941@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240719-starqltechn_integration_upstream-v4-0-a7f644821941@gmail.com>
References: <20240719-starqltechn_integration_upstream-v4-0-a7f644821941@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721388867; l=9651;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=mpyTkbgGCFRMs46XWouCS/Cxqt92qMtpq+6g9okpfGA=;
 b=AUG0ZxeqIT+xenEivXpKb8DAzFAFAvNm9ssCvEHOBoffWOMSekeO8SyrRcrUWvlc6Gu96BgcB
 SWGbYrnziyfD2noh2tRrPzG4uXq7JgM2ftfjabjFU4v4acNIQp0I6gv
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

SDM845 has "General Purpose" clocks that can be muxed to
SoC pins to clock various external devices.
Those clocks may be used as e.g. PWM sources for external peripherals.

GPCLK can in theory have arbitrary value depending on the use case, so
the concept of frequency tables, used in rcg2 clock driver, is not
efficient, because it allows only defined frequencies.

Introduce clk_rcg2_gp_ops, which automatically calculate clock
mnd values for arbitrary clock rate.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/clk-rcg.h    |   1 +
 drivers/clk/qcom/clk-rcg2.c   | 162 ++++++++++++++++++++++++++++++++++++++++--
 drivers/clk/qcom/gcc-sdm845.c |  19 ++---
 drivers/pwm/pwm-clk.c         |   5 ++
 4 files changed, 167 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index d7414361e432..5bd86bce0c4d 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -189,6 +189,7 @@ struct clk_rcg2_gfx3d {
 	container_of(to_clk_rcg2(_hw), struct clk_rcg2_gfx3d, rcg)
 
 extern const struct clk_ops clk_rcg2_ops;
+extern const struct clk_ops clk_rcg2_gp_ops;
 extern const struct clk_ops clk_rcg2_floor_ops;
 extern const struct clk_ops clk_rcg2_fm_ops;
 extern const struct clk_ops clk_rcg2_mux_closest_ops;
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 9b3aaa7f20ac..addfa7f59be8 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -32,6 +32,7 @@
 
 #define CFG_REG			0x4
 #define CFG_SRC_DIV_SHIFT	0
+#define CFG_SRC_DIV_LENGTH	8
 #define CFG_SRC_SEL_SHIFT	8
 #define CFG_SRC_SEL_MASK	(0x7 << CFG_SRC_SEL_SHIFT)
 #define CFG_MODE_SHIFT		12
@@ -393,16 +394,103 @@ static int clk_rcg2_fm_determine_rate(struct clk_hw *hw,
 	return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
 }
 
-static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
-				u32 *_cfg)
+static inline u64 find_hcf(u64 a, u64 b)
+{
+	while (a != 0 && b != 0) {
+		if (a > b)
+			a %= b;
+		else
+			b %= a;
+	}
+	return a + b;
+}
+
+static int clk_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f)
+{
+	u64 hcf;
+	u64 hid_div = 1, n = 1;
+	int i = 2, count = 0;
+
+	hcf = find_hcf(parent_rate, rate);
+	u64 scaled_rate = rate / hcf;
+	u64 scaled_parent_rate = parent_rate / hcf;
+
+	while (scaled_parent_rate > 1) {
+		while (scaled_parent_rate % i == 0) {
+			scaled_parent_rate /= i;
+			if (count % 2 == 0)
+				hid_div *= i;
+			else
+				n *= i;
+		}
+		i++;
+		count++;
+	}
+
+	f->m = scaled_rate;
+	f->n = n;
+	f->pre_div = hid_div;
+
+	return 0;
+}
+
+static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl *f;
+	int src = clk_rcg2_get_parent(hw);
+	int mnd_max = BIT(rcg->mnd_width) - 1;
+	int hid_max = BIT(rcg->hid_width) - 1;
+	u64 parent_rate;
+	int ret;
+
+	parent_rate = rcg->freq_tbl[src].freq;
+	f = kcalloc(MAX_PERF_LEVEL + 1, sizeof(f), GFP_KERNEL);
+
+	if (!f)
+		return 0;
+
+	ret = clk_calc_mnd(parent_rate, req->rate, f);
+	if (ret)
+		return 0;
+
+
+	while (f->n - f->m >= mnd_max) {
+		f->m = f->m >> 1;
+		f->n = f->n >> 1;
+	}
+	while (f->pre_div >= hid_max) {
+		f->pre_div = f->pre_div >> 1;
+		f->m = f->m >> 1;
+	}
+
+	req->rate = calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div);
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, int src, u32 *_cfg)
 {
-	u32 cfg, mask, d_val, not2d_val, n_minus_m;
 	struct clk_hw *hw = &rcg->clkr.hw;
-	int ret, index = qcom_find_src_index(hw, rcg->parent_map, f->src);
+	u32 mask = CFG_SRC_SEL_MASK;
+	int index = qcom_find_src_index(hw, rcg->parent_map, src);
 
 	if (index < 0)
 		return index;
 
+	*_cfg &= ~mask;
+	*_cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+
+	return 0;
+}
+
+static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	u32 cfg, mask, d_val, not2d_val, n_minus_m;
+	int ret;
+
 	if (rcg->mnd_width && f->n) {
 		mask = BIT(rcg->mnd_width) - 1;
 		ret = regmap_update_bits(rcg->clkr.regmap,
@@ -431,9 +519,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	mask |= CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
+	mask |= CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
 	cfg = f->pre_div << CFG_SRC_DIV_SHIFT;
-	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
 	if (rcg->mnd_width && f->n && (f->m != f->n))
 		cfg |= CFG_MODE_DUAL_EDGE;
 	if (rcg->hw_clk_ctrl)
@@ -445,6 +532,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
 	return 0;
 }
 
+static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f,
+				u32 *_cfg)
+{
+	int ret;
+
+	ret = __clk_rcg2_configure_parent(rcg, f->src, _cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, _cfg);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 {
 	u32 cfg;
@@ -465,6 +568,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
 	return update_config(rcg);
 }
 
+static int clk_rcg2_configure_gp(struct clk_rcg2 *rcg, const struct freq_tbl *f)
+{
+	u32 cfg;
+	int ret;
+
+	ret = regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
+	if (ret)
+		return ret;
+
+	ret = __clk_rcg2_configure_mnd(rcg, f, &cfg);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
+	if (ret)
+		return ret;
+
+	return update_config(rcg);
+}
+
 static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 			       enum freq_policy policy)
 {
@@ -518,6 +641,22 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
 	return __clk_rcg2_set_rate(hw, rate, CEIL);
 }
 
+static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	struct freq_tbl *f;
+
+	f = kcalloc(MAX_PERF_LEVEL + 1, sizeof(*f), GFP_KERNEL);
+
+	if (!f)
+		return -ENOMEM;
+
+	clk_calc_mnd(parent_rate, rate, f);
+
+	return clk_rcg2_configure_gp(rcg, f);
+}
+
 static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
 				   unsigned long parent_rate)
 {
@@ -645,6 +784,17 @@ const struct clk_ops clk_rcg2_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
+const struct clk_ops clk_rcg2_gp_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.determine_rate = clk_rcg2_determine_gp_rate,
+	.set_rate = clk_rcg2_set_gp_rate,
+	.get_duty_cycle = clk_rcg2_get_duty_cycle,
+	.set_duty_cycle = clk_rcg2_set_duty_cycle,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_gp_ops);
+
 const struct clk_ops clk_rcg2_floor_ops = {
 	.is_enabled = clk_rcg2_is_enabled,
 	.get_parent = clk_rcg2_get_parent,
diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 8d61d5a31542..1fb617b0ee47 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -291,18 +291,9 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
  * See comment in gcc-mam8916.c at ftbl_gcc_gp1_3_clk.
  */
 static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
-	F(10000,   P_BI_TCXO,    16,  1, 120),
-	F(20000,   P_BI_TCXO,    16,  1, 60),
-	F(100000,  P_BI_TCXO,    16,  1,  12),
-	F(500000,  P_GPLL0_OUT_EVEN, 12, 1, 100),
-	F(1000000, P_GPLL0_OUT_EVEN, 12, 1, 50),
-	F(2500000, P_GPLL0_OUT_EVEN, 12, 1, 10),
-	F(5000000, P_GPLL0_OUT_EVEN, 12, 1, 5),
 	F(19200000, P_BI_TCXO, 1, 0, 0),
-	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
-	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
-	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
-	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_EVEN, 1, 0, 0),
+	F(600000000, P_GPLL0_OUT_MAIN, 1, 0, 0),
 	{ }
 };
 
@@ -316,7 +307,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -330,7 +321,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
@@ -344,7 +335,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_gp_ops,
 	},
 };
 
diff --git a/drivers/pwm/pwm-clk.c b/drivers/pwm/pwm-clk.c
index c19a482d7e28..1bfc7870e3aa 100644
--- a/drivers/pwm/pwm-clk.c
+++ b/drivers/pwm/pwm-clk.c
@@ -25,6 +25,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/clk/clk-conf.h>
 #include <linux/pwm.h>
 
 struct pwm_clk_chip {
@@ -87,6 +88,10 @@ static int pwm_clk_probe(struct platform_device *pdev)
 	struct pwm_clk_chip *pcchip;
 	int ret;
 
+	ret = of_clk_set_defaults(pdev->dev.of_node, false);
+	if (ret < 0)
+		return -EINVAL;
+
 	chip = devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pcchip));
 	if (IS_ERR(chip))
 		return PTR_ERR(chip);

-- 
2.39.2

