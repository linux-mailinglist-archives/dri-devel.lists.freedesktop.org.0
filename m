Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69623C6C0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38076E512;
	Wed,  5 Aug 2020 07:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853626E48F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 16:56:14 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 5467A96153;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id 2D0FC402F8;
 Tue,  4 Aug 2020 16:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596560173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6cNEjRALO0TlHjFZLwAJkcxyJkEDRqVED41Xard7SE=;
 b=dIenpDEDIxH+p2CzkBrC4sjz/hiTVVg0J55RuLf39UDZWElo3qslZ+2d5jso+UTqcY1kT7
 e2bSl1bDh/zSWqWOTj9L6U3KLHINflAIcfwHUHWzEPLmxG4cI/11YvlPTnai14zhUH1cRb
 atYymnuIdYYE8nwGeg5NGl7H3uLjL2c=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 6B87F3601C7;
 Tue,  4 Aug 2020 16:56:12 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4 5/6] drm/mediatek: dpi/dsi: change the getting
 possible_crtc way
Date: Tue,  4 Aug 2020 18:55:54 +0200
Message-Id: <20200804165555.75159-7-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804165555.75159-1-linux@fw-web.de>
References: <20200804165555.75159-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

For current mediatek dsi encoder, its possible crtc is fixed in crtc
0, and mediatek dpi encoder's possible crtc is fixed in crtc 1. In
some SoC the possible crtc is not fixed in this case, so call
mtk_drm_find_possible_crtc_by_comp() to find out the correct possible
crtc.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 3 ++-
 drivers/gpu/drm/mediatek/mtk_dsi.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index d4f0fb7ad312..e43977015843 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -608,7 +608,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	drm_encoder_helper_add(&dpi->encoder, &mtk_dpi_encoder_helper_funcs);
 
 	/* Currently DPI0 is fixed to be driven by OVL1 */
-	dpi->encoder.possible_crtcs = BIT(1);
+	dpi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm_dev, dpi->ddp_comp);
 
 	ret = drm_bridge_attach(&dpi->encoder, dpi->bridge, NULL, 0);
 	if (ret) {
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 270bf22c98fe..c31d9c12d4a9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -892,7 +892,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
 	 * Currently display data paths are statically assigned to a crtc each.
 	 * crtc 0 is OVL0 -> COLOR0 -> AAL -> OD -> RDMA0 -> UFOE -> DSI0
 	 */
-	dsi->encoder.possible_crtcs = 1;
+	dsi->encoder.possible_crtcs =
+		mtk_drm_find_possible_crtc_by_comp(drm, dsi->ddp_comp);
 
 	/* If there's a bridge, attach to it and let it create the connector */
 	if (dsi->bridge) {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
