Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30EB59C2C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C0410E37C;
	Tue, 16 Sep 2025 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Ovh887b8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4EvnXQeR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ovh887b8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4EvnXQeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF5F10E386
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E8951F78C;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9CJXaesNm3p94lr7apHDFnjXQZxfyYfTXpPlpNOxgs=;
 b=Ovh887b85TkB0DvO8ZgMFvnlyz7ykk1zVFKVv9BalElNX3VKejehSyM7YrJMKMpMzCbhYR
 Js1FhqNevXQZMiO7Omi4aid79uYEtE+GSm6XGVva9NN8zyF06zTss1zRtXb7h7KpWu+Giy
 l711dMMXQmF2Xhgkt+QzCdscF7rEqj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9CJXaesNm3p94lr7apHDFnjXQZxfyYfTXpPlpNOxgs=;
 b=4EvnXQeRX0yexp8cpT7nKenb+J9LXuqpqAwKtN8XeHqhX8hGM03WGjaW31sxGB4f/ZKOq/
 TMyrTKPYwL8XExDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ovh887b8;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4EvnXQeR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9CJXaesNm3p94lr7apHDFnjXQZxfyYfTXpPlpNOxgs=;
 b=Ovh887b85TkB0DvO8ZgMFvnlyz7ykk1zVFKVv9BalElNX3VKejehSyM7YrJMKMpMzCbhYR
 Js1FhqNevXQZMiO7Omi4aid79uYEtE+GSm6XGVva9NN8zyF06zTss1zRtXb7h7KpWu+Giy
 l711dMMXQmF2Xhgkt+QzCdscF7rEqj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9CJXaesNm3p94lr7apHDFnjXQZxfyYfTXpPlpNOxgs=;
 b=4EvnXQeRX0yexp8cpT7nKenb+J9LXuqpqAwKtN8XeHqhX8hGM03WGjaW31sxGB4f/ZKOq/
 TMyrTKPYwL8XExDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5756213AA4;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iLXqE8KDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/12] drm/ast: Split ast_detect_tx_chip() per chip generation
Date: Tue, 16 Sep 2025 17:26:13 +0200
Message-ID: <20250916153239.308027-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916153239.308027-1-tzimmermann@suse.de>
References: <20250916153239.308027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8E8951F78C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

Gen4 and later models detect the TX chip from VGACRD1, while earlier
models detect from VGACRA3. Split up the detection helper into
two separate helpers. Use SZ_ constants instead of plain numbers.

Then inline the call into its only caller ast_device_create(). When
ast_device_create() gets split up per Gen, either call will remain.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 26 ++++++++++
 drivers/gpu/drm/ast/ast_2300.c | 68 ++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.c  | 15 ++++++
 drivers/gpu/drm/ast/ast_drv.h  |  5 ++
 drivers/gpu/drm/ast/ast_main.c | 94 ++--------------------------------
 5 files changed, 119 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index a31daf7c2ceb..63fad9fbf519 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -181,3 +181,29 @@ const struct ast_vbios_dclk_info ast_2000_dclk_table[] = {
 	{0x6a, 0x6d, 0x80},			/* 19: VCLK97_75	*/
 	{0x3b, 0x2c, 0x81},			/* 1a: VCLK118_25	*/
 };
+
+/*
+ * Device initialization
+ */
+
+void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
+{
+	enum ast_tx_chip tx_chip = AST_TX_NONE;
+	u8 vgacra3;
+
+	/*
+	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
+	 * enabled, in that case, assume we have a SIL164 TMDS transmitter
+	 *
+	 * Don't make that assumption if we the chip wasn't enabled and
+	 * is at power-on reset, otherwise we'll incorrectly "detect" a
+	 * SIL164 when there is none.
+	 */
+	if (!need_post) {
+		vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
+		if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
+			tx_chip = AST_TX_SIL164;
+	}
+
+	__ast_device_set_tx_chip(ast, tx_chip);
+}
diff --git a/drivers/gpu/drm/ast/ast_2300.c b/drivers/gpu/drm/ast/ast_2300.c
index dc2a32244689..68d269ef9b47 100644
--- a/drivers/gpu/drm/ast/ast_2300.c
+++ b/drivers/gpu/drm/ast/ast_2300.c
@@ -27,6 +27,10 @@
  */
 
 #include <linux/delay.h>
+#include <linux/sizes.h>
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "ast_drv.h"
 #include "ast_post.h"
@@ -1326,3 +1330,67 @@ int ast_2300_post(struct ast_device *ast)
 
 	return 0;
 }
+
+/*
+ * Device initialization
+ */
+
+void ast_2300_detect_tx_chip(struct ast_device *ast)
+{
+	enum ast_tx_chip tx_chip = AST_TX_NONE;
+	struct drm_device *dev = &ast->base;
+	u8 vgacrd1;
+
+	/*
+	 * On AST GEN4+, look at the configuration set by the SoC in
+	 * the SOC scratch register #1 bits 11:8 (interestingly marked
+	 * as "reserved" in the spec)
+	 */
+	vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
+					 AST_IO_VGACRD1_TX_TYPE_MASK);
+	switch (vgacrd1) {
+	/*
+	 * GEN4 to GEN6
+	 */
+	case AST_IO_VGACRD1_TX_SIL164_VBIOS:
+		tx_chip = AST_TX_SIL164;
+		break;
+	case AST_IO_VGACRD1_TX_DP501_VBIOS:
+		ast->dp501_fw_addr = drmm_kzalloc(dev, SZ_32K, GFP_KERNEL);
+		if (ast->dp501_fw_addr) {
+			/* backup firmware */
+			if (ast_backup_fw(ast, ast->dp501_fw_addr, SZ_32K)) {
+				drmm_kfree(dev, ast->dp501_fw_addr);
+				ast->dp501_fw_addr = NULL;
+			}
+		}
+		fallthrough;
+	case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
+		tx_chip = AST_TX_DP501;
+		break;
+	/*
+	 * GEN7+
+	 */
+	case AST_IO_VGACRD1_TX_ASTDP:
+		tx_chip = AST_TX_ASTDP;
+		break;
+	/*
+	 * Several of the listed TX chips are not explicitly supported
+	 * by the ast driver. If these exist in real-world devices, they
+	 * are most likely reported as VGA or SIL164 outputs. We warn here
+	 * to get bug reports for these devices. If none come in for some
+	 * time, we can begin to fail device probing on these values.
+	 */
+	case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
+		drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
+		break;
+	case AST_IO_VGACRD1_TX_CH7003_VBIOS:
+		drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
+		break;
+	case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
+		drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n", vgacrd1, AST_GEN(ast));
+		break;
+	}
+
+	__ast_device_set_tx_chip(ast, tx_chip);
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index 473faa92d08c..c653ea5570d8 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -37,6 +37,7 @@
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
@@ -46,6 +47,20 @@ static int ast_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, ast_modeset, int, 0400);
 
+void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip)
+{
+	static const char * const info_str[] = {
+		"analog VGA",
+		"Sil164 TMDS transmitter",
+		"DP501 DisplayPort transmitter",
+		"ASPEED DisplayPort transmitter",
+	};
+
+	drm_info(&ast->base, "Using %s\n", info_str[tx_chip]);
+
+	ast->tx_chip = tx_chip;
+}
+
 /*
  * DRM driver
  */
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index c75600981251..ae8e6083bc2b 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -415,9 +415,13 @@ struct ast_crtc_state {
 
 int ast_mm_init(struct ast_device *ast);
 
+/* ast_drv.c */
+void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
+
 /* ast_2000.c */
 int ast_2000_post(struct ast_device *ast);
 extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
+void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post);
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
@@ -426,6 +430,7 @@ bool __ast_2100_detect_wuxga(struct ast_device *ast);
 
 /* ast_2300.c */
 int ast_2300_post(struct ast_device *ast);
+void ast_2300_detect_tx_chip(struct ast_device *ast);
 
 /* ast_2500.c */
 void ast_2500_patch_ahb(void __iomem *regs);
diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 1678845274c7..8ed15563173c 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -95,94 +95,6 @@ static void ast_detect_widescreen(struct ast_device *ast)
 	}
 }
 
-static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
-{
-	static const char * const info_str[] = {
-		"analog VGA",
-		"Sil164 TMDS transmitter",
-		"DP501 DisplayPort transmitter",
-		"ASPEED DisplayPort transmitter",
-	};
-
-	struct drm_device *dev = &ast->base;
-	u8 vgacra3, vgacrd1;
-
-	/* Check 3rd Tx option (digital output afaik) */
-	ast->tx_chip = AST_TX_NONE;
-
-	if (AST_GEN(ast) <= 3) {
-		/*
-		 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
-		 * enabled, in that case, assume we have a SIL164 TMDS transmitter
-		 *
-		 * Don't make that assumption if we the chip wasn't enabled and
-		 * is at power-on reset, otherwise we'll incorrectly "detect" a
-		 * SIL164 when there is none.
-		 */
-		if (!need_post) {
-			vgacra3 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
-			if (vgacra3 & AST_IO_VGACRA3_DVO_ENABLED)
-				ast->tx_chip = AST_TX_SIL164;
-		}
-	} else {
-		/*
-		 * On AST GEN4+, look at the configuration set by the SoC in
-		 * the SOC scratch register #1 bits 11:8 (interestingly marked
-		 * as "reserved" in the spec)
-		 */
-		vgacrd1 = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd1,
-						 AST_IO_VGACRD1_TX_TYPE_MASK);
-		switch (vgacrd1) {
-		/*
-		 * GEN4 to GEN6
-		 */
-		case AST_IO_VGACRD1_TX_SIL164_VBIOS:
-			ast->tx_chip = AST_TX_SIL164;
-			break;
-		case AST_IO_VGACRD1_TX_DP501_VBIOS:
-			ast->dp501_fw_addr = drmm_kzalloc(dev, 32*1024, GFP_KERNEL);
-			if (ast->dp501_fw_addr) {
-				/* backup firmware */
-				if (ast_backup_fw(ast, ast->dp501_fw_addr, 32*1024)) {
-					drmm_kfree(dev, ast->dp501_fw_addr);
-					ast->dp501_fw_addr = NULL;
-				}
-			}
-			fallthrough;
-		case AST_IO_VGACRD1_TX_FW_EMBEDDED_FW:
-			ast->tx_chip = AST_TX_DP501;
-			break;
-		/*
-		 * GEN7+
-		 */
-		case AST_IO_VGACRD1_TX_ASTDP:
-			ast->tx_chip = AST_TX_ASTDP;
-			break;
-		/*
-		 * Several of the listed TX chips are not explicitly supported
-		 * by the ast driver. If these exist in real-world devices, they
-		 * are most likely reported as VGA or SIL164 outputs. We warn here
-		 * to get bug reports for these devices. If none come in for some
-		 * time, we can begin to fail device probing on these values.
-		 */
-		case AST_IO_VGACRD1_TX_ITE66121_VBIOS:
-			drm_warn(dev, "ITE IT66121 detected, 0x%x, Gen%lu\n",
-				 vgacrd1, AST_GEN(ast));
-			break;
-		case AST_IO_VGACRD1_TX_CH7003_VBIOS:
-			drm_warn(dev, "Chrontel CH7003 detected, 0x%x, Gen%lu\n",
-				 vgacrd1, AST_GEN(ast));
-			break;
-		case AST_IO_VGACRD1_TX_ANX9807_VBIOS:
-			drm_warn(dev, "Analogix ANX9807 detected, 0x%x, Gen%lu\n",
-				 vgacrd1, AST_GEN(ast));
-			break;
-		}
-	}
-
-	drm_info(dev, "Using %s\n", info_str[ast->tx_chip]);
-}
-
 struct drm_device *ast_device_create(struct pci_dev *pdev,
 				     const struct drm_driver *drv,
 				     enum ast_chip chip,
@@ -205,7 +117,11 @@ struct drm_device *ast_device_create(struct pci_dev *pdev,
 	ast->regs = regs;
 	ast->ioregs = ioregs;
 
-	ast_detect_tx_chip(ast, need_post);
+	if (AST_GEN(ast) >= 4)
+		ast_2300_detect_tx_chip(ast);
+	else
+		ast_2000_detect_tx_chip(ast, need_post);
+
 	switch (ast->tx_chip) {
 	case AST_TX_ASTDP:
 		ret = ast_post_gpu(ast);
-- 
2.51.0

