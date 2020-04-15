Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C441AAF52
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B136E1E2;
	Wed, 15 Apr 2020 17:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984886E1E2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:20:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id E5BD82A10E6
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Don't free a struct never allocated by drm_gem_fb_init()
Date: Wed, 15 Apr 2020 19:20:24 +0200
Message-Id: <20200415172024.24004-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_gem_fb_init() is passed the fb and never allocates it, so it should be
not the one freeing it. As it is now the second call to kfree() is possible
with the same fb. Coverity reported the following:

*** CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
/drivers/gpu/drm/drm_gem_framebuffer_helper.c: 230 in drm_gem_fb_create_with_funcs()
224     	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
225     	if (!fb)
226     		return ERR_PTR(-ENOMEM);
227
228     	ret = drm_gem_fb_init_with_funcs(dev, fb, file, mode_cmd, funcs);
229     	if (ret) {
vvv     CID 1492613:  Memory - corruptions  (USE_AFTER_FREE)
vvv     Calling "kfree" frees pointer "fb" which has already been freed. [Note: The source code implementation of the function has been overridden by a user model.]
230     		kfree(fb);
231     		return ERR_PTR(ret);
232     	}
233
234     	return fb;
235     }

drm_gem_fb_init_with_funcs() calls drm_gem_fb_init()
drm_gem_fb_init() calls kfree(fb)

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492613 ("Memory - corruptions")
Fixes: f2b816d78a94 ("drm/core: Allow drivers allocate a subclass of struct drm_framebuffer")
Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index cac15294aef6..ccc2c71fa491 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -76,10 +76,8 @@ drm_gem_fb_init(struct drm_device *dev,
 		fb->obj[i] = obj[i];
 
 	ret = drm_framebuffer_init(dev, fb, funcs);
-	if (ret) {
+	if (ret)
 		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
-		kfree(fb);
-	}
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
