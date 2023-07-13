Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E8751C87
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B46E10E641;
	Thu, 13 Jul 2023 09:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8516E10E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:02:03 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B1BD4660704A;
 Thu, 13 Jul 2023 10:02:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689238922;
 bh=K9brwkEaYqYtzbZ32R7KLYRvi25K/zfmEJ6Y561Gn3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H0d3Uw51a2h3LOs4rCB+L8MkoGwKmi+G4Ji0RsG5Alz09VjzXHLPMl/bkTh3zvum8
 MRM5CwJqlm7HvLMAPSZz4ir13m4m5AopECU/1CgtkaWOQk+h00oX+N1W/O0/oZkeRt
 DxuNx0YgBZcH7+L9SvXZGu6Z5duVFpUJ37eyMhFVF5DE+LhET8E0CxYvIhJeOOZ6Si
 8vWuLkIfgaMikxuPFWRgjcWenW0Cu5IaKH5fg2Vy6+SNVRypmGvtxDXqjxY/4JoD6A
 aM9pwwpbGncet02opuyfkC30ezOIEyujucBmMcfi7eugniAnRiSGJu6+dP+UzlBZKh
 l+wd/XZvwocsQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 05/10] drm/mediatek: dp: Enable event interrupt only when
 bridge attached
Date: Thu, 13 Jul 2023 11:01:47 +0200
Message-Id: <20230713090152.140060-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
References: <20230713090152.140060-1-angelogioacchino.delregno@collabora.com>
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
Cc: nfraprado@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is useless and error-prone to enable the DisplayPort event interrupt
before finishing to probe and install the driver, as the DP training
cannot happen before the entire pipeline is correctly set up, as the
interrupt handler also requires the full hardware to be initialized by
mtk_dp_bridge_attach().

Anyway, depending in which state the controller is left from the
bootloader, this may cause an interrupt storm and consequently hang
the kernel during boot, so, avoid enabling the interrupt until we
reach a clean state by adding the IRQ_NOAUTOEN flag before requesting
it at probe time and manage the enablement of the ISR in the .attach()
and .detach() handlers for the DP bridge.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index b4e775e040ee..d67dbafbac8e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -100,6 +100,7 @@ struct mtk_dp_efuse_fmt {
 struct mtk_dp {
 	bool enabled;
 	bool need_debounce;
+	int irq;
 	u8 max_lanes;
 	u8 max_linkrate;
 	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
@@ -2136,6 +2137,8 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 
 	mtk_dp->drm_dev = bridge->dev;
 
+	irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+	enable_irq(mtk_dp->irq);
 	mtk_dp_hwirq_enable(mtk_dp, true);
 
 	return 0;
@@ -2152,6 +2155,7 @@ static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
 
 	mtk_dp_hwirq_enable(mtk_dp, false);
+	disable_irq(mtk_dp->irq);
 	mtk_dp->drm_dev = NULL;
 	mtk_dp_poweroff(mtk_dp);
 	drm_dp_aux_unregister(&mtk_dp->aux);
@@ -2470,7 +2474,7 @@ static int mtk_dp_probe(struct platform_device *pdev)
 {
 	struct mtk_dp *mtk_dp;
 	struct device *dev = &pdev->dev;
-	int ret, irq_num;
+	int ret;
 
 	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
 	if (!mtk_dp)
@@ -2479,9 +2483,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	mtk_dp->dev = dev;
 	mtk_dp->data = (struct mtk_dp_data *)of_device_get_match_data(dev);
 
-	irq_num = platform_get_irq(pdev, 0);
-	if (irq_num < 0)
-		return dev_err_probe(dev, irq_num,
+	mtk_dp->irq = platform_get_irq(pdev, 0);
+	if (mtk_dp->irq < 0)
+		return dev_err_probe(dev, mtk_dp->irq,
 				     "failed to request dp irq resource\n");
 
 	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
@@ -2502,7 +2506,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
 
 	spin_lock_init(&mtk_dp->irq_thread_lock);
 
-	ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
+	irq_set_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mtk_dp->irq, mtk_dp_hpd_event,
 					mtk_dp_hpd_event_thread,
 					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
 					mtk_dp);
-- 
2.40.1

