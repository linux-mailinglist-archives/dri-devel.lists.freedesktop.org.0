Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A4269F43
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5496E859;
	Tue, 15 Sep 2020 07:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0846E5AB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:45:18 +0000 (UTC)
Message-Id: <20200914204441.888971282@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=8jOReEDZljlqa4dRpw6zeMP+ergwjtpRGdTwRrkKdMw=;
 b=vFnjOhcm6A5rkHvga94OSbt2wSr9aZ4/4+Gjp2chF1ha6JRKuOU3CNHmQq7Rg0ucK7RjRq
 d1D2Op6P1EtRbiw1cEqLOfkMOTw5M9OBQCUWIX2Vc7AfVnYS9V/tDPBpJkwrvrHwRdU1d7
 7DUDLh3A28EHsBiZZaaiZ4XcKkxPFqmL/FjArWA/u2rDiLgyAiFFZv/ZPgW3uVZZIF0hNt
 SO4D6rz5myLzg+OIBie1VxAn7tKs9mhq1R5tw2SsZ+K8oofgfxbHrAuKz3D8rHzFCar81p
 rprjoEA30lfX7K/ss6o941PuhINzOHmOt/SOQ4kR19H9U8YiCZtP9wbcNIoZtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=8jOReEDZljlqa4dRpw6zeMP+ergwjtpRGdTwRrkKdMw=;
 b=JU7ChlHF+O/eQcV9Z/9GQyaR7D5Z3O57wqZXnRf3e7Ecka8E/GQOwYqD+fJd5CXXar201W
 f9H0fImrNN7UHEDQ==
Date: Mon, 14 Sep 2020 22:42:18 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 09/13] ARM: Clenaup PREEMPT_COUNT leftovers
References: <20200914204209.256266093@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 15 Sep 2020 07:07:18 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>, dri-devel@lists.freedesktop.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Brian Cain <bcain@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx@lists.freedesktop.org,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 Shuah Khan <shuah@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, linux-alpha@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
removed. Cleanup the leftovers before doing so.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/assembler.h   |   11 -----------
 arch/arm/kernel/iwmmxt.S           |    2 --
 arch/arm/mach-ep93xx/crunch-bits.S |    2 --
 3 files changed, 15 deletions(-)

--- a/arch/arm/include/asm/assembler.h
+++ b/arch/arm/include/asm/assembler.h
@@ -212,7 +212,6 @@
 /*
  * Increment/decrement the preempt count.
  */
-#ifdef CONFIG_PREEMPT_COUNT
 	.macro	inc_preempt_count, ti, tmp
 	ldr	\tmp, [\ti, #TI_PREEMPT]	@ get preempt count
 	add	\tmp, \tmp, #1			@ increment it
@@ -229,16 +228,6 @@
 	get_thread_info \ti
 	dec_preempt_count \ti, \tmp
 	.endm
-#else
-	.macro	inc_preempt_count, ti, tmp
-	.endm
-
-	.macro	dec_preempt_count, ti, tmp
-	.endm
-
-	.macro	dec_preempt_count_ti, ti, tmp
-	.endm
-#endif
 
 #define USERL(l, x...)				\
 9999:	x;					\
--- a/arch/arm/kernel/iwmmxt.S
+++ b/arch/arm/kernel/iwmmxt.S
@@ -94,9 +94,7 @@ ENTRY(iwmmxt_task_enable)
 	mov	r2, r2				@ cpwait
 	bl	concan_save
 
-#ifdef CONFIG_PREEMPT_COUNT
 	get_thread_info r10
-#endif
 4:	dec_preempt_count r10, r3
 	ret	r9				@ normal exit from exception
 
--- a/arch/arm/mach-ep93xx/crunch-bits.S
+++ b/arch/arm/mach-ep93xx/crunch-bits.S
@@ -191,9 +191,7 @@ ENTRY(crunch_task_enable)
 	cfldr64		mvdx15, [r0, #CRUNCH_MVDX15]
 
 1:
-#ifdef CONFIG_PREEMPT_COUNT
 	get_thread_info r10
-#endif
 2:	dec_preempt_count r10, r3
 	ret	lr
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
