Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD40A23B4D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77E310E1A2;
	Fri, 31 Jan 2025 09:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="faN2eLOh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnNvDcDJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="faN2eLOh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FnNvDcDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EDE10E0F1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:23:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2530921174;
 Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h02TTdtLsrjOLsINoL8WlORBYnnIOWi3b9lDPZySEXQ=;
 b=faN2eLOhMIniENGthD0C3BgcfcGEeuLeee5NnvGJxvphTuYD5raGTWgT6Jzg9EUoyHGhHq
 FfZDiSXk2NwRRdu3RZ2puvDnUFRnrVUB0BiPC7Tt0MTbWX/s+nE0fpB45E3EBAOSqYKjzb
 269jqGcO634rJfZqtZc0IG+rToTRZB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h02TTdtLsrjOLsINoL8WlORBYnnIOWi3b9lDPZySEXQ=;
 b=FnNvDcDJrItcKLdtR59Ot/Wy+T/jxGNDcJTqly/4mKYIV7les6dRA9LM7KhR0SqK036aZ3
 H+zstFPVwD45U4AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738315383; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h02TTdtLsrjOLsINoL8WlORBYnnIOWi3b9lDPZySEXQ=;
 b=faN2eLOhMIniENGthD0C3BgcfcGEeuLeee5NnvGJxvphTuYD5raGTWgT6Jzg9EUoyHGhHq
 FfZDiSXk2NwRRdu3RZ2puvDnUFRnrVUB0BiPC7Tt0MTbWX/s+nE0fpB45E3EBAOSqYKjzb
 269jqGcO634rJfZqtZc0IG+rToTRZB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738315383;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h02TTdtLsrjOLsINoL8WlORBYnnIOWi3b9lDPZySEXQ=;
 b=FnNvDcDJrItcKLdtR59Ot/Wy+T/jxGNDcJTqly/4mKYIV7les6dRA9LM7KhR0SqK036aZ3
 H+zstFPVwD45U4AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01DEB1364B;
 Fri, 31 Jan 2025 09:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GHbXOnaWnGd+GwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 09:23:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 04/16] drm/ast: Reorganize widescreen test around hardware
 Gens
Date: Fri, 31 Jan 2025 10:21:04 +0100
Message-ID: <20250131092257.115596-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131092257.115596-1-tzimmermann@suse.de>
References: <20250131092257.115596-1-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
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

Testing for support of widescreen modes mixes up various hardware
Gens. First branch by hardware Gen, then do specific tests for each
Gen. By default, widesscreen support is disabled.

Later patches will add more specific tests for each Gen.

v2:
- move shared detection code into helper (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 54 ++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 1cfbe404e5a0a..93ae9a275c960 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -36,33 +36,43 @@
 
 #include "ast_drv.h"
 
+/* Try to detect WSXGA+ on Gen2+ */
+static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
+{
+	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
+
+	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+		return true;
+	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+		return true;
+
+	return false;
+}
+
 static void ast_detect_widescreen(struct ast_device *ast)
 {
-	u8 vgacrd0;
+	ast->support_wsxga_p = false;
 
-	/* Check if we support wide screen */
-	switch (AST_GEN(ast)) {
-	case 1:
-		ast->support_wsxga_p = false;
-		break;
-	default:
-		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
-		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
+	if (AST_GEN(ast) >= 7) {
+		ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 6) {
+		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
-		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
+		else if (ast->chip == AST2510)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 5) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		else if (ast->chip == AST1400)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 4) {
+		if (__ast_2100_detect_wsxga_p(ast))
+			ast->support_wsxga_p = true;
+		else if (ast->chip == AST1300)
+			ast->support_wsxga_p = true;
+	} else if (AST_GEN(ast) >= 2) {
+		if (__ast_2100_detect_wsxga_p(ast))
 			ast->support_wsxga_p = true;
-		else {
-			ast->support_wsxga_p = false;
-			if (ast->chip == AST1300)
-				ast->support_wsxga_p = true;
-			if (ast->chip == AST1400)
-				ast->support_wsxga_p = true;
-			if (ast->chip == AST2510)
-				ast->support_wsxga_p = true;
-			if (IS_AST_GEN7(ast))
-				ast->support_wsxga_p = true;
-		}
-		break;
 	}
 }
 
-- 
2.48.1

