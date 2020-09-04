Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6125D907
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 14:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981036E286;
	Fri,  4 Sep 2020 12:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 203BD6E286
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 12:55:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so6626551wrm.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yv8vkjDQK6hcRmOjhA1B4LKV5dcNKUU+lKopTGFxDEk=;
 b=d0c4e8pnx/zw8L1LUX1IDKWgDaOOcFOwkGN7pDeTnRSV3HcfbvwR2pF65F33Qq2OrP
 x0L8nWU/KikfnXLm0ad7qfVo32XRlkxz7Z0eDlEsVHr+cfAv784G2m9LTVfLv+L0f7y/
 /N0KuRUbHfIOdbBvB07yBYVOSJDW1Zi5LWqy6KbFBa/6nwLkxkd9MKkd95bfh20BkAeN
 RRubpy7nee7IrN1eT3+dighUN7LxYPJNkUVJ30yLVmCThHcyJhG2YMk/uW+8O+9hXuxX
 T76cIDTMe6zOR1Ub9D9DCmA+3lE1EuogygFRlm3pCq0Ql2rw04CMAx81n9gC7E/XmE6j
 jONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yv8vkjDQK6hcRmOjhA1B4LKV5dcNKUU+lKopTGFxDEk=;
 b=A1WNibDCbrMvT8ZxAARRSLyU5rfyjCBBLEwBdLxN3IaNXJr8VJOcqSilD1wMWyfMMs
 0lvYHjQg+j7B5nZbXuMXtGAbIJztiimAGn+qkZTpFlPLvvIBi8xITYtGFHijX3uHdoDL
 VcAx+Zyjy3u46u19knqMgKU0mFZFhtG2255isRftonadfkdhortO7b0gj+fR/PtdrzXX
 E6jcLF+GYeChIqdg4po3659bQC/lO3caqGyUv6mhYPBhebg0maG7RlSfPM8rvzJD60UO
 f6G7vga138k76D2i9a4e62epN5fCQqXLR/ZwJLjH3k+0lDoOKPOnOKuxVYT3DGameP1c
 99DQ==
X-Gm-Message-State: AOAM530vSMjxnVUAeZ8z3DtsJlLq/i6UfAtqXya0GGix6OCUb44SRvQE
 DJv0+C8M2HP29vVKa7rvK+vJng==
X-Google-Smtp-Source: ABdhPJxv90v+tFBoZCB4HpM62W+SkjjqW7sPC+ACOuh5qlqbSlXgZD7YYB18yLvhWxSjJbc4yvEFNw==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr7572543wrv.415.1599224134577; 
 Fri, 04 Sep 2020 05:55:34 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id z15sm11026236wrv.94.2020.09.04.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 05:55:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net
Subject: [PATCH] drm/bridge: dw-mipi-dsi: permit configuring the escape clock
 rate
Date: Fri,  4 Sep 2020 14:55:31 +0200
Message-Id: <20200904125531.15248-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 heiko.stuebner@theobroma-systems.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@st.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Amlogic D-PHY in the Amlogic AXG SoC Family does support a frequency
higher than 10MHz for the TX Escape Clock, thus make the target rate
configurable.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 25 +++++++++++++++----
 include/drm/bridge/dw_mipi_dsi.h              |  1 +
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index d580b2aa4ce9..31fc965c66fd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -562,15 +562,30 @@ static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
 
 static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 {
+	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
+	unsigned int esc_rate; /* in MHz */
+	u32 esc_clk_division;
+	int ret;
+
 	/*
 	 * The maximum permitted escape clock is 20MHz and it is derived from
-	 * lanebyteclk, which is running at "lane_mbps / 8".  Thus we want:
-	 *
-	 *     (lane_mbps >> 3) / esc_clk_division < 20
+	 * lanebyteclk, which is running at "lane_mbps / 8".
+	 */
+	if (phy_ops->get_esc_clk_rate) {
+		ret = phy_ops->get_esc_clk_rate(dsi->plat_data->priv_data,
+						&esc_rate);
+		if (ret)
+			DRM_DEBUG_DRIVER("Phy get_esc_clk_rate() failed\n");
+	} else
+		esc_rate = 20; /* Default to 20MHz */
+
+	/*
+	 * We want :
+	 *     (lane_mbps >> 3) / esc_clk_division < X
 	 * which is:
-	 *     (lane_mbps >> 3) / 20 > esc_clk_division
+	 *     (lane_mbps >> 3) / X > esc_clk_division
 	 */
-	u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;
+	esc_clk_division = (dsi->lane_mbps >> 3) / esc_rate + 1;
 
 	dsi_write(dsi, DSI_PWR_UP, RESET);
 
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index b0e390b3288e..bda8aa7c2280 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -36,6 +36,7 @@ struct dw_mipi_dsi_phy_ops {
 			     unsigned int *lane_mbps);
 	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
 			  struct dw_mipi_dsi_dphy_timing *timing);
+	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
 };
 
 struct dw_mipi_dsi_host_ops {
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
