Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08E6F5762
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 13:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B5310E29F;
	Wed,  3 May 2023 11:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632F710E27E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 11:49:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6807666056D2;
 Wed,  3 May 2023 12:49:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1683114573;
 bh=aCU/cb8ywAx93RIt2iqX4uy/N+bZzvG6XrW+nMBBWtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fa1GKNs0+L7JnMaD3viFyyQJ9RZlkr8i0koNW/6BRCNrxJ6NexQ+4YgFTR3WlWHbE
 DUidekAIk60xYFkxrnqM/jC5X7FpIse5gU9tIkedym2SHQ3ps0EF9ZQeSpg9PSf77G
 khPUPHguAWG8Lu5rMcDzEaKX2nRPNzE8pxlDbLJ9EZpWjWGpld4Bw5BigjHswtP3MJ
 6xTXnpy6Kh9DMBW6u0Nfnu5Rb1yK291FLGP9vIcjxY6gFU13IipnjGVPPVlvwKJA8u
 WQ3LfO1iQBtaoLjp5YMNvuQGT56E+e6hetZ+qBaTr0yMJCBGhEQER3I8zPO28t5bkW
 apn3ZufmtSRJw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v2 04/11] drm/mediatek: gamma: Improve and simplify HW LUT
 calculation
Date: Wed,  3 May 2023 13:49:16 +0200
Message-Id: <20230503114923.156985-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
References: <20230503114923.156985-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
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
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 30 +++++++++++++++--------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index d194d9bc2e2b..89a1640c2e8f 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -77,7 +77,6 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	bool lut_diff;
 	u16 lut_size;
 	u32 word;
-	u32 diff[3] = {0};
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -97,18 +96,29 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
+		struct drm_color_lut diff, hwlut;
+
+		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
+		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
+		hwlut.red = drm_color_lut_extract(lut[i].blue, 10);
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
2.40.1

