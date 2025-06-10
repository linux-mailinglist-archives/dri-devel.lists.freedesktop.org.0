Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A067CAD3452
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 13:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9F010E4F7;
	Tue, 10 Jun 2025 11:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pKspC765";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJ08/ZU0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zNyIcYuX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ea9z7/x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFAD882D0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 11:03:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E99CC210F9;
 Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykg0Riu4/3OM4z6bInkXkSRcNKKj+uOzQyH26jMtR3A=;
 b=pKspC765im1EII58ikloveSNT9G5YhCbgrAI7Vt5amo1qmuwvU4hoxsEYGkA0Ej9fPDBIe
 QqszxF6A5C/rbTwH4MtTWjGIvQaPSNqh2bRSAmEW2Aroe1x5SfJyEvX1tTZRvVesnb2H0K
 c773FyFYA14w/c1wkA+sGWaLDJhMus0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykg0Riu4/3OM4z6bInkXkSRcNKKj+uOzQyH26jMtR3A=;
 b=OJ08/ZU00G0P44obeZd/BipUGMKCqHQZYOVN/uj/086rxb/wJAzf/WzkpKW0T/1ij/u4X8
 RvGm9hgGhDopGbAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zNyIcYuX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ea9z7/x4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749553403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykg0Riu4/3OM4z6bInkXkSRcNKKj+uOzQyH26jMtR3A=;
 b=zNyIcYuXgd6aLtwY/jRcToXLth2DgLlqZIfBHlm/QF9fKDM6o/GnLExxjYHSEpOzDJJsEX
 StgYEnCOrfRHOBv2tEDIIMMLU4kFKZZNOtMTFhnCr6CzyQ/OvEamTTWDnzuoNDNGZAzOwx
 94mLXHd2kY1zvLh+Bod+MWcV0Ryi5as=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749553403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ykg0Riu4/3OM4z6bInkXkSRcNKKj+uOzQyH26jMtR3A=;
 b=ea9z7/x4biFhKnNtWGzo08kb3HyBoC108FUFHtZ9w2j9+puJU3kEhCqUbh1iiDLMcJME/1
 4AvtZyGUZSxGvLCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 957E513964;
 Tue, 10 Jun 2025 11:03:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SO4oI/sQSGgOTAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 10 Jun 2025 11:03:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, jayalk@intworks.biz,
 linux@armlinux.org.uk, FlorianSchandinat@gmx.de, alchark@gmail.com,
 krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/14] fbdev: Include <linux/export.h>
Date: Tue, 10 Jun 2025 12:56:35 +0200
Message-ID: <20250610105948.384540-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610105948.384540-1-tzimmermann@suse.de>
References: <20250610105948.384540-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,intworks.biz,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FROM_EQ_ENVFROM(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E99CC210F9
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
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

Fix the compile-time warnings

  drivers/video/fbdev/core/cfbcopyarea.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/cfbfillrect.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/cfbimgblt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fb_ddc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fb_defio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fb_io_fops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fb_sys_fops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fbcmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fbcon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/fbmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/modedb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/svgalib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/syscopyarea.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/sysfillrect.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/core/sysimgblt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/macmodes.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/sbuslib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
  drivers/video/fbdev/wmt_ge_rops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/cfbcopyarea.c | 2 ++
 drivers/video/fbdev/core/cfbfillrect.c | 2 ++
 drivers/video/fbdev/core/cfbimgblt.c   | 2 ++
 drivers/video/fbdev/core/fb_ddc.c      | 1 +
 drivers/video/fbdev/core/fb_defio.c    | 1 +
 drivers/video/fbdev/core/fb_io_fops.c  | 1 +
 drivers/video/fbdev/core/fb_sys_fops.c | 2 ++
 drivers/video/fbdev/core/fbcmap.c      | 1 +
 drivers/video/fbdev/core/fbcon.c       | 1 +
 drivers/video/fbdev/core/fbmon.c       | 2 ++
 drivers/video/fbdev/core/modedb.c      | 1 +
 drivers/video/fbdev/core/svgalib.c     | 1 +
 drivers/video/fbdev/core/syscopyarea.c | 2 ++
 drivers/video/fbdev/core/sysfillrect.c | 2 ++
 drivers/video/fbdev/core/sysimgblt.c   | 2 ++
 drivers/video/fbdev/macmodes.c         | 1 +
 drivers/video/fbdev/sbuslib.c          | 1 +
 drivers/video/fbdev/wmt_ge_rops.c      | 1 +
 18 files changed, 26 insertions(+)

diff --git a/drivers/video/fbdev/core/cfbcopyarea.c b/drivers/video/fbdev/core/cfbcopyarea.c
index 23fbf3a8df7c..ce2e6807be60 100644
--- a/drivers/video/fbdev/core/cfbcopyarea.c
+++ b/drivers/video/fbdev/core/cfbcopyarea.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/core/cfbfillrect.c b/drivers/video/fbdev/core/cfbfillrect.c
index 615de89256d5..bd2fbbda10c6 100644
--- a/drivers/video/fbdev/core/cfbfillrect.c
+++ b/drivers/video/fbdev/core/cfbfillrect.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/core/cfbimgblt.c b/drivers/video/fbdev/core/cfbimgblt.c
index bcec4e32c0e7..e116cd1d8a39 100644
--- a/drivers/video/fbdev/core/cfbimgblt.c
+++ b/drivers/video/fbdev/core/cfbimgblt.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/core/fb_ddc.c b/drivers/video/fbdev/core/fb_ddc.c
index e25143219862..824796361367 100644
--- a/drivers/video/fbdev/core/fb_ddc.c
+++ b/drivers/video/fbdev/core/fb_ddc.c
@@ -10,6 +10,7 @@
 
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/i2c-algo-bit.h>
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 4fc93f253e06..8df2e51e3390 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
diff --git a/drivers/video/fbdev/core/fb_io_fops.c b/drivers/video/fbdev/core/fb_io_fops.c
index 3408ff1b2b7a..6ab60fcd0050 100644
--- a/drivers/video/fbdev/core/fb_io_fops.c
+++ b/drivers/video/fbdev/core/fb_io_fops.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
diff --git a/drivers/video/fbdev/core/fb_sys_fops.c b/drivers/video/fbdev/core/fb_sys_fops.c
index a9aa6519a5b3..be96b3b3942e 100644
--- a/drivers/video/fbdev/core/fb_sys_fops.c
+++ b/drivers/video/fbdev/core/fb_sys_fops.c
@@ -9,6 +9,8 @@
  * for more details.
  *
  */
+
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/uaccess.h>
diff --git a/drivers/video/fbdev/core/fbcmap.c b/drivers/video/fbdev/core/fbcmap.c
index ff09e57f3c38..9cc3e87da14b 100644
--- a/drivers/video/fbdev/core/fbcmap.c
+++ b/drivers/video/fbdev/core/fbcmap.c
@@ -11,6 +11,7 @@
  *  more details.
  */
 
+#include <linux/export.h>
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/fb.h>
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2df48037688d..25684f5d6523 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -56,6 +56,7 @@
  *  more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/fs.h>
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 0a26399dbc89..023caaea682e 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -26,6 +26,8 @@
  * for more details.
  *
  */
+
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/module.h>
 #include <linux/pci.h>
diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index 7196b055f2bd..53a610948c4a 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -11,6 +11,7 @@
  *  more details.
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
diff --git a/drivers/video/fbdev/core/svgalib.c b/drivers/video/fbdev/core/svgalib.c
index 821b89a0a645..d6053af749f6 100644
--- a/drivers/video/fbdev/core/svgalib.c
+++ b/drivers/video/fbdev/core/svgalib.c
@@ -10,6 +10,7 @@
  * Some parts are based on David Boucher's viafb (http://davesdomain.org.uk/viafb/)
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
diff --git a/drivers/video/fbdev/core/syscopyarea.c b/drivers/video/fbdev/core/syscopyarea.c
index b634e2d21208..773569bce67c 100644
--- a/drivers/video/fbdev/core/syscopyarea.c
+++ b/drivers/video/fbdev/core/syscopyarea.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/core/sysfillrect.c b/drivers/video/fbdev/core/sysfillrect.c
index 372ca6a324c2..12eea3e424bb 100644
--- a/drivers/video/fbdev/core/sysfillrect.c
+++ b/drivers/video/fbdev/core/sysfillrect.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/core/sysimgblt.c b/drivers/video/fbdev/core/sysimgblt.c
index c756cc658b7d..0a5bfd8ad095 100644
--- a/drivers/video/fbdev/core/sysimgblt.c
+++ b/drivers/video/fbdev/core/sysimgblt.c
@@ -2,6 +2,8 @@
 /*
  *	Copyright (C)  2025 Zsolt Kajtar (soci@c64.rulez.org)
  */
+
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/bitrev.h>
diff --git a/drivers/video/fbdev/macmodes.c b/drivers/video/fbdev/macmodes.c
index cd689161f561..b16a9d9bef98 100644
--- a/drivers/video/fbdev/macmodes.c
+++ b/drivers/video/fbdev/macmodes.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/fb.h>
 #include <linux/string.h>
 #include <linux/module.h>
diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 4c79654bda30..dd2002d0810f 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
diff --git a/drivers/video/fbdev/wmt_ge_rops.c b/drivers/video/fbdev/wmt_ge_rops.c
index 92fbb3f3a0d3..2bd26bfb2b46 100644
--- a/drivers/video/fbdev/wmt_ge_rops.c
+++ b/drivers/video/fbdev/wmt_ge_rops.c
@@ -7,6 +7,7 @@
  *  Copyright (C) 2010 Alexey Charkov <alchark@gmail.com>
  */
 
+#include <linux/export.h>
 #include <linux/module.h>
 #include <linux/fb.h>
 #include <linux/io.h>
-- 
2.49.0

