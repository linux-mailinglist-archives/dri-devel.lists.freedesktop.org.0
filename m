Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113426CEBEB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF410EAF6;
	Wed, 29 Mar 2023 14:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7169110EAF6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 14:42:49 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id w133so11743032oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680100968; x=1682692968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W3EukDY738uK8t5sI5cTKcLQTkVH6nf7vkK4CY7nzUE=;
 b=pisLy7kY9tfNIZwT7ISNjGBM/EpA9AYZBs0Ra5pslb9fY4Ql3VD7Xe13SaBijeN8qX
 d6OFgbxdFPdayZhW3Lxm7rbSRphAvcz6VGN4LljIzIjBht1bLJM6JYPc0UwhDDBDQqYk
 vni5KPILwtSaE2WMaXGcEPgrnerxc/1iSo6iYvAxrI9KGCL3uVKTey6PD1v40CRNQiMH
 wy4IO15GietL/RDIJuqRtp4uLkEIbcrSun1KwBzBkzVldXbzFbUfegu7IKOFM2nsC/VC
 KDtDzundvG9UQMWSZ3Yl3SQPCQu2cOKI3uPCIrYBNzCIXEH0H93x+HEJk+OsPBx/B8vu
 KZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680100968; x=1682692968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W3EukDY738uK8t5sI5cTKcLQTkVH6nf7vkK4CY7nzUE=;
 b=JKIElzhIRFxG8XdpO2yJCTuzllT1EqvDUqNHxLg8J1Nolej6MHEtQnCW7qxKd53SZe
 73U2pJ2PN5YSW5eqn7WVwsTLAv7X0l2nhIIaamygLD1mec2DabqhU8J+td0jKzJHpTSo
 2gGr+rLqxPKpe11/2vyohboe5dVidXZ06rxnKzyEoZX0KnuXgVdjwcAytEzVfIc4qzs/
 7it97Zj3Ht/JYIR1epgCIZC8aR3nFu3wDiGzQGoovRtNQBmsMkdkmKFzhZASyibgiIrr
 Wo4xyLatisCJzlbr9GQeD1hpRargxjvml3uO5M8oxk2JcLH8SkiIPWP3GDsmSPhPKgRA
 lhfw==
X-Gm-Message-State: AO0yUKVmvOF/G9RSuXGrRHMV3uNxp1eOkQl8Yq2sO7ETCKR68mHQBAdt
 6vZ0DKHR7f6Og3l5fcOIYSI=
X-Google-Smtp-Source: AK7set8HRWLhppj6CPT0xvYBSZaGn4LonJfEG8/9Usb9GwpaaDnvkpz/AbKxzQJ+Dl1TFiwqyYcQuw==
X-Received: by 2002:a05:6808:1981:b0:387:24cb:9e78 with SMTP id
 bj1-20020a056808198100b0038724cb9e78mr10657268oib.5.1680100968683; 
 Wed, 29 Mar 2023 07:42:48 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:1c2d:271:d34:84ea])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a4aad8c000000b0053b909a5229sm7223691oom.4.2023.03.29.07.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:42:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH 2/2] drm/exynos: Implement support for DSI clock and data lane
 polarity swap
Date: Wed, 29 Mar 2023 11:41:55 -0300
Message-Id: <20230329144155.699196-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230329144155.699196-1-festevam@gmail.com>
References: <20230329144155.699196-1-festevam@gmail.com>
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
---
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

