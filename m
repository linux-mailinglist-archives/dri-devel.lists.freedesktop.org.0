Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A27E98A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB60A10E2C0;
	Mon, 13 Nov 2023 09:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E97D10E173
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 198F421902;
 Mon, 13 Nov 2023 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D4njH/AkarG5PZDhHJZvHcdiExOGGetVsYm9SCdfZo=;
 b=ih4M5fO8F+7JbTqgGPHfQ8lsh6FV8nXTx9wUCPD734MNGKYQgiSPkYhTw21fEJpQL+8rMi
 07AGd71fXrq9nTFcYv9R46/VXLKhOu1SZsLbHYxcllF+y3S2lvcDC99MmfZxvmlUll98Qr
 GV90pzHNPg77PaKUc8gAEqmAtnAXoDA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D4njH/AkarG5PZDhHJZvHcdiExOGGetVsYm9SCdfZo=;
 b=7U0xE7hBNEDQmmOrm1B9/UKX4L933T9ySmOXc+zx/coDB7I5R2dfLuoYOCXBFGr6QHgySC
 LrNQhntz8IR3PCAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0D1113907;
 Mon, 13 Nov 2023 09:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uJ3xNQPpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 02/10] drm/ast: Rework I/O register setup
Date: Mon, 13 Nov 2023 09:50:24 +0100
Message-ID: <20231113091439.17181-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113091439.17181-1-tzimmermann@suse.de>
References: <20231113091439.17181-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_main.c | 40 +++++++++++++++++++++++++---------
 drivers/gpu/drm/ast/ast_reg.h  |  1 +
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index 445cf47871a43..2c2700256a966 100644
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
+		if ((len - AST_IO_MM_OFFSET) < AST_IO_MM_LENGTH)
+			return ERR_PTR(-EIO);
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
index 555286ecf5209..f1e1700c01ed2 100644
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -10,6 +10,7 @@
  */
 
 #define AST_IO_MM_OFFSET		(0x380)
+#define AST_IO_MM_LENGTH		(0xff)
 
 #define AST_IO_VGAARI_W			(0x40)
 #define AST_IO_VGAMR_W			(0x42)
-- 
2.42.0

