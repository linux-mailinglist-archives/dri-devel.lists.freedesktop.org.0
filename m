Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555944E862
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5776EB71;
	Fri, 12 Nov 2021 14:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 845176E489
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 704481FD65;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYkVQxCpGIe8Oerdwq+ifgLKV//0whlnCsIVp7KxMOE=;
 b=ik32W5/KjAz8/MdHrFlIK7Uel3WWzeRpH+Dciih5L80BQx+W7B93cxMjlKG+V4UYEo19qr
 +bTu19GjgysFI9WeO2CiCpaqIcK6f4/+suiNmtHzsXJH/tTZfjSxVWQqHJWnNEM7v7aEmV
 fVCw09ZQfpiEDQsmgTZ55kqUffGpKJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYkVQxCpGIe8Oerdwq+ifgLKV//0whlnCsIVp7KxMOE=;
 b=VmWfe5mp0mF/2gbu9FNyBLVvjNrzF39qEb+Zul8S6d1IfquSCu5CnvkVMMTrJQf7iyVHpn
 /nd0L7zHWge1EpBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3856413C7C;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uMLSDD93jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 4/7] agp/ati: Return error from ati_create_page_map()
Date: Fri, 12 Nov 2021 15:16:25 +0100
Message-Id: <20211112141628.12904-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>
References: <20211112141628.12904-1-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/ati-agp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/ati-agp.c b/drivers/char/agp/ati-agp.c
index 857b37141a07..785cc1ecf4e0 100644
--- a/drivers/char/agp/ati-agp.c
+++ b/drivers/char/agp/ati-agp.c
@@ -55,7 +55,7 @@ static struct _ati_generic_private {
 
 static int ati_create_page_map(struct ati_page_map *page_map)
 {
-	int i, err = 0;
+	int i, err;
 
 	page_map->real = (unsigned long *) __get_free_page(GFP_KERNEL);
 	if (page_map->real == NULL)
@@ -63,6 +63,8 @@ static int ati_create_page_map(struct ati_page_map *page_map)
 
 	set_memory_uc((unsigned long)page_map->real, 1);
 	err = map_page_into_agp(virt_to_page(page_map->real));
+	if (err)
+		goto err_free_page;
 	page_map->remapped = page_map->real;
 
 	for (i = 0; i < PAGE_SIZE / sizeof(unsigned long); i++) {
@@ -71,6 +73,10 @@ static int ati_create_page_map(struct ati_page_map *page_map)
 	}
 
 	return 0;
+
+err_free_page:
+	free_page((unsigned long)page_map->real);
+	return err;
 }
 
 
-- 
2.33.1

