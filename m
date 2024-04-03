Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24E896565
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 09:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D48112581;
	Wed,  3 Apr 2024 07:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Gvrh3iWa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259FF11258D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 07:07:40 +0000 (UTC)
X-UUID: d9cc8424f18811ee935d6952f98a51a9-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pT+mAS1Yst5bND9qW5seLF2kjpLuzM8HwxDsfPgehOI=; 
 b=Gvrh3iWaPUeoUFiObBUmivw+l9uqxdo7DZyidid1Ab9uLrMrgmfV62JgKHVzzz9PE+iDfSHRWC7JXNi1JUF4oj+zn/Y6hOImtDmOR9Gdd51qr5hp51dnG1iaZsSKtkPgWgNcGn0jy7osr4mUybyCVKHZ/859nk8FKjGgRsR/DKw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:e0545fd3-0966-495c-8611-a856000b5d3c, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:5e10a800-c26b-4159-a099-3b9d0558e447,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d9cc8424f18811ee935d6952f98a51a9-20240403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1980470507; Wed, 03 Apr 2024 15:07:36 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 15:07:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 15:07:34 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
 Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v4 9/9] drm/mediatek: Add cmdq_insert_backup_cookie before
 secure pkt finalize
Date: Wed, 3 Apr 2024 15:07:32 +0800
Message-ID: <20240403070732.22085-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403070732.22085-1-shawn.sung@mediatek.com>
References: <20240403070732.22085-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.712500-8.000000
X-TMASE-MatchedRID: YXgS1C6OPWzob/hVdrvnXjPDkSOzeDWW+eBf9ovw8I27eXIF2U7rKy+8
 OxujShyxE/UmhJjBrzZC3mgca9yt8kttpN+KVVd9syNb+yeIRArvJY9pBzgg1AdskglgNB06Wrv
 rtnfQ0ritv1Ljw57Roa8VyW/hymUcP+blzYfeoH5DiyuN5FvFNkJfxXUWJFGS31GU/N5W5BBGrI
 LfHhGdpOCvXbSo8NyzsBVstGxQO24YBLhRVmu+NuG5dRZCgxC3NACnndLvXwdnuv8pVwMzSaPFj
 JEFr+olwXCBO/GKkVqOhzOa6g8KrZ6dUK0lcRRnJjV8ViTOjGoY/N7Roz/q3K0gT4tKfSqMWMHU
 JHy0CyZDDKa3G4nrLQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.712500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CBDB9CEA1B0D281A6C149F54596BA3FCB12C109C78A272B3F183B48BF64A7A792000:8
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

Add cmdq_insert_backup_cookie to append some commands before EOC:
1. Get GCE HW thread execute count from the GCE HW register.
2. Add 1 to the execute count and then store into a shared memory.
3. Set a software event siganl as secure irq to GCE HW.

Since the value of execute count + 1 is stored in a shared memory,
CMDQ driver in the normal world can use it to handle task done in irq
handler and CMDQ driver in the secure world will use it to schedule
the task slot for each secure thread.

The reason why we use shared memory to record execute count here is:
1. normal world can not access the register of secure GCE thread in
normal world.
2. calling TEE invoke cmd in the irq handler would be expensive and not
stable. I've tested that a single TEE invloke cmd to CMDQ PTA costs
19~53 us. Maybe it would cost more during the scenario that needs more
CPU loading.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index a6ba9965500f0..2fb52928a3055 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -186,7 +186,7 @@ void mtk_crtc_disable_secure_state(struct drm_crtc *crtc)
 		sec_scn = CMDQ_SEC_SCNR_SUB_DISP_DISABLE;
 
 	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_engine, sec_engine, sec_scn);
-
+	cmdq_sec_insert_backup_cookie(&mtk_crtc->sec_cmdq_handle);
 	cmdq_pkt_finalize(&mtk_crtc->sec_cmdq_handle);
 	dma_sync_single_for_device(mtk_crtc->sec_cmdq_client.chan->mbox->dev,
 				   mtk_crtc->sec_cmdq_handle.pa_base,
@@ -810,6 +810,8 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
+		if (cmdq_handle->sec_data)
+			cmdq_sec_insert_backup_cookie(cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
 		dma_sync_single_for_device(cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
-- 
2.18.0

