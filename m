Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C087E5738
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 14:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F7410E744;
	Wed,  8 Nov 2023 13:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FB410E744
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 13:02:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C74B615BB;
 Wed,  8 Nov 2023 13:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8D6C433AD;
 Wed,  8 Nov 2023 13:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699448521;
 bh=P3J0BM+Ztj1RDywy9VBJzXOtZYn62giSRkEPqVP9Q5s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=burlYIIjmswCo6kZvxA/AuJo2RuSbSUh4JxXaXm/BrFLoO6sD0WbSTWokcncffA5Y
 wo67CWy7N7wOACKbAjL4Sl4DOEFPrDKMgY2Vmh/5oPq1FFSPn3MesPrDFyK3fFfF+h
 dk6lEsIi5AaEvBWjsExxnfkOCp+Y/j0YDMjCGWeZk4t0/cvy4o2fX7tRgRNSb6Qelx
 p79OIkjot7Y52dQukaAiknMAc45DLBU2iLS+jxn81hgrHM+MMiDtBc6mW7+a/wwob/
 jEghvumy9S0waHmg1Pwvnhj3TUenjvtSujPtQ86XOHtjGfPo5Pk2jGRwf2OtkS3O5k
 /rNYAvRDuqPvA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH 12/22] csky: fix arch_jump_label_transform_static override
Date: Wed,  8 Nov 2023 13:58:33 +0100
Message-Id: <20231108125843.3806765-13-arnd@kernel.org>
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

The arch_jump_label_transform_static() function in csky was originally meant to
override the generic __weak function, but that got changed to an #ifndef check.

This showed up as a missing-prototype warning:
arch/csky/kernel/jump_label.c:43:6: error: no previous prototype for 'arch_jump_label_transform_static' [-Werror=missing-prototypes]

Change the method to use the new method of having a #define and a prototype
for the global function.

Fixes: 7e6b9db27de9 ("jump_label: make initial NOP patching the special case")
Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/include/asm/jump_label.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/csky/include/asm/jump_label.h b/arch/csky/include/asm/jump_label.h
index d488ba6084bc..98a3f4b168bd 100644
--- a/arch/csky/include/asm/jump_label.h
+++ b/arch/csky/include/asm/jump_label.h
@@ -43,5 +43,10 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
 	return true;
 }
 
+enum jump_label_type;
+void arch_jump_label_transform_static(struct jump_entry *entry,
+				      enum jump_label_type type);
+#define arch_jump_label_transform_static arch_jump_label_transform_static
+
 #endif  /* __ASSEMBLY__ */
 #endif	/* __ASM_CSKY_JUMP_LABEL_H */
-- 
2.39.2

