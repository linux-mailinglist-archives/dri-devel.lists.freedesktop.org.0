Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE12822CC4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 13:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1587410E290;
	Wed,  3 Jan 2024 12:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78EC10E290
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 12:13:56 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7FF2E2202D;
 Wed,  3 Jan 2024 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704284035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UNr05wKxMYo7iKqnlxhW8j6RWmNeYnQWyP9LDDABl7s=;
 b=eDxeYGxFL1ISGEl0PyUxFxxYpNRY22XCMaMOISA37I0D95yg7Gk764hbJy0ipIoryeZFPl
 NDn3n6QX/ZuH2LASnvmIO9qUsMP7ySrl8ZSAyEQ7P2vZYs77qMOFaafNTEF5ofAbFMzha2
 Z1T4/aKsijV8ZXXajowNBrtBVTF9qd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704284035;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UNr05wKxMYo7iKqnlxhW8j6RWmNeYnQWyP9LDDABl7s=;
 b=E446wtTCdIYsPPirJkJbO5W/83XppCQCOXKnFIpGTxs3VjdxTDH94nbK6FhfL7OhA+Q5CN
 VUuEZy5eEKO0+sAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704284033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UNr05wKxMYo7iKqnlxhW8j6RWmNeYnQWyP9LDDABl7s=;
 b=YsoWuorLsmP2ZmoVNyoUlZivbbj8jUdNo/E2jAvGCp5J5oQGbY9wCxLfBxbAajHW4ZmiW0
 GYOa+01vNvx9UkhqaZcpg6LN46e4jNqiSQUKoNeRZCxOJsKUA8VofEoMp8TCEDqpYqK+vN
 P0ZdJmRtJp90v9ekPpBKUmWwUHByUso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704284033;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=UNr05wKxMYo7iKqnlxhW8j6RWmNeYnQWyP9LDDABl7s=;
 b=R5dYMT7ptj8SKlTwJBjsrlcJ4VgusPDXRmEkcd8mzAJ1yrL5ZJn6MLTmlGi9O3MAF56Me3
 +2ICIULVVu40ltCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C0ED13AA6;
 Wed,  3 Jan 2024 12:13:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aL2IFYFPlWV+IAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jan 2024 12:13:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH] fbdev/sis: Remove dependency on screen_info
Date: Wed,  3 Jan 2024 13:13:25 +0100
Message-ID: <20240103121352.4893-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ********
X-Spam-Score: 8.20
X-Spamd-Result: default: False [8.20 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; NEURAL_SPAM_LONG(3.50)[1.000];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[15.85%]
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When built-in, the sis driver tries to detect the current display mode
from the global screen_info state. That state is only for architecture
and firmware code. Drivers should not use it directly as it's not
guaranteed to contain valid information.

Remove the mode-detection code from sis. Drivers that want to detect a
pre-set mode on probe should read the hardware registers directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis_main.c | 37 ------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 6ad47b6b6004..803ccb6aa479 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -27,7 +27,6 @@
 #include <linux/errno.h>
 #include <linux/string.h>
 #include <linux/mm.h>
-#include <linux/screen_info.h>
 #include <linux/slab.h>
 #include <linux/fb.h>
 #include <linux/selection.h>
@@ -257,36 +256,6 @@ static void sisfb_search_mode(char *name, bool quiet)
 		printk(KERN_ERR "sisfb: Invalid mode '%s'\n", nameptr);
 }
 
-#ifndef MODULE
-static void sisfb_get_vga_mode_from_kernel(void)
-{
-#ifdef CONFIG_X86
-	char mymode[32];
-	int  mydepth = screen_info.lfb_depth;
-
-	if(screen_info.orig_video_isVGA != VIDEO_TYPE_VLFB) return;
-
-	if( (screen_info.lfb_width >= 320) && (screen_info.lfb_width <= 2048) &&
-	    (screen_info.lfb_height >= 200) && (screen_info.lfb_height <= 1536) &&
-	    (mydepth >= 8) && (mydepth <= 32) ) {
-
-		if(mydepth == 24) mydepth = 32;
-
-		sprintf(mymode, "%ux%ux%u", screen_info.lfb_width,
-					screen_info.lfb_height,
-					mydepth);
-
-		printk(KERN_DEBUG
-			"sisfb: Using vga mode %s pre-set by kernel as default\n",
-			mymode);
-
-		sisfb_search_mode(mymode, true);
-	}
-#endif
-	return;
-}
-#endif
-
 static void __init
 sisfb_search_crt2type(const char *name)
 {
@@ -5901,12 +5870,6 @@ static int sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	ivideo->subsysvendor = pdev->subsystem_vendor;
 	ivideo->subsysdevice = pdev->subsystem_device;
 
-#ifndef MODULE
-	if(sisfb_mode_idx == -1) {
-		sisfb_get_vga_mode_from_kernel();
-	}
-#endif
-
 	ivideo->chip = chipinfo->chip;
 	ivideo->chip_real_id = chipinfo->chip;
 	ivideo->sisvga_engine = chipinfo->vgaengine;

base-commit: 25232eb8a9ac7fa0dac7e846a4bf7fba2b6db39a
-- 
2.43.0

