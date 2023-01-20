Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26326674909
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 02:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE61710E0CF;
	Fri, 20 Jan 2023 01:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBBFD10E0CF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 01:52:00 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.53 with ESMTP; 20 Jan 2023 10:51:58 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 20 Jan 2023 10:51:58 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: boqun.feng@gmail.com
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Date: Fri, 20 Jan 2023 10:51:45 +0900
Message-Id: <1674179505-26987-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <Y8mZHKJV4FH17vGn@boqun-archlinux>
References: <Y8mZHKJV4FH17vGn@boqun-archlinux>
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
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, tglx@linutronix.de,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boqun wrote:
> On Thu, Jan 19, 2023 at 01:33:58PM +0000, Matthew Wilcox wrote:
> > On Thu, Jan 19, 2023 at 03:23:08PM +0900, Byungchul Park wrote:
> > > Boqun wrote:
> > > > *Looks like the DEPT dependency graph doesn't handle the
> > > > fair/unfair readers as lockdep current does. Which bring the
> > > > next question.
> > > 
> > > No. DEPT works better for unfair read. It works based on wait/event. So
> > > read_lock() is considered a potential wait waiting on write_unlock()
> > > while write_lock() is considered a potential wait waiting on either
> > > write_unlock() or read_unlock(). DEPT is working perfect for it.
> > > 
> > > For fair read (maybe you meant queued read lock), I think the case
> > > should be handled in the same way as normal lock. I might get it wrong.
> > > Please let me know if I miss something.
> > 
> > From the lockdep/DEPT point of view, the question is whether:
> > 
> >	read_lock(A)
> >	read_lock(A)
> > 
> > can deadlock if a writer comes in between the two acquisitions and
> > sleeps waiting on A to be released.  A fair lock will block new
> > readers when a writer is waiting, while an unfair lock will allow
> > new readers even while a writer is waiting.
> > 
> 
> To be more accurate, a fair reader will wait if there is a writer
> waiting for other reader (fair or not) to unlock, and an unfair reader
> won't.

What a kind guys, both of you! Thanks.

I asked to check if there are other subtle things than this. Fortunately,
I already understand what you guys shared.

> In kernel there are read/write locks that can have both fair and unfair
> readers (e.g. queued rwlock). Regarding deadlocks,
> 
> 	T0		T1		T2
> 	--		--		--
> 	fair_read_lock(A);
> 			write_lock(B);
> 					write_lock(A);
> 	write_lock(B);
> 			unfair_read_lock(A);

With the DEPT's point of view (let me re-write the scenario):

	T0		T1		T2
	--		--		--
	fair_read_lock(A);
			write_lock(B);
					write_lock(A);
	write_lock(B);
			unfair_read_lock(A);
	write_unlock(B);
	read_unlock(A);
			read_unlock(A);
			write_unlock(B);
					write_unlock(A);

T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
    not doing either write_unlock(B) or read_unlock(B). In other words:

      1. read_unlock(A) happening depends on write_unlock(B) happening.
      2. read_unlock(A) happening depends on read_unlock(B) happening.

T1: write_unlock(B) cannot happen if unfair_read_lock(A) is stuck by a A
    owner not doing write_unlock(A). In other words:

      3. write_unlock(B) happening depends on write_unlock(A) happening.

1, 2 and 3 give the following dependencies:

    1. read_unlock(A) -> write_unlock(B)
    2. read_unlock(A) -> read_unlock(B)
    3. write_unlock(B) -> write_unlock(A)

There's no circular dependency so it's safe. DEPT doesn't report this.

> the above is not a deadlock, since T1's unfair reader can "steal" the
> lock. However the following is a deadlock:
> 
> 	T0		T1		T2
> 	--		--		--
> 	unfair_read_lock(A);
> 			write_lock(B);
> 					write_lock(A);
> 	write_lock(B);
> 			fair_read_lock(A);
> 
> , since T'1 fair reader will wait.

With the DEPT's point of view (let me re-write the scenario):

	T0		T1		T2
	--		--		--
	unfair_read_lock(A);
			write_lock(B);
					write_lock(A);
	write_lock(B);
			fair_read_lock(A);
	write_unlock(B);
	read_unlock(A);
			read_unlock(A);
			write_unlock(B);
					write_unlock(A);

T0: read_unlock(A) cannot happen if write_lock(B) is stuck by a B owner
    not doing either write_unlock(B) or read_unlock(B). In other words:

      1. read_unlock(A) happening depends on write_unlock(B) happening.
      2. read_unlock(A) happening depends on read_unlock(B) happening.

T1: write_unlock(B) cannot happen if fair_read_lock(A) is stuck by a A
    owner not doing either write_unlock(A) or read_unlock(A). In other
    words:

      3. write_unlock(B) happening depends on write_unlock(A) happening.
      4. write_unlock(B) happening depends on read_unlock(A) happening.

1, 2, 3 and 4 give the following dependencies:

    1. read_unlock(A) -> write_unlock(B)
    2. read_unlock(A) -> read_unlock(B)
    3. write_unlock(B) -> write_unlock(A)
    4. write_unlock(B) -> read_unlock(A)

With 1 and 4, there's a circular dependency so DEPT definitely report
this as a problem.

REMIND: DEPT focuses on waits and events.

> FWIW, lockdep is able to catch this (figuring out which is deadlock and
> which is not) since two years ago, plus other trivial deadlock detection
> for read/write locks. Needless to say, if lib/lock-selftests.c was given
> a try, one could find it out on one's own.
> 
> Regards,
> Boqun
> 
