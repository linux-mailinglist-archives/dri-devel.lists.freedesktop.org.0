Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8923E765034
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 11:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2990210E55F;
	Thu, 27 Jul 2023 09:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A0410E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 09:46:49 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9A9676607175;
 Thu, 27 Jul 2023 10:46:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690451208;
 bh=0Iha/JOTYyfiitNl2/tF672JZIUVhHcbx0vgBiZKTc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hRUYCKLiNNMNeaZ6LtmbttbslYB06NAh6Ow5BUdEJcf5qkFsiEQ4wVF63i44gy7XQ
 C/4pA+yG0SDMdgseo6EXuzk1b9S4s1cUHw0eLcsNJEwlAwbS8GAfB8Wleuaxkq+NKP
 zCQWBi4c5aR6bTrFr6u1XaicI9C6iCSZoJUggrMl6cJWqvYsstmZVM3bb2gVKlG6SK
 q+yYPqt5I+DkoYV0Urv3VABn6n+TZK16pEv4L6PfdrQEAMEpPOBV6tnq/Vanjf064F
 dkh3gXR4ERN3v/o+otO6qSu9fhfprCPjshYWzkgzARI8VFbZymJlFmAcRlXGDHx6EH
 Kj2+jl03e9YWQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH RESEND v6 11/11] drm/mediatek: gamma: Program gamma LUT type
 for descending or rising
Date: Thu, 27 Jul 2023 11:46:33 +0200
Message-ID: <20230727094633.22505-12-angelogioacchino.delregno@collabora.com>
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

All of the SoCs that don't have dithering control in the gamma IP
have got a GAMMA_LUT_TYPE bit that tells to the IP if the LUT is
"descending" (bit set) or "rising" (bit cleared): make sure to set
it correctly after programming the LUT.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index e9655b661364..020755ae0ec0 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -23,6 +23,7 @@
 #define GAMMA_RELAY_MODE				BIT(0)
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
+#define GAMMA_LUT_TYPE					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
 #define DISP_GAMMA_SIZE_HSIZE				GENMASK(28, 16)
 #define DISP_GAMMA_SIZE_VSIZE				GENMASK(12, 0)
@@ -89,6 +90,16 @@ unsigned int mtk_gamma_get_lut_size(struct device *dev)
 	return lut_size;
 }
 
+static bool mtk_gamma_lut_is_descending(struct drm_color_lut *lut, u32 lut_size)
+{
+	u64 first, last;
+
+	first = lut[0].red + lut[0].green + lut[0].blue;
+	last = lut[lut_size].red + lut[lut_size].green + lut[lut_size].blue;
+
+	return !!(first > last);
+}
+
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
@@ -178,6 +189,14 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		}
 	}
 
+	if (gamma && gamma->data && !gamma->data->has_dither) {
+		/* Descending or Rising LUT */
+		if (mtk_gamma_lut_is_descending(lut, lut_size))
+			cfg_val |= FIELD_PREP(GAMMA_LUT_TYPE, 1);
+		else
+			cfg_val &= ~GAMMA_LUT_TYPE;
+	}
+
 	/* Enable the gamma table */
 	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
 
-- 
2.40.1

