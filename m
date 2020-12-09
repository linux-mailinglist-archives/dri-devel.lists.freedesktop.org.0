Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C752D4420
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583FF6EA57;
	Wed,  9 Dec 2020 14:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A315C6EA50
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 14:25:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31844AD5C;
 Wed,  9 Dec 2020 14:25:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, christian.koenig@amd.com, airlied@linux.ie,
 sumit.semwal@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, eric@anholt.net, sam@ravnborg.org
Subject: [PATCH v3 1/8] drm/ast: Don't pin cursor source BO explicitly during
 update
Date: Wed,  9 Dec 2020 15:25:20 +0100
Message-Id: <20201209142527.26415-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209142527.26415-1-tzimmermann@suse.de>
References: <20201209142527.26415-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linaro-mm-sig@lists.linaro.org, virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vmapping the cursor source BO contains an implicit pin operation,
so there's no need to do this manually.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 742d43a7edf4..68bf3d33f1ed 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -180,12 +180,9 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 
 	gbo = drm_gem_vram_of_gem(fb->obj[0]);
 
-	ret = drm_gem_vram_pin(gbo, 0);
-	if (ret)
-		return ret;
 	ret = drm_gem_vram_vmap(gbo, &map);
 	if (ret)
-		goto err_drm_gem_vram_unpin;
+		return ret;
 	src = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	dst = ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
@@ -194,13 +191,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 	update_cursor_image(dst, src, fb->width, fb->height);
 
 	drm_gem_vram_vunmap(gbo, &map);
-	drm_gem_vram_unpin(gbo);
 
 	return 0;
-
-err_drm_gem_vram_unpin:
-	drm_gem_vram_unpin(gbo);
-	return ret;
 }
 
 static void ast_cursor_set_base(struct ast_private *ast, u64 address)
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
