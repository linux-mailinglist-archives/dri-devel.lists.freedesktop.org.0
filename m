Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D686A40E8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727F410E3D9;
	Mon, 27 Feb 2023 11:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419B510E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 11:40:13 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id v11so2842225plz.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 03:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OIgviWBqKUtGyYA8pNcGlHAIxKkXaoAhqP3nf0sw740=;
 b=rOiJ8pyf9kmHJjVRYdsBFOn86aOpsqmNLaPTTXPNvp/OLocQQiYgOkP3MYLb5ubNtC
 kqRDW1tyqgXGYUoFC31gGKSyHB8WJGsueLh17oUzeuQxZx5t/zuUmT9wF+XnmFVRdPTq
 SOg3NlHis5PfCNdG5YsiPd5j3d+bhWaAF6RdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OIgviWBqKUtGyYA8pNcGlHAIxKkXaoAhqP3nf0sw740=;
 b=fZXBY9V+d/1lr0VGsTkR+N376F6LEgnTVLeAdQAznEtisdkxrt9oXoEnb24iCKe2/q
 jMhkRo7liUPq0DmjzB8e+0hj6bPMeQwNv+Jgrjg+D4qD+qg76/QTQgCpHEUJzImlHtCG
 AKCRLF6wroL79h6DXIjZi7bCIStVS3kwByw/neHD5QQfWXZZ5bI9w0yVwJ9qjgife4qf
 TqzNz51UVQeI4B8ccj3lGnyGaqJyUBkgElNrxBzGRiDxrk3O0OwezUKgahndvmKm0idI
 Wb68O5Oq4NeTZrh+s9AjjBjgeORweVVoxGzhdPdnyuugijZrEI85A7xWTu1ReEr8s0nm
 4LDQ==
X-Gm-Message-State: AO0yUKU7tsT5wVZbChnr1Ro6NI9TE/7sN/MQm+3OhBCDo75jyw/H2PcN
 9C6XDUbay/qRGe4/xRYMOA8fhg==
X-Google-Smtp-Source: AK7set8IpvK1WwFCHMF+/wUkuolgkNdF5M5D/xwxylDkjMmreSt7PbWPqSfF/mjoXnRcQURBcC+wCg==
X-Received: by 2002:a17:903:18d:b0:19c:f232:4604 with SMTP id
 z13-20020a170903018d00b0019cf2324604mr7364687plg.10.1677498012743; 
 Mon, 27 Feb 2023 03:40:12 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 03:40:12 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tim Harvey <tharvey@gateworks.com>, Adam Ford <aford173@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH v13 05/18] drm: exynos: dsi: Mark PHY as optional
Date: Mon, 27 Feb 2023 17:09:12 +0530
Message-Id: <20230227113925.875425-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
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
Changes for v13, v12:
- none
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
index 12a6dd987e8f..529e010291c8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1699,7 +1699,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

