Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FE5B59C2A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFF510E383;
	Tue, 16 Sep 2025 15:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xtPYLxLp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oeglol0w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xtPYLxLp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Oeglol0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855CA10E389
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FF141F78A;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wsdf/kw73g5fK5pfsbzzmKg4N/PKpnX7K3iXf/LBA=;
 b=xtPYLxLpzN61WnR7Cghpnn7svrHxw52mzDeMQZAZ8vte72NE+deEnHJRTtf3UgZcKe0oln
 gX2gEy/Ci/exeaGiMKMSo13cGxagBDTbdu3KezM+SEAPgEqW5Hhp8nouRjbVUsYDOdkodp
 7+gqXQkN8d35OndTtlcpUOtYNqoFaBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wsdf/kw73g5fK5pfsbzzmKg4N/PKpnX7K3iXf/LBA=;
 b=Oeglol0wbFder6OXrb5aUKsAeQzATQ1G06n++1vKgJmQGB/gfAJSO3j5HWh3IwQBLcXzUu
 RUv9PV92HnA5laCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wsdf/kw73g5fK5pfsbzzmKg4N/PKpnX7K3iXf/LBA=;
 b=xtPYLxLpzN61WnR7Cghpnn7svrHxw52mzDeMQZAZ8vte72NE+deEnHJRTtf3UgZcKe0oln
 gX2gEy/Ci/exeaGiMKMSo13cGxagBDTbdu3KezM+SEAPgEqW5Hhp8nouRjbVUsYDOdkodp
 7+gqXQkN8d35OndTtlcpUOtYNqoFaBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/wsdf/kw73g5fK5pfsbzzmKg4N/PKpnX7K3iXf/LBA=;
 b=Oeglol0wbFder6OXrb5aUKsAeQzATQ1G06n++1vKgJmQGB/gfAJSO3j5HWh3IwQBLcXzUu
 RUv9PV92HnA5laCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 17C74139CB;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qOGjBMKDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/12] drm/ast: Move mode-detection helpers to Gen2 source
 files
Date: Tue, 16 Sep 2025 17:26:12 +0200
Message-ID: <20250916153239.308027-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916153239.308027-1-tzimmermann@suse.de>
References: <20250916153239.308027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80
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

Wide-screen modes are only available on Gen2 and later. Move the
detection helpers to the appropriate source file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2100.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.h  |  2 ++
 drivers/gpu/drm/ast/ast_main.c | 27 ---------------------------
 3 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2100.c b/drivers/gpu/drm/ast/ast_2100.c
index 829e3b8b0d19..16a279ec8351 100644
--- a/drivers/gpu/drm/ast/ast_2100.c
+++ b/drivers/gpu/drm/ast/ast_2100.c
@@ -386,3 +386,34 @@ int ast_2100_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Widescreen detection
+ */
+
+/* Try to detect WSXGA+ on Gen2+ */
+bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
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
+/* Try to detect WUXGA on Gen2+ */
+bool __ast_2100_detect_wuxga(struct ast_device *ast)
+{
+	u8 vgacrd1;
+
+	if (ast->support_fullhd) {
+		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
+		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
+			return true;
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 482d1eb79d64..c75600981251 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -421,6 +421,8 @@ extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
+bool __ast_2100_detect_wsxga_p(struct ast_device *ast);
+bool __ast_2100_detect_wuxga(struct ast_device *ast);
 
 /* ast_2300.c */
 int ast_2300_post(struct ast_device *ast);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 3eea6a6cdacd..1678845274c7 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -36,33 +36,6 @@
 
 #include "ast_drv.h"
 
-/* Try to detect WSXGA+ on Gen2+ */
-static bool __ast_2100_detect_wsxga_p(struct ast_device *ast)
-{
-	u8 vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
-
-	if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
-		return true;
-	if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
-		return true;
-
-	return false;
-}
-
-/* Try to detect WUXGA on Gen2+ */
-static bool __ast_2100_detect_wuxga(struct ast_device *ast)
-{
-	u8 vgacrd1;
-
-	if (ast->support_fullhd) {
-		vgacrd1 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd1);
-		if (!(vgacrd1 & AST_IO_VGACRD1_SUPPORTS_WUXGA))
-			return true;
-	}
-
-	return false;
-}
-
 static void ast_detect_widescreen(struct ast_device *ast)
 {
 	ast->support_wsxga_p = false;
-- 
2.51.0

