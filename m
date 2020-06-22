Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DF204B88
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54896E955;
	Tue, 23 Jun 2020 07:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFA86E81E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:01:17 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id h22so8756029pjf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZVD0oXPQ4Vgqd6246WLtuLGZy0JHZAVsnDaKWilj8U=;
 b=gE/TTU+DUc4/SwYXVs8HGxNbuuc+CfEim7+eHmeeIy3ghku8uXPB1lkSAAzBCmPLQK
 XuhmUzZLXhLDipNrHe9+UaHN79UyS5wk/bsHSwDNG1yZwF9mw6DjhqAwCXZBe0yEtMhy
 j4S5loJiHU72q1+yCqJ/1G1e+KOQdWh4bTlpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dZVD0oXPQ4Vgqd6246WLtuLGZy0JHZAVsnDaKWilj8U=;
 b=KXqPClGmxdrx6cUzLNjpRI9iBh6l9VpXhBGuho0Tt+7y16JQVFisYWMax8w6BI/j5g
 TaMZUgLIBBqGeJU7tobVgcWNgtuJsqKgucPwZv0rjFr6PHILS/onMDx8BIECp0do0K7r
 IRvn7vTp+LLzsokdjmmSmVe5MXb3t6GJv7NF9EWgU6g7LRmKls+cihmOl+qJzISuC8CM
 95KqkmqjdmLM4QCj4jpmeNkwgtu5hBe1J6ccWwFxf6tW30c1bK1dvORoqAhjmHuBthBS
 IH4hHm70t95q55ZHtq3KcWnQkCoQqb7YNkUvYkGbEzw055DYKfOrRQzkvjlkRh5VElN8
 MIOA==
X-Gm-Message-State: AOAM530zJ2FM51QhMGFfi3hn3Y9dx1bBprJvCtJVCTJ/cc9SJggtM8XW
 ksabKRnSWY3L0hBFC+oWianoig==
X-Google-Smtp-Source: ABdhPJx4uZC5fXg6XELfgCrKxRoKDGalQWvOZ7PrYOynWWRBfztarOhfdQkY30e4WtakXs5VctClyg==
X-Received: by 2002:a17:90a:2c48:: with SMTP id
 p8mr19049280pjm.189.1592838077126; 
 Mon, 22 Jun 2020 08:01:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id h9sm14465808pfe.32.2020.06.22.08.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:01:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v2] drm/mediatek: check plane visibility in atomic_update
Date: Mon, 22 Jun 2020 23:01:09 +0800
Message-Id: <20200622150109.91205-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tfiga@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable the plane if it's not visible. Otherwise mtk_ovl_layer_config()
would proceed with invalid plane and we may see vblank timeout.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
v2: Add fixes tag
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index c2bd683a87c8..74dc71c7f3b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -164,6 +164,16 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
 						   true, true);
 }
 
+static void mtk_plane_atomic_disable(struct drm_plane *plane,
+				     struct drm_plane_state *old_state)
+{
+	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
+
+	state->pending.enable = false;
+	wmb(); /* Make sure the above parameter is set before update */
+	state->pending.dirty = true;
+}
+
 static void mtk_plane_atomic_update(struct drm_plane *plane,
 				    struct drm_plane_state *old_state)
 {
@@ -178,6 +188,9 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return;
 
+	if (!plane->state->visible)
+		return mtk_plane_atomic_disable(plane, old_state);
+
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
 	addr = mtk_gem->dma_addr;
@@ -200,16 +213,6 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	state->pending.dirty = true;
 }
 
-static void mtk_plane_atomic_disable(struct drm_plane *plane,
-				     struct drm_plane_state *old_state)
-{
-	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
-
-	state->pending.enable = false;
-	wmb(); /* Make sure the above parameter is set before update */
-	state->pending.dirty = true;
-}
-
 static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 	.prepare_fb = drm_gem_fb_prepare_fb,
 	.atomic_check = mtk_plane_atomic_check,
-- 
2.27.0.111.gc72c7da667-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
