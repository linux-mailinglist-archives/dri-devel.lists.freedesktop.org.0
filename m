Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4550BB59C30
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 17:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6598210E386;
	Tue, 16 Sep 2025 15:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="abdyJy55";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwCivGV/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="abdyJy55";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwCivGV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7503610E386
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 15:35:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 18B0E1F79F;
 Tue, 16 Sep 2025 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5UAZqhXB3ctuYN5uY3e0kIedx9BoLYB9DIEz6ELcj4=;
 b=abdyJy55nAbWNWTioOH9je1hcv7MttgA0eajtLlH40e2FiiTAuI1liaU7xdatP9ibd+zfv
 yg7Qbqj/v8kF/enpQBpKTWgpJ+LJe/7MKKteLrZDSDAVkna9VQ9kAtIz37lA34OW1FS+KF
 BKzp3XMfuXWbC0Jz9dvCJdbAijR+m3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5UAZqhXB3ctuYN5uY3e0kIedx9BoLYB9DIEz6ELcj4=;
 b=IwCivGV/0jtITQE5fsTDrS0+M/Whjw22EqI8w8RofPLboioX9NNlPWfwPqKdpYo+ud9eIa
 j8NqYzTOMqothzAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758036931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5UAZqhXB3ctuYN5uY3e0kIedx9BoLYB9DIEz6ELcj4=;
 b=abdyJy55nAbWNWTioOH9je1hcv7MttgA0eajtLlH40e2FiiTAuI1liaU7xdatP9ibd+zfv
 yg7Qbqj/v8kF/enpQBpKTWgpJ+LJe/7MKKteLrZDSDAVkna9VQ9kAtIz37lA34OW1FS+KF
 BKzp3XMfuXWbC0Jz9dvCJdbAijR+m3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758036931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5UAZqhXB3ctuYN5uY3e0kIedx9BoLYB9DIEz6ELcj4=;
 b=IwCivGV/0jtITQE5fsTDrS0+M/Whjw22EqI8w8RofPLboioX9NNlPWfwPqKdpYo+ud9eIa
 j8NqYzTOMqothzAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D34C513AA4;
 Tue, 16 Sep 2025 15:35:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8IlsMsKDyWjFPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Sep 2025 15:35:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/12] drm/ast: Move Gen1 device initialization into separate
 helper
Date: Tue, 16 Sep 2025 17:26:15 +0200
Message-ID: <20250916153239.308027-6-tzimmermann@suse.de>
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

Split off device initialization for Gen1 hardware into the helpers
ast_2000_device_create() and ast_2000_detect_wide_screen(). The new
functions are duplicates form their counterparts in ast_main.c, but
stripped from most non-Gen1 support.

Simplifies maintenance as the driver's number of supported hardware
generations grows.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_2000.c | 50 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/ast/ast_drv.c  |  4 +++
 drivers/gpu/drm/ast/ast_drv.h  |  7 +++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_2000.c b/drivers/gpu/drm/ast/ast_2000.c
index 63fad9fbf519..369ecd98e039 100644
--- a/drivers/gpu/drm/ast/ast_2000.c
+++ b/drivers/gpu/drm/ast/ast_2000.c
@@ -27,6 +27,9 @@
  */
 
 #include <linux/delay.h>
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
 
 #include "ast_drv.h"
 #include "ast_post.h"
@@ -207,3 +210,50 @@ void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post)
 
 	__ast_device_set_tx_chip(ast, tx_chip);
 }
+
+static void ast_2000_detect_widescreen(struct ast_device *ast)
+{
+	ast->support_wsxga_p = false;
+	ast->support_fullhd = false;
+	ast->support_wuxga = false;
+}
+
+struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post)
+{
+	struct drm_device *dev;
+	struct ast_device *ast;
+	int ret;
+
+	ast = devm_drm_dev_alloc(&pdev->dev, drv, struct ast_device, base);
+	if (IS_ERR(ast))
+		return ERR_CAST(ast);
+	dev = &ast->base;
+
+	ast_device_init(ast, chip, config_mode, regs, ioregs);
+
+	ast_2000_detect_tx_chip(ast, need_post);
+
+	if (need_post) {
+		ret = ast_post_gpu(ast);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	ret = ast_mm_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ast_2000_detect_widescreen(ast);
+
+	ret = ast_mode_config_init(ast);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dev;
+}
diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
index a1b3c25ded20..3fecdc0fc7f7 100644
--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -382,6 +382,10 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	chip_gen = ret;
 
 	switch (chip_gen) {
+	case 1:
+		drm = ast_2000_device_create(pdev, &ast_driver, chip, config_mode,
+					     regs, ioregs, need_post);
+		break;
 	default:
 		drm = ast_device_create(pdev, &ast_driver, chip, config_mode, regs, ioregs,
 					need_post);
diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 8868cbdd99d0..369abdd81bbf 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -427,6 +427,13 @@ void __ast_device_set_tx_chip(struct ast_device *ast, enum ast_tx_chip tx_chip);
 int ast_2000_post(struct ast_device *ast);
 extern const struct ast_vbios_dclk_info ast_2000_dclk_table[];
 void ast_2000_detect_tx_chip(struct ast_device *ast, bool need_post);
+struct drm_device *ast_2000_device_create(struct pci_dev *pdev,
+					  const struct drm_driver *drv,
+					  enum ast_chip chip,
+					  enum ast_config_mode config_mode,
+					  void __iomem *regs,
+					  void __iomem *ioregs,
+					  bool need_post);
 
 /* ast_2100.c */
 int ast_2100_post(struct ast_device *ast);
-- 
2.51.0

