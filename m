Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20E6F661E
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 09:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F291B10E3B8;
	Thu,  4 May 2023 07:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6E410E3AF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 07:45:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DCB6521E23;
 Thu,  4 May 2023 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683186343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNHGpfeEoFZaZgDZmAzAk8SByrINvyn8BYmSDsR2dn0=;
 b=sFcy21Ql2UKf/Hk2s1FSODBqXFLJQDwnwqAeWirG6E5GrE7dopa/1N7qqJFnokSsMo/0fu
 75rVnWyoSOAVkV1Q9aPvY86HDt8UhViuAd74bBXvE6+9ormyenknUefpJNvVKvLx8Gj6o5
 dusZxOkDJYghXljr/HKiBf9xik/fVEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683186343;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lNHGpfeEoFZaZgDZmAzAk8SByrINvyn8BYmSDsR2dn0=;
 b=hmvp15/TjSHPkD0HoCb1x243RHTH6eieZN8JzPv0vBujsNipyx9G8NFmj0f3jEQJVqkWN+
 ICBL8ZMkfhWLB2Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C8A213A90;
 Thu,  4 May 2023 07:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EF+WHadiU2S6HAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 04 May 2023 07:45:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
 vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 davem@davemloft.net, James.Bottomley@HansenPartnership.com, arnd@arndb.de,
 sam@ravnborg.org
Subject: [PATCH v4 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
Date: Thu,  4 May 2023 09:45:38 +0200
Message-Id: <20230504074539.8181-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504074539.8181-1-tzimmermann@suse.de>
References: <20230504074539.8181-1-tzimmermann@suse.de>
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
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement framebuffer I/O helpers, such as fb_read*() and fb_write*(),
in the architecture's <asm/fb.h> header file or the generic one.

The common case has been the use of regular I/O functions, such as
__raw_readb() or memset_io(). A few architectures used plain system-
memory reads and writes. Sparc used helpers for its SBus.

The architectures that used special cases provide the same code in
their __raw_*() I/O helpers. So the patch replaces this code with the
__raw_*() functions and moves it to <asm-generic/fb.h> for all
architectures.

v4:
	* ia64, loongarch, sparc64: add fb_mem*() to arch headers
	  to keep current semantics (Arnd)
v3:
	* implement all architectures with generic helpers
	* support reordering and native byte order (Geert, Arnd)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/ia64/include/asm/fb.h      |  20 +++++++
 arch/loongarch/include/asm/fb.h |  21 +++++++
 arch/sparc/include/asm/fb.h     |  20 +++++++
 include/asm-generic/fb.h        | 101 ++++++++++++++++++++++++++++++++
 include/linux/fb.h              |  53 -----------------
 5 files changed, 162 insertions(+), 53 deletions(-)

diff --git a/arch/ia64/include/asm/fb.h b/arch/ia64/include/asm/fb.h
index 0208f64a0da0..bcf982043a5c 100644
--- a/arch/ia64/include/asm/fb.h
+++ b/arch/ia64/include/asm/fb.h
@@ -2,7 +2,9 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
 #include <linux/efi.h>
+#include <linux/string.h>
 
 #include <asm/page.h>
 
@@ -18,6 +20,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 }
 #define fb_pgprotect fb_pgprotect
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/loongarch/include/asm/fb.h b/arch/loongarch/include/asm/fb.h
index ff82f20685c8..c6fc7ef374a4 100644
--- a/arch/loongarch/include/asm/fb.h
+++ b/arch/loongarch/include/asm/fb.h
@@ -5,6 +5,27 @@
 #ifndef _ASM_FB_H_
 #define _ASM_FB_H_
 
+#include <linux/compiler.h>
+#include <linux/string.h>
+
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy(to, (void __force *)from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy((void __force *)to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset((void __force *)addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _ASM_FB_H_ */
diff --git a/arch/sparc/include/asm/fb.h b/arch/sparc/include/asm/fb.h
index 689ee5c60054..077da91aeba1 100644
--- a/arch/sparc/include/asm/fb.h
+++ b/arch/sparc/include/asm/fb.h
@@ -2,6 +2,8 @@
 #ifndef _SPARC_FB_H_
 #define _SPARC_FB_H_
 
+#include <linux/io.h>
+
 struct fb_info;
 struct file;
 struct vm_area_struct;
@@ -16,6 +18,24 @@ static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
 int fb_is_primary_device(struct fb_info *info);
 #define fb_is_primary_device fb_is_primary_device
 
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	sbus_memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	sbus_memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	sbus_memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+
 #include <asm-generic/fb.h>
 
 #endif /* _SPARC_FB_H_ */
diff --git a/include/asm-generic/fb.h b/include/asm-generic/fb.h
index c8af99f5a535..6ef624b3ce12 100644
--- a/include/asm-generic/fb.h
+++ b/include/asm-generic/fb.h
@@ -30,4 +30,105 @@ static inline int fb_is_primary_device(struct fb_info *info)
 }
 #endif
 
+/*
+ * I/O helpers for the framebuffer. Prefer these functions over their
+ * regular counterparts. The regular I/O functions provide in-order
+ * access and swap bytes to/from little-endian ordering. Neither is
+ * required for framebuffers. Instead, the helpers read and write
+ * raw framebuffer data. Independent operations can be reordered for
+ * improved performance.
+ */
+
+#ifndef fb_readb
+static inline u8 fb_readb(const volatile void __iomem *addr)
+{
+	return __raw_readb(addr);
+}
+#define fb_readb fb_readb
+#endif
+
+#ifndef fb_readw
+static inline u16 fb_readw(const volatile void __iomem *addr)
+{
+	return __raw_readw(addr);
+}
+#define fb_readw fb_readw
+#endif
+
+#ifndef fb_readl
+static inline u32 fb_readl(const volatile void __iomem *addr)
+{
+	return __raw_readl(addr);
+}
+#define fb_readl fb_readl
+#endif
+
+#ifndef fb_readq
+#if defined(__raw_readq)
+static inline u64 fb_readq(const volatile void __iomem *addr)
+{
+	return __raw_readq(addr);
+}
+#define fb_readq fb_readq
+#endif
+#endif
+
+#ifndef fb_writeb
+static inline void fb_writeb(u8 b, volatile void __iomem *addr)
+{
+	__raw_writeb(b, addr);
+}
+#define fb_writeb fb_writeb
+#endif
+
+#ifndef fb_writew
+static inline void fb_writew(u16 b, volatile void __iomem *addr)
+{
+	__raw_writew(b, addr);
+}
+#define fb_writew fb_writew
+#endif
+
+#ifndef fb_writel
+static inline void fb_writel(u32 b, volatile void __iomem *addr)
+{
+	__raw_writel(b, addr);
+}
+#define fb_writel fb_writel
+#endif
+
+#ifndef fb_writeq
+#if defined(__raw_writeq)
+static inline void fb_writeq(u64 b, volatile void __iomem *addr)
+{
+	__raw_writeq(b, addr);
+}
+#define fb_writeq fb_writeq
+#endif
+#endif
+
+#ifndef fb_memcpy_fromfb
+static inline void fb_memcpy_fromfb(void *to, const volatile void __iomem *from, size_t n)
+{
+	memcpy_fromio(to, from, n);
+}
+#define fb_memcpy_fromfb fb_memcpy_fromfb
+#endif
+
+#ifndef fb_memcpy_tofb
+static inline void fb_memcpy_tofb(volatile void __iomem *to, const void *from, size_t n)
+{
+	memcpy_toio(to, from, n);
+}
+#define fb_memcpy_tofb fb_memcpy_tofb
+#endif
+
+#ifndef fb_memset
+static inline void fb_memset(volatile void __iomem *addr, int c, size_t n)
+{
+	memset_io(addr, c, n);
+}
+#define fb_memset fb_memset
+#endif
+
 #endif /* __ASM_GENERIC_FB_H_ */
diff --git a/include/linux/fb.h b/include/linux/fb.h
index c0f97160ebbf..eb7e52940c60 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -17,7 +17,6 @@
 #include <linux/slab.h>
 
 #include <asm/fb.h>
-#include <asm/io.h>
 
 struct vm_area_struct;
 struct fb_info;
@@ -513,58 +512,6 @@ struct fb_info {
  */
 #define STUPID_ACCELF_TEXT_SHIT
 
-// This will go away
-#if defined(__sparc__)
-
-/* We map all of our framebuffers such that big-endian accesses
- * are what we want, so the following is sufficient.
- */
-
-// This will go away
-#define fb_readb sbus_readb
-#define fb_readw sbus_readw
-#define fb_readl sbus_readl
-#define fb_readq sbus_readq
-#define fb_writeb sbus_writeb
-#define fb_writew sbus_writew
-#define fb_writel sbus_writel
-#define fb_writeq sbus_writeq
-#define fb_memset sbus_memset_io
-#define fb_memcpy_fromfb sbus_memcpy_fromio
-#define fb_memcpy_tofb sbus_memcpy_toio
-
-#elif defined(__i386__) || defined(__alpha__) || defined(__x86_64__) ||	\
-	defined(__hppa__) || defined(__sh__) || defined(__powerpc__) ||	\
-	defined(__arm__) || defined(__aarch64__) || defined(__mips__)
-
-#define fb_readb __raw_readb
-#define fb_readw __raw_readw
-#define fb_readl __raw_readl
-#define fb_readq __raw_readq
-#define fb_writeb __raw_writeb
-#define fb_writew __raw_writew
-#define fb_writel __raw_writel
-#define fb_writeq __raw_writeq
-#define fb_memset memset_io
-#define fb_memcpy_fromfb memcpy_fromio
-#define fb_memcpy_tofb memcpy_toio
-
-#else
-
-#define fb_readb(addr) (*(volatile u8 *) (addr))
-#define fb_readw(addr) (*(volatile u16 *) (addr))
-#define fb_readl(addr) (*(volatile u32 *) (addr))
-#define fb_readq(addr) (*(volatile u64 *) (addr))
-#define fb_writeb(b,addr) (*(volatile u8 *) (addr) = (b))
-#define fb_writew(b,addr) (*(volatile u16 *) (addr) = (b))
-#define fb_writel(b,addr) (*(volatile u32 *) (addr) = (b))
-#define fb_writeq(b,addr) (*(volatile u64 *) (addr) = (b))
-#define fb_memset memset
-#define fb_memcpy_fromfb memcpy
-#define fb_memcpy_tofb memcpy
-
-#endif
-
 #define FB_LEFT_POS(p, bpp)          (fb_be_math(p) ? (32 - (bpp)) : 0)
 #define FB_SHIFT_HIGH(p, val, bits)  (fb_be_math(p) ? (val) >> (bits) : \
 						      (val) << (bits))
-- 
2.40.1

