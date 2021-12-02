Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74E465E58
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 07:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AB66E9D6;
	Thu,  2 Dec 2021 06:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFCB6E9DB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 06:41:04 +0000 (UTC)
X-UUID: e6e0e722758747969fdf3efe23d9e087-20211202
X-UUID: e6e0e722758747969fdf3efe23d9e087-20211202
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1050843709; Thu, 02 Dec 2021 14:41:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Dec 2021 14:40:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 14:40:58 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
Subject: [PATCH v4 1/2] drm/mediatek: add wait_for_event for crtc disable by
 cmdq
Date: Thu, 2 Dec 2021 14:40:38 +0800
Message-ID: <20211202064039.20797-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
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
Cc: fshao@chromium.org, David Airlie <airlied@linux.ie>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mtk_drm_crtc_atomic_disable will send an async cmd to cmdq driver,
so it may not finish when cmdq_suspend is called sometimes.

Add wait_for_event after sending async disable plane cmd to make
sure the lastest cmd is done before cmdq_suspend.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 62529a954b62..0b4012335e7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -56,6 +56,7 @@ struct mtk_drm_crtc {
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
+	wait_queue_head_t		cb_blocking_queue;
 #endif
 
 	struct device			*mmsys_dev;
@@ -314,6 +315,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
+	wake_up(&mtk_crtc->cb_blocking_queue);
 }
 #endif
 
@@ -700,6 +702,13 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	mtk_crtc->pending_planes = true;
 
 	mtk_drm_crtc_update_config(mtk_crtc, false);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	/* Wait for planes to be disabled by cmdq */
+	if (mtk_crtc->cmdq_client.chan)
+		wait_event_timeout(mtk_crtc->cb_blocking_queue,
+				   mtk_crtc->cmdq_vblank_cnt == 0,
+				   msecs_to_jiffies(500));
+#endif
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
 
@@ -980,6 +989,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				mtk_crtc->cmdq_client.chan = NULL;
 			}
 		}
+
+		/* for sending blocking cmd in crtc disable */
+		init_waitqueue_head(&mtk_crtc->cb_blocking_queue);
 	}
 #endif
 	return 0;
-- 
2.18.0

