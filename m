Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30155F5738
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176C10E1B6;
	Wed,  5 Oct 2022 15:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A4C10E118
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:13:25 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h19so2427261iof.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 08:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+gTdmBPImvmtEVJ8K/TFFMRIl9dCboj/pEZUj0+angg=;
 b=hRGiJg6r86Qx2vzcgKNRqffsScJo8TRPdUfC2V5sazPpG16nRUdDbe/LNhd+x6tdw/
 3kmzy8kPdvpwvaGJcmL8NHs3ph8WEPww4T+zX2vbyxg07MWdFH6Xg4kUhjcYm8ZmV/pX
 Wdyyc1BttPpcC9bKRU/RGVMZBCT0wpNjeuLtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+gTdmBPImvmtEVJ8K/TFFMRIl9dCboj/pEZUj0+angg=;
 b=OPedRBfvR2si8fp+huj4iX6ZmOy3GJg+AHkEU3lnLKDwye9Y13BymKviEx8WNsO3rk
 bp+DCUfJrGj3KNN3FsUUXI4dx+QUPXpohSotAB80eHPpIqnMPuoeLom4VWwjnTcc/DW/
 lB02NBsJ9stnDH2SKNHvYVSfC9CvpEdxuDw4Pdqwc6eDyqhmFxAo0F71dBQVf0tqfSdE
 zW+AMio0OB0q+eeDyCtu7fQ8VzQWWwz+C7A+B9VCAYr/VNxxO6dWcUW+t0VoLz73/Bov
 KIGrCjP630tmTGDyO+NtVhcoP/D9dIQF28QoTJi/AbR/KK9W4U15Dih5FVIpGzDCRXd9
 0Hbg==
X-Gm-Message-State: ACrzQf2X49wmpP8S4rP0md8jy2uxVkFyPi/T6HFmaOc/aRpSyLMikOVe
 dCo3vs7tFzxtshXa4Ovg4MAvhg==
X-Google-Smtp-Source: AMsMyM669NtZBL1QivoK8jgGFSq7WGsixMsDmqYfcu/B429dwt1+UYojmwbDgFtiJAkyBn4M5fDE2w==
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id
 x9-20020a056602160900b006a1899ebf36mr146502iow.121.1664982805048; 
 Wed, 05 Oct 2022 08:13:25 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.stthomas.edu ([140.209.96.21])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056602034f00b0068a235db030sm7089276iou.27.2022.10.05.08.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 08:13:24 -0700 (PDT)
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
Subject: [PATCH v7 03/10] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Wed,  5 Oct 2022 20:43:02 +0530
Message-Id: <20221005151309.7278-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005151309.7278-1-jagan@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
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

v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c34c6abac815..1bae3673151b 100644
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

