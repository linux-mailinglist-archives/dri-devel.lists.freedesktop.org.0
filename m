Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDB96D80B4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 17:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12A010E9CF;
	Wed,  5 Apr 2023 15:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3E410E9CC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 15:06:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A13B2292B;
 Wed,  5 Apr 2023 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680707164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+mpH3lWZVvZZw0GybWkLSjYq5BHB3GhQ0nOupAiXow=;
 b=LicFqTX8fjTuSeh/l/X35bxlDP8B4FXjCkki3Zzy0w/RVJEJgln50MQlC+YwUsWpm+wsuW
 LsCrC01nzuORTKhFDmdTYEc6X+OHIeGCXRTgUpynsBs1avGAYwlpABTgYW99LxLym6Sx+3
 dj2ujuuTM5uRJXzkB2eWGjC4OaOBnLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680707164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+mpH3lWZVvZZw0GybWkLSjYq5BHB3GhQ0nOupAiXow=;
 b=fo63CBKskL51RafucPuzSsSF1hXQbpsETB7b4i611VZZXmf4SEguxv57DdUnJgnTRkCdq3
 2D0tIH/bnzU4gXCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED7E13A10;
 Wed,  5 Apr 2023 15:06:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wL/EKVuOLWTPIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:06:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: [PATCH 14/18] arch/powerpc: Implement <asm/fb.h> with generic helpers
Date: Wed,  5 Apr 2023 17:05:50 +0200
Message-Id: <20230405150554.30540-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405150554.30540-1-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
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
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the architecture's fb_is_primary_device() with the generic
one from <asm-generic/fb.h>. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/fb.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/fb.h b/arch/powerpc/include/asm/fb.h
index 6541ab77c5b9..5f1a2e5f7654 100644
--- a/arch/powerpc/include/asm/fb.h
+++ b/arch/powerpc/include/asm/fb.h
@@ -2,8 +2,8 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
-#include <linux/fb.h>
 #include <linux/fs.h>
+
 #include <asm/page.h>
 
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
@@ -13,10 +13,8 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 						 vma->vm_end - vma->vm_start,
 						 vma->vm_page_prot);
 }
+#define fb_pgprotect fb_pgprotect
 
-static inline int fb_is_primary_device(struct fb_info *info)
-{
-	return 0;
-}
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
-- 
2.40.0

