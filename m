Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3486F3BB4
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 03:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51BB10E345;
	Tue,  2 May 2023 01:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDE910E2E9
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 01:08:20 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-763c9805ff5so54816639f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 May 2023 18:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682989699; x=1685581699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jt34JDLxnLF4emWyf1lG0eNX4wErgdNt3MF2LAiRUok=;
 b=ba5k0haqGFBpnokW2fsW6cgx1k8UVFRl+YUYNzTh2wXKxm2MLB3RAtLueTHIHh4LQ9
 PSLpTchmXnh/Y4tH4whjgc/o4VOcBkIBMM7FVAeVsWA2hbUPx2es/pvK7V/3AXf+a2TG
 HfwGAxePidTEls0Mae/BiVjq8y7qOk1S1x3OgVwfIO/eWyTB5ghXh5FU262qwuX6y+OC
 N9XJqm+ns40tTiHnvvwPFkVC4bUSjCBt9h/LXszU34Z+L3jJZykXGqg0m5O6/GPHvpyk
 W8SS4hQidzh8KbRm74hZZlJ2bL/MK7DBojMxOzHBaF7I7Umw4rcCpXEfhxEqA7XaUVN6
 oQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682989699; x=1685581699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jt34JDLxnLF4emWyf1lG0eNX4wErgdNt3MF2LAiRUok=;
 b=QgiC2gHBq9QDEKcii/+n6xxksN+LoM6S1jpjEmA/J1Kg5Ojqy1fmuzDKm/I+kM5+UL
 RX/iWLxkqffPl9A4P3A/yhdfljCzcQqiMsLzqnfDza9sjmsjTQ9sN5EnOXZmz+gCBmmi
 uKCLn8vdEx2hFR8WLgY5b9+JdKKYTtp6UWsKHWS6NpkrbFRDgmVGaDGA4Im/1+7/uQF/
 U7PkV9ittaxM9OEm/NZVvHjVS6biUOTFkveDdy9nTnQlV84J1+CbQgEvXhBCxkUSmepg
 AMcxLd7f2/SbJSSi1rlT1ww3iokpOKCGchw3egXqzxVF/k9YKU0u70n3Y7pd3r0SaPlb
 DUrA==
X-Gm-Message-State: AC+VfDxj9NGa4BLEcttd//6I6vrso7DnXrFmCSCmxLIuufduPCQJrXk/
 58E6Ivu4FsUrUmF2VGM8U6jEhraVM/UDpw==
X-Google-Smtp-Source: ACHHUZ7m/eXYG5H16OfNIrIbiJbKernXBlESGdRLz4ThO5RZogp1NpcrJG2OGRFK/xeJ0Zy7SGbN3g==
X-Received: by 2002:a5d:97d7:0:b0:763:d799:cbd1 with SMTP id
 k23-20020a5d97d7000000b00763d799cbd1mr9065795ios.16.1682989699336; 
 Mon, 01 May 2023 18:08:19 -0700 (PDT)
Received: from aford-B741.lan ([2601:447:d001:897f:8257:a536:d7fc:1919])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056638329000b0040fb5d5429fsm4836329jav.131.2023.05.01.18.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 18:08:18 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 7/7] drm: bridge: samsung-dsim: Let blanking calcuation
 work in non-burst mode
Date: Mon,  1 May 2023 20:07:59 -0500
Message-Id: <20230502010759.17282-8-aford173@gmail.com>
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
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The blanking calculation currently uses burst_clk_rate for calculating
the settings. Since it's possible to use this in non-burst mode, it's
possible that where won't be burst_clk_rate.  Instead, cache the
clock rate configured from of samsung_dsim_set_pll and use it instead.

Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 +++-
 include/drm/bridge/samsung-dsim.h     | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 53099461cdc2..1dc913db2cb3 100644
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
index 76ea8a1720cc..14176e6e9040 100644
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

