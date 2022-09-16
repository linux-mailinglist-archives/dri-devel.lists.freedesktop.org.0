Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA25BB1EA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 20:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D653110ED77;
	Fri, 16 Sep 2022 18:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A37610ED77
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 18:18:27 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id fv3so21870385pjb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=evpdRiLLPj8Lu/GCT1crgCmnHzo/7eQnkgWkH42QQ/k=;
 b=W1QEp6HF06COuxtcDMZcOJJyNxZHua+I7KuRB2xlQCsegc3plvtw/N5BobrQviA9U9
 NHfyTT6LvM/CEOOkFDNGDUr5rh7HX17h511Y6brIhx4dLSc9QEAgw+vd/BJq623harcg
 ucRXUwwyh/EgduyrqYlShxfPodb30TiQ4GWcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=evpdRiLLPj8Lu/GCT1crgCmnHzo/7eQnkgWkH42QQ/k=;
 b=qgRUul4v9zaDZOl37Ox6vB7ZBbY1cDpTReh4oaCnKf9v4gbegU5IwW5ee1RdGxEUh2
 qbD+1Vv4Y1dQoPavdfGi/FW6+j/vJEgBBrIFXpj9wzcHAU/5oPY7sbtx7gAQ9UUkGZ6O
 4eyKoQlz9whotEcngVmexod8Dn7TAWNNJdiUTx1AEm0u1UfC4TohDDAkTMTvo7+9MIST
 ST2dnY/WGxACUrOhUsmMVEa0XjQW5WKwboRQHT7lrug6SHvQGX/m8ILEZwBSOCDwQA1e
 BHPtYGFVr0P3uNwz9VmCrdvGrvSKM+66iWfVRPNllPS2eX2TqesPsoB1sZp1D7wkENd8
 Gfow==
X-Gm-Message-State: ACrzQf1LMT4uDo8o1+uHC86k+BMxemkuRvXvuUM4JXiDQAjL2JQnCWLe
 P+UDmJf/x1yH3Tk7lRaWaTyaXQ==
X-Google-Smtp-Source: AMsMyM5tFBRMMV05KMLG/vmyPgQXqqS/Zii1t+5qNtGrc9v8RI7ilVaypvhioFuAGkauxAM+3y9SZg==
X-Received: by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id
 m10-20020a170902db0a00b001782636b6demr1104299plx.58.1663352306312; 
 Fri, 16 Sep 2022 11:18:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:ae5d:6ee4:5c2f:6733])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a17090a6a4e00b002007b60e288sm1770000pjm.23.2022.09.16.11.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 11:18:25 -0700 (PDT)
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
Subject: [PATCH v5 01/11] drm: exynos: dsi: Restore proper bridge chain order
Date: Fri, 16 Sep 2022 23:47:21 +0530
Message-Id: <20220916181731.89764-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220916181731.89764-1-jagan@amarulasolutions.com>
References: <20220916181731.89764-1-jagan@amarulasolutions.com>
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

v5:
* exclude the NULL replacement in exynos_dsi_host_attach

v4:
* none

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..f4e3d2518ad0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
-- 
2.25.1

