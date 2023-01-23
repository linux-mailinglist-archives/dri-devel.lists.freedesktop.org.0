Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15FD677AC0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 13:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2EE10E350;
	Mon, 23 Jan 2023 12:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBA010E354
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 12:23:58 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d3so11181660plr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
 b=U7Z/TTCIXdU1Sg8aWRDeI4EW9B6BDnjXjN/NsswcIDm1lLUWgrtpk9bwW/f9cS9Ity
 ct+GTV+8hivlaXqKBcSQbm9BosO0N+UM8D8jgUbj3w1QFRVU5MDnTB8daGcCnbnkj3hU
 dsPXO4rxOnxnMomq7IDeyg9YZoFPijgQEEUCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzZAbpiEnBNpm8Oq4UXR0GXlgPppEqEywsWppVlOZ3Q=;
 b=R572msUomAtjZVaG0qEHGCTLgita1SuNnGbhpOILNZV8AM8YEEep2VmGO4/uZaZ29A
 SjdOpqv3ROrQVxqMA996pCQXb3Mx60piUBOFBc4opDAR37qwUXhOHnQWfUUw0LCszAjQ
 xNzEa5v5SrkWTvsDB1qardamHhOybl+tcwPq0kZvhU/pRUPVJGzXl9F3AwkrAPqwKXb/
 zwRQu0Td3b9QB3DS3XPCEURWZHcXz1M6ZLK/B4ZK92sTfedvJI4JMPhpYn9jzciM1qxj
 BlAY/28auZUjKQmRn+K86x+AvlGzAnPgR0AXQe80vKiV0ChMGyxq/Ig1Eh2QajAd5yid
 5+ew==
X-Gm-Message-State: AFqh2ko0Fq0/1VxTMab2oPox+S+vXOou93j6r6rk1fULTEYVRIcLU7Ok
 L+6zQ8WE960AnyuRKy86frx1VQ==
X-Google-Smtp-Source: AMrXdXs2nxMlWnkjtQRTXuSpY/fBRpS/WCIrtfmXgMoW57GTUxJRy4ekcMfUhkF4pBa6T+sZfe97Fg==
X-Received: by 2002:a17:902:7889:b0:189:5ef4:6ae9 with SMTP id
 q9-20020a170902788900b001895ef46ae9mr22040224pll.45.1674476638215; 
 Mon, 23 Jan 2023 04:23:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001960806728asm1291811plg.88.2023.01.23.04.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 04:23:57 -0800 (PST)
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
Subject: [PATCH v11 03/18] drm: exynos: dsi: Drop explicit call to bridge
 detach
Date: Mon, 23 Jan 2023 17:53:04 +0530
Message-Id: <20230123122319.261341-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123122319.261341-1-jagan@amarulasolutions.com>
References: <20230123122319.261341-1-jagan@amarulasolutions.com>
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

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

