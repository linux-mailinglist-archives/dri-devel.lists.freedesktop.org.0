Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA42B9E11
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 00:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6E96E832;
	Thu, 19 Nov 2020 23:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54A36E832
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 23:23:47 +0000 (UTC)
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71C8E2145D;
 Thu, 19 Nov 2020 23:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605828227;
 bh=cIts+rqCO629Rmhzj8eiwrJ/3uQfEGptv9+PyIIrZ4Y=;
 h=From:To:Cc:Subject:Date:From;
 b=VmGuids1Gc/XQSJeEHmARY0exFdBpK/dpyz/dPwXpjMZ5kqs5NMek8U2CYVbAsFtT
 NCSw75uC4tT0OqsC181u/jPXWvWv01OqGDavIODn9zE14epgWNiDIf0sX5u1AZBKuy
 715r+D0/Df+SNv/iftzZn8sp5biGASE/FU/H0xR0=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>, Bilal Wasim <bilalwasim676@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/mediatek: dsi: Modify horizontal front/back porch byte
 formula
Date: Fri, 20 Nov 2020 07:23:35 +0800
Message-Id: <20201119232335.6704-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

In the patch to be fixed, horizontal_backporch_byte become to large
for some panel, so roll back that patch. For small hfp or hbp panel,
using vm->hfront_porch + vm->hback_porch to calculate
horizontal_backporch_byte would make it negtive, so
use horizontal_backporch_byte itself to make it positive.

Fixes: 35bf948f1edb ("drm/mediatek: dsi: Fix scrolling of panel with small hfp or hbp")

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 61 +++++++++++-------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 4a188a942c38..65fd99c528af 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -444,7 +444,10 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	u32 horizontal_sync_active_byte;
 	u32 horizontal_backporch_byte;
 	u32 horizontal_frontporch_byte;
+	u32 horizontal_front_back_byte;
+	u32 data_phy_cycles_byte;
 	u32 dsi_tmp_buf_bpp, data_phy_cycles;
+	u32 delta;
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
 	struct videomode *vm = &dsi->vm;
@@ -466,50 +469,30 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
 	horizontal_sync_active_byte = (vm->hsync_len * dsi_tmp_buf_bpp - 10);
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
-		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp;
+		horizontal_backporch_byte = vm->hback_porch * dsi_tmp_buf_bpp - 10;
 	else
 		horizontal_backporch_byte = (vm->hback_porch + vm->hsync_len) *
-					    dsi_tmp_buf_bpp;
+					    dsi_tmp_buf_bpp - 10;
 
 	data_phy_cycles = timing->lpx + timing->da_hs_prepare +
-			  timing->da_hs_zero + timing->da_hs_exit;
-
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 18) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-
-			horizontal_backporch_byte =
-				horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 18) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+			  timing->da_hs_zero + timing->da_hs_exit + 3;
+
+	delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
+
+	horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
+	horizontal_front_back_byte = horizontal_frontporch_byte + horizontal_backporch_byte;
+	data_phy_cycles_byte = data_phy_cycles * dsi->lanes + delta;
+
+	if (horizontal_front_back_byte > data_phy_cycles_byte) {
+		horizontal_frontporch_byte -= data_phy_cycles_byte *
+					      horizontal_frontporch_byte /
+					      horizontal_front_back_byte;
+
+		horizontal_backporch_byte -= data_phy_cycles_byte *
+					     horizontal_backporch_byte /
+					     horizontal_front_back_byte;
 	} else {
-		if ((vm->hfront_porch + vm->hback_porch) * dsi_tmp_buf_bpp >
-		    data_phy_cycles * dsi->lanes + 12) {
-			horizontal_frontporch_byte =
-				vm->hfront_porch * dsi_tmp_buf_bpp -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hfront_porch /
-				(vm->hfront_porch + vm->hback_porch);
-			horizontal_backporch_byte = horizontal_backporch_byte -
-				(data_phy_cycles * dsi->lanes + 12) *
-				vm->hback_porch /
-				(vm->hfront_porch + vm->hback_porch);
-		} else {
-			DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
-			horizontal_frontporch_byte = vm->hfront_porch *
-						     dsi_tmp_buf_bpp;
-		}
+		DRM_WARN("HFP + HBP less than d-phy, FPS will under 60Hz\n");
 	}
 
 	writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
