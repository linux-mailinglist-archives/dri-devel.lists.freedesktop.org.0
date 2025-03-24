Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17BA6D7DB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 10:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A655510E2BD;
	Mon, 24 Mar 2025 09:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="PonQqDVV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DM1iaZHM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PonQqDVV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DM1iaZHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA1810E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 09:49:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 20AAD1F38C;
 Mon, 24 Mar 2025 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++fbY6phpkoIhdrqFg8y/yx2zTCg5EYRJALvhI/G0B0=;
 b=PonQqDVVJwKHHiHPXIx/e/5nEaGpN4B/5N2Amm2r3jXtAe0qcfpEjVa7+hpXqQPNsuCefW
 IG0MRqPgRb1AAICf3Hx4LV7fXged597udIiQD/uPjNbESd9CzsQtC3/rox6Xat+3zJmwAx
 yxo63XDx+/Eq3T7Fm3hN81dyvuzff9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++fbY6phpkoIhdrqFg8y/yx2zTCg5EYRJALvhI/G0B0=;
 b=DM1iaZHMTnjDk8mLf3ZZJ7w3xJkUgQaLT/VjMibQQJ13fZ4UoVH6SCZH9ddFYaBhaHG5ma
 ee3Skt80cII/mYAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742809737; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++fbY6phpkoIhdrqFg8y/yx2zTCg5EYRJALvhI/G0B0=;
 b=PonQqDVVJwKHHiHPXIx/e/5nEaGpN4B/5N2Amm2r3jXtAe0qcfpEjVa7+hpXqQPNsuCefW
 IG0MRqPgRb1AAICf3Hx4LV7fXged597udIiQD/uPjNbESd9CzsQtC3/rox6Xat+3zJmwAx
 yxo63XDx+/Eq3T7Fm3hN81dyvuzff9s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742809737;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++fbY6phpkoIhdrqFg8y/yx2zTCg5EYRJALvhI/G0B0=;
 b=DM1iaZHMTnjDk8mLf3ZZJ7w3xJkUgQaLT/VjMibQQJ13fZ4UoVH6SCZH9ddFYaBhaHG5ma
 ee3Skt80cII/mYAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC29813874;
 Mon, 24 Mar 2025 09:48:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OIlbOIgq4Wf3aAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Mar 2025 09:48:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/3] drm/ast: Validate display modes against framebuffer and
 format limits
Date: Mon, 24 Mar 2025 10:44:11 +0100
Message-ID: <20250324094520.192974-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324094520.192974-1-tzimmermann@suse.de>
References: <20250324094520.192974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Reimplement ast_mode_config_mode_valid() with DRM format helpers and
ast's helpers for framebuffer size calculation. Replaces ast's open-
coded assumptions on bpp and page-alignments.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d3ed27faefd1..a9a3252ff3c2 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -51,6 +51,8 @@
 
 #define AST_LUT_SIZE 256
 
+#define AST_PRIMARY_PLANE_MAX_OFFSET	(BIT(16) - 1)
+
 static unsigned long ast_fb_vram_offset(void)
 {
 	return 0; // with shmem, the primary plane is always at offset 0
@@ -960,16 +962,20 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
 static enum drm_mode_status ast_mode_config_mode_valid(struct drm_device *dev,
 						       const struct drm_display_mode *mode)
 {
-	static const unsigned long max_bpp = 4; /* DRM_FORMAT_XRGB8888 */
+	const struct drm_format_info *info = drm_format_info(DRM_FORMAT_XRGB8888);
 	struct ast_device *ast = to_ast_device(dev);
-	unsigned long fbsize, fbpages, max_fbpages;
-
-	max_fbpages = ast_fb_vram_size(ast) >> PAGE_SHIFT;
-
-	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
-	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
-
-	if (fbpages > max_fbpages)
+	unsigned long max_fb_size = ast_fb_vram_size(ast);
+	u64 pitch;
+
+	if (drm_WARN_ON_ONCE(dev, !info))
+		return MODE_ERROR; /* driver bug */
+
+	pitch = drm_format_info_min_pitch(info, 0, mode->hdisplay);
+	if (!pitch)
+		return MODE_BAD_WIDTH;
+	if (pitch > AST_PRIMARY_PLANE_MAX_OFFSET)
+		return MODE_BAD_WIDTH; /* maximum programmable pitch */
+	if (pitch > max_fb_size / mode->vdisplay)
 		return MODE_MEM;
 
 	return MODE_OK;
-- 
2.48.1

