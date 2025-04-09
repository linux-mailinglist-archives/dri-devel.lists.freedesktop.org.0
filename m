Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A51A82082
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2EC10E782;
	Wed,  9 Apr 2025 08:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111DF10E80E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:50:34 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 86FCC1F38A;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 650E813A7A;
 Wed,  9 Apr 2025 08:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AMZPF8w09mdgZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Apr 2025 08:50:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/3] drm/sysfb: Split source file
Date: Wed,  9 Apr 2025 10:45:36 +0200
Message-ID: <20250409084729.236719-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409084729.236719-1-tzimmermann@suse.de>
References: <20250409084729.236719-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 86FCC1F38A
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Split drm_sysfb_helper.c into two source files. There's no one
source file for the mode-setting pipeline and one source file for
module meta data. Prepares for adding additional source code to
sysfb helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sysfb/Makefile                            | 3 +++
 drivers/gpu/drm/sysfb/drm_sysfb.c                         | 8 ++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h                  | 5 +++++
 .../drm/sysfb/{drm_sysfb_helper.c => drm_sysfb_modeset.c} | 4 ----
 4 files changed, 16 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb.c
 rename drivers/gpu/drm/sysfb/{drm_sysfb_helper.c => drm_sysfb_modeset.c} (98%)

diff --git a/drivers/gpu/drm/sysfb/Makefile b/drivers/gpu/drm/sysfb/Makefile
index 0d2518c971634..861b4026f4a6e 100644
--- a/drivers/gpu/drm/sysfb/Makefile
+++ b/drivers/gpu/drm/sysfb/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+drm_sysfb_helper-y := \
+	drm_sysfb.o \
+	drm_sysfb_modeset.o
 obj-$(CONFIG_DRM_SYSFB_HELPER)	+= drm_sysfb_helper.o
 
 obj-$(CONFIG_DRM_EFIDRM)	+= efidrm.o
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb.c b/drivers/gpu/drm/sysfb/drm_sysfb.c
new file mode 100644
index 0000000000000..c083d21fd9cab
--- /dev/null
+++ b/drivers/gpu/drm/sysfb/drm_sysfb.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+
+#include "drm_sysfb_helper.h"
+
+MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 3684bd0ef0853..ee94d6199b601 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -11,6 +11,11 @@
 #include <drm/drm_modes.h>
 
 struct drm_format_info;
+struct drm_scanout_buffer;
+
+/*
+ * Display modes
+ */
 
 struct drm_display_mode drm_sysfb_mode(unsigned int width,
 				       unsigned int height,
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
similarity index 98%
rename from drivers/gpu/drm/sysfb/drm_sysfb_helper.c
rename to drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 262490a717924..ffaa2522ab965 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -2,7 +2,6 @@
 
 #include <linux/export.h>
 #include <linux/slab.h>
-#include <linux/module.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -20,9 +19,6 @@
 
 #include "drm_sysfb_helper.h"
 
-MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
-MODULE_LICENSE("GPL");
-
 struct drm_display_mode drm_sysfb_mode(unsigned int width,
 				       unsigned int height,
 				       unsigned int width_mm,
-- 
2.49.0

