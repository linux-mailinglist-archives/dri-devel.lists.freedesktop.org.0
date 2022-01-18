Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA549275D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 14:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58D310E12B;
	Tue, 18 Jan 2022 13:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDD710E12B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 13:41:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 950F51F43F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642513276;
 bh=IPtBzMiKepEmzjvtX9sO6tEJL6k0DuE+x1vV5p8WYvw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WIzFqSVDaIt7gohiINlfy6Mgyaj46ala6Hdgnd9yNMpBnOYHg6uZQJIbwyC1vL7oP
 vhNmMf2oylYAyhmDbMaflelPUCI8iv310tQ9wjTZKsOJOp84ZoQ9UJAKl5CmA25+Rf
 HkxZKXl7icfZGc82z+CQiAElg2k+XhQF2EDofbb09/lE7g0SK/Vkl/EMB2nQny/8rL
 YrnaMlGBuiw69QHt5wEVIMwxh2CaHe/CwO7MyMzZf5k0vXGzfSSm9KYWC4qWRaEZO5
 YLhr1neFX+N49nkfRCldq98afbc55Zy4V41fGX6Uhi9ilLg3XZEgTkHXJ1iAybdopz
 Lyui61qx0K8rQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 2/2] drm: mediatek: mtk_drm_crtc: Use kmalloc in
 mtk_drm_crtc_duplicate_state
Date: Tue, 18 Jan 2022 14:37:59 +0100
Message-Id: <20220118133759.112458-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Optimize mtk_drm_crtc_duplicate_state() by switching from kzalloc() to
kmalloc(): the only variable of this struct that gets checked in other
functions is `pending_config`, but if that's set to false, then all of
the remaining variables will only ever be set, but not read - so, also
set `pending_config` to false.
This saves us some small overhead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 09fc9ad02c7a..f536a0a927e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -185,7 +185,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc
 {
 	struct mtk_crtc_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
@@ -193,6 +193,7 @@ static struct drm_crtc_state *mtk_drm_crtc_duplicate_state(struct drm_crtc *crtc
 
 	WARN_ON(state->base.crtc != crtc);
 	state->base.crtc = crtc;
+	state->pending_config = false;
 
 	return &state->base;
 }
-- 
2.33.1

