Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D666E4868
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6846D10E4B4;
	Mon, 17 Apr 2023 12:57:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A45A10E4A9
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:57:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A995021A91;
 Mon, 17 Apr 2023 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681736226; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBWm/Eu0c07u8Xvk5dygRLn1Yr7Deg++IVzIGW64CBY=;
 b=QIDnQQM6FqpjVgjC60BIzr4jVLzaGkJrPhU59Raug1vVtqluGTEOViO9AGJkOal2qP0Dhw
 aZzVrXsrEkBYww32/dW3b+o+nzsoWpJ3KlWyp/2eDW7Po7BW/deXGqlaSDhQpfJvzU431t
 7vS4Z5CGgWaKjF2W4IdAHL05KRzLHEY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681736226;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBWm/Eu0c07u8Xvk5dygRLn1Yr7Deg++IVzIGW64CBY=;
 b=ZsavFsQ/L/cdP5k8oM+73/uhqDnYVY4bVtRCFGtxGI8UdCvsLyzOZjdO14bzgBtVSfTG1F
 /seSez5j0RSvfPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 356921390E;
 Mon, 17 Apr 2023 12:57:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CEEjDCJCPWToWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:57:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v3 19/19] arch/x86: Implement <asm/fb.h> with generic helpers
Date: Mon, 17 Apr 2023 14:56:51 +0200
Message-Id: <20230417125651.25126-20-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230417125651.25126-1-tzimmermann@suse.de>
References: <20230417125651.25126-1-tzimmermann@suse.de>
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
 Dave Hansen <dave.hansen@linux.intel.com>, linux-ia64@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Include <asm-generic/fb.h> and set the required preprocessor tokens
correctly. x86 now implements its own set of fb helpers, but still
follows the overall pattern of the other <asm/fb.h> files.

v3:
	* clarified commit message

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/fb.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/fb.h b/arch/x86/include/asm/fb.h
index ab4c960146e3..a3fb801f12f1 100644
--- a/arch/x86/include/asm/fb.h
+++ b/arch/x86/include/asm/fb.h
@@ -2,10 +2,11 @@
 #ifndef _ASM_X86_FB_H
 #define _ASM_X86_FB_H
 
-#include <linux/fb.h>
-#include <linux/fs.h>
 #include <asm/page.h>
 
+struct fb_info;
+struct file;
+
 static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 				unsigned long off)
 {
@@ -16,7 +17,11 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 		pgprot_val(vma->vm_page_prot) =
 			prot | cachemode2protval(_PAGE_CACHE_MODE_UC_MINUS);
 }
+#define fb_pgprotect fb_pgprotect
+
+int fb_is_primary_device(struct fb_info *info);
+#define fb_is_primary_device fb_is_primary_device
 
-extern int fb_is_primary_device(struct fb_info *info);
+#include <asm-generic/fb.h>
 
 #endif /* _ASM_X86_FB_H */
-- 
2.40.0

