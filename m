Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A99269F3E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1938D6E857;
	Tue, 15 Sep 2020 07:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E876E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:45:13 +0000 (UTC)
Message-Id: <20200914204441.686695987@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600116312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=RfxMqlPiepbkielPdHvAzLuC/W7nRAVZVsmDVELAHII=;
 b=pjt4ipoHz2SR+76u/tosh7gyPxQsg2oL/bqNd6MRCV4oI1z48eqv1u70tHD6lv8me21lrp
 r0nf9q7gfeNk/g6/mQbWoxxc6sgattZculBG7/CAEhhAosn3HO+ELh/5ZMKS01PZDGGPiV
 5UPGaI9uTL9WPM9r49P7uaq5wk95tawOQtkcIzkOz6iSKD5SsqVW8RpHISt5xAmsNGRf/s
 PwQDlz+dCOVfrDUrCEkzB0vPklJs8f3/2QV6ZG5w6yyAxtpbaqFGEafdnTlhe/mPuQGW/2
 aaWaJRqL/bLlqEm3DE9P4rm0Ldlt8ELtOtjbcIXqqOCzZO06YL/N5kw2xvNEHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600116312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=RfxMqlPiepbkielPdHvAzLuC/W7nRAVZVsmDVELAHII=;
 b=KKlXvjmRL6XVp/lLKfPN8jJGOYdGr+dBLEzJxa2pQ6HTfXoVmCn9f/zEn0x26bRx145urU
 PFTkWVcFpRpLnPDg==
Date: Mon, 14 Sep 2020 22:42:16 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 07/13] uaccess: Clenaup PREEMPT_COUNT leftovers
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
---
 include/linux/uaccess.h |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -230,9 +230,9 @@ static inline bool pagefault_disabled(vo
  *
  * This function should only be used by the fault handlers. Other users should
  * stick to pagefault_disabled().
- * Please NEVER use preempt_disable() to disable the fault handler. With
- * !CONFIG_PREEMPT_COUNT, this is like a NOP. So the handler won't be disabled.
- * in_atomic() will report different values based on !CONFIG_PREEMPT_COUNT.
+ *
+ * Please NEVER use preempt_disable() or local_irq_disable() to disable the
+ * fault handler.
  */
 #define faulthandler_disabled() (pagefault_disabled() || in_atomic())
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
