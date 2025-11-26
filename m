Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A050C8AD65
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 17:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A50610E67E;
	Wed, 26 Nov 2025 16:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="sPkIenej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kM8HVdyM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sPkIenej";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kM8HVdyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF710E66C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 16:09:11 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48E6D336F2;
 Wed, 26 Nov 2025 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np/o9SOrUSR89NMerp0bJqsfAGpMRXdw2KZq5Jl7t3Q=;
 b=sPkIenejRUDLewaW3vnNRqaw7t86Ma99tLNBzMYYlMSwKwwoZKzKjAOa0TZ9X+fQM1t0xf
 RjrUGb9hpGyNBogufJJLumbgplcPn9Zd8xSZwNyOm4DhBOWe/yPcsAI2YxL9GOkeZbSna3
 4E2P5U8/eyITwhnqFZ25AN1sO+Av6cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764173342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np/o9SOrUSR89NMerp0bJqsfAGpMRXdw2KZq5Jl7t3Q=;
 b=kM8HVdyMpjcj6DidHZKS96kdXotXOFf0rAPcZ2oV9IXUcgDW70OhSUtuigzKx0HsVah9iF
 snPjYLQ2oqMladBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sPkIenej;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kM8HVdyM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764173342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np/o9SOrUSR89NMerp0bJqsfAGpMRXdw2KZq5Jl7t3Q=;
 b=sPkIenejRUDLewaW3vnNRqaw7t86Ma99tLNBzMYYlMSwKwwoZKzKjAOa0TZ9X+fQM1t0xf
 RjrUGb9hpGyNBogufJJLumbgplcPn9Zd8xSZwNyOm4DhBOWe/yPcsAI2YxL9GOkeZbSna3
 4E2P5U8/eyITwhnqFZ25AN1sO+Av6cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764173342;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np/o9SOrUSR89NMerp0bJqsfAGpMRXdw2KZq5Jl7t3Q=;
 b=kM8HVdyMpjcj6DidHZKS96kdXotXOFf0rAPcZ2oV9IXUcgDW70OhSUtuigzKx0HsVah9iF
 snPjYLQ2oqMladBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3BE53EA63;
 Wed, 26 Nov 2025 16:09:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gPp/Mh0mJ2lnIgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Nov 2025 16:09:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ardb@kernel.org, javierm@redhat.com, arnd@arndb.de, richard.lyu@suse.com,
 helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 6/9] sysfb: Move edid_info into sysfb_primary_display
Date: Wed, 26 Nov 2025 17:03:23 +0100
Message-ID: <20251126160854.553077-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
References: <20251126160854.553077-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLtfyjk8sg4x43ngtem9djprcp)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:mid, suse.de:email, suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 48E6D336F2
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

Move x86's edid_info into sysfb_primary_display as a new field named
edid. Adapt all users.

An instance of edid_info has only been defined on x86. With the move
into sysfb_primary_display, it becomes available on all architectures.
Therefore remove this contraint from CONFIG_FIRMWARE_EDID.

x86 fills the EDID data from boot_params.edid_info. DRM drivers pick
up the raw data and make it available to DRM clients. Replace the
drivers' references to edid_info and instead use the sysfb_display_info
as passed from sysfb.

v2:
- drop changes to CONFIG_FIRMWARE_EDID

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/setup.c          | 6 +-----
 drivers/gpu/drm/sysfb/efidrm.c   | 5 ++---
 drivers/gpu/drm/sysfb/vesadrm.c  | 5 ++---
 drivers/video/fbdev/core/fbmon.c | 8 +++++---
 include/linux/sysfb.h            | 6 ++++++
 include/video/edid.h             | 4 ----
 6 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 675e4b9deb1f..d9bfe2032cd9 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -215,10 +215,6 @@ arch_initcall(init_x86_sysctl);
 
 struct sysfb_display_info sysfb_primary_display;
 EXPORT_SYMBOL(sysfb_primary_display);
-#if defined(CONFIG_FIRMWARE_EDID)
-struct edid_info edid_info;
-EXPORT_SYMBOL_GPL(edid_info);
-#endif
 
 extern int root_mountflags;
 
@@ -530,7 +526,7 @@ static void __init parse_boot_params(void)
 	ROOT_DEV = old_decode_dev(boot_params.hdr.root_dev);
 	sysfb_primary_display.screen = boot_params.screen_info;
 #if defined(CONFIG_FIRMWARE_EDID)
-	edid_info = boot_params.edid_info;
+	sysfb_primary_display.edid = boot_params.edid_info;
 #endif
 #ifdef CONFIG_X86_32
 	apm_info.bios = boot_params.apm_bios_info;
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 29533ae8fbbf..50e0aeef709c 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -24,7 +24,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include <video/edid.h>
 #include <video/pixel_format.h>
 
 #include "drm_sysfb_helper.h"
@@ -207,8 +206,8 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
 		&format->format, width, height, stride);
 
 #if defined(CONFIG_FIRMWARE_EDID)
-	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
-		sysfb->edid = edid_info.dummy;
+	if (drm_edid_header_is_valid(dpy->edid.dummy) == 8)
+		sysfb->edid = dpy->edid.dummy;
 #endif
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 16fc223f8c5b..0680638b8131 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -25,7 +25,6 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
-#include <video/edid.h>
 #include <video/pixel_format.h>
 #include <video/vga.h>
 
@@ -474,8 +473,8 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
 	}
 
 #if defined(CONFIG_FIRMWARE_EDID)
-	if (drm_edid_header_is_valid(edid_info.dummy) == 8)
-		sysfb->edid = edid_info.dummy;
+	if (drm_edid_header_is_valid(dpy->edid.dummy) == 8)
+		sysfb->edid = dpy->edid.dummy;
 #endif
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 0a65bef01e3c..07df7e98f8a3 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -32,11 +32,13 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
-#include <video/edid.h>
+#include <linux/string_choices.h>
+#include <linux/sysfb.h>
+
 #include <video/of_videomode.h>
 #include <video/videomode.h>
+
 #include "../edid.h"
-#include <linux/string_choices.h>
 
 /*
  * EDID parser
@@ -1504,7 +1506,7 @@ const unsigned char *fb_firmware_edid(struct device *device)
 		res = &dev->resource[PCI_ROM_RESOURCE];
 
 	if (res && res->flags & IORESOURCE_ROM_SHADOW)
-		edid = edid_info.dummy;
+		edid = sysfb_primary_display.edid.dummy;
 
 	return edid;
 }
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index e8bde392c690..5226efde9ad4 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -12,6 +12,8 @@
 #include <linux/screen_info.h>
 #include <linux/types.h>
 
+#include <video/edid.h>
+
 struct device;
 struct platform_device;
 struct screen_info;
@@ -62,6 +64,10 @@ struct efifb_dmi_info {
 
 struct sysfb_display_info {
 	struct screen_info screen;
+
+#if defined(CONFIG_FIRMWARE_EDID)
+	struct edid_info edid;
+#endif
 };
 
 extern struct sysfb_display_info sysfb_primary_display;
diff --git a/include/video/edid.h b/include/video/edid.h
index c2b186b1933a..52aabb706032 100644
--- a/include/video/edid.h
+++ b/include/video/edid.h
@@ -4,8 +4,4 @@
 
 #include <uapi/video/edid.h>
 
-#if defined(CONFIG_FIRMWARE_EDID)
-extern struct edid_info edid_info;
-#endif
-
 #endif /* __linux_video_edid_h__ */
-- 
2.51.1

