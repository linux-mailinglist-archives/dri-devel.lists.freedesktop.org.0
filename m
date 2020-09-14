Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB7C269F42
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D487F6E850;
	Tue, 15 Sep 2020 07:08:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75626E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:45:11 +0000 (UTC)
Message-Id: <20200914204441.375753691@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=rLyqvXX8ykRDikewrjB+k5sQeB3vmoPh6IJL9FYNd5E=;
 b=0l+YgFUMwvopub406qnKsr3dUzMW5NPZcFv6G4XvOZEQ88/olItKzVOA4C3bYkFUtxUTsb
 d6v+xvHY0Cf0pFi1XJzwPekHutxMnxoSPZyRNSusdIzlgBLEkcIcT5ez6oqXXsfXE4RpVG
 z8jA+tpUmSkmgzrIuoELC0Qs0HIQUSZ+ThJunQNfgd64d5ALlWCN7spWOTKewPGG//X5uW
 SDnsdlTigGEpi0Yk5N8j2gX8QGJXem5Feo6hcxV45cAdC1ZglVX7WyKso58nhlsjDukKbG
 5B5Dq7tjsGgdcRn9YcRdYTN6CFERdRtNhn2Rq0CHP4BBToJrIEpQLMh/myq27w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=rLyqvXX8ykRDikewrjB+k5sQeB3vmoPh6IJL9FYNd5E=;
 b=279035DbbzR5rrA/oYFZOR6A7RqYHpogOyqAAY71fcsTyj3GPke7oTdjeG6zebT9b9iXf2
 aR4ImfvLkgSxNvBg==
Date: Mon, 14 Sep 2020 22:42:13 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 04/13] lockdep: Clenaup PREEMPT_COUNT leftovers
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
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 include/linux/lockdep.h |    6 ++----
 lib/Kconfig.debug       |    1 -
 2 files changed, 2 insertions(+), 5 deletions(-)

--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -585,16 +585,14 @@ do {									\
 
 #define lockdep_assert_preemption_enabled()				\
 do {									\
-	WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)	&&		\
-		     debug_locks			&&		\
+	WARN_ON_ONCE(debug_locks			&&		\
 		     (preempt_count() != 0		||		\
 		      !raw_cpu_read(hardirqs_enabled)));		\
 } while (0)
 
 #define lockdep_assert_preemption_disabled()				\
 do {									\
-	WARN_ON_ONCE(IS_ENABLED(CONFIG_PREEMPT_COUNT)	&&		\
-		     debug_locks			&&		\
+	WARN_ON_ONCE(debug_locks			&&		\
 		     (preempt_count() == 0		&&		\
 		      raw_cpu_read(hardirqs_enabled)));			\
 } while (0)
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1161,7 +1161,6 @@ config PROVE_LOCKING
 	select DEBUG_RWSEMS
 	select DEBUG_WW_MUTEX_SLOWPATH
 	select DEBUG_LOCK_ALLOC
-	select PREEMPT_COUNT
 	select TRACE_IRQFLAGS
 	default n
 	help

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
