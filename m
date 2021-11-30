Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EDF463D84
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 19:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2559A6E04B;
	Tue, 30 Nov 2021 18:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F956E040
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:15:59 +0000 (UTC)
X-UUID: a88ae7d61d254f11904a8e0aecbeb281-20211201
X-UUID: a88ae7d61d254f11904a8e0aecbeb281-20211201
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 708665660; Wed, 01 Dec 2021 02:15:55 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 1 Dec 2021 02:15:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 02:15:53 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
Subject: [PATCH v3 1/2] drm/mediatek: add blocking config mode for crtc
 disable flow
Date: Wed, 1 Dec 2021 02:15:51 +0800
Message-ID: <20211130181552.9928-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211130181552.9928-1-jason-jh.lin@mediatek.com>
References: <20211130181552.9928-1-jason-jh.lin@mediatek.com>
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

Change async cmd to blocking cmd for mtk_drm_crtc_atomic_disable
to make sure the lastest cmd is done before cmdq_suspend.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 62529a954b62..6ca96802fd77 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -56,6 +56,8 @@ struct mtk_drm_crtc {
 	struct cmdq_pkt			cmdq_handle;
 	u32				cmdq_event;
 	u32				cmdq_vblank_cnt;
+	bool				blocking_config;
+	struct completion		cmplt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -314,6 +316,9 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
+
+	if (mtk_crtc->blocking_config)
+		complete(&mtk_crtc->cmplt);
 }
 #endif
 
@@ -584,8 +589,16 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		 */
 		mtk_crtc->cmdq_vblank_cnt = 3;
 
+		if (mtk_crtc->blocking_config)
+			init_completion(&mtk_crtc->cmplt);
+
 		mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
+
+		if (mtk_crtc->blocking_config) {
+			wait_for_completion(&mtk_crtc->cmplt);
+			mtk_crtc->blocking_config = false;
+		}
 	}
 #endif
 	mtk_crtc->config_updating = false;
@@ -698,7 +711,9 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 		plane_state->pending.config = true;
 	}
 	mtk_crtc->pending_planes = true;
-
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_crtc->blocking_config = true;
+#endif
 	mtk_drm_crtc_update_config(mtk_crtc, false);
 	/* Wait for planes to be disabled */
 	drm_crtc_wait_one_vblank(crtc);
-- 
2.18.0

