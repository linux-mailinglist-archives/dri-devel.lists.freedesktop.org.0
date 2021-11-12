Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41344E85F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB40C6EA5B;
	Fri, 12 Nov 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2A46E492
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B636B1FD66;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoR6MvPkC61AUyttkMy5Vw19Py+e2an9TJaCWcX7h0A=;
 b=eHFm7Vh3beIToLtWjPxafzJMe1FSz7z6d0j64GjKCdXRBJr+1Kyud0bhN4gPsCeu1RcGEU
 d0Y1nEJJwplUaSsGXd3pIY+sGg/oXP9VUGg8jc6VuzwA5erW7HuAbPGdGFKxb4R+uHRe3d
 rCaUs357BSaPuwYB+GNSaoZwXJZDElI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YoR6MvPkC61AUyttkMy5Vw19Py+e2an9TJaCWcX7h0A=;
 b=qjS/4HlJwul82lE4XKfGhse+2a4uhG9otCx1i4oQump0q8st5v8gbhU2NRdBMnzpOUpKU+
 h7lKi+jZW57twZBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 731C813DB2;
 Fri, 12 Nov 2021 14:16:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kBomGz93jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 5/7] agp/nvidia: Ignore value returned by readl()
Date: Fri, 12 Nov 2021 15:16:26 +0100
Message-Id: <20211112141628.12904-6-tzimmermann@suse.de>
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

  drivers/char/agp/nvidia-agp.c: In function 'nvidia_tlbflush':
  drivers/char/agp/nvidia-agp.c:264:22: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
    264 |         u32 wbc_reg, temp;

by removing the unused variable. The affected readl() is only
required for flushing caches, but the returned value is not of
interest.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/nvidia-agp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp.c
index f78e756157db..437b3581cbe5 100644
--- a/drivers/char/agp/nvidia-agp.c
+++ b/drivers/char/agp/nvidia-agp.c
@@ -261,7 +261,7 @@ static int nvidia_remove_memory(struct agp_memory *mem, off_t pg_start, int type
 static void nvidia_tlbflush(struct agp_memory *mem)
 {
 	unsigned long end;
-	u32 wbc_reg, temp;
+	u32 wbc_reg;
 	int i;
 
 	/* flush chipset */
@@ -283,9 +283,9 @@ static void nvidia_tlbflush(struct agp_memory *mem)
 
 	/* flush TLB entries */
 	for (i = 0; i < 32 + 1; i++)
-		temp = readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));
+		(void)readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));
 	for (i = 0; i < 32 + 1; i++)
-		temp = readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));
+		(void)readl(nvidia_private.aperture+(i * PAGE_SIZE / sizeof(u32)));
 }
 
 
-- 
2.33.1

