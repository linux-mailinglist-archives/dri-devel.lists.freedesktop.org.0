Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B548772BC
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB101122BA;
	Sat,  9 Mar 2024 18:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="luH3//cD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8427A1122B2
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7165FCE0948;
 Sat,  9 Mar 2024 18:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B934EC3278B;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008149;
 bh=CMOmzTl3Gh0b3oru1EplV7+/OIJRkbU2sBgCDsaSWjU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=luH3//cDS+cmesir3kHAGiQjtvoBNSxSFcAJQqAYI4WPzEAlJuVobr0yvHxT7Mipo
 zE4OJLaDBV5i3r5P1zLf++oOR/NfR/GtDiCkAjfvLvbzoJkdriSrP3EjzlSlPFTCuj
 Sl/KczlgRPMIsM7sFy7oWkbp4w2M97rnKCUajFZR5msHVOHEldpTcnFYT/rGdq46Ux
 D5LJ+UBCrJjVhQUACfXq/2lgDP8xZMOgrf51E1aZqkhEoDcOPkkNGbdHJlqpPZZI98
 9LK6p7MpazdGN7G1OcyA6EynRMlfryMRKgWyhdAz1StSbaGLopwilTxPCsFBZVi2t2
 PqygEdmmwWVxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A8FC8C54E66;
 Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:39 +0100
Subject: [PATCH v2 18/28] sparc32: Drop run-time patching of ASI instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-18-f09912574d2c@ravnborg.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=15091;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=OR3+xi6Vz+6TSKjVmSuoidSli8x59movdv9gYDnB34g=; =?utf-8?q?b=3DN84dKZDl0J9n?=
 =?utf-8?q?sGMWSMrRdHcjDwYOVGFrf+ui42ELPnK6UQqxoqBuyF1Rii7Hjlrr9uo+XaQREO4s?=
 j9bfLethAonLzSyIdQhZV6Jcvt7ZhOgjknXwNKMcQf2fVvS5ZFqj
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

With only LEON supported there is no need to run-time patch
the instructions to match ASI.

Move a few functions back to C with inline asm, now that
run-time patching is not needed.

Deleted a few functions that turns out not to be used rather
than re-implement them in C.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/asmmacro.h | 22 -----------
 arch/sparc/include/asm/pgtsrmmu.h | 28 ++++++-------
 arch/sparc/include/asm/sections.h |  3 --
 arch/sparc/kernel/entry.S         |  7 +---
 arch/sparc/kernel/etrap_32.S      | 15 +++----
 arch/sparc/kernel/rtrap_32.S      | 18 +++------
 arch/sparc/kernel/vmlinux.lds.S   |  5 ---
 arch/sparc/kernel/wof.S           | 18 +++------
 arch/sparc/kernel/wuf.S           | 21 ++++------
 arch/sparc/mm/Makefile            |  1 -
 arch/sparc/mm/srmmu_access.S      | 83 ---------------------------------------
 11 files changed, 40 insertions(+), 181 deletions(-)

diff --git a/arch/sparc/include/asm/asmmacro.h b/arch/sparc/include/asm/asmmacro.h
index 49aaf6f3bc55..d5782dbc7810 100644
--- a/arch/sparc/include/asm/asmmacro.h
+++ b/arch/sparc/include/asm/asmmacro.h
@@ -21,26 +21,4 @@
 /* All traps low-level code here must end with this macro. */
 #define RESTORE_ALL b ret_trap_entry; clr %l6;
 
-/* Support for run-time patching of single instructions.
- * This is used to handle the differences in the ASI for
- * MMUREGS for LEON and SUN.
- *
- * Sample:
- * LEON_PI(lda [%g0] ASI_LEON_MMUREGS, %o0
- * SUN_PI_(lda [%g0] ASI_M_MMUREGS, %o0
- * PI == Patch Instruction
- *
- * For LEON we will use the first variant,
- * and for all other we will use the SUN variant.
- * The order is important.
- */
-#define LEON_PI(...)				\
-662:	__VA_ARGS__
-
-#define SUN_PI_(...)				\
-	.section .leon_1insn_patch, "ax";	\
-	.word 662b;				\
-	__VA_ARGS__;				\
-	.previous
-
 #endif /* !(_SPARC_ASMMACRO_H) */
diff --git a/arch/sparc/include/asm/pgtsrmmu.h b/arch/sparc/include/asm/pgtsrmmu.h
index 7cb5cbc83211..69c28ff3c4c4 100644
--- a/arch/sparc/include/asm/pgtsrmmu.h
+++ b/arch/sparc/include/asm/pgtsrmmu.h
@@ -107,22 +107,22 @@ extern void *srmmu_nocache_pool;
 #define __nocache_va(PADDR) (__va((unsigned long)PADDR) - (unsigned long)srmmu_nocache_pool + SRMMU_NOCACHE_VADDR)
 #define __nocache_fix(VADDR) ((__typeof__(VADDR))__va(__nocache_pa(VADDR)))
 
-/* Accessing the MMU control register. */
-unsigned int srmmu_get_mmureg(void);
-void srmmu_set_mmureg(unsigned long regval);
-void srmmu_set_ctable_ptr(unsigned long paddr);
-void srmmu_set_context(int context);
-int srmmu_get_context(void);
-unsigned int srmmu_get_fstatus(void);
-unsigned int srmmu_get_faddr(void);
-
-/* This is guaranteed on all SRMMU's. */
-static inline void srmmu_flush_whole_tlb(void)
+static inline void srmmu_set_ctable_ptr(unsigned long paddr)
 {
-	__asm__ __volatile__("sta %%g0, [%0] %1\n\t": :
-			     "r" (0x400),        /* Flush entire TLB!! */
-			     "i" (ASI_M_FLUSH_PROBE) : "memory");
+	paddr = ((paddr >> 4) & SRMMU_CTX_PMASK);
+	asm volatile("sta %0, [%1] %2\n\t" : : "r" (paddr), "r" (SRMMU_CTXTBL_PTR), "i" (ASI_LEON_MMUREGS) : "memory");
+}
 
+static inline void srmmu_set_context(int context)
+{
+	asm volatile("sta %0, [%1] %2\n\t" : : "r" (context), "r" (SRMMU_CTX_REG), "i" (ASI_LEON_MMUREGS) : "memory");
+}
+
+static inline int srmmu_get_context(void)
+{
+	register int retval;
+	asm volatile("lda [%1] %2, %0\n\t" : "=r" (retval) : "r" (SRMMU_CTX_REG), "i" (ASI_LEON_MMUREGS));
+	return retval;
 }
 
 #endif /* !(__ASSEMBLY__) */
diff --git a/arch/sparc/include/asm/sections.h b/arch/sparc/include/asm/sections.h
index 08f833453ab3..e9d28148850b 100644
--- a/arch/sparc/include/asm/sections.h
+++ b/arch/sparc/include/asm/sections.h
@@ -8,7 +8,4 @@
 /* sparc entry point */
 extern char _start[];
 
-extern char __leon_1insn_patch[];
-extern char __leon_1insn_patch_end[];
-
 #endif
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index f158cbca3e62..18c67b4fb017 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -469,11 +469,8 @@ srmmu_fault:
 	mov	0x400, %l5
 	mov	0x300, %l4
 
-LEON_PI(lda	[%l5] ASI_LEON_MMUREGS, %l6)	! read sfar first
-SUN_PI_(lda	[%l5] ASI_M_MMUREGS, %l6)	! read sfar first
-
-LEON_PI(lda	[%l4] ASI_LEON_MMUREGS, %l5)	! read sfsr last
-SUN_PI_(lda	[%l4] ASI_M_MMUREGS, %l5)	! read sfsr last
+	lda	[%l5] ASI_LEON_MMUREGS, %l6	! read sfar first
+	lda	[%l4] ASI_LEON_MMUREGS, %l5	! read sfsr last
 
 	andn	%l6, 0xfff, %l6
 	srl	%l5, 6, %l5			! and encode all info into l7
diff --git a/arch/sparc/kernel/etrap_32.S b/arch/sparc/kernel/etrap_32.S
index 9f243f918619..bb222459f097 100644
--- a/arch/sparc/kernel/etrap_32.S
+++ b/arch/sparc/kernel/etrap_32.S
@@ -235,8 +235,7 @@ tsetup_srmmu_stackchk:
 
 	cmp	%glob_tmp, %sp
 	bleu,a	1f
-LEON_PI( lda	[%g0] ASI_LEON_MMUREGS, %glob_tmp)	! read MMU control
-SUN_PI_( lda	[%g0] ASI_M_MMUREGS, %glob_tmp)		! read MMU control
+	 lda	[%g0] ASI_LEON_MMUREGS, %glob_tmp	! read MMU control
 
 trap_setup_user_stack_is_bolixed:
 	/* From user/kernel into invalid window w/bad user
@@ -251,24 +250,20 @@ trap_setup_user_stack_is_bolixed:
 1:
 	/* Clear the fault status and turn on the no_fault bit. */
 	or	%glob_tmp, 0x2, %glob_tmp		! or in no_fault bit
-LEON_PI(sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS)		! set it
-SUN_PI_(sta	%glob_tmp, [%g0] ASI_M_MMUREGS)		! set it
+	sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS	! set it
 
 	/* Dump the registers and cross fingers. */
 	STORE_WINDOW(sp)
 
 	/* Clear the no_fault bit and check the status. */
 	andn	%glob_tmp, 0x2, %glob_tmp
-LEON_PI(sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%glob_tmp, [%g0] ASI_M_MMUREGS)
+	sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS
 
 	mov	AC_M_SFAR, %glob_tmp
-LEON_PI(lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0)
-SUN_PI_(lda	[%glob_tmp] ASI_M_MMUREGS, %g0)
+	lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0
 
 	mov	AC_M_SFSR, %glob_tmp
-LEON_PI(lda	[%glob_tmp] ASI_LEON_MMUREGS, %glob_tmp)! save away status of winstore
-SUN_PI_(lda	[%glob_tmp] ASI_M_MMUREGS, %glob_tmp)	! save away status of winstore
+	lda	[%glob_tmp] ASI_LEON_MMUREGS, %glob_tmp	! save away status of winstore
 
 	andcc	%glob_tmp, 0x2, %g0			! did we fault?
 	bne	trap_setup_user_stack_is_bolixed	! failure
diff --git a/arch/sparc/kernel/rtrap_32.S b/arch/sparc/kernel/rtrap_32.S
index 8931fe266346..a232b367c219 100644
--- a/arch/sparc/kernel/rtrap_32.S
+++ b/arch/sparc/kernel/rtrap_32.S
@@ -232,14 +232,11 @@ srmmu_rett_stackchk:
 	cmp	%g1, %fp
 	bleu	ret_trap_user_stack_is_bolixed
 	 mov	AC_M_SFSR, %g1
-LEON_PI(lda	[%g1] ASI_LEON_MMUREGS, %g0)
-SUN_PI_(lda	[%g1] ASI_M_MMUREGS, %g0)
+	lda	[%g1] ASI_LEON_MMUREGS, %g0
 
-LEON_PI(lda	[%g0] ASI_LEON_MMUREGS, %g1)
-SUN_PI_(lda	[%g0] ASI_M_MMUREGS, %g1)
+	lda	[%g0] ASI_LEON_MMUREGS, %g1
 	or	%g1, 0x2, %g1
-LEON_PI(sta	%g1, [%g0] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%g1, [%g0] ASI_M_MMUREGS)
+	sta	%g1, [%g0] ASI_LEON_MMUREGS
 
 	restore	%g0, %g0, %g0
 
@@ -248,16 +245,13 @@ SUN_PI_(sta	%g1, [%g0] ASI_M_MMUREGS)
 	save	%g0, %g0, %g0
 
 	andn	%g1, 0x2, %g1
-LEON_PI(sta	%g1, [%g0] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%g1, [%g0] ASI_M_MMUREGS)
+	sta	%g1, [%g0] ASI_LEON_MMUREGS
 
 	mov	AC_M_SFAR, %g2
-LEON_PI(lda	[%g2] ASI_LEON_MMUREGS, %g2)
-SUN_PI_(lda	[%g2] ASI_M_MMUREGS, %g2)
+	lda	[%g2] ASI_LEON_MMUREGS, %g2
 
 	mov	AC_M_SFSR, %g1
-LEON_PI(lda	[%g1] ASI_LEON_MMUREGS, %g1)
-SUN_PI_(lda	[%g1] ASI_M_MMUREGS, %g1)
+	lda	[%g1] ASI_LEON_MMUREGS, %g1
 	andcc	%g1, 0x2, %g0
 	be	ret_trap_userwins_ok
 	 nop
diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.lds.S
index d317a843f7ea..1cc4d3e79321 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -113,11 +113,6 @@ SECTIONS
 		*(.sun4v_2insn_patch)
 		__sun4v_2insn_patch_end = .;
 	}
-	.leon_1insn_patch : {
-		__leon_1insn_patch = .;
-		*(.leon_1insn_patch)
-		__leon_1insn_patch_end = .;
-	}
 	.swapper_tsb_phys_patch : {
 		__swapper_tsb_phys_patch = .;
 		*(.swapper_tsb_phys_patch)
diff --git a/arch/sparc/kernel/wof.S b/arch/sparc/kernel/wof.S
index 96a3a112423a..fe4cfd4abcd2 100644
--- a/arch/sparc/kernel/wof.S
+++ b/arch/sparc/kernel/wof.S
@@ -333,30 +333,24 @@ spwin_srmmu_stackchk:
 	 mov	AC_M_SFSR, %glob_tmp
 
 	/* Clear the fault status and turn on the no_fault bit. */
-LEON_PI(lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0)	! eat SFSR
-SUN_PI_(lda	[%glob_tmp] ASI_M_MMUREGS, %g0)		! eat SFSR
+	lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0	! eat SFSR
 
-LEON_PI(lda	[%g0] ASI_LEON_MMUREGS, %glob_tmp)	! read MMU control
-SUN_PI_(lda	[%g0] ASI_M_MMUREGS, %glob_tmp)		! read MMU control
+	lda	[%g0] ASI_LEON_MMUREGS, %glob_tmp	! read MMU control
 	or	%glob_tmp, 0x2, %glob_tmp		! or in no_fault bit
-LEON_PI(sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS)	! set it
-SUN_PI_(sta	%glob_tmp, [%g0] ASI_M_MMUREGS)		! set it
+	sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS	! set it
 
 	/* Dump the registers and cross fingers. */
 	STORE_WINDOW(sp)
 
 	/* Clear the no_fault bit and check the status. */
 	andn	%glob_tmp, 0x2, %glob_tmp
-LEON_PI(sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%glob_tmp, [%g0] ASI_M_MMUREGS)
+	sta	%glob_tmp, [%g0] ASI_LEON_MMUREGS
 
 	mov	AC_M_SFAR, %glob_tmp
-LEON_PI(lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0)
-SUN_PI_(lda	[%glob_tmp] ASI_M_MMUREGS, %g0)
+	lda	[%glob_tmp] ASI_LEON_MMUREGS, %g0
 
 	mov	AC_M_SFSR, %glob_tmp
-LEON_PI(lda	[%glob_tmp] ASI_LEON_MMUREGS, %glob_tmp)
-SUN_PI_(lda	[%glob_tmp] ASI_M_MMUREGS, %glob_tmp)
+	lda	[%glob_tmp] ASI_LEON_MMUREGS, %glob_tmp
 	andcc	%glob_tmp, 0x2, %g0			! did we fault?
 	be,a	spwin_finish_up + 0x4			! cool beans, success
 	 restore %g0, %g0, %g0
diff --git a/arch/sparc/kernel/wuf.S b/arch/sparc/kernel/wuf.S
index 1a4ca490e9c2..4c52b69d4b7a 100644
--- a/arch/sparc/kernel/wuf.S
+++ b/arch/sparc/kernel/wuf.S
@@ -255,19 +255,16 @@ srmmu_fwin_stackchk:
 	mov	AC_M_SFSR, %l4
 	cmp	%l5, %sp
 	bleu	fwin_user_stack_is_bolixed
-LEON_PI( lda	[%l4] ASI_LEON_MMUREGS, %g0)	! clear fault status
-SUN_PI_( lda	[%l4] ASI_M_MMUREGS, %g0)	! clear fault status
+	 lda	[%l4] ASI_LEON_MMUREGS, %g0	! clear fault status
 
 	/* The technique is, turn off faults on this processor,
 	 * just let the load rip, then check the sfsr to see if
 	 * a fault did occur.  Then we turn on fault traps again
 	 * and branch conditionally based upon what happened.
 	 */
-LEON_PI(lda	[%g0] ASI_LEON_MMUREGS, %l5)	! read mmu-ctrl reg
-SUN_PI_(lda	[%g0] ASI_M_MMUREGS, %l5)	! read mmu-ctrl reg
+	lda	[%g0] ASI_LEON_MMUREGS, %l5	! read mmu-ctrl reg
 	or	%l5, 0x2, %l5			! turn on no-fault bit
-LEON_PI(sta	%l5, [%g0] ASI_LEON_MMUREGS)	! store it
-SUN_PI_(sta	%l5, [%g0] ASI_M_MMUREGS)	! store it
+	sta	%l5, [%g0] ASI_LEON_MMUREGS	! store it
 
 	/* Cross fingers and go for it. */
 	LOAD_WINDOW(sp)
@@ -279,19 +276,15 @@ SUN_PI_(sta	%l5, [%g0] ASI_M_MMUREGS)	! store it
 
 	/* LOCATION: Window 'T' */
 
-LEON_PI(lda	[%g0] ASI_LEON_MMUREGS, %twin_tmp1)	! load mmu-ctrl again
-SUN_PI_(lda	[%g0] ASI_M_MMUREGS, %twin_tmp1)	! load mmu-ctrl again
+	lda	[%g0] ASI_LEON_MMUREGS, %twin_tmp1	! load mmu-ctrl again
 	andn	%twin_tmp1, 0x2, %twin_tmp1		! clear no-fault bit
-LEON_PI(sta	%twin_tmp1, [%g0] ASI_LEON_MMUREGS)	! store it
-SUN_PI_(sta	%twin_tmp1, [%g0] ASI_M_MMUREGS)	! store it
+	sta	%twin_tmp1, [%g0] ASI_LEON_MMUREGS	! store it
 
 	mov	AC_M_SFAR, %twin_tmp2
-LEON_PI(lda	[%twin_tmp2] ASI_LEON_MMUREGS, %g0)	! read fault address
-SUN_PI_(lda	[%twin_tmp2] ASI_M_MMUREGS, %g0)	! read fault address
+	lda	[%twin_tmp2] ASI_LEON_MMUREGS, %g0	! read fault address
 
 	mov	AC_M_SFSR, %twin_tmp2
-LEON_PI(lda	[%twin_tmp2] ASI_LEON_MMUREGS, %twin_tmp2) ! read fault status
-SUN_PI_(lda	[%twin_tmp2] ASI_M_MMUREGS, %twin_tmp2)	   ! read fault status
+	lda	[%twin_tmp2] ASI_LEON_MMUREGS, %twin_tmp2 ! read fault status
 	andcc	%twin_tmp2, 0x2, %g0			   ! did fault occur?
 
 	bne	1f					   ! yep, cleanup
diff --git a/arch/sparc/mm/Makefile b/arch/sparc/mm/Makefile
index 7b3ff6dd382e..f0560eea2958 100644
--- a/arch/sparc/mm/Makefile
+++ b/arch/sparc/mm/Makefile
@@ -8,7 +8,6 @@ obj-$(CONFIG_SPARC64)   += ultra.o tlb.o tsb.o
 obj-y                   += fault_$(BITS).o
 obj-y                   += init_$(BITS).o
 obj-$(CONFIG_SPARC32)   += srmmu.o iommu.o io-unit.o
-obj-$(CONFIG_SPARC32)   += srmmu_access.o
 obj-$(CONFIG_SPARC32)   += leon_mm.o
 
 # Only used by sparc64
diff --git a/arch/sparc/mm/srmmu_access.S b/arch/sparc/mm/srmmu_access.S
deleted file mode 100644
index d8d2e644a5ca..000000000000
--- a/arch/sparc/mm/srmmu_access.S
+++ /dev/null
@@ -1,83 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Assembler variants of srmmu access functions.
- * Implemented in assembler to allow run-time patching.
- * LEON uses a different ASI for MMUREGS than SUN.
- *
- * The leon_1insn_patch infrastructure is used
- * for the run-time patching.
- */
-
-#include <linux/linkage.h>
-
-#include <asm/asmmacro.h>
-#include <asm/pgtsrmmu.h>
-#include <asm/asi.h>
-
-/* unsigned int srmmu_get_mmureg(void) */
-ENTRY(srmmu_get_mmureg)
-LEON_PI(lda	[%g0] ASI_LEON_MMUREGS, %o0)
-SUN_PI_(lda	[%g0] ASI_M_MMUREGS, %o0)
-	retl
-	 nop
-ENDPROC(srmmu_get_mmureg)
-
-/* void srmmu_set_mmureg(unsigned long regval) */
-ENTRY(srmmu_set_mmureg)
-LEON_PI(sta	%o0, [%g0] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%o0, [%g0] ASI_M_MMUREGS)
-	retl
-	 nop
-ENDPROC(srmmu_set_mmureg)
-
-/* void srmmu_set_ctable_ptr(unsigned long paddr) */
-ENTRY(srmmu_set_ctable_ptr)
-	/* paddr = ((paddr >> 4) & SRMMU_CTX_PMASK); */
-	srl	%o0, 4, %g1
-	and	%g1, SRMMU_CTX_PMASK, %g1
-
-	mov	SRMMU_CTXTBL_PTR, %g2
-LEON_PI(sta	%g1, [%g2] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%g1, [%g2] ASI_M_MMUREGS)
-	retl
-	 nop
-ENDPROC(srmmu_set_ctable_ptr)
-
-
-/* void srmmu_set_context(int context) */
-ENTRY(srmmu_set_context)
-	mov	SRMMU_CTX_REG, %g1
-LEON_PI(sta	%o0, [%g1] ASI_LEON_MMUREGS)
-SUN_PI_(sta	%o0, [%g1] ASI_M_MMUREGS)
-	retl
-	 nop
-ENDPROC(srmmu_set_context)
-
-
-/* int srmmu_get_context(void) */
-ENTRY(srmmu_get_context)
-	mov	SRMMU_CTX_REG, %o0
-LEON_PI(lda     [%o0] ASI_LEON_MMUREGS, %o0)
-SUN_PI_(lda	[%o0] ASI_M_MMUREGS, %o0)
-	retl
-	 nop
-ENDPROC(srmmu_get_context)
-
-
-/* unsigned int srmmu_get_fstatus(void) */
-ENTRY(srmmu_get_fstatus)
-	mov	SRMMU_FAULT_STATUS, %o0
-LEON_PI(lda     [%o0] ASI_LEON_MMUREGS, %o0)
-SUN_PI_(lda	[%o0] ASI_M_MMUREGS, %o0)
-	retl
-	 nop
-ENDPROC(srmmu_get_fstatus)
-
-
-/* unsigned int srmmu_get_faddr(void) */
-ENTRY(srmmu_get_faddr)
-	mov	SRMMU_FAULT_ADDR, %o0
-LEON_PI(lda     [%o0] ASI_LEON_MMUREGS, %o0)
-SUN_PI_(lda	[%o0] ASI_M_MMUREGS, %o0)
-	retl
-	 nop
-ENDPROC(srmmu_get_faddr)

-- 
2.34.1

