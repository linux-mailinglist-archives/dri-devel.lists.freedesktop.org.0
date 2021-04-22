Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532D367F4D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 13:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E3C6E05D;
	Thu, 22 Apr 2021 11:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000DB6EA73
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 11:10:10 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso768853pjg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 04:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/chTt+osIkWJLziQJ8wWSuoRfhyDdiRVm7MrtKaXiw=;
 b=mKEimyLVIPVuavwkFK4Vb3mGCyutLIp6e9a8JjPK/FFPW99UQ93YReQbFuVbbvYOKh
 ZqI1JiF6j/DGu+RKyl66iB+Fud+quoPHmOyvwLmRyq1B30khiYq/jT2O/0S91hsUOBWe
 Y5/aJGO+b2YzcZVXEb61OVpKVm1fKq6EnN3qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/chTt+osIkWJLziQJ8wWSuoRfhyDdiRVm7MrtKaXiw=;
 b=jRIoDu49bMUFdEuHJSx9FHGHvURfcCFf3bN/1tJP9uwZ/1m9ZkZzAPcwca9W/71y/v
 rVg3PGKfitWkkGPLkAkrNxThlB9tb/LTuioj29wFxzmjB2dlUQxi3/T7HsJmuRQDs2i7
 K/c9QgqyLPcPrlnSS2u4mXLC33zf7E01Tx0jFtgc1YZvOxBfxbRxD0GeF/LKVmHPectm
 m+Bg7aYomOfBipek/8RHFQ8Nape2cqTsPhm2S3pIgfvDgFTX8oZkqrgESkJ3GavFAntV
 dscJKW8hODtb5f/KoemHWpJpF3dtUJN+NI3/vOThS2hIDScXTu3snud2n9u/xZDm9x1E
 sKQA==
X-Gm-Message-State: AOAM533g5Pu3SJ07yOm/7xSfDV7Tc2bcaQNNMINqoh239IFrOsw0D+Ul
 RXjyuqZs+eE7MXOyhhnHjornLg==
X-Google-Smtp-Source: ABdhPJzKmYE6lUmhguTsDYgVEbYMCSAPKAPA5tLk2yNfUIXlQfSHEfR7PN9tItvv7RCFRP5pYJ5+Kw==
X-Received: by 2002:a17:90b:17c9:: with SMTP id
 me9mr16537781pjb.233.1619089810552; 
 Thu, 22 Apr 2021 04:10:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:daa5:b736:ed85:e08d])
 by smtp.gmail.com with ESMTPSA id 1sm2004045pjx.46.2021.04.22.04.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 04:10:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: clear pending flag when cmdq packet is done.
Date: Thu, 22 Apr 2021 19:10:04 +0800
Message-Id: <20210422111004.1338867-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CK Hu <ck.hu@mediatek.com>

In cmdq mode, packet may be flushed before it is executed, so
the pending flag should be cleared after cmdq packet is done.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 56 +++++++++++++++++++++---
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c823187..051bf0eb00d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -224,6 +224,45 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
+	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
+	struct mtk_drm_crtc *mtk_crtc = (struct mtk_drm_crtc *)pkt->crtc;
+	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
+	unsigned int i;
+
+	if (data.sta == CMDQ_CB_ERROR)
+		goto destroy_pkt;
+
+	if (state->pending_config) {
+		state->pending_config = false;
+	}
+
+	if (mtk_crtc->pending_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.config)
+				plane_state->pending.config = false;
+		}
+		mtk_crtc->pending_planes = false;
+	}
+
+	if (mtk_crtc->pending_async_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.async_config)
+				plane_state->pending.async_config = false;
+		}
+		mtk_crtc->pending_async_planes = false;
+	}
+
+destroy_pkt:
 	cmdq_pkt_destroy(data.data);
 }
 #endif
@@ -377,8 +416,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_height,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
-
-		state->pending_config = false;
+		if (!cmdq_handle)
+			state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -398,9 +437,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.config = false;
+			if (!cmdq_handle)
+				plane_state->pending.config = false;
 		}
-		mtk_crtc->pending_planes = false;
+		if (!cmdq_handle)
+			mtk_crtc->pending_planes = false;
 	}
 
 	if (mtk_crtc->pending_async_planes) {
@@ -420,9 +461,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.async_config = false;
+			if (!cmdq_handle)
+				plane_state->pending.async_config = false;
 		}
-		mtk_crtc->pending_async_planes = false;
+		if (!cmdq_handle)
+			mtk_crtc->pending_async_planes = false;
 	}
 }
 
@@ -475,6 +518,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
+		cmdq_handle->crtc = mtk_crtc;
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index d5a983d65f05..c06b14ec03e5 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -90,6 +90,7 @@ struct cmdq_pkt {
 	struct cmdq_task_cb	cb;
 	struct cmdq_task_cb	async_cb;
 	void			*cl;
+	void			*crtc;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-- 
2.31.1.498.g6c1eba8ee3d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
