Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C7760BD5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 09:33:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC54110E3B4;
	Tue, 25 Jul 2023 07:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F0910E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 07:32:53 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 27AD3660710A;
 Tue, 25 Jul 2023 08:32:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690270372;
 bh=Vg0YvjBSlDmlFYU7tKBjTOro4lXlpZBRQaqsrOefZqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=coyHXIVWXIh/K9CpyuVpTlwkv8VJUao/RH/sELQqdBv76wvrulSNb6p0s6nZuM+gd
 VGIHPVCSVLERIZUsKwi7nqIRmCF7J3tL9uVOKnAkxJINB6tSHL1y2+bO9j2UicvZKd
 6VgKHTHy+SHXgLbdXJTxV1jtsTWt+rXzwk+VeXrFEsZcKMa0rwP4JqsAQqV7JaR5vg
 TvWpHq+COQThSnEN7i2H1f5UL4XacBLZes5HMC81oXngPbk/4OnhESLXMVCETAAdj1
 M/UOeYLbGJfpHcpsknLt+L/NG19PK6z3eQszu4VC3Rsug1BLc+wx64P/lsGsC627JD
 yXf3z1XKWCtWg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v7 07/11] drm/mediatek: dp: Avoid mutex locks if audio is not
 supported/enabled
Date: Tue, 25 Jul 2023 09:32:30 +0200
Message-ID: <20230725073234.55892-8-angelogioacchino.delregno@collabora.com>
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

If a controller (usually, eDP!) does not support audio, or audio is not
enabled because the endpoint has no audio support, it's useless to lock
a mutex only to unlock it right after because there's no .plugged_cb().

Check if the audio is supported and enabled before locking the mutex in
mtk_dp_update_plugged_status(): if not, we simply return immediately.

While at it, since the update_plugged_status_lock mutex would not be
used if the controller doesn't support audio at all, initialize it
only if `audio_supported` is true.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 83e55f8dc84a..c1d1a882f1db 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1948,6 +1948,9 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 
 static void mtk_dp_update_plugged_status(struct mtk_dp *mtk_dp)
 {
+	if (!mtk_dp->data->audio_supported || !mtk_dp->audio_enable)
+		return;
+
 	mutex_lock(&mtk_dp->update_plugged_status_lock);
 	if (mtk_dp->plugged_cb && mtk_dp->codec_dev)
 		mtk_dp->plugged_cb(mtk_dp->codec_dev,
@@ -2520,11 +2523,11 @@ static int mtk_dp_probe(struct platform_device *pdev)
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
2.41.0

