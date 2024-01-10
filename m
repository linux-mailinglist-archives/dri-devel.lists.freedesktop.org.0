Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FBD828087
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:24:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93A10E3BA;
	Tue,  9 Jan 2024 08:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sakura.ysato.name (ik1-413-38519.vs.sakura.ne.jp
 [153.127.30.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5494310E3BA
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 08:23:59 +0000 (UTC)
Received: from SIOS1075.ysato.name (ZM005235.ppp.dion.ne.jp [222.8.5.235])
 by sakura.ysato.name (Postfix) with ESMTPSA id 1B3CE1C065E;
 Tue,  9 Jan 2024 17:23:57 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: linux-sh@vger.kernel.org
Subject: [DO NOT MERGE v6 10/37] sh: Common PCI Framework driver support.
Date: Tue,  9 Jan 2024 17:23:07 +0900
Message-Id: <bdaac527d4bd3638f4506ebaae472464c6842d57.1704788539.git.ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704788539.git.ysato@users.sourceforge.jp>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add New OF based PCI Host driver.
This driver conflicts some point in legacy PCI driver.
To resolve the conflict, I made some changes to the legacy driver.

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 arch/sh/include/asm/io.h  |  6 ++++++
 arch/sh/include/asm/pci.h |  4 ++++
 arch/sh/kernel/iomap.c    | 18 ++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
index 5429b4169dc8..51312f356fb9 100644
--- a/arch/sh/include/asm/io.h
+++ b/arch/sh/include/asm/io.h
@@ -20,6 +20,7 @@
 #include <asm/page.h>
 #include <linux/pgtable.h>
 #include <asm-generic/iomap.h>
+#include <linux/ioport.h>
 
 #define __IO_PREFIX     generic
 #include <asm/io_generic.h>
@@ -319,4 +320,9 @@ unsigned long long poke_real_address_q(unsigned long long addr,
 int valid_phys_addr_range(phys_addr_t addr, size_t size);
 int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
 
+#if defined(CONFIG_PCI) && !defined(CONFIG_GENERIC_IOMAP)
+#define pci_remap_iospace pci_remap_iospace
+int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr);
+#endif
+
 #endif /* __ASM_SH_IO_H */
diff --git a/arch/sh/include/asm/pci.h b/arch/sh/include/asm/pci.h
index 54c30126ea17..92b3bd604319 100644
--- a/arch/sh/include/asm/pci.h
+++ b/arch/sh/include/asm/pci.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PCI_H
 #define __ASM_SH_PCI_H
 
+#ifndef CONFIG_SH_DEVICE_TREE
 /* Can be used to override the logic in pci_scan_bus for skipping
    already-configured bus numbers - to be used for buggy BIOSes
    or architectures with incomplete PCI setup by the loader */
@@ -88,4 +89,7 @@ static inline int pci_proc_domain(struct pci_bus *bus)
 	return hose->need_domain_info;
 }
 
+#else /* CONFIG_SH_DEVICE_TREE */
+#include <asm-generic/pci.h>
+#endif
 #endif /* __ASM_SH_PCI_H */
diff --git a/arch/sh/kernel/iomap.c b/arch/sh/kernel/iomap.c
index 0a0dff4e66de..968b15868d9a 100644
--- a/arch/sh/kernel/iomap.c
+++ b/arch/sh/kernel/iomap.c
@@ -160,3 +160,21 @@ void iowrite32_rep(void __iomem *addr, const void *src, unsigned long count)
 	mmio_outsl(addr, src, count);
 }
 EXPORT_SYMBOL(iowrite32_rep);
+
+#if defined(CONFIG_PCI) && !defined(CONFIG_GENERIC_IOMAP)
+int pci_remap_iospace(const struct resource *res, phys_addr_t phys_addr)
+{
+	unsigned long vaddr = res->start;
+
+	if (!(res->flags & IORESOURCE_IO))
+		return -EINVAL;
+
+	if (res->end > IO_SPACE_LIMIT)
+		return -EINVAL;
+
+	__set_io_port_base(phys_addr);
+	return ioremap_page_range(vaddr, vaddr + resource_size(res), phys_addr,
+				  pgprot_device(PAGE_KERNEL));
+}
+EXPORT_SYMBOL(pci_remap_iospace);
+#endif
-- 
2.39.2

