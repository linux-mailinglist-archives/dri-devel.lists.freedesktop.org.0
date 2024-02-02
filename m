Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D811E846FAF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 13:01:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE0E10E4D9;
	Fri,  2 Feb 2024 12:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Q/PWmHqr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6Y81eWv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q/PWmHqr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E6Y81eWv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B09310E412
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 12:01:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0609D1FD18;
 Fri,  2 Feb 2024 12:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706875304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
 b=Q/PWmHqrsxaRB0+YiGhu1iCMQ4REU1jFrvVWrPXqDPv4zmpUgkAYAVvBW8dQd3RYWykFn+
 QxHdhqsBgHKEyLovWG0WfbJ37N8URyO1AxqWLEg2UGvUOJHXpAIzPT/oc1PGAxDbHcUe4e
 aXHop5KeiZ8DXlY05OhXq/fqsf5a5Ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706875304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
 b=E6Y81eWv2A7nILQZI920SFmdGT1t5f16r9sA7+qnj/CCv4lL3PpY2SijGeLtZPNIACOjnt
 5svvqlTFSo+NC5Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706875304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
 b=Q/PWmHqrsxaRB0+YiGhu1iCMQ4REU1jFrvVWrPXqDPv4zmpUgkAYAVvBW8dQd3RYWykFn+
 QxHdhqsBgHKEyLovWG0WfbJ37N8URyO1AxqWLEg2UGvUOJHXpAIzPT/oc1PGAxDbHcUe4e
 aXHop5KeiZ8DXlY05OhXq/fqsf5a5Ik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706875304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jpd+p9IaqHayjR35KrBxfOInFN2LP+qymQoOt+iSpFg=;
 b=E6Y81eWv2A7nILQZI920SFmdGT1t5f16r9sA7+qnj/CCv4lL3PpY2SijGeLtZPNIACOjnt
 5svvqlTFSo+NC5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4C5113A60;
 Fri,  2 Feb 2024 12:01:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ICTnLqfZvGWfeAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Feb 2024 12:01:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	pjones@redhat.com,
	deller@gmx.de,
	ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/8] fbdev/efifb: Remove PM for parent device
Date: Fri,  2 Feb 2024 12:58:45 +0100
Message-ID: <20240202120140.3517-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202120140.3517-1-tzimmermann@suse.de>
References: <20240202120140.3517-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[]
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

The EFI device has the correct parent device set. This allows Linux
to handle the power management internally. Hence, remove the manual
PM management for the parent device from efifb.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/efifb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 10fc14ad5d127..e66ef35fa6b62 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -17,7 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/screen_info.h>
-#include <linux/pm_runtime.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
@@ -258,9 +257,6 @@ static void efifb_destroy(struct fb_info *info)
 {
 	struct efifb_par *par = info->par;
 
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
 	if (info->screen_base) {
 		if (mem_flags & (EFI_MEMORY_UC | EFI_MEMORY_WC))
 			iounmap(info->screen_base);
@@ -598,26 +594,20 @@ static int efifb_probe(struct platform_device *dev)
 		goto err_groups;
 	}
 
-	if (efifb_pci_dev)
-		WARN_ON(pm_runtime_get_sync(&efifb_pci_dev->dev) < 0);
-
 	err = devm_aperture_acquire_for_platform_device(dev, par->base, par->size);
 	if (err) {
 		pr_err("efifb: cannot acquire aperture\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	err = register_framebuffer(info);
 	if (err < 0) {
 		pr_err("efifb: cannot register framebuffer\n");
-		goto err_put_rpm_ref;
+		goto err_fb_dealloc_cmap;
 	}
 	fb_info(info, "%s frame buffer device\n", info->fix.id);
 	return 0;
 
-err_put_rpm_ref:
-	if (efifb_pci_dev)
-		pm_runtime_put(&efifb_pci_dev->dev);
-
+err_fb_dealloc_cmap:
 	fb_dealloc_cmap(&info->cmap);
 err_groups:
 	sysfs_remove_groups(&dev->dev.kobj, efifb_groups);
-- 
2.43.0

