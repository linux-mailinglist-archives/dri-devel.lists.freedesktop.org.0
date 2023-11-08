Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A037E5755
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451C510E74A;
	Wed,  8 Nov 2023 13:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACCA10E74A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:02:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CD0F2B81C62;
 Wed,  8 Nov 2023 13:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B392C433AB;
 Wed,  8 Nov 2023 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448550;
 bh=FgQWzkXF32qk/tCKQVUHf66ICQzLmXK/yCMtqaYVSN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ATCV0SJUwSUIUcmIUsNFO1nBVzSdvp/LWTE5vG4buRgpe3Rwh1Y3dyl+cAW9SJEPK
 LgX1p25vA4s2+ADl72IXSQOOTjzHz5keTaVsHX8pgaq1IEPWWxeKlMtMVMVaC2vQKe
 Ws6+2JIfEnZ/R4XXaQ+IRWTmsubg+Hdo1lbZXemwfoXinRx3ZmHg94gmpjM/za6cnA
 1ZY2IWqHrjYbCn3e3pFdfryRLkTz+IvcfC2uUzHfAFoLwSxsHbxMw7BDYe27fzcOJI
 /AFASuBgsZvOI7gHnDAux0k0HCEaJF6CKhwJwUqhhusQZYHGKC4wMrmpGOYPfPqRmz
 7w6Vzgrt36F+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 14/22] arch: add missing prepare_ftrace_return() prototypes
Date: Wed,  8 Nov 2023 13:58:35 +0100
Message-Id: <20231108125843.3806765-15-arnd@kernel.org>
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

The prototype for prepare_ftrace_return() is architecture specific and
can't be in a global header. Since it's normally called from assembly,
it doesn't really need a prototype, but we get a warning if it's missing:

arch/csky/kernel/ftrace.c:147:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]
arch/microblaze/kernel/ftrace.c:22:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]
arch/mips/kernel/ftrace.c:305:6: error: no previous prototype for 'prepare_ftrace_return' [-Werror=missing-prototypes]

Add the prototypes for the three architectures that don't already have
one in asm/ftrace.h.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/ftrace.h       | 4 ++++
 arch/microblaze/include/asm/ftrace.h | 1 +
 arch/mips/include/asm/ftrace.h       | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/ftrace.h b/arch/csky/include/asm/ftrace.h
index 9b86341731b6..fd215c38ef27 100644
--- a/arch/csky/include/asm/ftrace.h
+++ b/arch/csky/include/asm/ftrace.h
@@ -26,5 +26,9 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 
 struct dyn_arch_ftrace {
 };
+
+void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
+			   unsigned long frame_pointer);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __ASM_CSKY_FTRACE_H */
diff --git a/arch/microblaze/include/asm/ftrace.h b/arch/microblaze/include/asm/ftrace.h
index 6a92bed37794..4ca38b92a3a2 100644
--- a/arch/microblaze/include/asm/ftrace.h
+++ b/arch/microblaze/include/asm/ftrace.h
@@ -10,6 +10,7 @@
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
 extern void ftrace_call_graph(void);
+void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr);
 #endif
 
 #ifdef CONFIG_DYNAMIC_FTRACE
diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index db497a8167da..dc025888f6d2 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -85,6 +85,10 @@ struct dyn_arch_ftrace {
 };
 
 #endif /*  CONFIG_DYNAMIC_FTRACE */
+
+void prepare_ftrace_return(unsigned long *parent_ra_addr, unsigned long self_ra,
+			   unsigned long fp);
+
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_FUNCTION_TRACER */
 #endif /* _ASM_MIPS_FTRACE_H */
-- 
2.39.2

