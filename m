Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A751E4BBB47
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A6310EDC3;
	Fri, 18 Feb 2022 14:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C327610E9D8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e3so15108893wra.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05D+3SKZ7tKyXIjmuWnmBbAFic5DyC5nxoFhcmxTYHM=;
 b=XRVLtCA6bB2RENQ6zCTV2QK0fMPPuWQMd9PHjYs2TWXZ+/XIHN7/vUE0nW/8Sudo5L
 ixxyQe/plaAI+6zg7JFobruNHFdn+qRcrRo2T7p0v5CdmK+tfhqNcOgS35lwdQah+ds+
 OQlk8nTP78vlPGMuwezHTJ1e4Eyomy7OMzZ6YfSwoSPzmPqobc5TfETm/nZu+Vw8TRDt
 q/NFNvbHzBv4sDjyf6VrG0aEFY3xjvydfdTo1eA496dSKUVmSLEV1LX2+kS0i4Z7of/B
 dEoOd1OZvv2mWWmmtF/J1GgEi3cGWh8Jw7oqBWBb/tLB1/DUOSWTLShdrc5bWKCbsH0K
 PL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05D+3SKZ7tKyXIjmuWnmBbAFic5DyC5nxoFhcmxTYHM=;
 b=3YqCmSy1M+74A/z35moMIRuSGFn9rkE9u91ouXhXokE3VFp4ALD4ShVSHdTtpQnVIU
 fW97Jh0+ws/rC5md8ezX1XwAvYG8DTV9Tnk7+RExQ6EqoUY7882XKAbCtYAFuU00eiBF
 LQtybpYsvOJJ0jMaelPBaz+c+Uu/sW+qAOxXrHKIEhavM2tDOW5Nd+yTUed1Znx/f9wo
 Go3wz6EILC13mRPrfPsYNlPcvVhUtym0D7sCNEMZpmSqfB7JySRIMEndgyWMB9GS+y4m
 Ug/feP9AaSH6PD4R86LhysxlK/Q1AW6oQGTMLkfAIMwGhH5BmPlMd7LphO9wFQ/FRylt
 ze9Q==
X-Gm-Message-State: AOAM532ZjdaFm9HWeCd/DxzCxl+RCXlQQ9ytRMO5Ew2jIjBBN3cpjwVu
 X1PrkKLjxpz0BA/0cBoRJawDLw==
X-Google-Smtp-Source: ABdhPJxzIJ4HeICGEQlbgAY6RhWstXxhrG+4xKFtg/DzjbljouSlndT3aFcLqryjNnjrzZMMpbND/w==
X-Received: by 2002:a05:6000:257:b0:1e3:3a1b:d4ca with SMTP id
 m23-20020a056000025700b001e33a1bd4camr6305144wrz.112.1645196172298; 
 Fri, 18 Feb 2022 06:56:12 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:11 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle in
 board config
Date: Fri, 18 Feb 2022 15:54:25 +0100
Message-Id: <20220218145437.18563-8-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a bit of flexibility to support boards without swap_input support

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 545a1337cc899..454f8563efae4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -126,6 +126,7 @@ struct mtk_dpi_conf {
 	const u32 *output_fmts;
 	u32 num_output_fmts;
 	bool is_ck_de_pol;
+	bool swap_input_support;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -378,18 +379,21 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
 	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
 	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
 		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
 		mtk_dpi_config_yuv422_enable(dpi, true);
 		mtk_dpi_config_csc_enable(dpi, true);
-		mtk_dpi_config_swap_input(dpi, true);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, true);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	} else {
 		mtk_dpi_config_yuv422_enable(dpi, false);
 		mtk_dpi_config_csc_enable(dpi, false);
-		mtk_dpi_config_swap_input(dpi, false);
+		if (dpi->conf->swap_input_support)
+			mtk_dpi_config_swap_input(dpi, false);
 		mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
 	}
 }
@@ -808,6 +812,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -819,6 +824,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +835,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.output_fmts = mt8183_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -839,6 +846,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.output_fmts = mt8173_output_fmts,
 	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
 	.is_ck_de_pol = true,
+	.swap_input_support = true,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

