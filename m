Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD5BE6C92
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 08:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EDE10EB2B;
	Fri, 17 Oct 2025 06:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Gt1xmSYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71A110E155
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 06:50:42 +0000 (UTC)
X-UUID: 950fdf7cab2511f0b33aeb1e7f16c2b6-20251017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tBuzgVZFLhPv03j5fr8PoMY4MT5m212Vao5/661rt5E=; 
 b=Gt1xmSYV3AjkbJHI6FCah0EAr7R3pw9EcBYfuEeMbLFGkAqeIvKgVnnyzerozJyhl6cuSUIHZ1Jc4GjcFwWJ191Q2nHDAP/wYv7sKIP1SlKW8QFA/T9wZo/flrAvT0yiAMvrB/eSLYNvgUz8axuqX19bIzO5AvtX4UM7Q6vRBVM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:02c04e86-4ec9-4bf1-8573-fe69a8bcb7c9, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:a9d874c, CLOUDID:1d3b2951-c509-4cf3-8dc0-fcdaad49a6d3,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
 0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 950fdf7cab2511f0b33aeb1e7f16c2b6-20251017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1034616463; Fri, 17 Oct 2025 14:50:35 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 17 Oct 2025 14:50:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Fri, 17 Oct 2025 14:50:32 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
 <nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
 Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>
Subject: [PATCH v8 17/20] media: platform: mtk-mdp3: Use cmdq_pkt_jump_rel()
 without shift_pa
Date: Fri, 17 Oct 2025 14:44:42 +0800
Message-ID: <20251017065028.1676930-18-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the removal of the shift_pa parameter, cmdq_pkt_jump_rel_temp()
can be replaced by the new cmdq_pkt_jump_rel() without shift_pa.

Then, remove the cmdq_shift_pa variable in the mdp_dev structure for
each mbox client.

Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 --
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index 5fc9263ccb78..7da5424d7e62 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -628,7 +628,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
 		goto err_free_path;
 	}
 	cmdq_pkt_eoc(&cmd->pkt);
-	cmdq_pkt_jump_rel_temp(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]);
+	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE);
 
 	for (i = 0; i < num_comp; i++) {
 		s32 inner_id = MDP_COMP_NONE;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 6559d72d5d42..4ac90f789062 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -293,8 +293,6 @@ static int mdp_probe(struct platform_device *pdev)
 			ret = PTR_ERR(mdp->cmdq_clt[i]);
 			goto err_mbox_destroy;
 		}
-
-		mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
 	}
 
 	init_waitqueue_head(&mdp->callback_wq);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 05cade1d098e..430251f63754 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -126,7 +126,6 @@ struct mdp_dev {
 	u32					id_count;
 	struct ida				mdp_ida;
 	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
-	u8					cmdq_shift_pa[MDP_PP_MAX];
 	wait_queue_head_t			callback_wq;
 
 	struct v4l2_device			v4l2_dev;
-- 
2.43.0

