Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6C7E56C8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 13:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BE010E739;
	Wed,  8 Nov 2023 12:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196EB10E739
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 12:59:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 93B96B81AF7;
 Wed,  8 Nov 2023 12:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B038C433BD;
 Wed,  8 Nov 2023 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448388;
 bh=iQl+ZbOV1tCgpgRVsa1dN7uu1CKYK6sWimPMzLfgLgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MQf6DmwUXF67dcgtZy7mFUPPsMFYgRsDRuGsZqCEYnFU0wZeiY+iieT1RymjSqLqE
 J/Fo+5KjmlLsYlt5bT1f1nc4ow6drT5mbWbKMIXsFR3IW8cCwukdWq2hFsKKkzsVKU
 gwtu0uKrydZIveO8rTed1zQh8uU7UbnMogZK560PyWMGX/5RXXYSsScG1rT9VXewnm
 HX+14Epsqy92DMBGM8uFmRkOzUOqjZ8GsT2vwxoYWYdEzUpUa2UqQGwwTY7feTkJIU
 JMuX2WMjxOgUdkWxS1yqLHjQoPZRha3sT5ksEq17yJGi9JZQaLO2F0VGM7wr8THNiP
 tWS0QwwVQuwXQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 03/22] [RESEND] kprobes: unify kprobes_exceptions_nofify()
 prototypes
Date: Wed,  8 Nov 2023 13:58:24 +0100
Message-Id: <20231108125843.3806765-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Al Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

Most architectures that support kprobes declare this function in their
own asm/kprobes.h header and provide an override, but some are missing
the prototype, which causes a warning for the __weak stub implementation:

kernel/kprobes.c:1865:12: error: no previous prototype for 'kprobe_exceptions_notify' [-Werror=missing-prototypes]
 1865 | int __weak kprobe_exceptions_notify(struct notifier_block *self,

Move the prototype into linux/kprobes.h so it is visible to all
the definitions.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/kprobes.h     | 3 ---
 arch/arm/include/asm/kprobes.h     | 2 --
 arch/arm64/include/asm/kprobes.h   | 2 --
 arch/mips/include/asm/kprobes.h    | 2 --
 arch/powerpc/include/asm/kprobes.h | 2 --
 arch/s390/include/asm/kprobes.h    | 2 --
 arch/sh/include/asm/kprobes.h      | 2 --
 arch/sparc/include/asm/kprobes.h   | 2 --
 arch/x86/include/asm/kprobes.h     | 2 --
 include/linux/kprobes.h            | 4 ++++
 10 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/arch/arc/include/asm/kprobes.h b/arch/arc/include/asm/kprobes.h
index de1566e32cb8..68e8301c0df2 100644
--- a/arch/arc/include/asm/kprobes.h
+++ b/arch/arc/include/asm/kprobes.h
@@ -32,9 +32,6 @@ struct kprobe;
 
 void arch_remove_kprobe(struct kprobe *p);
 
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
-
 struct prev_kprobe {
 	struct kprobe *kp;
 	unsigned long status;
diff --git a/arch/arm/include/asm/kprobes.h b/arch/arm/include/asm/kprobes.h
index e26a278d301a..5b8dbf1b0be4 100644
--- a/arch/arm/include/asm/kprobes.h
+++ b/arch/arm/include/asm/kprobes.h
@@ -40,8 +40,6 @@ struct kprobe_ctlblk {
 
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 
 /* optinsn template addresses */
 extern __visible kprobe_opcode_t optprobe_template_entry[];
diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
index 05cd82eeca13..be7a3680dadf 100644
--- a/arch/arm64/include/asm/kprobes.h
+++ b/arch/arm64/include/asm/kprobes.h
@@ -37,8 +37,6 @@ struct kprobe_ctlblk {
 
 void arch_remove_kprobe(struct kprobe *);
 int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 void __kretprobe_trampoline(void);
 void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
 
diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
index 68b1e5d458cf..bc27d99c9436 100644
--- a/arch/mips/include/asm/kprobes.h
+++ b/arch/mips/include/asm/kprobes.h
@@ -71,8 +71,6 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 
 #endif /* CONFIG_KPROBES */
 #endif /* _ASM_KPROBES_H */
diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
index c8e4b4fd4e33..4525a9c68260 100644
--- a/arch/powerpc/include/asm/kprobes.h
+++ b/arch/powerpc/include/asm/kprobes.h
@@ -84,8 +84,6 @@ struct arch_optimized_insn {
 	kprobe_opcode_t *insn;
 };
 
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-					unsigned long val, void *data);
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 extern int kprobe_handler(struct pt_regs *regs);
 extern int kprobe_post_handler(struct pt_regs *regs);
diff --git a/arch/s390/include/asm/kprobes.h b/arch/s390/include/asm/kprobes.h
index 21b9e5290c04..01f1682a73b7 100644
--- a/arch/s390/include/asm/kprobes.h
+++ b/arch/s390/include/asm/kprobes.h
@@ -73,8 +73,6 @@ struct kprobe_ctlblk {
 void arch_remove_kprobe(struct kprobe *p);
 
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-int kprobe_exceptions_notify(struct notifier_block *self,
-	unsigned long val, void *data);
 
 #define flush_insn_slot(p)	do { } while (0)
 
diff --git a/arch/sh/include/asm/kprobes.h b/arch/sh/include/asm/kprobes.h
index eeba83e0a7d2..65d4c3316a5b 100644
--- a/arch/sh/include/asm/kprobes.h
+++ b/arch/sh/include/asm/kprobes.h
@@ -46,8 +46,6 @@ struct kprobe_ctlblk {
 };
 
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 extern int kprobe_handle_illslot(unsigned long pc);
 #else
 
diff --git a/arch/sparc/include/asm/kprobes.h b/arch/sparc/include/asm/kprobes.h
index 06c2bc767ef7..aec742cd898f 100644
--- a/arch/sparc/include/asm/kprobes.h
+++ b/arch/sparc/include/asm/kprobes.h
@@ -47,8 +47,6 @@ struct kprobe_ctlblk {
 	struct prev_kprobe prev_kprobe;
 };
 
-int kprobe_exceptions_notify(struct notifier_block *self,
-			     unsigned long val, void *data);
 int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
 asmlinkage void __kprobes kprobe_trap(unsigned long trap_level,
 				      struct pt_regs *regs);
diff --git a/arch/x86/include/asm/kprobes.h b/arch/x86/include/asm/kprobes.h
index a2e9317aad49..5939694dfb28 100644
--- a/arch/x86/include/asm/kprobes.h
+++ b/arch/x86/include/asm/kprobes.h
@@ -113,8 +113,6 @@ struct kprobe_ctlblk {
 };
 
 extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
-extern int kprobe_exceptions_notify(struct notifier_block *self,
-				    unsigned long val, void *data);
 extern int kprobe_int3_handler(struct pt_regs *regs);
 
 #else
diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 365eb092e9c4..ab1da3142b06 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -445,6 +445,10 @@ int kprobe_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
 
 int arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
 			    char *type, char *sym);
+
+int kprobe_exceptions_notify(struct notifier_block *self,
+			     unsigned long val, void *data);
+
 #else /* !CONFIG_KPROBES: */
 
 static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
-- 
2.39.2

