Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEB76B425
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 13:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D906F10E3EC;
	Tue,  1 Aug 2023 11:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8135C10E11E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 11:59:06 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AE44E660718D;
 Tue,  1 Aug 2023 12:59:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690891145;
 bh=D8JgjR51ioF8fx7m/fH4EUDsN30Yt9OdM2Jk9HpBU00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VdVADUYaWzNVJfqjtdMQqkV6N5jXNpykt3jFTjiZA0P/R6eN9GVmjB6u+Ge2cYrs9
 yeKNF06g0qeQYiEv6YKPuIhGzp2jEJ8co0pvVic7k9NrbOyXUV324L30/eo3hK2D+m
 HVZ3VivJg827qEps5HvJMZCoOtajdDbq+DUnJtKApVovYwYvGOFt1YlYo221JMWoeN
 Z/mc/KiYvWJf3p46kO679aVTxRxSlJqbeceK7kGaUPbxWHEdkrrVh8PLOFwEB7RL+l
 BCdUKBl1SHMK2jfozwkLRqMCrQkKgw7+DM1duySn1JL9xodTOaQntf4xh9LGH+cCwQ
 q6oOGj8rxzetA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v8 05/13] drm/mediatek: gamma: Enable the Gamma LUT table only
 after programming
Date: Tue,  1 Aug 2023 13:58:46 +0200
Message-ID: <20230801115854.150346-6-angelogioacchino.delregno@collabora.com>
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

Move the write to DISP_GAMMA_CFG to enable the Gamma LUT to after
programming the actual table to avoid potential visual glitches during
table modification.

Note:
GAMMA should get enabled in between vblanks, but this requires many
efforts in order to make this happen, as that requires migrating all
of the writes to make use of CMDQ instead of cpu writes and that's
not trivial. For this reason, this patch only moves the LUT enable.
The CMDQ rework will come at a later time.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 1e21dd92c88b..b9dc8754187d 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -66,11 +66,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 			  struct drm_crtc_state *state, u16 lut_size)
 {
 	struct mtk_disp_gamma *gamma;
-	unsigned int i, reg;
+	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
-	u32 word;
+	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -84,9 +84,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 	else
 		lut_diff = false;
 
-	reg = readl(regs + DISP_GAMMA_CFG);
-	reg = reg | GAMMA_LUT_EN;
-	writel(reg, regs + DISP_GAMMA_CFG);
+	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
@@ -116,6 +114,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs,
 		}
 		writel(word, (lut_base + i * 4));
 	}
+
+	/* Enable the gamma table */
+	cfg_val = cfg_val | GAMMA_LUT_EN;
+
+	writel(cfg_val, regs + DISP_GAMMA_CFG);
 }
 
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
-- 
2.41.0

