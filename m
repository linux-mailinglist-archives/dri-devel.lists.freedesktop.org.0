Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4B7F6078
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 14:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0615410E74E;
	Thu, 23 Nov 2023 13:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2DF10E74B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 13:38:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF9D462121;
 Thu, 23 Nov 2023 13:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F67C433C9;
 Thu, 23 Nov 2023 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700746700;
 bh=yp3tKEvY3IVCFEhD0Bxg/Hw6hTrEBgQxqiXCTK5PONg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iI/CzRx+LbYWI9WFQv0WzBDR0lAxkkzVvtOC7DAQgaylWVB0Kb9xobuPy+A/9V4ys
 6EslE2vM1ydHw9XSW/FFipkTg5V7FHnrQ8hXY0FQmsfiw/DCnn+sxbq4jQDfh3NGQZ
 FfZIzYVSg6nfy8/MYy4wpZT/XpLDcGftkMMaI7NtZDw7O6uqShHYJi8m+B1H7QbZ/g
 4EN6pgFy2ZjJ50Hb89pELrKVU9RH+xLr7c4AyeilrWYswiHLSHySDwRMk/b6RTClXO
 GF5KDC6eMbJ29r+vPueyY2a0DTT8oR3aKBDczeLj7/BRLSQCqj5w8upiJRaVbsIxN6
 4M9pqlxxp0tLA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH 4/4] drm/mediatek: support the DSI0 output on the MT8195
 VDOSYS0
Date: Thu, 23 Nov 2023 14:37:49 +0100
Message-Id: <20231123133749.2030661-5-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231123133749.2030661-1-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the latest dynamic selection of the output component, we can now
support different outputs. Move current output component into the
dynamic routes array and add the new DSI0 output.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2b0c35cacbc6..6fa88976376e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -222,7 +222,11 @@ static const unsigned int mt8195_mtk_ddp_main[] = {
 	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DSC0,
 	DDP_COMPONENT_MERGE0,
-	DDP_COMPONENT_DP_INTF0,
+};
+
+static const struct mtk_drm_route mt8195_mtk_ddp_main_routes[] = {
+	{ 0, DDP_COMPONENT_DP_INTF0 },
+	{ 0, DDP_COMPONENT_DSI0 },
 };
 
 static const unsigned int mt8195_mtk_ddp_ext[] = {
@@ -308,6 +312,8 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
 	.main_path = mt8195_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
+	.conn_routes = mt8195_mtk_ddp_main_routes,
+	.num_conn_routes = ARRAY_SIZE(mt8195_mtk_ddp_main_routes),
 	.mmsys_dev_num = 2,
 };
 
-- 
2.39.2

