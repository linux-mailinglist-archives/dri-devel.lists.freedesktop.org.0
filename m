Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310FA86FAC0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 08:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1E10FDA7;
	Mon,  4 Mar 2024 07:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oltmanns.dev header.i=@oltmanns.dev header.b="YeMV72ad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5810FDA7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 07:30:10 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Tp9ML5Yrfz9t2n;
 Mon,  4 Mar 2024 08:30:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1709537406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mnGPlwQbxgYzC8CJbOlihTimeXPqyx+4nw1QX4Qc3a4=;
 b=YeMV72adDA3ovCNfkGgcelTnSDFkmPEFqbbyQEx8XPg9qoNpmoAdcLxRlii7IVxjbPCbYR
 AaVv5ibjU3FKZf5zo4YCEw5S/W37qluQZpo29E/i4ncIWE3p12RzACQerHb+MzHiyY/dGn
 6GV2LZQ0jj/V6TmnYrShwjTcZ4BQ28K10YDdl5G+Etd5U/+1LLLtRLP2nL5y4dlF/9SrzZ
 Y7PfuwrQCgOGc+a+xNqonkactQB7kcwl9J7zil+D8vzA3AlsXj5xsRw/KxklkTA+3pbF44
 XVv3bD1Ru//306dp12fS+qHv2KShsbrm7vW7pVmMu7o4RcX1uc5MklGRUNDlyA==
From: Frank Oltmanns <frank@oltmanns.dev>
Date: Mon, 04 Mar 2024 08:29:17 +0100
Subject: [PATCH v3 1/5] clk: sunxi-ng: common: Support minimum and maximum rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pinephone-pll-fixes-v3-1-94ab828f269a@oltmanns.dev>
References: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
In-Reply-To: <20240304-pinephone-pll-fixes-v3-0-94ab828f269a@oltmanns.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460; i=frank@oltmanns.dev;
 h=from:subject:message-id; bh=IgKKqgNhp4KB//qmzijjif4cj92H3twV7OcBpE9KPnQ=;
 b=owEB7QES/pANAwAIAZppogiUStPHAcsmYgBl5XhwllXkjTz+CPi39L+nSvOMTVguM6U40A16z
 a6r/JmMQyiJAbMEAAEIAB0WIQQC/SV7f5DmuaVET5aaaaIIlErTxwUCZeV4cAAKCRCaaaIIlErT
 x+6VC/wKGTYAgaNwasNsccW5LE4ekOaeCHb2E2E6k6v84qe1/t/Vgg6L2c1n30zckB4Vftb7RuA
 Bae3m6mB70PtKIgWPaujYgLN85otFzOKe5lYrkiF4EDPaqLlRHLz/NmkzLM7wQLEtlC+Febu8yF
 QjrW9TlhvxBQvlc71zbzrk97gsxMpnWN47eu4O5pW1BNbCKrWeytELPymhVUhp6VxwDMUywXFqR
 TRf5Irleb8KdyEKiwQv2VtF59tu0QDjjiiwsnsPzcPsNHzfiLEmiXEb2ToD5gnegCcbxG0/HEjh
 3if/2LS8QQ+vJuSIJBLhB4Ey3UnvHNz1syeRFYTwOD/muEUZsqtG+cEqy3zLjoGxkLCFQZ+EX4n
 /ToemlOq0q9cqL9Fgz5KEwfXuiN8jpjBCLnZVmyU8RTuxWKbOImC+Xskxvcu1ZsD+yLABXTSutv
 cHjqb0RXfA0eIgTBtkp16EVP/WTk9DmBC3nz8OhtbYK1KaxCsnVEDGV2PFYiPecpn7dm0=
X-Developer-Key: i=frank@oltmanns.dev; a=openpgp;
 fpr=02FD257B7F90E6B9A5444F969A69A208944AD3C7
X-Rspamd-Queue-Id: 4Tp9ML5Yrfz9t2n
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
 drivers/clk/sunxi-ng/ccu_common.c | 15 +++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 8babce55302f..2152063eee16 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -44,6 +44,12 @@ bool ccu_is_better_rate(struct ccu_common *common,
 			unsigned long current_rate,
 			unsigned long best_rate)
 {
+	if (common->max_rate && current_rate > common->max_rate)
+		return false;
+
+	if (common->min_rate && current_rate < common->min_rate)
+		return false;
+
 	if (common->features & CCU_FEATURE_CLOSEST_RATE)
 		return abs(current_rate - target_rate) < abs(best_rate - target_rate);
 
@@ -122,7 +128,10 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 
 	for (i = 0; i < desc->hw_clks->num ; i++) {
 		struct clk_hw *hw = desc->hw_clks->hws[i];
+		struct ccu_common *common = hw_to_ccu_common(hw);
 		const char *name;
+		unsigned long min_rate = 0;
+		unsigned long max_rate = ULONG_MAX;
 
 		if (!hw)
 			continue;
@@ -136,6 +145,12 @@ static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			pr_err("Couldn't register clock %d - %s\n", i, name);
 			goto err_clk_unreg;
 		}
+
+		if (common->min_rate)
+			min_rate = common->min_rate;
+		if (common->max_rate)
+			max_rate = common->max_rate;
+		clk_hw_set_rate_range(hw, min_rate, max_rate);
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

