Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3201D8776F7
	for <lists+dri-devel@lfdr.de>; Sun, 10 Mar 2024 14:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D82A10E15B;
	Sun, 10 Mar 2024 13:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="jL1TKCmJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B3410E112
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Mar 2024 13:22:17 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Tt0tt2fVBz9sp0;
 Sun, 10 Mar 2024 14:22:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1710076934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iuVCUppc+ddFR8UUDWGyNuWRGBDXVACD/i0UBw2FfT0=;
 b=jL1TKCmJxkYKSofV18GqqZidtQ6dBS0RSdbNryORV2eglYdk8CpD9Nl6NSPIuMKvcba6gL
 VczhR8HuAoPuf57nciEQdJX7aGSHGaq0o4vzG1E4gd2EcTGF7kdpeyfIxpD1EB7ogSFbL3
 BbmtwgkbdDBOJQYXEmncAWexysEWh4SwpbhG1+QD0sMWZQSys4mMHxmkJZ653zRJivGHqW
 D9p4WWXPNh5uShxkZT1GxlQSZ/BP8hIZpiCm+Bn6K3EuYd9CA6NGdJh80SUt548YDQi7+b
 2a6GKhWXuOriRWixcOXSmJ45B0LDxVKC50YcSNotAN4hKJHSktMB1QZPJxKfbw==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Sun, 10 Mar 2024 14:21:11 +0100
Subject: [PATCH v4 1/5] clk: sunxi-ng: common: Support minimum and maximum rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240310-pinephone-pll-fixes-v4-1-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Frank Oltmanns <frank@oltmanns.dev>, stable@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=CqzJhF4o2XVhzVlKqVuKVOUwZQAnduWDJhne+0nY6oQ=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl7bP5kCr8X0Jr9HHd3T424gfP8km/HgWZfPQml
 DbUiRGKwIqJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZe2z+QAKCRCaaaIIlErT
 x06dDACAZf8e15F20tsk2AJ2y+vPgbtV7PitDHlG2/P3dLpBvPQ4GJAHi7ReDu+fsWJn/0bmkxO
 8u0uLux/EGhhpuxCa0o5NP0w9tzUvTo+1XYDZ9cAhXXbDkraBMnYff7BXutewjjbj8HjDXV6Z2p
 CrYYT/22bbb00DY0KVjqTHRWq5dDzyO8ymWvdkfG28vBpEeHYOoG/Zyp45EG6p2zf1Gqp0ew9Bz
 pPDqdYka3MQovp53e7GHFeOD8/0sVBvAXJGripG1awS/rVsT7Hq0GY6XKTVZNEY69+dR4u4mYgv
 qc/x+lx9MhMDvTfwv9MH72Y/yCIs1xJ1ulmUPS8rpdrO71f3lYJe7zBFYgLzsG0dyiFRBwNPIP0
 /EBfNGpeLQkenimONtJE9B/BrWWCs7C8OM22CNYbQVGKsIiH+JWW9xHU0WUJivrSr1nV4bqYE6A
 IyeFmD0oXLGrt/liRNxEWvMYOoM/xskY+oKeMve6o0RhihHV5ljc2jEHSb+6dxd5AreAE=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
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

The Allwinner SoC's typically have an upper and lower limit for their
clocks' rates. Up until now, support for that has been implemented
separately for each clock type.

Implement that functionality in the sunxi-ng's common part making use of
the CCF rate liming capabilities, so that it is available for all clock
types.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
Cc: stable@vger.kernel.org
---
 drivers/clk/sunxi-ng/ccu_common.c | 19 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 8babce55302f..ac0091b4ce24 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -44,6 +44,16 @@ bool ccu_is_better_rate(struct ccu_common *common,
 			unsigned long current_rate,
 			unsigned long best_rate)
 {
+	unsigned long min_rate, max_rate;
+
+	clk_hw_get_rate_range(&common->hw, &min_rate, &max_rate);
+
+	if (current_rate > max_rate)
+		return false;
+
+	if (current_rate < min_rate)
+		return false;
+
 	if (common->features & CCU_FEATURE_CLOSEST_RATE)
 		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
 
@@ -122,6 +132,7 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 
 	for (i = 0; i < desc->hw_clks->num ; i++) {
 		struct clk_hw *hw = desc->hw_clks->hws[i];
+		struct ccu_common *common = hw_to_ccu_common(hw);
 		const char *name;
 
 		if (!hw)
@@ -136,6 +147,14 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			pr_err("Couldn't register clock %d - %s\n", i, name);
 			goto err_clk_unreg;
 		}
+
+		if (common->max_rate)
+			clk_hw_set_rate_range(hw, common->min_rate,
+					      common->max_rate);
+		else
+			WARN(common->min_rate,
+			     "No max_rate, ignoring min_rate of clock %d - %s\n",
+			     i, name);
 	}
 
 	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index 942a72c09437..329734f8cf42 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -31,6 +31,9 @@ struct ccu_common {
 	u16		lock_reg;
 	u32		prediv;
 
+	unsigned long	min_rate;
+	unsigned long	max_rate;
+
 	unsigned long	features;
 	spinlock_t	*lock;
 	struct clk_hw	hw;

-- 
2.44.0

