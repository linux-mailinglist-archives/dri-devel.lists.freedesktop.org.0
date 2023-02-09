Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D2D690D33
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB8210E20D;
	Thu,  9 Feb 2023 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F6410EB20
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E0213761F;
 Thu,  9 Feb 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCEzmGhsc+75FZlDs/PnFpAmfNT3pnivSMICeM2SZI8=;
 b=0SDzC923mofT2m12hcY5yeP/MvEkWSu/8tdLySsiBScs1ibc5fPiHHoTUbioo4wQwPY1Nf
 oGQVjdmOubIqefmj/5iAE84/Vgo6NTKJMAe0PqEYtXkwnneMOKcqR6ar2/AxnqVbqop8oT
 42yoEEbmUo1i0UI3GgzuTazUbZB8qRQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCEzmGhsc+75FZlDs/PnFpAmfNT3pnivSMICeM2SZI8=;
 b=A/4tVjF1DgYt8mXmZeKS3Jqj3LiejS2tGGWlQWb8lWBQdKDc531vimOhdvlqyzFLRBACoJ
 ZDNQHTsDtCrbecBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D640F1339E;
 Thu,  9 Feb 2023 15:41:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cDlpMxUU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 2/6] drm/ast: Implement struct
 drm_plane_helper_funcs.atomic_enable
Date: Thu,  9 Feb 2023 16:41:03 +0100
Message-Id: <20230209154107.30680-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209154107.30680-1-tzimmermann@suse.de>
References: <20230209154107.30680-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable the primary plane for ast hardware via atomic_enable. Atomic
helpers invoke this callback only when the plane becomes active.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index dcb8ced4ce75..7e8a6a39de35 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -672,17 +672,28 @@ static void ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
 
 	/*
 	 * Some BMCs stop scanning out the video signal after the driver
-	 * reprogrammed the offset or scanout address. This stalls display
-	 * output for several seconds and makes the display unusable.
-	 * Therefore only update the offset if it changes and reprogram the
-	 * address after enabling the plane.
+	 * reprogrammed the offset. This stalls display output for several
+	 * seconds and makes the display unusable. Therefore only update
+	 * the offset if it changes.
 	 */
 	if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
 		ast_set_offset_reg(ast, fb);
-	if (!old_fb) {
-		ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
-		ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
-	}
+}
+
+static void ast_primary_plane_helper_atomic_enable(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+	struct ast_private *ast = to_ast_private(plane->dev);
+	struct ast_plane *ast_plane = to_ast_plane(plane);
+
+	/*
+	 * Some BMCs stop scanning out the video signal after the driver
+	 * reprogrammed the scanout address. This stalls display
+	 * output for several seconds and makes the display unusable.
+	 * Therefore only reprogram the address after enabling the plane.
+	 */
+	ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
+	ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
 }
 
 static void ast_primary_plane_helper_atomic_disable(struct drm_plane *plane,
@@ -697,6 +708,7 @@ static const struct drm_plane_helper_funcs ast_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = ast_primary_plane_helper_atomic_check,
 	.atomic_update = ast_primary_plane_helper_atomic_update,
+	.atomic_enable = ast_primary_plane_helper_atomic_enable,
 	.atomic_disable = ast_primary_plane_helper_atomic_disable,
 };
 
-- 
2.39.1

