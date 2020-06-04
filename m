Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C9F1EF1E3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712976E857;
	Fri,  5 Jun 2020 07:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD6B6E2BC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 08:42:10 +0000 (UTC)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1jglRV-0008RC-Pp; Thu, 04 Jun 2020 10:41:41 +0200
Date: Thu, 4 Jun 2020 10:41:40 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 0/6] seqlock: seqcount_t call sites bugfixes
Message-ID: <20200604084139.GA1123871@debian-buster-darwi.lab.linutronix.de>
References: <20200603144949.1122421-1-a.darwish@linutronix.de>
 <20200604072841.GR20149@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604072841.GR20149@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Cc: Jens Axboe <axboe@kernel.dk>, "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-block@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eric Dumazet <edumazet@google.com>, Ingo Molnar <mingo@redhat.com>,
 dri-devel@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vivek Goyal <vgoyal@redhat.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 04, 2020 at 09:28:41AM +0200, Daniel Vetter wrote:
> On Wed, Jun 03, 2020 at 04:49:43PM +0200, Ahmed S. Darwish wrote:
> > Hi,
> >
> > Since patch #7 and #8 from the series:
> >
> >    [PATCH v1 00/25] seqlock: Extend seqcount API with associated locks
> >    https://lore.kernel.org/lkml/20200519214547.352050-1-a.darwish@linutronix.de
> >
> > are now pending on the lockdep/x86 IRQ state tracking patch series:
> >
> >    [PATCH 00/14] x86/entry: disallow #DB more and x86/entry lockdep/nmi
> >    https://lkml.kernel.org/r/20200529212728.795169701@infradead.org
> >
> >    [PATCH v3 0/5] lockdep: Change IRQ state tracking to use per-cpu variables
> >    https://lkml.kernel.org/r/20200529213550.683440625@infradead.org
> >
> > This is a repost only of the seqcount_t call sites bugfixes that were on
> > top of the seqlock patch series.
> >
> > These fixes are independent, and can thus be merged on their own. I'm
> > reposting them now so they can at least hit -rc2 or -rc3.
>
> I'm confused on what I should do with patch 6 here for dma-buf. Looks like
> just a good cleanup/prep work, so I'd queue it for linux-next and 5.9, but
> sounds like you want this in earlier. Do you need this in 5.8-rc for some
> work meant for 5.9? Will this go in through some topic branch directly?
> Should I apply it?
>
> Patch itself lgtm, I'm just confused what I should do with it.
>

My apologies for the confusion. The cover letter is indeed misleading
w.r.t. the dma-buf patch.  It isn't a bugfix, so it shouldn't hit -rc.

Since without this patch compiling the seqcount series will fail, it
will be best to merge it through tip instead.

So all I need for now is a reviewed-by tag :) I will forwoard it to the
tip tree afterwards.

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
