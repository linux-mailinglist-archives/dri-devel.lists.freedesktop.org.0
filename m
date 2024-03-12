Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 557268797F3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B75112EBB;
	Tue, 12 Mar 2024 15:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RqMcKcZA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2/H9PaM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RqMcKcZA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B2/H9PaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6DC112EB8
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:48:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05D0237874;
 Tue, 12 Mar 2024 15:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iYwrieOkLADkBicbIsw2X7C23nK5mP439QApSR+pM0=;
 b=RqMcKcZA8CBNMWSXfJ3VbzDUgXxF8ReP35XNsORwdJIDFMdC7Gfjbp4WRZt5WvKpn+dmn9
 g0Z+Lb0N1aPc0rJStp359JCHhYlxY4cUdj7x8sPoKSoanLT09nQ7wMgMMFR02oiowTSzx2
 bbnvKOj7eeiZZXkU5TRwFyLL2c3ycuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iYwrieOkLADkBicbIsw2X7C23nK5mP439QApSR+pM0=;
 b=B2/H9PaMfpDKkjlG712xLDoDtN9NOIDTy4cVg2l/jYXhPbth89cJlEDYlIW4Gi2S9pw4Kc
 QWuvVYcxDAjQLBCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1710258518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iYwrieOkLADkBicbIsw2X7C23nK5mP439QApSR+pM0=;
 b=RqMcKcZA8CBNMWSXfJ3VbzDUgXxF8ReP35XNsORwdJIDFMdC7Gfjbp4WRZt5WvKpn+dmn9
 g0Z+Lb0N1aPc0rJStp359JCHhYlxY4cUdj7x8sPoKSoanLT09nQ7wMgMMFR02oiowTSzx2
 bbnvKOj7eeiZZXkU5TRwFyLL2c3ycuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1710258518;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4iYwrieOkLADkBicbIsw2X7C23nK5mP439QApSR+pM0=;
 b=B2/H9PaMfpDKkjlG712xLDoDtN9NOIDTy4cVg2l/jYXhPbth89cJlEDYlIW4Gi2S9pw4Kc
 QWuvVYcxDAjQLBCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE84913976;
 Tue, 12 Mar 2024 15:48:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4FUkLVV58GUhPwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Mar 2024 15:48:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	deller@gmx.de,
	javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/43] fbdev/deferred-io: Clean up pageref on lastclose
Date: Tue, 12 Mar 2024 16:44:58 +0100
Message-ID: <20240312154834.26178-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312154834.26178-1-tzimmermann@suse.de>
References: <20240312154834.26178-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[7];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[24.69%]
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

Clean up the pageref state as part of the lastclose helper. This
only requirs to clear the page's mapping field. The pageref and
page can stay in place for the next opened instance of the frame-
buffer file.

With the change in the clean-up logic, here's no further need
to lookup pages during the lastclose cleanup. The code instead
uses the existing pagerefs in its look-up table. It also avoids
using smem_len, which some driver might not set correctly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

