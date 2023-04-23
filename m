Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5896EBF40
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEF210E3BB;
	Sun, 23 Apr 2023 12:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6CE10E3BB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:13:03 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7606ce89ebcso106185839f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251982; x=1684843982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ym0X1edkE/8UZRdqtYyBbFIXdvNOteOPtajDW+FAJfU=;
 b=LlWcnTgzBJhYGrMJdnKIHgclJpniEDVvXYWQLVonuhkOvJsDe2+G9yYhVk2m6ttSJa
 OOpZGVTjpcWBojyy5qs91Qa1VPUpAOLJtoHto+ZZQ+HsnplUSmR8wQEoZSHiD6b0Q/UJ
 1VfnEhTApbX6fXCjjD4Acqe1rfmwWMUOaonJKd80AESenriv4tk316jixFGpqmeRs8/n
 X2s52+ODTatwP0Q8KJ5HMFVepqd34Mu2QMqeITHboJlYhH25I3c8TCxOKcr39uTlW5Nw
 kgrBJZwTtuJZElvxV5m+VuYa/E45IClXmQFS+/48r2i1gR3gp2ZUrzoheUdA4HHYssPU
 /XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251982; x=1684843982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ym0X1edkE/8UZRdqtYyBbFIXdvNOteOPtajDW+FAJfU=;
 b=gpEI8PHQyRSIXBZcdUodgx66zspW5U7tdAezW3hNT/exX4Ks7bfOoU3PY2KYJbvLyd
 IaviOdQy6fCe0ftZFoXcymGvN2voJZa6iEiD3wis9JGk3zcG5Melcp5gxg0Pwo7f6wGu
 mFPfEKyTUyzQlWmdVB6wlUdL4Gulxy8arVmhz+2RsI72KTkdp08VzyKTZdRwOrz0zKQo
 UJH/xk5zg00Y6L67YP6/HzYJOuOxEcOnsmPMRw2KIZ9U3lLSBT/setZUVAYsP2stR/Aq
 UquvihScsCunxf9GvLCgHqld1tau8Vkb9YIi2ra0jtTE7MLtbiaQqVLu7ItKCrnoGknW
 v9qA==
X-Gm-Message-State: AAQBX9dAmLEqvwO8g0Ue75Yk7M0OMe7afd6iM32PrxGgY9OqH5z+PE0M
 de2DaGX+qOh9vgDcJlyzcpEzm2KUDis=
X-Google-Smtp-Source: AKy350ZAeHpGUCdXlHdLQDMy+jjT5vSKjYSBKLPVnHj7nLodSXrgByyuFW5RSUr1YJawiRV3O/hw6A==
X-Received: by 2002:a5d:8a0c:0:b0:760:eaf6:59c6 with SMTP id
 w12-20020a5d8a0c000000b00760eaf659c6mr3331658iod.11.1682251982457; 
 Sun, 23 Apr 2023 05:13:02 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:13:02 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 6/6] drm: bridge: samsung-dsim: Let blanking calcuation
 work in non-burst mode
Date: Sun, 23 Apr 2023 07:12:32 -0500
Message-Id: <20230423121232.1345909-7-aford173@gmail.com>
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

The blanking calculation currently uses burst_clk_rate for calculating
the settings. Since it's possible to use this in non-burst mode, it's
possible that where won't be burst_clk_rate.  Instead, cache the
clock rate configured from of samsung_dsim_set_pll and use it instead.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 +++-
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index cea847b8e23c..8c69d22a57b7 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -652,6 +652,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 		reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
 	} while ((reg & DSIM_PLL_STABLE) == 0);
 
+	dsi->hs_clock = fout;
+
 	return fout;
 }
 
@@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
-		int byte_clk_khz = dsi->burst_clk_rate / 1000 / 8;
+		int byte_clk_khz = dsi->hs_clock / 1000 / 8;
 		int hfp = (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
 		int hbp = (m->htotal - m->hsync_end) * byte_clk_khz / m->clock;
 		int hsa = (m->hsync_end - m->hsync_start) * byte_clk_khz / m->clock;
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 25475d78adb3..41cbae00cd7e 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -94,6 +94,7 @@ struct samsung_dsim {
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
+	u32 hs_clock;
 	u32 esc_clk_rate;
 	u32 lanes;
 	u32 mode_flags;
-- 
2.39.2

