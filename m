Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889AA4D2986
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 08:36:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314E010E26F;
	Wed,  9 Mar 2022 07:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4F510E26F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 07:36:48 +0000 (UTC)
X-UUID: 77d63c74002a4f5bae4c2efea78b58b8-20220309
X-UUID: 77d63c74002a4f5bae4c2efea78b58b8-20220309
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 926130428; Wed, 09 Mar 2022 15:36:41 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 15:36:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 15:36:39 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>,
 <matthias.bgg@gmail.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <narmstrong@baylibre.com>
Subject: [RESEND V11 3/3] drm/bridge: anx7625: config hs packets end aligned
 to avoid screen shift
Date: Wed, 9 Mar 2022 15:36:37 +0800
Message-ID: <20220309073637.3591-4-rex-bc.chen@mediatek.com>
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

This device requires the packets on lanes aligned at the end to fix
screen shift or scroll.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 2346dbcc505f..fe32ab0878ae 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1673,7 +1673,8 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
-		MIPI_DSI_MODE_VIDEO_HSE;
+		MIPI_DSI_MODE_VIDEO_HSE	|
+		MIPI_DSI_HS_PKT_END_ALIGNED;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret) {
-- 
2.18.0

