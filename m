Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4BC26A95C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 18:11:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D2189C28;
	Tue, 15 Sep 2020 16:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6545089C28;
 Tue, 15 Sep 2020 16:10:59 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5369206BE;
 Tue, 15 Sep 2020 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600186258;
 bh=h8FrMLmRYTR7EG3ov+53gJbd++NMD57LcgsrZ+W8Sok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sO86BqljD5TTUSf3Do5Tr23UIE8zY6Bz1UDtpNwChPTIbD5+keIeFFrqnf8XsRJr0
 ojiIAWWGP4t8b9bz6D3u0TyrwIrYQfCa/vsL1qeBTtNKTpMduZ7SEC4jTL9i3luICh
 OrDt1j8SFI8DM7C/qo2V0n/aLixXUHY994PZbfUw=
Date: Tue, 15 Sep 2020 17:10:48 +0100
From: Will Deacon <will@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 06/13] locking/bitspinlock: Clenaup PREEMPT_COUNT leftovers
Message-ID: <20200915161047.GA26745@willie-the-truck>
References: <20200914204209.256266093@linutronix.de>
 <20200914204441.579902354@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914204441.579902354@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lai Jiangshan <jiangshanlai@gmail.com>, dri-devel@lists.freedesktop.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-hexagon@vger.kernel.org,
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
 linux-um@lists.infradead.org, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, rcu@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 10:42:15PM +0200, Thomas Gleixner wrote:
> CONFIG_PREEMPT_COUNT is now unconditionally enabled and will be
> removed. Cleanup the leftovers before doing so.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/bit_spinlock.h |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/include/linux/bit_spinlock.h
> +++ b/include/linux/bit_spinlock.h
> @@ -90,10 +90,8 @@ static inline int bit_spin_is_locked(int
>  {
>  #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
>  	return test_bit(bitnum, addr);
> -#elif defined CONFIG_PREEMPT_COUNT
> -	return preempt_count();
>  #else
> -	return 1;
> +	return preempt_count();
>  #endif

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
