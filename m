Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBA757030
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 01:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1164A10E2BC;
	Mon, 17 Jul 2023 23:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3244710E2BC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 23:03:29 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-34896a1574dso632695ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689635007; x=1692227007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=PjdXTr3dzdMnu6+stW9Y5PEi63LoYA7/O+Nyj8BgZrY=;
 b=DXaD1vRPgFSnKmXn3XmG3556H/iN7AORkeSIiv52gtXqrSsva4y99v678W83plsKQd
 Sb2RzUfAyqCwSAZXeTyPSTPVhft5cksYPgmlzFxPtaVsXr5qxjkvMhG/pbHf0f5Z50aS
 h9GVaj7R2fjtsiyItodMYi2N+0lWvihW95Yh1xyg3f7uUHAUyazn/6vxom75h3hyS49M
 aLO1zkjumLSNbljkXUZ1tYdZnJUSGtbH6lbZ/WdbgQyAalJGZBSmguuL4aRnR0VkTQfA
 MypCw40Sse8dM7MJ11W8RLcgEnNMiagL13pXMPaU1M+MYaMVjRDZvWqM2XKdb/0HVNLA
 OHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689635007; x=1692227007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PjdXTr3dzdMnu6+stW9Y5PEi63LoYA7/O+Nyj8BgZrY=;
 b=Xm7Qa4SUvJUTfJugPnl+/5JasMYQRf8XFHRPMimncc8FRNsqzmvk62p0pPdDvwaHgd
 x019rhaf+eDlL11oBWwdibtm1X1WhEgp/wp2R7on0oOuacXxQN+lS2ui+NdkRP973NHK
 vD3r7ABbw03DCqfR3xeqdmpfd1+YZBui3l/NVxVi6TVUVVNj79WOT38dCLh1WuKI0hw/
 wpAr/0nKsmJLTs//m3p3c8iax1+j/ySSCzJV9NjDfmEbyqgBnjlJox+xZlWEYucYJfvI
 G8VU7z8TWy4mzKFwbkXv2li/0w7P77z6I/h+SbZOSBboA2S2zpaO1L77pPf2gqqRwqNu
 wQxw==
X-Gm-Message-State: ABy/qLYffS8GAiYKhmclIgmsBkVTftApoSQhaXSQjTFq8bTWfg9n+yU5
 UbFLu9o6Q8P4qYvsJjAwZW0=
X-Google-Smtp-Source: APBJJlFC6SX/VCeG/MeX057j4EOjP0lF4J3jcfQ3edgXjMjcygGdQA4pJA+cbFryNUtJs9NdzCdVQg==
X-Received: by 2002:a05:6e02:1b07:b0:346:189a:1b74 with SMTP id
 i7-20020a056e021b0700b00346189a1b74mr1436604ilv.0.1689635007204; 
 Mon, 17 Jul 2023 16:03:27 -0700 (PDT)
Received: from localhost (dhcp-72-235-13-41.hawaiiantel.net. [72.235.13.41])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a92d605000000b0034628814e66sm254216ilm.40.2023.07.17.16.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 16:03:26 -0700 (PDT)
Date: Mon, 17 Jul 2023 13:03:25 -1000
From: Tejun Heo <tj@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2
 6/7] workqueue: Report work funcs that trigger automatic CPU_INTENSIVE
 mechanism)
Message-ID: <ZLXIvXBvhsnL-ik_@slm.duckdns.org>
References: <20230511181931.869812-1-tj@kernel.org>
 <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
 <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
 <CAMuHMdW1kxZ1RHKTRVRqDNAbj1Df2=v0fPn5KYK3kfX_kiXR6A@mail.gmail.com>
 <ZK3MBfPS-3-tJgjO@slm.duckdns.org>
 <ZK30CR196rs-OWLq@slm.duckdns.org>
 <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUCXPi+aS-7bR3qRetKF9T3W9jk_HKjvaXmfHv5SEeuFg@mail.gmail.com>
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
Cc: linux-rtc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, netdev <netdev@vger.kernel.org>,
 kernel-team@meta.com, Lai Jiangshan <jiangshanlai@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, Geert.

Can you please the following patch and see how many reports you get? Looking
back at your reports, I think some of them probably should be converted to
UNBOUND but we should have a better idea with the adjusted threshold.

Thanks.

From 8555cbd4b22e5f85eb2bdcb84fd1d1f519a0a0d3 Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Mon, 17 Jul 2023 12:50:02 -1000
Subject: [PATCH] workqueue: Scale up wq_cpu_intensive_thresh_us if BogoMIPS is
 below 1000

wq_cpu_intensive_thresh_us is used to detect CPU-hogging per-cpu work items.
Once detected, they're excluded from concurrency management to prevent them
from blocking other per-cpu work items. If CONFIG_WQ_CPU_INTENSIVE_REPORT is
enabled, repeat offenders are also reported so that the code can be updated.

The default threshold is 10ms which is long enough to do fair bit of work on
modern CPUs while short enough to be usually not noticeable. This
unfortunately leads to a lot of, arguable spurious, detections on very slow
CPUs. Using the same threshold across CPUs whose performance levels may be
apart by multiple levels of magnitude doesn't make whole lot of sense.

This patch scales up wq_cpu_intensive_thresh_us upto 1 second when BogoMIPS
is below 1000. This is obviously very inaccurate but it doesn't have to be
accurate to be useful. The mechanism is still useful when the threshold is
fully scaled up and the benefits of reports are usually shared with everyone
regardless of who's reporting, so as long as there are sufficient number of
fast machines reporting, we don't lose much.

Some (or is it all?) ARM CPUs systemtically report significantly lower
BogoMIPS. While this doesn't break anything, given how widespread ARM CPUs
are, it's at least a missed opportunity and it probably would be a good idea
to teach workqueue about it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
---
 kernel/workqueue.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 02a8f402eeb5..0d7a3d29762f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -52,6 +52,7 @@
 #include <linux/sched/debug.h>
 #include <linux/nmi.h>
 #include <linux/kvm_para.h>
+#include <linux/delay.h>
 
 #include "workqueue_internal.h"
 
@@ -338,8 +339,10 @@ static cpumask_var_t *wq_numa_possible_cpumask;
  * Per-cpu work items which run for longer than the following threshold are
  * automatically considered CPU intensive and excluded from concurrency
  * management to prevent them from noticeably delaying other per-cpu work items.
+ * ULONG_MAX indicates that the user hasn't overridden it with a boot parameter.
+ * The actual value is initialized in wq_cpu_intensive_thresh_init().
  */
-static unsigned long wq_cpu_intensive_thresh_us = 10000;
+static unsigned long wq_cpu_intensive_thresh_us = ULONG_MAX;
 module_param_named(cpu_intensive_thresh_us, wq_cpu_intensive_thresh_us, ulong, 0644);
 
 static bool wq_disable_numa;
@@ -6513,6 +6516,42 @@ void __init workqueue_init_early(void)
 	       !system_freezable_power_efficient_wq);
 }
 
+static void __init wq_cpu_intensive_thresh_init(void)
+{
+	unsigned long thresh;
+	unsigned long mips;
+
+	/* if the user set it to a specific value, keep it */
+	if (wq_cpu_intensive_thresh_us != ULONG_MAX)
+		return;
+
+	/*
+	 * The default of 10ms is derived from the fact that most modern (as of
+	 * 2023) processors can do a lot in 10ms and that it's just below what
+	 * most consider human-perceivable. However, the kernel also runs on a
+	 * lot slower CPUs including microcontrollers where the threshold is way
+	 * too low.
+	 *
+	 * Let's scale up the threshold upto 1 second if BogoMips is below 1000.
+	 * This is by no means accurate but it doesn't have to be. The mechanism
+	 * is still useful even when the threshold is fully scaled up. Also, as
+	 * the reports would usually be applicable to everyone, some machines
+	 * operating on longer thresholds won't significantly diminish their
+	 * usefulness.
+	 */
+	thresh = 10 * USEC_PER_MSEC;
+
+	/* see init/calibrate.c for lpj -> BogoMIPS calculation */
+	mips = max_t(unsigned long, loops_per_jiffy / 500000 * HZ, 1);
+	if (mips < 1000)
+		thresh = min_t(unsigned long, thresh * 1000 / mips, USEC_PER_SEC);
+
+	pr_debug("wq_cpu_intensive_thresh: lpj=%lu mips=%lu thresh_us=%lu\n",
+		 loops_per_jiffy, mips, thresh);
+
+	wq_cpu_intensive_thresh_us = thresh;
+}
+
 /**
  * workqueue_init - bring workqueue subsystem fully online
  *
@@ -6528,6 +6567,8 @@ void __init workqueue_init(void)
 	struct worker_pool *pool;
 	int cpu, bkt;
 
+	wq_cpu_intensive_thresh_init();
+
 	/*
 	 * It'd be simpler to initialize NUMA in workqueue_init_early() but
 	 * CPU to node mapping may not be available that early on some
-- 
2.41.0

