Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593CA7AB84
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1E210EB46;
	Thu,  3 Apr 2025 19:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q9frtNhQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A57D10EB47
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 19:21:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A72154480C;
 Thu,  3 Apr 2025 19:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B945FC4CEE3;
 Thu,  3 Apr 2025 19:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743708067;
 bh=3QobBbHyYoMQCnDupcZPTHOSh3BH1fDIEJ5P9azUSN0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q9frtNhQ1eYLrisx6Ov+fnnbUyFaMJmAP/dNoKD2oQkzVRzKNtMjP7DxyVMGU0w46
 z7uJJvweJckGoyw2WCiaU79TAMUX3zYJV0yF3M6hZRmmLTAZ10M65VG937oTPK5Z6e
 /mbJ7rDBR4iTG8kAUHB3jhlp8syam0IzHcZI39OC974bh92dg+8o38YVsLBv7BFOjh
 FbNqw/dNVWo6HnCqn+oWXjMtszm8+MQ4W3A6NXsAwfNRaoiCZyimWlZLRIGYVaDtmI
 OWHrdV5t4UZQr1t7q2A+GGK0BP9a46R7bXae2PZ4/8625LWFT7YWO78XXsbipDmpkG
 MQi5hfrXxbtyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sasha Levin <sashal@kernel.org>, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 7/9] drm/mediatek: mtk_dpi: Explicitly manage TVD
 clock in power on/off
Date: Thu,  3 Apr 2025 15:20:48 -0400
Message-Id: <20250403192050.2682427-7-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403192050.2682427-1-sashal@kernel.org>
References: <20250403192050.2682427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.291
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

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 473c33f5ce651365468503c76f33158aaa1c7dd2 ]

In preparation for adding support for MT8195's HDMI reserved
DPI, add calls to clk_prepare_enable() / clk_disable_unprepare()
for the TVD clock: in this particular case, the aforementioned
clock is not (and cannot be) parented to neither pixel or engine
clocks hence it won't get enabled automatically by the clock
framework.

Please note that on all of the currently supported MediaTek
platforms, the TVD clock is always a parent of either pixel or
engine clocks, and this means that the common clock framework
is already enabling this clock before the children.
On such platforms, this commit will only increase the refcount
of the TVD clock without any functional change.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20250217154836.108895-10-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 7c68a39339150..191e0cec004b4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -366,6 +366,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
+	clk_disable_unprepare(dpi->tvd_clk);
 	clk_disable_unprepare(dpi->engine_clk);
 }
 
@@ -382,6 +383,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_engine;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
@@ -391,6 +398,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	return 0;
 
 err_pixel:
+	clk_disable_unprepare(dpi->tvd_clk);
+err_engine:
 	clk_disable_unprepare(dpi->engine_clk);
 err_refcount:
 	dpi->refcount--;
-- 
2.39.5

