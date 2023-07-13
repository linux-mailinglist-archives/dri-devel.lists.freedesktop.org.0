Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00265751C84
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 11:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442910E63B;
	Thu, 13 Jul 2023 09:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5956D10E63B
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:02:04 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8076B660704D;
 Thu, 13 Jul 2023 10:02:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689238923;
 bh=NMuVgXQ6Qjy3BdWmPVtPkoI8nFYNk0R0kZnUi72bcUg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WkhpeUUxO+3xSnTQ35z3XbVV2rHwJNTrRQg5Ck6cmLCWKohFM2zZg+tnCkY0f63iB
 iPVSXbVdk9Z6zQgRJ3FiPv4xHXWHCai8WfW6TZeVrImlhoofDn1dreoFtXSDpvue1v
 d95gdwgcBuwEqhexoCsS/iseJHUVRRcYc9QjQlLQZrn9EhtJ3u5n+hGYd/DnfIH0ke
 TAUbClg2YkkB5tbR9Q8KxwD/iSar1W48pY8W6+zwvqYKvfSXW8l3bgf6LSv5IjCzOD
 9HBw4znE5eLjRe5ulHHA4hb4fa2LL2Sovv//1xXPxeXV4uBw1lMPzyFIFREZ8DI4kr
 MBo5J8XINbp8g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v5 06/10] drm/mediatek: dp: Avoid mutex locks if audio is not
 supported/enabled
Date: Thu, 13 Jul 2023 11:01:48 +0200
Message-Id: <20230713090152.140060-7-angelogioacchino.delregno@collabora.com>
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

If a controller (usually, eDP!) does not support audio, or audio is not
enabled because the endpoint has no audio support, it's useless to lock
a mutex only to unlock it right after because there's no .plugged_cb().

Check if the audio is supported and enabled before locking the mutex in
mtk_dp_update_plugged_status(): if not, we simply return immediately.

While at it, since the update_plugged_status_lock mutex would not be
used if the controller doesn't support audio at all, initialize it
only if `audio_supported` is true.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index d67dbafbac8e..3cb234b502a5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1943,6 +1943,9 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 
 static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
 {
+	if (!mtk_dp->data->audio_supported || !mtk_dp->audio_enable)
+		return;
+
 	mutex_lock(&mtk_dp->update_plugged_status_lock);
 	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
 		mtk_dp->plugged_cb(mtk_dp->codec_dev,
@@ -2515,11 +2518,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to request mediatek dptx irq\n");
 
-	mutex_init(&mtk_dp->update_plugged_status_lock);
-
 	platform_set_drvdata(pdev, mtk_dp);
 
 	if (mtk_dp->data->audio_supported) {
+		mutex_init(&mtk_dp->update_plugged_status_lock);
+
 		ret = mtk_dp_register_audio_driver(dev);
 		if (ret) {
 			dev_err(dev, "Failed to register audio driver: %d\n",
-- 
2.40.1

