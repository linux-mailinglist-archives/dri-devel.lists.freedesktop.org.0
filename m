Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2595A541D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CBE10F6D0;
	Mon, 29 Aug 2022 18:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1153410F6C9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:41:30 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 z3-20020a17090abd8300b001fd803e34f1so6957970pjr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ekS3WKj8dCgDC2uR7us15QLNPxhzQvukxO9+hGPd1Fc=;
 b=HnbXs1ML66kxEnNABMLGgQzYP9+Mx/9aOdoFNZOeNZP13+7t3gxkTo9aHFnit/8p39
 +qJrpHfU9ORiAamjeK1hjEi1aOXZGWXm7A/PL0QgDh4+rKFXEO8F3+duantPVOt6Vhrm
 CaEwNKBHjHmNuOKWMMxL9DPkxrePRVG8yX7ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ekS3WKj8dCgDC2uR7us15QLNPxhzQvukxO9+hGPd1Fc=;
 b=EVcFTrOA4VrsB3ami/rnWbPFqXixriMDKrav7k61M6qJGWPz2PJK1+YwMl7wgAfama
 1dLdOG9SdRQdg0ddylqeZLIOYEbzeltnjn5KapMLuhv5gCj2sQJB7qCBXAZ9JOzIUCgV
 yBHuDt0nWS0xN86+EQrE18/VrqEgS5raS1rDXzZcNbaPysFu3hrEceqvwH1EECOy1Yjq
 4OPMUE5gX7xl/m9QWeeGCSQvPsGB4kFkZvacIwz/O9BFg8Sb3y+vnRzsJ7f//AAgfKXF
 ztQ34MRXT/AZaSr0oWYL2PXGc+JrmWKlxQ2rOB48ShQ9CdOHUfBnAxB575pDqo4CK2bV
 21ew==
X-Gm-Message-State: ACgBeo1GTIjaO60A1PGEspPpXYNv+2G4gJJmNZ2viwMGItpnXFVs9Wja
 vuWnvd76tCPY3ihnaHwFrZDBVQ==
X-Google-Smtp-Source: AA6agR6igcVBbT/LUR6Sd+1DiAgFRJV3DTmCSHTSH2MW//x0unKs5bFAKtczc3KvcelUDCNwOwqItQ==
X-Received: by 2002:a17:903:4043:b0:174:dd99:a589 with SMTP id
 n3-20020a170903404300b00174dd99a589mr4510335pla.56.1661798489606; 
 Mon, 29 Aug 2022 11:41:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:41:28 -0700 (PDT)
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
Subject: [PATCH v4 05/12] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Tue, 30 Aug 2022 00:10:24 +0530
Message-Id: <20220829184031.1863663-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 76dc7687857a..c3ed317996ad 100644
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

