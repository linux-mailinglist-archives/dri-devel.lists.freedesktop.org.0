Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3B6249AE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718E110E7A7;
	Thu, 10 Nov 2022 18:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E810E7A4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:40:51 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso5620208pjc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5JIaDuFSCbEdTKjuhBG+/b5UleN8wJEpIhsi/EFtH8=;
 b=nnGEqEt15LumDp297u7w4f7TN/yO9p8F+tPPoh+iATM4fTBzTgOUb01UUoyR055hqe
 g8l+/JQ9bwwU9TUOc7P7yC2llTJf1/KODd39rbnRRJacHP1g9ENmgnCk5gWMDl4T5c2h
 vzk/EPlv4TRhCBlAUsLC+mbBGA15gzUhpl/tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X5JIaDuFSCbEdTKjuhBG+/b5UleN8wJEpIhsi/EFtH8=;
 b=PZOAGqOpTofzJNW+Mh4zhrRkNAV1lRNTUIB8LRkP5Xx81sGCklzdYys2zuvrtPQOTq
 OICIOCI7tk5FycQQV9yH1dyVq8R0X9OcnvkUaA5O295LMFLJRrkFf56LpSNE7hMDFFHV
 yP/vZhy8sDN2XekYZx78e5O/fTe4Ls0oL56qoAJ8madupPw4MMNSSaDwy4Uo4O1T5ZOj
 rTbH3ENmN+7dqCBn7V94iP4BwOga+rPBJtH1EgAjJHhxjFNwbhYBmITLck9s3RNI6PBY
 wC0QFujZsBqwX3kIOZ2sKjMxbSom4m0I29ZNyicx/fKHNR9XHoNoMm3wsAfpbYDUuw2A
 iHHQ==
X-Gm-Message-State: ACrzQf11iV9wXiegbDsbEmsRn8RNpwRZU/WXIxWGfitIOKplHoH8gKuv
 e9JiJdTR8FIfdAbNLFrb2ebasQ==
X-Google-Smtp-Source: AMsMyM7CVIjHAsTgNgZfQCQybvuO8nlDgkYOxslygcWZqcMPYuVYbnw6U7pFo483qM+hXQzddxpOCA==
X-Received: by 2002:a17:902:e9ca:b0:186:8624:9675 with SMTP id
 10-20020a170902e9ca00b0018686249675mr65016542plk.76.1668105651614; 
 Thu, 10 Nov 2022 10:40:51 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:40:50 -0800 (PST)
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
Subject: [PATCH v8 05/14] drm: bridge: samsung-dsim: Mark PHY as optional
Date: Fri, 11 Nov 2022 00:08:44 +0530
Message-Id: <20221110183853.3678209-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110183853.3678209-1-jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
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

v8:
* collect Marek Ack

v7, v6, v5, v4, v3, v2:
* none

v1:
* new patch

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 1c1a824b4ea7..bb1f45fd5a88 100644
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

