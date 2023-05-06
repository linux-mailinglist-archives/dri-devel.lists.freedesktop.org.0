Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2316F8D57
	for <lists+dri-devel@lfdr.de>; Sat,  6 May 2023 03:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC66B10E15E;
	Sat,  6 May 2023 01:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E7D10E15E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 May 2023 01:09:44 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-76640f8c456so59423839f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 18:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683335383; x=1685927383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dygmSIeKyL1Qr6osm0gPJv6LRBfSTNTnVZ/IpsRKoBs=;
 b=ECqinSGCsX0qECfmy038ywMxEDwdpTB190ZZqG5QL1XmuGVCktNau+CsIl4GIYM9OI
 gjkBObZL7341QL8Jaqw5EU5YVGF3SrNnjHy9COUKrlpZOd/v0pqf1FkH4+p2H5IEqF8n
 Oskj2y9WJrHu2HUVJz98kEQB6gj531C1fwdHDGnJuZEqSXjAmZDJ8iYbyZQkWGuwRaDD
 kl138V3pPgJioZe65KuRg1gUAF67H3k577ME6aURmKdw5rcTcTaiaezncdCOjg/8sWQE
 t0XWyJvil0UmK0Mn8FAhGv/3pU66nVnTn0er45WgJ69j0pOhMjeqKUMLaZsUYAzwXeGj
 45Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683335383; x=1685927383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dygmSIeKyL1Qr6osm0gPJv6LRBfSTNTnVZ/IpsRKoBs=;
 b=NzgtK2WuOfO+r1NnmuW164u/ri7yeNzsvno7yw/ewFderun8/8vnDfaYKsW40dLfe3
 t5+bqqsypqNxBbSIMn4kzg32lQ7tCUf5gA0/Al8yAqkszGY6oElSc6R7UDzBE4k2LZKI
 NGPns8+VkBnwMklfRFqNya31FPH4o8DBXVL/QJ8xnLQuaCbAEOeRkqjMjTWy82pmjChX
 WRsox5lMN9g/JHvT9KcMTEpXxCNhA/QmXAAO2MmJZSX/GCRx8Ts3S98KiVdOg4uXqjIE
 45E5hmqpfKYppMR6uoM86f4ggw/4+38+0Bhft/vbd/GeENJdOz/alUBnp2yueYoBV38d
 /XIQ==
X-Gm-Message-State: AC+VfDxQ+M4YWskNS1w1nhaoKcMk5dB89up/3/ONzx1mw2fli7rZN5yD
 TJa9s0Ca/in7OINkQDsBPQV25GUFwiYfrw==
X-Google-Smtp-Source: ACHHUZ7oSDAQyaal9wPN8nKtlLWJ+VhEZSVCcwcoE7UQGWo/2zNH+Nt/9PDTwIT7iTtwNg6zy2iAjw==
X-Received: by 2002:a5d:9c09:0:b0:763:92eb:f81e with SMTP id
 9-20020a5d9c09000000b0076392ebf81emr1978405ioe.8.1683335383115; 
 Fri, 05 May 2023 18:09:43 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:34a2:3894:45cc:c002])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a5e950b000000b00760ed929d0bsm335735ioj.2.2023.05.05.18.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 18:09:42 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 1/6] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Fri,  5 May 2023 20:09:28 -0500
Message-Id: <20230506010933.170939-2-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Scale the blanking packet sizes to match the ratio between HS clock
and DPI interface clock. The controller seems to do internal scaling
to the number of active lanes, so we don't take those into account.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..2be3b58624c3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
+		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
+		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
+		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
+
+		/* remove packet overhead when possible */
+		hfp = max(hfp - 6, 0);
+		hbp = max(hbp - 6, 0);
+		hsa = max(hsa - 6, 0);
+
+		dev_dbg(dsi->dev, "calculated hfp: %u, hbp: %u, hsa: %u",
+			hfp, hbp, hsa);
+
 		reg = DSIM_CMD_ALLOW(0xf)
 			| DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
 			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
 		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
 
-		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
-			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
+		reg = DSIM_MAIN_HFP(hfp) | DSIM_MAIN_HBP(hbp);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
 		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
-			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
+			| DSIM_MAIN_HSA(hsa);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
 	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
-- 
2.39.2

