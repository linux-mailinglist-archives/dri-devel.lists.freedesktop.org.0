Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA605648506
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 16:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55AC10E542;
	Fri,  9 Dec 2022 15:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B671410E542
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 15:25:38 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t2so2222127ply.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 07:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CUJYu0PBu1wfIOC7kGOkRHJr7T1+ycl/j32CgnvDxw=;
 b=BNqDuX9tCXUwEPPEht+0AtSFgnlyXtEfwk5mlTDou/QjBGbxg9H0RiKTcLx1xGgD9j
 +PD333SYes27F95zWb5J9dfT6mlpPftq+QRAoPUzZe7i/+/UEWt4Ov4wFOsG6GYubiSe
 SBSSVq3qOVziT57z4MuOHJh21bupHIvwL6QCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CUJYu0PBu1wfIOC7kGOkRHJr7T1+ycl/j32CgnvDxw=;
 b=r+0GVooeCoYcQeACka5HpWVyv8zIrSU6xGEv0uFQ8MENpUglwk3/vgEgV+9+9N95s9
 VHylVCPO4aG/WErVTKt+nxSIUQYUeK3R/g2CMC44SyemVOdB3c/QpvOqPgVaOqd25qlV
 B0gGDjC4pNaGVruzKzBuPP189Td6WVxTGCURy+d98L4wo9JoJqwGRmgBwf2UhrXw5sNA
 sqoIJqOy0r87JIlPKlawpDn95AxlGgOjJG2T9Mu/iVWMXPsimMzy/NiqRus6LBfKa9Cl
 J6XrGpmvydiH1N5/Wp0JEkqdyKrJ/kGbT8DCrHEIwHRyGg/A0JDN7x3Uzu2mXK8P6pKf
 AJdg==
X-Gm-Message-State: ANoB5plfWbxFUWBdYXgOZV3KQBXXw7x3o1HF9HFVo9AuV0SkNgHtDVKt
 6TaLT0P9Z+QNIuEyqAvAdefyAA==
X-Google-Smtp-Source: AA0mqf465vsLSnLp/ogCPrLxZJp71LtF3FRDfQ+QQy3YrIC+dGWepCwsDCXMx3VH4Fq/lJnFoIGrqQ==
X-Received: by 2002:a17:902:c745:b0:189:9519:87b6 with SMTP id
 q5-20020a170902c74500b00189951987b6mr5017053plq.5.1670599538323; 
 Fri, 09 Dec 2022 07:25:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:6ba1:bbda:c542:ba0b])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a170902ec8e00b00188c5f0f9e9sm1477587plg.199.2022.12.09.07.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 07:25:37 -0800 (PST)
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
Subject: [PATCH v9 04/18] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Date: Fri,  9 Dec 2022 20:53:29 +0530
Message-Id: <20221209152343.180139-5-jagan@amarulasolutions.com>
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

Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
features")
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v9:
- none

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index e5b1540c4ae4..50a2a9ca88a9 100644
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

