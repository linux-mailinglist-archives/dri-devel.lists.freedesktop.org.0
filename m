Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59557BAD7
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FFCE8D6F9;
	Wed, 20 Jul 2022 15:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 729858D5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:53:06 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id r186so16756099pgr.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FpNHItAiwu0m52sC3pwbotY9M6xqSP85k2SUYkR4F+A=;
 b=lPurvLEtAzdCctBqQCCtusfet5pL5hgD2AbZEjqT/e61F3wOg3UEydk2YMkjqe2sKq
 9CW+AKWaLb5ATXkfm5dRrvyxto2zuDnk6ALJMGuVWStEAt1A37zzie+P4afSlyB96MKC
 ZWUomieQpZSDGPNCGQZSj5ZwWGIunGo0KPwI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FpNHItAiwu0m52sC3pwbotY9M6xqSP85k2SUYkR4F+A=;
 b=OwdNJS6/q9eW7WzFLlaJb6xxnuwLAEe0vvIXe/Pyj3L+gaF+xsA1V2/z4H4mfRMDEs
 8ISh5mzvFtA9evzqFRB+Q2EvgUk5GsBQ//zWGohFlrLk8naa6bJKcOP0SYZy2INgybgc
 /0uLwA1MFdzqh/1t1ZwBT0rH8e+i2hWUtSe3cEp5soHRAvNsNhNxrjzugvNONO4XK1Ef
 ySxZgry8/thvsPQXSh+9w3/Vjm2WyUfR49QtCBzrE7I5oIwUHf1d/CV1xe81CHHisYDD
 pXYa2owbGWMfG/YXEZ29MsqkMyors6XvwYcRij048gnLAPx+pGfFBDfisf/ibwPRN6Fh
 s6yQ==
X-Gm-Message-State: AJIora9cRc81cdvqnzFBQk6Ceyq4VqDECMLmgzf2s1oRg7VnIrxwql8s
 yqzSfToVT+LhtzcjyXkaXic6sA==
X-Google-Smtp-Source: AGRyM1tvNubQhLd0y80/Nb0oQe9wwe7GN/cevALO7+n5VX6hSZl09GrQH8Is9zCkMDqymqYtiIzAkA==
X-Received: by 2002:a63:904a:0:b0:415:18b4:ea92 with SMTP id
 a71-20020a63904a000000b0041518b4ea92mr34007714pge.551.1658332385950; 
 Wed, 20 Jul 2022 08:53:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:53:05 -0700 (PDT)
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
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v3 05/13] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Wed, 20 Jul 2022 21:22:02 +0530
Message-Id: <20220720155210.365977-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 4d5f72de2240..9b74a3f98a17 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1583,7 +1583,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

