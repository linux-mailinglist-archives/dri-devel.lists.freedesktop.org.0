Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341E28772B2
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599281122AD;
	Sat,  9 Mar 2024 18:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rjNUirNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7661122B0
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2B348CE0908;
 Sat,  9 Mar 2024 18:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 851EFC433A6;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008149;
 bh=qynEqvo3qkPlnNSVVTQDQ11rLnDwkRSu974fAc9LoQU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=rjNUirNx2IQSAQ0drXNASFMNcadniZ627DsuPp4Y76m8OjEhdYM+sP+iJZdZNZ3Ga
 eU5EoHpw1i46K3+jcxPyp3oVSPPs7fzBf5Jyr4xkU7A5flfDvvcFQNoDEbwzO6g9cO
 w+eEdxsVLuWkA9KC9IgepOzIB1U23KFCKrUlDselQIDvJgJuUGjvn6M+cpPVn99Is0
 kQuWOAJ4Ro91hrQ37SwcjUfxAuYYiV7SHUa3O7MDHTHCqfYXp+jbsH3fPzeEfraYn+
 m2b/DoVbVM/SjG1dj5KlC4x2VuiWO8569DgB0bcAzWHEXnmIZXfg+h0m8tzfzEm5x/
 hwacS4XZk0iAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 730C6C54E63;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:36 +0100
Subject: [PATCH v2 15/28] sparc32: Drop check for sparc_model
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-15-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=7187;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=tllW43d1GW3WMngOVgWZ0ETwL5h7tz5yA1bpgQStwuk=; =?utf-8?q?b=3DFkfobzEGKy4q?=
 =?utf-8?q?7bXDQj7rSjW0qUzm17XSu/fr1lm8y+XuLLvpxqyAgAIKZRQl6b/XWGLR53mkW0nU?=
 mOqt7GgiALWMxV6hRk9BO7kCfc88oPOgZ97Cf6mgZMl0nY0uBXVu
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

sparc32 is always LEON, so no need to check for the model.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/cpu_type.h | 18 ---------
 arch/sparc/include/asm/io_32.h    |  4 +-
 arch/sparc/kernel/devices.c       |  7 +---
 arch/sparc/kernel/ioport.c        |  4 +-
 arch/sparc/kernel/leon_pmc.c      | 16 ++++----
 arch/sparc/kernel/setup_32.c      | 79 +--------------------------------------
 6 files changed, 12 insertions(+), 116 deletions(-)

diff --git a/arch/sparc/include/asm/cpu_type.h b/arch/sparc/include/asm/cpu_type.h
index 2b59799859d1..3e0154c3f41d 100644
--- a/arch/sparc/include/asm/cpu_type.h
+++ b/arch/sparc/include/asm/cpu_type.h
@@ -2,28 +2,10 @@
 #ifndef __ASM_CPU_TYPE_H
 #define __ASM_CPU_TYPE_H
 
-/*
- * Sparc (general) CPU types
- */
-enum sparc_cpu {
-  sun4m       = 0x00,
-  sun4d       = 0x01,
-  sun4e       = 0x02,
-  sun4u       = 0x03, /* V8 ploos ploos */
-  sun_unknown = 0x04,
-  ap1000      = 0x05, /* almost a sun4m */
-  sparc_leon  = 0x06, /* Leon SoC */
-};
-
 #ifdef CONFIG_SPARC32
-extern enum sparc_cpu sparc_cpu_model;
 
 #define SUN4M_NCPUS            4              /* Architectural limit of sun4m. */
 
-#else
-
-#define sparc_cpu_model sun4u
-
 #endif
 
 #endif /* __ASM_CPU_TYPE_H */
diff --git a/arch/sparc/include/asm/io_32.h b/arch/sparc/include/asm/io_32.h
index 549f0a72280d..83abe709d120 100644
--- a/arch/sparc/include/asm/io_32.h
+++ b/arch/sparc/include/asm/io_32.h
@@ -138,11 +138,11 @@ void pci_iounmap(struct pci_dev *dev, void __iomem *);
 
 static inline int sbus_can_dma_64bit(void)
 {
-	return 0; /* actually, sparc_cpu_model==sun4d */
+	return 0;
 }
 static inline int sbus_can_burst64(void)
 {
-	return 0; /* actually, sparc_cpu_model==sun4d */
+	return 0;
 }
 struct device;
 void sbus_set_sbus64(struct device *, int);
diff --git a/arch/sparc/kernel/devices.c b/arch/sparc/kernel/devices.c
index b3c2d51b22c4..2963e89611a3 100644
--- a/arch/sparc/kernel/devices.c
+++ b/arch/sparc/kernel/devices.c
@@ -26,8 +26,6 @@
 
 static char *cpu_mid_prop(void)
 {
-	if (sparc_cpu_model == sun4d)
-		return "cpu-id";
 	return "mid";
 }
 
@@ -40,8 +38,6 @@ static int check_cpu_node(phandle nd, int *cur_inst,
 			*prom_node = nd;
 		if (mid) {
 			*mid = prom_getintdefault(nd, cpu_mid_prop(), 0);
-			if (sparc_cpu_model == sun4m)
-				*mid &= 3;
 		}
 		return 0;
 	}
@@ -92,8 +88,7 @@ static int cpu_mid_compare(phandle nd, int instance, void *_arg)
 	int this_mid;
 
 	this_mid = prom_getintdefault(nd, cpu_mid_prop(), 0);
-	if (this_mid == desired_mid
-	    || (sparc_cpu_model == sun4m && (this_mid & 3) == desired_mid))
+	if (this_mid == desired_mid)
 		return 0;
 	return -ENODEV;
 }
diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
index 5ebca5c7af1e..cf0ace29704a 100644
--- a/arch/sparc/kernel/ioport.c
+++ b/arch/sparc/kernel/ioport.c
@@ -309,9 +309,7 @@ arch_initcall(sparc_register_ioport);
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	if (dir != DMA_TO_DEVICE &&
-	    sparc_cpu_model == sparc_leon &&
-	    !sparc_leon3_snooping_enabled())
+	if (dir != DMA_TO_DEVICE && !sparc_leon3_snooping_enabled())
 		leon_flush_dcache_all();
 }
 
diff --git a/arch/sparc/kernel/leon_pmc.c b/arch/sparc/kernel/leon_pmc.c
index 6c00cbad7fb5..d4a2d49f941c 100644
--- a/arch/sparc/kernel/leon_pmc.c
+++ b/arch/sparc/kernel/leon_pmc.c
@@ -79,15 +79,13 @@ static void pmc_leon_idle(void)
 /* Install LEON Power Down function */
 static int __init leon_pmc_install(void)
 {
-	if (sparc_cpu_model == sparc_leon) {
-		/* Assign power management IDLE handler */
-		if (pmc_leon_need_fixup())
-			sparc_idle = pmc_leon_idle_fixup;
-		else
-			sparc_idle = pmc_leon_idle;
-
-		printk(KERN_INFO "leon: power management initialized\n");
-	}
+	/* Assign power management IDLE handler */
+	if (pmc_leon_need_fixup())
+		sparc_idle = pmc_leon_idle_fixup;
+	else
+		sparc_idle = pmc_leon_idle;
+
+	printk(KERN_INFO "leon: power management initialized\n");
 
 	return 0;
 }
diff --git a/arch/sparc/kernel/setup_32.c b/arch/sparc/kernel/setup_32.c
index 3c6c16fde8c3..0f38d72aae2d 100644
--- a/arch/sparc/kernel/setup_32.c
+++ b/arch/sparc/kernel/setup_32.c
@@ -189,30 +189,12 @@ static void __init per_cpu_patch(void)
 {
 	struct cpuid_patch_entry *p;
 
-	if (sparc_cpu_model == sun4m) {
-		/* Nothing to do, this is what the unpatched code
-		 * targets.
-		 */
-		return;
-	}
-
 	p = &__cpuid_patch;
 	while (p < &__cpuid_patch_end) {
 		unsigned long addr = p->addr;
 		unsigned int *insns;
 
-		switch (sparc_cpu_model) {
-		case sun4d:
-			insns = &p->sun4d[0];
-			break;
-
-		case sparc_leon:
-			insns = &p->leon[0];
-			break;
-		default:
-			prom_printf("Unknown cpu type, halting.\n");
-			prom_halt();
-		}
+		insns = &p->leon[0];
 		*(unsigned int *) (addr + 0) = insns[0];
 		flushi(addr + 0);
 		*(unsigned int *) (addr + 4) = insns[1];
@@ -224,31 +206,9 @@ static void __init per_cpu_patch(void)
 	}
 }
 
-struct leon_1insn_patch_entry {
-	unsigned int addr;
-	unsigned int insn;
-};
-
-enum sparc_cpu sparc_cpu_model;
-EXPORT_SYMBOL(sparc_cpu_model);
-
 static __init void leon_patch(void)
 {
-	struct leon_1insn_patch_entry *start = (void *)__leon_1insn_patch;
-	struct leon_1insn_patch_entry *end = (void *)__leon_1insn_patch_end;
-
 	/* Default instruction is leon - no patching */
-	if (sparc_cpu_model == sparc_leon)
-		return;
-
-	while (start < end) {
-		unsigned long addr = start->addr;
-
-		*(unsigned int *)(addr) = start->insn;
-		flushi(addr);
-
-		start++;
-	}
 }
 
 struct tt_entry *sparc_ttable;
@@ -259,22 +219,6 @@ struct tt_entry *sparc_ttable;
 void __init sparc32_start_kernel(struct linux_romvec *rp)
 {
 	prom_init(rp);
-
-	/* Set sparc_cpu_model */
-	sparc_cpu_model = sun_unknown;
-	if (!strcmp(&cputypval[0], "sun4m"))
-		sparc_cpu_model = sun4m;
-	if (!strcmp(&cputypval[0], "sun4s"))
-		sparc_cpu_model = sun4m; /* CP-1200 with PROM 2.30 -E */
-	if (!strcmp(&cputypval[0], "sun4d"))
-		sparc_cpu_model = sun4d;
-	if (!strcmp(&cputypval[0], "sun4e"))
-		sparc_cpu_model = sun4e;
-	if (!strcmp(&cputypval[0], "sun4u"))
-		sparc_cpu_model = sun4u;
-	if (!strncmp(&cputypval[0], "leon" , 4))
-		sparc_cpu_model = sparc_leon;
-
 	leon_patch();
 	start_kernel();
 }
@@ -295,27 +239,6 @@ void __init setup_arch(char **cmdline_p)
 
 	register_console(&prom_early_console);
 
-	switch(sparc_cpu_model) {
-	case sun4m:
-		pr_info("ARCH: SUN4M\n");
-		break;
-	case sun4d:
-		pr_info("ARCH: SUN4D\n");
-		break;
-	case sun4e:
-		pr_info("ARCH: SUN4E\n");
-		break;
-	case sun4u:
-		pr_info("ARCH: SUN4U\n");
-		break;
-	case sparc_leon:
-		pr_info("ARCH: LEON\n");
-		break;
-	default:
-		pr_info("ARCH: UNKNOWN!\n");
-		break;
-	}
-
 	idprom_init();
 	load_mmu();
 

-- 
2.34.1

