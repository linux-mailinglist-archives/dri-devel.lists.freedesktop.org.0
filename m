Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E314BBB1F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6D510EC25;
	Fri, 18 Feb 2022 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012C810EB63
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id p9so14996399wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BY2INqP5/ML6M0B5RXCe3qW6LaccjrUVhDYjta1rw28=;
 b=Nn5Qt5GlmO2JofQtcrAgsfqSOdkqB7Tu5hXL1wU5yHulSqYqZhoEI/4feFzqNbfqrp
 br80hHQ0W+SbYWnzHMvh/tsB4sBXwJMWrskwR8RT0d2fbx8ec92r8h/SAac/iyzsUjns
 Hm7TyLj+eAsJmiUPkoHrACNiEWJnPW18SlQorK+lfzAg4XeO202ydsKvTFsBPBqoU9kU
 AEkryKI9f3gbLYaDDo22CnDnQz6r27txIm57q33phelJy8ZbZ64oU0fO/yu8RCR3tmb3
 tonoAnsfjNBqmJxBULHXKDDtF/5bUV5u8iE1X6tNQHhlIgoyXIRTPuzVSrIVoZ5WOMOE
 QL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BY2INqP5/ML6M0B5RXCe3qW6LaccjrUVhDYjta1rw28=;
 b=HKOLyWl8gAO77+y5QFhqOtl5fQp5DJ+iHMuRkv680w2tEnOPEyIZm6nKmtHLe72GyF
 9O0DhginBL7VRBRxmfOGOBRGFwUh9NvkARZxxvDIqa6s7x2bFv6t9x/HbkG73u/14F70
 4MolfS467AFLAPHh5r5IMBXkwby9fyWdxcF1S70mE3KUlA3e/2+b5QDQXgjweo6eiLET
 mGo2karJcxov1alqh8fogKixY11ESgNATtKnAgbAX87RCwfsaV19RmJKDYRn15m/clmN
 HQVuDM3aWgP2oHJUOMSQxKrLFkCQ0LYisfsYIcHGwzlDG+X6yNehljeocBrWMzdLgM3h
 eKfg==
X-Gm-Message-State: AOAM531k7jUIaa2d8TdnPjfpZI9XlajXlnsGwC1j2/VanNKy3PPLBuST
 8Hs3DginbgyoRYtWp5NVFZkwIg==
X-Google-Smtp-Source: ABdhPJx1nSDEfTBmLfQ7yKV8krgbtdoJ22jOuH5HY/NqNK/26S8qJNcxP8B0rTBJCXywchzlr5iR6Q==
X-Received: by 2002:adf:d20c:0:b0:1e5:952c:34b5 with SMTP id
 j12-20020adfd20c000000b001e5952c34b5mr6528939wrh.82.1645196176558; 
 Fri, 18 Feb 2022 06:56:16 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:16 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 09/19] drm/mediatek: dpi: move dimension_mask to board
 config
Date: Fri, 18 Feb 2022 15:54:27 +0100
Message-Id: <20220218145437.18563-10-granquet@baylibre.com>
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

Add flexibility by moving the dimension mask to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 8ca3455ed64ee..0d3acd08ea358 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -129,6 +129,8 @@ struct mtk_dpi_conf {
 	bool swap_input_support;
 	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
 	u32 dimension_mask;
+	// Mask used for HSIZE and VSIZE (no shift)
+	u32 hvsize_mask;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -243,8 +245,10 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
 
 static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
 {
-	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
-	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
+	mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE,
+		     dpi->conf->hvsize_mask << HSIZE);
+	mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE,
+		     dpi->conf->hvsize_mask << VSIZE);
 }
 
 static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi)
@@ -816,6 +820,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -829,6 +834,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -841,6 +847,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -853,6 +860,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.is_ck_de_pol = true,
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

