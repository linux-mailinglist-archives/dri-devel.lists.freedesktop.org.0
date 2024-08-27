Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2717960F21
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9710E344;
	Tue, 27 Aug 2024 14:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LT/LDSBV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA4E10E344
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:56:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0505ACE135B;
 Tue, 27 Aug 2024 14:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79CC4C4FDFD;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724770560;
 bh=xz/UXWEcxepYKNcKplNKWh6SZMhniiI0hGFc+cpA380=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=LT/LDSBVgHCmFK5RVM4E1LVtG4IfiFWhKylo/7npYwn6ZRRh+wSqrF01UtglUvr+8
 fL0Xn5wzbEf0zfJjBHsWWNHjafpdFrRk5x1QOTyHCh6EKUpQyfY8jiFoxxxo1K5eVv
 4ui18Zu1hRq+BMsU1X2iwGC5dMwd/Z2mAIY8VuG3zpdBaNFcSpb0I7Irqr/a5Dml0q
 uvdN05ISO/59QecsCeT1v/uvxmkp1RZNE1b/Xkyojry+6jOvN4lsSeuUifr53wQUb3
 XS/akLEcLPp6s9i7hw1EZIcf5aeFbchpkxeKjyc9Z7/VGY6+P3EeJWGcKqr/tf1qEx
 opVe0a51VpKsg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB42C54734;
 Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay"
 <devnull+jason-jh.lin.mediatek.com@kernel.org>
Date: Tue, 27 Aug 2024 22:55:20 +0800
Subject: [PATCH v3 2/2] drm/mediatek: change config_lock from spin_lock to
 spin_lock_irqsave
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240827-drm-fixup-0819-v3-2-4761005211ec@mediatek.com>
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724770559; l=3389;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=qmIEDrv7vEydnkYLajQteZQg7GKHc0xz1SItk+ixJMg=;
 b=BMUDPPx43HxuqLgPxE38r9SfCUMKzAyjGAJfDPSQ8Fp8MAR5/tJSt8tP35PMgK/0E70FFaATs
 XMmR4p7wiooD3Dn/qzlUeXxxFLuDK7Kd7rIrAvazmTQhyF3ZtSK5qKg
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

Operations within spin_locks are limited to fast memory access and
confirmation of minimum lock duration.

Although using spin_lock with config_lock seems to ensure shorter hold
times, it is safer to use spin_lock_irqsave due to potential deadlocks
and nested interrupt scenarios in interrupt contexts.

So change config_lock from spin_lock to spin_lock_irqsave.

Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet is done")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index b752c0b46383..d7f0926f896d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -108,14 +108,16 @@ static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 
 static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
+	unsigned long flags;
+
 	drm_crtc_handle_vblank(&mtk_crtc->base);
 
-	spin_lock(&mtk_crtc->config_lock);
+	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	if (!mtk_crtc->config_updating && mtk_crtc->pending_needs_vblank) {
 		mtk_crtc_finish_page_flip(mtk_crtc);
 		mtk_crtc->pending_needs_vblank = false;
 	}
-	spin_unlock(&mtk_crtc->config_lock);
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 }
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
@@ -313,16 +315,16 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 	struct mtk_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_crtc, cmdq_client);
 	struct mtk_crtc_state *state;
 	unsigned int i;
+	unsigned long flags;
 
 	if (data->sta < 0)
 		return;
 
 	state = to_mtk_crtc_state(mtk_crtc->base.state);
 
-	spin_lock(&mtk_crtc->config_lock);
-
+	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	if (mtk_crtc->config_updating) {
-		spin_unlock(&mtk_crtc->config_lock);
+		spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 		goto ddp_cmdq_cb_out;
 	}
 
@@ -352,7 +354,7 @@ static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
 		mtk_crtc->pending_async_planes = false;
 	}
 
-	spin_unlock(&mtk_crtc->config_lock);
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 
 ddp_cmdq_cb_out:
 
@@ -585,12 +587,13 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 	struct mtk_drm_private *priv = crtc->dev->dev_private;
 	unsigned int pending_planes = 0, pending_async_planes = 0;
 	int i;
+	unsigned long flags;
 
 	mutex_lock(&mtk_crtc->hw_lock);
 
-	spin_lock(&mtk_crtc->config_lock);
+	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	mtk_crtc->config_updating = true;
-	spin_unlock(&mtk_crtc->config_lock);
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 
 	if (needs_vblank)
 		mtk_crtc->pending_needs_vblank = true;
@@ -645,9 +648,9 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
 	}
 #endif
-	spin_lock(&mtk_crtc->config_lock);
+	spin_lock_irqsave(&mtk_crtc->config_lock, flags);
 	mtk_crtc->config_updating = false;
-	spin_unlock(&mtk_crtc->config_lock);
+	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 
 	mutex_unlock(&mtk_crtc->hw_lock);
 }

-- 
2.43.0


