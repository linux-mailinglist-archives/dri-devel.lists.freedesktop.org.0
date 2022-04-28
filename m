Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CE513046
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 11:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C134E10E6A5;
	Thu, 28 Apr 2022 09:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972D10E506
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 09:48:51 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id p6so3846095pjm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSO9EXYOSC33q6TMX5paIc/n59vloq374c1uB49deWM=;
 b=lnQNze7+jFujdkFXJPJfBt6/k5oksgU2Pkrrcc939SLbfLUjBvRUuV/xdmQ3R7vikQ
 FgVbhUadFGwy8Dh1iZbz5ZZcDqx4vMad47H7O94j+lbq4+WCGZhE7MgCReYBtxJ5AORe
 B6UNhu155N/bJ39ktDXmGtWV6vNBlx/nHhQy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSO9EXYOSC33q6TMX5paIc/n59vloq374c1uB49deWM=;
 b=sRHNovtmlRuZN0rig/uVRFBtxETEOpTFn6Z8mz5wBB3pXnj7eL25xpA3pN6omctsZP
 D2BE8ctWabG00+Rx8TLDGB+mZ6W9+87vlwVvjW4htVHiMkcuitDcjCaT6gefHcJiDh64
 YzntLSvBg2CsoIrK/M6TgAgjA5TgToBdJiAX0AtsflArwnJhx4fPWAK5qSiDEhuaNeUG
 Id9Cl/YwfbjFPHOUZ3ljruIQd4WjYj3I9t4gW34lqNt4HYEidau1gEujpwVCxpAMOOmE
 7+UjwsQM+Ol6iDM+QNlebkwG/bfz1qgwczxdTNwNyJHadfRXvbUUidITJAcE8ajMBLZQ
 lK8g==
X-Gm-Message-State: AOAM533q1CqX9gF28c2/SZwDn5fXAUlk0WH651JgEpo3UVfjRW7eZ+/+
 F3Vhm2mqLJsX6rmbABGTjMmPsg==
X-Google-Smtp-Source: ABdhPJyUCD1z4gkX7WSEW0e3FmG+iKkdGrfJgz2PYXdFAgQZ9R0yCSp9G2tj9QZIswGWvgOQdNs7Qg==
X-Received: by 2002:a17:902:ce01:b0:15c:eedb:f00c with SMTP id
 k1-20020a170902ce0100b0015ceedbf00cmr24832151plg.122.1651139330761; 
 Thu, 28 Apr 2022 02:48:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a3c7:357:7b61:223a])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a17090a1f4900b001cd498dc153sm9842845pjy.3.2022.04.28.02.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 02:48:50 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] drm: exynos: dsi: Use child panel or bridge find helpers
Date: Thu, 28 Apr 2022 15:18:08 +0530
Message-Id: <20220428094808.782938-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
added devm_drm_of_get_bridge for looking up if child node has panel
or bridge.

However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
has panel or bridge") has reverted panel or bridge child node lookup
from devm_drm_of_get_bridge which eventually failed to find the DSI
devices in exynos drm dsi driver.

So, use the conventional child panel bridge lookup helpers like it
does before.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f067c86b0b12..ec673223d6b7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -1451,9 +1452,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
+	struct drm_panel *panel;
 	int ret;
 
-	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	panel = of_drm_find_panel(device->dev.of_node);
+	if (!IS_ERR(panel)) {
+		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+	} else {
+		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
+		if (!dsi->out_bridge)
+			dsi->out_bridge = ERR_PTR(-EINVAL);
+	}
+
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-- 
2.25.1

