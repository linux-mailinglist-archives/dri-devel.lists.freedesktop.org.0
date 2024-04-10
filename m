Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644D689F368
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FF9113344;
	Wed, 10 Apr 2024 13:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="AT/+lOFA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/zV4zyOZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AT/+lOFA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/zV4zyOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00AA8113343
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 270445CDA3;
 Wed, 10 Apr 2024 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw83kzTxKgFnzeBvNYY50kx9RaxAIFUaqhtm0tLPWuE=;
 b=AT/+lOFAfWUqfpXonPd5kOkj8oaKsUXTCzhkXKiiYBn8E6gXbp+ByUC5qIB73azPJ7oMf1
 GNp4vtC87eTGfL3mO1eLbfuoBjwyV7OfMb7eiL+JgEHbajH11dsaVQ+k3+syXolYNSMR1L
 zmL+96a1pFJWtdIxy/F+aBbGTXFaCWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw83kzTxKgFnzeBvNYY50kx9RaxAIFUaqhtm0tLPWuE=;
 b=/zV4zyOZbrCEamUoJmyqg75V+MRNSVtZ/0bPHzkcu+n5WuGhssL97esnHGH4cwx9s9hC9N
 /wZ04BMVR4RMXgDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw83kzTxKgFnzeBvNYY50kx9RaxAIFUaqhtm0tLPWuE=;
 b=AT/+lOFAfWUqfpXonPd5kOkj8oaKsUXTCzhkXKiiYBn8E6gXbp+ByUC5qIB73azPJ7oMf1
 GNp4vtC87eTGfL3mO1eLbfuoBjwyV7OfMb7eiL+JgEHbajH11dsaVQ+k3+syXolYNSMR1L
 zmL+96a1pFJWtdIxy/F+aBbGTXFaCWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw83kzTxKgFnzeBvNYY50kx9RaxAIFUaqhtm0tLPWuE=;
 b=/zV4zyOZbrCEamUoJmyqg75V+MRNSVtZ/0bPHzkcu+n5WuGhssL97esnHGH4cwx9s9hC9N
 /wZ04BMVR4RMXgDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E523413AA4;
 Wed, 10 Apr 2024 13:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id mOVVNreOFmYdEgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:05:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/43] fbdev/deferred-io: Clean up pageref on lastclose
Date: Wed, 10 Apr 2024 15:01:59 +0200
Message-ID: <20240410130557.31572-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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

Clean up the pageref state as part of the lastclose helper. This
only requires to clear the page's mapping field. The pageref and
page can stay in place for the next opened instance of the frame-
buffer file.

With the change in the clean-up logic, there's no further need
to look up pages during the lastclose cleanup. The code instead
uses the existing pagerefs in its look-up table. It also avoids
using smem_len, which some driver might not set correctly.

v2:
- fix typos in commit message (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index bff1e300ed6bb..f23b1cbe67192 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -62,6 +62,14 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
 	return pageref;
 }
 
+static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
+{
+	struct page *page = pageref->page;
+
+	if (page)
+		page->mapping = NULL;
+}
+
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
@@ -330,16 +338,13 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
 static void fb_deferred_io_lastclose(struct fb_info *info)
 {
-	struct page *page;
-	int i;
+	unsigned long i;
 
 	flush_delayed_work(&info->deferred_work);
 
 	/* clear out the mapping that we setup */
-	for (i = 0 ; i < info->fix.smem_len; i += PAGE_SIZE) {
-		page = fb_deferred_io_page(info, i);
-		page->mapping = NULL;
-	}
+	for (i = 0; i < info->npagerefs; ++i)
+		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
 }
 
 void fb_deferred_io_release(struct fb_info *info)
-- 
2.44.0

