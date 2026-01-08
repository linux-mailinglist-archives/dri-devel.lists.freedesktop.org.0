Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8186D038B0
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF61210E786;
	Thu,  8 Jan 2026 14:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5989F10E785
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70E725C7E3;
 Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273783EA65;
 Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YDJCCFbEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/8] firmware: google: Do sysfb test before creating coreboot
 framebuffer
Date: Thu,  8 Jan 2026 15:19:41 +0100
Message-ID: <20260108145058.56943-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 70E725C7E3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test sysfb before creating the coreboot framebuffer device. Skip
device creation if the test fails, as this framebuffer does not exist.

Depending on the system setup, the initial framebuffer can be provided
by the boot loader via screen_info boot parameters and handled by the
kernel's sysfb code in drivers/firmware/sysfb.c. With the sysfb test in
the coreboot-framebuffer probing, the coreboot device is present without
the framebuffer. Even after the sysfb device has been replaced with a
native PCI device, the coreboot device persists.

Skipping device creation early avoids all these inconsistencies. It
further prepares coreboot to support graphics drivers besides the one
in framebuffer-coreboot.c.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/coreboot_table.c       | 17 +++++++++++++++++
 drivers/firmware/google/coreboot_table.h       |  1 +
 drivers/firmware/google/framebuffer-coreboot.c | 16 ----------------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 882db32e51be..c34426e5002d 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfb.h>
 
 #include "coreboot_table.h"
 
@@ -118,6 +119,22 @@ static int coreboot_table_populate(struct device *dev, void *ptr)
 			return -EINVAL;
 		}
 
+		switch (entry->tag) {
+		case CB_TAG_FRAMEBUFFER:
+			/*
+			 * On coreboot systems, the advertised CB_TAG_FRAMEBUFFER entry
+			 * in the coreboot table should only be used if the payload did
+			 * not pass a framebuffer information to the Linux kernel.
+			 *
+			 * If the global screen_info data has been filled, the generic
+			 * system framebuffers (sysfb) will already register a platform
+			 * device and pass that screen_info as platform_data to a driver
+			 * that can scan-out using the system-provided framebuffer.
+			 */
+			if (sysfb_handles_screen_info())
+				continue;
+		}
+
 		device = kzalloc(sizeof(device->dev) + entry->size, GFP_KERNEL);
 		if (!device)
 			return -ENOMEM;
diff --git a/drivers/firmware/google/coreboot_table.h b/drivers/firmware/google/coreboot_table.h
index bb6f0f7299b4..e3c353676940 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/drivers/firmware/google/coreboot_table.h
@@ -40,6 +40,7 @@ struct lb_cbmem_ref {
 	u64 cbmem_addr;
 };
 
+#define CB_TAG_FRAMEBUFFER 0x12
 #define LB_TAG_CBMEM_ENTRY 0x31
 
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index c68c9f56370f..bb53d1a47409 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -15,12 +15,9 @@
 #include <linux/module.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
-#include <linux/sysfb.h>
 
 #include "coreboot_table.h"
 
-#define CB_TAG_FRAMEBUFFER 0x12
-
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
 static int framebuffer_probe(struct coreboot_device *dev)
@@ -37,19 +34,6 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		.format = NULL,
 	};
 
-	/*
-	 * On coreboot systems, the advertised LB_TAG_FRAMEBUFFER entry
-	 * in the coreboot table should only be used if the payload did
-	 * not pass a framebuffer information to the Linux kernel.
-	 *
-	 * If the global screen_info data has been filled, the Generic
-	 * System Framebuffers (sysfb) will already register a platform
-	 * device and pass that screen_info as platform_data to a driver
-	 * that can scan-out using the system provided framebuffer.
-	 */
-	if (sysfb_handles_screen_info())
-		return -ENODEV;
-
 	if (!fb->physical_address)
 		return -ENODEV;
 
-- 
2.52.0

