Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA28269F3A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7876E85E;
	Tue, 15 Sep 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E956E5A9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:45:20 +0000 (UTC)
Message-Id: <20200914204442.204800632@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XyvC7yBudjy7gN990L1QZH9Nylf7gOC9KQ7KI91uUOM=;
 b=akEfXSzp1aVBWTteUJmTC4HEdeDmhL7rTwjlr2U80/m0udF6LaZbKm5shVqUmJ6JtB3YW1
 tsGgyr+hHKalavhDUn+aa/9oPdrLHUGicw8r3Op8do1j33Cs/ht56Jl83zEs5b8dMQCvBc
 C6/6kn5IoIvp+Y6d1+5IBK6vdL1JQvpzhobOZfmqQciOLsOV1HtgraHHRnA4FCUu8Fjumo
 a6Zvz/3FZjzglBH7nIfS9+YAfbz6fDdE5mRe5N1/ytHTH4klAK+eYBifmKyhcmAqZ6m2FG
 7fxbApFt+eRUp1cILIVVBYRPysDKnL96fJQsv225URI7lc5XIAqYpGiDWpx2ZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=XyvC7yBudjy7gN990L1QZH9Nylf7gOC9KQ7KI91uUOM=;
 b=n0Bmd855DlgSURWhypGfhEUBZgUW5/TCOXlYwxsXJg34s+YsXgJYyMc5y7W0Ht72bPwilb
 Jio8U7PGX2lFjtAQ==
Date: Mon, 14 Sep 2020 22:42:21 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 12/13] rcutorture: Clenaup PREEMPT_COUNT leftovers
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
 Will Deacon <will@kernel.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Brian Cain <bcain@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mel Gorman <mgorman@suse.de>, intel-gfx@lists.freedesktop.org,
 Matt Turner <mattst88@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, linux-xtensa@linux-xtensa.org,
 "Paul E. McKenney" <paulmck@kernel.org>, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, Linus Torvalds <torvalds@linuxfoundation.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-hexagon@vger.kernel.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
removed. Cleanup the leftovers before doing so.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: rcu@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/rcutorture/configs/rcu/SRCU-t            |    1 -
 tools/testing/selftests/rcutorture/configs/rcu/SRCU-u            |    1 -
 tools/testing/selftests/rcutorture/configs/rcu/TINY01            |    1 -
 tools/testing/selftests/rcutorture/doc/TINY_RCU.txt              |    5 ++---
 tools/testing/selftests/rcutorture/doc/TREE_RCU-kconfig.txt      |    1 -
 tools/testing/selftests/rcutorture/formal/srcu-cbmc/src/config.h |    1 -
 6 files changed, 2 insertions(+), 8 deletions(-)

--- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-t
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-t
@@ -7,4 +7,3 @@ CONFIG_RCU_TRACE=n
 CONFIG_DEBUG_LOCK_ALLOC=n
 CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
 CONFIG_DEBUG_ATOMIC_SLEEP=y
-#CHECK#CONFIG_PREEMPT_COUNT=y
--- a/tools/testing/selftests/rcutorture/configs/rcu/SRCU-u
+++ b/tools/testing/selftests/rcutorture/configs/rcu/SRCU-u
@@ -7,4 +7,3 @@ CONFIG_RCU_TRACE=n
 CONFIG_DEBUG_LOCK_ALLOC=y
 CONFIG_PROVE_LOCKING=y
 CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
-CONFIG_PREEMPT_COUNT=n
--- a/tools/testing/selftests/rcutorture/configs/rcu/TINY01
+++ b/tools/testing/selftests/rcutorture/configs/rcu/TINY01
@@ -10,4 +10,3 @@ CONFIG_RCU_TRACE=n
 #CHECK#CONFIG_RCU_STALL_COMMON=n
 CONFIG_DEBUG_LOCK_ALLOC=n
 CONFIG_DEBUG_OBJECTS_RCU_HEAD=n
-CONFIG_PREEMPT_COUNT=n
--- a/tools/testing/selftests/rcutorture/doc/TINY_RCU.txt
+++ b/tools/testing/selftests/rcutorture/doc/TINY_RCU.txt
@@ -3,11 +3,10 @@ This document gives a brief rationale fo
 
 Kconfig Parameters:
 
-CONFIG_DEBUG_LOCK_ALLOC -- Do all three and none of the three.
-CONFIG_PREEMPT_COUNT
+CONFIG_DEBUG_LOCK_ALLOC -- Do both and none of the two.
 CONFIG_RCU_TRACE
 
-The theory here is that randconfig testing will hit the other six possible
+The theory here is that randconfig testing will hit the other two possible
 combinations of these parameters.
 
 
--- a/tools/testing/selftests/rcutorture/doc/TREE_RCU-kconfig.txt
+++ b/tools/testing/selftests/rcutorture/doc/TREE_RCU-kconfig.txt
@@ -43,7 +43,6 @@ CONFIG_64BIT
 
 	Used only to check CONFIG_RCU_FANOUT value, inspection suffices.
 
-CONFIG_PREEMPT_COUNT
 CONFIG_PREEMPT_RCU
 
 	Redundant with CONFIG_PREEMPT, ignore.
--- a/tools/testing/selftests/rcutorture/formal/srcu-cbmc/src/config.h
+++ b/tools/testing/selftests/rcutorture/formal/srcu-cbmc/src/config.h
@@ -8,7 +8,6 @@
 #undef CONFIG_HOTPLUG_CPU
 #undef CONFIG_MODULES
 #undef CONFIG_NO_HZ_FULL_SYSIDLE
-#undef CONFIG_PREEMPT_COUNT
 #undef CONFIG_PREEMPT_RCU
 #undef CONFIG_PROVE_RCU
 #undef CONFIG_RCU_NOCB_CPU

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
