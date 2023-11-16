Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6263D7EDE1D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C2410E2D0;
	Thu, 16 Nov 2023 10:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D848B10E2C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63E672293E;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuIFSWk/yqo2j1BntiYvSg9SgraM3c/kLa1oadwxtto=;
 b=DTdOoa6u1pml/iUl610WmYzQWWnWuNtqg8J9TDe2jDEKc73PNwIjR6gfgGVZ3hkNjCvwQc
 KIlHZvIBQC9DOSMe0pzw06/CDRerC/EfIusA5OhXKiK8J1oG7c//7IHbgZ7Wl3c92DEJ1O
 P0Ebw/6o5Y37fcRWQzUTtYqnitRkT6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuIFSWk/yqo2j1BntiYvSg9SgraM3c/kLa1oadwxtto=;
 b=3a3Tcz39owglhXPl2t3cU1BZjDxL2BqvvZTMRNGXG7j2cVXnupeZnWORA+K1s42uXd/cRP
 dzgeVVd1TqWqNHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A74113A67;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4A1zDcLoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 03/10] drm/ast: Retrieve I/O-memory ranges without ast
 device
Date: Thu, 16 Nov 2023 10:59:22 +0100
Message-ID: <20231116100240.22975-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116100240.22975-1-tzimmermann@suse.de>
References: <20231116100240.22975-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ****
X-Spam-Score: 4.80
X-Spamd-Result: default: False [4.80 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; BAYES_SPAM(5.10)[100.00%];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; R_MISSING_CHARSET(2.50)[];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
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

Read the I/O-memory ranges into local variables before setting
them in the ast device instanace. We'll later need this to split
detecting the device type from the creation of the ast device
instance.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 70e1871dbaf94..026ef893dd509 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -432,6 +432,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	struct ast_device *ast;
 	bool need_post = false;
 	int ret = 0;
+	void __iomem *regs;
+	void __iomem *ioregs;
 
 	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
 	if (IS_ERR(ast))
@@ -440,8 +442,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 	pci_set_drvdata(pdev, dev);
 
-	ast->regs = pcim_iomap(pdev, 1, 0);
-	if (!ast->regs)
+	regs = pcim_iomap(pdev, 1, 0);
+	if (!regs)
 		return ERR_PTR(-EIO);
 
 	if (pdev->revision >= 0x40) {
@@ -455,7 +457,7 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
 			return ERR_PTR(-EIO);
-		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+		ioregs = regs + AST_IO_MM_OFFSET;
 	} else if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
 		/*
 		 * Map I/O registers if we have a PCI BAR for I/O.
@@ -464,8 +466,8 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 
 		if (len < AST_IO_MM_LENGTH)
 			return -EIO;
-		ast->ioregs = pcim_iomap(pdev, 2, 0);
-		if (!ast->ioregs)
+		ioregs = pcim_iomap(pdev, 2, 0);
+		if (!ioregs)
 			return ERR_PTR(-EIO);
 	} else {
 		/*
@@ -477,11 +479,14 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 			return ERR_PTR(-EIO);
 		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
 			return ERR_PTR(-EIO);
-		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+		ioregs = regs + AST_IO_MM_OFFSET;
 
 		drm_info(dev, "Platform has no I/O space, using MMIO\n");
 	}
 
+	ast->regs = regs;
+	ast->ioregs = ioregs;
+
 	if (!ast_is_vga_enabled(dev)) {
 		drm_info(dev, "VGA not enabled on entry, requesting chip POST\n");
 		need_post = true;
-- 
2.42.0

