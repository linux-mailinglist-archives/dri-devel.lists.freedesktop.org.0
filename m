Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431459436E9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 22:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14F10E6C5;
	Wed, 31 Jul 2024 20:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MZfbnbOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56C410E6C5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 20:14:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 12F8DCE17FC;
 Wed, 31 Jul 2024 20:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D64AC116B1;
 Wed, 31 Jul 2024 20:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722456874;
 bh=k+eFhFAkd2vbO659Tkl+hTXfqcSphbMfOWrLbcB5eNc=;
 h=From:To:Cc:Subject:Date:From;
 b=MZfbnbOLcSYQGS24wxSinYk6YtSp0qohSW2c5/24M5tddywbO9PAtzykrouOjTy4L
 KPQlvQIXqEPfjLgFJs4f9pai9XBTo6qJhoWhGyt10ACc+ne+hLMHNLqITK9AjXEHFK
 mXGDl+9zpsVytZg72GXAWXAvGzsYMTWrmDXb7d672b367bk4tOk6Fs+z2or9J0HQ1h
 x5caTkdc2jxd0NhTEFqU5AHLvY2zTnc6t/bDjiEQrO1TdNF4MDHiSX9eKfpc6aNy0m
 0dvdWV/uukIpgYG9KtWz/ac58lruxw2JsryNEcP/4hfjCbysG5lM+dLAdziuvKWG0S
 f8ixPWOmooAwA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: mediatek: Drop unnecessary check for property presence
Date: Wed, 31 Jul 2024 14:13:56 -0600
Message-ID: <20240731201407.1838385-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
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

of_property_read_u32() returns -EINVAL if a property is not present, so
the preceeding check for presence with of_find_property() can be
dropped. Really, what the errno is shouldn't matter. Either the property
can be read and used or it can't and is ignored.

This is part of a larger effort to remove callers of of_find_property()
and similar functions. of_find_property() leaks the DT struct property
and data pointers which is a problem for dynamically allocated nodes
which may be freed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 634bbba5d43f..07243f372260 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -341,14 +341,11 @@ static int mtk_disp_rdma_probe(struct platform_device *pdev)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
 #endif
 
-	if (of_find_property(dev->of_node, "mediatek,rdma-fifo-size", &ret)) {
-		ret = of_property_read_u32(dev->of_node,
-					   "mediatek,rdma-fifo-size",
-					   &priv->fifo_size);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to get rdma fifo size\n");
-	}
+	ret = of_property_read_u32(dev->of_node,
+				   "mediatek,rdma-fifo-size",
+				   &priv->fifo_size);
+	if (ret && (ret != -EINVAL))
+		return dev_err_probe(dev, ret, "Failed to get rdma fifo size\n");
 
 	/* Disable and clear pending interrupts */
 	writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
-- 
2.43.0

