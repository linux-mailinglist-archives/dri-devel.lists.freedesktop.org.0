Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958E8192D2
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 23:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B5F10E511;
	Tue, 19 Dec 2023 22:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47910E267
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1B06B614D7;
 Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56423C4163C;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703023396;
 bh=hUeer878kHfZToHNcJoRPcV1xECdXnEhs/Nyvz2zVvc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=RqHa9edS2lcZtGxaOHUorag9ZUWw2PIcweiVofAtU8YbY/pchL+SZ/W+rYqqrFjnF
 pRgQeVUTBRCT8Adp2alKxKZ4q2Sp9F1R8FJFTm4i02eeCQYRV7mkKPPrbPLYhAt4kf
 d0nAbVNmBHunwFW1rUgTRCqmPYemUEgeJ1GVtfKciQZ11lsHh7H1EKJyLhEqcIImU2
 /5/ysjo3gcHNxGbHjWSs+MWhdQT7p+vYfM7kkLjWi7Tssbb+ICBrnE+Oq+QY5DDCcX
 5Wqwc9Q3RCIAprb0ATOImyHP2LfzLUG/cJln+p3thVI8IxXq7hj8Mq2q/SKf7dD1V8
 uQSijh84etlKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 47AEEC4706E;
 Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:23 +0100
Subject: [PATCH 18/27] sparc32: Drop support for 7 register windows
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-18-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=15090;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=ihMG1Y5AtoVjy/gldPt3VrNpQv5kvVGjd8vY2r8DSK8=; =?utf-8?q?b=3DtitO9Jm1CDCe?=
 =?utf-8?q?qX4B3E34NGwQ5uja4Jo/TcmtNONt1AhdQWk3eRRbOAgRwXBHfA/BxOvXa7PR5r93?=
 GziGgtPkCqF1zmfel+mEKYviAW1/tiKSdY2RHp574D9dVDMaCNzu
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

Some older SPARC CPUs had support for only 7 register windows.
To support this run-time patching was used.

LEON demand 8 register windows for use with Linux so
there is no need to support the 7 window configuration.

The complexity of the assembler code is reduced
when dropping the run-time patching, thus increasing
the maintainability.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/switch_to_32.h |  1 -
 arch/sparc/kernel/entry.S             | 28 ++++-----------
 arch/sparc/kernel/etrap_32.S          | 35 +++++--------------
 arch/sparc/kernel/head_32.S           | 65 -----------------------------------
 arch/sparc/kernel/rtrap_32.S          | 55 +++++++++++++----------------
 arch/sparc/kernel/wof.S               | 43 ++++++++---------------
 arch/sparc/kernel/wuf.S               | 20 +++--------
 7 files changed, 57 insertions(+), 190 deletions(-)

diff --git a/arch/sparc/include/asm/switch_to_32.h b/arch/sparc/include/asm/switch_to_32.h
index 42eeafcb8a41..7aaaf31c09b4 100644
--- a/arch/sparc/include/asm/switch_to_32.h
+++ b/arch/sparc/include/asm/switch_to_32.h
@@ -37,7 +37,6 @@ extern struct thread_info *current_set[NR_CPUS];
 
 #define prepare_arch_switch(next) do { \
 	__asm__ __volatile__( \
-	".globl\tflush_patch_switch\nflush_patch_switch:\n\t" \
 	"save %sp, -0x40, %sp; save %sp, -0x40, %sp; save %sp, -0x40, %sp\n\t" \
 	"save %sp, -0x40, %sp; save %sp, -0x40, %sp; save %sp, -0x40, %sp\n\t" \
 	"save %sp, -0x40, %sp\n\t" \
diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 9cf8f87e8c42..078a8f7f8383 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -384,11 +384,8 @@ do_flush_windows:
 
 	RESTORE_ALL
 
-	.globl	flush_patch_one
-
 	/* We get these for debugging routines using __builtin_return_address() */
 dfw_kernel:
-flush_patch_one:
 	FLUSH_ALL_KERNEL_WINDOWS
 
 	/* Advance over the trap instruction. */
@@ -558,10 +555,9 @@ sys_rt_sigreturn:
 	 * XXX code just like on sparc64... -DaveM
 	 */
 	.align	4
-	.globl	sys_fork, flush_patch_two
+	.globl	sys_fork
 sys_fork:
 	mov	%o7, %l5
-flush_patch_two:
 	FLUSH_ALL_KERNEL_WINDOWS;
 	ld	[%curptr + TI_TASK], %o4
 	rd	%psr, %g4
@@ -574,10 +570,9 @@ flush_patch_two:
 	 mov	%l5, %o7
 
 	/* Whee, kernel threads! */
-	.globl	sys_clone, flush_patch_three
+	.globl	sys_clone
 sys_clone:
 	mov	%o7, %l5
-flush_patch_three:
 	FLUSH_ALL_KERNEL_WINDOWS;
 	ld	[%curptr + TI_TASK], %o4
 	rd	%psr, %g4
@@ -590,9 +585,8 @@ flush_patch_three:
 	 mov	%l5, %o7
 
 	/* Whee, real vfork! */
-	.globl	sys_vfork, flush_patch_four
+	.globl	sys_vfork
 sys_vfork:
-flush_patch_four:
 	FLUSH_ALL_KERNEL_WINDOWS;
 	ld	[%curptr + TI_TASK], %o4
 	rd	%psr, %g4
@@ -909,17 +903,7 @@ breakpoint_trap:
 #endif
 
 	.align	4
-	.globl	flush_patch_exception
-flush_patch_exception:
-	FLUSH_ALL_KERNEL_WINDOWS;
-	ldd	[%o0], %o6
-	jmpl	%o7 + 0xc, %g0			! see asm-sparc/processor.h
-	 mov	1, %g1				! signal EFAULT condition
-
-	.align	4
-	.globl	kill_user_windows, kuw_patch1_7win
-	.globl	kuw_patch1
-kuw_patch1_7win:	sll	%o3, 6, %o3
+	.globl	kill_user_windows
 
 	/* No matter how much overhead this routine has in the worst
 	 * case scenario, it is several times better than taking the
@@ -939,11 +923,11 @@ kill_user_windows:
 	be	4f				! yep, we are done
 	 rd	%wim, %o3			! get current wim
 	srl	%o3, 1, %o4			! simulate a save
-kuw_patch1:
+kuw_next:
 	sll	%o3, 7, %o3			! compute next wim
 	or	%o4, %o3, %o3			! result
 	andncc	%o0, %o3, %o0			! clean this bit in umask
-	bne	kuw_patch1			! not done yet
+	bne	kuw_next			! not done yet
 	 srl	%o3, 1, %o4			! begin another save simulation
 	wr	%o3, 0x0, %wim			! set the new wim
 	st	%g0, [%g6 + TI_UWINMASK]	! clear uwinmask
diff --git a/arch/sparc/kernel/etrap_32.S b/arch/sparc/kernel/etrap_32.S
index bb222459f097..95dfdea1f36c 100644
--- a/arch/sparc/kernel/etrap_32.S
+++ b/arch/sparc/kernel/etrap_32.S
@@ -30,18 +30,6 @@
 	.text
 	.align 4
 
-	/* SEVEN WINDOW PATCH INSTRUCTIONS */
-	.globl	tsetup_7win_patch1, tsetup_7win_patch2
-	.globl	tsetup_7win_patch3, tsetup_7win_patch4
-	.globl	tsetup_7win_patch5, tsetup_7win_patch6
-tsetup_7win_patch1:	sll	%t_wim, 0x6, %t_wim
-tsetup_7win_patch2:	and	%g2, 0x7f, %g2
-tsetup_7win_patch3:	and	%g2, 0x7f, %g2
-tsetup_7win_patch4:	and	%g1, 0x7f, %g1
-tsetup_7win_patch5:	sll	%t_wim, 0x6, %t_wim
-tsetup_7win_patch6:	and	%g2, 0x7f, %g2
-	/* END OF PATCH INSTRUCTIONS */
-
 	/* At trap time, interrupts and all generic traps do the
 	 * following:
 	 *
@@ -72,9 +60,7 @@ tsetup_7win_patch6:	and	%g2, 0x7f, %g2
 	 * trap pc and npc, and %l3 contains the trap time %wim.
 	 */
 
-	.globl	trap_setup, tsetup_patch1, tsetup_patch2
-	.globl	tsetup_patch3, tsetup_patch4
-	.globl	tsetup_patch5, tsetup_patch6
+	.globl	trap_setup
 trap_setup:
 	/* Calculate mask of trap window.  See if from user
 	 * or kernel and branch conditionally.
@@ -109,11 +95,10 @@ trap_setup_kernel_spill:
 	 * %wim and go.
 	 */
 	 srl	%t_wim, 0x1, %g2	! begin computation of new %wim
-tsetup_patch1:
-	sll	%t_wim, 0x7, %t_wim	! patched on 7 window Sparcs
+
+	sll	%t_wim, 0x7, %t_wim
 	or	%t_wim, %g2, %g2
-tsetup_patch2:
-	and	%g2, 0xff, %g2		! patched on 7 window Sparcs
+	and	%g2, 0xff, %g2
 
 	save	%g0, %g0, %g0
 
@@ -185,8 +170,7 @@ trap_setup_from_user:
 	 sub	%g2, 0x1, %g2
 1:
 	andn	%g2, %t_twinmask, %g2
-tsetup_patch3:
-	and	%g2, 0xff, %g2			! patched on 7win Sparcs
+	and	%g2, 0xff, %g2
 	st	%g2, [%curptr + TI_UWINMASK]	! store new umask
 
 	jmpl	%t_retpc + 0x8, %g0		! return to caller
@@ -199,14 +183,11 @@ trap_setup_user_spill:
 	 * is in %g1 upon entry to here.
 	 */
 
-tsetup_patch4:
-	and	%g1, 0xff, %g1		! patched on 7win Sparcs, mask
+	and	%g1, 0xff, %g1
 	srl	%t_wim, 0x1, %g2	! compute new %wim
-tsetup_patch5:
-	sll	%t_wim, 0x7, %t_wim	! patched on 7win Sparcs
+	sll	%t_wim, 0x7, %t_wim
 	or	%t_wim, %g2, %g2	! %g2 is new %wim
-tsetup_patch6:
-	and	%g2, 0xff, %g2		! patched on 7win Sparcs
+	and	%g2, 0xff, %g2
 	andn	%g1, %g2, %g1		! clear this bit in %g1
 	st	%g1, [%curptr + TI_UWINMASK]
 
diff --git a/arch/sparc/kernel/head_32.S b/arch/sparc/kernel/head_32.S
index 03dc232dd235..908c77cb456e 100644
--- a/arch/sparc/kernel/head_32.S
+++ b/arch/sparc/kernel/head_32.S
@@ -404,71 +404,6 @@ leon_init:
 		wr	%g1, 0x0, %wim			! make window 1 invalid
 		WRITE_PAUSE
 
-		cmp	%g3, 0x7
-		bne	2f
-		 nop
-
-		/* Adjust our window handling routines to
-		 * do things correctly on 7 window Sparcs.
-		 */
-
-#define		PATCH_INSN(src, dest) \
-		set	src, %g5; \
-		set	dest, %g2; \
-		ld	[%g5], %g4; \
-		st	%g4, [%g2];
-
-		/* Patch for window spills... */
-		PATCH_INSN(spnwin_patch1_7win, spnwin_patch1)
-		PATCH_INSN(spnwin_patch2_7win, spnwin_patch2)
-		PATCH_INSN(spnwin_patch3_7win, spnwin_patch3)
-
-		/* Patch for window fills... */
-		PATCH_INSN(fnwin_patch1_7win, fnwin_patch1)
-		PATCH_INSN(fnwin_patch2_7win, fnwin_patch2)
-
-		/* Patch for trap entry setup... */
-		PATCH_INSN(tsetup_7win_patch1, tsetup_patch1)
-		PATCH_INSN(tsetup_7win_patch2, tsetup_patch2)
-		PATCH_INSN(tsetup_7win_patch3, tsetup_patch3)
-		PATCH_INSN(tsetup_7win_patch4, tsetup_patch4)
-		PATCH_INSN(tsetup_7win_patch5, tsetup_patch5)
-		PATCH_INSN(tsetup_7win_patch6, tsetup_patch6)
-
-		/* Patch for returning from traps... */
-		PATCH_INSN(rtrap_7win_patch1, rtrap_patch1)
-		PATCH_INSN(rtrap_7win_patch2, rtrap_patch2)
-		PATCH_INSN(rtrap_7win_patch3, rtrap_patch3)
-		PATCH_INSN(rtrap_7win_patch4, rtrap_patch4)
-		PATCH_INSN(rtrap_7win_patch5, rtrap_patch5)
-
-		/* Patch for killing user windows from the register file. */
-		PATCH_INSN(kuw_patch1_7win, kuw_patch1)
-
-		/* Now patch the kernel window flush sequences.
-		 * This saves 2 traps on every switch and fork.
-		 */
-		set	0x01000000, %g4
-		set	flush_patch_one, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-		set	flush_patch_two, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-		set	flush_patch_three, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-		set	flush_patch_four, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-		set	flush_patch_exception, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-		set	flush_patch_switch, %g5
-		st	%g4, [%g5 + 0x18]
-		st	%g4, [%g5 + 0x1c]
-
-2:
 		sethi	%hi(nwindows), %g4
 		st	%g3, [%g4 + %lo(nwindows)]	! store final value
 		sub	%g3, 0x1, %g3
diff --git a/arch/sparc/kernel/rtrap_32.S b/arch/sparc/kernel/rtrap_32.S
index a232b367c219..8383048c3b5e 100644
--- a/arch/sparc/kernel/rtrap_32.S
+++ b/arch/sparc/kernel/rtrap_32.S
@@ -23,15 +23,6 @@
 #define glob_tmp  g4
 #define curptr    g6
 
-	/* 7 WINDOW SPARC PATCH INSTRUCTIONS */
-	.globl	rtrap_7win_patch1, rtrap_7win_patch2, rtrap_7win_patch3
-	.globl	rtrap_7win_patch4, rtrap_7win_patch5
-rtrap_7win_patch1:	srl	%t_wim, 0x6, %glob_tmp
-rtrap_7win_patch2:	and	%glob_tmp, 0x7f, %glob_tmp
-rtrap_7win_patch3:	srl	%g1, 7, %g2
-rtrap_7win_patch4:	srl	%g2, 6, %g2
-rtrap_7win_patch5:	and	%g1, 0x7f, %g1
-	/* END OF PATCH INSTRUCTIONS */
 
 	/* We need to check for a few things which are:
 	 * 1) The need to call schedule() because this
@@ -117,17 +108,17 @@ ret_trap_nobufwins:
 	bne	ret_trap_userwins_ok
 	 nop
 
-		/* Calculate new %wim, we have to pull a register
-		 * window from the users stack.
-		 */
+	/* Calculate new %wim, we have to pull a register
+	 * window from the users stack.
+	 */
 ret_trap_pull_one_window:
-		rd	%wim, %t_wim
-		sll	%t_wim, 0x1, %twin_tmp1
-rtrap_patch1:	srl	%t_wim, 0x7, %glob_tmp
-		or	%glob_tmp, %twin_tmp1, %glob_tmp
-rtrap_patch2:	and	%glob_tmp, 0xff, %glob_tmp
+	rd	%wim, %t_wim
+	sll	%t_wim, 0x1, %twin_tmp1
+	srl	%t_wim, 0x7, %glob_tmp
+	or	%glob_tmp, %twin_tmp1, %glob_tmp
+	and	%glob_tmp, 0xff, %glob_tmp
 
-		wr	%glob_tmp, 0x0, %wim
+	wr	%glob_tmp, 0x0, %wim
 
 	/* Here comes the architecture specific
 	 * branch to the user stack checking routine
@@ -174,20 +165,20 @@ ret_trap_unaligned_pc:
 	 ld	[%curptr + TI_FLAGS], %g2
 
 ret_trap_kernel:
-		/* Will the rett land us in the invalid window? */
-		mov	2, %g1
-		sll	%g1, %t_psr, %g1
-rtrap_patch3:	srl	%g1, 8, %g2
-		or	%g1, %g2, %g1
-		rd	%wim, %g2
-		andcc	%g2, %g1, %g0
-		be	1f		! Nope, just return from the trap
-		 sll	%g2, 0x1, %g1
-
-		/* We have to grab a window before returning. */
-rtrap_patch4:	srl	%g2, 7,  %g2
-		or	%g1, %g2, %g1
-rtrap_patch5:	and	%g1, 0xff, %g1
+	/* Will the rett land us in the invalid window? */
+	mov	2, %g1
+	sll	%g1, %t_psr, %g1
+	srl	%g1, 8, %g2
+	or	%g1, %g2, %g1
+	rd	%wim, %g2
+	andcc	%g2, %g1, %g0
+	be	1f		! Nope, just return from the trap
+	 sll	%g2, 0x1, %g1
+
+	/* We have to grab a window before returning. */
+	srl	%g2, 7,  %g2
+	or	%g1, %g2, %g1
+	and	%g1, 0xff, %g1
 
 	wr	%g1, 0x0, %wim
 
diff --git a/arch/sparc/kernel/wof.S b/arch/sparc/kernel/wof.S
index fe4cfd4abcd2..30c5ebdd035c 100644
--- a/arch/sparc/kernel/wof.S
+++ b/arch/sparc/kernel/wof.S
@@ -43,18 +43,6 @@
 #define twin_tmp    l4 /* Temp reg, only usable in trap window  T */
 #define glob_tmp    g5 /* Global temporary reg, usable anywhere G */
 
-	.text
-	.align	4
-	/* BEGINNING OF PATCH INSTRUCTIONS */
-	/* On a 7-window Sparc the boot code patches spnwin_*
-	 * instructions with the following ones.
-	 */
-	.globl	spnwin_patch1_7win, spnwin_patch2_7win, spnwin_patch3_7win
-spnwin_patch1_7win:	sll	%t_wim, 6, %glob_tmp
-spnwin_patch2_7win:	and	%glob_tmp, 0x7f, %glob_tmp
-spnwin_patch3_7win:	and	%twin_tmp, 0x7f, %twin_tmp
-	/* END OF PATCH INSTRUCTIONS */
-
 	/* The trap entry point has done the following:
 	 *
 	 * rd    %psr, %l0
@@ -69,7 +57,6 @@ spnwin_patch3_7win:	and	%twin_tmp, 0x7f, %twin_tmp
 	 * will be all zeroes.
 	 */
 	.globl	spill_window_entry 
-	.globl	spnwin_patch1, spnwin_patch2, spnwin_patch3
 spill_window_entry:
 	/* LOCATION: Trap Window */
 
@@ -81,10 +68,10 @@ spill_window_entry:
 	 *
 	 * newwim = ((%wim>>1) | (%wim<<(nwindows - 1)));
 	 */
-		srl	%t_wim, 0x1, %twin_tmp
-spnwin_patch1:	sll	%t_wim, 7, %glob_tmp
-		or	%glob_tmp, %twin_tmp, %glob_tmp
-spnwin_patch2:	and	%glob_tmp, 0xff, %glob_tmp
+	srl	%t_wim, 0x1, %twin_tmp
+	sll	%t_wim, 7, %glob_tmp
+	or	%glob_tmp, %twin_tmp, %glob_tmp
+	and	%glob_tmp, 0xff, %glob_tmp
 
 	/* The trap entry point has set the condition codes
 	 * up for us to see if this is from user or kernel.
@@ -222,17 +209,17 @@ spwin_user_stack_is_bolixed:
 	mov	1, %twin_tmp
 	st	%twin_tmp, [%curptr + TI_W_SAVED]
 
-		/* Compute new user window mask.  What we are basically
-		 * doing is taking two windows, the invalid one at trap
-		 * time and the one we attempted to throw onto the users
-		 * stack, and saying that everything else is an ok user
-		 * window.  umask = ((~(%t_wim | %wim)) & valid_wim_bits)
-		 */
-		rd	%wim, %twin_tmp
-		or	%twin_tmp, %t_wim, %twin_tmp
-		not	%twin_tmp
-spnwin_patch3:	and	%twin_tmp, 0xff, %twin_tmp	! patched on 7win Sparcs
-		st	%twin_tmp, [%curptr + TI_UWINMASK]
+	/* Compute new user window mask.  What we are basically
+	 * doing is taking two windows, the invalid one at trap
+	 * time and the one we attempted to throw onto the users
+	 * stack, and saying that everything else is an ok user
+	 * window.  umask = ((~(%t_wim | %wim)) & valid_wim_bits)
+	 */
+	rd	%wim, %twin_tmp
+	or	%twin_tmp, %t_wim, %twin_tmp
+	not	%twin_tmp
+	and	%twin_tmp, 0xff, %twin_tmp
+	st	%twin_tmp, [%curptr + TI_UWINMASK]
 
 #define STACK_OFFSET (THREAD_SIZE - TRACEREG_SZ - STACKFRAME_SZ)
 
diff --git a/arch/sparc/kernel/wuf.S b/arch/sparc/kernel/wuf.S
index 4c52b69d4b7a..dd2a539f92ff 100644
--- a/arch/sparc/kernel/wuf.S
+++ b/arch/sparc/kernel/wuf.S
@@ -68,27 +68,17 @@
 	 *           are done and return from trap if successful
 	 */
 
-	/* BEGINNING OF PATCH INSTRUCTIONS */
-
-	/* On 7-window Sparc the boot code patches fnwin_patch1
-	 * with the following instruction.
-	 */
-	.globl	fnwin_patch1_7win, fnwin_patch2_7win
-fnwin_patch1_7win:	srl	%t_wim, 6, %twin_tmp2
-fnwin_patch2_7win:	and	%twin_tmp1, 0x7f, %twin_tmp1
-	/* END OF PATCH INSTRUCTIONS */
-
-	.globl	fill_window_entry, fnwin_patch1, fnwin_patch2
+	.globl	fill_window_entry
 fill_window_entry:
 	/* LOCATION: Window 'T' */
 
 	/* Compute what the new %wim is going to be if we retrieve
 	 * the proper window off of the stack.
 	 */
-		sll	%t_wim, 1, %twin_tmp1
-fnwin_patch1:	srl	%t_wim, 7, %twin_tmp2
-		or	%twin_tmp1, %twin_tmp2, %twin_tmp1
-fnwin_patch2:	and	%twin_tmp1, 0xff, %twin_tmp1
+	sll	%t_wim, 1, %twin_tmp1
+	srl	%t_wim, 7, %twin_tmp2
+	or	%twin_tmp1, %twin_tmp2, %twin_tmp1
+	and	%twin_tmp1, 0xff, %twin_tmp1
 
 	wr	%twin_tmp1, 0x0, %wim	/* Make window 'I' invalid */
 

-- 
2.34.1

