Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075E676E666
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 13:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD7D10E5EA;
	Thu,  3 Aug 2023 11:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA0510E5EA
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 11:10:25 +0000 (UTC)
X-UUID: 56366f4e31ee11ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=y1/bPs/BxFNXGqv9H1rzERGNtX0OyJ3swYdBbl4atw8=; 
 b=PiwlT4zTQLrBxUTvpO2LqKe3RXbRHrZI5s7jRxkt1Li47C31rASohhHiZ09f8cmFkVQR6Fuq6nimT9R6CgSYGWBLH/m0wH1pkYHLlny1CqPH4dheqMiuw2NwuQiG+oK6Imx+fRN7KtdcrReOXdWjGr5ImyVE2K6V60t1zO9B47k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30, REQID:3ca707d5-4d6d-44b1-9403-71d81f6d01a6, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:1fcc6f8, CLOUDID:99a6d9a0-0933-4333-8d4f-6c3c53ebd55b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
 NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 56366f4e31ee11ee9cb5633481061a41-20230803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <xiaoyong.lu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1716315439; Thu, 03 Aug 2023 19:10:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 19:10:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 19:10:18 +0800
From: Xiaoyong Lu <xiaoyong.lu@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [v3] media: mediatek: vcodec: fix AV1 decoding on MT8188
Date: Thu, 3 Aug 2023 19:10:17 +0800
Message-ID: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
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

Fix AV1 decoding failure when the iova is 36bit.

Before this fix, the decoder was accessing incorrect addresses with 36bit
iova tile buffer, leading to iommu faults.

Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
---
Changes from v2:

- refine commit subject and message

Changes from v1:

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

