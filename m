Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 998C86249A6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 19:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C64310E788;
	Thu, 10 Nov 2022 18:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF83110E788
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 18:40:19 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id gw22so2363080pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 10:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pI9nmADqBaRgKnAq2H3CdzUb+UwaNTPrY74SU7vfqFU=;
 b=l5FjXvkq5HVxEw3lCJgroZtqhB1QttJlrhOzmXeT/IxiGyPlLC39mt9z9oNuGaiadp
 4/C+ZSkY0zfO1f28o0iw532Wuo9/yD7p3dc64GqEvAikYDVfp/BbSHcAJp/Bhb9dwFeU
 Wdp3VyN025uy42XNOVGHSixIVwwRI4ne1eqLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pI9nmADqBaRgKnAq2H3CdzUb+UwaNTPrY74SU7vfqFU=;
 b=O1dhrj+QQukk+Yxv/RNHVpaYwcXZectHr6mPZL3gCQZ9f2QHD7lLiWDL4W7ET0Zllz
 SpRo31JrOuA1/i0MGGlYy5MJ1TuzB05MYeFPsx/gi3W6X89UqWyomJGb3IDVPdAldSFW
 YrlOLm6XM0HCpdXgA+UIy0yNSzqSVwL1zPwV7Te6m/bYXDIwQKL76G/qwDNzXUbPOW67
 +QnjXtY2RX8zPsjEtykPztTLH4fFVOOczFxf/mj7NQqGan42hL0Qq7cEacP47TbWVLjR
 /9HIVW03MZcJR2NcAxJjLMj2+6qvoatzgNb7BbvSzrW7+awaiSFQsnd4hMvcNQjl/f5B
 xU1g==
X-Gm-Message-State: ACrzQf1T13S469pb6EUOvGlFFpSdWI0oJVOhzY1bdyiAfpmORLn67eIJ
 roE9X/JYzn9O8MwnNNCtjPxHfg==
X-Google-Smtp-Source: AMsMyM5V3qpfdSSL+gEipc7vxlrSx04nNJNWcE7lsFbj5SuuWkLW12e3zhb0YHmc04dOOSTWCiyQtQ==
X-Received: by 2002:a17:90a:d814:b0:20a:b98f:b839 with SMTP id
 a20-20020a17090ad81400b0020ab98fb839mr1674598pjv.23.1668105619201; 
 Thu, 10 Nov 2022 10:40:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:b5a4:486a:f07:f67e])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170903234200b001869efb722csm11635627plh.215.2022.11.10.10.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 10:40:18 -0800 (PST)
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
Subject: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Date: Fri, 11 Nov 2022 00:08:40 +0530
Message-Id: <20221110183853.3678209-2-jagan@amarulasolutions.com>
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
 dri-devel@lists.freedesktop.org, Nicolas Boichat <drinkcat@chromium.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
0 = Enable and 1 = Disable.

The logic for checking these mode flags was correct before
the MIPI_DSI*_NO_* mode flag conversion.

Fix the MIPI_DSI*_NO_* mode flags handling.

Fixes: 0f3b68b66a6d ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
features")
Cc: Nicolas Boichat <drinkcat@chromium.org>
Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..b5305b145ddb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -805,15 +805,15 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
 			reg |= DSIM_AUTO_MODE;
 		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
 			reg |= DSIM_HSE_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
 			reg |= DSIM_HFP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
 			reg |= DSIM_HBP_MODE;
-		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
 			reg |= DSIM_HSA_MODE;
 	}
 
-	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
+	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		reg |= DSIM_EOT_DISABLE;
 
 	switch (dsi->format) {
-- 
2.25.1

