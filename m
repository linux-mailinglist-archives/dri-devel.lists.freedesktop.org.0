Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4E9A21A82
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 10:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2753D10E782;
	Wed, 29 Jan 2025 09:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="UKnJGW4n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LclRhaBD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UKnJGW4n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LclRhaBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B78610E77A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 09:58:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DE871F383;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9KaW43219GMNBQkmx3fR/gT9UwAzcjrApCQP+Wgux0=;
 b=UKnJGW4nOZ0oV0R5OqdEiXT4KYWkjZpy69N6+MLvs1Gsn6s1UDdSvLBRB+XOdZOfH65fqB
 MYQSSXJ5n/nUkAC2UxhCuYlKhv+sSrNK+3AlmIbN53G9qsk6kIu30ljUj7o240o2ODWktx
 uAV2/eOhf8UvDaMHYTwAnJ6SoIu25t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9KaW43219GMNBQkmx3fR/gT9UwAzcjrApCQP+Wgux0=;
 b=LclRhaBDNAI/s4Mearahz4XVHkZ3souYw9VL6L8OAKGNCfXfhEnll1oWP8p30KPPv6qT2s
 xAkDJz93DgUFKwAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738144727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9KaW43219GMNBQkmx3fR/gT9UwAzcjrApCQP+Wgux0=;
 b=UKnJGW4nOZ0oV0R5OqdEiXT4KYWkjZpy69N6+MLvs1Gsn6s1UDdSvLBRB+XOdZOfH65fqB
 MYQSSXJ5n/nUkAC2UxhCuYlKhv+sSrNK+3AlmIbN53G9qsk6kIu30ljUj7o240o2ODWktx
 uAV2/eOhf8UvDaMHYTwAnJ6SoIu25t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738144727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9KaW43219GMNBQkmx3fR/gT9UwAzcjrApCQP+Wgux0=;
 b=LclRhaBDNAI/s4Mearahz4XVHkZ3souYw9VL6L8OAKGNCfXfhEnll1oWP8p30KPPv6qT2s
 xAkDJz93DgUFKwAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 178FF13AA6;
 Wed, 29 Jan 2025 09:58:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KDgjBNf7mWflDQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jan 2025 09:58:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/16] drm/ast: Rename support_wide_screen to
 support_wsxga_p
Date: Wed, 29 Jan 2025 10:54:49 +0100
Message-ID: <20250129095840.20629-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129095840.20629-1-tzimmermann@suse.de>
References: <20250129095840.20629-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
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

The flag support_wide_screen in struct ast_device selects devices that
support resolutions of at least 1680x1050 (WSXGA+). Name it accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  2 +-
 drivers/gpu/drm/ast/ast_main.c | 16 ++++++++--------
 drivers/gpu/drm/ast/ast_mode.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index cf9edef8fca66..ec5b204be1dae 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -205,7 +205,7 @@ struct ast_device {
 		} astdp;
 	} output;
 
-	bool support_wide_screen;
+	bool support_wsxga_p; /* 1680x1050 */
 
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 2a813f0128eb8..1cfbe404e5a0a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -43,24 +43,24 @@ static void ast_detect_widescreen(struct ast_device *ast)
 	/* Check if we support wide screen */
 	switch (AST_GEN(ast)) {
 	case 1:
-		ast->support_wide_screen = false;
+		ast->support_wsxga_p = false;
 		break;
 	default:
 		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
 		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-			ast->support_wide_screen = true;
+			ast->support_wsxga_p = true;
 		else {
-			ast->support_wide_screen = false;
+			ast->support_wsxga_p = false;
 			if (ast->chip == AST1300)
-				ast->support_wide_screen = true;
+				ast->support_wsxga_p = true;
 			if (ast->chip == AST1400)
-				ast->support_wide_screen = true;
+				ast->support_wsxga_p = true;
 			if (ast->chip == AST2510)
-				ast->support_wide_screen = true;
+				ast->support_wsxga_p = true;
 			if (IS_AST_GEN7(ast))
-				ast->support_wide_screen = true;
+				ast->support_wsxga_p = true;
 		}
 		break;
 	}
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index b533eb6e233ed..d1b3136b37693 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1024,7 +1024,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 	enum drm_mode_status status;
 	uint32_t jtemp;
 
-	if (ast->support_wide_screen) {
+	if (ast->support_wsxga_p) {
 		if ((mode->hdisplay == 1680) && (mode->vdisplay == 1050))
 			return MODE_OK;
 		if ((mode->hdisplay == 1280) && (mode->vdisplay == 800))
-- 
2.48.1

