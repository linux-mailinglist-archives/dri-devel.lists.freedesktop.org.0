Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815FC890DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 10:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D671010E58A;
	Wed, 26 Nov 2025 09:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gX/SWhx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iS9cY2ar";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gX/SWhx8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iS9cY2ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A527810E58B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 09:46:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A6F5B5BE1A;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764150397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=701fttiNb4uFhysg4zn6c/ks8lyiP5hk/A97SA+iBQo=;
 b=gX/SWhx8lYDDgyyVjq0MvsxIWakQBiMdDYhHLx0VIm+lVdctpnXaNgRV/Qc0Rry6/bnvGZ
 9w6XKa6UWYeyVFbWzPX/pdOJHvnP+S4qGzEbo5lQAwC1p3lQ0TNBSL2u1rjLE3I5bYbW+R
 ob6Jskuxd8UJO6Pm9h2Dgcu0LqZdsDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764150397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=701fttiNb4uFhysg4zn6c/ks8lyiP5hk/A97SA+iBQo=;
 b=iS9cY2arbKKVjCpfxBEk6HLoYRJkh/zz0d275oyn/aCOzcoAIN1J1tHHwjlnTIHDKPk1pp
 hfUiUbuJS/6K7wCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764150397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=701fttiNb4uFhysg4zn6c/ks8lyiP5hk/A97SA+iBQo=;
 b=gX/SWhx8lYDDgyyVjq0MvsxIWakQBiMdDYhHLx0VIm+lVdctpnXaNgRV/Qc0Rry6/bnvGZ
 9w6XKa6UWYeyVFbWzPX/pdOJHvnP+S4qGzEbo5lQAwC1p3lQ0TNBSL2u1rjLE3I5bYbW+R
 ob6Jskuxd8UJO6Pm9h2Dgcu0LqZdsDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764150397;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=701fttiNb4uFhysg4zn6c/ks8lyiP5hk/A97SA+iBQo=;
 b=iS9cY2arbKKVjCpfxBEk6HLoYRJkh/zz0d275oyn/aCOzcoAIN1J1tHHwjlnTIHDKPk1pp
 hfUiUbuJS/6K7wCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 840E63EA65;
 Wed, 26 Nov 2025 09:46:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YLcKH33MJmnQJQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 09:46:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/ast: Wrap cursor framebuffer access in
 drm_gem_fb_begin/end_cpu_access()
Date: Wed, 26 Nov 2025 10:40:10 +0100
Message-ID: <20251126094626.41985-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126094626.41985-1-tzimmermann@suse.de>
References: <20251126094626.41985-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 URIBL_BLOCKED(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_THREE(0.00)[4]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Call drm_gem_fb_begin_cpu_access() and drm_gem_fb_end_cpu_access()
around cursor image updates. Imported buffers might have to be
synchronized for CPU access before they can be used.

Ignore errors from drm_gem_fb_begin_cpu_access(). These errors can
often be transitory. The cursor image will be updated on the next
frame. Meanwhile display a white square where the cursor would be.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_cursor.c | 74 +++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/ast_cursor.c
index 8d473ed2738c..30b62d3f0151 100644
--- a/drivers/gpu/drm/ast/ast_cursor.c
+++ b/drivers/gpu/drm/ast/ast_cursor.c
@@ -28,6 +28,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_print.h>
 
 #include "ast_drv.h"
@@ -189,38 +190,49 @@ static const u8 *ast_cursor_plane_get_argb4444(struct ast_cursor_plane *ast_curs
 	struct drm_framebuffer *fb = plane_state->fb;
 	u8 *argb4444 = NULL;
 
-	switch (fb->format->format) {
-	case DRM_FORMAT_ARGB4444:
-		if (shadow_plane_state->data[0].is_iomem) {
-			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
-				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
-			};
-			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-				AST_HWC_PITCH,
-			};
-
-			drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
-				      shadow_plane_state->data, fb, clip);
-			argb4444 = argb4444_dst[0].vaddr;
-		} else {
-			argb4444 = shadow_plane_state->data[0].vaddr;
+	if (drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE) == 0) {
+		switch (fb->format->format) {
+		case DRM_FORMAT_ARGB4444:
+			if (shadow_plane_state->data[0].is_iomem) {
+				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+					IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
+				};
+				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+					AST_HWC_PITCH,
+				};
+
+				drm_fb_memcpy(argb4444_dst, argb4444_dst_pitch,
+					      shadow_plane_state->data, fb, clip);
+				argb4444 = argb4444_dst[0].vaddr;
+			} else {
+				argb4444 = shadow_plane_state->data[0].vaddr;
+			}
+			break;
+		case DRM_FORMAT_ARGB8888:
+			{
+				struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
+					IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
+				};
+				unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
+					AST_HWC_PITCH,
+				};
+
+				drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
+							    shadow_plane_state->data, fb, clip,
+							    &shadow_plane_state->fmtcnv_state);
+				argb4444 = argb4444_dst[0].vaddr;
+			}
+			break;
 		}
-		break;
-	case DRM_FORMAT_ARGB8888:
-		{
-			struct iosys_map argb4444_dst[DRM_FORMAT_MAX_PLANES] = {
-				IOSYS_MAP_INIT_VADDR(ast_cursor_plane->argb4444),
-			};
-			unsigned int argb4444_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
-				AST_HWC_PITCH,
-			};
-
-			drm_fb_argb8888_to_argb4444(argb4444_dst, argb4444_dst_pitch,
-						    shadow_plane_state->data, fb, clip,
-						    &shadow_plane_state->fmtcnv_state);
-			argb4444 = argb4444_dst[0].vaddr;
-		}
-		break;
+
+		drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+	} else {
+		/*
+		 * Fall back to white square if GEM object is not ready. Gives
+		 * the user an indication where the cursor is located.
+		 */
+		memset(ast_cursor_plane->argb4444, 0xff, sizeof(ast_cursor_plane->argb4444));
+		argb4444 = ast_cursor_plane->argb4444;
 	}
 
 	return argb4444;
-- 
2.51.1

