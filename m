Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QADdHuFgnWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A233183A57
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1412F10E4E2;
	Tue, 24 Feb 2026 08:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KszRNtf7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U0rPSPaU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KszRNtf7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U0rPSPaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94710E4E2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:27:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F1B13F108;
 Tue, 24 Feb 2026 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdDp3Bv7tU3COHkPpmYTlEkjEedXH+NtQwVXbDV5TZ0=;
 b=KszRNtf7qpCWVwOHQVYzSZupCL/SR0lM3deUgC4sOfFIVpRlX2JcFB+aL/e/qotBXrGwY8
 zrvGmE69GaK6XJNCiGfnTA5SmDHeBHeSzRTEx3Rc6jSDH1Suz+D40pctYMjv+wyf/+Ix66
 oryWvCn354UejCzp9uL2JrV+FeZKIRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdDp3Bv7tU3COHkPpmYTlEkjEedXH+NtQwVXbDV5TZ0=;
 b=U0rPSPaU58rYbJB0QyZwv/GBLjtcND2umlRVscsunuEBBljaSg9xEpdtdtOdPfSAkEqNi1
 y5NmGMRslhFwSVCw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KszRNtf7;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=U0rPSPaU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771921623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdDp3Bv7tU3COHkPpmYTlEkjEedXH+NtQwVXbDV5TZ0=;
 b=KszRNtf7qpCWVwOHQVYzSZupCL/SR0lM3deUgC4sOfFIVpRlX2JcFB+aL/e/qotBXrGwY8
 zrvGmE69GaK6XJNCiGfnTA5SmDHeBHeSzRTEx3Rc6jSDH1Suz+D40pctYMjv+wyf/+Ix66
 oryWvCn354UejCzp9uL2JrV+FeZKIRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771921623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdDp3Bv7tU3COHkPpmYTlEkjEedXH+NtQwVXbDV5TZ0=;
 b=U0rPSPaU58rYbJB0QyZwv/GBLjtcND2umlRVscsunuEBBljaSg9xEpdtdtOdPfSAkEqNi1
 y5NmGMRslhFwSVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D09153EA6C;
 Tue, 24 Feb 2026 08:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QCy3MdZgnWnVQAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 08:27:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	simona@ffwll.ch,
	jayalk@intworks.biz
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/4] fbdev: defio: Move pageref array to struct
 fb_deferred_io_state
Date: Tue, 24 Feb 2026 09:25:57 +0100
Message-ID: <20260224082657.207284-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224082657.207284-1-tzimmermann@suse.de>
References: <20260224082657.207284-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:simona@ffwll.ch,m:jayalk@intworks.biz,m:linux-fbdev@vger.kernel.org,m:tzimmermann@suse.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,ffwll.ch,intworks.biz];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2A233183A57
X-Rspamd-Action: no action

The pageref array stores all pageref structures for a device's defio
helpers. Move it into struct fb_deferred_io_state to not expose it to
drivers.

v2:
- use kvzalloc_objs()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fb_defio.c | 55 ++++++++++++++---------------
 include/linux/fb.h                  |  2 --
 2 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 35ac13727da1..a12dd25ab697 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -41,28 +41,46 @@ struct fb_deferred_io_state {
 	/* fields protected by lock */
 	struct fb_info *info;
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
+	unsigned long npagerefs;
+	struct fb_deferred_io_pageref *pagerefs;
 };
 
-static struct fb_deferred_io_state *fb_deferred_io_state_alloc(void)
+static struct fb_deferred_io_state *fb_deferred_io_state_alloc(unsigned long len)
 {
 	struct fb_deferred_io_state *fbdefio_state;
+	struct fb_deferred_io_pageref *pagerefs;
+	unsigned long npagerefs;
 
 	fbdefio_state = kzalloc_obj(*fbdefio_state);
 	if (!fbdefio_state)
 		return NULL;
 
+	npagerefs = DIV_ROUND_UP(len, PAGE_SIZE);
+
+	/* alloc a page ref for each page of the display memory */
+	pagerefs = kvzalloc_objs(*pagerefs, npagerefs);
+	if (!pagerefs)
+		goto err_kfree;
+	fbdefio_state->npagerefs = npagerefs;
+	fbdefio_state->pagerefs = pagerefs;
+
 	kref_init(&fbdefio_state->ref);
 	mutex_init(&fbdefio_state->lock);
 
 	INIT_LIST_HEAD(&fbdefio_state->pagereflist);
 
 	return fbdefio_state;
+
+err_kfree:
+	kfree(fbdefio_state);
+	return NULL;
 }
 
 static void fb_deferred_io_state_release(struct fb_deferred_io_state *fbdefio_state)
 {
 	WARN_ON(!list_empty(&fbdefio_state->pagereflist));
 	mutex_destroy(&fbdefio_state->lock);
+	kvfree(fbdefio_state->pagerefs);
 
 	kfree(fbdefio_state);
 }
@@ -125,18 +143,19 @@ static struct page *fb_deferred_io_get_page(struct fb_info *info, unsigned long
 	return page;
 }
 
-static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_info *info,
-								    unsigned long offset,
-								    struct page *page)
+static struct fb_deferred_io_pageref *
+fb_deferred_io_pageref_lookup(struct fb_deferred_io_state *fbdefio_state, unsigned long offset,
+			      struct page *page)
 {
+	struct fb_info *info = fbdefio_state->info;
 	unsigned long pgoff = offset >> PAGE_SHIFT;
 	struct fb_deferred_io_pageref *pageref;
 
-	if (fb_WARN_ON_ONCE(info, pgoff >= info->npagerefs))
+	if (fb_WARN_ON_ONCE(info, pgoff >= fbdefio_state->npagerefs))
 		return NULL; /* incorrect allocation size */
 
 	/* 1:1 mapping between pageref and page offset */
-	pageref = &info->pagerefs[pgoff];
+	pageref = &fbdefio_state->pagerefs[pgoff];
 
 	if (pageref->page)
 		goto out;
@@ -160,7 +179,7 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info
 	struct list_head *pos = &fbdefio_state->pagereflist;
 	struct fb_deferred_io_pageref *pageref, *cur;
 
-	pageref = fb_deferred_io_pageref_lookup(info, offset, page);
+	pageref = fb_deferred_io_pageref_lookup(fbdefio_state, offset, page);
 	if (!pageref)
 		return NULL;
 
@@ -397,16 +416,13 @@ int fb_deferred_io_init(struct fb_info *info)
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 	struct fb_deferred_io_state *fbdefio_state;
-	struct fb_deferred_io_pageref *pagerefs;
-	unsigned long npagerefs;
-	int ret;
 
 	BUG_ON(!fbdefio);
 
 	if (WARN_ON(!info->fix.smem_len))
 		return -EINVAL;
 
-	fbdefio_state = fb_deferred_io_state_alloc();
+	fbdefio_state = fb_deferred_io_state_alloc(info->fix.smem_len);
 	if (!fbdefio_state)
 		return -ENOMEM;
 	fbdefio_state->info = info;
@@ -415,24 +431,9 @@ int fb_deferred_io_init(struct fb_info *info)
 	if (fbdefio->delay == 0) /* set a default of 1 s */
 		fbdefio->delay = HZ;
 
-	npagerefs = DIV_ROUND_UP(info->fix.smem_len, PAGE_SIZE);
-
-	/* alloc a page ref for each page of the display memory */
-	pagerefs = kvzalloc_objs(*pagerefs, npagerefs);
-	if (!pagerefs) {
-		ret = -ENOMEM;
-		goto err;
-	}
-	info->npagerefs = npagerefs;
-	info->pagerefs = pagerefs;
-
 	info->fbdefio_state = fbdefio_state;
 
 	return 0;
-
-err:
-	fb_deferred_io_state_release(fbdefio_state);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_init);
 
@@ -475,7 +476,5 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 	mutex_unlock(&fbdefio_state->lock);
 
 	fb_deferred_io_state_put(fbdefio_state);
-
-	kvfree(info->pagerefs);
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 2791777f3a50..b27943719fab 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -482,8 +482,6 @@ struct fb_info {
 
 #ifdef CONFIG_FB_DEFERRED_IO
 	struct delayed_work deferred_work;
-	unsigned long npagerefs;
-	struct fb_deferred_io_pageref *pagerefs;
 	struct fb_deferred_io *fbdefio;
 	struct fb_deferred_io_state *fbdefio_state;
 #endif
-- 
2.52.0

