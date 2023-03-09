Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466B36B26CD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 15:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2FC10E830;
	Thu,  9 Mar 2023 14:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B1E10E82C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 14:23:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so3464212wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 06:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371800;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=;
 b=kFQ8LRoljBL0wHvq4R5EI4ikrcQUbsFYB+Z0OC5Lc/dLpmkhLSRLxXieE/tLPoECaf
 I2rOdAL5stvDg1bZVWfyeNB/8JlSgc29D8eW7PN9jFqKblkKehsaHnv7/vLW4i30NV31
 ngEEh0CvEbW/7oFk/YvhpjcUuGOV6wckWRTVgKiMgvgsOs+eHNCWx9Ctl7pVSh6HQf+n
 5ovIREXATJfk5rLMSiXwCy6C9c4cCLjbMHpX+NCgnic3A1nuQsJ57Pe6aoCFPboXBQvP
 V7FGT3O7QP4LfcEU4eGpRF8ifOq8dQUYtX5O+dgqWLCIH7T+rE50uZiCDA3f3CyOeMa/
 BQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371800;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXnaz1jhLTD6jXvSmqDaDkgz1JHBWLNVvGXzErpIW+8=;
 b=j27FSZPefrBIg308IeiEQB/XNLvFanaumpg07V1ByRqcKop5T7aDnXllKD8uJo8FPP
 mzGKG3y0T0Lcg22bgowC+YWB2IM/P73hk9WBaIgJpJKX8wgkhj94Y1gMCJVN1GVQ8lMt
 VvRSp1S8FoE73mt4AJdhykK0os5kVoimaCdMp0PvBPRt5E2tKp/+m8TL43SQoOqNXztR
 M94/ckjbJTjbL3t59t6IYKwLrtugTtESSTfV+bFBHHQUDtfqPSv42Ylf0lGEBMxRrMle
 EAh8VgrNeLpNHjql7OTVyJjWX6erEkeFP0uXcIZo2u93agHpQQX5D8A4ajZPmG30kEvM
 DoQA==
X-Gm-Message-State: AO0yUKVz+YzVb6LgdWH08zghQYfjDGGTrRjnMCB2DhYhxdp9ZnMo0XFM
 iAYwVi6vnztkGiu2I7N4tZcMuQ==
X-Google-Smtp-Source: AK7set+D5mqPtf34ar9Lo47BVbbVyFB97USS19hS1lH5lekATB4WmOAZdNCYYAFIULZSGsyaMRA81A==
X-Received: by 2002:a05:600c:1d09:b0:3ea:f882:bb3d with SMTP id
 l9-20020a05600c1d0900b003eaf882bb3dmr19639894wms.4.1678371800320; 
 Thu, 09 Mar 2023 06:23:20 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 06:23:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:09 +0100
Subject: [PATCH 20/21] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-20-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2552; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=n59ZUgmONlb1UajjYquStIE5vhX/aVPKSxJb0sPGiU0=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+k482A81ACWwejcT34Rd/p34RqAsJqbxOisAp
 SUjd0vqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURWi4D/
 0TiZe3q/k7NsRcaMTOlQHeDWee6bQ6pdAgV8j4eJRo/iHydZZbOm8dlumln1AMVKIHl1w/Zp2Qps4z
 wKOoogD3jt6pML5FVVdmYhkoGJ+4/Q3byLqqsDEcRhywMoQPp3bDc+69loKNyGqxwDuiVvzWKBOk3M
 n9fokdBO+zMT8V0WfWNnQ0lqtIHnKmYRilecNuiGGUi6giWB9hri1feen5GhkOLJiklV/9stbfh2lk
 cRTv5WfcZUAracBieuisYpfxLb3pg5clc9KLj+MW2CYNItb5GS+R1mpdIdFA2sUZWjPVNYgjmaaD8i
 kafeT6ejU9G61UxNlIQ6CmUPquFVO0J6Zpi6pngFuJT4XceRiaUajSIU5LQoat4BkJQVYCMbjJuDBb
 ueHs9qhMLCaEZ+0y4ZAcw4m30Kc504cisk59PgpSpxrmP+O+NqJBJvtqUVTlHKIM5jUE9b67Vkbnhe
 dRQo4PST5Kel2MaVamYQ7H7mg19tV/tiW8fpeCIhbdYaBl3lt9iHLuIqF2Iuu+c9Zdt9rLkomn8+QI
 xJQCX2L80MFHeVN6wn3QuJTFf8ws4rD8sqzki9wJF+CQe/s7+LPckPZuSoYUM1oYxFaqxdg6E+7DZL
 /shmh3OGx+QIYzQAmenxR8VjOgUor17JLipQp8NbwPwqAn1MHSkJd0PnvTYA==
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..b905f38d5660 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -210,6 +210,22 @@ static const enum mtk_ddp_comp_id mt8195_mtk_ddp_main[] = {
 	DDP_COMPONENT_DP_INTF0,
 };
 
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_main[] = {
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
+static const enum mtk_ddp_comp_id mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -342,6 +358,21 @@ static const struct mtk_mmsys_match_data mt8195_mmsys_match_data = {
 	},
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+};
+
+static const struct mtk_mmsys_match_data mt8365_mmsys_match_data = {
+	.num_drv_data = 1,
+	.drv_data = {
+		&mt8365_mmsys_driver_data,
+	},
+};
+
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -591,6 +622,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -673,6 +706,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8192_mmsys_match_data},
 	{ .compatible = "mediatek,mt8195-mmsys",
 	  .data = &mt8195_mmsys_match_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_match_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);

-- 
b4 0.10.1
