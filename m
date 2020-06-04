Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31B1EEDF5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 00:50:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4746E7D0;
	Thu,  4 Jun 2020 22:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41E6E7D0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 22:50:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 3642E120ED481;
 Thu,  4 Jun 2020 15:50:17 -0700 (PDT)
Date: Thu, 04 Jun 2020 15:50:16 -0700 (PDT)
Message-Id: <20200604.155016.1381130025313726200.davem@davemloft.net>
To: a.darwish@linutronix.de
Subject: Re: [PATCH v2 0/6] seqlock: seqcount_t call sites bugfixes
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200603144949.1122421-1-a.darwish@linutronix.de>
References: <20200603144949.1122421-1-a.darwish@linutronix.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 04 Jun 2020 15:50:18 -0700 (PDT)
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
Cc: axboe@kernel.dk, paulmck@kernel.org, peterz@infradead.org,
 bigeasy@linutronix.de, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 linux-block@vger.kernel.org, airlied@linux.ie, edumazet@google.com,
 mingo@redhat.com, dri-devel@lists.freedesktop.org, kuba@kernel.org,
 tglx@linutronix.de, will@kernel.org, vgoyal@redhat.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
Date: Wed,  3 Jun 2020 16:49:43 +0200

> Since patch #7 and #8 from the series:
> 
>    [PATCH v1 00/25] seqlock: Extend seqcount API with associated locks
>    https://lore.kernel.org/lkml/20200519214547.352050-1-a.darwish@linutronix.de
> 
> are now pending on the lockdep/x86 IRQ state tracking patch series:
> 
>    [PATCH 00/14] x86/entry: disallow #DB more and x86/entry lockdep/nmi
>    https://lkml.kernel.org/r/20200529212728.795169701@infradead.org
> 
>    [PATCH v3 0/5] lockdep: Change IRQ state tracking to use per-cpu variables
>    https://lkml.kernel.org/r/20200529213550.683440625@infradead.org
> 
> This is a repost only of the seqcount_t call sites bugfixes that were on
> top of the seqlock patch series.
> 
> These fixes are independent, and can thus be merged on their own. I'm
> reposting them now so they can at least hit -rc2 or -rc3.
> 
> Changelog-v2:
> 
>   - patch #1: Add a missing up_read() on netdev_get_name() error path
>               exit. Thanks to Dan/kbuild-bot report.
> 
>   - patch #4: new patch, invalid preemptible context found by the new
>               lockdep checks added in the seqlock series + kbuild-bot.

I'll apply patches 1-4 to the net tree.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
