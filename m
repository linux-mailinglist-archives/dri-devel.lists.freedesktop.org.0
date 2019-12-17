Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6E122F5A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3B56EA16;
	Tue, 17 Dec 2019 14:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91A46EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id C09FD2927DF
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 18/34] drm/komeda: Move object assignments to framebuffer to
 after size checks
Date: Tue, 17 Dec 2019 15:50:04 +0100
Message-Id: <20191217145020.14645-19-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assignments are the same in both branches of the "if" statement and
nothing depends on them between their original position and the new
position, so this can be safely done.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index acffceeb26f1..d52278ca27fb 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -166,8 +166,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
-		for (i = 0; i < info->num_planes; ++i)
-			kfb->base.obj[i] = objs[i];
 	} else {
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 						 kfb->base.height);
@@ -176,8 +174,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
 						     file, mode_cmd);
-		for (i = 0; i < info->num_planes; ++i)
-			kfb->base.obj[i] = objs[i];
 	}
 	if (ret < 0)
 		goto err_cleanup;
@@ -189,6 +185,9 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto err_cleanup;
 		}
 
+	for (i = 0; i < info->num_planes; ++i)
+		kfb->base.obj[i] = objs[i];
+
 	ret = drm_framebuffer_init(dev, &kfb->base, &komeda_fb_funcs);
 	if (ret < 0) {
 		DRM_DEBUG_KMS("failed to initialize fb\n");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
