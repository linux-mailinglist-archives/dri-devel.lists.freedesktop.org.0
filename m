Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B176EBF37
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F292610E3A7;
	Sun, 23 Apr 2023 12:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF7D10E30B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:12:55 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7606ce9bfdeso333910139f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251974; x=1684843974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JTAw7F03HuAr0OI8IRjYA7Odta6kZ/yszj+u/BSAuPo=;
 b=REgwWBSRFUiIEK9qwudRmoDNqt33mzgWRpmSeTuO2i/B46etyi8vK2RjYE9C13aKph
 ZyKhanQ0+t1Z8fBqUULDvdIolx+0Fxu8moCOZsKPN5GgUj5g1viY7TQiMiwUA5v1Shwr
 5tfFcNnPlsA+19dAYi5OAxfGbC53Oedw2SC09NpWcmDpQ4Vste76HhxFcxE9QVh4xNcp
 xl26AtEqF+gEmpzevyNYf2RE5yEx3g9g1RdErKJbwGG4tw86WWFFHyZfzm0wpdw0HhTS
 Otc5B5oJZ0pHrEVL7mOkHAVWvPhV4zL+UvE96ikTJo92Wnjw1sR3QGnl63CHt1w0M0DF
 TlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251974; x=1684843974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JTAw7F03HuAr0OI8IRjYA7Odta6kZ/yszj+u/BSAuPo=;
 b=Rli4i4U6xp2KWUdrN3ixKBQK1UxEuqW0aWgUrUSaZfRV9F3eLPjjMwRKjc1Fi5/Kdq
 9+DZQAxKiA/8M1j/IiWx+6k8V7OHkn5T7cP3l1QlCSLfaIxygZ0f3cWYEIBm/HeM5Q/y
 gd6mfPsZQhsVPB1owmHbX1Wujqb2kHjZoMLwjvJ/G+j7IO1hMWlrquZfIs5JNskqVnpS
 U5DoVH7Rvw5DvSIxPVKdbh8m1LUjHRX0OVYNPz2jjjXtY8EAtmMi4t6jnXlo0YGbuEkg
 a81Wro63Dr1F68dHu2r0mRvrmIUsiOdj0cEOdTveetpkt2osjT4n1PJhbDJKq3VHya0A
 6+6w==
X-Gm-Message-State: AAQBX9cDLV6k4ygXATq5Zo0SNFAK8rxY/DqZhl7SRzGaZAnbxQFFWtnA
 YweJ5/ZnagMMRdNxERaKiT8gOwIXMpM=
X-Google-Smtp-Source: AKy350b4IsmOmc2kdOlEa4VZcUd9HynWDxOz89lLecHxdvuNlqnpR4ecObEj/S+7bd3uBqX33WJ1vw==
X-Received: by 2002:a6b:7617:0:b0:74d:771:6ed5 with SMTP id
 g23-20020a6b7617000000b0074d07716ed5mr3107823iom.21.1682251974106; 
 Sun, 23 Apr 2023 05:12:54 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:12:53 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/6] drm: bridge: samsung-dsim: fix blanking packet size
 calculation
Date: Sun, 23 Apr 2023 07:12:27 -0500
Message-Id: <20230423121232.1345909-2-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423121232.1345909-1-aford173@gmail.com>
References: <20230423121232.1345909-1-aford173@gmail.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, m.szyprowski@samsung.com,
 dario.binacchi@amarulasolutions.com, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas Stach <l.stach@pengutronix.de>

Scale the blanking packet sizes to match the ratio between HS clock
and DPI interface clock. The controller seems to do internal scaling
to the number of active lanes, so we don't take those into account.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
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

