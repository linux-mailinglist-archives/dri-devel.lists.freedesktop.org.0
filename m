Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAB23C6BA
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6DE36E4F9;
	Wed,  5 Aug 2020 07:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 349 seconds by postgrey-1.36 at gabe;
 Tue, 04 Aug 2020 11:05:12 UTC
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de [95.129.51.220])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB76B6E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:05:12 +0000 (UTC)
Received: from mxout4.routing.net (unknown [192.168.10.112])
 by forward.mxwww.masterlogin.de (Postfix) with ESMTPS id 76F5396305;
 Tue,  4 Aug 2020 10:59:22 +0000 (UTC)
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout4.routing.net (Postfix) with ESMTP id 40254100039;
 Tue,  4 Aug 2020 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1596538762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NBlv1VYRcJ4FEzI7JudA6/Ov5jhlWSFE3HvygtTg3k=;
 b=v4BW27/rwQcnr/yFbk+K/0wVuA9dOeZQ3rySlhRBgs5r5AaZ6htUHb1S2CaatTncZijM+B
 Lu6i9pKvn1+yYL+O0IGjhxBX+7+kWxm3+i7qrwl+WgNq5/CsGogiJ6PyNlZq3YbN9KBJBK
 3uLrAHv4GGQeBVXgw0XIMROis/R/i8A=
Received: from localhost.localdomain (fttx-pool-217.61.144.119.bambit.de
 [217.61.144.119])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 9640B3603F1;
 Tue,  4 Aug 2020 10:59:21 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/5] drm: mediatek: add ddp routing for mt7623
Date: Tue,  4 Aug 2020 12:58:45 +0200
Message-Id: <20200804105849.70876-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200804105849.70876-1-linux@fw-web.de>
References: <20200804105849.70876-1-linux@fw-web.de>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frank Wunderlich <frank-w@public-files.de>

on BPi-R2/mt7623 main-path have to be routed to DPI0 (hdmi) instead of DSI0
using compatible "mt7623-mmsys" already defined in dts

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6bd369434d9d..9e418b83be48 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -74,7 +74,20 @@ static const enum mtk_ddp_comp_id mt2701_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
-static const enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
+static const enum mtk_ddp_comp_id mt7623_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_BLS,
+	DDP_COMPONENT_DPI0,
+};
+
+static const enum mtk_ddp_comp_id mt7623_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DSI0,
+};
+
+static enum mtk_ddp_comp_id mt2712_mtk_ddp_main[] = {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_AAL0,
@@ -127,6 +140,14 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.shadow_register = true,
 };
 
+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
+	.main_path = mt7623_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt7623_mtk_ddp_main),
+	.ext_path = mt7623_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt7623_mtk_ddp_ext),
+	.shadow_register = true,
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.main_path = mt2712_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2712_mtk_ddp_main),
@@ -422,6 +443,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt7623-mmsys",
+	  .data = &mt7623_mmsys_driver_data},
 	{ .compatible = "mediatek,mt2712-mmsys",
 	  .data = &mt2712_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8173-mmsys",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
