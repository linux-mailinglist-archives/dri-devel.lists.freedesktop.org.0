Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE1978362
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85510ECF3;
	Fri, 13 Sep 2024 15:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gehvY38v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BE910ECF3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 15:08:17 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5c260b19f71so2563161a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726240095; x=1726844895; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=17HIqgHEbThobLns0AtRzm3Gh6YORVy/AgMlLUCbkoU=;
 b=gehvY38vKdekqzgR6ybI5yEiNjIa+GyKL+bSdXWuQGHXPIu0vCCNRbrSIV00000qoS
 FPs6IzMggLZk3dqNJAR8rXxOcqwihYtnTGVbVagh/4yjaqNOWBkAqWdAOFm9S2LfPmBn
 1i6ke0BQiAZcu3II93fuBCuzxwow4RRXuCdZYU0iV5z7Qw/7Ml3Z4/mi8HuQYW/MgXmc
 qrJdqgzwwHooQ58dLtR+Yd/z1eFX1IeJ9EBOqWbuPdXWycT90KrdFGx3K1HjENqBWMyF
 u2+2DqnE05+ISF0OkehW+gtccgRyWkOjo9beUVbrBjYKShJr0lbS8FGOpfEbkqHRb1ar
 QW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726240095; x=1726844895;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17HIqgHEbThobLns0AtRzm3Gh6YORVy/AgMlLUCbkoU=;
 b=DV7VRwofdM+kpO04sWRdG1wxFOulxQOmo7i7zhBPsxNUbUERluDSm76YI0Fshb6GiM
 4SPWpb6aCHUkPnCnMMUqWTtazes374xg/vuJ4i2DLB+ftHxsRuP5AIG3F2ORItRVP5+K
 5H3Sds98W31IlZ3VfrWq05nOOAeFvboScV778Uu/LVU0l5ifce7y+4+GAtkxDkFnXT7D
 2P91UzrANxsnNPATMbejVxk82lfgBAYP0Tl5oWUtfKITAUCSgqnDVdEkrjWdzUwvudbY
 uWXhCAuBW9MWRFNTcFszkqHYE34U25KOoIODdL2kMelHHeA+nZEOYKT7tPjmhtFzob0L
 CFyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUitn+YuN0xVMYGetg3w2timQrSGNfUar5bnTnpjiwIysF8mmD0J00KeeTnGlKSC7CpQKVlVO95idc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyquMuIu/NWx4ydtMrrElKhVW74LCL+uw7HxaFangXrS8WdUzrW
 iEIlA4JVUO/Dp6NOQmRrvaJFhRPp5nROaOWWjryBfntxU09wOE7l
X-Google-Smtp-Source: AGHT+IFDbC8+nUawUMDJPpP2JLghGCONKzB2EfXKphKzb7uTXnNY8L/6PXyI8AxG1Fm4mo7AugZ4Sw==
X-Received: by 2002:a05:6402:321c:b0:5c2:7699:fb6f with SMTP id
 4fb4d7f45d1cf-5c413e1fd66mr5471806a12.15.1726240095178; 
 Fri, 13 Sep 2024 08:08:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.127.153.210])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd523b4sm7774318a12.51.2024.09.13.08.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 08:08:14 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 13 Sep 2024 18:07:45 +0300
Subject: [PATCH v4 02/27] clk: qcom: clk-rcg2: name refactoring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240913-starqltechn_integration_upstream-v4-2-2d2efd5c5877@gmail.com>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Simona Vetter <simona@ffwll.ch>, cros-qcom-dts-watchers@chromium.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726240085; l=5100;
 i=dsankouski@gmail.com; s=20240618; h=from:subject:message-id;
 bh=F7p2yDZX6Sya67BXEAuRzruxuOCCYpvbHrlwx0Qk5Xw=;
 b=H2NvLNTPj7u92aGj5k/qH9fs4vwopERJbMgTGRwgJ7VcGSb9+DZpGWgBeVZEvfQyJmUe/SAq0
 RNfeeA23vU6Bl7I5B+F13MmTD7sKXj57kJp1Kabm5UJBCEfzvlNmWF0
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=6pMMVVDDReSiRgPCbMOUauN5nS3ty4Sf5b7a2gi4x0M=
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

clk-rcg2.c uses 2 variable names for pre divisor register value:
pre_div and hid_div.

Replace hid_div with pre_div. Update calc_rate docs to reflect, that
pre_div is not pure divisor, but a register value, and requires conversion.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 51 ++++++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f00..df491540ef39 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -153,13 +153,20 @@ static int clk_rcg2_set_parent(struct clk_hw *hw, u8 index)
  *
  *          parent_rate     m
  *   rate = ----------- x  ---
- *            hid_div       n
+ *          pre_div_pure    n
+ *
+ * @param rate - Parent rate.
+ * @param m - Multiplier.
+ * @param n - Divisor.
+ * @param mode - Use zero to ignore m/n calculation.
+ * @param pre_div - Pre divisor register value. Pure pre divisor value
+ *                  related to pre_div as pre_div_pure = (pre_div + 1) / 2
  */
 static unsigned long
-calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 hid_div)
+calc_rate(unsigned long rate, u32 m, u32 n, u32 mode, u32 pre_div)
 {
-	if (hid_div)
-		rate = mult_frac(rate, 2, hid_div + 1);
+	if (pre_div)
+		rate = mult_frac(rate, 2, pre_div + 1);
 
 	if (mode)
 		rate = mult_frac(rate, m, n);
@@ -171,7 +178,7 @@ static unsigned long
 __clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate, u32 cfg)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
-	u32 hid_div, m = 0, n = 0, mode = 0, mask;
+	u32 pre_div, m = 0, n = 0, mode = 0, mask;
 
 	if (rcg->mnd_width) {
 		mask = BIT(rcg->mnd_width) - 1;
@@ -186,10 +193,10 @@ __clk_rcg2_recalc_rate(struct clk_hw *hw, unsigned long parent_rate, u32 cfg)
 	}
 
 	mask = BIT(rcg->hid_width) - 1;
-	hid_div = cfg >> CFG_SRC_DIV_SHIFT;
-	hid_div &= mask;
+	pre_div = cfg >> CFG_SRC_DIV_SHIFT;
+	pre_div &= mask;
 
-	return calc_rate(parent_rate, m, n, mode, hid_div);
+	return calc_rate(parent_rate, m, n, mode, pre_div);
 }
 
 static unsigned long
@@ -715,7 +722,7 @@ static int clk_edp_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 	s64 src_rate = parent_rate;
 	s64 request;
 	u32 mask = BIT(rcg->hid_width) - 1;
-	u32 hid_div;
+	u32 pre_div;
 
 	if (src_rate == 810000000)
 		frac = frac_table_810m;
@@ -731,8 +738,8 @@ static int clk_edp_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 			continue;
 
 		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
-		f.pre_div = hid_div;
+				&pre_div);
+		f.pre_div = pre_div;
 		f.pre_div >>= CFG_SRC_DIV_SHIFT;
 		f.pre_div &= mask;
 		f.m = frac->num;
@@ -760,7 +767,7 @@ static int clk_edp_pixel_determine_rate(struct clk_hw *hw,
 	int delta = 100000;
 	s64 request;
 	u32 mask = BIT(rcg->hid_width) - 1;
-	u32 hid_div;
+	u32 pre_div;
 	int index = qcom_find_src_index(hw, rcg->parent_map, f->src);
 
 	/* Force the correct parent */
@@ -781,13 +788,13 @@ static int clk_edp_pixel_determine_rate(struct clk_hw *hw,
 			continue;
 
 		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
-		hid_div >>= CFG_SRC_DIV_SHIFT;
-		hid_div &= mask;
+				&pre_div);
+		pre_div >>= CFG_SRC_DIV_SHIFT;
+		pre_div &= mask;
 
 		req->rate = calc_rate(req->best_parent_rate,
 				      frac->num, frac->den,
-				      !!frac->den, hid_div);
+				      !!frac->den, pre_div);
 		return 0;
 	}
 
@@ -974,7 +981,7 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long request;
 	int delta = 100000;
 	u32 mask = BIT(rcg->hid_width) - 1;
-	u32 hid_div, cfg;
+	u32 pre_div, cfg;
 	int i, num_parents = clk_hw_get_num_parents(hw);
 
 	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
@@ -995,8 +1002,8 @@ static int clk_pixel_set_rate(struct clk_hw *hw, unsigned long rate,
 			continue;
 
 		regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG,
-				&hid_div);
-		f.pre_div = hid_div;
+				&pre_div);
+		f.pre_div = pre_div;
 		f.pre_div >>= CFG_SRC_DIV_SHIFT;
 		f.pre_div &= mask;
 		f.m = frac->num;
@@ -1564,7 +1571,7 @@ static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	struct freq_tbl f = { 0 };
 	u32 mask = BIT(rcg->hid_width) - 1;
-	u32 hid_div, cfg;
+	u32 pre_div, cfg;
 	int i, num_parents = clk_hw_get_num_parents(hw);
 	unsigned long num, den;
 
@@ -1576,7 +1583,7 @@ static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 
 	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
-	hid_div = cfg;
+	pre_div = cfg;
 	cfg &= CFG_SRC_SEL_MASK;
 	cfg >>= CFG_SRC_SEL_SHIFT;
 
@@ -1587,7 +1594,7 @@ static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
 		}
 	}
 
-	f.pre_div = hid_div;
+	f.pre_div = pre_div;
 	f.pre_div >>= CFG_SRC_DIV_SHIFT;
 	f.pre_div &= mask;
 

-- 
2.39.2

