Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D15A382E2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 13:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA3B10E450;
	Mon, 17 Feb 2025 12:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VQGobn2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaBj9WCB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VQGobn2f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PaBj9WCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE1B10E44E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:23:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0A878211C9;
 Mon, 17 Feb 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAiVwuRoYnIxGfrV271NE/BpFEn2KCAPlJzEbkHxYP0=;
 b=VQGobn2fLDV4SD8UYdR5H973i/cjwiLHXBh6nxcwoEe0E04+Dh7GRwBRxIT0kqPQGAMQyQ
 r5Ul7ZyHyEBbexSfiULvtWRzU8Ulw/gEIdW4MPDaUAHiqc0Z2zYb00mw0fPApufgRM47tl
 G+unb9dFV3nzf1eTpZbdESnLPekGVrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAiVwuRoYnIxGfrV271NE/BpFEn2KCAPlJzEbkHxYP0=;
 b=PaBj9WCBVq4ngW9hwUG2UcImOK8KDZm6ucATlZAX80M+h9bFDtCN32yNb3XpDFwSm4pSRR
 LtEvZMZdiSosQxBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1739795022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAiVwuRoYnIxGfrV271NE/BpFEn2KCAPlJzEbkHxYP0=;
 b=VQGobn2fLDV4SD8UYdR5H973i/cjwiLHXBh6nxcwoEe0E04+Dh7GRwBRxIT0kqPQGAMQyQ
 r5Ul7ZyHyEBbexSfiULvtWRzU8Ulw/gEIdW4MPDaUAHiqc0Z2zYb00mw0fPApufgRM47tl
 G+unb9dFV3nzf1eTpZbdESnLPekGVrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1739795022;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZAiVwuRoYnIxGfrV271NE/BpFEn2KCAPlJzEbkHxYP0=;
 b=PaBj9WCBVq4ngW9hwUG2UcImOK8KDZm6ucATlZAX80M+h9bFDtCN32yNb3XpDFwSm4pSRR
 LtEvZMZdiSosQxBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA408133F9;
 Mon, 17 Feb 2025 12:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UE//M00qs2cwdwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Feb 2025 12:23:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/4] drm/ast: cursor: Add support for ARGB4444
Date: Mon, 17 Feb 2025 13:22:06 +0100
Message-ID: <20250217122336.230067-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217122336.230067-1-tzimmermann@suse.de>
References: <20250217122336.230067-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
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
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 8ab006e6bc32..91da54a4d8a6 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -720,6 +720,7 @@ static void ast_set_cursor_enabled(struct ast_device *ast, bool enabled)
 }
 
 static const uint32_t ast_cursor_plane_formats[] = {
+	DRM_FORMAT_ARGB4444,
 	DRM_FORMAT_ARGB8888,
 };
 
@@ -771,17 +772,28 @@ static void ast_cursor_plane_helper_atomic_update(struct drm_plane *plane,
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

