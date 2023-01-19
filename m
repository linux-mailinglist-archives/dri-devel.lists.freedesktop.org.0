Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EA673218
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC4910E8B2;
	Thu, 19 Jan 2023 07:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id E772F10E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:06:52 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 19 Jan 2023 16:06:51 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Jan 2023 16:06:51 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: boqun.feng@gmail.com
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Date: Thu, 19 Jan 2023 16:06:38 +0900
Message-Id: <1674111998-25175-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1674109388-6663-1-git-send-email-byungchul.park@lge.com>
References: <1674109388-6663-1-git-send-email-byungchul.park@lge.com>
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

Byungchul wrote:
> Boqun wrote:
> > On Mon, Jan 16, 2023 at 10:00:52AM -0800, Linus Torvalds wrote:
> > > [ Back from travel, so trying to make sense of this series..  ]
> > > 
> > > On Sun, Jan 8, 2023 at 7:33 PM Byungchul Park <byungchul.park@lge.com> wrote:
> > > >
> > > > I've been developing a tool for detecting deadlock possibilities by
> > > > tracking wait/event rather than lock(?) acquisition order to try to
> > > > cover all synchonization machanisms. It's done on v6.2-rc2.
> > > 
> > > Ugh. I hate how this adds random patterns like
> > > 
> > >         if (timeout == MAX_SCHEDULE_TIMEOUT)
> > >                 sdt_might_sleep_strong(NULL);
> > >         else
> > >                 sdt_might_sleep_strong_timeout(NULL);
> > >    ...
> > >         sdt_might_sleep_finish();
> > > 
> > > to various places, it seems so very odd and unmaintainable.
> > > 
> > > I also recall this giving a fair amount of false positives, are they all fixed?
> > > 
> > 
> > From the following part in the cover letter, I guess the answer is no?
> 
> I fixed what we found anyway.
> 
> > 	...
> > 	6. Multiple reports are allowed.
> > 	7. Deduplication control on multiple reports.
> > 	8. Withstand false positives thanks to 6.
> > 	...
> > 
> > seems to me that the logic is since DEPT allows multiple reports so that
> > false positives are fitlerable by users?
> 
> At lease, it's needed until DEPT is considered stable because stronger
> detection inevitably has more chance of false alarms unless we do manual
> fix on each, which is the same as Lockdep.
> 
> > > Anyway, I'd really like the lockdep people to comment and be involved.
> > 
> > I never get Cced, so I'm unware of this for a long time...
> 
> Sorry I missed it. I will cc you from now on.
> 
> > A few comments after a quick look:
> > 
> > *	Looks like the DEPT dependency graph doesn't handle the
> > 	fair/unfair readers as lockdep current does. Which bring the
> > 	next question.
> 
> No. DEPT works better for unfair read. It works based on wait/event. So
> read_lock() is considered a potential wait waiting on write_unlock()
> while write_lock() is considered a potential wait waiting on either
> write_unlock() or read_unlock(). DEPT is working perfect for it.
> 
> For fair read (maybe you meant queued read lock), I think the case
> should be handled in the same way as normal lock. I might get it wrong.
> Please let me know if I miss something.
> 
> > *	Can DEPT pass all the selftests of lockdep in
> > 	lib/locking-selftests.c?
> > 
> > *	Instead of introducing a brand new detector/dependency tracker,
> > 	could we first improve the lockdep's dependency tracker? I think
> 
> At the beginning of this work, of course I was thinking to improve
> Lockdep but I decided to implement a new tool because:
> 
> 	1. What we need to check for deadlock detection is no longer
> 	   lock dependency but more fundamental dependency by wait/event.
> 	   A better design would have a separate dependency engine for
> 	   that, not within Lockdep. Remind lock/unlock are also
> 	   wait/event after all.
> 
> 	2. I was thinking to revert the revert of cross-release. But it
> 	   will start to report false alarms as Lockdep was at the
> 	   beginning, and require us to keep fixing things until being
> 	   able to see what we are interested in, maybe for ever. How
> 	   can we control that situation? I wouldn't use this extention.
> 
> 	3. Okay. Let's think about modifying the current Lockdep to make
> 	   it work similar to DEPT. It'd require us to pay more effort
> 	   than developing a new simple tool from the scratch with the
> 	   basic requirement.
> 
> 	4. Big change at once right away? No way. The new tool need to
> 	   be matured and there are ones who want to make use of DEPT at
> 	   the same time. The best approach would be I think to go along
> 	   together for a while.

(Appologize for this. Let me re-write this part.)

	4. Big change at once right away? No way. The new feature need
	   to be matured and there are ones who want to use the new
	   feature at the same time. The best approach would be I think
	   to go along together for a while.

Thanks,
	Byungchul

> Please don't look at each detail but the big picture, the architecture.
> Plus, please consider I introduce a tool only focucing on fundamental
> dependency itself that Lockdep can make use of. I wish great developers
> like you would join improve the common engine togather.
> 
> > 	Byungchul also agrees that DEPT and lockdep should share the
> > 	same dependency tracker and the benefit of improving the
> 
> I agree that both should share a single tracker.
> 
> > 	existing one is that we can always use the self test to catch
> > 	any regression. Thoughts?
> 
> I imagine the follownig look for the final form:
> 
>      Lock correctness checker(LOCKDEP)
>      +-----------------------------------------+
>      | Lock usage correctness check            |
>      |                                         |
>      |                                         |
>      |       (Request dependency check)        |
>      |                           T             |
>      +---------------------------|-------------+
>                                  |
>      Dependency tracker(DEPT)    V
>      +-----------------------------------------+
>      | Dependency check                        |
>      | (by tracking wait and event context)    |
>      +-----------------------------------------+
> 
> > Actually the above sugguest is just to revert revert cross-release
> > without exposing any annotation, which I think is more practical to
> > review and test.
> 
> Reverting the revert of cross-release is not bad. But I'd suggest a
> nicer design for the reasons I explained above.
> 
> 	Byungchul
> 
> > I'd sugguest we 1) first improve the lockdep dependency tracker with
> > wait/event in mind and then 2) introduce wait related annotation so that
> > users can use, and then 3) look for practical ways to resolve false
> > positives/multi reports with the help of users, if all goes well,
> > 4) make it all operation annotated.
> > 
> > Thoughts?
> > 
> > Regards,
> > Boqun
