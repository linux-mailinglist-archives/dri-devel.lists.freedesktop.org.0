Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214766EBF41
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A3710E3C0;
	Sun, 23 Apr 2023 12:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6F510E3BB
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 12:13:02 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-329326b4f10so9008265ab.2
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Apr 2023 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682251981; x=1684843981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP5A249OQ9d1hnlbDG91vSMCtNc8nZw97HXYyMZltzg=;
 b=NHoYXla5QQRCzeCeKvqnyvDRj+E/EbypCZcBf27+BvrVTYZ2ZGaarw/oTuCMzCqZIT
 I0mgmnYkyFY9pPAeFeymeqyrBhX++4bb9SsPtkfhRyrcAKtXzBN1oaBgy42z3KprSMRq
 hLzErKioeH5tknsM9DsinGZ/a8C05Cp2ZMCDNh0hwNK5Kn08pXtHDB9BKAqM8HWeM6zP
 cLLp7QYh9IalQBf4oiWFs2/uhYdbD5UWcOYfdnr5mpskC4R4AWyvUbOA0Mawc959WNLa
 l7jO0aGjRvnHPV0wgmGYkqtT7MWSvEZ0ai1wWVMg0H4eKfo8IIYytGD7otd4JRCn4opN
 1n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682251981; x=1684843981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uP5A249OQ9d1hnlbDG91vSMCtNc8nZw97HXYyMZltzg=;
 b=NDDRDCSiyGwbmTTshtjqVIrBUvUhWeASNacVx8LRIlqHRKBc32b510NExBNNi0W8Cn
 x5pt5iX6hhsmMuanUeqavH/X2OUX5ZZd2jyrYDob+eeJuMejKDLn03Keb2hhALfc0L0J
 buymxjv9hiJwC0aiAZ6lAbx45K3bEl1eBArc48HUHdfWo8e1euZmX2XnjG3JYyxdV7+X
 +YvOL4BnEYmKBt6NO+lryEuFcbxqRJ69xuyMhWXu+/bK5nNS7vVeUBvjZ8eavAvrJRUC
 wZ3o/WG9x6rD29ITMab2F9vwW550olpgdB8rdxjz2r6u3EAo5Ra/60R2snb2/3DDX/cv
 5MfA==
X-Gm-Message-State: AAQBX9eqlAC9j89kxX85Jt76TCBs6/U8FsAsPMZwlvN+p+cfACkzuhAh
 LSn+cGUKLJ8/pTHmiUsb6EDFfuMHX2k=
X-Google-Smtp-Source: AKy350YMNdxeTgrCAbQoe17aHXe2grAjCrKzYgpyraU0dzHLlsUOk/L401w0XPTTPmOa20kMjGROMw==
X-Received: by 2002:a5e:8e06:0:b0:761:ac61:3162 with SMTP id
 a6-20020a5e8e06000000b00761ac613162mr3689827ion.1.1682251980759; 
 Sun, 23 Apr 2023 05:13:00 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:b473:5d7c:4c2:75d7])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a02230b000000b00411a1373aa5sm1612155jau.155.2023.04.23.05.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 05:13:00 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 5/6] drm: bridge: samsung-dsim: Support non-burst mode
Date: Sun, 23 Apr 2023 07:12:31 -0500
Message-Id: <20230423121232.1345909-6-aford173@gmail.com>
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
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f165483d5044..cea847b8e23c 100644
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
+	/* Use burst_clk_rate for burst mode, otherwise use the pix_clk */
+	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) && dsi->burst_clk_rate)
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

