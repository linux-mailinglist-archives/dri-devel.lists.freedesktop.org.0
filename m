Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91FA34A24
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B55010EB26;
	Thu, 13 Feb 2025 16:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58C10EB28
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:38:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E34821EDF;
 Thu, 13 Feb 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 488CC13A82;
 Thu, 13 Feb 2025 16:38:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YKkTEBsgrmfpFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Feb 2025 16:38:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/ast: cursor: Add support for ARGB4444
Date: Thu, 13 Feb 2025 17:25:48 +0100
Message-ID: <20250213163845.118207-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213163845.118207-1-tzimmermann@suse.de>
References: <20250213163845.118207-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6E34821EDF
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Add support for cursor image data in ARGB4444 format. This is the
hardware's native format and requires no conversion.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index ed00275d6418..4beac9cdfe83 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -718,6 +718,7 @@ static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
 }
 
 static const uint32_t ast_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB8888,
 };
 
@@ -769,17 +770,28 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
 	 */
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, plane_state, &damage)) {
-		u8 *argb4444 = ast_cursor_plane->argb4444;
-		struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
-			IOSYS_MAP_INIT_VADDR(argb4444),
-		};
-		unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-			AST_HWC_PITCH,
-		};
-
-		drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
-					    shadow_plane_state->data, fb, &damage,
-					    &shadow_plane_state->fmtcnv_state);
+		u8 *argb4444;
+
+		switch (fb->format->format) {
+		case DRM_FORMAT_ARGB4444:
+			argb4444 = shadow_plane_state->data[0].vaddr;
+			break;
+		default:
+			argb4444 = ast_cursor_plane->argb4444;
+			{
+				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+					IOSYS_MAP_INIT_VADDR(argb4444),
+				};
+				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+					AST_HWC_PITCH,
+				};
+
+				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
+							    shadow_plane_state->data, fb, &damage,
+							    &shadow_plane_state->fmtcnv_state);
+			}
+			break;
+		}
 		ast_set_cursor_image(ast, argb4444, fb->width, fb->height);
 		ast_set_cursor_base(ast, dst_off);
 	}
-- 
2.48.1

