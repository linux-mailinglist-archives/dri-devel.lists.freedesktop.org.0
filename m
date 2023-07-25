Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C3760BCF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCAC10E3AB;
	Tue, 25 Jul 2023 07:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FCAE10E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:32:51 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7024D6607108;
 Tue, 25 Jul 2023 08:32:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690270370;
 bh=dr99OhwRka0b6+lAYNS1mwFM6qaBC8ZcI/J5NoLdlok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WSi16ofMtB8ehG3tBUD1CVjNeDNuqYAfS2USiOTgz8qYecdNQfzoPsjhIAuE8tGFM
 OQ8+y0S+IVKN2oTWSZWU7qQNESjNmiSmb5+mNl8Ot1dm6CjNjLRk7NAQW1LpspsdDN
 xXtojEbHdmtddg+K5E3VJVCiS/p181DbTFD9bAj6/8atOtdzi4b02WFRH7A66rZc/Q
 tR00Fh0S2hQnB9FB0aiTZbZPBNSP+dJfBLBqXHSy6FLUUSmKVtUlRNK2UCkp7akazj
 VZQaBZSo3Nib7cqzHrDf2nbTbvrLsXNDmseskscPM/FYqVf14iYncSdMDoQmwzQk5p
 KV2WAgO/Z8JVA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v7 04/11] drm/mediatek: dp: Use devm variant of
 drm_bridge_add()
Date: Tue, 25 Jul 2023 09:32:27 +0200
Message-ID: <20230725073234.55892-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
References: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, ehristev@collabora.com, wenst@chromium.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding support for aux-bus, which will add a code
path that may fail after the drm_bridge_add() call, change that to
devm_drm_bridge_add() to simplify failure paths later.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 98f63d8230e4..fc6cabf5370b 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2552,7 +2552,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
 
-	drm_bridge_add(&mtk_dp->bridge);
+	ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add bridge\n");
 
 	mtk_dp->need_debounce = true;
 	timer_setup(&mtk_dp->debounce_timer, mtk_dp_debounce_timer, 0);
@@ -2570,7 +2572,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	del_timer_sync(&mtk_dp->debounce_timer);
-	drm_bridge_remove(&mtk_dp->bridge);
 	platform_device_unregister(mtk_dp->phy_dev);
 	if (mtk_dp->audio_pdev)
 		platform_device_unregister(mtk_dp->audio_pdev);
-- 
2.41.0

