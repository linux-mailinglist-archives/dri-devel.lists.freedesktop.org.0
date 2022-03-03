Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0644CB62F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 06:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D2010EAC9;
	Thu,  3 Mar 2022 05:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2878A10EAC9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 05:23:56 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.52 with ESMTP; 3 Mar 2022 14:23:55 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 3 Mar 2022 14:23:55 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: tytso@mit.edu
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Date: Thu,  3 Mar 2022 14:23:33 +0900
Message-Id: <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <YiAow5gi21zwUT54@mit.edu>
References: <YiAow5gi21zwUT54@mit.edu>
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
Cc: hamohammed.sa@gmail.com, jack@suse.cz, peterz@infradead.org,
 daniel.vetter@ffwll.ch, amir73il@gmail.com, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 bfields@fieldses.org, linux-ide@vger.kernel.org, adilger.kernel@dilger.ca,
 joel@joelfernandes.org, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ted wrote:
> On Thu, Mar 03, 2022 at 10:00:33AM +0900, Byungchul Park wrote:
> > 
> > Unfortunately, it's neither perfect nor safe without another wakeup
> > source - rescue wakeup source.
> > 
> >    consumer			producer
> > 
> >				lock L
> >				(too much work queued == true)
> >				unlock L
> >				--- preempted
> >    lock L
> >    unlock L
> >    do work
> >    lock L
> >    unlock L
> >    do work
> >    ...
> >    (no work == true)
> >    sleep
> >				--- scheduled in
> >				sleep
> 
> That's not how things work in ext4.  It's **way** more complicated

You seem to get it wrong. This example is what Jan Kara gave me. I just
tried to explain things based on Jan Kara's example so leaving all
statements that Jan Kara wrote. Plus the example was so helpful. Thanks,
Jan Kara.

> than that.  We have multiple wait channels, one wake up the consumer
> (read: the commit thread), and one which wakes up any processes
> waiting for commit thread to have made forward progress.  We also have
> two spin-lock protected sequence number, one which indicates the
> current commited transaction #, and one indicating the transaction #
> that needs to be committed.
> 
> On the commit thread, it will sleep on j_wait_commit, and when it is
> woken up, it will check to see if there is work to be done
> (j_commit_sequence != j_commit_request), and if so, do the work, and
> then wake up processes waiting on the wait_queue j_wait_done_commit.
> (Again, all of this uses the pattern, "prepare to wait", then check to
> see if we should sleep, if we do need to sleep, unlock j_state_lock,
> then sleep.   So this prevents any races leading to lost wakeups.
> 
> On the start_this_handle() thread, if we current transaction is too
> full, we set j_commit_request to its transaction id to indicate that
> we want the current transaction to be committed, and then we wake up
> the j_wait_commit wait queue and then we enter a loop where do a
> prepare_to_wait in j_wait_done_commit, check to see if
> j_commit_sequence == the transaction id that we want to be completed,
> and if it's not done yet, we unlock the j_state_lock spinlock, and go
> to sleep.  Again, because of the prepare_to_wait, there is no chance
> of a lost wakeup.

The above explantion gives me a clear view about synchronization of
journal things. I appreciate it.

> So there really is no "consumer" and "producer" here.  If you really
> insist on using this model, which really doesn't apply, for one

Dept does not assume "consumer" and "producer" model at all, but Dept
works with general waits and events. *That model is just one of them.*

> thread, it's the consumer with respect to one wait queue, and the
> producer with respect to the *other* wait queue.  For the other
> thread, the consumer and producer roles are reversed.
> 
> And of course, this is a highly simplified model, since we also have a
> wait queue used by the commit thread to wait for the number of active
> handles on a particular transaction to go to zero, and
> stop_this_handle() will wake up commit thread via this wait queue when
> the last active handle on a particular transaction is retired.  (And
> yes, that parameter is also protected by a different spin lock which
> is per-transaction).

This one also gives me a clear view. Thanks a lot.

> So it seems to me that a fundamental flaw in DEPT's model is assuming
> that the only waiting paradigm that can be used is consumer/producer,

No, Dept does not.

> and that's simply not true.  The fact that you use the term "lock" is
> also going to lead a misleading line of reasoning, because properly

"lock/unlock L" comes from the Jan Kara's example. It has almost nothing
to do with the explanation. I just left "lock/unlock L" as a statement
that comes from the Jan Kara's example.

> speaking, they aren't really locks.  We are simply using wait channels

I totally agree with you. *They aren't really locks but it's just waits
and wakeups.* That's exactly why I decided to develop Dept. Dept is not
interested in locks unlike Lockdep, but fouces on waits and wakeup
sources itself. I think you get Dept wrong a lot. Please ask me more if
you have things you doubt about Dept.

Thanks,
Byungchul
