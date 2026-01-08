Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6147AD038AD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 15:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A784D10E785;
	Thu,  8 Jan 2026 14:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3410E785
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 14:51:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6D46B34307;
 Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2764A3EA63;
 Thu,  8 Jan 2026 14:51:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4CFkCFfEX2n0WQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/8] firmware: google: Export coreboot driver and device
 interfaces
Date: Thu,  8 Jan 2026 15:19:44 +0100
Message-ID: <20260108145058.56943-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 6D46B34307
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
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

Split coreboot_table.h: move struct coreboot_table_header into
coreboot_table.h and the rest of the header to include/linux/coreboot.h.

Prepares coreboot for allowing drivers in other subsystems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/cbmem.c               |  3 +--
 drivers/firmware/google/coreboot_table.c      | 11 +++++++-
 .../firmware/google/framebuffer-coreboot.c    |  3 +--
 drivers/firmware/google/memconsole-coreboot.c |  2 +-
 drivers/firmware/google/vpd.c                 |  2 +-
 .../linux/coreboot.h                          | 27 +++++++------------
 6 files changed, 23 insertions(+), 25 deletions(-)
 rename drivers/firmware/google/coreboot_table.h => include/linux/coreboot.h (88%)

diff --git a/drivers/firmware/google/cbmem.c b/drivers/firmware/google/cbmem.c
index 3397bacdfdbe..b3e477d9ad4e 100644
--- a/drivers/firmware/google/cbmem.c
+++ b/drivers/firmware/google/cbmem.c
@@ -7,6 +7,7 @@
  * Copyright 2022 Google LLC
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -18,8 +19,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
-#include "coreboot_table.h"
-
 struct cbmem_entry {
 	char *mem_file_buf;
 	u32 size;
diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index ae20c0527032..3b07e1d60255 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -21,7 +22,15 @@
 #include <linux/slab.h>
 #include <linux/sysfb.h>
 
-#include "coreboot_table.h"
+/* Coreboot table header structure */
+struct coreboot_table_header {
+	char signature[4];
+	u32 header_bytes;
+	u32 header_checksum;
+	u32 table_bytes;
+	u32 table_checksum;
+	u32 table_entries;
+};
 
 #define CB_DEV(d) container_of(d, struct coreboot_device, dev)
 #define CB_DRV(d) container_of_const(d, struct coreboot_driver, drv)
diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 7ac9dc4f5392..88815e0abb3f 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -9,6 +9,7 @@
  * Copyright 2017 Samuel Holland <samuel@sholland.org>
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -17,8 +18,6 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 
-#include "coreboot_table.h"
-
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
 static int framebuffer_probe(struct coreboot_device *dev)
diff --git a/drivers/firmware/google/memconsole-coreboot.c b/drivers/firmware/google/memconsole-coreboot.c
index 4aa9b1cad3c3..bc7e4bfb2d08 100644
--- a/drivers/firmware/google/memconsole-coreboot.c
+++ b/drivers/firmware/google/memconsole-coreboot.c
@@ -7,6 +7,7 @@
  * Copyright 2017 Google Inc.
  */
 
+#include <linux/coreboot.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -14,7 +15,6 @@
 #include <linux/module.h>
 
 #include "memconsole.h"
-#include "coreboot_table.h"
 
 #define CB_TAG_CBMEM_CONSOLE	0x17
 
diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 8d7f123f96f4..f75008b956d5 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -7,6 +7,7 @@
  * Copyright 2017 Google Inc.
  */
 
+#include <linux/coreboot.h>
 #include <linux/ctype.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -20,7 +21,6 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 
-#include "coreboot_table.h"
 #include "vpd_decode.h"
 
 #define CB_TAG_VPD      0x2c
diff --git a/drivers/firmware/google/coreboot_table.h b/include/linux/coreboot.h
similarity index 88%
rename from drivers/firmware/google/coreboot_table.h
rename to include/linux/coreboot.h
index 4c71830c98ca..26ea5eecac52 100644
--- a/drivers/firmware/google/coreboot_table.h
+++ b/include/linux/coreboot.h
@@ -1,32 +1,26 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * coreboot_table.h
+ * coreboot.h
  *
- * Internal header for coreboot table access.
+ * Coreboot device and driver interfaces.
  *
  * Copyright 2014 Gerd Hoffmann <kraxel@redhat.com>
  * Copyright 2017 Google Inc.
  * Copyright 2017 Samuel Holland <samuel@sholland.org>
  */
 
-#ifndef __COREBOOT_TABLE_H
-#define __COREBOOT_TABLE_H
+#ifndef _LINUX_COREBOOT_H
+#define _LINUX_COREBOOT_H
 
 #include <linux/device.h>
 
 struct coreboot_device_id;
 
-/* Coreboot table header structure */
-struct coreboot_table_header {
-	char signature[4];
-	u32 header_bytes;
-	u32 header_checksum;
-	u32 table_bytes;
-	u32 table_checksum;
-	u32 table_entries;
-};
-
 /* List of coreboot entry structures that is used */
+
+#define CB_TAG_FRAMEBUFFER 0x12
+#define LB_TAG_CBMEM_ENTRY 0x31
+
 /* Generic */
 struct coreboot_table_entry {
 	u32 tag;
@@ -41,9 +35,6 @@ struct lb_cbmem_ref {
 	u64 cbmem_addr;
 };
 
-#define CB_TAG_FRAMEBUFFER 0x12
-#define LB_TAG_CBMEM_ENTRY 0x31
-
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
 struct lb_cbmem_entry {
 	u32 tag;
@@ -118,4 +109,4 @@ void coreboot_driver_unregister(struct coreboot_driver *driver);
 	module_driver(__coreboot_driver, coreboot_driver_register, \
 			coreboot_driver_unregister)
 
-#endif /* __COREBOOT_TABLE_H */
+#endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

