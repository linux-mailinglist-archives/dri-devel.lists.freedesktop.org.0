Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D13677EE3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48710E4C7;
	Mon, 23 Jan 2023 15:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB73E10E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:13:06 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id p24so11653830plw.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
 b=l5+Ef8r4rNFiRhhs0AiJc3Qbr7UUlHM8S5pKNDBWj26bpmEB1JxtEFBaJ55mcH9K1T
 I405/zKKEMWf6rZGt+13ymYRWMhMqOdKM/Wwn03uLEF7S/c1PG7xW4CTSWf87BvDsbtL
 C8ij67LGu87JJTpGP5lTVZQoeo1zZapDPWUL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OP7Jau0/ejAFJB5Wx1RIrnmlhV/a7KNNElWN91vRccI=;
 b=oJqzSUym0H8bdMQByEdpePx5hQJWc9okrg4FuMuyrVM1/W+Vv3XAdmpgM9/lFPYm2Z
 Em8K7aMCcbya737RvSiPczri4AJh4nfbr6Qf4+zugKIoQqAAKX5hcVovyLEcpRAf+tQN
 mKSgwIf/FOzXUk7H8sHZ1ZUF1mPd0ziaZLCe1J6TaJCYfb3wvQNjbGSH2lyla1B+j8T6
 mdItVQedi5avQiGg3d6MOBWJQuFkE+rQ9o60UrpYDWTkmiLGcb8b3cynHL4dZCH1/AxH
 iFKbqrUJLSubk6WgGVIoCXhfF1EOPMmHhJAHNIAVFpXZmE+T4Sevc+KMr2anv8SvQXi+
 6Heg==
X-Gm-Message-State: AFqh2kpHIZXDF+/0VuFWfwCGrw/zJdaEQjuxLGgwGU2tZX2e3diRXZiC
 MyWeKdTupJ2wg7j9sTSFpk6jYA==
X-Google-Smtp-Source: AMrXdXvWmN8cB1fzCP2Nd8Yh2Gzd9nFYsyRDEG7fEvcNg//ZVqix++YjKwydaa01JguD0qhGcTs2EA==
X-Received: by 2002:a17:902:a408:b0:194:98ef:db00 with SMTP id
 p8-20020a170902a40800b0019498efdb00mr24530354plq.19.1674486786305; 
 Mon, 23 Jan 2023 07:13:06 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170903230500b001754fa42065sm19207111plh.143.2023.01.23.07.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:05 -0800 (PST)
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
Subject: [RESEND PATCH v11 05/18] drm: exynos: dsi: Mark PHY as optional
Date: Mon, 23 Jan 2023 20:41:59 +0530
Message-Id: <20230123151212.269082-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123151212.269082-1-jagan@amarulasolutions.com>
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same Samsung MIPI DSIM master can also be used in NXP's
i.MX8M Mini/Nano/Plus SoC.

In i.MX8M Mini/Nano/Plus SoC the DSI Phy requires a MIPI DPHY
bit to reset in order to activate the PHY and that can be done
via upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- collect Frieder RB
Changes for v10:
- add Plus in commit message
- collect Marek RB
Changes for v9, v8, v7, v6, v5, v4, v3, v2:
- none
Changes for v1:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 4a165764121d..5918d31127aa 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1687,7 +1687,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

