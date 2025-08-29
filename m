Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B4B3B6AC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 11:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814D810E127;
	Fri, 29 Aug 2025 09:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bF7FcMOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6CE10E076
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 09:05:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B977B43735;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9460DC4CEF4;
 Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756458333;
 bh=ivKqM50M4iw0RSehXQduIKjOJqOijpdsoVz0fl/OOBI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bF7FcMOzYYva//9gz2v556cx+Y++Ep1b+HAJ3LmAnQnhupdAwtkKiCvzYKg5h8zi/
 nK2N74IQ8/Zoa3mo6w5uv1/cWVL3ZvZ+AgLmrek0If3qdKoo1NLwjdZondqkJ+8hlv
 UFs4GmorG4DL/ZaXJqG1DBw7zi6XqjiRhOuYb7cjB9C236SAPo8AJRzzBH+YWmYYfL
 H3m3Gs7UogVIo+FGAx/sr4+4whBDug5BVQvTam8xtuiCg3CRXS+Rtg8ecRqvltaldJ
 HoUNmwpQta+TupsaN8Bm6jRuJkOhbRTxswIkcZhHjlMrWGkpf7Pg/ZFnY3i9hEJovB
 itacSAnYKBdbg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1urv2x-000000005WF-0cxW;
 Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] drm/mediatek: fix potential OF node use-after-free
Date: Fri, 29 Aug 2025 11:03:44 +0200
Message-ID: <20250829090345.21075-2-johan@kernel.org>
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

The for_each_child_of_node() helper drops the reference it takes to each
node as it iterates over children and an explicit of_node_put() is only
needed when exiting the loop early.

Drop the recently introduced bogus additional reference count decrement
at each iteration that could potentially lead to a use-after-free.

Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: stable@vger.kernel.org
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 34131ae2c207..3b02ed0a16da 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -388,11 +388,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
 		if (!of_id)
-			goto next_put_node;
+			continue;
 
 		pdev = of_find_device_by_node(node);
 		if (!pdev)
-			goto next_put_node;
+			continue;
 
 		drm_dev = device_find_child(&pdev->dev, NULL, mtk_drm_match);
 		if (!drm_dev)
@@ -418,11 +418,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 next_put_device_pdev_dev:
 		put_device(&pdev->dev);
 
-next_put_node:
-		of_node_put(node);
-
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {
-- 
2.49.1

