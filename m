Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF889490D76
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 18:03:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA9910F2D3;
	Mon, 17 Jan 2022 17:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B46410F2ED
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 17:03:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD73CB8114E;
 Mon, 17 Jan 2022 17:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D07C36B06;
 Mon, 17 Jan 2022 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438999;
 bh=6V+sC1g13i8VXCbalZh08XyriymrAMskwoCmd6usGJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kk2cTqE2LoS35sZ7oifs4JYXHXJy9Quyekjfz+jGOW6xuRQp1JwlERMPeLTyxicUu
 3TV6l5qZffg99kOzevOERgseOYOnSVcJngt02ZQ238s0oZ0A4sKRJJuGxOkyV/buYW
 iRgdJ6v5cF/3DjXaPcabbeOul7WICKC90joM7hGcv5Y8EL+QCKUSndqenusr1nkf2H
 317bmD/Xx4lJU/KGjhpqvbb7jubPEdwraV/ydQqGvH341PuxLUjTWGfGcdNGizyIWQ
 DWlkzGgNfAOe6IHOHPQVnPVlXITfe9XjIrJASeiFDKPzwGiYF6Afdj2aRKuk+7iFVY
 SzE+yhm9kPdig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 42/44] phy: mediatek: Fix missing check in
 mtk_mipi_tx_probe
Date: Mon, 17 Jan 2022 12:01:25 -0500
Message-Id: <20220117170127.1471115-42-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, chunkuang.hu@kernel.org,
 Miaoqian Lin <linmq006@gmail.com>, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miaoqian Lin <linmq006@gmail.com>

[ Upstream commit 399c91c3f30531593e5ff6ca7b53f47092128669 ]

The of_device_get_match_data() function may return NULL.
Add check to prevent potential null dereference.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20211224082103.7658-1-linmq006@gmail.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28ad9403c4414..67b005d5b9e35 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -146,6 +146,8 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
+	if (!mipi_tx->driver_data)
+		return -ENODEV;
 
 	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mipi_tx->regs))
-- 
2.34.1

