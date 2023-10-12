Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D79357C6A24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F9910E48D;
	Thu, 12 Oct 2023 09:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35D210E48A
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:57:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AAED66607354;
 Thu, 12 Oct 2023 10:57:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697104675;
 bh=kE4xYln1H3vYAzVz5ckJegqLjKvVvNwbUjwODAr7b6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eZKU5RSOCY9RHfx4yarEb75ggkhZjyQUINmE4jOinyW+vOySM8TEWzdZnmTcnrTl2
 hEVtTNNuwb+BsJgyMF00UzEuMk9852sUyA15s3TIDga2Nx+i73LUBc3UVz6KhCfGi9
 V3M1U829zMKEVF7K7UecXz5UwySA34VDPZktxBUQ+x0YpJU334YIDmjytTGmBF9vvg
 1/0AbSKDWZRQB+pMzl4tT7uUBbylsLVIB9Rn8jmurG21h1bAt1pezGKLmu8IFklXyo
 R/NcvaqZcRoA7zyevdTCxvz5A0B5BRC26fdZOy5cO0vOnfPzRelJKXGX/fSjqy0KRy
 KN7y+Lvs0zH7w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v11 13/16] drm/mediatek: gamma: Program gamma LUT type for
 descending or rising
Date: Thu, 12 Oct 2023 11:57:33 +0200
Message-ID: <20231012095736.100784-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the SoCs that don't have dithering control in the gamma IP
have got a GAMMA_LUT_TYPE bit that tells to the IP if the LUT is
"descending" (bit set) or "rising" (bit cleared): make sure to set
it correctly after programming the LUT.

Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6746033615db..0f116c0e51b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -22,6 +22,7 @@
 #define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
+#define GAMMA_LUT_TYPE					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
@@ -82,6 +83,17 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return 0;
 }
 
+static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+{
+	u64 first, last;
+	int last_entry = lut_size - 1;
+
+	first = lut[0].red + lut[0].green + lut[0].blue;
+	last = lut[last_entry].red + lut[last_entry].green + lut[last_entry].blue;
+
+	return !!(first > last);
+}
+
 /*
  * SoCs supporting 12-bits LUTs are using a new register layout that does
  * always support (by HW) both 12-bits and 10-bits LUT but, on those, we
@@ -173,6 +185,14 @@ void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
 
 	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
 
+	if (!gamma->data->has_dither) {
+		/* Descending or Rising LUT */
+		if (mtk_gamma_lut_is_descending(lut, gamma->data->lut_size - 1))
+			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
+		else
+			cfg_val &= ~GAMMA_LUT_TYPE;
+	}
+
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-- 
2.42.0

