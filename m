Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DC96E30AE
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7AE710E0C9;
	Sat, 15 Apr 2023 10:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB8410E0B6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:41:20 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-76073fb4511so43234639f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555279; x=1684147279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kmntWpj6jP3zgjyFhcaEHunbjz6jl27uym42Yw7yqu8=;
 b=OTI5anciovy+M1VMrYZU1itc+2zkRp5DYwYEQay8ttnHEIKbP7jOpC1gsfgNfV+vje
 +G8E6KtQ+tG6+oEaq3yHmmO07tm3smwptmIUTLFJjCX4iif+EKwtzRyZom3NXYfOZtKv
 q3i8J+UD5evCeOrpmjl/Vca8mYJNZk1F+wEp6TT4FuSa+C6ewErLul+wE/aQHxRIPxfe
 feY3zw9wNN0g+QsQnGXf0pPMcyGHuIWKZ1dN/VLeR/+cSY6yJCLwZddAfW9vycYe0IeO
 jmmYFDpJTC9kRDQoghuoGeDgMjr3/u5Np+SwuLi3KP7s99qtB1I1lBv8W/EUfFrsidhf
 JJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555279; x=1684147279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kmntWpj6jP3zgjyFhcaEHunbjz6jl27uym42Yw7yqu8=;
 b=Om0tCS2fndJiilFN2atkll7rD0TKdTSp5CwDUUlMPL8u4YVUV5TVPwyvqOvmZ8qIla
 twt5pb1lFbY72LBPOO94uYVXoqOxX+nmaKCaWeP6mqcKXZ8QlJL2Cg6PxW5hKpnDgRMt
 65l3/D4EahOk1U0N9qcvqsGYT/MhwgWpOq0iOp/+g8fcEYALsii0KNk92t6vUPCXBya7
 oaLbg0Zed7AElJ2luUfzR4nAhpneSfL4p2oHjJAB/UtzynlOjl1YIxElTy+4F+fZFtdT
 1K3UlZGwOmrw8aGzjteZIUcibD3I9ElgzXqFRzT0VLbRYJN3Snmc9uWD/SfkEYScwskU
 0SUw==
X-Gm-Message-State: AAQBX9dzwiC25uoKaRT7E8Bn/WYw+u5fI3bmMuClhDjf9IGcCvmKdAGc
 Ak166bEwym6RWl7PR0M0ETjoeOfruwXD3g==
X-Google-Smtp-Source: AKy350ayS6i4RghyIc+M6inuQv9IS4zgwE+8h2GAFI+nvRgtrERdR90ywrSJGsJfVAO9nTyuFzQ/fQ==
X-Received: by 2002:a92:da4f:0:b0:329:67e2:e360 with SMTP id
 p15-20020a92da4f000000b0032967e2e360mr5260428ilq.31.1681555279322; 
 Sat, 15 Apr 2023 03:41:19 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:40bb:6fe6:ddbc:cc9a])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a056638440b00b0040b38102b79sm246536jab.82.2023.04.15.03.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:41:18 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Sat, 15 Apr 2023 05:41:00 -0500
Message-Id: <20230415104104.5537-3-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230415104104.5537-1-aford173@gmail.com>
References: <20230415104104.5537-1-aford173@gmail.com>
MIME-Version: 1.0
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
having an entry in the device tree for samsung,pll-clock-frequency.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9fec32b44e05..73f0c3fbbdf5 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 	struct device_node *node = dev->of_node;
 	int ret;
 
-	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
-				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
-
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				       &dsi->burst_clk_rate);
 	if (ret < 0)
@@ -1823,13 +1818,18 @@ int samsung_dsim_probe(struct platform_device *pdev)
 		if (IS_ERR(dsi->clks[i])) {
 			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
 				dsi->clks[i] = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
-				if (!IS_ERR(dsi->clks[i]))
+				if (!IS_ERR(dsi->clks[i])) {
+					dsi->pll_clk_rate = clk_get_rate(dsi->clks[i]);
 					continue;
+				}
 			}
 
 			dev_info(dev, "failed to get the clock: %s\n", clk_names[i]);
 			return PTR_ERR(dsi->clks[i]);
 		}
+
+		if (strcmp(clk_names[i], "sclk_mipi") == 0)
+			dsi->pll_clk_rate = clk_get_rate(dsi->clks[i]);
 	}
 
 	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.39.2

