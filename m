Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C68416F93C8
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 21:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0310E0D3;
	Sat,  6 May 2023 19:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B300E10E0D3
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 19:25:24 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-760f8ffb27fso67414639f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 May 2023 12:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683401123; x=1685993123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGf6Qk2Pei70JszeZYr/InGuWclnzPcF9rdeGDlmncY=;
 b=JLwKPoBSNRMUtTPYh7/CnJk9JmGEJ5tz3DzL9yMvjoqGGURAH5xCA4E3WtTxZguuTm
 Ds1vWVLs7AW5lNv3uQsEof/mdHS3H59aNxD7gBDSXRRA8+f1swi1NCAsZGHgo05t+4v3
 ac2zQUSAQcWNtGNKli2H8xwOa2SDUtbc7zHKjfyaJOR5ewgvVXymFUoyIinX7o/qvtLo
 VBjatTgTXT+dRpFPqjvG8XsZ+swa32UK8txY15LY+Y2vwVXkUuMoA/6RhOPhljU6MWmJ
 uBNWh8avyOfvZlxLF/fR7BMGPKoabDpQqf/jmdKRB06C2KaQ7sk/XmWYKIscoGOsUoWt
 O6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683401123; x=1685993123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mGf6Qk2Pei70JszeZYr/InGuWclnzPcF9rdeGDlmncY=;
 b=Zfg4C9OBMVDPFWTJlFJuwEvxsP1C3xOG/ACffZG7BDn+6Pxq1+gaMG8Mfu9vV/nR24
 b05r8Qdl65dQ+6x0XQlc+6ExkGKzQ+LWfM0uSe8W0xzwyiZ04ZaSpw/XvAUBHlJGEFdq
 8hdeQfKoZrMmDsVMDuoyIVHajO1apq7EcdPo+k6QUv+wdxW13lSdMSq6WTUPHX9l0xW2
 qSZCXy+29Kvr/eu7IzzPwougJRtO1At1LbiZseAZbHPQYvG5q6QOf9iX5fjptqD4pcvH
 ef4M2oMqiO/hikehzQjB/AYu0IdNQ1gRx4YMPTA6hYNPww+gUmAbIugidUc4K1u6JokE
 i8hA==
X-Gm-Message-State: AC+VfDwi1QfIH3rePihe+D/RkE1x8duvtnSLHTmkGDU1u9H+lIoRPdyz
 YoK4L0MuaT/7xE16gACMVgNtOUSyKAagpg==
X-Google-Smtp-Source: ACHHUZ7OI6Q6k4RbKjfIoaHz6zbC3YTaTSfFLXggOj9V7CFy7kWCWRvWIHiVgGHKdgWGH8konC7j5w==
X-Received: by 2002:a6b:e311:0:b0:769:b812:c536 with SMTP id
 u17-20020a6be311000000b00769b812c536mr3769889ioc.5.1683401123363; 
 Sat, 06 May 2023 12:25:23 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:5e49:1bed:79d0:5c25])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a05663822b200b0041631393ac9sm847824jas.18.2023.05.06.12.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 May 2023 12:25:22 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V5 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Sat,  6 May 2023 14:24:50 -0500
Message-Id: <20230506192453.725621-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506192453.725621-1-aford173@gmail.com>
References: <20230506192453.725621-1-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bf4b33d2de76..08266303c261 100644
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
+		dev_info(dev, "Using sclk_mipi for pll clock frequency\n");
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

