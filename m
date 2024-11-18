Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C29D07F7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 03:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65FE10E1AE;
	Mon, 18 Nov 2024 02:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="dvlQInZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2181410E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 02:51:35 +0000 (UTC)
X-UUID: 0246ecc2a55811efbd192953cf12861f-20241118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ki8fJJIWNxnS2xxoAMPYMHgwxzquLA7ElLASLJuZBXc=; 
 b=dvlQInZcazLi3AaBZzogLFrk/8PVdzy7o7E2zplx3ib1p5drm5PIBQY1QskMnsUB3BT8JZg23NWmphjhDbN/Y/p6AMMz3M0mFL/nTzDyhcRUb8kkjGmuGo/0xQqDJN5fX/l3wjUPkOPm/jdebe6GAt+uaYtBdnKiUIrGf0zIDvc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43, REQID:9dbe8cbf-1ded-4db0-a6fc-7c8014bccfc5, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:ce19b8a, CLOUDID:7b6a344f-a2ae-4b53-acd4-c3dc8f449198,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0246ecc2a55811efbd192953cf12861f-20241118
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1273718258; Mon, 18 Nov 2024 10:51:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Nov 2024 10:51:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Nov 2024 10:51:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
 <fshao@chromium.org>
Subject: [PATCH] drm/mediatek: Add support for 180-degree rotation in the
 display driver
Date: Mon, 18 Nov 2024 10:51:26 +0800
Message-ID: <20241118025126.30808-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mediatek-drm driver reported the capability of 180-degree rotation by
adding `DRM_MODE_ROTATE_180` to the plane property, as flip-x combined
with flip-y equals a 180-degree rotation. However, we did not handle
the rotation property in the driver and lead to rotation issues.

Fixes: 74608d8feefd ("drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e0c0bb01f65a..cc825c4f2e09 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -472,6 +472,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int hdr_pitch = pending->hdr_pitch;
 	unsigned int fmt = pending->format;
 	unsigned int offset = (pending->y << 16) | pending->x;
+	unsigned int rotation = pending->rotation;
 	unsigned int src_size = (pending->height << 16) | pending->width;
 	unsigned int blend_mode = state->base.pixel_blend_mode;
 	unsigned int ignore_pixel_alpha = 0;
@@ -513,12 +514,19 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 			ignore_pixel_alpha = OVL_CONST_BLEND;
 	}
 
-	if (pending->rotation & DRM_MODE_REFLECT_Y) {
+	/*
+	 * Treat rotate 180 as flip x + flip y, and XOR the original rotation value
+	 * to flip x + flip y to support both in the same time.
+	 */
+	if (rotation & DRM_MODE_ROTATE_180)
+		rotation ^= DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
+
+	if (rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
 		addr += (pending->height - 1) * pending->pitch;
 	}
 
-	if (pending->rotation & DRM_MODE_REFLECT_X) {
+	if (rotation & DRM_MODE_REFLECT_X) {
 		con |= OVL_CON_HORZ_FLIP;
 		addr += pending->pitch - 1;
 	}
-- 
2.43.0

