Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBE11E741
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 16:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9676EA30;
	Fri, 13 Dec 2019 15:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874F46EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 00CFE292D71
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 20/36] drm/komeda: Move object assignments to framebuffer to
 after size checks
Date: Fri, 13 Dec 2019 16:58:51 +0100
Message-Id: <20191213155907.16581-21-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
index b923e2b6c523..4c78ae1a4845 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -167,8 +167,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		ret = komeda_fb_afbc_size_check(kfb, info, objs, file,
 						mode_cmd);
-		for (i = 0; i < info->num_planes; ++i)
-			kfb->base.obj[i] = objs[i];
 	} else {
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, kfb->base.width,
 						 kfb->base.height);
@@ -177,8 +175,6 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		ret = komeda_fb_none_afbc_size_check(mdev, info, objs,
 						     file, mode_cmd);
-		for (i = 0; i < info->num_planes; ++i)
-			kfb->base.obj[i] = objs[i];
 	}
 	if (ret < 0)
 		goto err_cleanup;
@@ -190,6 +186,9 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
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
