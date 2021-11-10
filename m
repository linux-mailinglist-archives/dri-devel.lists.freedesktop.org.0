Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D244C00D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 12:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439B16EE00;
	Wed, 10 Nov 2021 11:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494A6EE00
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CKdGRMTGsWn9HCBQ5Oi6SxJ1ad0n9MyScVi4CuS0mWM=; b=qxVhBfi88ggtGutV0mk23qAID+
 DqTtqFaZuebEIRAbDCmFVl2EDZn7kj7b83mbuV3XY+7417TPHZNnhHO7vmj26qpz3uFBeKKn/WRx2
 j2isy8Cd+1jyuOELDU0W00EG2u+7KjZZr/TGjNqZqG5lqXhg3SUmNTSPiGej1Oqawr5jwbRsZ8zhE
 Lt91QO8lAr/lE0UcgWMYZv9u2TiR1azxNRgcetmUql5yBH3qefh3JGRRr1tjgFZC+C7WMzsL0OiSp
 GSb7pySq+6oaDqIBnfFfHF8+LDnPA3mrHsd/AdszMJomO0hW+UZmBkFRH3jhz4iHYk4O3v8Q1ERAE
 6yq/xbIQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkleB-001ohi-VO; Wed, 10 Nov 2021 11:20:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AC4963000A3;
 Wed, 10 Nov 2021 12:20:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8E7E8214EB9C2; Wed, 10 Nov 2021 12:20:05 +0100 (CET)
Date: Wed, 10 Nov 2021 12:20:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: printk deadlock due to double lock attempt on current CPU's
 runqueue
Message-ID: <YYuq5d7MYL2wxlOd@hirez.programming.kicks-ass.net>
References: <YYrU2PdmdNkulWSM@sultan-box.localdomain> <YYuj/rT+EO3K0LsK@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYuj/rT+EO3K0LsK@alley>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Ben Segall <bsegall@google.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Anton Vorontsov <anton@enomsg.org>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, Kees Cook <keescook@chromium.org>,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Tony Luck <tony.luck@intel.com>,
 linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Colin Cross <ccross@android.com>,
 Daniel Bristot de Oliveira <bristot@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 11:50:38AM +0100, Petr Mladek wrote:
> On Tue 2021-11-09 12:06:48, Sultan Alsawaf wrote:
> > Hi,
> > 
> > I encountered a printk deadlock on 5.13 which appears to still affect the latest
> > kernel. The deadlock occurs due to printk being used while having the current
> > CPU's runqueue locked, and the underlying framebuffer console attempting to lock
> > the same runqueue when printk tries to flush the log buffer.
> > 
> > I'm not sure what the *correct* solution is here (don't use printk while having
> > a runqueue locked? don't use schedule_work() from the fbcon path? tell printk
> > to use one of its lock-less backends?), so I've cc'd all the relevant folks.
> 
> At the moment, printk_deferred() could be used here. It defers the
> console handling via irq_work().

I think I've rejected that patch at least twice now :-) John's printk
stuff will really land real soon now, right.
