Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A753B4D122F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 09:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18D10ED2F;
	Tue,  8 Mar 2022 08:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F80B10ED2F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 08:27:42 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso1578158pjj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOb/lNm32VMdALdX4KwHrL5rmS6yQsENw8Ur3mJRU6I=;
 b=px2TDsrIdXbKFfx9kKnWAqTt/rsFRsloXAp468eVCJ1TyFGRT/EC11VJCxU4SnghpX
 xtuigVS9RRv1ZOeXF2LN2C8suB50gJVDxVLFzTTbokFKBKuAA5rI2QBmGIKqC74OUvbJ
 fDNTGAlX4YpgXV9uGSimdfguWUv8CeVIZ6obc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOb/lNm32VMdALdX4KwHrL5rmS6yQsENw8Ur3mJRU6I=;
 b=YUoq0UPU7qRPXpD9PS1rLV263Kgxi3Aw+qzzhuavUtIBhkeZ4V8VCQP8yLGE745OMq
 CMI3kauxPrAwiuP9WhPhZbrH9ulbFA5aPkTkwZ2iyocgdmV17asOOf7IzGXXw75dKLSP
 KQKQQW8GNbfR2GIwbNAvtkXBqePo0EmNYG2uw2+HjPnJmFZ+db3dG68uCkdHiVBnbq8T
 ozKTU0EVOA6Rao69+7uFhimKdVMIMEbAdBgrdfKyecR90wOq6L7oPunJR/daCnS0Rwnz
 YcZVdK0iVUXcVi3j0PPNRHAEmkdX+FezJ2fR1hpxGJMF1sAz2R5jLE2odeLMkEuhtTam
 p/0A==
X-Gm-Message-State: AOAM532KcuPxUahYZvo8MFkioMd1qnaJuiPWOVZIRmNDh0q1RrfKTx89
 azkm6lD3g6V0ytGzJDYHVfwaRQ==
X-Google-Smtp-Source: ABdhPJyCAIxrldB0HdgOPSYJL61A2R3J5ux4DLUMPQ1m5P298VJ+HbV0gEnl+/3UEN7QOF1zZx9DBA==
X-Received: by 2002:a17:902:f650:b0:14f:139e:aef2 with SMTP id
 m16-20020a170902f65000b0014f139eaef2mr15893117plg.151.1646728061794; 
 Tue, 08 Mar 2022 00:27:41 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:c770:6f0b:21a:8de4])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm2000671pjf.13.2022.03.08.00.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 00:27:41 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 3/8] drm: bridge: mtk_dsi: Switch to devm_drm_of_get_bridge
Date: Tue,  8 Mar 2022 13:57:21 +0530
Message-Id: <20220308082726.77482-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308082726.77482-1-jagan@amarulasolutions.com>
References: <20220308082726.77482-1-jagan@amarulasolutions.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-amarula@amarulasolutions.com,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

devm_drm_of_get_bridge is capable of looking up the downstream
bridge and panel and trying to add a panel bridge if the panel
is found.

Replace explicit finding calls with devm_drm_of_get_bridge.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none 
Changes for v2:
- split the patch

 drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..a1b3e1f4b497 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1004,7 +1004,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 {
 	struct mtk_dsi *dsi;
 	struct device *dev = &pdev->dev;
-	struct drm_panel *panel;
 	struct resource *regs;
 	int irq_num;
 	int ret;
@@ -1021,17 +1020,10 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
-					  &panel, &dsi->next_bridge);
-	if (ret)
+	dsi->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	if (IS_ERR(dsi->next_bridge)) {
+		ret = PTR_ERR(dsi->next_bridge);
 		goto err_unregister_host;
-
-	if (panel) {
-		dsi->next_bridge = devm_drm_panel_bridge_add(dev, panel);
-		if (IS_ERR(dsi->next_bridge)) {
-			ret = PTR_ERR(dsi->next_bridge);
-			goto err_unregister_host;
-		}
 	}
 
 	dsi->driver_data = of_device_get_match_data(dev);
-- 
2.25.1

