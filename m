Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8BACAA43
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 09:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B41310E2B3;
	Mon,  2 Jun 2025 07:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3244310E2AE
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 07:59:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A03EC21263;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62C6513AE0;
 Mon,  2 Jun 2025 07:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wKzRFspZPWhuYQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jun 2025 07:59:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	javierm@redhat.com,
	deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/2] video: Make CONFIG_FIRMWARE_EDID generally available
Date: Mon,  2 Jun 2025 09:51:43 +0200
Message-ID: <20250602075537.137759-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602075537.137759-1-tzimmermann@suse.de>
References: <20250602075537.137759-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:9498, ipnet:::/1, country:IN]
X-Rspamd-Queue-Id: A03EC21263
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00
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

DRM drivers such as efidrm and vesadrm can export firmware EDID
data to userspace. Make the related option CONFIG_FIRMWARE_EDID
available without CONFIG_FB. Make it depend on X86, which is
currently the only architecture providing EDID information.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/Kconfig            | 18 +++++++++++++++++-
 drivers/video/fbdev/core/Kconfig | 15 ---------------
 drivers/video/fbdev/core/fbmon.c |  3 +--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
index 5df981920a94..c3da6c0bfca6 100644
--- a/drivers/video/Kconfig
+++ b/drivers/video/Kconfig
@@ -61,6 +61,23 @@ config HDMI
 
 endif # HAS_IOMEM
 
+config FIRMWARE_EDID
+	bool "Enable firmware EDID"
+	depends on X86
+	help
+	  This enables access to the EDID transferred from the firmware.
+	  On x86, this is from the VESA BIOS. DRM display drivers will
+	  be able to export the information to userspace.
+
+	  Also enable this if DDC/I2C transfers do not work for your driver
+	  and if you are using nvidiafb, i810fb or savagefb.
+
+	  In general, choosing Y for this option is safe.  If you
+	  experience extremely long delays while booting before you get
+	  something on your display, try setting this to N.  Matrox cards in
+	  combination with certain motherboards and monitors are known to
+	  suffer from this problem.
+
 if VT
 	source "drivers/video/console/Kconfig"
 endif
@@ -70,5 +87,4 @@ if FB_CORE || SGI_NEWPORT_CONSOLE
 
 endif
 
-
 endmenu
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index 4abe12db7594..b38c3b776bce 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -10,21 +10,6 @@ config FB_CORE
 config FB_NOTIFY
 	bool
 
-config FIRMWARE_EDID
-	bool "Enable firmware EDID"
-	depends on FB
-	help
-	  This enables access to the EDID transferred from the firmware.
-	  On the i386, this is from the Video BIOS. Enable this if DDC/I2C
-	  transfers do not work for your driver and if you are using
-	  nvidiafb, i810fb or savagefb.
-
-	  In general, choosing Y for this option is safe.  If you
-	  experience extremely long delays while booting before you get
-	  something on your display, try setting this to N.  Matrox cards in
-	  combination with certain motherboards and monitors are known to
-	  suffer from this problem.
-
 config FB_DEVICE
 	bool "Provide legacy /dev/fb* device"
 	depends on FB_CORE
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 0a26399dbc89..7762ad0284fa 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1482,13 +1482,12 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
 		-EINVAL : 0;
 }
 
-#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
-
 /*
  * We need to ensure that the EDID block is only returned for
  * the primary graphics adapter.
  */
 
+#if defined(CONFIG_FIRMWARE_EDID)
 const unsigned char *fb_firmware_edid(struct device *device)
 {
 	struct pci_dev *dev = NULL;
-- 
2.49.0

