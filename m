Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41327212294
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 13:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8456EAD0;
	Thu,  2 Jul 2020 11:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158956EAC3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 11:50:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0AEFBD7C;
 Thu,  2 Jul 2020 11:50:31 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Subject: [PATCH v2 04/14] drm/ast: Update cursor image and checksum from same
 function
Date: Thu,  2 Jul 2020 13:50:19 +0200
Message-Id: <20200702115029.5281-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702115029.5281-1-tzimmermann@suse.de>
References: <20200702115029.5281-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cursor image and checksum go hand in hand. Update both in the same
place. The helper cannot fail, so remove the return type.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 8f94d4712f66..7474baddf048 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -84,7 +84,7 @@ void ast_cursor_fini(struct ast_private *ast)
 	}
 }
 
-static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
+static void update_cursor_image(u8 __iomem *dst, const u8 *src, int width, int height)
 {
 	union {
 		u32 ul;
@@ -96,7 +96,8 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 	} data16;
 	u32 csum = 0;
 	s32 alpha_dst_delta, last_alpha_dst_delta;
-	u8 *srcxor, *dstxor;
+	u8 __iomem *dstxor;
+	const u8 *srcxor;
 	int i, j;
 	u32 per_pixel_copy, two_pixel_copy;
 
@@ -137,16 +138,6 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 		}
 		dstxor += last_alpha_dst_delta;
 	}
-	return csum;
-}
-
-static int ast_cursor_update(void *dst, void *src, unsigned int width,
-			     unsigned int height)
-{
-	u32 csum;
-
-	/* do data transfer to cursor cache */
-	csum = copy_cursor_image(src, dst, width, height);
 
 	/* write checksum + signature */
 	dst += AST_HWC_SIZE;
@@ -155,8 +146,6 @@ static int ast_cursor_update(void *dst, void *src, unsigned int width,
 	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
 	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
 	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
-
-	return 0;
 }
 
 int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
@@ -188,9 +177,8 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 		goto err_drm_gem_vram_vunmap_src;
 	}
 
-	ret = ast_cursor_update(dst, src, fb->width, fb->height);
-	if (ret)
-		goto err_drm_gem_vram_vunmap_dst;
+	/* do data transfer to cursor BO */
+	update_cursor_image(dst, src, fb->width, fb->height);
 
 	/*
 	 * Always unmap buffers here. Destination buffers are
@@ -203,8 +191,6 @@ int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer *fb)
 
 	return 0;
 
-err_drm_gem_vram_vunmap_dst:
-	drm_gem_vram_vunmap(ast->cursor.gbo[ast->cursor.next_index], dst);
 err_drm_gem_vram_vunmap_src:
 	drm_gem_vram_vunmap(gbo, src);
 err_drm_gem_vram_unpin:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
