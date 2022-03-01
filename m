Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D629C4C8D66
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E89B10E8A0;
	Tue,  1 Mar 2022 14:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8B910E898
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:13:12 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id c9so13567423pll.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RfOD5os58Zi+V6L7F7QFRD9/WvrhIP6GUWjSjvrBko0=;
 b=oayZNfVCkp9Ck5hqbCvOUvjyCdLRtKvX6dkRHEZ1tpsCb5hqDFhySGxIuvTYU7qpPd
 H1ESQMkFhGTWF1JvsWxWpsMvbKkgoDP3GhezERhlxG0EP17h/qMAo/WXe+98Q+iZAbrH
 qphSxJ6yRU6dvn0Uq94lGdA7dCXwCwrzgfciA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RfOD5os58Zi+V6L7F7QFRD9/WvrhIP6GUWjSjvrBko0=;
 b=i+3Am4slXxQqzC6LK5gUaLGT0CPSjtWuUmOlRz2vOVoHGqNA8id7MTmq6a1BLS3Mbj
 1X4IlOOhHLVmudu5zIpML7cxPYuoW6oiyef3qGPv3y/WygTlMCRiJBkE4PKo8RfSgZ+d
 bJ1FWLRHXUzSM3m4dZDP4YC7hT8+kyjk0UDvttfk+mEkcaQVmapiz+o7u4cnDGbv1HwP
 t3hBKLrUENVSWEcadgTEzQ+NDUj1qglcKGIz9DjO3uE5Y8m1vM8OxzYTF7ubrkme4S9d
 Ir/EpyoHVv0Jyd6MQM1ALjW09ozWEBfxtV9atFsoyb7CdHLQRHgVkAZAzcTINNx6/6Y8
 aLBg==
X-Gm-Message-State: AOAM530boXAP7Ar5/wstG63/NcGinbFJRFau8QgklvNXAiuPJwQdS3ui
 BNizXBsKMH4yutGDjFWbHpSDmQ==
X-Google-Smtp-Source: ABdhPJyN9KR62eGDLOHk3LNaWXU6a/yqaexKMuhd/Uj4PoOLneGSQlVZPl7xkQXv5FbiDBTU09u+SQ==
X-Received: by 2002:a17:902:aa86:b0:14d:a4aa:e6f5 with SMTP id
 d6-20020a170902aa8600b0014da4aae6f5mr25940900plr.8.1646143991572; 
 Tue, 01 Mar 2022 06:13:11 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:dbfb:dee9:8dc1:861a])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm17317571pfu.74.2022.03.01.06.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:13:11 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 3/8] drm: mediatek: mtk_dsi: Switch to
 devm_drm_of_get_bridge
Date: Tue,  1 Mar 2022 19:42:42 +0530
Message-Id: <20220301141247.126911-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301141247.126911-1-jagan@amarulasolutions.com>
References: <20220301141247.126911-1-jagan@amarulasolutions.com>
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

