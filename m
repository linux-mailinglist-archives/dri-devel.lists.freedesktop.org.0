Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A0F269F3B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851186E863;
	Tue, 15 Sep 2020 07:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B5B6E5A9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:45:17 +0000 (UTC)
Message-Id: <20200914204441.994684356@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=TRrTJ1jZm0XUMVVVU/gV/azUYmKke4wyEiIzxYaskEw=;
 b=3TD4iEAa5z0918ENIAD9UxVHjDn6ypjdORbq/o3MOziAQLn2y1ZnbIN+xIaEaHclb0As+g
 58l/uRb7XMMAuEbOSN2Ue4Kh8MReixiWlQi5uyvfUGUgvgpdIeI9d9iu/KlurZfPHgCQ16
 TElbADAbR1FhIsJ8R5Mm6lfip/Blm699jZkGnbmpWLLZhJtUitEXrKx74t54p2WgINTc7J
 Eyh7FNLevwbWXZVNvHaiTDEXkbaqKcDlPV1IJ9AaJsejXEHERuNWJg72je9bpL2lFGOLKa
 tLZfD1PaRIHn/gSUkFHjmh94UUn70FgTc3BXS0N8kofNqvF8MBi3aOXfALZc7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=TRrTJ1jZm0XUMVVVU/gV/azUYmKke4wyEiIzxYaskEw=;
 b=bHJIqI1achWaHiH5/5wVKP2PP0lec8Ju34VdhGbJlNLEqtL/PZG2iVbcTXhNbUAOwhfTJu
 lVgqSlRYWtmPO0Bw==
Date: Mon, 14 Sep 2020 22:42:19 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 10/13] xtensa: Clenaup PREEMPT_COUNT leftovers
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
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
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
 Chris Zankel <chris@zankel.net>, linux-mm@kvack.org,
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
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-xtensa@linux-xtensa.org
---
 arch/xtensa/kernel/entry.S |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -819,7 +819,7 @@ ENTRY(debug_exception)
 	 * preemption if we have HW breakpoints to preserve DEBUGCAUSE.DBNUM
 	 * meaning.
 	 */
-#if defined(CONFIG_PREEMPT_COUNT) && defined(CONFIG_HAVE_HW_BREAKPOINT)
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
 	GET_THREAD_INFO(a2, a1)
 	l32i	a3, a2, TI_PRE_COUNT
 	addi	a3, a3, 1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
