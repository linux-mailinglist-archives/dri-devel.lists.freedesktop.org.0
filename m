Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54062711E43
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FC710E79C;
	Fri, 26 May 2023 03:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7EF10E795
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:06:14 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-775ebe161c5so36749539f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 20:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685070373; x=1687662373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4m+SxN0F0Y0gWSy4hAB1qq6hSK5gmQVgTqdKocNkWU=;
 b=G1+4wtnmneykm0K9b15UIaGEHefo++3tYOvy4KDpO0mPXGGmTm3ssccTpYpL1czgTP
 gjYAvksSX14t7webtghb/eVRD9Uo3MHm5AZ2oRmb6aJReJLafMSZjYRz+mb6Q++ADstk
 WkXiT/Khi4NtMFg8/jZ3A34BKnpsrazY3gU5SyEtQfWpGsGFHhhngAYoGlWeN5NOgDYn
 GjRiSo0L/7lQsH6aSCuH0KLb5C+J3KzynHTaRmkVI+sJnktZFTN1PYwFdRBgB9tYnZDC
 ZPTGU16O+b6e2nR4lLpJW4NeTu0ugd0oTdrfGAXB75twYltBpJHSSP+RkqYhOkA0OKC/
 3vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685070373; x=1687662373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t4m+SxN0F0Y0gWSy4hAB1qq6hSK5gmQVgTqdKocNkWU=;
 b=bRH+1NJMBA1MvKzcOf7M5f3EgOWeD8e4hPHsjfJ8CIwGBbbw23NLxGhTPJDN+PGzM7
 Zt50o5zm/hTA4eECuVSp1gjdogppzbQWiJm51uok6u58QC5Rlh4cFJWY2qYnpMXZtvJ0
 uG7NnK90ZS0I3PQ5bcqT9JVLwFOU3KozH9GC6wsLcEIrYiOBO1+m4pUiVOYckoReFexA
 t6Ck7eMBl4oxc7NizVcZ3SQx7F9ZKj2WePBJTdtSaJKXxvn784PliRkSksdpO8594IGY
 4W2x0dLVMqhGHMp72HWy8kJV9VkzWqzvOCHX8sitiXP4xQFG57pS72TRVtp9+nLnUesa
 Pssw==
X-Gm-Message-State: AC+VfDzXQIkdGMsGih7kjb/1XD2L7KpqSKScN1rWKtRqjwnzLTezesfn
 teWIXfrEGi+ZVPMhpI536fmowtwO0bU=
X-Google-Smtp-Source: ACHHUZ5HJkcQcD7QtO9eES+T8k3Crv2uiCgxRg2hT82XCPydi0MG+xerjTM7CtFCCYRzVQVpmA7bRQ==
X-Received: by 2002:a05:6602:180f:b0:76c:4db8:c1ea with SMTP id
 t15-20020a056602180f00b0076c4db8c1eamr119297ioh.10.1685070373034; 
 Thu, 25 May 2023 20:06:13 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:3dd9:3f6c:9922:6420])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a5e8502000000b007702f55116fsm363189ioj.38.2023.05.25.20.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 20:06:12 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V8 3/7] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Thu, 25 May 2023 22:05:55 -0500
Message-Id: <20230526030559.326566-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230526030559.326566-1-aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the pll-clock-frequency optional.  If it's present, use it
to maintain backwards compatibility with existing hardware.  If it
is absent, read clock rate of "sclk_mipi" to determine the rate.
Since it can be optional, change the message from an error to
dev_info.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ead922c3ce9f..307f1c20cfb9 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1719,11 +1719,11 @@ static const struct mipi_dsi_host_ops samsung_dsim_ops = {
 };
 
 static int samsung_dsim_of_read_u32(const struct device_node *np,
-				    const char *propname, u32 *out_value)
+				    const char *propname, u32 *out_value, bool optional)
 {
 	int ret = of_property_read_u32(np, propname, out_value);
 
-	if (ret < 0)
+	if (ret < 0 && !optional)
 		pr_err("%pOF: failed to get '%s' property\n", np, propname);
 
 	return ret;
@@ -1736,19 +1736,27 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 	u32 lane_polarities[5] = { 0 };
 	struct device_node *endpoint;
 	int i, nr_lanes, ret;
+	struct clk *pll_clk;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
-				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
+				       &dsi->pll_clk_rate, 1);
+	/* If it doesn't exist, read it from the clock instead of failing */
+	if (ret < 0) {
+		dev_dbg(dev, "Using sclk_mipi for pll clock frequency\n");
+		pll_clk = devm_clk_get(dev, "sclk_mipi");
+		if (!IS_ERR(pll_clk))
+			dsi->pll_clk_rate = clk_get_rate(pll_clk);
+		else
+			return PTR_ERR(pll_clk);
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
-				       &dsi->burst_clk_rate);
+				       &dsi->burst_clk_rate, 0);
 	if (ret < 0)
 		return ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
-				       &dsi->esc_clk_rate);
+				       &dsi->esc_clk_rate, 0);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

