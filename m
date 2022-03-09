Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C924D2987
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA4A10E2D8;
	Wed,  9 Mar 2022 07:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9E10E3BE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 07:36:49 +0000 (UTC)
X-UUID: ec819c46e933487ebe6b07e538a45ff3-20220309
X-UUID: ec819c46e933487ebe6b07e538a45ff3-20220309
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1081879596; Wed, 09 Mar 2022 15:36:40 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 15:36:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>
Subject: [RESEND V11 2/3] drm/mediatek: implement the DSI HS packets aligned
Date: Wed, 9 Mar 2022 15:36:36 +0800
Message-ID: <20220309073637.3591-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
References: <20220309073637.3591-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
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
Cc: jitao.shi@mediatek.com, xinlei.lee@mediatek.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 xji@analogixsemi.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some DSI RX devices (for example, anx7625) require last alignment of
packets on all lanes after each row of data is sent.
Otherwise, there will be some issues of shift or scroll for screen.

Take horizontal_sync_active_byte for a example,
we roundup the HSA packet data to lane number, and the subtraction of 2
is the packet data value added by the roundup operation, making the
long packets are integer multiples of lane number.
This value (2) varies with the lane number, and that is the reason we
do this operation when the lane number is 4.

In the previous operation of function "mtk_dsi_config_vdo_timing",
the length of HSA and HFP data packets has been adjusted to an
integration multiple of lane number.
Since the number of RGB data packets cannot be guaranteed to be an
integer multiple of lane number, we modify the data packet length of
HBP so that the number of HBP + RGB is equal to the lane number.
So after sending a line of data (HSA + HBP + RGB + HFP), the data
lanes are aligned.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index bced4c7d668e..208463dbf326 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -500,6 +500,18 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
+	if ((dsi->mode_flags & MIPI_DSI_HS_PKT_END_ALIGNED) &&
+	    (dsi->lanes == 4)) {
+		horizontal_sync_active_byte =
+			roundup(horizontal_sync_active_byte, dsi->lanes) - 2;
+		horizontal_frontporch_byte =
+			roundup(horizontal_frontporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte =
+			roundup(horizontal_backporch_byte, dsi->lanes) - 2;
+		horizontal_backporch_byte -=
+			(vm->hactive * dsi_tmp_buf_bpp + 2) % dsi->lanes;
+	}
+
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
 	writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
 	writel(horizontal_frontporch_byte, dsi->regs + DSI_HFP_WC);
-- 
2.18.0

