Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43599D59C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 19:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B199010E487;
	Mon, 14 Oct 2024 17:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="k3d30zk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE9210E497
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I+mpBSRMC2PjsZQsP2aDamzNXIpUUQHVX2cVhqu+kLQ=; b=k3d30zk1xDsIiE939jnmmLAwA8
 GrU4UvgFlY96TerzUdfHkqWq9bIro42NZiaobWJ/A9WeF9guBH6IXb95KRnSdJZon8n5dPz4cEAcF
 /S4IdMw5Ujg6ZIT/eARrmmW2Q8nxmKuv6Cv4RwT2jMyAdm3kaOhtfZUxeMuRCitxvTxQqLaT6QST2
 VUQlOH1LMzSVsvT9uLOoCujsfyko2REwV14aK94CMbDD8/C3SbY8MZgy/b+2GBE/i1VcfkLMjqKhA
 yIh/xXJH43kRQDp7mqb6+kKvTkdaKlNZ9+y1O+yjAvLTicKnXYHe16oFXk8cFa4kduwP7MI796WT5
 wVP6XEeA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t0Ow3-00000006ORH-3UKF; Mon, 14 Oct 2024 17:32:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
 id ED72F3004AF; Mon, 14 Oct 2024 19:32:46 +0200 (CEST)
Date: Mon, 14 Oct 2024 19:32:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Ian Rogers <irogers@google.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 3/5] perf: Add pmu get/put
Message-ID: <20241014173246.GI16066@noisy.programming.kicks-ass.net>
References: <20241008183501.1354695-1-lucas.demarchi@intel.com>
 <20241008183501.1354695-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008183501.1354695-4-lucas.demarchi@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 08, 2024 at 01:34:59PM -0500, Lucas De Marchi wrote:
> If a pmu is unregistered while there's an active event, perf will still
> access the pmu via event->pmu, even after the event is destroyed. This
> makes it difficult for drivers like i915 that can be unbound from the
> HW.
> 
> 	BUG: KASAN: use-after-free in exclusive_event_destroy+0xd8/0xf0
> 	Read of size 4 at addr ffff88816e2bb63c by task perf/7748
> 
> i915 tries to cope with it by installing a event->destroy, but that is
> not sufficient: if pmu is released by the driver, it will still crash
> since event->pmu is still used.
> 
> Moreover, even with that use-after-free fixed by adjusting the order in
> _free_event() or delaying the free by the driver, kernel still oops when
> closing the event fd related to a unregistered pmu: the percpu variables
> allocated on perf_pmu_register() would already be released. One such
> crash is:
> 
> 	BUG: KASAN: user-memory-access in _raw_spin_lock_irqsave+0x88/0x100
> 	Write of size 4 at addr 00000000ffffffff by task perf/727
> 
> 	CPU: 0 UID: 0 PID: 727 Comm: perf Not tainted 6.12.0-rc1-DEMARCHI-dxnf+ #9
> 	Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS unknown 2/2/2022
> 	Call Trace:
> 	 <TASK>
> 	 dump_stack_lvl+0x5f/0x90
> 	 print_report+0x4d3/0x50a
> 	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> 	 ? kasan_addr_to_slab+0xd/0xb0
> 	 kasan_report+0xe2/0x170
> 	 ? _raw_spin_lock_irqsave+0x88/0x100
> 	 ? _raw_spin_lock_irqsave+0x88/0x100
> 	 kasan_check_range+0x125/0x230
> 	 __kasan_check_write+0x14/0x30
> 	 _raw_spin_lock_irqsave+0x88/0x100
> 	 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> 	 _atomic_dec_and_raw_lock_irqsave+0x89/0x110
> 	 ? __kasan_check_write+0x14/0x30
> 	 put_pmu_ctx+0x98/0x330
> 
> The fix here is to provide a set of get/put hooks that drivers can
> implement to piggy back the perf's pmu lifecycle to the driver's
> instance lifecycle.  With this, perf_pmu_unregister() can be called by
> the driver, which is then responsible for freeing the resources.

I'm confused.. probably because I still don't have any clue about
drivers and the above isn't really telling me much either.

I don't see how you get rid of the try_module_get() we do per event;
without that you can't unload the module.

And I don't see how you think it is safe to free a pmu while there are
still events around.

Nor do I really see what these new get/put methods do. I see you call
->put() where we do module_put(), and ->get() near try_module_get(), but
how is that helping?


