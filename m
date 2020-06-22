Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3D203029
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7F6E216;
	Mon, 22 Jun 2020 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15D8A6E0C8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 05:32:40 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id h95so8064781pje.4
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 22:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOs8/vOcSTNojAnkjIJLl6Zwh7pEFROh/lHqucoCGw4=;
 b=dPCYMgxwutm6jIq2Wj18eM2TXJW8xWvR97Y37deovDDlPXTd+KGT1+Ju9/iINFjIht
 NCUTlZdh+IITFYHEEyBkDxE4y2z67kqprIsFDboISSXR+1vtlhazfUh8hCWCDTSOUdaT
 StTuEMbg+XmgJ+ClOhdbG3/p4rJCeIwGLQDdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOs8/vOcSTNojAnkjIJLl6Zwh7pEFROh/lHqucoCGw4=;
 b=OVqbrPyIVaw0wo/O4up74PaASebG+bmGEy+3pIy5szLS7Zs2lG8P3kEb5TpYXNih3/
 OkM1qzarcWEoxT+nq5X3YIVYHmyaOTnAESu0KDFPDiB9WMioR8G2ENb0z9z/2391DTkm
 /oB6Al5CgZOYrvdEGVZZJok1zt28nNW09pK1F5svWtQlQv2+szXN67797Z5lAGFA7zZh
 NaGgClOOijIrZRgnZBKPKHpn/6AQbM6M/yVfKgXP7d6B2uN4vHWQ3cJLlF2av8S2jB0T
 GFaOf9eJ01r5JPHJpx/GnRvLc5AOxL54IoGtqujVf4gTe0240pwb3dO+Xvhu6xqrLf3y
 Eaig==
X-Gm-Message-State: AOAM530LTyaQk67xPhJYhNZqOfsF4kS/se+0g41qj6VcBQGaDLNqbZtW
 AsTjj81bsBvCZsQIACQr1Ug+ZQ==
X-Google-Smtp-Source: ABdhPJyZmlvjgo1vg45lGnOaXcMAlL6/gigFUFN6X5r+Q50PTwVNyET7M9/6fIkpx0Z3VHooFu3v5w==
X-Received: by 2002:a17:90a:1a17:: with SMTP id
 23mr16362040pjk.231.1592803959593; 
 Sun, 21 Jun 2020 22:32:39 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id b1sm12240078pjc.33.2020.06.21.22.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 22:32:39 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: check plane visibility in atomic_update
Date: Mon, 22 Jun 2020 13:32:34 +0800
Message-Id: <20200622053234.122120-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
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
