Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC94B2267
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6848A10EA5B;
	Fri, 11 Feb 2022 09:46:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454710EA5D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 09:46:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B9D361F3A2;
 Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644572802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rr/O6TIKP8Y1rYJpt7Gr1aalvRe+WTfBbdZrMfRKh5o=;
 b=MrepO+7/J+2mJI0T7QTZ4QrH60NDHNZ0Dx2IjZ5wMz/7YyN2lNsxHlzWyLzSSdII6R1iAF
 wU7U5Q1OmPpGR5Y7yVhf/gCmzn8JvIpo71R1XsfZbNgr2LlMyzWoQWbil7r5r0NaO8aTCe
 nxGJ7M9FnUs/KmmYjm/x7Pl2pO+HKnE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644572802;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rr/O6TIKP8Y1rYJpt7Gr1aalvRe+WTfBbdZrMfRKh5o=;
 b=2YHAfBmv3pK1Za/cI43eXpKM9GF+XUowzoq7OyvzGqGR0/1TKKUrAjaTlbJj9vkV8MR6h5
 dVNODF+xg9MqDhDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7611513BDD;
 Fri, 11 Feb 2022 09:46:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2ADPG4IwBmKMHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Feb 2022 09:46:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, javierm@redhat.com, noralf@tronnes.org,
 andriy.shevchenko@linux.intel.com, deller@gmx.de, bernie@plugable.com,
 jayalk@intworks.biz
Subject: [PATCH v2 1/2] fbdev/defio: Early-out if page is already enlisted
Date: Fri, 11 Feb 2022 10:46:39 +0100
Message-Id: <20220211094640.21632-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211094640.21632-1-tzimmermann@suse.de>
References: <20220211094640.21632-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return early if a page is already in the list of dirty pages for
deferred I/O. This can be detected if the page's list head is not
empty. Keep the list head initialized while the page is not enlisted
to make this work reliably.

v2:
	* update comment and fix spelling (Sam)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/core/fb_defio.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index a591d291b231..169a81c8172b 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -59,6 +59,7 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 		printk(KERN_ERR "no mapping available\n");
 
 	BUG_ON(!page->mapping);
+	INIT_LIST_HEAD(&page->lru);
 	page->index = vmf->pgoff;
 
 	vmf->page = page;
@@ -122,17 +123,24 @@ static vm_fault_t fb_deferred_io_mkwrite(struct vm_fault *vmf)
 	 */
 	lock_page(page);
 
+	/*
+	 * This check is to catch the case where a new process could start
+	 * writing to the same page through a new PTE. This new access
+	 * can cause a call to .page_mkwrite even if the original process'
+	 * PTE is marked writable.
+	 *
+	 * TODO: The lru field is owned by the page cache; hence the name.
+	 *       We dequeue in fb_deferred_io_work() after flushing the
+	 *       page's content into video memory. Instead of lru, fbdefio
+	 *       should have it's own field.
+	 */
+	if (!list_empty(&page->lru))
+		goto page_already_added;
+
 	/* we loop through the pagelist before adding in order
 	to keep the pagelist sorted */
 	list_for_each_entry(cur, &fbdefio->pagelist, lru) {
-		/* this check is to catch the case where a new
-		process could start writing to the same page
-		through a new pte. this new access can cause the
-		mkwrite even when the original ps's pte is marked
-		writable */
-		if (unlikely(cur == page))
-			goto page_already_added;
-		else if (cur->index > page->index)
+		if (cur->index > page->index)
 			break;
 	}
 
@@ -194,7 +202,7 @@ static void fb_deferred_io_work(struct work_struct *work)
 
 	/* clear the list */
 	list_for_each_safe(node, next, &fbdefio->pagelist) {
-		list_del(node);
+		list_del_init(node);
 	}
 	mutex_unlock(&fbdefio->lock);
 }
-- 
2.34.1

