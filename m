Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1B89F355
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7838113345;
	Wed, 10 Apr 2024 13:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xLLDlWr1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6AeWC0N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xLLDlWr1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L6AeWC0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFD1113342
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:06:01 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60B80351E6;
 Wed, 10 Apr 2024 13:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oNAN117oUsDvrSMdXnfdZZrJ5BgRROAhbs+ZdDMtKU=;
 b=xLLDlWr1mpxQe9XjaH8scDRlb+6dZrA4vcIUCRZ+dgIKFKK33Uo3YxPPU01bbnQBAM/tNI
 QuYJO07GdScuo4KOlPD3QXzzSCSJ+H7ODwkOscT5qgZ4lIqVzh5cIa3tBNE8sgeZW4FK/X
 OzKMmYRhzgcU51Z0IQ9PIBc3ko2BrSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oNAN117oUsDvrSMdXnfdZZrJ5BgRROAhbs+ZdDMtKU=;
 b=L6AeWC0NPfjnxOV4KRMarH345/4Gn1leJPXLSB0fR+Gaa77IAGYtMUW1yij2ID7kcEdhjn
 TdzRy08IRxOiQxDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xLLDlWr1;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L6AeWC0N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712754360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oNAN117oUsDvrSMdXnfdZZrJ5BgRROAhbs+ZdDMtKU=;
 b=xLLDlWr1mpxQe9XjaH8scDRlb+6dZrA4vcIUCRZ+dgIKFKK33Uo3YxPPU01bbnQBAM/tNI
 QuYJO07GdScuo4KOlPD3QXzzSCSJ+H7ODwkOscT5qgZ4lIqVzh5cIa3tBNE8sgeZW4FK/X
 OzKMmYRhzgcU51Z0IQ9PIBc3ko2BrSQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712754360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oNAN117oUsDvrSMdXnfdZZrJ5BgRROAhbs+ZdDMtKU=;
 b=L6AeWC0NPfjnxOV4KRMarH345/4Gn1leJPXLSB0fR+Gaa77IAGYtMUW1yij2ID7kcEdhjn
 TdzRy08IRxOiQxDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 29A1013AB8;
 Wed, 10 Apr 2024 13:06:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id QJXgCLiOFmYdEgAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Apr 2024 13:06:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/43] fbdev/deferred-io: Test screen_buffer for vmalloc'ed
 memory
Date: Wed, 10 Apr 2024 15:02:00 +0200
Message-ID: <20240410130557.31572-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410130557.31572-1-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-0.62 / 50.00]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; BAYES_HAM(-0.61)[82.00%];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de,gmail.com,ffwll.ch];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
 RCPT_COUNT_SEVEN(0.00)[7];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Rspamd-Queue-Id: 60B80351E6
X-Spam-Flag: NO
X-Spam-Score: -0.62
X-Spamd-Bar: /
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

Framebuffers in virtual memory are available via screen_buffer. Use
it instead of screen_base and avoid the type casting.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/core/fb_defio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index f23b1cbe67192..b38f775cd39dd 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -25,11 +25,11 @@
 
 static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs)
 {
-	void *screen_base = (void __force *) info->screen_base;
+	const void *screen_buffer = info->screen_buffer;
 	struct page *page;
 
-	if (is_vmalloc_addr(screen_base + offs))
-		page = vmalloc_to_page(screen_base + offs);
+	if (is_vmalloc_addr(screen_buffer + offs))
+		page = vmalloc_to_page(screen_buffer + offs);
 	else
 		page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);
 
-- 
2.44.0

