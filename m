Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6458A6E30B2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C03010E0D0;
	Sat, 15 Apr 2023 10:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3610E0CF
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:41:24 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7606ce9b213so120316239f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555284; x=1684147284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dtFFKmwY6AVZaivGUGeBXmlxV0WshHisjIf4olqGXlk=;
 b=oL6X1i8/kjCWm/1yiymDM94a0njyMbG9HTxP6ejrDG7ZtExirgBlCbJ0hJrZEL0w20
 nuhCPKvLwSDiQ14eICBJgwALXNAeZT404BHs1u9WKpHsUVZJyCeLHpCFthF0uiaFAnS2
 Zu7wBi42hG7hRgKlP9BwSgxVY/kX4j31smJWTVlmcL9KfbTR8RQvNNbIWus0nM47u0iL
 COZC6yOIDhepC15FBWAId35YzFu2uZt2gqEOLpfzvP0AwZ67Fk/XxaVh4m6j0SFP8F7m
 1BdnNafSJs1yK1VQnsmvS3G178egs+eeAie4bDJyPGXCZHTYRc/UdZ25dwN2bQiMFcGW
 IVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555284; x=1684147284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dtFFKmwY6AVZaivGUGeBXmlxV0WshHisjIf4olqGXlk=;
 b=jhBODb6PxMHdTOFCLuLANo0jGZJc7ggzMwCqLQrjrAjRhUYIsFvXGW4BVbPdw35QuK
 F6TcdXwIVzrM4NAtJrx6WK0qdbmo20eJzbYICSpgCrz/l+IFmx3MBvN9DvjRVlPmIzW1
 d3PFQIji7IUWZWj+AdHcaY19wqMpkO0Z7aLLLL4rNopR0jjnaxn5MZIICFMzPpXAimR3
 ad/8fW8a4akJlMfK7vrRcoDDg7nvenkvVqbrA5oDlTcZs/zV1tAEdOQEfPy0M37NX7Hx
 UQTdEUj6cOoypGssdxY6D9kfa0RF5ZJtjaJ93DO0G2ynTEvlEkSAWRAUrGEdyWCGpZWA
 Z0DQ==
X-Gm-Message-State: AAQBX9fdkUls/stA4raaX1V8b3Irr0IDrDyZ4jt9y9bfeXKxlahcwoHL
 ZyGN0Ja2AB1MBERajATJVC9Ia3zvva+nFQ==
X-Google-Smtp-Source: AKy350Zh2mdRrtm0rvTQDn/bkgIVArEkgFv6/4BKmvhP9tvea7MQ7QnqypAhJ6V3RS+W4k7NVOx5wA==
X-Received: by 2002:a92:d690:0:b0:326:2bb3:5f9a with SMTP id
 p16-20020a92d690000000b003262bb35f9amr6437030iln.6.1681555283888; 
 Sat, 15 Apr 2023 03:41:23 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:40bb:6fe6:ddbc:cc9a])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a056638440b00b0040b38102b79sm246536jab.82.2023.04.15.03.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:41:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm: bridge: samsung-dsim: Support non-burst mode
Date: Sat, 15 Apr 2023 05:41:02 -0500
Message-Id: <20230415104104.5537-5-aford173@gmail.com>
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
 aford@beaconembedded.com, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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

The high-speed clock is hard-coded to the burst-clock
frequency specified in the device tree.  However, when
using devices like certain bridge chips without burst mode
and varying resolutions and refresh rates, it may be
necessary to set the high-speed clock dynamically based
on the desired pixel clock for the connected device.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c48db27adafe..5aa3a44f15ec 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -659,11 +659,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 {
-	unsigned long hs_clk, byte_clk, esc_clk;
+	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
 	unsigned long esc_div;
 	u32 reg;
+	struct drm_display_mode *m = &dsi->mode;
+	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+
+	/* m->clock is in KHz */
+	pix_clk = m->clock * 1000;
+
+	/* Use burst_clk_rate for burst mode, otherwise use the pix_clk */
+	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->burst_clk_rate)
+		hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
+	else
+		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->lanes));
 
-	hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
 		return -EFAULT;
-- 
2.39.2

