Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A485CE9DAE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 15:04:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75EB10E8F0;
	Tue, 30 Dec 2025 14:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y7JDCR3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E062410E8F0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767103439;
 bh=7ItMKgsVy2ANsMynoBcCjpMv8Wqb8/BHa+zFioLqrpU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Y7JDCR3KjF5xO3Cb9p8u4LJAanA1E+R1SJFxaZgjU/Etndc0lo1hPKtGny9QXsImT
 lBOmOs0SkuSiz4Ptv3Nlt/0iBvRxGd4xf206J+9utGm6abmLEq/euGzWZRdOvdZSZ1
 LjKb5xEi7xZWwiHyG6O6vYa6Hi4o0+lMMiGrrBERqjuUXbW8YDzN4nW5QCX4WZAXQk
 WMYNC0Pwo8ipF7j9E9QzlcEcBMx+MgvtU2EXyFMuEBrw4cx9qa2wuDoDkPPks4G1gs
 ZYjBKH76CLrhKOfkj4lXTi3YcflkSsO+IU2IClTszAln7TeoN8veD38tjUJYeExS5f
 aIV0UPdepajzg==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:a1ec:e46f:3b67:baf0:3d70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8242317E0ED3;
 Tue, 30 Dec 2025 15:03:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 30 Dec 2025 11:03:05 -0300
Subject: [PATCH RFC 5/6] drm/mediatek: ovl: Disable AFBC on MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-mtk-afbc-fixes-v1-5-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, Nancy.Lin@mediatek.com, 
 Jason-JH.Lin@mediatek.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

Despite MT8188's OVL being mostly the same IP as the OVL on MT8195, it
does not support AFBC, even when the same register configurations are
applied. Introduce a separate compatible for it with AFBC support
disabled.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 196b874057ba..97f6694772d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -762,6 +762,21 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
+static const struct mtk_disp_ovl_data mt8188_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+	.supports_afbc = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.formats = mt8195_formats,
+	.num_formats = ARRAY_SIZE(mt8195_formats),
+	.supports_clrfmt_ext = true,
+};
+
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.addr = DISP_REG_OVL_ADDR_MT8173,
 	.gmc_bits = 10,
@@ -790,6 +805,8 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8192_ovl_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
 	  .data = &mt8192_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8188-disp-ovl",
+	  .data = &mt8188_ovl_driver_data},
 	{ .compatible = "mediatek,mt8195-disp-ovl",
 	  .data = &mt8195_ovl_driver_data},
 	{},

-- 
2.51.0

