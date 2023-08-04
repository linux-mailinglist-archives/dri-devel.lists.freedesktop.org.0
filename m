Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3976FB1D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7275C10E6AD;
	Fri,  4 Aug 2023 07:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C0210E6AA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:29:08 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E5E2266071C7;
 Fri,  4 Aug 2023 08:29:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691134147;
 bh=zIuIzaHEwa0qol/Hd+tCNwDoAKXf8h/2l/cB7d8v3GQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hvxcP51+E6KU48mDz3WemTuKtEFWyRMb80buz/pC49Ri3BrIzOfmeZBg9NCOPUDVg
 mbe0juxsBbgGptTm6BwGka6pFrJIKdMfkM/VJiIE4dyr6CjJ7um6GszMM6MjTw/cp7
 KtIfPGzAI14DkZAhymaz1dz1wDQ+pXs6DWy5LWs6zD8MUPddHxPIhmAQsUe6MIXjzG
 ZMfvcUYoha5yaKHdgCqpym9zYw72tCJKAtA7oVGXfbBPFrFTvWrh4Qq/Kugx3xsh3i
 uQMzKuWqhZsxBD4e7ZueJbozbqNOf1BIXe3BU8E5+jmrPFW99YNvTJL1XEtKHct3N1
 4n+K0vPRrGLRA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v10 12/16] drm/mediatek: gamma: Make sure relay mode is
 disabled
Date: Fri,  4 Aug 2023 09:28:46 +0200
Message-ID: <20230804072850.89365-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
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

Disable relay mode at the end of LUT programming to make sure that the
processed image goes through in both DISP_GAMMA and DISP_AAL for gamma
setting.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c   | 3 +++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 21b25470e9b7..992dc1424c91 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -122,6 +122,9 @@ void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 		writel(word, (aal->regs + DISP_AAL_GAMMA_LUT) + (i * 4));
 	}
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~AAL_RELAY_MODE;
+
 	writel(cfg_val, aal->regs + DISP_AAL_CFG);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 7d2f8042ace0..fbff9f97b737 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -19,6 +19,7 @@
 #define DISP_GAMMA_EN				0x0000
 #define GAMMA_EN					BIT(0)
 #define DISP_GAMMA_CFG				0x0020
+#define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
@@ -177,6 +178,9 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
+	/* Disable RELAY mode to pass the processed image */
+	cfg_val &= ~GAMMA_RELAY_MODE;
+
 	writel(cfg_val, gamma->regs + DISP_GAMMA_CFG);
 }
 
-- 
2.41.0

