Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBEF1DE06E
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B226E98A;
	Fri, 22 May 2020 06:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A866E8BD;
 Thu, 21 May 2020 00:10:13 +0000 (UTC)
Received: from [5.158.153.53] (helo=debian-buster-darwi.lab.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.80) (envelope-from <a.darwish@linutronix.de>)
 id 1jbYmC-0006mO-Af; Thu, 21 May 2020 02:09:32 +0200
Date: Thu, 21 May 2020 02:09:30 +0200
From: "Ahmed S. Darwish" <a.darwish@linutronix.de>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v1 13/25] dma-buf: Use sequence counter with associated
 wound/wait mutex
Message-ID: <20200521000930.GA359643@debian-buster-darwi.lab.linutronix.de>
References: <20200519214547.352050-1-a.darwish@linutronix.de>
 <20200519214547.352050-14-a.darwish@linutronix.de>
 <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e28c251e-5771-598c-37dd-c6be2de4b9e1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:06 +0000
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
Cc: dri-devel@lists.freedesktop.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Sebastian A. Siewior" <bigeasy@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020, Christian K=F6nig wrote:
> Am 19.05.20 um 23:45 schrieb Ahmed S. Darwish:
> > A sequence counter write side critical section must be protected by some
> > form of locking to serialize writers. If the serialization primitive is
> > not disabling preemption implicitly, preemption has to be explicitly
> > disabled before entering the sequence counter write side critical
> > section.
> >
> > The dma-buf reservation subsystem uses plain sequence counters to manage
> > updates to reservations. Writer serialization is accomplished through a
> > wound/wait mutex.
> >
> > Acquiring a wound/wait mutex does not disable preemption, so this needs
> > to be done manually before and after the write side critical section.
> >
> > Use the newly-added seqcount_ww_mutex_t instead:
> >
> >    - It associates the ww_mutex with the sequence count, which enables
> >      lockdep to validate that the write side critical section is proper=
ly
> >      serialized.
> >
> >    - It removes the need to explicitly add preempt_disable/enable()
> >      around the write side critical section because the write_begin/end=
()
> >      functions for this new data type automatically do this.
> >
> > If lockdep is disabled this ww_mutex lock association is compiled out
> > and has neither storage size nor runtime overhead.
>
> Mhm, is the dma_resv object the only user of this new seqcount_ww_mutex
> variant ?
>
> If yes we are trying to get rid of this sequence counter for quite some
> time, so I would rather invest the additional time to finish this.
>

In this patch series, each extra "seqcount with associated lock" data
type costs us, exactly:

  - 1 typedef definition, seqcount_ww_mutex_t
  - 1 static initializer, SEQCNT_WW_MUTEX_ZERO()
  - 1 runtime initializer, seqcount_ww_mutex_init()

Definitions for the typedef and the 2 initializers above are
template-code one liners.

The logic which automatically disables preemption upon entering a
seqcount_ww_mutex_t write side critical section is also already shared
with seqcount_mutex_t and any future, preemptible, associated lock.

So, yes, dma-resv is the only user of seqcount_ww_mutex.

But even in that case, given the one liner template code nature of
seqcount_ww_mutex_t logic, it does not make sense to block the dma_resv
and amdgpu change until at some point in the future the sequence counter
is completely removed.

**If and when** the sequence counter gets removed, please just remove
the seqcount_ww_mutex_t data type with it. It will be extremely simple.

> Regards,
> Christian.
>

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
