Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC30F273C49
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 09:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575D16E087;
	Tue, 22 Sep 2020 07:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E546E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 08:02:20 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E0748222A75F2A36BE81;
 Mon, 21 Sep 2020 16:02:15 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:07 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm/ast: simplify the return expression of ast_*
 function
Date: Mon, 21 Sep 2020 16:24:32 +0800
Message-ID: <20200921082432.2591253-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Sep 2020 07:46:36 +0000
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
Cc: Liu Shixin <liushixin2@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/gpu/drm/ast/ast_drv.c  | 7 +------
 drivers/gpu/drm/ast/ast_mode.c | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index f0b4af1c390a..a2a3f32260f9 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -160,15 +160,10 @@ static int ast_drm_thaw(struct drm_device *dev)
 
 static int ast_drm_resume(struct drm_device *dev)
 {
-	int ret;
-
 	if (pci_enable_device(dev->pdev))
 		return -EIO;
 
-	ret = ast_drm_thaw(dev);
-	if (ret)
-		return ret;
-	return 0;
+	return ast_drm_thaw(dev);
 }
 
 static int ast_pm_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 834a156e3a75..4dca4ff01d41 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -636,18 +636,13 @@ ast_cursor_plane_helper_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_crtc *crtc = new_state->crtc;
 	struct ast_private *ast;
-	int ret;
 
 	if (!crtc || !fb)
 		return 0;
 
 	ast = to_ast_private(plane->dev);
 
-	ret = ast_cursor_blit(ast, fb);
-	if (ret)
-		return ret;
-
-	return 0;
+	return ast_cursor_blit(ast, fb);
 }
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
