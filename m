Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F32C890D3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389BE10E589;
	Wed, 26 Nov 2025 09:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7495910E589
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:46:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 546245BE14;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D1B23EA66;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2IuSCX3MJmnQJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 09:46:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/ast: Move cursor format conversion into helper
 function
Date: Wed, 26 Nov 2025 10:40:08 +0100
Message-ID: <20251126094626.41985-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126094626.41985-1-tzimmermann@suse.de>
References: <20251126094626.41985-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 546245BE14
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Move the format conversion of the cursor framebuffer into the new
helper ast_cursor_plane_get_argb4444(). It returns a buffer in system
memory, which the atomic_update handler copies to video memory.

The returned buffer is either the GEM buffer itself, or a temporary
copy within the plane in ARGB4444 format.

As a small change, list supported formats explicitly in the switch
statement. Do not assume ARGB8888 input by default. The cursor
framebuffer knows its format, so should we.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 62 ++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 2d3ad7610c2e..24d696df8fcd 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -181,6 +181,38 @@ static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
+static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_cursor_plane,
+					       struct drm_shadow_plane_state *shadow_plane_state,
+					       const struct drm_rect *clip)
+{
+	struct drm_plane_state *plane_state = &shadow_plane_state->base;
+	struct drm_framebuffer *fb = plane_state->fb;
+	u8 *argb4444 = NULL;
+
+	switch (fb->format->format) {
+	case DRM_FORMAT_ARGB4444:
+		argb4444 = shadow_plane_state->data[0].vaddr;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		{
+			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
+			};
+			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+				AST_HWC_PITCH,
+			};
+
+			drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
+						    shadow_plane_state->data, fb, clip,
+						    &shadow_plane_state->fmtcnv_state);
+			argb4444 = argb4444_dst[0].vaddr;
+		}
+		break;
+	}
+
+	return argb4444;
+}
+
 static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 						  struct drm_atomic_state *state)
 {
@@ -205,29 +237,13 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	 */
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
-		u8 *argb4444;
-
-		switch (fb->format->format) {
-		case DRM_FORMAT_ARGB4444:
-			argb4444 = shadow_plane_state->data[0].vaddr;
-			break;
-		default:
-			argb4444 = ast_cursor_plane->argb4444;
-			{
-				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
-					IOSYS_MAP_INIT_VADDR(argb4444),
-				};
-				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-					AST_HWC_PITCH,
-				};
-
-				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
-							    shadow_plane_state->data, fb, &damage,
-							    &shadow_plane_state->fmtcnv_state);
-			}
-			break;
-		}
-		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
+		const u8 *argb4444 = ast_cursor_plane_get_argb4444(ast_cursor_plane,
+								   shadow_plane_state,
+								   &damage);
+
+		if (argb4444)
+			ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
+
 		ast_set_cursor_base(ast, dst_off);
 	}
 
-- 
2.51.1

