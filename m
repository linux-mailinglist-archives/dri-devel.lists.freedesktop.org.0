Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3E4260C3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 01:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C54B6E513;
	Thu,  7 Oct 2021 23:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39666E513
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 23:53:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B33261029;
 Thu,  7 Oct 2021 23:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633650802;
 bh=hkB4BEfXrWvXzGMtu+X+7bqUSgo9sLVy1s0KrXgVH2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eX5Sgmoot9rVguCk4g/W1O5qMtTOuj831qunmbRk5J06aH9ctP1lgeojU0WNt7aU+
 vKGuRxbDd7v5zHjQGwM2Sv+10MePrhlauARhQiHfQ2sQHIwJghKJrC1jFqhYTCIcfi
 wScYKfgZOmk/oxvZODwRWDo4UoDEyl7FzZ1mlcEx4uZOBiKKhy1vXvpqrL8kG7DN8e
 93pzeUuoQQYNE/klrMtoKzSRYaLWhdmygL+VHH+Xh375pS8fy/eawadQ5YEUAhcVZA
 Ka97RHYARPoMF3GHQZHhK6a2eGq+FMfgtVNPaNPe49EHWRNhumstgrKGdVCk3zJK+S
 vR2MGOWEljqrw==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Enric Balletbo Serra <eballetbo@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 3/5] Revert "drm/mediatek: Detect CMDQ execution timeout"
Date: Fri,  8 Oct 2021 07:53:08 +0800
Message-Id: <20211007235310.14626-4-chunkuang.hu@kernel.org>
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

This reverts commit 8cdcb365342402fdeb664479b0a04e9debef8efb.

Commit c1ec54b7b5af
("drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb")
would cause numerous mtk cmdq mailbox driver warning:

WARNING: CPU: 0 PID: 0 at drivers/mailbox/mtk-cmdq-mailbox.c:198
cmdq_task_exec_done+0xb8/0xe0

So revert that patch and all the patches depend on that patch.

Reported-by: Enric Balletbo Serra <eballetbo@gmail.com>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 697c4dec1890..0cd5b9ed8956 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -55,7 +55,6 @@ struct mtk_drm_crtc {
 	struct mbox_client		cmdq_cl;
 	struct mbox_chan		*cmdq_chan;
 	u32				cmdq_event;
-	u32				cmdq_vblank_cnt;
 #endif
 
 	struct device			*mmsys_dev;
@@ -270,7 +269,6 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_drm_crtc *mtk_crtc = container_of(cl, struct mtk_drm_crtc, cmdq_cl);
 	struct cmdq_cb_data *data = mssg;
 
-	mtk_crtc->cmdq_vblank_cnt = 0;
 	mtk_drm_cmdq_pkt_destroy(mtk_crtc->cmdq_chan, data->pkt);
 }
 #endif
@@ -526,11 +524,6 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 					    cmdq_handle->pa_base,
 					    cmdq_handle->cmd_buf_size,
 					    DMA_TO_DEVICE);
-		/*
-		 * CMDQ command should execute in next vblank,
-		 * If it fail to execute in next 2 vblank, timeout happen.
-		 */
-		mtk_crtc->cmdq_vblank_cnt = 2;
 		mbox_send_message(mtk_crtc->cmdq_chan, cmdq_handle);
 		mbox_client_txdone(mtk_crtc->cmdq_chan, 0);
 	}
@@ -547,14 +540,11 @@ static void mtk_crtc_ddp_irq(void *data)
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	if (!priv->data->shadow_register && !mtk_crtc->cmdq_chan)
-		mtk_crtc_ddp_config(crtc, NULL);
-	else if (mtk_crtc->cmdq_vblank_cnt > 0 && --mtk_crtc->cmdq_vblank_cnt == 0)
-		DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
-			  drm_crtc_index(&mtk_crtc->base));
 #else
 	if (!priv->data->shadow_register)
-		mtk_crtc_ddp_config(crtc, NULL);
 #endif
+		mtk_crtc_ddp_config(crtc, NULL);
+
 	mtk_drm_finish_page_flip(mtk_crtc);
 }
 
-- 
2.25.1

