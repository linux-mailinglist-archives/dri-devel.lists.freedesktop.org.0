Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D96B54BBB3D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F1B10EC4B;
	Fri, 18 Feb 2022 14:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDE10EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:20 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id i19so5408253wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsBWqhdlaWb1gMEMCTy+xVO70hKJt7Vn6RQJImIvis0=;
 b=7+JO8GgDz4eLqZqGL8gwXCKx3NMB4p8Wwn1xYLk69tPcCPx4ZZCHeT2egR0aCOFzB3
 5plooVjc/uxWNVgjnYd/iz55rnCbwVFW1oZzJqY9FMA/kZ2lMHqhv+nw4/fzrbSl888o
 +pJ+UmsFn7LNXUxlgJV3l21O6IRlAn5q034XeSze0dJXlywxtBuTY9GbCbDmIt8Gp7hG
 yDfy8Vf247TlM2ydggvBl1+jh9aKkMNTxJZeAHaGCaEUm8bcM1VqDkMtn4rwTPSeG81O
 B9zdgBvg9OXJjnqT70Mq1uscokETupfm+oflpZzO0oC/Mh4DqnYIEcgw1XaTuDF52lj7
 s7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsBWqhdlaWb1gMEMCTy+xVO70hKJt7Vn6RQJImIvis0=;
 b=e+BBSKYASAu+/bERDA6b05t2QIM0BLo8/tfpWTyoOgKUhL8ryuuyYukAPM0XfosZ7H
 cvylueS6qwKgjqbWHYFogF1LV/RRJ4Sbb1omW/fsX4as569MN5QSyrNZWEfXGPExQ+id
 i1hd1RFb6WsmCv797lzS48ucp1EIq8Hx3WN8HYEJmSdad/VRv5R7jH9huXXy+1U6SmGm
 AlrSF6XyFs0i06f7ix8mGnzYbJ/Nx84H/rb7+b58fblUfx3vn8SwbofR77fevFhVaHxE
 89KIxuRzF8laSS7t1le82TbNrqaGP57jKhSPyJ/hhq9srJR46BJ8qLXFY2lAosh/2X6D
 XTzA==
X-Gm-Message-State: AOAM531VEDBcKTN8Rmfm0L6b67F/IEckUNRCv2HXjBBmeHjckGswJrxz
 atH3fzmRlZlMF1HuSyl+ZdIsPg==
X-Google-Smtp-Source: ABdhPJyFvD28f6eULBjPuAD0GLrHqccrZfmLJsTsBWJtRo1FCRC+AL4xjZn1NWK7NCcpJLwQblQYQQ==
X-Received: by 2002:a05:600c:2d41:b0:354:24d2:8e13 with SMTP id
 a1-20020a05600c2d4100b0035424d28e13mr11133608wmg.138.1645196178651; 
 Fri, 18 Feb 2022 06:56:18 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:18 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board config
Date: Fri, 18 Feb 2022 15:54:28 +0100
Message-Id: <20220218145437.18563-11-granquet@baylibre.com>
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

Add flexibility by moving the swap shift value to board config

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0d3acd08ea358..ec221e24e0fee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -131,6 +131,7 @@ struct mtk_dpi_conf {
 	u32 dimension_mask;
 	// Mask used for HSIZE and VSIZE (no shift)
 	u32 hvsize_mask;
+	u32 channel_swap_shift;
 	const struct mtk_dpi_yc_limit *limit;
 };
 
@@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
 		break;
 	}
 
-	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
+	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
+		     CH_SWAP_MASK << dpi->conf->channel_swap_shift);
 }
 
 static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
@@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
@@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.swap_input_support = true,
 	.dimension_mask = HPW_MASK,
 	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
 	.limit = &mtk_dpi_limit,
 };
 
-- 
2.34.1

