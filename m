Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAB6765021
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F6110E557;
	Thu, 27 Jul 2023 09:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E135710E552
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:46:43 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D23A660702D;
 Thu, 27 Jul 2023 10:46:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690451202;
 bh=IbtbZnmCWfYYE0XVFaNK/WT77zqaqxGqnAMw0WmBnlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FTiasmguwHtP8vwFf4YufBs3BGGM/m2n23IQPEZEBcnTMcckT6z06NKiYdJEQRMFB
 EkUyer8IE6m0NOog+YzC4cT2HtbeVxHiu2eXFmhwPhToPfYniskiTFQVoMBpnWROyC
 nGG//ekA/cCBfMcbx78Byz0itkVF5XqAjXFHvt0+j5+QCnYbK/V1qr0UF/vsiIa1Ho
 SDoK27mIbK4tqk+fiZ44rSSenWf+6oBlIp1VKQ2z2txhxxuXQaJoVvJZwIkFzAVnMd
 BDRnRgE6WXJUqbISxa63n1Inv/ws9Glaq70hy+ByBnveyZk7uaLnYv2nX/bLkEWtby
 AdJ+SzUn1V44w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH RESEND v6 05/11] drm/mediatek: gamma: Enable the Gamma LUT
 table only after programming
Date: Thu, 27 Jul 2023 11:46:27 +0200
Message-ID: <20230727094633.22505-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
References: <20230727094633.22505-1-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
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
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 204a1aa7bfc9..b75a77af5205 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -71,12 +71,12 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	unsigned int i, reg;
+	unsigned int i;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
 	u16 lut_size;
-	u32 word;
+	u32 cfg_val, word;
 
 	/* If there's no gamma lut there's nothing to do here. */
 	if (!state->gamma_lut)
@@ -90,9 +90,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		lut_size = LUT_SIZE_DEFAULT;
 	}
 
-	reg = readl(regs + DISP_GAMMA_CFG);
-	reg = reg | GAMMA_LUT_EN;
-	writel(reg, regs + DISP_GAMMA_CFG);
+	cfg_val = readl(regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
 	for (i = 0; i < lut_size; i++) {
@@ -122,6 +120,11 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
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
2.40.1

