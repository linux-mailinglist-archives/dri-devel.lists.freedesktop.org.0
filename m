Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78318CD2A3
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F12E10E36E;
	Thu, 23 May 2024 12:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GIZu0bD2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A39B10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-34f0e55787aso5018145f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468582; x=1717073382;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=;
 b=GIZu0bD2YLC1Zo0UGuSlQumkX2rkcGd39Bhm2fFygAvoF1gp8lUCWsOYs09vABMY5P
 0K84dOrkHklyy+F7F8nULy3kzWbsvUKVaQuYajpTRDSYDZILEuh32llkc6JFX0vF6qZ5
 ZsU6VGLiyGght0YjlB94l47af7frpJusy8rZWOOoi7Laa086fGpID+BAydaqrPvv9tBh
 6pjullPvtly0oCBVy068X6vY6PerCH/AJVAZaVTdhgUKsDdFbn0WXNjPaqmH2iaIyUqa
 uHygiOdVfPYsvFDO1GX8F1LBcpbz/Kj6bK5t4JK/90DLKSKXM9UhIcbc75emviLPhZpv
 aJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468582; x=1717073382;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oV7UBZ9+FOaGpy1Hnl2xMvcmGJrrQkTOfJMy4GT33U0=;
 b=CWAsuHGzWHZbg2NoqPCtGm2mjholVcaeCNTYZimu9yuNSRfyS6nS0lSDaTvc40aAsl
 onyzlr6ZVaP13cygcRDclJxAKFP1hyx4/zi86CgOIfcicaW8t/c96VL/ybY0MVkA4hMI
 gOY+zO0qg6FjOSnIVa+q45Y1YNRJ3SLI72mDbLnbJu+o8DMF5iROcD6wJpUs+OFjwcSe
 Ob39SZs0CeNI96UUrgGjgFk+zb5XnnFv38qshJe9dLPkPvy8Y3Ydlmr8CNQuwwzPpJXg
 /5rLjE313i81DUGcV5RuJPZ7YNjg17gRHYUIo3gM/94yOdEBPe/gIcMmkfR9kH7BqFLU
 ekdQ==
X-Gm-Message-State: AOJu0YwmyaTl29u9NsH/TpmTGhDAP5g2I02d1Yz13EufDJAhFOwd5zzk
 ZgIuNCrCq9MjiMzcaFh4t+uFCwIlGyv2mMzi8Zdisy5gJYyeLd1201vv+Jil6tU=
X-Google-Smtp-Source: AGHT+IHznoqV8aiJ8ieyvNlccfqDAnlHarASle5JQ78h8I9hJnV/p+wU3L9SVwzX72hcSRNDfLxJhA==
X-Received: by 2002:adf:cd11:0:b0:354:f44d:a01b with SMTP id
 ffacd0b85a97d-354f44da262mr2654995f8f.15.1716468582558; 
 Thu, 23 May 2024 05:49:42 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:42 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 23 May 2024 14:49:25 +0200
Subject: [PATCH v4 12/15] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-12-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=T02ZuZj0ijmxlVVq8ULLWlzrN07sh07XViJUCnaN+hM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTmiIN+hH5sjsyB9OiMxaQ+PFDyvdz2GQAG3OY
 CSOzjz6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURUisEA
 Cc6FfVzLDHM6GIBiFrX5C8yWAmpB0sfQBWzm2/LiHReGOMzvEj84wrDpQJRaAHErRiZBkTOVNdb8HE
 z+CGacZIQhgv9SbUW3xZipNp/2egvC03hrEzaOmQPN9btFE0hSyy2vnM+C6oNN/NpYgAQdFXk1CNyM
 Kf0xyyH5QH7L8WRbapNjD8A83yMh2cZvoGb7Q2vsCfXWQpK1FwMhi2m4busv8/QNxNn95jSnZKFPHC
 Iqrfq5kV+wkCmSGBhD3/VyrESQlissctczNW0FbMrhk4mMuWYOMUdr+jSpQuw9LsuquvbbYYpBvbdQ
 8Itrnr9R0jaFg2o2LCZ70PuferPP7bBi3BcJjbevQ+H0+wWU8B2MmB0Qm4nvhW6JijGLSS3RRjelak
 gjB8D9PsgqllVBW7ZKiEqwggDK/LCSUmduby2ppRsrCkeSEqmN1N9Dd9zSDbAhscXNZkxKoiJxaAc+
 qn5/l2e1pYlPhmpm8z3+STuZE0OVZrQYSK8RsGHCGDmogWOLpQXKV8mOeThvPc8fiT4eH+QQN+HFL5
 iSVPE+L/1Zr3TpF20aZB9aUESBilPV+qbtUEY+6f2GGjWMhKBpEWRVFL3nUGjOlIlmlFfdflvEP0Ey
 49OgjwmNz5P82LcR+net2PCW5fGe+fHv+3Fe12bq8/wx5L/XuDF8Wvm50Mpw==
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index ce8f3cc6e853..e1c3281651ae 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -318,6 +318,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -345,6 +349,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -732,6 +738,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1

