Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC85F1AC9
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 10:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA1010E4E9;
	Sat,  1 Oct 2022 08:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629BC10E4E9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 08:08:06 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id v186so6116105pfv.11
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8w8yLdkBYp8fmjlqiLKDKImnbgR9vL2oirXeCiK2yvo=;
 b=BfXJd+n+S4aNfwtACs6jSgrH6FcHo9roH6nQlbBDI7+IqxVouQrHJXancNUN1b54+r
 YDr8ZqHphVjCkUS5RJmRPzj0hssFDXTgXtTnegN3TpqRaMnvckayZgh0D7MMP3qjdOhu
 OWHwL6aZBV3rcdggYzE9hjTCrETE4S/mG6wUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8w8yLdkBYp8fmjlqiLKDKImnbgR9vL2oirXeCiK2yvo=;
 b=5PbrXUa3/UgSbuEXx53LQoViPz3IryYTWLYHJ1kTSz4m4utf4TdHwrHpK3AomONcIx
 lP+EU92RBnizyOXHMXq5DUpa15qijtLDj8VSMFDDc7HbIJdAkBbXNssI1k8qn0DauODo
 fqdAQIb2rHmTuubSf5wve7teiGG4oZtlvFI1tvH2zFMIEUg8HFGUBQ4Lqui9xjpy0m2O
 t0PWP4LKAm/VSUmpoWprO/vNoGks4nIhdZINvDvj6rMD8aGOl0GUS0aZyMS64spKcZaN
 5BwwWkVKKTdtQMHjnxHHUCJsf6nofRjzhswGkl4wKJW/JDe6/SR+gy2vTkE7MBjT0zCx
 eM1A==
X-Gm-Message-State: ACrzQf3ibGjBL+TfWWqG8hyq0HH39mSx2etYzIAdPwR72JORlT+paKTV
 sohOtkoV6IHP0KhEWZ9JWPbSDw==
X-Google-Smtp-Source: AMsMyM5PQLLtGy13dGbF1U4VNyG4/4E8lKF4ne0P7BIV9/byRtOgpVP28HPjl4VFw4GIs5LCh0HNsQ==
X-Received: by 2002:a63:847:0:b0:439:22e4:8e49 with SMTP id
 68-20020a630847000000b0043922e48e49mr10565092pgi.165.1664611685994; 
 Sat, 01 Oct 2022 01:08:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:7254:4392:bc7c:c69])
 by smtp.gmail.com with ESMTPSA id
 c194-20020a624ecb000000b005409c9d2d41sm3167041pfb.62.2022.10.01.01.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 01:08:05 -0700 (PDT)
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
Subject: [PATCH v6 03/10] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Sat,  1 Oct 2022 13:36:43 +0530
Message-Id: <20221001080650.1007043-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221001080650.1007043-1-jagan@amarulasolutions.com>
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
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

v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e41b6eeef622..2ba909ec5239 100644
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

