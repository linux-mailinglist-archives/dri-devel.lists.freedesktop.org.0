Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AA960F1F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5866610E345;
	Tue, 27 Aug 2024 14:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oQHADp9+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A01C210E343
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:56:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF1E9A41B60;
 Tue, 27 Aug 2024 14:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69404C4FE01;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770560;
 bh=W0HOHjR6p56yjLFbI5V6pnp8JfZccfyzVOr40saBovM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=oQHADp9+HeYEe/oXuPui/dPtZHNI5gP4D02xkokskyPKR4LUsl/F9kKk9dwlJnq2v
 dAqyh/NpXCpxscuNB+WwvghFTZE6Ixml37aMs1IW9C0OEXrqOeT12i1eqQ9dPylg4q
 MFXJeaN6jY84zkPGU+IpkeJQRXm5RcIk4bpVyXmO8XgujpXBz3O3vIernZZ8yEhGb3
 OadJo2QSM3435tkVqLw4hvYFVbbriWWMxeQ1fKxeywH8Ct9YGFCF3W5iF0oc5FQOwg
 0TGOQWtINyjM3mN5LAREORfcaq7PjoV337u+/+0rZAtLqPfneV58mzGmxCtQ78s9Z2
 U8qoxlh7c+ekg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 59191C54735;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay"
 <devnull+jason-jh.lin.mediatek.com@kernel.org>
Date: Tue, 27 Aug 2024 22:55:19 +0800
Subject: [PATCH v3 1/2] drm/mediatek: Fix missing configuration flags in
 mtk_crtc_ddp_config()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-drm-fixup-0819-v3-1-4761005211ec@mediatek.com>
References: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
In-Reply-To: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724770559; l=4179;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=iYIVZKdlfToZtZzcWMBGVQVty7XCgDWPxhyuIS20va8=;
 b=eJYsFItFSfebjiwRKljFfy+8u7VWbKSZ1WB+xGrkLvk+Ue95Ylrd77mWdlOVUyw9lIrpQ78js
 p6J7PA3DLOUBx0Yi/mR1QM/KQHmijIcAlnxYyBcUBkGyttPZrWOwrL7
X-Developer-Key: i=jason-jh.lin@mediatek.com; a=ed25519;
 pk=7Hn+BnFBlPrluT5ks5tKVWb3f7O/bMBs6qEemVJwqOo=
X-Endpoint-Received: by B4 Relay for jason-jh.lin@mediatek.com/20240718
 with auth_id=187
X-Original-From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
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
Reply-To: jason-jh.lin@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

In mtk_crtc_ddp_config(), mtk_crtc will use some configuration flags to
generate instructions to cmdq_handle, such as:
  state->pending_config
  mtk_crtc->pending_planes
  plane_state->pending.config
  mtk_crtc->pending_async_planes
  plane_state->pending.async_config

These configuration flags may be set to false when a GCE IRQ comes calling
ddp_cmdq_cb(). This may result in missing prepare instructions,
especially if mtk_crtc_update_config() with the flase need_vblank (no need
to wait for vblank) cases.

Therefore, the mtk_crtc->config_updating flag is set at the beginning of
mtk_crtc_update_config() to ensure that these configuration flags won't be
changed when the mtk_crtc_ddp_config() is preparing instructions.
But somehow the ddp_cmdq_cb() didn't use the mtk_crtc->config_updating
flag to prevent those pending config flags from being cleared.

To avoid missing the configuration when generating the config instruction,
the config_updating flag should be added into ddp_cmdq_cb() and be
protected with spin_lock.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20240819-drm-fixup-0819-v2-1-a03580ece3ec@mediatek.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 6f34f573e127..b752c0b46383 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -69,6 +69,8 @@ struct mtk_crtc {
 	/* lock for display hardware access */
 	struct mutex			hw_lock;
 	bool				config_updating;
+	/* lock for config_updating to cmd buffer */
+	spinlock_t			config_lock;
 };
 
 struct mtk_crtc_state {
@@ -107,10 +109,13 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	drm_crtc_handle_vblank(&mtk_crtc->base);
+
+	spin_lock(&mtk_crtc->config_lock);
 	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
+	spin_unlock(&mtk_crtc->config_lock);
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
@@ -314,6 +319,13 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
+	spin_lock(&mtk_crtc->config_lock);
+
+	if (mtk_crtc->config_updating) {
+		spin_unlock(&mtk_crtc->config_lock);
+		goto ddp_cmdq_cb_out;
+	}
+
 	state->pending_config = false;
 
 	if (mtk_crtc->pending_planes) {
@@ -340,6 +352,10 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 		mtk_crtc->pending_async_planes = false;
 	}
 
+	spin_unlock(&mtk_crtc->config_lock);
+
+ddp_cmdq_cb_out:
+
 	mtk_crtc->cmdq_vblank_cnt = 0;
 	wake_up(&mtk_crtc->cb_blocking_queue);
 }
@@ -571,7 +587,11 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 	int i;
 
 	mutex_lock(&mtk_crtc->hw_lock);
+
+	spin_lock(&mtk_crtc->config_lock);
 	mtk_crtc->config_updating = true;
+	spin_unlock(&mtk_crtc->config_lock);
+
 	if (needs_vblank)
 		mtk_crtc->pending_needs_vblank = true;
 
@@ -625,7 +645,10 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
+	spin_lock(&mtk_crtc->config_lock);
 	mtk_crtc->config_updating = false;
+	spin_unlock(&mtk_crtc->config_lock);
+
 	mutex_unlock(&mtk_crtc->hw_lock);
 }
 
@@ -1068,6 +1091,7 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
 	mutex_init(&mtk_crtc->hw_lock);
+	spin_lock_init(&mtk_crtc->config_lock);
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	i = priv->mbox_index++;

-- 
2.43.0


