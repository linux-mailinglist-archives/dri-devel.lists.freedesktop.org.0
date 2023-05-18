Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85E1708C0A
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2146C10E574;
	Thu, 18 May 2023 23:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513D110E571
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 23:06:44 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3381e9ec12bso20452355ab.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 16:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684451203; x=1687043203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWvWiGJr56z9q9APTKrg8aD2bb2PPBSrUeKO9a/g3Js=;
 b=lA2Hqp+kdUMi3SHJQhTJWIgUTYRSIEEdfqnkzxCCwotAVtB/AxpD5T4O4WlqQfLSSc
 TNKqGHcYPppZs3tON5lhOhtGj/wqSExd/PoIrXZ6Bym/9wi+zX6lOH4uzTzzCd6851E5
 HaAHxOeBEDshdCjEWDYVVsMKwVuwYn/j7CDgHImKhsMH8QOMJ96BEVK+FhMgJop7gwpe
 zIhddlTDCY9YCP2Zymz1ScYcErRfvgyu9GKH8wCBtWsRhTVY9BMiE+1+kJUwEddCjTJg
 /SJMs1PB0B6d3vMfeUqyUvQa1m1BH82zfVJzmx869Qpv70W8Zqiv0Nq6Gz77x2EpsMVA
 qf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684451203; x=1687043203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWvWiGJr56z9q9APTKrg8aD2bb2PPBSrUeKO9a/g3Js=;
 b=AdyAn36iDMous0jpIWzINCISMurPXCS7NAreaL7SdXTt9w94pCnud84pLYmB7Kx9v6
 OX3mNfvF6ntcYaW5h56OBdPoRS7Yu8JXIPRWa7I0VhyV3WFt5MgdxxJFdP83sstlrLCm
 NWSdzFmefyjrydjXSAYs9H64bIHZz7gLYhfHRWJ3nKHziLRvcqx1y2ab5Rj/mGbZa0u2
 YHbsnSaAaJaZ7GG7Cf+Ul3loZQ7yLu4T739F53tuZM9cojLh454GY7x9wkOub/naGH2J
 3azmSzr6BZMjKyWoSMo5WXRNLV4zJ0n5Y5ksb630/d8N+/BhxAisV7JvkxX2V1U1dGw2
 kw4g==
X-Gm-Message-State: AC+VfDx3Ay3MPpKoScj3XefO4PCSXi1wa9tQZOeM5EKfV5WIr4RDeL2X
 P9Sb6fgMtynmBhvXN7dIHZJC3LiifQ4=
X-Google-Smtp-Source: ACHHUZ6UOA1UEJhODzAvIyiNHCg4anOQmr91WME3HC/ntTLIZIcCmlm6eZTphfApwiECNFz0oopiGA==
X-Received: by 2002:a92:d142:0:b0:334:9ab1:b3c3 with SMTP id
 t2-20020a92d142000000b003349ab1b3c3mr5243548ilg.19.1684451202844; 
 Thu, 18 May 2023 16:06:42 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:56b8:635c:4c7a:15b1])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92cd0c000000b003317ebbc426sm635897iln.47.2023.05.18.16.06.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 16:06:42 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Thu, 18 May 2023 18:06:23 -0500
Message-Id: <20230518230626.404068-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518230626.404068-1-aford173@gmail.com>
References: <20230518230626.404068-1-aford173@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
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
 drivers/gpu/drm/bridge/samsung-dsim.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bf4b33d2de76..6f012016068a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1712,11 +1712,11 @@ static const struct mipi_dsi_host_ops samsung_dsim_ops = {
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
@@ -1726,20 +1726,29 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
+	struct clk *pll_clk;
 	int ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
-				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
+				       &dsi->pll_clk_rate, 1);
+
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

