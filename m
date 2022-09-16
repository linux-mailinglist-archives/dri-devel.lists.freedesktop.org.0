Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F45BB1F9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 20:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C5410ED82;
	Fri, 16 Sep 2022 18:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C110ED79
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 18:18:49 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so480929pjq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=aoALU8tXwdf0pdOg1lEf+wK1oaye8Av68gUGwS5JTQY=;
 b=gfewwGUiXZevRHwv6K1hSgSIfqy/8Gc2p/ga6LvThuxW21U6vR8FEn98k+OWQuBMNz
 vN/IXa0/V3T+dAR/DxmX66FBSbQClVpe7ZyrLm9MF859Ggl+ewkqNrK1oHfJuHr5VMFc
 pfzrCWdR1rTH57CDDuJtCOTthZzvjF/G3ZI0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=aoALU8tXwdf0pdOg1lEf+wK1oaye8Av68gUGwS5JTQY=;
 b=r8R7j/L8BkFFdM4JVPt2+2KGrS6aDd216bZGFN5te09XzXeFwk77k4NEP2k2XHMBIA
 K5QaoTLQlXwC0o0G2RY+Hqs7n7PGfAWd+TPkWZQdC9yU0fXeh+Vqs0BtwGsg2W4rmjQA
 REwAci3LsuJXBHyoRhon1spaKicg6rPmRZUvGKJ3tuFlES7NPsiMW9A60Nz7gXH5AAch
 v74McodFJPruRtAEDbqSX7I2rThZdGK+go60pOMGqHlgQ6QMssgtxSyfie3L5DAC25cY
 20HGRT+HO1ZIGVNq3eTfO2WOhT+K5Cba4MiSVn0erfUkMyOgDJ9+2SK7DrAd4TofU5r7
 oWZQ==
X-Gm-Message-State: ACrzQf0QpJ1cwr8XTO02anmJrUrfw1bHlSVvjpSVLxdnxQDsHKXiBr0q
 V5+PrTeAVPRjPtQbDRv8t6mFsw==
X-Google-Smtp-Source: AMsMyM6L5QwK0HbTFT7V2woguX3+SQNsN1tTXOU9mmgVXpHSj0RnjRqZrD9Oo0XFOpUOQVKqcth/Zw==
X-Received: by 2002:a17:90a:fc96:b0:203:86f:5a86 with SMTP id
 ci22-20020a17090afc9600b00203086f5a86mr6911471pjb.108.1663352329511; 
 Fri, 16 Sep 2022 11:18:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:18:48 -0700 (PDT)
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
Subject: [PATCH v5 04/11] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Fri, 16 Sep 2022 23:47:24 +0530
Message-Id: <20220916181731.89764-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 2e79fbfe2a7d..eac2dc2f24ba 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1568,7 +1568,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

