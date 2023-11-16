Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC167EDE17
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCAB10E2CC;
	Thu, 16 Nov 2023 10:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966610E2AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BC022293C;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHzCOwdweIH1YV+N3fC0Nww6zevGieuSBp9BYBtC9hY=;
 b=vN9Z+ThM7GJPY9R2NIhZ9GQcbeXSn2/CqTqhdh0ObR2/gEjxL9E7saW5wblm62m81sv08T
 xHnnD0HYsv7bSI6tWT6vRIaZsgcY2+TNWVVWN/ERt/fCj1C4yzR0dLg12EM4YksIMJ/9EP
 rDp1/Cwpro4qY5qWtWI568rxBtkKUns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHzCOwdweIH1YV+N3fC0Nww6zevGieuSBp9BYBtC9hY=;
 b=/XaZapyqT661ZjmtgIdqugZaqQP5Uxmf3mDa/y0XfERWq0bi3qp0kA2mEt8xYJVRH47K7z
 /cBJEEOlP048DjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DB8D1377E;
 Thu, 16 Nov 2023 10:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yOR9AsLoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 02/10] drm/ast: Rework I/O register setup
Date: Thu, 16 Nov 2023 10:59:21 +0100
Message-ID: <20231116100240.22975-3-tzimmermann@suse.de>
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

There are three different ways of retrieving the I/O-memory ranges
for AST devices: either from PCI BAR 1, from PCI BAR 2 or from PCI
BAR 1 by 'guessing'.

Make the respective code more readable by making each case self-
contained. Also add error checking against the length of the PCI
BARs.

v2:
	* fix I/O range length to 128 bytes
	* fix length test for PCI BAR 2

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/ast/ast_main.c | 40 +++++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 445cf47871a43..70e1871dbaf94 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -444,22 +444,42 @@ struct ast_device *ast_device_create(const struct drm_driver *drv,
 	if (!ast->regs)
 		return ERR_PTR(-EIO);
 
-	/*
-	 * After AST2500, MMIO is enabled by default, and it should be adopted
-	 * to be compatible with Arm.
-	 */
 	if (pdev->revision >= 0x40) {
+		/*
+		 * On AST2500 and later models, MMIO is enabled by
+		 * default. Adopt it to be compatible with ARM.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 1);
+
+		if (len < AST_IO_MM_OFFSET)
+			return ERR_PTR(-EIO);
+		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
+			return ERR_PTR(-EIO);
 		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
-	} else if (!(pci_resource_flags(pdev, 2) & IORESOURCE_IO)) {
-		drm_info(dev, "platform has no IO space, trying MMIO\n");
-		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
-	}
+	} else if (pci_resource_flags(pdev, 2) & IORESOURCE_IO) {
+		/*
+		 * Map I/O registers if we have a PCI BAR for I/O.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 2);
 
-	/* "map" IO regs if the above hasn't done so already */
-	if (!ast->ioregs) {
+		if (len < AST_IO_MM_LENGTH)
+			return -EIO;
 		ast->ioregs = pcim_iomap(pdev, 2, 0);
 		if (!ast->ioregs)
 			return ERR_PTR(-EIO);
+	} else {
+		/*
+		 * Anything else is best effort.
+		 */
+		resource_size_t len = pci_resource_len(pdev, 1);
+
+		if (len < AST_IO_MM_OFFSET)
+			return ERR_PTR(-EIO);
+		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
+			return ERR_PTR(-EIO);
+		ast->ioregs = ast->regs + AST_IO_MM_OFFSET;
+
+		drm_info(dev, "Platform has no I/O space, using MMIO\n");
 	}
 
 	if (!ast_is_vga_enabled(dev)) {
diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
index 555286ecf5209..05bab94a9a906 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -10,6 +10,7 @@
  */
 
 #define AST_IO_MM_OFFSET		(0x380)
+#define AST_IO_MM_LENGTH		(128)
 
 #define AST_IO_VGAARI_W			(0x40)
 #define AST_IO_VGAMR_W			(0x42)
-- 
2.42.0

