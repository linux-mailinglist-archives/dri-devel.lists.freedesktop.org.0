Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3141FEB8
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AD66F51E;
	Sat,  2 Oct 2021 23:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BEA6E056
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:51 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t8so22161156wri.1
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LiSqhbawJO5r3IUvawiiwgeuFYhTdPdUyp69JWKC0YY=;
 b=RLKyMz5XunVlARUy7/d64XjeBN0wMVsiKKSU5A4RfNlVRUnP7wT3ZLlKwMAz/gg33v
 2g98lyoeSUIkVDdTfiXGxnPwpYJrDKwBpQyacEvsTCdqgODCb9QiZQQCD6cGlwnQk6iz
 7/6I9RKKmHvs0SIO2fNkbI7NQ3u6Lq9wteOf2hmH36auRH4jPfnmDdtF1qVkqB0Vlp1B
 qPNe3s/DCVVdg2yQ0RlJ1MS4XBdDXustgGkGXdQDgpAC8O98ZC1qM2/gHiX6Ij24BdRM
 B+uDLcEBdM7K9Rg4UwP7MVIihfOLxrBkXvgA1e535vD40jbgLAIml4imT3LHuZssfEfq
 zS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LiSqhbawJO5r3IUvawiiwgeuFYhTdPdUyp69JWKC0YY=;
 b=APRGM39ddxghY5J7OuYd1G1+VuKdLCn2IxyTLmDhi5xwQf/CXTh2XmSnr/Myxts63l
 kZ3BuBCN8wABaTLKW8J9T/cjlDsWwwqEiaWzSkBVXGDp1JjN7hE/hSsZUsFYegzYjp9H
 W0wOaOeRUDZS2WnWQwcng7wtKJ5rZYDX04p285seuhPic3kGMdMkwvK/9Eh7IS1PR9zM
 8kPuu4FGGxYCPUKqmmxsTb5PK17vhSl39uYiA4320lWx0cEnTGC5GKP5Mum5HR8qDbqz
 cqSWWHDs3nrNY6sGB7OnwE+UuG469n2FsQOv5tIASanXd9RgKOFEwQ/sHQmT8kXJ7nsV
 /beg==
X-Gm-Message-State: AOAM532Tw2qQ6UYtI9N7RJ5+1VYqF/sQ2txOm6DJ2/4Uc903yggYbkIh
 lApoF+gbSzmU1ME1tgSKmio=
X-Google-Smtp-Source: ABdhPJy/rQFvXc0iU45thEFuaYrZ5nHGnq9iWL3+N1XVO5WO7rmDCrrAWEjGg2cLndBu3oAJOkdw7g==
X-Received: by 2002:adf:aade:: with SMTP id i30mr5362961wrc.384.1633217749882; 
 Sat, 02 Oct 2021 16:35:49 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:49 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] drm/bridge: tc358768: Calculate video start delay
Date: Sun,  3 Oct 2021 02:34:45 +0300
Message-Id: <20211002233447.1105-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calculate video start delay based on the display timing instead
of hardcoding it to a default value. This fixes "trembling" display
output on Asus Transformer TF700T which uses Panasonic VVX10F004B00
display panel.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 10ebd0621ad3..5b3f8723bd3d 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -634,7 +634,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	u32 val, val2, lptxcnt, hact, data_type;
 	const struct drm_display_mode *mode;
 	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
-	u32 dsiclk, dsibclk;
+	u32 dsiclk, dsibclk, video_start;
+	const u32 internal_delay = 40;
 	int ret, i;
 
 	tc358768_hw_enable(priv);
@@ -663,23 +664,27 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	case MIPI_DSI_FMT_RGB888:
 		val |= (0x3 << 4);
 		hact = mode->hdisplay * 3;
+		video_start = (mode->htotal - mode->hsync_start) * 3;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
 		break;
 	case MIPI_DSI_FMT_RGB666:
 		val |= (0x4 << 4);
 		hact = mode->hdisplay * 3;
+		video_start = (mode->htotal - mode->hsync_start) * 3;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB666_PACKED:
 		val |= (0x4 << 4) | BIT(3);
 		hact = mode->hdisplay * 18 / 8;
+		video_start = (mode->htotal - mode->hsync_start) * 18 / 8;
 		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
 		break;
 
 	case MIPI_DSI_FMT_RGB565:
 		val |= (0x5 << 4);
 		hact = mode->hdisplay * 2;
+		video_start = (mode->htotal - mode->hsync_start) * 2;
 		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
 		break;
 	default:
@@ -690,7 +695,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	}
 
 	/* VSDly[9:0] */
-	tc358768_write(priv, TC358768_VSDLY, 1);
+	video_start = max(video_start, internal_delay + 1) - internal_delay;
+	tc358768_write(priv, TC358768_VSDLY, video_start);
 
 	tc358768_write(priv, TC358768_DATAFMT, val);
 	tc358768_write(priv, TC358768_DSITX_DT, data_type);
-- 
2.32.0

