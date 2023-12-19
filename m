Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D51F8192C4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F3B10E50A;
	Tue, 19 Dec 2023 22:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB9210E206
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EDA71612B1;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D939C433C9;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023395;
 bh=psyCk22duUzejSuxF1TPk2sjNUuqcZ3MiQrJ6SWEwzo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=bsS3EAtYpQUMnskqZpm4J3KJB+bEEzfKIG0rcM850es8822sKmWpirk/DPHMkHJuc
 UvN+0DIOVXOBvAMF2fmJxsn9nBMkkJtk7B5+YR1LqNt0eHqf/PH2Q5BFjAYU5fbpDQ
 M2LSut243lWfuyF0q3fuOGV4fAPGrR/SHIaPIwhzFNetpWLgbEstEzsGv14aBUC6vW
 l4HTjhIDSuQChNeOomPXGckwacwuTLvNICtxCtpjbR5dXSyuK1P1OPh5JmTp5/TBxC
 /zQ10n+z7Qlb3+rq+7ITijhA2gmgIaSbv+r2ynlJZilnezFu5VK3UzEMTriLjhLglE
 ozQHD/UD8L4Qw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 733ACC41535;
 Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:07 +0100
Subject: [PATCH 02/27] sparc32: Drop sun4m/sun4d support from head_32.S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-2-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=7424;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=zGUMWu9MQ9KHsVNvKkdc58EXjHHT/TR1xXu3Hy+1rPk=; =?utf-8?q?b=3DaCRrE/LENgA1?=
 =?utf-8?q?7AXMbL3TH4Y5r4h7A/M7zknBKhnwBcLg2utmf7eKBaWWxz4qf9awup61DHk1lLDN?=
 bcCspi7IDeFeKCgDzJgsZtZMdkGBoWMIIUowSqcJrdRTmVHRFDeY
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Alan Stern <stern@rowland.harvard.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>, sparclinux@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

Remove the most obvious parts of sun4* support from head_32.S.
Use a single print if a sun4* machine is detected thus restricting
boots to LEON machines.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/kernel/head_32.S | 190 +++-----------------------------------------
 1 file changed, 9 insertions(+), 181 deletions(-)

diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 964c61b5cd03..03dc232dd235 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -45,11 +45,7 @@ cputypvar:
 	.align 4
 
 notsup:
-	.asciz	"Sparc-Linux sun4/sun4c or MMU-less not supported\n\n"
-	.align 4
-
-sun4e_notsup:
-        .asciz  "Sparc-Linux sun4e support does not exist\n\n"
+	.asciz	"This kernel only supports LEON SPARC V8\n\n"
 	.align 4
 
 /* The trap-table - located in the __HEAD section */
@@ -215,114 +211,10 @@ not_a_sun4:
 		be	leon_remap		/* It is a LEON - jump */
 		 nop
 
-		/* Sanity-check, is MMU enabled */
-		lda	[%g0] ASI_M_MMUREGS, %g1
-		andcc	%g1, 1, %g0
-		be	halt_notsup
-		 nop
-
-		/* Check for a viking (TI) module. */
-		cmp	%g3, PSR_IMPL_TI
-		bne	srmmu_not_viking
-		 nop
-
-		/* Figure out what kind of viking we are on.
-		 * We need to know if we have to play with the
-		 * AC bit and disable traps or not.
-		 */
-
-		/* I've only seen MicroSparc's on SparcClassics with this
-		 * bit set.
-		 */
-		set	0x800, %g2
-		lda	[%g0] ASI_M_MMUREGS, %g3	! peek in the control reg
-		and	%g2, %g3, %g3
-		subcc	%g3, 0x0, %g0
-		bnz	srmmu_not_viking			! is in mbus mode
-		 nop
-
-		rd	%psr, %g3			! DO NOT TOUCH %g3
-		andn	%g3, PSR_ET, %g2
-		wr	%g2, 0x0, %psr
-		WRITE_PAUSE
-
-		/* Get context table pointer, then convert to
-		 * a physical address, which is 36 bits.
-		 */
-		set	AC_M_CTPR, %g4
-		lda	[%g4] ASI_M_MMUREGS, %g4
-		sll	%g4, 0x4, %g4			! We use this below
-							! DO NOT TOUCH %g4
-
-		/* Set the AC bit in the Viking's MMU control reg. */
-		lda	[%g0] ASI_M_MMUREGS, %g5	! DO NOT TOUCH %g5
-		set	0x8000, %g6			! AC bit mask
-		or	%g5, %g6, %g6			! Or it in...
-		sta	%g6, [%g0] ASI_M_MMUREGS	! Close your eyes...
-
-		/* Grrr, why does it seem like every other load/store
-		 * on the sun4m is in some ASI space...
-		 * Fine with me, let's get the pointer to the level 1
-		 * page table directory and fetch its entry.
-		 */
-		lda	[%g4] ASI_M_BYPASS, %o1		! This is a level 1 ptr
-		srl	%o1, 0x4, %o1			! Clear low 4 bits
-		sll	%o1, 0x8, %o1			! Make physical
-
-		/* Ok, pull in the PTD. */
-		lda	[%o1] ASI_M_BYPASS, %o2		! This is the 0x0 16MB pgd
-
-		/* Calculate to KERNBASE entry. */
-		add	%o1, KERNBASE >> (PGDIR_SHIFT - 2), %o3
-
-		/* Poke the entry into the calculated address. */
-		sta	%o2, [%o3] ASI_M_BYPASS
-
-		/* I don't get it Sun, if you engineered all these
-		 * boot loaders and the PROM (thank you for the debugging
-		 * features btw) why did you not have them load kernel
-		 * images up in high address space, since this is necessary
-		 * for ABI compliance anyways?  Does this low-mapping provide
-		 * enhanced interoperability?
-		 *
-		 * "The PROM is the computer."
-		 */
-
-		/* Ok, restore the MMU control register we saved in %g5 */
-		sta	%g5, [%g0] ASI_M_MMUREGS	! POW... ouch
-
-		/* Turn traps back on.  We saved it in %g3 earlier. */
-		wr	%g3, 0x0, %psr			! tick tock, tick tock
-
-		/* Now we burn precious CPU cycles due to bad engineering. */
-		WRITE_PAUSE
-
-		/* Wow, all that just to move a 32-bit value from one
-		 * place to another...  Jump to high memory.
-		 */
-		b	go_to_highmem
+		/* Not LEON - halt */
+		ba	halt_notsup
 		 nop
 
-srmmu_not_viking:
-		/* This works on viking's in Mbus mode and all
-		 * other MBUS modules.  It is virtually the same as
-		 * the above madness sans turning traps off and flipping
-		 * the AC bit.
-		 */
-		set	AC_M_CTPR, %g1
-		lda	[%g1] ASI_M_MMUREGS, %g1	! get ctx table ptr
-		sll	%g1, 0x4, %g1			! make physical addr
-		lda	[%g1] ASI_M_BYPASS, %g1		! ptr to level 1 pg_table
-		srl	%g1, 0x4, %g1
-		sll	%g1, 0x8, %g1			! make phys addr for l1 tbl
-
-		lda	[%g1] ASI_M_BYPASS, %g2		! get level1 entry for 0x0
-		add	%g1, KERNBASE >> (PGDIR_SHIFT - 2), %g3
-		sta	%g2, [%g3] ASI_M_BYPASS		! place at KERNBASE entry
-		b	go_to_highmem
-		 nop					! wheee....
-
-
 leon_remap:
 		/* Sanity-check, is MMU enabled */
 		lda	[%g0] ASI_LEON_MMUREGS, %g1
@@ -343,8 +235,6 @@ leon_remap:
 		lda	[%g1] ASI_M_BYPASS, %g2		! get level1 entry for 0x0
 		add	%g1, KERNBASE >> (PGDIR_SHIFT - 2), %g3
 		sta	%g2, [%g3] ASI_M_BYPASS		! place at KERNBASE entry
-		b	go_to_highmem
-		 nop					! wheee....
 
 /* Now do a non-relative jump so that PC is in high-memory */
 go_to_highmem:
@@ -413,13 +303,13 @@ execute_in_high_mem:
 		ldub	[%o2 + 0x4], %l1
 
 		cmp	%l1, 'm'
-		be	sun4m_init
+		be	no_sun4_here		! sun4m
 		 cmp	%l1, 's'
-		be	sun4m_init
+		be	no_sun4_here		! sun4m
 		 cmp	%l1, 'd'
-		be	sun4d_init
+		be	no_sun4_here		! sun4d
 		 cmp	%l1, 'e'
-		be	no_sun4e_here		! Could be a sun4e.
+		be	no_sun4_here		! Could be a sun4e.
 		 nop
 		b	no_sun4u_here		! AIEEE, a V9 sun4u... Get our BIG BROTHER kernel :))
 		 nop
@@ -441,68 +331,6 @@ leon_init:
 		/* Update boot_cpu_id only on boot cpu */
 		stub	%g1, [%g2 + %lo(boot_cpu_id)]
 
-		ba continue_boot
-		 nop
-
-/* CPUID in bootbus can be found at PA 0xff0140000 */
-#define SUN4D_BOOTBUS_CPUID     0xf0140000
-
-sun4d_init:
-	/* Need to patch call to handler_irq */
-	set	patch_handler_irq, %g4
-	set	sun4d_handler_irq, %g5
-	sethi	%hi(0x40000000), %g3		! call
-	sub	%g5, %g4, %g5
-	srl	%g5, 2, %g5
-	or	%g5, %g3, %g5
-	st	%g5, [%g4]
-
-#ifdef CONFIG_SMP
-	/* Get our CPU id out of bootbus */
-	set     SUN4D_BOOTBUS_CPUID, %g3
-	lduba   [%g3] ASI_M_CTL, %g3
-	and     %g3, 0xf8, %g3
-	srl     %g3, 3, %g4
-	sta     %g4, [%g0] ASI_M_VIKING_TMP1
-	sethi	%hi(boot_cpu_id), %g5
-	stb	%g4, [%g5 + %lo(boot_cpu_id)]
-#endif
-
-	/* Fall through to sun4m_init */
-
-sun4m_init:
-/* Ok, the PROM could have done funny things and apple cider could still
- * be sitting in the fault status/address registers.  Read them all to
- * clear them so we don't get magic faults later on.
- */
-/* This sucks, apparently this makes Vikings call prom panic, will fix later */
-2:
-		rd	%psr, %o1
-		srl	%o1, PSR_IMPL_SHIFT, %o1	! Get a type of the CPU
-
-		subcc	%o1, PSR_IMPL_TI, %g0		! TI: Viking or MicroSPARC
-		be	continue_boot
-		 nop
-
-		set	AC_M_SFSR, %o0
-		lda	[%o0] ASI_M_MMUREGS, %g0
-		set	AC_M_SFAR, %o0
-		lda	[%o0] ASI_M_MMUREGS, %g0
-
-		/* Fujitsu MicroSPARC-II has no asynchronous flavors of FARs */
-		subcc	%o1, 0, %g0
-		be	continue_boot
-		 nop
-
-		set	AC_M_AFSR, %o0
-		lda	[%o0] ASI_M_MMUREGS, %g0
-		set	AC_M_AFAR, %o0
-		lda	[%o0] ASI_M_MMUREGS, %g0
-		 nop
-
-
-continue_boot:
-
 /* Aieee, now set PC and nPC, enable traps, give ourselves a stack and it's
  * show-time!
  */
@@ -670,9 +498,9 @@ continue_boot:
 		call	halt_me
 		 nop
 
-no_sun4e_here:
+no_sun4_here:
 		ld	[%g7 + 0x68], %o1
-		set	sun4e_notsup, %o0
+		set	notsup, %o0
 		call	%o1
 		 nop
 		b	halt_me

-- 
2.34.1

