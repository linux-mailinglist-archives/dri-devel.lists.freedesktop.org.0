Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA917D39BF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962C010E1FE;
	Mon, 23 Oct 2023 14:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7BD10E1F0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 14:41:12 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-7b5f7f4e733so1274022241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072071; x=1698676871;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Nk4VEc7GrlonIpYIKhVQ5D+oJ75rejlCYM8CDWNoEgk=;
 b=My2JiaTAjVIy4Ieok+yA3I83QixssXbnhz8jXIw8VIWb3QnMGM2PZfmB9YdCIU1MAp
 H+71IMyA8wl4Q4HAenVJmLToje1jKv2wAlrW1LKJ36pSX2qo7fqBJajyTq/oo7jMbPgR
 lLWut9rkRPn6tVw2pwu25wpbrKal6eS/r9EnZMPJXtSVYGrAOelz/Ry9ZY6KccNIYTee
 V3eY9+D5DvUkP8HdeKMiHWtPphJHAbC7ORsVMNiXnIJB3A2uFnxF7Y9dQUHWMYV9egHQ
 J5owFo93Ir+ZqjNDvqQDDX1tIDDCF/09wlFPin331eFexR38C31Nq2sXCS2Z7ZxLlHIW
 OmzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698072071; x=1698676871;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nk4VEc7GrlonIpYIKhVQ5D+oJ75rejlCYM8CDWNoEgk=;
 b=iv2goxu/72tfYSekf4YUbp9y5EyU9EiHMkoyxz1sKEgxd9y8w2bfWOyJgdpowJVuBj
 SgUCbrOL0pdUt3xvX2lm5Ns61w0LaQMw0CBnAOdkl58bFY4CMPkIPdYlwIoKgN/tHqYD
 8AtcIVKKEYZxzS3VG9lbJdTKY6sv4W5hi3bcSVajNJg56xO62wT5XKmbcdszMpzii9dV
 35yrfQgTlPfNf6eir1oSRKjpZWVhTCN/NvGvxdLJzspniQrSbkbg5dvHHa8EKvyOZjW5
 H7s0alQ+MhhwUiuJFTOvaczYLF7v81crp7qAetc0pwTYWfH50Iy0jRHm+9MJ9o78rgTZ
 CoeA==
X-Gm-Message-State: AOJu0YygLXEXYhIiWrPdJ4rJ4oW2dEJVGFU9TQrYHwQC6S6WbqfIk60j
 ypJtUyjHSrfZdm+1YlX/Rxx+yA==
X-Google-Smtp-Source: AGHT+IGi20COa+cJp6G1XuUW8JjgOjJlZZG7i7oYmIj96ssiOC/4MvZePvje3VpCkVCDHPeEy9cLcA==
X-Received: by 2002:a67:c085:0:b0:457:cd8b:57b6 with SMTP id
 x5-20020a67c085000000b00457cd8b57b6mr8547423vsi.31.1698072071111; 
 Mon, 23 Oct 2023 07:41:11 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:41:10 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:15 +0200
Subject: [PATCH 15/18] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-15-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ZnkaVO4f0o9RizPBgJV2PC+/Ox7JmjKaiFkOq/2YPew=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPvl7J+ly89uTeJkwL0erLnyNQp9pX/flwDfIL
 raGDyHeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURRWTEA
 Cm6umD5gVmCR7xOl83GRyS+2etvws/qE9QDQtrdSXVazCbRh5I4OqeGTz5Wc/fqy9CeQ5923/lkKam
 Xw/JEizkC4ZVPJZOAe+6s82urCvz70SxQBFupbIl4RPXYIrx49T8ElS6+rr1pHMHn94YucqXY+a32f
 GMDycbKDPS3BcT1to+1F3fia0IpdzlYAS0QTnhxESja3h7ZPuMhNLE0pf8F+IZwrGeLCGifEroUqHE
 yz2eBBwDEsuhpRhwtrfZQONp//kfSqOG+SxxegQMja67q6Af6r+wCgaWtGXF8DD3rXfjHy310goD/Q
 3kjqLOk2eDKyCdTJLwq9ha1vr2raaT+Saj6ji5h36b7pQyKGusNTU3U4K/m2ICV0PMqY4bz1vTAvtn
 BraK0gFCfeYHz1JplSTOiKjJJOybGT6rhaTHEorLi8lFFtxqntfVvvFHap2mbH5OqE1etzR/51+opn
 mbUeGPQ/WKlStmhdMfmW3BHGD4aHc25cz8gis2NPw/Gri3XVURa3m0PKzoxy5sG+uFs8QTEuyk3+5P
 4lQvoNrLw/og2NCO2k5EZbGj4BL0KSNV3be5TNYyB+1MY1EwBtmRnqPFAZcy9tMJIyGnueWGJzR1bx
 /8uq/HHOr9EgLyx4kqNAfpC4e+UIsbhOPJiI/k8F23WM3cftiBOKY3nOBjcw==
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
Cc: devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..682ab464186f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -227,6 +227,22 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSI0,
+};
+
+static const unsigned int mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -311,6 +327,14 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -336,6 +360,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -703,6 +729,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -765,6 +793,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8365-dpi",
+	  .data = (void *)MTK_DPI },
 	{ }
 };
 

-- 
2.25.1

