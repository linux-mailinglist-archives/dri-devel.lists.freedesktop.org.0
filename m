Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE4AD6A6C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 10:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790B710E7B5;
	Thu, 12 Jun 2025 08:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="U3cuALIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FoMsZRuf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U3cuALIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FoMsZRuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCD810E7B1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 08:22:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B505F1F84B;
 Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
 b=U3cuALIOvbQhDy8K7aEhhdnNBbbT5axy9EXkDBo1vhQTmPx6MlwCZ4sq7j1sCS76LpHOdZ
 rxNoj7JvJwanqv5Dm1hvTaNpNEAzHu3jYLrH8CDmPu6ucRLuucRHmJpH9g/HbA17oM4LEb
 LFHv6KUsRrIHXcZc/yvnIjMrjXqDovo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716489;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
 b=FoMsZRufd9HpCEWDhN7QtvqE6M8h7yM9pildBiAEd5CqaajgkJ5D+lG5FAEInQxMtmm/AW
 ul8dcJR1ynGse4DA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U3cuALIO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FoMsZRuf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749716489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
 b=U3cuALIOvbQhDy8K7aEhhdnNBbbT5axy9EXkDBo1vhQTmPx6MlwCZ4sq7j1sCS76LpHOdZ
 rxNoj7JvJwanqv5Dm1hvTaNpNEAzHu3jYLrH8CDmPu6ucRLuucRHmJpH9g/HbA17oM4LEb
 LFHv6KUsRrIHXcZc/yvnIjMrjXqDovo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749716489;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCt7jRFLzoBSBoqgZu7r9m6/P7DqZxIsJScqbfnmPLI=;
 b=FoMsZRufd9HpCEWDhN7QtvqE6M8h7yM9pildBiAEd5CqaajgkJ5D+lG5FAEInQxMtmm/AW
 ul8dcJR1ynGse4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62219132D8;
 Thu, 12 Jun 2025 08:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2CKUFgmOSmgILAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jun 2025 08:21:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, soci@c64.rulez.org, simona@ffwll.ch, linux@armlinux.org.uk,
 FlorianSchandinat@gmx.de, alchark@gmail.com, krzk@kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/14] fbdev/sisfb: Unexport symbols
Date: Thu, 12 Jun 2025 10:16:35 +0200
Message-ID: <20250612081738.197826-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612081738.197826-1-tzimmermann@suse.de>
References: <20250612081738.197826-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B505F1F84B
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmx.de,c64.rulez.org,ffwll.ch,armlinux.org.uk,gmail.com,kernel.org];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[12]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLwqwbgho3bgbo9wb3ecq1qfng)];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -3.01
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

Fix the compile-time warning

  drivers/video/fbdev/sis/sis_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

The affected symbols are not used outside of their module. Some of
the symbols are not used anywhere, so remove the functions entirely.
Also remove the related, but unused, define SISFB_HAVE_MALLOC_NEW.

v2:
- remove unused functions (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sis/sis.h      |  2 --
 drivers/video/fbdev/sis/sis_main.c | 25 -------------------------
 include/video/sisfb.h              |  6 ------
 3 files changed, 33 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis.h b/drivers/video/fbdev/sis/sis.h
index d632f096083b..3d658482c69d 100644
--- a/drivers/video/fbdev/sis/sis.h
+++ b/drivers/video/fbdev/sis/sis.h
@@ -673,9 +673,7 @@ unsigned int	sisfb_read_mio_pci_word(struct SiS_Private *SiS_Pr, int reg);
 
 /* SiS-specific exported functions */
 void			sis_malloc(struct sis_memreq *req);
-void			sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req);
 void			sis_free(u32 base);
-void			sis_free_new(struct pci_dev *pdev, u32 base);
 
 /* Routines from init.c/init301.c */
 extern unsigned short	SiS_GetModeID_LCD(int VGAEngine, unsigned int VBFlags, int HDisplay,
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 75033e6be15a..84567d67f71d 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -3421,14 +3421,6 @@ sis_malloc(struct sis_memreq *req)
 		req->offset = req->size = 0;
 }
 
-void
-sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req)
-{
-	struct sis_video_info *ivideo = pci_get_drvdata(pdev);
-
-	sis_int_malloc(ivideo, req);
-}
-
 /* sis_free: u32 because "base" is offset inside video ram, can never be >4GB */
 
 static void
@@ -3455,14 +3447,6 @@ sis_free(u32 base)
 	sis_int_free(ivideo, base);
 }
 
-void
-sis_free_new(struct pci_dev *pdev, u32 base)
-{
-	struct sis_video_info *ivideo = pci_get_drvdata(pdev);
-
-	sis_int_free(ivideo, base);
-}
-
 /* --------------------- SetMode routines ------------------------- */
 
 static void
@@ -6832,12 +6816,3 @@ MODULE_PARM_DESC(videoram,
 #endif
 
 #endif 	   /*  /MODULE  */
-
-/* _GPL only for new symbols. */
-EXPORT_SYMBOL(sis_malloc);
-EXPORT_SYMBOL(sis_free);
-EXPORT_SYMBOL_GPL(sis_malloc_new);
-EXPORT_SYMBOL_GPL(sis_free_new);
-
-
-
diff --git a/include/video/sisfb.h b/include/video/sisfb.h
index 76ff628a1220..54e6632cd4a2 100644
--- a/include/video/sisfb.h
+++ b/include/video/sisfb.h
@@ -15,10 +15,4 @@
 #define	SIS_300_VGA  1
 #define	SIS_315_VGA  2
 
-#define SISFB_HAVE_MALLOC_NEW
-extern void sis_malloc(struct sis_memreq *req);
-extern void sis_malloc_new(struct pci_dev *pdev, struct sis_memreq *req);
-
-extern void sis_free(u32 base);
-extern void sis_free_new(struct pci_dev *pdev, u32 base);
 #endif
-- 
2.49.0

