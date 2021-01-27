Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A23055C5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB28A6E7DA;
	Wed, 27 Jan 2021 08:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3816E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 04:54:50 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id o63so748789pgo.6
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vrn1EIPDQCV6JxTU+kz1dQgkwQ7HwcD+i4/it9ET80A=;
 b=GIfmPVWtCArqU58hShfQRtp9JVW9Q5txh3wsHjzy5wEQHXSQ//q4qpWXPtjWa+BJ2q
 GNQbIHm8s3eJkN7XeMXPnpc3C8F7uAO5XK2tgoynWeNk5YWjYu0XwS35KjLAQOudnDTA
 7KnJnXS3u10SfGwurLDpej70QUx8340bcwwI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vrn1EIPDQCV6JxTU+kz1dQgkwQ7HwcD+i4/it9ET80A=;
 b=S/q05J6+C3NFFvHudPuP9qrv6CJBkoX4uzFDxbhIBi1xVWyN2CuVcmWyaI3CoE+KiL
 B1pYdl/ehU+iwkFYcp7EW0zu5tkTAWZXyOq1C/qicm+M5+8IfeSJuH9ZEcWxojD+A2mA
 t9vL91vUlvLDdc4k40Ekfa1svupT782HJ+M1ziHDc4ePwXRqS7aK+Of3LUbZUMkNHgFi
 bGwoox3ubd1St4PvHDznRt0Ec0vEusajeHAXVO/tF/Clm9hcBINr7UmT/DZhmUf/0wy0
 xdWM+ql2r+heB5MIMHTKJ+YikzZYaJNsJfsdkvNMwFhDHPVpV3Pjg5Fpxf8C+jY/Nclz
 S4fQ==
X-Gm-Message-State: AOAM532/HQtk/j7SDlbatqzLMIN+32RMRvHuGTn27nFY5uRPOjQIzLVl
 XeAoLoRF5B1LsofcbychanzqfA==
X-Google-Smtp-Source: ABdhPJzmAE0XHnp+3O7fjrJHUt/ytzcfhArSJEaMmq1xhk9ptYxmlr6MSoR2+oAnpSFK6O9/qOSm7w==
X-Received: by 2002:a63:4d59:: with SMTP id n25mr9033962pgl.122.1611723290229; 
 Tue, 26 Jan 2021 20:54:50 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:49 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 6/9] drm/mediatek: add has_dither private data for gamma
Date: Wed, 27 Jan 2021 12:54:19 +0800
Message-Id: <20210127045422.2418917-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Not all SoC has dither function in gamma module.
Add private data to control this function setting.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index b5a499d7e472c..c98fe284265d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -25,7 +25,7 @@
 #define LUT_10BIT_MASK				0x03ff
 
 struct mtk_disp_gamma_data {
-	u32 reserved;
+	bool has_dither;
 };
 
 /**
@@ -91,7 +91,8 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
 		      DISP_GAMMA_SIZE);
-	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
+	if (gamma->data && gamma->data->has_dither)
+		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG, cmdq_pkt);
 }
 
 void mtk_gamma_start(struct device *dev)
@@ -171,8 +172,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
+	.has_dither = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{ .compatible = "mediatek,mt8173-disp-gamma",
+	  .data = &mt8173_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
