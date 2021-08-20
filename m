Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DD83F3993
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2B289CD8;
	Sat, 21 Aug 2021 08:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BD36EB2A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 23:22:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so2086185pjx.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 16:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2pzolqc815RjMI9YhMzA6Tlcrcb+M0ye/v6UQI/kAg=;
 b=D0Hus8QLYhoe/UI2jm1sRI0wXMZweQjO5TQA/lKbb2BjDI73hBG+vBYRkeVymw1PfN
 OkRbLm3/u/spR/U8KnxqsKscPSA055gJ2XyldkDuRSj2vjkx3r9mdxS/kwxvlYuj0QO4
 1LNfNF4FqNfff0idQi0mU9ER37CvLJ2oXAp/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2pzolqc815RjMI9YhMzA6Tlcrcb+M0ye/v6UQI/kAg=;
 b=jc0CrQdx+LmjQNLC5CbigPqA0afp6lvGrtapAyqa/eDkh5LBNDD8ts29dLNizr60eq
 0tAqN7qfh36yERMBrbhM/PIE4hrwrCgDu0lfkSTBaURH8SMl07RNkj5wLRHMS600Q9KF
 YW1gA4ovItp2er3G06XQtsjzbLWOiOZEjjqYfjZ20QsCbzvUxc5HzGhGlkqvK5+8X/W0
 1DUFKI0fnnqwDYdxvwyI/V/swKrnXjiPMiPdbGKYsiu/0VX+hQosHV4DRhGhmBEFDCTp
 V0g7sh4+3XYDG/Q8oc2yT/c+/6tjMoM/1SRjcs9xUZREzeyrHZdjif8NtnXwi5POo3J6
 ejjw==
X-Gm-Message-State: AOAM532Pq7SYThYxHMkR5HG5Or6AC8VRKD32OQLHDnm6cutotG75c8QI
 Nl29173ygTxUAketbzTUghxstA==
X-Google-Smtp-Source: ABdhPJx7uVadvYtdEXuuDf6IIWadfqlD0ERILqDaKs4tcK+Pnpc5LDC/MAAhWIyc2Uv2zOFT+jzVGQ==
X-Received: by 2002:a17:90a:f98d:: with SMTP id
 cq13mr7209752pjb.211.1629501728882; 
 Fri, 20 Aug 2021 16:22:08 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:3c8e:4054:efb0:e39f])
 by smtp.gmail.com with ESMTPSA id gl12sm12579496pjb.40.2021.08.20.16.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 16:22:08 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
X-Google-Original-From: Philip Chen <philipchen@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Philip Chen <philipchen@google.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: parade-ps8640: Reorg the macros
Date: Fri, 20 Aug 2021 16:22:03 -0700
Message-Id: <20210820162201.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Aug 2021 08:46:30 +0000
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

From: Philip Chen <philipchen@chromium.org>

Reorg the macros as follows:
(1) Group the registers on the same page together.
(2) Group the register and its bit operation together while indenting
the macros of the bit operation with one space.

Also fix a misnomer for the number of mipi data lanes.

Signed-off-by: Philip Chen <philipchen@chromium.org>
Signed-off-by: Philip Chen <philipchen@google.com>
---

 drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 7bd0affa057a..685e9c38b2db 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -18,16 +18,18 @@
 #include <drm/drm_print.h>
 
 #define PAGE2_GPIO_H		0xa7
-#define PS_GPIO9		BIT(1)
+#define  PS_GPIO9		BIT(1)
 #define PAGE2_I2C_BYPASS	0xea
-#define I2C_BYPASS_EN		0xd0
+#define  I2C_BYPASS_EN		0xd0
 #define PAGE2_MCS_EN		0xf3
-#define MCS_EN			BIT(0)
+#define  MCS_EN			BIT(0)
+
 #define PAGE3_SET_ADD		0xfe
-#define VDO_CTL_ADD		0x13
-#define VDO_DIS			0x18
-#define VDO_EN			0x1c
-#define DP_NUM_LANES		4
+#define  VDO_CTL_ADD		0x13
+#define  VDO_DIS		0x18
+#define  VDO_EN			0x1c
+
+#define NUM_MIPI_LANES		4
 
 /*
  * PS8640 uses multiple addresses:
@@ -254,7 +256,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = DP_NUM_LANES;
+	dsi->lanes = NUM_MIPI_LANES;
 	ret = mipi_dsi_attach(dsi);
 	if (ret)
 		goto err_dsi_attach;
-- 
2.33.0.rc2.250.ged5fa647cd-goog

