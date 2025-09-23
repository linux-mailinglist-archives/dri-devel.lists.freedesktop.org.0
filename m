Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA74B96913
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 17:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D7A10E636;
	Tue, 23 Sep 2025 15:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EUTeYdA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B3E10E210
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 15:26:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5375439CF;
 Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D40C113D0;
 Tue, 23 Sep 2025 15:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758641172;
 bh=600+gl2y/5DXDE8JzKJY5V6QLYLeY4g2SnvrcP9hV44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUTeYdA5pQktnE96dmZRLl7V/ujUZJQApclxLmczzcUy0dOOVY1AQUPIhKrP4a4W6
 E0wDpFyjZjf0N4zCEjTTJF8oeH8vvlgfGpoet8ohApUcbg/YKUI/CtcHNaOZhkPxxr
 65AYe+vUh/tfzo2kgh2b0YwzqXLrLtDyAQrVTm+xjio27qXRcuy82p0eyrfsBX0Cgq
 hAy4L6BlL9j+3vvOszbzOIvnWNqsZ4Cbn+xMa9nglrtaIV/b8XYtDpnhC2kPjwolQs
 MNeC5vhqdPPNX2sIbHnAVjzYottYaeeuF24Yu4Jx6m6PlDhg53GljSEBIbzz/Dpzzb
 4Q+0d0WHkoJJg==
Received: from johan by xi.lan with local (Exim 4.98.2)
 (envelope-from <johan@kernel.org>) id 1v14u6-000000004mq-46Hf;
 Tue, 23 Sep 2025 17:26:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 stable@vger.kernel.org, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 2/5] drm/mediatek: fix probe memory leak
Date: Tue, 23 Sep 2025 17:23:37 +0200
Message-ID: <20250923152340.18234-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250923152340.18234-1-johan@kernel.org>
References: <20250923152340.18234-1-johan@kernel.org>
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

The Mediatek DRM driver allocates private data for components without a
platform driver but as the lifetime is tied to each component device,
the memory is never freed.

Tie the allocation lifetime to the DRM platform device so that the
memory is released on probe failure (e.g. probe deferral) and when the
driver is unbound.

Fixes: c0d36de868a6 ("drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data")
Cc: stable@vger.kernel.org	# 5.12
Cc: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index 0264017806ad..31d67a131c50 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -671,7 +671,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node, struct mtk_d
 	    type == MTK_DSI)
 		return 0;
 
-	priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.49.1

