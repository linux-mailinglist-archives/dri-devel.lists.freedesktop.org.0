Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEC1CB9B93
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 21:05:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0710E92B;
	Fri, 12 Dec 2025 20:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=exactco.de header.i=@exactco.de header.b="F6abWy6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from exactco.de (exactco.de [176.9.10.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6C910E92B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 20:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=exactco.de; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:From:Subject:Cc:To
 :Message-Id:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1ajfBSYTJP67RDhKYmipkvA8f5Djql9PgZl5Sg4qV+8=; b=F
 6abWy6ZVyOcnC9CwB3pi903LQkX1CK8OOB6iH7SdmWWGJBJGj1KXXCia3L+jLm3r8mo+YbOkbG6X1
 APvTlIfdEfCGQ920QjaaHlJTAUddgM5FoADAeTyhWPs9ufW3BjPu+ME3lP3pZuL5076mdQCt8/LeP
 o5GUHa/vhyLkevub0VQvpHSZHiQUCdCxIQrFkx9dqZ6d4cyIErKfviFE1Fkc5kyROdyMrrS0UkmZg
 ca/x+6DuWUVECT8ZhTbvTF/i4475ciobscnx8rOslfrXxiB8N4b1TsAI2QyRrnYb6Y03FrpZZGTPu
 9sjJv6+VHUiE1DgCyV3/2ZW5xePyl0G3w==;
Date: Fri, 12 Dec 2025 21:05:04 +0100 (CET)
Message-Id: <20251212.210504.1355099120650239629.rene@exactco.de>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH V4] drm/ast: Swap framebuffer writes on big-endian machines
From: =?iso-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
X-Mailer: Mew version 6.10 on Emacs 30.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Swap the pixel data when writing to framebuffer memory on big-endian
machines. Fixes incorrect output. Aspeed graphics does not appear to
support big-endian framebuffers after AST2400, although the feature
has been documented.

There's a lengthy discussion at [1].

Signed-off-by: René Rebe <rene@exactco.de>
Link: https://lore.kernel.org/dri-devel/20251202.170626.2134482663677806825.rene@exactco.de/ # [1]
---
The ARGB4444 cursor not yet 100% correct, but that might be another layer/helper bug.
Tested on sparc64 T4-1 running T2/Linux.
---
 drivers/gpu/drm/ast/ast_cursor.c | 11 ++++++++---
 drivers/gpu/drm/ast/ast_mode.c   | 11 +++++++++--
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 2d3ad7610c2e..d4620171d845 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -92,12 +92,17 @@ static void ast_set_cursor_image(struct ast_device *ast, const u8 *src,
 				 unsigned int width, unsigned int height)
 {
 	u8 __iomem *dst = ast_plane_vaddr(&ast->cursor_plane.base);
-	u32 csum;
-
-	csum = ast_cursor_calculate_checksum(src, width, height);
+	u32 csum = ast_cursor_calculate_checksum(src, width, height);
 
 	/* write pixel data */
+#if defined(__BIG_ENDIAN)
+	unsigned int i;
+
+	for (i = 0; i < AST_HWC_SIZE; i += 2)
+		writew(swab16(*(const __be16 *)&src[i]), &dst[i]);
+#else
 	memcpy_toio(dst, src, AST_HWC_SIZE);
+#endif
 
 	/* write checksum + signature */
 	dst += AST_HWC_SIZE;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cd08990a10f9..57c6fbc3232b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -526,12 +526,18 @@ static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
 
 static void ast_handle_damage(struct ast_plane *ast_plane, struct iosys_map *src,
 			      struct drm_framebuffer *fb,
-			      const struct drm_rect *clip)
+			      const struct drm_rect *clip,
+			      struct drm_format_conv_state *fmtcnv_state)
 {
 	struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane_vaddr(ast_plane));
 
 	iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, clip));
+
+#if defined(__BIG_ENDIAN)
+	drm_fb_swab(&dst, fb->pitches, src, fb, clip, !src[0].is_iomem, fmtcnv_state);
+#else
 	drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
+#endif
 }
 
 static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
@@ -561,7 +567,8 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
 		drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
 		drm_atomic_for_each_plane_damage(&iter, &damage) {
-			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage);
+			ast_handle_damage(ast_plane, shadow_plane_state->data, fb, &damage,
+					  &shadow_plane_state->fmtcnv_state);
 		}
 
 		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-- 
2.52.0

-- 
René Rebe, ExactCODE GmbH, Berlin, Germany
https://exactco.de • https://t2linux.com • https://patreon.com/renerebe
