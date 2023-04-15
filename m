Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DD96E30A7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 12:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1690310E062;
	Sat, 15 Apr 2023 10:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A87D10E062
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 10:41:17 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-329627dabfbso13855275ab.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Apr 2023 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681555275; x=1684147275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NxV/r2dg6tmyFGrf7XbFu39RjdGZZ9Qw/qpOckRtFcs=;
 b=nkxVRMgX1GxubqUedgn9gXUJHy+brhU+3BcUFfjVgyCkoGudE9vSWr3Y8suNnwiEv+
 W8yGBeGfODXBLYCs6nVn2KX4m+oD6yWq/F1eRJp3Z+aFjU608yiclFytafmdERH3CJJR
 HtMwgvVu1OTXrkiIiNzRBci8NMvJdEMUm8Oj5Vm31359sF/pA4PDYmJMIsd9Q8h1Y8Xk
 q+HUt00HV7vkK9y9UukZsBljW5DjBzm9uSDN7sChkNbjExgM9QLRAx2Hytcq1BZp8C/o
 iw2zx3nm8q2SPJVubnoX8TCVQCtB4H2vnS4TKmGvyjsAoFY9mfB+fRsHBMnwUpLQeHr3
 baZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681555275; x=1684147275;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NxV/r2dg6tmyFGrf7XbFu39RjdGZZ9Qw/qpOckRtFcs=;
 b=C9UPTGSxYdL9c+sxCZpKSzuATxeyNOSHASnvE6QqQyjXxLY79ZXLk+76BZ3SX2lcQx
 /wnHBF/Xe2CXY1YaghjgpQRE7NzTJzwJDMv3Q75HZPOY7Dgq0rDJK+fZJjGTJliOcyUk
 omeAdbMl2HanCnC8YXODWiJQpzI8gEiyblsGj5a5SWP5DyvTQFVQ9jt3bdzkcNVbTY/9
 YaBHBZyAgsh1x7zETA0qn5N4f1D+D/PK8ANGwZpa9CtL4ow13Uo2u2g9N6beYH8H+BsG
 MiYslE+S5/X68uAFU3j6M+evOr0TH9DgFzUqvrM5FFfQ7Ib1LslfJ5BqvhE6szffrQLx
 Vj1w==
X-Gm-Message-State: AAQBX9e3rAKdu19Ui1jBmAzxPTmkcGme2Jtd3TumME+eA7CKXZxJzxdc
 268zyNOb6m0+6Z7HEiMkl3L77hggLx4=
X-Google-Smtp-Source: AKy350be9XGQbEpTAMxfp/yDs4zbKCqaElyWQiPWqA6tPdcVQdgTQGeHdLNOwe+rg1tq3rDX2lHvrA==
X-Received: by 2002:a05:6e02:526:b0:328:edf8:be71 with SMTP id
 h6-20020a056e02052600b00328edf8be71mr5849677ils.0.1681555275334; 
 Sat, 15 Apr 2023 03:41:15 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:40bb:6fe6:ddbc:cc9a])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a056638440b00b0040b38102b79sm246536jab.82.2023.04.15.03.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 03:41:14 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm: bridge: samsung-dsim: Support multi-lane calculations
Date: Sat, 15 Apr 2023 05:40:58 -0500
Message-Id: <20230415104104.5537-1-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
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

If there is more than one lane, the HFP, HBP, and HSA is calculated in
bytes/pixel, then they are divided amongst the different lanes with some
additional overhead. This is necessary to achieve higher resolutions while
keeping the pixel clocks lower as the number of lanes increase.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 40 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..1ccbad4ea577 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -215,6 +215,7 @@
 #define DSI_RX_FIFO_SIZE		256
 #define DSI_XFER_TIMEOUT_MS		100
 #define DSI_RX_FIFO_EMPTY		0x30800002
+#define DSI_HSYNC_PKT_OVERHEAD	6
 
 #define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
 
@@ -879,13 +880,40 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
 		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
 
-		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
-			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
-		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
+		/*
+		 * If there is more than one lane, the HFP, HBP, and HSA
+		 * is calculated in bytes/pixel, then they are divided
+		 * amongst the different lanes with some additional
+		 * overhead correction
+		 */
+		if (dsi->lanes > 1) {
+			u32 hfp, hbp, hsa;
+			int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format) / 8;
+
+			hfp = ((m->hsync_start - m->hdisplay) * bpp) / dsi->lanes;
+			hfp -= (hfp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
+
+			hbp = ((m->htotal - m->hsync_end) * bpp) / dsi->lanes;
+			hbp -= (hbp > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
 
-		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
-			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
-		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
+			hsa = ((m->hsync_end - m->hsync_start) * bpp) / dsi->lanes;
+			hsa -= (hsa > DSI_HSYNC_PKT_OVERHEAD) ? DSI_HSYNC_PKT_OVERHEAD : 0;
+
+			reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
+			samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
+
+			reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
+				| DSIM_MAIN_HSA(hsa);
+			samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
+		} else {
+			reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
+				| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
+			samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
+
+			reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
+				| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
+			samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
+		}
 	}
 	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
 		DSIM_MAIN_VRESOL(m->vdisplay, num_bits_resol);
-- 
2.39.2

