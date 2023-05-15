Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91D704187
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 01:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC22E10E0DE;
	Mon, 15 May 2023 23:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F3310E162
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 23:57:28 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-33131d7a26eso94349715ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684195047; x=1686787047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dygmSIeKyL1Qr6osm0gPJv6LRBfSTNTnVZ/IpsRKoBs=;
 b=ifiSs08y2MIXBn42MVs3fNmMJZNFceO8x5OBZxjHHuPseUh9GHHt2QVVxaJ1tjr0rH
 4lgxmX4/5PLmd3TS0m4VoQvGK0siotAuZaVUL57vq0Fr+x3Zxddw3A3lTreQhjcQxqNH
 tnGG9MYqlx8tz0qt9vIMxWNuiqR0XCqgIE3nTul09t7jYA3Ah59gZ4cEDExLcAGXScxB
 ciVkw5p668JwtFCQ3SI+dfCZYKEUZ0v9xU1L5iTLhd1y1DlxGg579Gx/Q4QUEIZ6GeII
 CHOCMUvoC7stPSQY2HtFkjcojT26Kq2ty1+wlzns4ijmz2vXBiY/KU5/MZ3UftgwI1SD
 x+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684195047; x=1686787047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dygmSIeKyL1Qr6osm0gPJv6LRBfSTNTnVZ/IpsRKoBs=;
 b=A/cUTacF5BtP4FcCkvhLulHhkP3/gjYNQrEZfIs9yiAuo9W2j3cI5/o//wiD76xPIP
 96t6QojvusEPEzRMzYeEKIFIVEmg/HObOPxHvW1w59EdAVkKxZsVi90qTBBoyQyZHJCJ
 idrGt6BbYh7JYDRa1MtivwNreC4a/XEdxA5FFHePpUBnOpcgajQR3dPCDi3FSMmasru9
 YqWHepkzA9YC/cLMtIVQ0qBVNUp8Pf5UCPbTq+hsFhTHt/HX5BysYL+75PzGE3Zrrq58
 wdmr7QotsdyGOGUG49eBErjc4uTEhtVT84S2BlNegmY3uGcIdUYpoDfepAlycN9DKMWv
 JH+Q==
X-Gm-Message-State: AC+VfDx+SdszP9W2iN+TpYPfa6H4JhLN6uutYU6FKSu/5JQjmpWltVgL
 UvSg1MAZSq1HeGo20fb9ClhziD3SoWs=
X-Google-Smtp-Source: ACHHUZ6evfIxkAscIh79dMFR3cgzi0moXGEy9Fy4vlp+9hRCEen8qyXWbLURAPkFLQPKP8NXCqRz2w==
X-Received: by 2002:a92:d403:0:b0:326:3a39:89d0 with SMTP id
 q3-20020a92d403000000b003263a3989d0mr23300881ilm.1.1684195047045; 
 Mon, 15 May 2023 16:57:27 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:61e0:9fee:1bca:ea3c])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056638112600b00411b5ea8576sm7427851jar.108.2023.05.15.16.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 16:57:26 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V6 1/6] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Mon, 15 May 2023 18:57:08 -0500
Message-Id: <20230515235713.232939-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515235713.232939-1-aford173@gmail.com>
References: <20230515235713.232939-1-aford173@gmail.com>
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

