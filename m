Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4526876B424
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28610E3EA;
	Tue,  1 Aug 2023 11:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B582510E3E6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:59:05 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C720A660718C;
 Tue,  1 Aug 2023 12:59:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690891144;
 bh=300Y5h80g46COpGlx0H6hu4Nbeunl/5bqJFtVyc6tvo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZFsIaeGOaGgR2WFlvXKzdjA8WLoqx2wu+PFLk+pSwwz7GEvhUY6GqkYhrAQ43a+Gr
 UxW6OP9qgDGqgo8jgHZt9PQjvEtm3s3InMzSyD7PGmsnny5L0/pemcOjJHnpqFOGLL
 lPSWTgFs0/8VUQgoljCU52jxqFHSSizfhbL8FBf9IJhvwyO32CTO+g6B5/DsevXdRL
 +SLPGlfOUpP4qp97K0B72LBNma2myhViGKf4IHNAM79HdRhirifBZi3SC58W4jsrRn
 O4ZPx0owPi1leyS9K4/Xv1kRLjI8p6TkoNMP6EMPWUB/cML4qN2WKNk+zSp/JRsnrL
 Qw3bXRvvKmeTw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v8 04/13] drm/mediatek: gamma: Improve and simplify HW LUT
 calculation
Date: Tue,  1 Aug 2023 13:58:45 +0200
Message-ID: <20230801115854.150346-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
References: <20230801115854.150346-1-angelogioacchino.delregno@collabora.com>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_color_lut_extract() to avoid open-coding the bits reduction
calculations for each color channel and use a struct drm_color_lut
to temporarily store the information instead of an array of u32.

Also, slightly improve the precision of the HW LUT calculation in the
LUT DIFF case by performing the subtractions on the 16-bits values and
doing the 10 bits conversion later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index bfdecb278b45..1e21dd92c88b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -71,7 +71,6 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	void __iomem *lut_base;
 	bool lut_diff;
 	u32 word;
-	u32 diff[3] = {0};
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -91,18 +90,29 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
+		struct drm_color_lut diff, hwlut;
+
+		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
+		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
+		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
+
 		if (!lut_diff || (i % 2 == 0)) {
-			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
-				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
-				((lut[i].blue >> 6) & LUT_10BIT_MASK);
+			word = hwlut.red << 20 +
+			       hwlut.green << 10 +
+			       hwlut.red;
 		} else {
-			diff[0] = (lut[i].red >> 6) - (lut[i - 1].red >> 6);
-			diff[1] = (lut[i].green >> 6) - (lut[i - 1].green >> 6);
-			diff[2] = (lut[i].blue >> 6) - (lut[i - 1].blue >> 6);
+			diff.red = lut[i].red - lut[i - 1].red;
+			diff.red = drm_color_lut_extract(diff.red, 10);
+
+			diff.green = lut[i].green - lut[i - 1].green;
+			diff.green = drm_color_lut_extract(diff.green, 10);
+
+			diff.blue = lut[i].blue - lut[i - 1].blue;
+			diff.blue = drm_color_lut_extract(diff.blue, 10);
 
-			word = ((diff[0] & LUT_10BIT_MASK) << 20) +
-				((diff[1] & LUT_10BIT_MASK) << 10) +
-				(diff[2] & LUT_10BIT_MASK);
+			word = diff.blue << 20 +
+			       diff.green << 10 +
+			       diff.red;
 		}
 		writel(word, (lut_base + i * 4));
 	}
-- 
2.41.0

