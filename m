Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836972BB7B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 11:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E9B10E09E;
	Mon, 12 Jun 2023 09:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77F10E0C2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:02:04 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A694D66058B2;
 Mon, 12 Jun 2023 10:02:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686560523;
 bh=fWabP2S9MKC6+Yi0YWqUcPZxSafl399il5KPixyXdlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M+g8uCwRld+dEIgLpeT51k38xPkIwZ517PJ1IwwI3HjXA3biUFFsqhVM+0kXSOsCY
 jp3sGEQStYgWLdwzB7UW5gQ+rxTyrVOHH/Hp1XRl6rPCA6msNG8ogbCYBfT5lWc449
 R4LthY1KY1lfj+mxQXwex2ZMYO7nkTc84SQeSCH3NzK0Xebo+7m9P9zL19Itu+UVFa
 LE5A3bREWcVtq/4J8lBhB+mnpIQ+lUO6rjeNZ0XdUlxQ/2R3VzYboeht2lKeov3EIn
 OnZTH5RSnTyQbEtEFb8kgZEeSAel0eqLCctjeEY9ujefARO55cl2u80ybpU096VNIo
 mOHxluPFzqXPQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 01/11] drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common
 parameters
Date: Mon, 12 Jun 2023 11:01:47 +0200
Message-Id: <20230612090157.68205-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612090157.68205-1-angelogioacchino.delregno@collabora.com>
References: <20230612090157.68205-1-angelogioacchino.delregno@collabora.com>
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
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Adjust the parameters in mtk_drm_gamma_set_common()
  - add (struct device *dev) to get lut_diff from gamma's driver data
  - remove (bool lut_diff) and use false as default value in the function

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 15 +++++++++------
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 434e8a9ce8ab..8ddf7a97e583 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -67,7 +67,7 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
 
 	if (aal->data && aal->data->has_gamma)
-		mtk_gamma_set_common(aal->regs, state, false);
+		mtk_gamma_set_common(NULL, aal->regs, state);
 }
 
 void mtk_aal_start(struct device *dev)
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 2254038519e1..75045932353e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -54,7 +54,7 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff);
+void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
 void mtk_gamma_stop(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c844942603f7..99be515a941b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -55,14 +55,21 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
-void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool lut_diff)
+void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	unsigned int i, reg;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
+	bool lut_diff;
 	u32 word;
 	u32 diff[3] = {0};
 
+	if (gamma && gamma->data)
+		lut_diff = gamma->data->lut_diff;
+	else
+		lut_diff = false;
+
 	if (state->gamma_lut) {
 		reg = readl(regs + DISP_GAMMA_CFG);
 		reg = reg | GAMMA_LUT_EN;
@@ -92,12 +99,8 @@ void mtk_gamma_set_common(void __iomem *regs, struct drm_crtc_state *state, bool
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
-	bool lut_diff = false;
-
-	if (gamma->data)
-		lut_diff = gamma->data->lut_diff;
 
-	mtk_gamma_set_common(gamma->regs, state, lut_diff);
+	mtk_gamma_set_common(dev, gamma->regs, state);
 }
 
 void mtk_gamma_config(struct device *dev, unsigned int w,
-- 
2.40.1

