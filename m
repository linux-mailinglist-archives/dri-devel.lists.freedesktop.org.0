Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988BD153FF0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBB56FA01;
	Thu,  6 Feb 2020 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B21B6E2E6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 07:00:01 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id o142so737355ybg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 23:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ohRhPi8BaP2Hr5/3y3n5V3DWtzBXMkpjbXzBGyXAhaU=;
 b=T8vIBTEH7afCvW+9MUnm3Xu5qubD8B7doR+wav2Hn7tW5+4oB/z325sG00l+sCcS+X
 yL6qM0XJQbM91UAUaKh1UheNVC8HLx/dl79+LO9U7yIErEcjvLu5EjRn84kGCr3AcAQL
 9sYCBAMrrlpOsjfKC7ib6Eko0iteLNSqhotbMmvj8R/cCJdvDyIOjyzo2dHXAYj7338j
 l8208YxZh63z2FS2sF9g5y8f0OBuYXwxklcKHfpTn0ec2hmeN0fuUKTIWl6jq/FyZBdj
 ZLbZr9A/ZEwHZpfIT/46CypnfZMUGIo8/q68daXNfYfnF2GLHuSfILI5S5sfbym00jb0
 7Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ohRhPi8BaP2Hr5/3y3n5V3DWtzBXMkpjbXzBGyXAhaU=;
 b=CtJ8Uit1C8AIfa6ymD82daxKF7gTU+gRCdXtkjpTaruF9av9vvPDEiYMQlaMmQ30ve
 n6vuejr9kdfW9f0od6dxsWgK74BypSYPMqwiWRHl8ID6DHWsB71/UCjf22UNP25JJSFg
 W+DWhLm7W889QN5Vn57vxIdrOSbANg1gAo7qAIsCyQIlRG+BjUuCcHq5H2wKgP34sRBk
 I6PNHyhfoV6nKCivPGmsQyZewHBmx8HE8cgu86s0/xVf98ZxqlNJbTIXltPZUQSiVj2c
 LXPAtAmO0r2iCNxe96BZxxW6Cuug0/BlO0z0CijR9qIajxwPmS0P1KJI9rPyGAMXkmCE
 SKrw==
X-Gm-Message-State: APjAAAWTEz5bv1wMa15r6FWTwYQg+F0jNVMpnfUnoSToQR+oIORve1HN
 7ODdbiygQxzv+5RvF/kirIHplzEPXG8bAQ==
X-Google-Smtp-Source: APXvYqy/T41MypaRkzpvorQCzz5aeOT5d2jGXM9FxIb64m0CZleygIGtHIdFFMdtLCPoL8RkWNY4GAeVDW7YJQ==
X-Received: by 2002:a81:2608:: with SMTP id m8mr1874539ywm.259.1580972400426; 
 Wed, 05 Feb 2020 23:00:00 -0800 (PST)
Date: Thu,  6 Feb 2020 17:59:51 +1100
In-Reply-To: <1580441226.9516.1.camel@mtksdaap41>
Message-Id: <20200206065951.213862-1-evanbenn@google.com>
Mime-Version: 1.0
References: <1580441226.9516.1.camel@mtksdaap41>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH] drm/mediatek: Ensure the cursor plane is on top of other
 overlays
From: evanbenn@google.com
To: ck.hu@mediatek.com
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: dcastagna@chromium.org, evanbenn@gmail.com, evanbenn@google.com,
 evanbenn@chromium.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 seanpaul@chromium.org, sean@poorly.run, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Currently the cursor is placed on the first overlay plane, which means
it will be at the bottom of the stack when the hw does the compositing
with anything other than primary plane. Since mtk doesn't support plane
zpos, change the cursor location to the top-most plane.

Signed-off-by: Evan Benn <evanbenn@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 29 +++++++++++++++++--------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7b392d6c71cc..d4078c2089e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -658,10 +658,21 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 
 static int mtk_drm_crtc_init(struct drm_device *drm,
 			     struct mtk_drm_crtc *mtk_crtc,
-			     struct drm_plane *primary,
-			     struct drm_plane *cursor, unsigned int pipe)
+			     unsigned int pipe)
 {
-	int ret;
+	int i, ret;
+
+	struct drm_plane *primary = NULL;
+	struct drm_plane *cursor = NULL;
+
+	for (i = 0; i < mtk_crtc->layer_nr; ++i) {
+		if (!primary && mtk_crtc->planes[i].type ==
+				DRM_PLANE_TYPE_PRIMARY)
+			primary = &mtk_crtc->planes[i];
+		if (!cursor && mtk_crtc->planes[i].type ==
+				DRM_PLANE_TYPE_CURSOR)
+			cursor = &mtk_crtc->planes[i];
+	}
 
 	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
 					&mtk_crtc_funcs, NULL);
@@ -711,11 +722,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
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
@@ -734,7 +746,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 		ret = mtk_plane_init(drm_dev,
 				&mtk_crtc->planes[mtk_crtc->layer_nr],
 				BIT(pipe),
-				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
+				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
+							num_planes),
 				mtk_ddp_comp_supported_rotations(comp));
 		if (ret)
 			return ret;
@@ -830,9 +843,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			return ret;
 	}
 
-	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
-				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
-				NULL, pipe);
+	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
