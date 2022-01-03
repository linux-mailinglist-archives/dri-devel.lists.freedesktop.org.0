Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C5848343A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:31:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4974689D39;
	Mon,  3 Jan 2022 15:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4DD899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:31:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B3B5E1F42536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223861;
 bh=ufpjK9obNzMvAWdLd5nIOYsHY/3E6VwId5SApV+NWmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IxrxphPRJeH6xoKd3/7H4lUO1e6wRNNj0KJ/Zlho65Hs5+j/ZlkHzo0vV+XG3mNQm
 tW5ZmzFM83RZPEDnb3H9hRssaNZ+1t2YPEI3LLEBuqtlgFokb4edV6w2+/hJR9PZPj
 gkyvg1MV0ddmx8DS5Q/HlP3BsxkkAAIos7S3Un7ghBMGhw0tFeLgXbp7t+vbz/XUDm
 TFnMXx5v04qo1DWwjFZDoYlOqRcl3ycrCNZx6kCxJdD41bGJoW6oNvRkab1o8aqugl
 d5Qe3H91vrbFrG+J636lwLZ0sgVOWTg52czd/4k0eYrAQ8+R/lBgeGPiAh32clLuZ2
 iULNNllkTd7VQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 2/4] phy: mediatek: phy-mtk-hdmi: Reorder to remove forward
 declarations
Date: Mon,  3 Jan 2022 16:30:53 +0100
Message-Id: <20220103153055.50473-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Forward declarations for mtk_hdmi_power_{on,off} aren't necessary:
move mtk_hdmi_phy_dev_ops down to remove forward declarations.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 707e90691e6e..b4193cb4e4e3 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -6,15 +6,6 @@
 
 #include "phy-mtk-hdmi.h"
 
-static int mtk_hdmi_phy_power_on(struct phy *phy);
-static int mtk_hdmi_phy_power_off(struct phy *phy);
-
-static const struct phy_ops mtk_hdmi_phy_dev_ops = {
-	.power_on = mtk_hdmi_phy_power_on,
-	.power_off = mtk_hdmi_phy_power_off,
-	.owner = THIS_MODULE,
-};
-
 inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
 {
 	return container_of(hw, struct mtk_hdmi_phy, pll_hw);
@@ -43,6 +34,12 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static const struct phy_ops mtk_hdmi_phy_dev_ops = {
+	.power_on = mtk_hdmi_phy_power_on,
+	.power_off = mtk_hdmi_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
-- 
2.33.1

