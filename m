Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A54260C1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 01:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3266E44D;
	Thu,  7 Oct 2021 23:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8113D6E44D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 23:53:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9DE60F5E;
 Thu,  7 Oct 2021 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650799;
 bh=Fn7z7KY4TFXmH1LrpPcQgB8HodPs1YPG9mG6x4O+p3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oWdNEgt2WReifKUmudLuS8qpQEKFfbH5AJNhKhq2Tw7fY+DRCExcV4MCTaCKflAES
 59gq97NsyMm2ck39vDdTxeFdRxMdQqvLP+iOhDViBDTGvqQxxtNNO3dLz8uMPhesGm
 ktCunW4eEnryQAtrPtwoS/AlnAI0t0izQGKQAlbaz6aVUubF1nh97z51W9yric5G8z
 NmOlHzu3d/Lhn+R/BcKUKCCjdmN06NkAB20rALI5glMsj1cWQnKhoj/HMPJ9mARqUG
 byvVld/zIU0DEE1AvVf6yicySvUHkABy8RfJav5bCz3yDAvzZ739dMK6CObTUKFvMA
 iygPGJBlAwgNw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 1/5] Revert "drm/mediatek: Clear pending flag when cmdq packet
 is done"
Date: Fri,  8 Oct 2021 07:53:06 +0800
Message-Id: <20211007235310.14626-2-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007235310.14626-1-chunkuang.hu@kernel.org>
References: <20211007235310.14626-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This reverts commit 9efb16c2fdd647d3888fd8dae84509f485cd554e.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 47 +++----------------------
 1 file changed, 5 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 5f81489fc60c..9840b8d035dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -267,36 +267,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 {
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
-	struct mtk_crtc_state *state;
-	unsigned int i;
-
-	state = to_mtk_crtc_state(mtk_crtc->base.state);
-
-	state->pending_config = false;
-
-	if (mtk_crtc->pending_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
-
-			plane_state = to_mtk_plane_state(plane->state);
-
-			plane_state->pending.config = false;
-		}
-		mtk_crtc->pending_planes = false;
-	}
-
-	if (mtk_crtc->pending_async_planes) {
-		for (i = 0; i < mtk_crtc->layer_nr; i++) {
-			struct drm_plane *plane = &mtk_crtc->planes[i];
-			struct mtk_plane_state *plane_state;
-
-			plane_state = to_mtk_plane_state(plane->state);
-
-			plane_state->pending.async_config = false;
-		}
-		mtk_crtc->pending_async_planes = false;
-	}
 
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
@@ -453,8 +423,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
 
-		if (!cmdq_handle)
-			state->pending_config = false;
+		state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -474,12 +443,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
-				plane_state->pending.config = false;
+			plane_state->pending.config = false;
 		}
-
-		if (!cmdq_handle)
-			mtk_crtc->pending_planes = false;
+		mtk_crtc->pending_planes = false;
 	}
 
 	if (mtk_crtc->pending_async_planes) {
@@ -499,12 +465,9 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			if (!cmdq_handle)
-				plane_state->pending.async_config = false;
+			plane_state->pending.async_config = false;
 		}
-
-		if (!cmdq_handle)
-			mtk_crtc->pending_async_planes = false;
+		mtk_crtc->pending_async_planes = false;
 	}
 }
 
-- 
2.25.1

