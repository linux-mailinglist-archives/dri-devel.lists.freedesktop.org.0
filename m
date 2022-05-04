Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D10519E33
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 13:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF09010F81B;
	Wed,  4 May 2022 11:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ECB10F81B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 11:41:11 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d22so1161523plr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 04:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SQ9haNco3NM8TvQE4oQrzscoTZTKBiwJWPBhK4nZTlM=;
 b=WZccA/sQszjIVx/2AhDkBWPBSzrzjiK8PfBg7P6oVXxPeAM/aMb7LT/YW1l8H9bWIg
 9h9J2tsIMmKRggenNI9KNyquubuh5wn3FkcG9aLzby30CkQEGJDL942e6kkad2++ZD6E
 5XtXbPGLSZy8qFOlOCDJouh0HnGj+UHk4gErA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQ9haNco3NM8TvQE4oQrzscoTZTKBiwJWPBhK4nZTlM=;
 b=JvT0CA11wsZfbtsVAQ4s2SdOdG6AztTKZTg8FU0MQMb1n5h1YHEJDUP+Mhbh2lS0qk
 UGva3sWnlct9wIHB7nTUkfaGH03swdGxk/KSkhe9kJxFgtIqacWA10fYeFmVjBhCTM8D
 ZYbV2+iMpENzdrZfdpOH6EwadY7e6HPpip+bmQMgAxj2GZC67H/OolQtZGri5125MUW2
 HVLcLFBK5jy4NJrZ2cdZ4Ueh6KXjFCNGn830DX4Wf2kneuQTVqVHcjHoyOZvCK7CuqGp
 3H284QFFc+kxWPSiPRPP205QyQC0OfGd6L8TMX+S7ctJzRdJYL1JSJeWfozriF2D9TJl
 n3rQ==
X-Gm-Message-State: AOAM531jMHzJbrmPpJp12iMr2L0+jScGPNXS68A+1MI3RFrKDBRtiyOb
 5Piw8wdw0GswUhtt3K2N0JVHbg==
X-Google-Smtp-Source: ABdhPJyV3t5mNkVoUubxK57UYYy+vL91bPwWh88omt8NmMduKR4j6eALzLELq+usTI7yeU+uQ9BWxA==
X-Received: by 2002:a17:90b:4a08:b0:1dc:6cc1:3d24 with SMTP id
 kk8-20020a17090b4a0800b001dc6cc13d24mr9883845pjb.131.1651664470714; 
 Wed, 04 May 2022 04:41:10 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:41:10 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: [PATCH v2 04/12] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Wed,  4 May 2022 17:10:13 +0530
Message-Id: <20220504114021.33265-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit
to reset in order to activate the PHY and that can be done via
upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 99f80e9c1600..60dc863113a0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1584,7 +1584,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

