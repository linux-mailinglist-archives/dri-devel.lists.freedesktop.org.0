Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCA52948A8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315A16E96C;
	Wed, 21 Oct 2020 07:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BEF6F44E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 17:43:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s9so3213788wro.8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1A8pfSek/oH+kI//UrZrfn2qlGAQqPoXd9JAju99Kjw=;
 b=tKhGvZjHxPeNh1BqRsnqoK5mk8FKDP8GpA+8AwZOq42jOphNgYUY5iBbwL2iwYh643
 ilMXNPIoy1ITQRVR9VfbAvrhU4rIEuJJv6yHikwMBo07KK3uX4n5WqR5zSJ6x41578iY
 j3SAnl2D9opqS7C3H4iWZm1EV20bzt1Hh1n5APmPCznBedCN9vNxClJSDWtKygEqlGPk
 mS7ppoerv0bTUSu8loyCAvdl+3czi3yUA/xCIcunIHapYtBDEpQ0SBwR2gWtEcCt/eoK
 xk6W82bzd987JbfkGJrU8qZEb8urxe8+RejC+8Hilg247SVLbAEo5q566TEzSLAGlj1G
 j4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1A8pfSek/oH+kI//UrZrfn2qlGAQqPoXd9JAju99Kjw=;
 b=BunlLQzvxJc6ToTgxR2Y9jrjZ8zbXCVjWG0PPmwX5GT9CvGAjj5t2SYr952FHrJWJW
 S1H+C3XhW6Pi3czVClV8rS2iTY8XrH2kC6p2emGlE5VOb+8ZhsMvln1/muVArRUrgWuc
 2D0lrjX7l0i1+p5OV6rOuznxKiN0QdtOtvDci7HyANeU8DVwQRUXTtiTVHym8PVCv6Fi
 jlfaQ9+QJ0JyoVUTCKHlJhMMjj1n/91m983gW8Mm58PRfYKAKK64mou0wOx2m+AuAsst
 NY2oA06hPMS8ZrBVLeZjvZfLurLxkMQcNZyK3MHxorjuR1/TcbtiIWySMMkAVKDKYr+m
 FzxQ==
X-Gm-Message-State: AOAM530YkUcS4ewzKAkQ2DzEaQtjxjlHqQ3FLlCt5Tf5AcI646/P2fZr
 EFK0xmZRWGJdM3ruKOqm0M1cNA==
X-Google-Smtp-Source: ABdhPJwqF5VYoBqPaVRJ2EDBqfvlSysBqq92CEHWViBWOriU59xWNrrDpDUp6DyvZcdF2kpfumUOMQ==
X-Received: by 2002:adf:f104:: with SMTP id r4mr4824741wro.202.1603215790101; 
 Tue, 20 Oct 2020 10:43:10 -0700 (PDT)
Received: from localhost.localdomain (199.170.185.81.rev.sfr.net.
 [81.185.170.199])
 by smtp.gmail.com with ESMTPSA id v123sm3297756wme.7.2020.10.20.10.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:43:09 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] drm/mediatek: Add support for main DDP path on MT8167
Date: Tue, 20 Oct 2020 19:42:53 +0200
Message-Id: <20201020174253.3757771-9-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020174253.3757771-1-fparent@baylibre.com>
References: <20201020174253.3757771-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the main (DSI) drm display path for MT8167.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 59c85c63b7cc..3952435093fe 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -112,6 +112,17 @@ static const enum mtk_ddp_comp_id mt2712_mtk_ddp_third[] = {
 	DDP_COMPONENT_PWM2,
 };
 
+static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_DSI0,
+};
+
 static const enum mtk_ddp_comp_id mt8173_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
@@ -163,6 +174,11 @@ static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8173_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
+	.main_path = mt8167_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8167_mtk_ddp_main),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -401,26 +417,42 @@ static const struct component_master_ops mtk_drm_ops = {
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8167-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8173-disp-ovl",
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8167-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
 	  .data = (void *)MTK_DISP_WDMA },
+	{ .compatible = "mediatek,mt8167-disp-ccorr",
+	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8167-disp-color",
+	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
+	{ .compatible = "mediatek,mt8167-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8167-disp-gamma",
+	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8167-disp-dither",
+	  .data = (void *)MTK_DISP_DITHER },
 	{ .compatible = "mediatek,mt8173-disp-ufoe",
 	  .data = (void *)MTK_DISP_UFOE },
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8167-dsi",
+	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8173-dsi",
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt2701-dpi",
@@ -431,10 +463,14 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2712-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8167-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
+	{ .compatible = "mediatek,mt8167-disp-pwm",
+	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
@@ -449,6 +485,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
 	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8167-mmsys",
+	  .data = &mt8167_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
 	  .data = &mt8173_mmsys_driver_data},
 	{ }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
