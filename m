Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B7E6E488E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 14:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96A710E4C3;
	Mon, 17 Apr 2023 12:57:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DB110E4A3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 12:57:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C065F1FE0A;
 Mon, 17 Apr 2023 12:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681736218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru6aiAlGGFSk3oxv/WkNVYSAAxligUi0QSfc0txZ3k0=;
 b=v+BfnvmqsA3hgoguS0rFKK5lGuftxV/k4xUjHEH1s6PaTBi+3H5qrzV0wa0wtZWBq0ms0M
 AQ2Lf/ylSX+IsFEaN1xBPv3bk8m6BzDfj7XNON4V9dqmHXW0C6RbUWX8u5P25zWB+RYDWE
 dH2j9/Zs85f9Tyno5ISJdBUcbtLmoZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681736218;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru6aiAlGGFSk3oxv/WkNVYSAAxligUi0QSfc0txZ3k0=;
 b=o+ecwzmhPjA2vClp8xR25gbA+HiLYyTkJiI00+L2E/xobRIO9fas8/92VjSytQXil7eQY+
 eccV3ufW+YMuTUDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 67F721391A;
 Mon, 17 Apr 2023 12:56:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EOqIGBpCPWToWwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 12:56:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de, daniel.vetter@ffwll.ch, deller@gmx.de, javierm@redhat.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v3 01/19] fbdev: Prepare generic architecture helpers
Date: Mon, 17 Apr 2023 14:56:33 +0200
Message-Id: <20230417125651.25126-2-tzimmermann@suse.de>
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
 linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generic implementations of fb_pgprotect() and fb_is_primary_device()
have been in the source code for a long time. Prepare the header file
to make use of them.

Improve the code by using an inline function for fb_pgprotect()
and by removing include statements. The default mode set by
fb_pgprotect() is now writecombine, which is what most platforms
want.

Symbols are protected by preprocessor guards. Architectures that
provide a symbol need to define a preprocessor token of the same
name and value. Otherwise the header file will provide a generic
implementation. This pattern has been taken from <asm/io.h>.

v3:
	* include the correct header files
v2:
	*  use writecombine mappings by default (Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/fb.h | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index f9f18101ed36..c8af99f5a535 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -1,13 +1,33 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
 #ifndef __ASM_GENERIC_FB_H_
 #define __ASM_GENERIC_FB_H_
-#include <linux/fb.h>
 
-#define fb_pgprotect(...) do {} while (0)
+/*
+ * Only include this header file from your architecture's <asm/fb.h>.
+ */
+
+#include <linux/mm_types.h>
+#include <linux/pgtable.h>
+
+struct fb_info;
+struct file;
+
+#ifndef fb_pgprotect
+#define fb_pgprotect fb_pgprotect
+static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
+				unsigned long off)
+{
+	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+}
+#endif
 
+#ifndef fb_is_primary_device
+#define fb_is_primary_device fb_is_primary_device
 static inline int fb_is_primary_device(struct fb_info *info)
 {
 	return 0;
 }
+#endif
 
 #endif /* __ASM_GENERIC_FB_H_ */
-- 
2.40.0

