Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56BE12D8BC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 14:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BE66E221;
	Tue, 31 Dec 2019 13:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B406E221
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 13:06:07 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q8so19732109pfh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 05:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILMGQ7TE10GrDN5X2gxz42T2rcYYzl5utH4bizVuaeo=;
 b=DZP420mWfQnfVWlE37Mc5cOgEn4j+vFTaGXmym5C2WWLC5bTeIa5rgJQwtNJNNGWDR
 ZJgOgh0rngjU/6G9BK3E3+O2++mKx/KQxUcIUXPxIuQhz49olxOhu3BbifgeNYXlHOzT
 HON9n6PvwA76fYj2xGIJjx5+TNJ9pAfTXsZec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILMGQ7TE10GrDN5X2gxz42T2rcYYzl5utH4bizVuaeo=;
 b=hSZEpt0hz1pz4Q1w3thi41Er+wa/OyuZDJ+RUYdWuxbSYuyzog4HzCRMT1yebVtoNG
 ba6f5ioBQ9DJjDQw3WxWuzYfyE6duRHKvki/kT+utalfe1KSFROnhRS5nQQFE2BXfp+u
 j5sHPqWsHnmT9oj15RlQNisbW+a2BARpBsjXhFgM7Us/co1RluxjEM0GEVuDuzwr2hGb
 V8eP6GVUDF2odTUvV85mdf3j/0ekTz7hdSrAtDuxLKw5r9JRBd/JSUjRsnKUp9JEu/y2
 RUsHsUIz+HOAc3pabZzzllXvPKMkxfANUADPF0VO/zzwNDGwQpigFNLLfo8FaADFFfHz
 eiXg==
X-Gm-Message-State: APjAAAVcPGuil08iEos5ewR1YV8lt08TjYpl+zH+q1ijhIBEY0soRsb9
 Fzym8xIg0WTOTOHHHJDfLjl5oQ==
X-Google-Smtp-Source: APXvYqzYR9X9eEbz3QVs9vCw1ydwxY3WYB9x7Vgfh8FcbAGgp7o5CF2hQkexzWnq4JrUkzJbcSw0Wg==
X-Received: by 2002:a63:d00f:: with SMTP id z15mr77454505pgf.143.1577797567531; 
 Tue, 31 Dec 2019 05:06:07 -0800 (PST)
Received: from localhost.localdomain ([49.206.202.115])
 by smtp.gmail.com with ESMTPSA id i3sm55204089pfg.94.2019.12.31.05.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 05:06:06 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 5/9] drm/sun4i: tcon_top: Register reset,
 clock gates in probe
Date: Tue, 31 Dec 2019 18:35:24 +0530
Message-Id: <20191231130528.20669-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20191231130528.20669-1-jagan@amarulasolutions.com>
References: <20191231130528.20669-1-jagan@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TCON TOP is processing clock gates and reset control for
TV0, TV1 and DSI channels during bind and release the same
during unbind component ops.

The usual DSI initialization would setup all controller
clocks along with DPHY clocking during probe.

Since the actual clock gates (along with DSI clock gate)
are initialized during ton top bind, the DPHY is failed to
get the DSI clock during that time.

To solve, this circular dependency move the reset control,
clock gate registration from bind to probe and release the
same from unbind to remove.

This eventually give a chance DPHY to initialize the DSI
clock gate.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- fixed comments from Chen-Yu
- move reset control methods into probe

 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 41 +++++++++++++-------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index e0b3c5330b9a..732ac19b4371 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -124,7 +124,22 @@ static struct clk_hw *sun8i_tcon_top_register_gate(struct device *dev,
 static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 			       void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
+	return 0;
+}
+
+static void sun8i_tcon_top_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops sun8i_tcon_top_ops = {
+	.bind	= sun8i_tcon_top_bind,
+	.unbind	= sun8i_tcon_top_unbind,
+};
+
+static int sun8i_tcon_top_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
 	struct clk_hw_onecell_data *clk_data;
 	struct sun8i_tcon_top *tcon_top;
 	const struct sun8i_tcon_top_quirks *quirks;
@@ -132,7 +147,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	void __iomem *regs;
 	int ret, i;
 
-	quirks = of_device_get_match_data(&pdev->dev);
+	quirks = of_device_get_match_data(dev);
 
 	tcon_top = devm_kzalloc(dev, sizeof(*tcon_top), GFP_KERNEL);
 	if (!tcon_top)
@@ -226,22 +241,21 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 
 	dev_set_drvdata(dev, tcon_top);
 
-	return 0;
+	return component_add(dev, &sun8i_tcon_top_ops);
 
 err_unregister_gates:
 	for (i = 0; i < CLK_NUM; i++)
 		if (!IS_ERR_OR_NULL(clk_data->hws[i]))
 			clk_hw_unregister_gate(clk_data->hws[i]);
-	clk_disable_unprepare(tcon_top->bus);
 err_assert_reset:
 	reset_control_assert(tcon_top->rst);
 
 	return ret;
 }
 
-static void sun8i_tcon_top_unbind(struct device *dev, struct device *master,
-				  void *data)
+static int sun8i_tcon_top_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct sun8i_tcon_top *tcon_top = dev_get_drvdata(dev);
 	struct clk_hw_onecell_data *clk_data = tcon_top->clk_data;
 	int i;
@@ -253,21 +267,8 @@ static void sun8i_tcon_top_unbind(struct device *dev, struct device *master,
 
 	clk_disable_unprepare(tcon_top->bus);
 	reset_control_assert(tcon_top->rst);
-}
-
-static const struct component_ops sun8i_tcon_top_ops = {
-	.bind	= sun8i_tcon_top_bind,
-	.unbind	= sun8i_tcon_top_unbind,
-};
-
-static int sun8i_tcon_top_probe(struct platform_device *pdev)
-{
-	return component_add(&pdev->dev, &sun8i_tcon_top_ops);
-}
 
-static int sun8i_tcon_top_remove(struct platform_device *pdev)
-{
-	component_del(&pdev->dev, &sun8i_tcon_top_ops);
+	component_del(dev, &sun8i_tcon_top_ops);
 
 	return 0;
 }
-- 
2.18.0.321.gffc6fa0e3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
