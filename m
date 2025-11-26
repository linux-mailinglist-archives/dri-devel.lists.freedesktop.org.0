Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2C8C890DF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A55A710E58F;
	Wed, 26 Nov 2025 09:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC1D10E58A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:46:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7CC9222D80;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AF473EA65;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oGvGFH3MJmnQJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 09:46:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm/ast: Support cursor buffers objects in I/O memory
Date: Wed, 26 Nov 2025 10:40:09 +0100
Message-ID: <20251126094626.41985-3-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 7CC9222D80
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

Copy the ARGB4444 cursor buffer to system memory if it is located in
I/O memory. While this cannot happen with ast's native GEM objects, an
imported buffer object might be on the external device's I/O memory.

If the cursor buffer is located in system memory continue to use it
directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 24d696df8fcd..8d473ed2738c 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -191,7 +191,20 @@ static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_ARGB4444:
-		argb4444 = shadow_plane_state->data[0].vaddr;
+		if (shadow_plane_state->data[0].is_iomem) {
+			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
+			};
+			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+				AST_HWC_PITCH,
+			};
+
+			drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
+				      shadow_plane_state->data, fb, clip);
+			argb4444 = argb4444_dst[0].vaddr;
+		} else {
+			argb4444 = shadow_plane_state->data[0].vaddr;
+		}
 		break;
 	case DRM_FORMAT_ARGB8888:
 		{
-- 
2.51.1

