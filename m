Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7DA83D45
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FD10E7BE;
	Thu, 10 Apr 2025 08:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="T/rmIyNx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4T/WJV2J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T/rmIyNx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4T/WJV2J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB5510E7BE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:41:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA01421167;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2H1Q9qQebvJd6P1eHhjwJKNjEiHQ6L2ahXcwFViG2U=;
 b=T/rmIyNxmQSvgob8L3jYY1fs1tkTa3Uj7U9xOZ12wluAr2OMLqt1d13t+OnRaiPU0NfEPJ
 uVUl94AZba9QTgFkHu3GnfY2hpAfQcJ/QOPZsEOJpq3ySjMy7PWgZDHj7EfP/2yxthfqLH
 Whglh4WpMmCZcSGHKs4YSoR5zAAQy0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2H1Q9qQebvJd6P1eHhjwJKNjEiHQ6L2ahXcwFViG2U=;
 b=4T/WJV2J3t0WIz0bd57rPFNRN4Hqh7omgm3EQv8o8fW033yME4pkwJzSlaJ4iRrKByvDVb
 Rs0HlFYq588lUwDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="T/rmIyNx";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="4T/WJV2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2H1Q9qQebvJd6P1eHhjwJKNjEiHQ6L2ahXcwFViG2U=;
 b=T/rmIyNxmQSvgob8L3jYY1fs1tkTa3Uj7U9xOZ12wluAr2OMLqt1d13t+OnRaiPU0NfEPJ
 uVUl94AZba9QTgFkHu3GnfY2hpAfQcJ/QOPZsEOJpq3ySjMy7PWgZDHj7EfP/2yxthfqLH
 Whglh4WpMmCZcSGHKs4YSoR5zAAQy0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z2H1Q9qQebvJd6P1eHhjwJKNjEiHQ6L2ahXcwFViG2U=;
 b=4T/WJV2J3t0WIz0bd57rPFNRN4Hqh7omgm3EQv8o8fW033yME4pkwJzSlaJ4iRrKByvDVb
 Rs0HlFYq588lUwDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 892FD13A4B;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCwjIEKE92enDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 08:41:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/3] drm/sysfb: Split source file
Date: Thu, 10 Apr 2025 10:37:23 +0200
Message-ID: <20250410083834.10810-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410083834.10810-1-tzimmermann@suse.de>
References: <20250410083834.10810-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AA01421167
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
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

Split drm_sysfb_helper.c into two source files. There's now one
source file for the mode-setting pipeline and one source file for
module meta data. Prepares for adding additional source code to
sysfb helpers.

v2:
- fix typo in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
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

