Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376886FCE54
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 21:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C4B10E1AB;
	Tue,  9 May 2023 19:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286710E3B0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 19:11:27 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-19206edf84cso943123fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 12:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683659486; x=1686251486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zELyYYCze1nbjTtSk7q81x5cZykfsQ2b/WZzy8BWGgc=;
 b=UAupvrpRr+8b2qBjyfmWhCFjnh90mzA+bXw8oM3VcF7pm4OSShQzYLAX0k8kiNhyGw
 Nh5cr4phaEew88E5VB34rlI6U3n74gtqtR88s+3+HriVZdVGHXJRW55k6eiDbOPNyfU6
 udeoJoOQ2SmD3o9cdLSxmgAhf03/H60MiyUE3fSMMLZ05TyLNNv706cSMTq2+gQshtZi
 GLhsfBjOS3aqJT+40mIIRW1ZG+BnSQd9/gGLYBz2xHvJscrqTYN0KcRbbDOi8AWd9SwL
 lcQaWPCOwtKk+PxhGH7NjsWHXMaLdfLTDph3R09X4oYXy6fy0FQJyLSL/3bdEHJEqItT
 VJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683659486; x=1686251486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zELyYYCze1nbjTtSk7q81x5cZykfsQ2b/WZzy8BWGgc=;
 b=lc4SFIK4yd7r/69KCu8AKBRrJ8wxPjXPuvPBtocLH3Yvn2sfBQOVhcQJajbCVKfzYr
 WMm/4nmxM2HHKWPg3xCTdKEEdqeR4RwSwQG0T/zk6wY3D/q8CF5qP5R59TOfFofGuBFG
 BvDeHHaekdWObHK0gcBRfHkVjvI/1JMkqOksucO0/P7gDIyo+ltdUUwWFXVjfPCQVO52
 SkDzG9k0iiMABey2GQzp0iRq1QqZrO4NVeAN6nRBaNd7W6ulNtOyIQ8JjJkzVtKTQTZg
 wjzmUC6WKjOJZQY7N5G/9W5tVam5nji4DdQ1E6IxpdINs3LQ3/uG9hayqUqlL4Fv11f/
 cacA==
X-Gm-Message-State: AC+VfDx/jfKUUqbb2YZg33m3O+0T0Wkxy3tDcysf+TdsXWYMbOcaN24d
 2U30wbGbirq+xVnNWF87h88=
X-Google-Smtp-Source: ACHHUZ5rvxigYOa0vTbV3CMMwMTZwUdrfr8f25rOjVuOjspnYyt+Loykf1LbuxB5ia41TlGykMwvtg==
X-Received: by 2002:a05:6870:42cb:b0:192:5e53:2e64 with SMTP id
 z11-20020a05687042cb00b001925e532e64mr8965343oah.1.1683659486472; 
 Tue, 09 May 2023 12:11:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:70eb:d83f:a7c5:b735])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a05687004c100b00192843c21b9sm6358134oam.25.2023.05.09.12.11.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 12:11:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v3 2/2] drm: bridge: samsung-dsim: Implement support for
 clock/data polarity swap
Date: Tue,  9 May 2023 16:10:59 -0300
Message-Id: <20230509191059.3327960-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509191059.3327960-1-festevam@gmail.com>
References: <20230509191059.3327960-1-festevam@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Marek Vasut <marex@denx.de>

Implement support for DSI clock and data lane DN/DP polarity swap by
means of decoding 'lane-polarities' DT property. The controller does
support DN/DP swap of clock lane and all data lanes, the controller
does not support polarity swap of individual data lane bundles, add
a check which verifies all data lanes have the same polarity.

This has been validated on an imx8mm board that actually has the MIPI DSI
clock lanes inverted.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes since v2:
- None

 drivers/gpu/drm/bridge/samsung-dsim.c | 27 ++++++++++++++++++++++++++-
 include/drm/bridge/samsung-dsim.h     |  2 ++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..5791148e2da2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -183,6 +183,8 @@
 #define DSIM_AFC_CTL(x)			(((x) & 0x7) << 5)
 
 /* DSIM_PLLCTRL */
+#define DSIM_PLL_DPDNSWAP_CLK		(1 << 25)
+#define DSIM_PLL_DPDNSWAP_DAT		(1 << 24)
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			BIT(23)
 #define DSIM_PLL_P(x, offset)		((x) << (offset))
@@ -622,6 +624,11 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 		reg |= DSIM_FREQ_BAND(band);
 	}
 
+	if (dsi->swap_dn_dp_clk)
+		reg |= DSIM_PLL_DPDNSWAP_CLK;
+	if (dsi->swap_dn_dp_data)
+		reg |= DSIM_PLL_DPDNSWAP_DAT;
+
 	samsung_dsim_write(dsi, DSIM_PLLCTRL_REG, reg);
 
 	timeout = 1000;
@@ -1696,7 +1703,9 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
 	struct device_node *node = dev->of_node;
-	int ret;
+	u32 lane_polarities[5] = { 0 };
+	struct device_node *endpoint;
+	int i, nr_lanes, ret;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				       &dsi->pll_clk_rate);
@@ -1713,6 +1722,22 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 	if (ret < 0)
 		return ret;
 
+	endpoint = of_graph_get_endpoint_by_regs(node, 1, -1);
+	nr_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
+	if (nr_lanes > 0 && nr_lanes <= 4) {
+		/* Polarity 0 is clock lane, 1..4 are data lanes. */
+		of_property_read_u32_array(endpoint, "lane-polarities",
+					   lane_polarities, nr_lanes + 1);
+		for (i = 1; i <= nr_lanes; i++) {
+			if (lane_polarities[1] != lane_polarities[i])
+				DRM_DEV_ERROR(dsi->dev, "Data lanes polarities do not match");
+		}
+		if (lane_polarities[0])
+			dsi->swap_dn_dp_clk = true;
+		if (lane_polarities[1])
+			dsi->swap_dn_dp_data = true;
+	}
+
 	return 0;
 }
 
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index ba5484de2b30..6a37d1e079bf 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -95,6 +95,8 @@ struct samsung_dsim {
 	u32 mode_flags;
 	u32 format;
 
+	bool swap_dn_dp_clk;
+	bool swap_dn_dp_data;
 	int state;
 	struct drm_property *brightness;
 	struct completion completed;
-- 
2.34.1

