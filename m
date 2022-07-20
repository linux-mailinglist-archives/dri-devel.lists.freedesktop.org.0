Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AD57BAD0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C148B316;
	Wed, 20 Jul 2022 15:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37198B316
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 15:52:36 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so777969pjj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2R5fsiZtZGlt+FobiR6W0jXlK1PNk4NpdanB+YrtTj4=;
 b=AR1YQry57YWBTW9l3DTgkGErpP13QbkNF2JOlwbPEBU7/rS03udEpZZVR5AMazoh6G
 pemS6qjSpURfm6lO813a9hWh2itiOrPeJxp9hAIalG1qkwxG1XEMca3JPT75WoHqLgCK
 LSSslsVB61hJY4ageZmSvMirSj7fhG1NAjv5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2R5fsiZtZGlt+FobiR6W0jXlK1PNk4NpdanB+YrtTj4=;
 b=qY5M1oC4jJrNeBS8HjTVNCIqd2647a4YAJgYvdgRniL6ZYSKeGNXsz0ZzRz9MLPm0p
 7T/2lrxt8rDNIMCezjzosEg2Za+dOYm/9oeyEB+goRc0QTQTzqsIGW0uy/YnEdomQALM
 hQVerE3rMxB5PcbItri4vaFqv0lj7WTM9HS4u5hDhcdmJGX4oLqWbMRrU/gYlo80dg/5
 m1CcjjiqwI7hmv0U4zKzLV1BGGn21j1SmLlWvJETrJz+QDRKKtfTO9EQ5Kzh+UNcH0mG
 F70VRZ6rD3sOKRcWXHteapn1CsWoWpFCgeje1n0qepicWZYasiE2A2U5PdgL2agdXVxT
 H+cw==
X-Gm-Message-State: AJIora/De9FAtmRJc2sX4IqGwBbND8OTOSrRisOUo3t0w9LDHrrTWaCq
 rAmI/bUo2Xi3iZgdKmx9umiM7Q==
X-Google-Smtp-Source: AGRyM1uJchxuQnN136/OorRRTcNQCp33W035zpvqDdbfw4L0q7XpSJGz1cssPXyqkqJZocUt6AJHnw==
X-Received: by 2002:a17:902:7d92:b0:16c:54a4:bb2f with SMTP id
 a18-20020a1709027d9200b0016c54a4bb2fmr39962044plm.158.1658332356419; 
 Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:52:36 -0700 (PDT)
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
Subject: [PATCH v3 01/13] drm: exynos: dsi: Restore proper bridge chain order
Date: Wed, 20 Jul 2022 21:21:58 +0530
Message-Id: <20220720155210.365977-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
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

v3:
* new patch

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
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
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
-- 
2.25.1

