Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A024BB6366
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 10:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EE110E8F8;
	Fri,  3 Oct 2025 08:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oICQE8tX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB010E384
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 08:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759478946;
 bh=6GfjdzBYXtQXVVzw5qbP/vPa3zyw2hMXgRM8SkcABNI=;
 h=From:Date:Subject:To:Cc:From;
 b=oICQE8tX3CqBblaW09lSMpOQUtAuCbJs6wfJzLVVSjgEoD5wfa3oC0Y3vuRsI/QF6
 u7LhLgWr8FZagjzt0PsH7JZTfW1DeRT/UTVddR0NQsNqAJble8hLgJe9WcvIFQUJpv
 Is0imdaLS5RurRtKUncJ18OwjumZeJovPone6Dr9Hffw5Sbs0CgwftDbRsRZBLh9Je
 QH2wfHhMtP9FljxC6F2TJTIUS4M2fP5jgwh0TCx+9EnvflmmDNQtTKJ53E88j5651g
 Jrf94DhxRhHMdp2X0Lf7mKc3JmfRSonCO7T4jIhhd++kA8ZmMCperfbVFnnTvBqTEj
 ivk8FpbpqM4dg==
Received: from beast.luon.net (simons.connected.by.freedominter.net
 [45.83.240.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sjoerd)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0043917E0B83;
 Fri,  3 Oct 2025 10:09:05 +0200 (CEST)
Received: by beast.luon.net (Postfix, from userid 1000)
 id 902001066940D; Fri, 03 Oct 2025 10:09:05 +0200 (CEST)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Fri, 03 Oct 2025 10:08:28 +0200
Subject: [PATCH] drm/mediatek: Fix refcounting in mtk_drm_get_all_drm_priv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com>
X-B4-Tracking: v=1; b=H4sIAHuE32gC/x2MWwqAIBAArxL73YLau6tEH5FrLZGFWgTS3ZM+h
 2EmgifH5KHPIji62fNhE8g8g3md7ELIOjEooSophMI9bKjdjo7MfFw2IAnTyFZ3RV1OkLIzGX7
 +5TC+7wfuibDKYgAAAA==
X-Change-ID: 20251002-mtk-drm-refcount-e0f718d9364a
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Johan Hovold <johan@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, stable@vger.kernel.org, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.2
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

dev_get_drvdata simply returns the driver data part of drm_dev, which
has its lifetime bound to the drm_dev. So only drop the reference in the
error paths, on success they will get dropped later.

Cc: stable@vger.kernel.org
Fixes: 9ba2556cef1df ("drm/mediatek: clean up driver data initialisation")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 7841f59c52ee772dba3de416f410604f5f13eef2..c85fbecce9d6f0ade700e047e067ee7f9250f037 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -373,7 +373,7 @@ static int mtk_drm_match(struct device *dev, const void *data)
 static bool mtk_drm_get_all_drm_priv(struct device *dev)
 {
 	struct mtk_drm_private *drm_priv = dev_get_drvdata(dev);
-	struct mtk_drm_private *all_drm_priv[MAX_CRTC];
+	struct mtk_drm_private *all_drm_priv[MAX_CRTC] = { NULL, };
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
@@ -399,16 +399,22 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
-		put_device(drm_dev);
-		if (!temp_drm_priv)
+		if (!temp_drm_priv) {
+			put_device(drm_dev);
 			continue;
+		}
 
-		if (temp_drm_priv->data->main_len)
+		if (temp_drm_priv->data->main_len) {
 			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
-		else if (temp_drm_priv->data->ext_len)
+		} else if (temp_drm_priv->data->ext_len) {
 			all_drm_priv[CRTC_EXT] = temp_drm_priv;
-		else if (temp_drm_priv->data->third_len)
+		} else if (temp_drm_priv->data->third_len) {
 			all_drm_priv[CRTC_THIRD] = temp_drm_priv;
+		} else {
+			dev_warn(drm_dev, "Could not determine crtc type");
+			put_device(drm_dev);
+			continue;
+		}
 
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
@@ -427,6 +433,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		return true;
 	}
 
+	for (i = 0; i < MAX_CRTC; i++)
+		if (all_drm_priv[i])
+			put_device(all_drm_priv[i]->dev);
+
 	return false;
 }
 

---
base-commit: 22b5e8cde1db67c64b83fc0e4e1ab166cacff246
change-id: 20251002-mtk-drm-refcount-e0f718d9364a

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>

