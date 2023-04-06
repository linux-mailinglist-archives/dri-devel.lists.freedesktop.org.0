Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E1B6DA0A1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 21:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E192110E118;
	Thu,  6 Apr 2023 19:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3DE10E27A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 19:04:11 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-69f7c7cff1fso68720a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 12:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680807850; x=1683399850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MkEqUW/wdPs5b4/W/JSh6XQhMQ3aalNHTczsi6c4D04=;
 b=YYECXQNYlHighZyX+gtI9gNPfVFC+gOy5ImZXx7Uub4egWGs6SVdpEjnVM6Tprjpu6
 U71fo90ejXBIPzv+vQBYHN9XF8zbRHPQF5BBZ80AYsysTxrocx3gNnHCMEk4txdUsFqJ
 2CBVffTSnp+7ZfadxKFiWSYtecpABqx6xTmeLd5zeE1FNQvdzZWn5Kji3rztZ51xij1+
 SLIMV06r1KczjkrtR46i72qpyRWSxiOwcp8IG2hWE153OsJSXwoSHvNFK5LlCjH4mwhN
 r+u+GatH5wocC+BJg5lGy0I8Lsxsi9If0NkNqUSom6z+Ay23H+FbkuM2merAgS+1DYdt
 ENbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680807850; x=1683399850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MkEqUW/wdPs5b4/W/JSh6XQhMQ3aalNHTczsi6c4D04=;
 b=OJEf8w0dlAKl2x4tfeqttaHZ/frtSEjEoEICOzpRbWAy+89SL9fQTmoZXb09FHtpTC
 tbE1CWcOgiA09yedARIProajextwuVq+Q15Ru54nS2yUdpoM2RfUMFCjY+iaZa0grT9J
 OaDNOuBqouYciLHPnP6m5n9FXFZSwBYvncwv300bbj7VQ3OARCLENHIlaezX51trmz/7
 Pl3yhr3x3/iuuf9ZUsEUlONGXujgT+8SVTuJreqRkYGajGD4VPj+ksmfx3RJg7eiFpV6
 e2gXiWSYUHmPQDMsZRRT7JBor2oS39ySCNMDDOcWH83+KnhE+NjZdLveyZJm9u5pp9It
 VB0Q==
X-Gm-Message-State: AAQBX9eOaud0H7liVSMPSrioI37gzHYrG05jffOMMkSUzR5a/gfg13gb
 5n6rjVdhih4OhaNmHZm92Qo=
X-Google-Smtp-Source: AKy350bSrwVeMUNiwDblDiK34mHS4MzckVyhRtbMqaYV1khvA13XphdOkcRXc+U3j+WVYmKG4jl6jg==
X-Received: by 2002:aca:b541:0:b0:38a:f7b7:d1b7 with SMTP id
 e62-20020acab541000000b0038af7b7d1b7mr2816722oif.4.1680807850238; 
 Thu, 06 Apr 2023 12:04:10 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:c4b0:ddac:a031:82c4])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056808150a00b0037832f60518sm986761oiw.14.2023.04.06.12.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 12:04:09 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2 2/2] drm: bridge: samsung-dsim: Implement support for
 clock/data polarity swap
Date: Thu,  6 Apr 2023 16:03:54 -0300
Message-Id: <20230406190354.1641352-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406190354.1641352-1-festevam@gmail.com>
References: <20230406190354.1641352-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
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
Changes since v1:
- Use 'drm: bridge: samsung-dsim:' as prefix (Jagan).
- Collected Jagan's Reviewed-by tag.

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

