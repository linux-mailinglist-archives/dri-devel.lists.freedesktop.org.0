Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B6F5A5409
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 20:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DCC10F6A3;
	Mon, 29 Aug 2022 18:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0366710F6C9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 18:41:02 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id bh13so8469019pgb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=P8VFeEM/BFJI467dCNlhyUmXQlADynuLsgzoWk47wCg=;
 b=EPSFr67+xfTIyGBIh3RYgbAX5fNxJaVR6R4ntWQPcH3goFHbRgOpUTUkozy0PyqKZQ
 tWUTihCpY0hC4P8R/uimrljrbbklIXgyvl9PBBh+xn73amdL/ko7cBn8seP9Xdh4fzFO
 CN0iAuNlqPllYtuV4HfqBaBP7P2pxnhBzqWQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=P8VFeEM/BFJI467dCNlhyUmXQlADynuLsgzoWk47wCg=;
 b=RBIuFkwJqKXNDOTXgbVPxePl0KUtNXWrL8Mx0JChpmwHnVt8TIq8vSwK8aa6I01r0G
 uT/XSX1PeqLScT3aFyb0ve/ogPPlnmMRLLMaFB3VjoiezpEbrRKn/cVCkdEjZSpaZxhf
 2HCTKEeqA0+ERHHQsX438UaP7THm/KvKRfJONcotan5Qgw9/odwyn7B0nNRfTT6IXURn
 aKrEpGSEFu57xpDsOL7xbo4RA7Vnq7TXlpxTgrRnRD/DlA/9P2F6KVeDc8WTDZcvfibm
 EzgvpCnIg95V3PN/RYx8Z2Ku+w5PO+Lm3S8pDTEPzuotJXY1VNEdYH1xgAltnAhtwvtE
 6vhA==
X-Gm-Message-State: ACgBeo1mDdsaEeM92fpjaCv5GGvwGGhInrcVongq5YEErJEWVlkLSTXq
 4aG+LT8bWZJq0s+Yk6k5Nv5Wig==
X-Google-Smtp-Source: AA6agR6PuGUOWRB54FiVXcq+DeYxGBCJLzqGuDD46zbx+u/8z/espw13ja8BVRylsZBCfn1YgyGaPQ==
X-Received: by 2002:a63:1921:0:b0:42b:6eb3:bce5 with SMTP id
 z33-20020a631921000000b0042b6eb3bce5mr15304041pgl.231.1661798462536; 
 Mon, 29 Aug 2022 11:41:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
 by smtp.gmail.com with ESMTPSA id
 k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 11:41:02 -0700 (PDT)
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
Subject: [PATCH v4 01/12] drm: exynos: dsi: Restore proper bridge chain order
Date: Tue, 30 Aug 2022 00:10:20 +0530
Message-Id: <20220829184031.1863663-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

v4:
* none

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

