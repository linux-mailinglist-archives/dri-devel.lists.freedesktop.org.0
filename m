Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905C16F3BB0
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1D710E2E9;
	Tue,  2 May 2023 01:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882E10E2E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:19 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3296292e623so26522785ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989698; x=1685581698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LILHGDPu6PO8q8DSVW+PJ0k8lNeferhINno8wB3FCRc=;
 b=ODN1m4Vvr99jSc5D+ktc9kqN9l0wREObKD2jZ82mb/T09ybjsKvdPnQKZgSEPzg+Wr
 cOWG1i4r7WnsFgctCGcr1iSXJoKN9/VP2RBn16nAyUywLVzHJ20PenJI0V2ZTzbcFRQh
 9fi3c5cuq/hK6u0xwonLVbDTkZiKPJJzzOdkD+Hssd0ATZR1083DUs6YZwlPZuT8OhpC
 bWf+ZBz1Rcx3WHiF+XNgKiaW7jH5x+wBZbvEkAvoPQNXVGUaRnh4rbjF4H+llZ/7fYkT
 7BXa3Mcywh2PLAhyHhiVQmY+994phYiq7SoEWAQjoInFTpomEIJZrBW6byMPnRXdRL1m
 uUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989698; x=1685581698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LILHGDPu6PO8q8DSVW+PJ0k8lNeferhINno8wB3FCRc=;
 b=g1yfujLfhnedbFCFxNV04w8VXlWUmS9oX+3Ck1/xsETiqFGsVzZnSv2j0GJkBgUgPW
 WXqztJHE4CgSF8uFzAr2Heum6EIrXhTrB/QR86DBn2ecynGL64ubCiP+sjGt/IiagHp3
 STGgKUrX0Kg+aSpK6W3HKfJQrMUKB+997qieJjuIYQNUrVWzGj0GQ6918hTaXBXXXrY0
 8iPpiWZ1swk6l5p0RibGIersb27tZYLgObr3eUc+9uJgZVB4VNMxy8UPmKh68bMAGoZq
 a2cTswM3zF9lUVdNxOGMur70Jr7kfN6uf6xA6fHvwoscKY5heNnKHvhAf8i74RWz2O4O
 skIQ==
X-Gm-Message-State: AC+VfDzxA7aA0GvcIPXDlIMdrnVX2nAf3eT+OXa8ci4aZ/Te3snilL7J
 UdG3cTUGiyL6zk4HJAuFpLy8bN9L+8w=
X-Google-Smtp-Source: ACHHUZ4FJUXKa+bW+vrwgDvkvQRTJ4p11bch6fOmM9Fp4+QmSSWor7Ek7oQqKCbAkFachRJ5gpYQOw==
X-Received: by 2002:a92:c94c:0:b0:329:3f00:79e1 with SMTP id
 i12-20020a92c94c000000b003293f0079e1mr9698503ilq.18.1682989697613; 
 Mon, 01 May 2023 18:08:17 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:17 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 6/7] drm: bridge: samsung-dsim: Support non-burst mode
Date: Mon,  1 May 2023 20:07:58 -0500
Message-Id: <20230502010759.17282-7-aford173@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502010759.17282-1-aford173@gmail.com>
References: <20230502010759.17282-1-aford173@gmail.com>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The high-speed clock is hard-coded to the burst-clock
frequency specified in the device tree.  However, when
using devices like certain bridge chips without burst mode
and varying resolutions and refresh rates, it may be
necessary to set the high-speed clock dynamically based
on the desired pixel clock for the connected device.

This also removes the need to set a clock speed from
the device tree for non-burst mode operation, since the
pixel clock rate is the rate requested from the attached
device like an HDMI bridge chip.  This should have no
impact for people using burst-mode and setting the burst
clock rate is still required for those users.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 99642230a54a..53099461cdc2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -657,11 +657,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
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
+	/* Use burst_clk_rate if available, otherwise use the pix_clk */
+	if (dsi->burst_clk_rate)
+		hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
+	else
+		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->lanes));
 
-	hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
 	if (!hs_clk) {
 		dev_err(dsi->dev, "failed to configure DSI PLL\n");
 		return -EFAULT;
@@ -1800,10 +1810,11 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 			return PTR_ERR(pll_clk);
 	}
 
+	/* If it doesn't exist, use pixel clock instead of failing */
 	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
 				       &dsi->burst_clk_rate);
 	if (ret < 0)
-		return ret;
+		dsi->burst_clk_rate = 0;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
 				       &dsi->esc_clk_rate);
-- 
2.39.2

