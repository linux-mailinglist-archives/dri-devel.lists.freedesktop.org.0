Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CA204BA5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564856E395;
	Tue, 23 Jun 2020 07:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BED46E15E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:57:59 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id h185so8601734pfg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNVDlHo9iCmwFA5/+KaBcvo8z4tp3WHW8x/dAzHknhs=;
 b=lWsh06McKtsB0TZwsmVQPWmZtLPbLERSPsChZ0yrJB3ljtjin7zCxBNhtekTM6ixZg
 VkJXJ1pkj0EQJw4aInTVFnZ2BADdhdJfrX+huPTZHbUWmgg5Wz0cPu1cerWvWXJrhQvv
 SvDo7EWb7+RBTIwmaxuC1dj8kLLd02G7Iq43o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNVDlHo9iCmwFA5/+KaBcvo8z4tp3WHW8x/dAzHknhs=;
 b=SDQZAAffGPtdy31ugeqrldxW0hr/fhbFvkotUiwyP8mOuxVE8CqdFmm/N4V0rss3YI
 BGi71ZPar+8drp6nL9Pyow+9X94Wr7j3jNdaNBPljkr2FHmxum/FCNOdocaiV0ygYrtK
 6haeSIioPUR4vgtpuVR4P/Iv3T38co3fo6x9kwpDrzEWHTWCJP/FEk70mWi3ZBQpKm8y
 FhlE5rFdFf9BvM0GTEaOGxpxJ1io00KM8b5ea9AFvR1ewF0ACZtTwx/9Sz2MDWUiXB1x
 wXLiBVfChFExtMCY0EC4c3CE56kYfxgO8YG09gG374wttoKAjm5tQuGO5b43QA9a35kk
 fMmg==
X-Gm-Message-State: AOAM533bU/gBJJx1i3YkkgTwwuA9UlD0H95aZGfUrV2iyga0DsT0TmcB
 CsHT+s2iDy6kO16blu0gEq+1Dg==
X-Google-Smtp-Source: ABdhPJxmnz1ib2D8DJt/1U8CJfNkRkm15rCzyU0W4a6+95/jkFa2Tk6IVPgnKT2r6EhJhLeYHifldg==
X-Received: by 2002:a62:154f:: with SMTP id 76mr21179030pfv.322.1592841478606; 
 Mon, 22 Jun 2020 08:57:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id b71sm4986263pfb.125.2020.06.22.08.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:57:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4] drm/mediatek: check plane visibility in atomic_update
Date: Mon, 22 Jun 2020 23:57:53 +0800
Message-Id: <20200622155753.130181-1-hsinyi@chromium.org>
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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
v4: fix commit message
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
