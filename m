Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34885A6A1C8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 09:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A991310E5AA;
	Thu, 20 Mar 2025 08:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M3PPe3J6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0ABC10E2CD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 08:49:17 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso3009395e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 01:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742460556; x=1743065356;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=zZKjyFb8BZx79o9w3IcZRsKDUkbzPE3rt8zz+Ry3hx0=;
 b=M3PPe3J6Xvt6VAStF9L9+JS6tiUwgpgdVwuk4SuOGMi0hN77qYPzncAnX3zkfNE6B5
 iTxC9V4mOKDFDztwLm2u/zII6pm3+pazCZbQE51tTwBIHybrbmqcMfE3wvw0dWnU5xts
 qRk7cFr0/bbPWbhplp7XWWpf1CbYIWQA4c5o9qbvPP2IDbpaHuW6z9pwSL1L1uLjmOoS
 ijhBEVy+thgf9yn7R80xzDH7IE6Y8PQ6PO0hm1imIxsux53jwSqd1OZjuLq+wcQQQpbH
 YJz8q+NkcAZQnBtl3nno2jitmqC8az7f9wMWVYQfkU6NUiZgWsGgqubJvPGlOMm9n2ws
 dhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742460556; x=1743065356;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zZKjyFb8BZx79o9w3IcZRsKDUkbzPE3rt8zz+Ry3hx0=;
 b=VfTA1nm5oMUkREpasLWv5PDGA5jKaImZFCw4P0tg2w4K/IvPqeKvRRg2sIUY7yCOWL
 0XfKEgvQY3j8qEwTM4Sz+1zET4L5YJRR1GHYoEZU6ASH1h1/08+DQgGtDirwtW/qn9av
 j7oLC9DPpAYZUcPb64aFjyzb1lRFVLPc9SrkGFPH7nsD+DEAYaTYkfVWWALeZ6pf5891
 eZDvkFoR194rp5ey6/tPlHAgEcf58a978h6gbUDKb0zD6YA95/JgKgNVmW6JX84EsMTd
 vbiWd+wscj45d5KhFEGlhqHl/THNeVjwEvdcQ3U6RgqbZdvoRbHGOUb/t7NGW5sjhQIY
 BLAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeXOoi3iRaLqFcX6i8gNB8feiBPSV860YjPvV2saskZ3CTEc7+LdMcF+//QOlqVny8M/hDHqPuTo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoPVdF3hRRrFf7q6TXvxPX0iEqBHqiNN0B7hRcTkzTWUD8gDGm
 bshfBsqeyfZlbwIBJSKreiIBWXae7oHMpfyPyrDbWUAb8t8bfr22494BsLjKwZX8VCDN6Hmf7q4
 Dv/I=
X-Gm-Gg: ASbGncvMfTgP1VdXrF9eJSsK8DzQkgK+ovL6eNlVMBJ3jz+V0QfRldSsFTJ7ziBTWhn
 4wW1bGBG1SPNuXgFzQpVghRYPQTI004rc99GB5n60y1JYKNELjkW6eEoVd8wUrzcKZ8g5lkuy80
 YcAWml3fz+4TvqWzCtwhIpCTO8lVl0WsvFl3HBqzu+ELIo7phCi9ENfZrti8hAWK25OcA833EO5
 CJ6NnmYlpEl1hj1MADPrLDVbgo17bR5j0QBuwWv0B4dZx6iG6GxVT55IvVLrEh0xzEui8IP7KvY
 7ebNrbDCXm2cBfodqLVsi6jtUcq+I70354KAk5HiZ63bOOW7
X-Google-Smtp-Source: AGHT+IF1ShRsZAhXeGcFF/eH1QOBy38lGwVALG8wcA9aWqeTkHgVv4Ae8bUcyD5nie1uQZaBU4zsBA==
X-Received: by 2002:a5d:64c4:0:b0:391:2d97:7d0e with SMTP id
 ffacd0b85a97d-39973af6beamr5443274f8f.42.1742460556286; 
 Thu, 20 Mar 2025 01:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:c11c:487d:c821:54a0])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdac9dsm41381655e9.30.2025.03.20.01.49.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 01:49:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 20 Mar 2025 09:48:47 +0100
Subject: [PATCH v8 3/3] drm/mediatek: dsi: remove custom init part
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v8-3-c2dd7b0fb2bd@baylibre.com>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
In-Reply-To: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=TX7OcGVRtr1P2pPXrsvbTSXIwOoVwPaz45DKWAiAmLc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn29aHumqlEtPmW0ArR5jYJL5IvH5lLNSxMmfrFswE
 D6QNUKyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ9vWhwAKCRArRkmdfjHURTTUD/
 9/d7eGtM1x5wW0jXmYe6IW8fwisk78gewlZv0z4juc7RAlpd2GbJSBerX6VBJY/DL8d0V7/u5WVa90
 P1bZxxvdxm79wEjWsSyJYbCwQWH/Wmn8zyZQvwZXUaOjh1uuoiKmuhNi3oP7o8ikoo/7Yerpza6BoU
 +gKMkpOuW0YAy/jdv8/xCqXCcMGD9z7lU7wbKFgnDi1QD1X0aTCoXoxb4rKmZSJxJ1A7tvGKWA1R8y
 D0MqNsi/HjfA/hNYullag24K50oJOlOCoT9fCeQ0yLvALuNPn6K9jIXfGgHO45KgYsShibM1bRt83M
 UxZrEncVEifz0mKSROkc1yiKmHlushJSeifzd3fe09pGcBc0lTubg4AQ/ysBmKzDuOuqNTOP9tOIMq
 iyNSOj1tdoWtwP0BOSlY+ElUwUdM5mdhUzZRHIDLkHDybrZP9YSCEmb+joNt4IhE8rvoDc+B3q4PpJ
 l88Ls1+kFFuSSpOjoMgvg276mnZ1igr7TmVTxl3n5f/WVT3XKpUDhopnmpc7DroirFG5Bc0xJVSYT1
 x93zcH7j9Yu+1KuQpRU9VBR7lne920Op7uje9MJSB5eFZlRdbHGOlqiXFUB5/jnQqbtO6DUZOTIiKV
 Ry4pSE6S5lwJfZrZoSCAgSky6flyYM5QMBBHyvf2yuZqxL6xz9WxweVYp5JQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To be aligned with the DRM framework and avoid DSI power being driven
by two different entities, remove the custom function and keep the DRM
API to initialize the DSI.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c |  2 --
 drivers/gpu/drm/mediatek/mtk_disp_drv.h |  2 --
 drivers/gpu/drm/mediatek/mtk_dsi.c      | 16 ----------------
 3 files changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index edc6417639e64..d86eed0d279d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -317,8 +317,6 @@ static const struct mtk_ddp_comp_funcs ddp_dsc = {
 };
 
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
-	.start = mtk_dsi_ddp_start,
-	.stop = mtk_dsi_ddp_stop,
 	.encoder_index = mtk_dsi_encoder_index,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 04217a36939cd..5657854fa2f9e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -47,8 +47,6 @@ void mtk_dpi_start(struct device *dev);
 void mtk_dpi_stop(struct device *dev);
 unsigned int mtk_dpi_encoder_index(struct device *dev);
 
-void mtk_dsi_ddp_start(struct device *dev);
-void mtk_dsi_ddp_stop(struct device *dev);
 unsigned int mtk_dsi_encoder_index(struct device *dev);
 
 int mtk_gamma_clk_enable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a3..b813b49340420 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -787,7 +787,6 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 {
 	if (dsi->enabled)
 		return;
-
 	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
@@ -893,20 +892,6 @@ static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
 	.mode_set = mtk_dsi_bridge_mode_set,
 };
 
-void mtk_dsi_ddp_start(struct device *dev)
-{
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	mtk_dsi_poweron(dsi);
-}
-
-void mtk_dsi_ddp_stop(struct device *dev)
-{
-	struct mtk_dsi *dsi = dev_get_drvdata(dev);
-
-	mtk_dsi_poweroff(dsi);
-}
-
 static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 {
 	int ret;
@@ -1243,7 +1228,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	}
 
 	init_waitqueue_head(&dsi->irq_wait_queue);
-
 	platform_set_drvdata(pdev, dsi);
 
 	dsi->bridge.funcs = &mtk_dsi_bridge_funcs;

-- 
2.25.1

