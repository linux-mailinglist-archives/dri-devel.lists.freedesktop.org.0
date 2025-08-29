Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103FAB3B6AA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ED110E011;
	Fri, 29 Aug 2025 09:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G22pMn2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA0610E011
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B96B54172F;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997B4C4CEF5;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756458333;
 bh=vYVabSltptJRE83ss4FzMAYlVF/0xeNcsPWfCCvyH88=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G22pMn2mPsU48neBJG5HJBNrKPDONRCT4j7/5Q1t9M8uJZGA7cmxMmok1u7yUgUoe
 0t3AjiJpU0w4aHv8CHKUtCdp9BB5mwINnmG1kmuR5OmiNg/lOifbESKFe0ytn8VX1p
 IZoX64m1TA/7Bp+fipeSq1WsPRbp9r/TUbziLrJDuS+YUWRxit9k2F07//4mLcGby9
 Sd1fbIDU3ggDWf8/Yn6Z3JZ8Z50WKsmiSTXkSV9vhcp+6wi0JX93raVTzRqL8iYGX9
 SOK0actdeTa34s9N28zD0ZqhOju8Q1phurizAqXkgU1Iem2rjm5dTflJmZv56OIg4v
 hZi3+djVxatrw==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urv2x-000000005WH-0zjm;
 Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] drm/mediatek: clean up driver data initialisation
Date: Fri, 29 Aug 2025 11:03:45 +0200
Message-ID: <20250829090345.21075-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250829090345.21075-1-johan@kernel.org>
References: <20250829090345.21075-1-johan@kernel.org>
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

The platform and drm devices are only used to look up the drm device and
its driver data respectively when initialising the driver data during
bind().

Drop the reference counts as soon as they have been used to make the
code more readable.

Note that the crtc count is never incremented on lookup failures.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 3b02ed0a16da..33b83576af7e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -395,12 +395,14 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
+		put_device(&pdev->dev);
 		if (!drm_dev)
-			goto next_put_device_pdev_dev;
+			continue;
 
 		temp_drm_priv = dev_get_drvdata(drm_dev);
+		put_device(drm_dev);
 		if (!temp_drm_priv)
-			goto next_put_device_drm_dev;
+			continue;
 
 		if (temp_drm_priv->data->main_len)
 			all_drm_priv[CRTC_MAIN] = temp_drm_priv;
@@ -412,12 +414,6 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-next_put_device_drm_dev:
-		put_device(drm_dev);
-
-next_put_device_pdev_dev:
-		put_device(&pdev->dev);
-
 		if (cnt == MAX_CRTC) {
 			of_node_put(node);
 			break;
-- 
2.49.1

