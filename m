Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A1204B9F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2B26E96A;
	Tue, 23 Jun 2020 07:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9D16E840
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:31:12 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id h185so8572062pfg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ixdH9XmCR/FGRBWjByQkDAMb4Q8iNrtrWXUPaU65E=;
 b=GCaW2vIs8IrqprYix18IRhF4GCZn+fvewA1HI3tj240Pvy5jWnECjwNMtHHB1x5egu
 rhNOAsJfnsQCNPXdT/l0XTf32ueyjcEd093oMY7/gqBRGas7eDy7Tb+yJ3woe7Nh1L2k
 BK59KeUXIf+/lckgrD2y2ZKa34XQvyzyntPkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W7ixdH9XmCR/FGRBWjByQkDAMb4Q8iNrtrWXUPaU65E=;
 b=lKRv8GScX03YUZ2JzFDYkTZnK59PAthWZBMuzc00Bzn2u2M1gScGnojUNZpCP0X7+e
 Pq2AsYa5rA+QUSNG8jeL77CKOfRbqPPMuqhaPLFOV1WJ4KvWr4RhjMgAUF0P5Id9PICd
 ejYgmYfcUxz+P2kJhN03Q43sceyEIAczNgCyaowO7z/dCFhT/r4ydioN6zew/GAuXAbZ
 S2eXkmkWokNPp93aeLVibVk82UB+/CL81W+mxWP0czwTKpDTbb1anHtSixxC/u5d+eZW
 J4Wa6bhBJI4TKmUyiDrt5ahvYRWXPIHwtvNzj/a3NeeaUhsx6yuy3wQb5vysyMu6Vn1A
 PGNg==
X-Gm-Message-State: AOAM531ZL3fQlD4i5C7FxEZPqNPXKbatRsEPAN5zzKWki5kJr77nWlSm
 FcNEOnWmWiKQLbIOJeKljyliIg==
X-Google-Smtp-Source: ABdhPJyWELrsdwoWW5EjGH/mw6RztGq7UXdSlrI+wSZwEzbuiE+7gkSdERYqm6zry4UcsIZV7AV6aw==
X-Received: by 2002:a63:525a:: with SMTP id s26mr10961206pgl.155.1592839872030; 
 Mon, 22 Jun 2020 08:31:12 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e78sm14464926pfh.50.2020.06.22.08.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:31:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v3] drm/mediatek: check plane visibility in atomic_update
Date: Mon, 22 Jun 2020 23:31:06 +0800
Message-Id: <20200622153106.112115-1-hsinyi@chromium.org>
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
Change-Id: Id5341d60ddfffc88a38d9db0caa089b2d6a1d29c
---
v3: Address comment
v2: Add fixes tag
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 25 ++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index c2bd683a87c8..92141a19681b 100644
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
@@ -178,6 +188,11 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return;
 
+	if (!plane->state->visible) {
+		mtk_plane_atomic_disable(plane, old_state);
+		return;
+	}
+
 	gem = fb->obj[0];
 	mtk_gem = to_mtk_gem_obj(gem);
 	addr = mtk_gem->dma_addr;
@@ -200,16 +215,6 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
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
