Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255A6708C05
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B910E573;
	Thu, 18 May 2023 23:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800F410E571
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 23:06:41 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-334d7bb7155so6803155ab.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684451200; x=1687043200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eat7ZZkvIgNO0d+Nb1ho7Qs2hgM0XyaATLA4vhm7AEo=;
 b=DE944Ib1ld+120uL+TpRFUQEUj6080i0PgE0CJljKz9AT6i5kL6jbS5vo+Ah3G3Y6Q
 5A1JNFqdHCind3nF0DuR3oKRPNTu1RxUEuYUDTkX1+xBVMZPnXBQ1G+7GPrdhsX+GoqS
 T3zCHFtXehuLBWscviMN4qwDbIgVkASo9Gke+noVwt/+OjXpd+qf1KVxAKH48lWwLbMQ
 lJHm2t3SHeoxm92FdGafsqeapPFYMsR5GAirsGd5fUHZysjBnjw17yGhij2oa/63kybo
 SqJPRjIP31NhhlmQLOTEsiycV0yBuMZZmW17Eayv17N0vhYIuxXAb6DHYG6WQ1O4p8lE
 6T+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684451200; x=1687043200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eat7ZZkvIgNO0d+Nb1ho7Qs2hgM0XyaATLA4vhm7AEo=;
 b=cCSBPELXK8akUTcGv0cMZRYT6eZyvktoPY5q3Fsqil2YQqUVirseaAOJxPGwHigrmU
 SE4Bi64HYt2xsiIDkue8A40cbWjCLjVRsYuO8A646K41GSpZux0N6q+v0dM5JDv8AQGT
 1X3/2NY7BjaLEvijwmBSCpF+kw/VI8zw5J2zWh14eAhVsyWh8HEd15ESg/UeCeriwvni
 V4fyrRd3k7iu5DDjugPX2v8TqMkmH9ani3Ymxr49H+g3f7UmNNcpWS+OQIb9YcJhGtfM
 O/Vhr8VzXmcPzs5mgz//Vhm/7lCnJfIiUMLWnK1XPQh7k7dKkGFVV957Rwb2cldU9WfF
 ZGQQ==
X-Gm-Message-State: AC+VfDzxOrgZaSnWATHaJnA16mFKUZSiHlpr4RPTFkIjN7ojHOZXN9M4
 2pV0EEvMtHMfoZmW+r51uyU/dLJouMU=
X-Google-Smtp-Source: ACHHUZ7k+Omw1YOkZhO0tjeAZNgxijvwDBeh4ZVTvPZ9gntUZInKMpBhWZ0XSLvpAnWgmUezU83HtA==
X-Received: by 2002:a92:c6cf:0:b0:332:b18a:7ba7 with SMTP id
 v15-20020a92c6cf000000b00332b18a7ba7mr5201843ilm.27.1684451199670; 
 Thu, 18 May 2023 16:06:39 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:56b8:635c:4c7a:15b1])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a92cd0c000000b003317ebbc426sm635897iln.47.2023.05.18.16.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 16:06:39 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V7 1/6] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Thu, 18 May 2023 18:06:21 -0500
Message-Id: <20230518230626.404068-2-aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Adam Ford <aford173@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # imx8mm-icore
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

