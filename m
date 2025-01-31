Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F54A23B60
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859E610EA57;
	Fri, 31 Jan 2025 09:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ooYhZz2V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xRDtrV8Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ooYhZz2V";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xRDtrV8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862B610E169
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51EE21F38F;
 Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFXhQW9SkC8meBig55k3+Uh/ecy1eBIMyR0AwHiWcqA=;
 b=ooYhZz2Vby/SoTjuUpgcgPYkB9NMbG9+Y33Lc/Yw9wN111rE7D/pfQX35ch1VKELGVYXew
 UNPDHqZF9AuLIQKcALRbZ09zxWt+v18T/0j9gs2aM7/t7inyzHLBtnPx3VVKuIbyk0X76g
 owUTyWhkSMb8ChcdeNeZZga2m84ujzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFXhQW9SkC8meBig55k3+Uh/ecy1eBIMyR0AwHiWcqA=;
 b=xRDtrV8Y/9gX15zHBdzfVVuyI8H/qAsKXeHuWvpG63MRsKqzx+OOyhn1GripwYuaFo0OPs
 NXT4DJh+SKfnnOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFXhQW9SkC8meBig55k3+Uh/ecy1eBIMyR0AwHiWcqA=;
 b=ooYhZz2Vby/SoTjuUpgcgPYkB9NMbG9+Y33Lc/Yw9wN111rE7D/pfQX35ch1VKELGVYXew
 UNPDHqZF9AuLIQKcALRbZ09zxWt+v18T/0j9gs2aM7/t7inyzHLBtnPx3VVKuIbyk0X76g
 owUTyWhkSMb8ChcdeNeZZga2m84ujzk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFXhQW9SkC8meBig55k3+Uh/ecy1eBIMyR0AwHiWcqA=;
 b=xRDtrV8Y/9gX15zHBdzfVVuyI8H/qAsKXeHuWvpG63MRsKqzx+OOyhn1GripwYuaFo0OPs
 NXT4DJh+SKfnnOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C393139B1;
 Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QGtkCXeWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 05/16] drm/ast: Add support_fullhd flag to struct ast_device
Date: Fri, 31 Jan 2025 10:21:05 +0100
Message-ID: <20250131092257.115596-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
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

Detect support for 1920x1080 (FullHD) in ast_detect_widescreen(). The
flag is cleared by default. The test logic has been taken from existing
code in ast_crtc_helper_mode_valid(). The code in that function is being
replaced by the new flag.

For Gen3, a new branch duplicates the Gen2 logic and adds a test for
AST2200. Gen2 adds a test for AST2100.

v2:
- use fullhd flag for setting max width/height

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c | 19 +++++++++++++++++++
 drivers/gpu/drm/ast/ast_mode.c | 12 ++----------
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index ec5b204be1dae..01ef0c0d5db7d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -206,6 +206,7 @@ struct ast_device {
 	} output;
 
 	bool support_wsxga_p; /* 1680x1050 */
+	bool support_fullhd; /* 1920x1080 */
 
 	u8 *dp501_fw_addr;
 	const struct firmware *dp501_fw;	/* dp501 fw */
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 93ae9a275c960..6e964a0714b4b 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -52,27 +52,46 @@ static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	ast->support_wsxga_p = false;
+	ast->support_fullhd = false;
 
 	if (AST_GEN(ast) >= 7) {
 		ast->support_wsxga_p = true;
+		ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 6) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST2510)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 5) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1400)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
 	} else if (AST_GEN(ast) >= 4) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
 		else if (ast->chip == AST1300)
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p)
+			ast->support_fullhd = true;
+	} else if (AST_GEN(ast) >= 3) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2200)
+				ast->support_fullhd = true;
+		}
 	} else if (AST_GEN(ast) >= 2) {
 		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
+		if (ast->support_wsxga_p) {
+			if (ast->chip == AST2100)
+				ast->support_fullhd = true;
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index d1b3136b37693..dda2c4fb0a48b 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1036,10 +1036,7 @@ ast_crtc_helper_mode_valid(struct drm_crtc *crtc, const struct drm_display_mode
 		if ((mode->hdisplay == 1600) && (mode->vdisplay == 900))
 			return MODE_OK;
 
-		if ((ast->chip == AST2100) || // GEN2, but not AST1100 (?)
-		    (ast->chip == AST2200) || // GEN3, but not AST2150 (?)
-		    IS_AST_GEN4(ast) || IS_AST_GEN5(ast) ||
-		    IS_AST_GEN6(ast) || IS_AST_GEN7(ast)) {
+		if (ast->support_fullhd) {
 			if ((mode->hdisplay == 1920) && (mode->vdisplay == 1080))
 				return MODE_OK;
 
@@ -1371,12 +1368,7 @@ int ast_mode_config_init(struct ast_device *ast)
 	dev->mode_config.min_height = 0;
 	dev->mode_config.preferred_depth = 24;
 
-	if (ast->chip == AST2100 || // GEN2, but not AST1100 (?)
-	    ast->chip == AST2200 || // GEN3, but not AST2150 (?)
-	    IS_AST_GEN7(ast) ||
-	    IS_AST_GEN6(ast) ||
-	    IS_AST_GEN5(ast) ||
-	    IS_AST_GEN4(ast)) {
+	if (ast->support_fullhd) {
 		dev->mode_config.max_width = 1920;
 		dev->mode_config.max_height = 2048;
 	} else {
-- 
2.48.1

