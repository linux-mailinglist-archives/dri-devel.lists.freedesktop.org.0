Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAB6F8D5B
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 03:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14E010E1A8;
	Sat,  6 May 2023 01:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558EE10E1A8
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 01:09:48 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-769a530a892so63004139f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 18:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683335387; x=1685927387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTiSL1E6bfKEz7pNSl/LOCS+aAX7CEY8nuEetNXUOd0=;
 b=XNSm9S3yxEqDtgpW+PtYDrH+DJNAy3X/F9EDt6v7lR98kuF5GyeTDsTsDfxW+QHDVz
 1DWJcUMWHd21Z306tMdW2vOBe4k3lI3ewyXdwm0M+sSzjCq1oyRX6npJA0mZ1u4R3iFo
 G23Kn06Dp1q6siu91Upy+i3oi+9bhIMe/co5t2+38YR3RtKfulQNMtmyj4y8w+RHNjmY
 Qxlg+axHdxdRviaJdvCi23VA/2+mb1e6O1+tZZ7ZCQN0q5+CAGOr+9mJL8ffLwuyGFs4
 WZzqaEi/XkJKG48gTVervfQM/+CxtSwtpGAveYCcO5Zxy4626BbtLkr3DlWEJsmGPN6h
 RK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683335387; x=1685927387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTiSL1E6bfKEz7pNSl/LOCS+aAX7CEY8nuEetNXUOd0=;
 b=X2pGEkh8gP2J2HG3KEWtrsXUWSd4gGDbTf8ByVgwMLqDkHTuOGRQbBqltTVMl7kRHy
 F08I8V1y5hQWsqIY2qIBI8GyZYpWAISbIhbIkLQ5pabx1GqCq+jvuC21cUoLBDgrRofr
 ggPzkjHakQDFJOvxywG7Ld+tY7BxmYXLyHWDAVM3lbB69nqa5KdJK3BxihfpcXbIRCrQ
 NWEObV8hxfKzL7ecAiX/InBiGh9MlclhEEZCqc1DKssv58IGatcqhZwZLT+ajnWyMATf
 VzOsX21PUQY9uqiDKWINtpWypKFlj08jMkAnqaJGRB4DrzCy2BN21HP+jJpD8jjhJf3Q
 0umA==
X-Gm-Message-State: AC+VfDw5A5jUdcTiuJGj8rTal7rftA/8Sk1IhqOSFWfQNLY7m3fPGX59
 AV119JJRcZa0ydkiU/J4Ll8NSVVW/+o=
X-Google-Smtp-Source: ACHHUZ79FwdiStBs1hly8eBBDkqB3tmEz9lbnHRpuDggMLN9t9sHyOSprIcnfTHCVjSXejEPMTm3AA==
X-Received: by 2002:a5d:9610:0:b0:763:8319:da01 with SMTP id
 w16-20020a5d9610000000b007638319da01mr1797755iol.5.1683335386866; 
 Fri, 05 May 2023 18:09:46 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:34a2:3894:45cc:c002])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5e950b000000b00760ed929d0bsm335735ioj.2.2023.05.05.18.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 18:09:46 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
Date: Fri,  5 May 2023 20:09:30 -0500
Message-Id: <20230506010933.170939-4-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230506010933.170939-1-aford173@gmail.com>
References: <20230506010933.170939-1-aford173@gmail.com>
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

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bf4b33d2de76..2dc02a9e37c0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1726,12 +1726,20 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
+	struct clk *pll_clk;
 	int ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				       &dsi->pll_clk_rate);
-	if (ret < 0)
-		return ret;
+
+	/* If it doesn't exist, read it from the clock instead of failing */
+	if (ret < 0) {
+		pll_clk = devm_clk_get(dev, "sclk_mipi");
+		if (!IS_ERR(pll_clk))
+			dsi->pll_clk_rate = clk_get_rate(pll_clk);
+		else
+			return PTR_ERR(pll_clk);
+	}
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				       &dsi->burst_clk_rate);
-- 
2.39.2

