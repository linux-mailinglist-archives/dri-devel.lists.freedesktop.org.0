Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3023464D33
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B956F96F;
	Wed,  1 Dec 2021 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EB36F953
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 11:46:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B8921FD5A;
 Wed,  1 Dec 2021 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYOoB7zo4oS2M3XqRScObYCr9q4i0eNyfbhXmwpoONA=;
 b=JbhaiV8gZS/19GUT8z9PO6ToQK4QN0n/r+qM0N3euVdb4G8vJ8Rjbw5nch5Z7mqOqZmhbO
 mWyKPJJ/DGqgwfpFHmkKWPpWiIi4aaFVIuXM9q8/js6qL6la3WuToYJRS5F+sYN5NCFN/N
 9Br5eoHoo1aANaa8tGdTrHsdtmgjt3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZYOoB7zo4oS2M3XqRScObYCr9q4i0eNyfbhXmwpoONA=;
 b=aaF1wPpHpuploa9LBfeQGsPKR/VvbXHksEP8BA2VmIfOmlS5C3Q6tKLzZL3BHAkJw3Q+os
 5RUAapAxESVfIZBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC3CD13B7E;
 Wed,  1 Dec 2021 11:46:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qHOhOKdgp2HbDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 11:46:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH v2 4/7] agp/ati: Return error from ati_create_page_map()
Date: Wed,  1 Dec 2021 12:46:42 +0100
Message-Id: <20211201114645.15384-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>
References: <20211201114645.15384-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the compiler warning

  drivers/char/agp/ati-agp.c: In function 'ati_create_page_map':
  drivers/char/agp/ati-agp.c:58:16: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    58 |         int i, err = 0;

by returing the error to the caller.

v2:
	* free page in error branch (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/ati-agp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/ati-agp.c b/drivers/char/agp/ati-agp.c
index 857b37141a07..6f5530482d83 100644
--- a/drivers/char/agp/ati-agp.c
+++ b/drivers/char/agp/ati-agp.c
@@ -55,7 +55,7 @@ static struct _ati_generic_private {
 
 static int ati_create_page_map(struct ati_page_map *page_map)
 {
-	int i, err = 0;
+	int i, err;
 
 	page_map->real = (unsigned long *) __get_free_page(GFP_KERNEL);
 	if (page_map->real == NULL)
@@ -63,6 +63,10 @@ static int ati_create_page_map(struct ati_page_map *page_map)
 
 	set_memory_uc((unsigned long)page_map->real, 1);
 	err = map_page_into_agp(virt_to_page(page_map->real));
+	if (err) {
+		free_page((unsigned long)page_map->real);
+		return err;
+	}
 	page_map->remapped = page_map->real;
 
 	for (i = 0; i < PAGE_SIZE / sizeof(unsigned long); i++) {
-- 
2.34.0

