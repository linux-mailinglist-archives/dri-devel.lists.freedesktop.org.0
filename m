Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C664851E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA0E10E548;
	Fri,  9 Dec 2022 15:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136CB10E548
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:26:38 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id fy4so4861602pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XR2mP1JnKgTB9iSs6i/XkB+If2tnTWx4uTgT0kVlzzU=;
 b=nH7zUYD6q2rqs/QwFd5s+oyAxIFpR/90LVBW/zgcFhv/Q98L/S9pQV3FqLiTRPR5+S
 oXaLpFWkhZ9MrPk0GowiWMvdUoDQRJUOjOevXAavcMcX9bBuElp1n3fO6nO2CyaryWSo
 nTWpEbO9JjT7T6YQvGoIgA4GgQ/NYLbQ2uDhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XR2mP1JnKgTB9iSs6i/XkB+If2tnTWx4uTgT0kVlzzU=;
 b=ofOmJOp9M5o04/GBUrqrqKGt7hIbhXWKFx2uXUVf+5XFS/bMfNDrLXlJrYoMBFmAy6
 yAFhOmkzPYczJW2dkxDRWknJXHMhzwuAcoK6xo7JGJaGWzm+sSuAB+X5+IlElpTg8kWL
 hsBSqoktsgwn7J2B4NlkUr2kF5PdyZ4bF3fxnOMNsnudgAiCDyU1C1L+fjR/pwYt1w0j
 qFxBW2OaWdREIoMcUDZ8QWibkmyAnNm93v3tGS5AZtYQpkNvAAjuCeOL+5Oc3FXpagc4
 cnb1aO/O9Lnb97rnCUog4bUWXZRuIgd2xnqm9vB9OE1XYs91kUwniCp2srZ+2tl2vvJv
 OBMA==
X-Gm-Message-State: ANoB5pm5/Qqnu5wJCuiJU/RBoq+1RPGScLGky/xSaj1qqTdmOjf52XV4
 1c3Lf2brBq9raDPh2l7u97vCZQ==
X-Google-Smtp-Source: AA0mqf5Enm27VsCjbegzhTYWKdUDXU0bR4IfimOQ30n1+c/PruYmuWUPkY7qzhoSTOwBV2ovqLqI0g==
X-Received: by 2002:a17:902:6b8b:b0:188:a4a3:7bb3 with SMTP id
 p11-20020a1709026b8b00b00188a4a37bb3mr6207536plk.9.1670599597601; 
 Fri, 09 Dec 2022 07:26:37 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:26:37 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v9 08/18] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Fri,  9 Dec 2022 20:53:33 +0530
Message-Id: <20221209152343.180139-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209152343.180139-1-jagan@amarulasolutions.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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

v9, v8, v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index a4379c2ccb77..9adab5d372cc 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1584,7 +1584,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

