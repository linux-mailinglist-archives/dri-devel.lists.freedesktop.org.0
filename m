Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872782CE9C2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C816EC69;
	Fri,  4 Dec 2020 08:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9646E098
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 08:24:53 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id q22so773134pfk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Dec 2020 00:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZbfQj5yx8q5vsWWQ52FX9cwcSvHIrWrBDYdeg/Q55J4=;
 b=CC0LDk6MjaniNohllz1X8vF+6zibKnjaUx1UZusXT8g4PvOPFVhlFnPKG5iMoMlTes
 VZTT3FxsHMM0NAZJHNq0pIWQpyPcuO/f5V8263/cLsUcUPTOxTEQNcq++aIVashDczax
 rbeUvp4tBFyvoD4jU7tuyRCmjYopbPDK7mfuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZbfQj5yx8q5vsWWQ52FX9cwcSvHIrWrBDYdeg/Q55J4=;
 b=DK3uKQv093U/D0NL/YtVMVJ1NAacBQETvAeu6mn3XwY+KjlwROalqwRcDgYATL4wxH
 mv9MDogLpNJcuLShOygeGrB8dM03riNJkIz9bB7uE5tJlJubaIjBrQNeBXB/6/EfZ6jF
 ZAkf5hbwbZGhX91Fg/NsB5RnxPR5q57hGddqIGs6b+k4xcKWD7gLIK3429FXRB2yqlAL
 OfkN1g7E3/3mLHrKpvchSHC8WNwjvnwTDk9K+z17kiDfXmM7doatO9hgwzforeDnEveR
 4zK6bhWfdO8uYGXBnj5VkuRj9x1jMghRN1fU7dMTa4u4s2AYDwtT+doi4DsIYxYYWWw6
 msJA==
X-Gm-Message-State: AOAM532eEwThjRkhBMF/YQlKrgYWywMZU6eg+P1o0Ya4j2cdmh7j+R6S
 vTSRrYaYycDF7teWyk9ObBquTw==
X-Google-Smtp-Source: ABdhPJwD4kYBEvN44OH+eyu4iXyYp+S5tYey6LADtEcblFq79I2Cyce9ZL7pLKKrJ1KH9iN4MWofgw==
X-Received: by 2002:a62:a11a:0:b029:18a:df9e:f537 with SMTP id
 b26-20020a62a11a0000b029018adf9ef537mr2173912pff.29.1606983893429; 
 Thu, 03 Dec 2020 00:24:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id e66sm815128pfe.165.2020.12.03.00.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 00:24:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: mtk_dpi: Create connector for bridges
Date: Thu,  3 Dec 2020 16:24:45 +0800
Message-Id: <20201203082445.1342763-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Similar to a9d9fea74be2 ("drm/mediatek: mtk_dsi: Create connector for bridges"):

Use the drm_bridge_connector helper to create a connector for pipelines
that use drm_bridge. This allows splitting connector operations across
multiple bridges when necessary, instead of having the last bridge in
the chain creating the connector and handling all connector operations
internally.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 52f11a63a330..189377e342fa 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -66,6 +67,7 @@ struct mtk_dpi {
 	struct drm_encoder encoder;
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
+	struct drm_connector *connector;
 	void __iomem *regs;
 	struct device *dev;
 	struct clk *engine_clk;
@@ -603,12 +605,21 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dpi->encoder.possible_crtcs = mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
 
-	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL, 0);
+	ret = drm_bridge_attach(&dpi->encoder, &dpi->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(dev, "Failed to attach bridge: %d\n", ret);
 		goto err_cleanup;
 	}
 
+	dpi->connector = drm_bridge_connector_init(drm_dev, &dpi->encoder);
+	if (IS_ERR(dpi->connector)) {
+		dev_err(dev, "Unable to create bridge connector\n");
+		ret = PTR_ERR(dpi->connector);
+		goto err_cleanup;
+	}
+	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
+
 	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
 	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
 	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
-- 
2.29.2.576.ga3fc446d84-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
