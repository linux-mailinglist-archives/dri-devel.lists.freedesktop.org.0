Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA17EDE23
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1AB10E2E0;
	Thu, 16 Nov 2023 10:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0B310E2C7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3D7721BFE;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueZy5kNQYmrD1wyPiDyioFqv/HVPywPGmik1BZqEmgI=;
 b=d7Nt1z7+IPOK2F7lbASgueMzn5lhN803m3VlLk32cIMDJzqAVPw1/xBIRlSIl00ojasHSS
 6to627tlqcmhngXHCK6KbipW7L/l4PK1DxXXG30iFnYYFLEGpb3iE8KvbUibX3f0kTWQYV
 qvYJ13paIu1kRZBVyJ2M+qIrkQSflwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ueZy5kNQYmrD1wyPiDyioFqv/HVPywPGmik1BZqEmgI=;
 b=3zFM744uxGyT9R2+ilOXVjoy5zAgSFZhwOkVJE3qfUhKXWgabjEs0Gq/jqvgiuW6EAHuSG
 Exb8sCZfERqT1jBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9B7E1377E;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WH+ILMLoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 06/10] drm/ast: Enable MMIO without ast device instance
Date: Thu, 16 Nov 2023 10:59:25 +0100
Message-ID: <20231116100240.22975-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116100240.22975-1-tzimmermann@suse.de>
References: <20231116100240.22975-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll have to enable the MMIO access for detecting the ast device
type. Make this work without an instance of the ast device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 16 +++++++++-------
 drivers/gpu/drm/ast/ast_reg.h  |  2 ++
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 82fcee967d984..0173cb44f17de 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -54,19 +54,21 @@ static void ast_enable_vga(void __iomem *ioregs)
  */
 static void ast_enable_mmio_release(void *data)
 {
-	struct ast_device *ast = data;
+	void __iomem *ioregs = (void __force __iomem *)data;
 
 	/* enable standard VGA decode */
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x04);
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1, AST_IO_VGACRA1_MMIO_ENABLED);
 }
 
-static int ast_enable_mmio(struct ast_device *ast)
+static int ast_enable_mmio(struct device *dev, void __iomem *ioregs)
 {
-	struct drm_device *dev = &ast->base;
+	void *data = (void __force *)ioregs;
 
-	ast_set_index_reg(ast, AST_IO_VGACRI, 0xa1, 0x06);
+	__ast_write8_i(ioregs, AST_IO_VGACRI, 0xa1,
+		       AST_IO_VGACRA1_MMIO_ENABLED |
+		       AST_IO_VGACRA1_VGAIO_DISABLED);
 
-	return devm_add_action_or_reset(dev->dev, ast_enable_mmio_release, ast);
+	return devm_add_action_or_reset(dev, ast_enable_mmio_release, data);
 }
 
 static void ast_open_key(void __iomem *ioregs)
@@ -496,7 +498,7 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	/* Enable extended register access */
 	ast_open_key(ioregs);
 
-	ret = ast_enable_mmio(ast);
+	ret = ast_enable_mmio(&pdev->dev, ioregs);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 5258a84ef3a6f..62dddbf3fe569 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -29,6 +29,8 @@
 
 #define AST_IO_VGACRI			(0x54)
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
+#define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
+#define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
 #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
 #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
 
-- 
2.42.0

