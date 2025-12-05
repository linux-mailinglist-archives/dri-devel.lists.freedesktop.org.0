Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A302CCA7ECF
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 15:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DCA10EB3D;
	Fri,  5 Dec 2025 14:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EW8jcJsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985E10E144
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 14:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764944571;
 bh=pMwPFJMTtIP4dtXu2+MjCXusZPpj26s41YMtdPqsIt4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EW8jcJsl8AuIKgt2RnlWlpw5uHAJm4116T5wJU3U1sotbOySHa012kPNTE6ZPugbv
 lfc2GLM23lNhhY8bFIPsZmnbHujBAK8bxIc1rMaXdibjUmcJ3zvWi1Ai6mT+Tcvqc/
 NucXXe1iAgLdvm/hZziItXZA0/QCBpZq7zXZoMwmwIDdkX16UkA4w+q5Y9HbxQFRyg
 KBuooa6EYQsl6Et9fh7eEiZAg16Fgw9UL9gsXS3C0Tv4Eo93EU+J6BAgHTV3fVtM3n
 OKD+79Yby0ab4mrqst3a83TFDurxhWEOJeNcyx5v9B7yaT/5uHKU0JBfeRQJ8pSCyQ
 t94vMxilcSqEg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C3E5517E1149;
 Fri,  5 Dec 2025 15:22:50 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 05 Dec 2025 15:22:26 +0100
Subject: [PATCH 1/2] drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on
 timeout cases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-mtk-hdmi-ddc-v2-fixes-v1-1-260dd0d320f4@collabora.com>
References: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
In-Reply-To: <20251205-mtk-hdmi-ddc-v2-fixes-v1-0-260dd0d320f4@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764944570; l=1808;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=pMwPFJMTtIP4dtXu2+MjCXusZPpj26s41YMtdPqsIt4=;
 b=IjONvCPU1h33wadF1IH3+uR6UHWidUH2F80MCy1EokeaQlxCEKOuMrbZFVVpXy3voIsmgiWJY
 GjFZaRMC5owAXNkD5kAGFZL6Iz2rL06MN+OO/YUROptJlgeIhhc20N5
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During a read or write transfer, the mtk_hdmi_ddc_v2 driver polls the
DDC_I2C_IN_PROG bit of HPD_DDC_STATUS register to check if the transfer
completes but do no particular action if a timeout is reached. It could
lead the next transfer attempts to fail because the faulty transfer was
not aborted. So, add in both low level read and write functions a abort
action by writing the DDC_CTRL register with the ABORT_XFER command
value.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
index b844e2c10f28060baef64bd36c5464758b08e162..6ae7cbba8cb6dacf46c2f7ab74a2d7446d698b69 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
@@ -96,6 +96,11 @@ static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
 				       !(val & DDC_I2C_IN_PROG), 500, 1000);
 	if (ret) {
 		dev_err(ddc->dev, "DDC I2C write timeout\n");
+
+		/* Abort transfer if it is still in progress */
+		regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+				   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT_XFER));
+
 		return ret;
 	}
 
@@ -179,6 +184,11 @@ static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 uc_dev,
 					       500 * (temp_length + 5));
 		if (ret) {
 			dev_err(ddc->dev, "Timeout waiting for DDC I2C\n");
+
+			/* Abort transfer if it is still in progress */
+			regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
+					   FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_ABORT_XFER));
+
 			return ret;
 		}
 

-- 
2.52.0

