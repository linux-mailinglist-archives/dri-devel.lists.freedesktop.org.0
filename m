Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF4186194
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 03:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C306E16F;
	Mon, 16 Mar 2020 02:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6613D6E16F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 02:33:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B35D20722;
 Mon, 16 Mar 2020 02:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584326005;
 bh=GcH41PGTf8WsMwYREVE6JKMp5hkyVBF7ZVhJsXLeEo0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZCEIalWj+Si5my3o2rZvAfzpBlju+CA8vUAuXH1HdfQNQ8N6/x9MhO5PhoIduOBdt
 +HPBDT/MoN/QYPOjANjrleK63WUl5oOz/z5wjZoxEFqTzTima0gGzOWmLKD8bu+ioh
 Ejfkz4mZsNYloWlBdmtBWaeWdCZUMRsnxA+rTktc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 04/41] drm/mediatek: Ensure the cursor plane is on
 top of other overlays
Date: Sun, 15 Mar 2020 22:32:42 -0400
Message-Id: <20200316023319.749-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316023319.749-1-sashal@kernel.org>
References: <20200316023319.749-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

[ Upstream commit 26d696192aa5f4fe9119d6d23f90ed535053abca ]

Currently the cursor is placed on the first overlay plane, which means
it will be at the bottom of the stack when the hw does the compositing
with anything other than primary plane. Since mtk doesn't support plane
zpos, change the cursor location to the top-most plane.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7104504babde0..1d46fbe9e07c6 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -606,11 +606,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
 }
 
 static inline
-enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
+enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
+					    unsigned int num_planes)
 {
 	if (plane_idx == 0)
 		return DRM_PLANE_TYPE_PRIMARY;
-	else if (plane_idx == 1)
+	else if (plane_idx == (num_planes - 1))
 		return DRM_PLANE_TYPE_CURSOR;
 	else
 		return DRM_PLANE_TYPE_OVERLAY;
@@ -629,7 +630,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
+				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
+							num_planes),
 				mtk_ddp_comp_supported_rotations(comp));
 		if (ret)
 			return ret;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
