Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1806D99D4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AB510EBEC;
	Thu,  6 Apr 2023 14:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901DB10EBE1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:30:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 452611FE30;
 Thu,  6 Apr 2023 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680791424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+46qFTFMNcdHLr7CFpxgNQZLup0NYTKzSP4VBItIjug=;
 b=pyCgUmovT6q4il8l+8jwHCjU+r2dumG5cOIbYgn6QwKo5mjPKoyXEkL6mn/JOa7jmitEUE
 1nNmmdoYhFfSAYM/vq7EO8I3Z7C6xxUA1gdTXL41iMqFe5RQfPbKRYzzG0BjlT9PQX6QHB
 bSlHzmOx8rDRrDsEWcchZmco18KKYjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680791424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+46qFTFMNcdHLr7CFpxgNQZLup0NYTKzSP4VBItIjug=;
 b=Y9HAV9prH3F81NWxZhDDga/ToiVk5bNBuJD+zfFrt4Kjiw8AjQuqnNHtPPk4xIOreovs3r
 AQ4ONMQQQGGVsGCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DCEF713A1D;
 Thu,  6 Apr 2023 14:30:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QEQeNX/XLmS4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 14:30:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v2 07/19] arch/m68k: Merge variants of fb_pgprotect() into
 single function
Date: Thu,  6 Apr 2023 16:30:07 +0200
Message-Id: <20230406143019.6709-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406143019.6709-1-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merge all variants of fb_pgprotect() into a single function body.
There are two different cases for MMU systems. For non-MMU systems,
the function body will be empty. No functional changes, but this
will help with the switch to <asm-generic/fb.h>.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/m68k/include/asm/fb.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/include/asm/fb.h b/arch/m68k/include/asm/fb.h
index b86c6e2e26dd..4f96989922af 100644
--- a/arch/m68k/include/asm/fb.h
+++ b/arch/m68k/include/asm/fb.h
@@ -7,17 +7,13 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 
-#ifdef CONFIG_MMU
-#ifdef CONFIG_SUN3
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
+#ifdef CONFIG_MMU
+#ifdef CONFIG_SUN3
 	pgprot_val(vma->vm_page_prot) |= SUN3_PAGE_NOCACHE;
-}
 #else
-static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
-				unsigned long off)
-{
 	if (CPU_IS_020_OR_030)
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE030;
 	if (CPU_IS_040_OR_060) {
@@ -25,11 +21,9 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 		/* Use no-cache mode, serialized */
 		pgprot_val(vma->vm_page_prot) |= _PAGE_NOCACHE_S;
 	}
-}
 #endif /* CONFIG_SUN3 */
-#else
-#define fb_pgprotect(...) do {} while (0)
 #endif /* CONFIG_MMU */
+}
 
 static inline int fb_is_primary_device(struct fb_info *info)
 {
-- 
2.40.0

