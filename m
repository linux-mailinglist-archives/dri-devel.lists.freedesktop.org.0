Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E189F4FC0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15FB510E9F5;
	Tue, 17 Dec 2024 15:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="KmJBS7Pw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [IPv6:2a01:4f8:201:9162::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFFB10E9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450263;
 bh=0p0IXEd2fkgLDSgY6EoCVjmZxOOmdUnvxWTxBaH6WFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KmJBS7PwWG9TOhb42rJtkBFGP/ahb5CO+A1Z33I/M3WVG55oYZtYGkYllg+wyPG20
 B8a8oP9jfwvCS7zviPpoK+7cZL5qkouy1Ee9yCrtIdAtt3E1Hm62ww2hFzQTTvY7EI
 /wtu+X32VFGcdpUfKyI13l0Ce4aHQUtWYjNvnCie22g/i7A6SbBWcgneHfEXo3rxHH
 Lzq1CHhEpF93+S/gS/6/GyROoAdQxctqjX+KHgSU2BoIA9RgQXYZ79/youjeMpdE54
 SuxOCoSHnwETfqa3HBfx2+tUmQvtjf2bu7UQ2/pAxH9cYhtwOvhnZuWqoC7KKvFP4h
 j3BxIUDY2NHWg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D20D17E37AF;
 Tue, 17 Dec 2024 16:44:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 23/33] drm/mediatek: mtk_hdmi: Use devm managed version of
 drm_bridge_add
Date: Tue, 17 Dec 2024 16:43:35 +0100
Message-ID: <20241217154345.276919-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the probe/remove functions by using devm_drm_bridge_add()
as now there is no more need to manually remove the bridge.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 2d5cf7352ed2..5d46d486c68f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1674,14 +1674,15 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "MediaTek";
 	hdmi->bridge.product = "On-Chip HDMI";
-	drm_bridge_add(&hdmi->bridge);
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add bridge\n");
 
 	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		drm_bridge_remove(&hdmi->bridge);
+	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable audio clocks\n");
-	}
 
 	return 0;
 }
@@ -1690,7 +1691,6 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
 
-	drm_bridge_remove(&hdmi->bridge);
 	mtk_hdmi_clk_disable_audio(hdmi);
 }
 
-- 
2.47.0

