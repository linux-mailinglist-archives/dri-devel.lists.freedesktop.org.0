Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FC7466FE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 03:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8BE10E25A;
	Tue,  4 Jul 2023 01:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4025F10E25A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 01:51:47 +0000 (UTC)
X-UUID: 518017aa1a0d11eeb20a276fd37b9834-20230704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IPhmurxIVo/R0GRBWKcyDnc4vP2+DDeDn+FJPxUQvro=; 
 b=Lo7Fp9YJzKNU2+IXARn4LoFOyys4yb1J2oHaH6pfqGYuDdJoxqGNs5jzVQ7xJNfXLAY5PM3X/U9oTTsIfqmjTJITfTS8vAd7RIdokERzO7I8I+hQUadLOcE/lQ5mEFupZB/vfRQMJEGBH+UIavVGLkX5Xr6c8GoKyeWfFaN2DHA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27, REQID:5f027663-c10e-461a-be6c-0c33f285a6fb, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:01c9525, CLOUDID:3da8d20d-c22b-45ab-8a43-3004e9216b56,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 518017aa1a0d11eeb20a276fd37b9834-20230704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <xiaoyong.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1497641359; Tue, 04 Jul 2023 09:51:39 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 4 Jul 2023 09:51:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 4 Jul 2023 09:51:37 +0800
From: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [v2] media: mediatek: vcodec: fix AV1 decode fail for 36bit iova
Date: Tue, 4 Jul 2023 09:51:35 +0800
Message-ID: <20230704015135.31850-1-xiaoyong.lu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix av1 decode fail when iova is 36bit.

Decoder hardware will access incorrect iova address when tile buffer is
36bit, it will lead to iommu fault when hardware access dram data.

Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
---
Changes from v1

- prefer '|' rather than '+'
- prefer '&' rather than shift operation
- add comments for address operations

v1:
- VDEC HW can access tile buffer and decode normally.
- Test ok by mt8195 32bit and mt8188 36bit iova.

---
 .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
index 404a1a23fd402..e9f2393f6a883 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
@@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 	u32 allow_update_cdf = 0;
 	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
 	int tile_info_base;
-	u32 tile_buf_pa;
+	u64 tile_buf_pa;
 	u32 *tile_info_buf = instance->tile.va;
-	u32 pa = (u32)bs->dma_addr;
+	u64 pa = (u64)bs->dma_addr;
 
 	if (uh->disable_cdf_update == 0)
 		allow_update_cdf = 1;
@@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
 		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
 		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
 
-		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
-		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
+		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits position
+		 * and clear original for hw requirement.
+		 */
+		tile_info_buf[tile_info_base + 1] = (tile_buf_pa & 0xFFFFFFF0ull) |
+			((tile_buf_pa & 0xF00000000ull) >> 32);
+		tile_info_buf[tile_info_base + 2] = (tile_buf_pa & 0xFull) << 3;
 
 		sb_boundary_x_m1 =
 			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 1) &
-- 
2.18.0

