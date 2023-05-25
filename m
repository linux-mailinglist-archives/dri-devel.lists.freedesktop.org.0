Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ED8710B7F
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 13:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369DC10E6AE;
	Thu, 25 May 2023 11:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D192510E0A3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 May 2023 11:53:05 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1BDFB6605840;
 Thu, 25 May 2023 12:53:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685015583;
 bh=vq6ZQxb4poCfUCjWGmL6dXu84EQJb4PKabd/UNw0s4g=;
 h=From:To:Cc:Subject:Date:From;
 b=IzIYSl921YO0AOJdl8z6BMZLsgvTWMJrKKVbJfiHaPSiTEYM2zb04jVfCsrUWDx/K
 3xs2TyOgF1WKRQtktDGxjmKwSUqkuzEHLYX8d0I0WQmnxjOznHhd2e0S/qHPMcTZIJ
 b15yh5DW9/LHhH0hJQb3UP+x1Qeh7bO5rvtmHqBN7PXR3MbhOAnGy3pjbIqtBMbtRN
 iIFu0RnzneEshocDt1mcnIT3aL1QG65+nD7xBcfiRHuXU5nVzA5Q8/ItPAg6ZW78AN
 mOlkRuTjO8R3eQb8LbwP2asde/LTHy7bhcHi60xOFb41mDsRqvQMbXB5iFTGM79ku0
 7FSzcgC1/I0vg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 0/3] MediaTek MIPI-DSI PHY: Cleanups
Date: Thu, 25 May 2023 13:52:55 +0200
Message-Id: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
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
Cc: kishon@kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthias.bgg@gmail.com, vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series performs some cleanups to the MediaTek mipi-dsi PHY, used in
various MediaTek SoCs; in particular, it's migrating this driver to
register its clock as clk_hw provider instead and makes use of the devm
function for the same, allowing to remove a pointer to struct clk and
the whole .remove_new() callback, as it's not needed anymore.
This also cleans up the of_device_id table.

Tested on MT8173, MT8192 Chromebooks, MT6795 Xperia M5 smartphone.

AngeloGioacchino Del Regno (3):
  phy: mediatek: mipi-dsi: Convert to register clk_hw
  phy: mediatek: mipi-dsi: Use devm variant for of_clk_add_hw_provider()
  phy: mediatek: mipi-dsi: Compress of_device_id match entries

 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 30 +++++++++----------------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h |  1 -
 2 files changed, 10 insertions(+), 21 deletions(-)

-- 
2.40.1

