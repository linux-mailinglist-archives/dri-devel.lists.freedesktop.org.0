Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B48AAA44
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 10:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1B810FE19;
	Fri, 19 Apr 2024 08:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="hpvd0Sqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f8h7GP86";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hpvd0Sqs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f8h7GP86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBE110FE19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:33:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B23395BFE7;
 Fri, 19 Apr 2024 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713515617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4jPlZuj0Q+ErpYW6zQWL3WWeg0XScKVPX36+ssyfA8=;
 b=hpvd0Sqs7Myi2WqGPoVf2yzFHZxTeoSzm8g2//vSUpSV7sOkobufNsOMLa2AFkI6AltPm5
 iC1RU0DbLRB7pWYf0CVSBk85ISxECf61rh3daAFLhPpZ+uhOnJwh/VP3AcrLCsfpNgxkiT
 lZH7aBVomJxnKyE/3CyhhULxPt7G3tY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713515617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4jPlZuj0Q+ErpYW6zQWL3WWeg0XScKVPX36+ssyfA8=;
 b=f8h7GP86+e3KWsv3z1GWOBLZ1ETcT6a2HDNt87PQC5I1pQlyIMzyqMpQ11sxqOOqA7zjon
 Ot1varOwIswOfVCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1713515617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4jPlZuj0Q+ErpYW6zQWL3WWeg0XScKVPX36+ssyfA8=;
 b=hpvd0Sqs7Myi2WqGPoVf2yzFHZxTeoSzm8g2//vSUpSV7sOkobufNsOMLa2AFkI6AltPm5
 iC1RU0DbLRB7pWYf0CVSBk85ISxECf61rh3daAFLhPpZ+uhOnJwh/VP3AcrLCsfpNgxkiT
 lZH7aBVomJxnKyE/3CyhhULxPt7G3tY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1713515617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o4jPlZuj0Q+ErpYW6zQWL3WWeg0XScKVPX36+ssyfA8=;
 b=f8h7GP86+e3KWsv3z1GWOBLZ1ETcT6a2HDNt87PQC5I1pQlyIMzyqMpQ11sxqOOqA7zjon
 Ot1varOwIswOfVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7FCA813991;
 Fri, 19 Apr 2024 08:33:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iLcBHmEsImb9agAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Apr 2024 08:33:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 06/43] fbdev/deferred-io: Always call get_page() for
 framebuffer pages
Date: Fri, 19 Apr 2024 10:28:59 +0200
Message-ID: <20240419083331.7761-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419083331.7761-1-tzimmermann@suse.de>
References: <20240419083331.7761-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
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

Unconditionally call get_page() after looking up a page from the
framebuffer memory. Guarantees that we always hold a reference.

This change also refactors the code such that it can support a
driver-supplied get_page helper. This will be useful for DRM's
fbdev emulation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index fe84218ded457..6e0bbcfdb01b5 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -23,7 +23,7 @@
 #include <linux/rmap.h>
 #include <linux/pagemap.h>
 
-static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs)
+static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long offs)
 {
 	const void *screen_buffer = info->screen_buffer;
 	struct page *page = NULL;
@@ -33,6 +33,9 @@ static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs
 	else if (info->fix.smem_start)
 		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
 
+	if (page)
+		get_page(page);
+
 	return page;
 }
 
@@ -129,12 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (offset >= info->fix.smem_len)
 		return VM_FAULT_SIGBUS;
 
-	page = fb_deferred_io_page(info, offset);
+	page = fb_deferred_io_get_page(info, offset);
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	get_page(page);
-
 	if (vmf->vma->vm_file)
 		page->mapping = vmf->vma->vm_file->f_mapping;
 	else
-- 
2.44.0

