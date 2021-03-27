Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4734B66B
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 12:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6B6E424;
	Sat, 27 Mar 2021 11:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D37D6E3E3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 11:03:13 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id 12so1127748lfq.13
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=821JPadqceS+s/0RcZV8FtCTa+nAVDnEcGJf+djq6mQ=;
 b=npIsBaY3sU7Mr4s72ru0F/USbmW/sqXdFE28eIzij/ipeEl7r+TuzEYlxafAM4nhNr
 bajNwD8tluV0eCPf8hxSvPJKyJomuGRHSbFJdliulvG0opI3tMJXOphCd+0SaLe7P+G0
 QL8MtSMbEiFoEEiKxSJGQxsGijjRV/eyfLXP/0GeFn8y+EBpW6wm/0YV7Pqc9s7IqFar
 vxsNfvsZ29wp18vmnds1/X0ClgNEdtyT89MmP41obAs0ECFKkPQIX//XROP50a2/XZ2T
 3yYiBXL/YHPkobmUaShWaHJKrBiiadXoEjWI7WvGnfoJNX0TRKVq1w4KTs00i0UUYhv6
 klDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=821JPadqceS+s/0RcZV8FtCTa+nAVDnEcGJf+djq6mQ=;
 b=pXKr3Y5VI8T4gIAfHQB9TG+b3Q3AfLsUolqAvCgt8gcj9VJoLEEhO3X8ElFrH5siVL
 2h9xUoo1Wp5ZnNCSd3bUg5orhZa7KGhgNJFoBcIJw152UjJdcx93KkBzP5pLWA4WNYg7
 pImR8+UKJxJH827OEvXvek7k8uigzKf8Rg9XH1y6t4aXGofliUamo2UbPZUIfdGpD6ZA
 n3Qmj/6WpA3GCf5Odkmj0RgHqomR7tBGRSNYWhpeW1iorx7JCMeC69XpfCTXs746DAey
 y8lbhkGYEfIsmsOc91//AWjZ/xTPnxtjiykIxs6aNiCtJIIbFOVG1pf9uTtD2bCp5z5B
 FaMQ==
X-Gm-Message-State: AOAM533cp3mF+3jlROljCHnxx0dfQdSTlwmABsrwUbkwdwJtbmmUewZd
 J3kw5Vh3gWKmtZLxPJbXnLIbMg==
X-Google-Smtp-Source: ABdhPJzcQNTnymZds/VNl4DYZ1qZoGyLcC8/xJRrpDSS+RMUG4IU064W1LZj9TKHDl7MzfoE60tkzw==
X-Received: by 2002:ac2:47ef:: with SMTP id b15mr10544704lfp.615.1616842991985; 
 Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a8sm1513801ljn.96.2021.03.27.04.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 04:03:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v3 01/25] clk: fixed: add devm helper for
 clk_hw_register_fixed_factor()
Date: Sat, 27 Mar 2021 14:02:41 +0300
Message-Id: <20210327110305.3289784-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Daniel Palmer <daniel@0x0f.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Palmer <daniel@0x0f.com>

Add a devm helper for clk_hw_register_fixed_factor() so that drivers that internally
register fixed factor clocks for things like dividers don't need to manually unregister
them on remove or if probe fails.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Link: https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/clk-fixed-factor.c | 39 ++++++++++++++++++++++++++++------
 include/linux/clk-provider.h   |  4 +++-
 2 files changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 910e6e74ae90..4f7bf3929d6d 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -64,10 +64,16 @@ const struct clk_ops clk_fixed_factor_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_fixed_factor_ops);
 
+static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *res)
+{
+	clk_hw_unregister_fixed_factor(&((struct clk_fixed_factor *)res)->hw);
+}
+
 static struct clk_hw *
 __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 		const char *name, const char *parent_name, int index,
-		unsigned long flags, unsigned int mult, unsigned int div)
+		unsigned long flags, unsigned int mult, unsigned int div,
+		bool devm)
 {
 	struct clk_fixed_factor *fix;
 	struct clk_init_data init = { };
@@ -75,7 +81,15 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	struct clk_hw *hw;
 	int ret;
 
-	fix = kmalloc(sizeof(*fix), GFP_KERNEL);
+	/* You can't use devm without a dev */
+	if (devm && !dev)
+		return ERR_PTR(-EINVAL);
+
+	if (devm)
+		fix = devres_alloc(devm_clk_hw_register_fixed_factor_release,
+				sizeof(*fix), GFP_KERNEL);
+	else
+		fix = kmalloc(sizeof(*fix), GFP_KERNEL);
 	if (!fix)
 		return ERR_PTR(-ENOMEM);
 
@@ -99,9 +113,13 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
 	else
 		ret = of_clk_hw_register(np, hw);
 	if (ret) {
-		kfree(fix);
+		if (devm)
+			devres_free(fix);
+		else
+			kfree(fix);
 		hw = ERR_PTR(ret);
-	}
+	} else if (devm)
+		devres_add(dev, fix);
 
 	return hw;
 }
@@ -111,7 +129,7 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		unsigned int mult, unsigned int div)
 {
 	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
-					      flags, mult, div);
+					      flags, mult, div, false);
 }
 EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
 
@@ -153,6 +171,15 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister_fixed_factor);
 
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div)
+{
+	return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
+			flags, mult, div, true);
+}
+EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
+
 #ifdef CONFIG_OF
 static const struct of_device_id set_rate_parent_matches[] = {
 	{ .compatible = "allwinner,sun4i-a10-pll3-2x-clk" },
@@ -185,7 +212,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 		flags |= CLK_SET_RATE_PARENT;
 
 	hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, 0,
-					    flags, mult, div);
+					    flags, mult, div, false);
 	if (IS_ERR(hw)) {
 		/*
 		 * Clear OF_POPULATED flag so that clock registration can be
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e4316890661a..58f6fe866ae9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -941,7 +941,9 @@ struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		unsigned int mult, unsigned int div);
 void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
-
+struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
+		const char *name, const char *parent_name, unsigned long flags,
+		unsigned int mult, unsigned int div);
 /**
  * struct clk_fractional_divider - adjustable fractional divider clock
  *
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
