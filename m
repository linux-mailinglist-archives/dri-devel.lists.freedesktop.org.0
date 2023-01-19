Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B105C673424
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 10:05:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298D310E8E8;
	Thu, 19 Jan 2023 09:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id E255310E8E8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:05:25 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.53 with ESMTP; 19 Jan 2023 18:05:24 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 19 Jan 2023 18:05:24 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: tglx@linutronix.de
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Date: Thu, 19 Jan 2023 18:05:11 +0900
Message-Id: <1674119111-12759-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <873588j92x.ffs@tglx>
References: <873588j92x.ffs@tglx>
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
 ngupta@vflare.org, johannes.berg@intel.com, boqun.feng@gmail.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, longman@redhat.com, dan.j.williams@intel.com,
 vbabka@suse.cz, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, max.byungchul.park@gmail.com, hannes@cmpxchg.org,
 tj@kernel.org, akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas wrote:
> On Tue, Jan 17 2023 at 10:18, Boqun Feng wrote:
> > On Mon, Jan 16, 2023 at 10:00:52AM -0800, Linus Torvalds wrote:
> > > I also recall this giving a fair amount of false positives, are they all fixed?
> >
> > From the following part in the cover letter, I guess the answer is no?
> >	...
> >       6. Multiple reports are allowed.
> >       7. Deduplication control on multiple reports.
> >       8. Withstand false positives thanks to 6.
> >	...
> >
> > seems to me that the logic is since DEPT allows multiple reports so that
> > false positives are fitlerable by users?
> 
> I really do not know what's so valuable about multiple reports. They
> produce a flood of information which needs to be filtered, while a
> single report ensures that the first detected issue is dumped, which
> increases the probability that it can be recorded and acted upon.

Assuming the following 2 assumptions, you are right.

Assumption 1. There will be too many reports with the multi-report
	      support, like all the combination of dependencies between
	      e.g. in-irq and irq-enabled-context.

Assumption 2. The detection is matured enough so that it barely happens
	      to fix false onces to see true one which is not a big deal.

However, DEPT doesn't generate all the combination of irq things as
Lockdep does so we only see a few multi-reports even with the support,
and I admit DEPT hasn't matured enough yet because fine classification
is required anyway to suppress false alarms. That's why I introduced
multi-report support at least for now. IMHO, it'd be still useful even
if it's gonna report a few true ones at once w/o false ones some day.

> Filtering out false positives is just the wrong approach. Decoding
> dependency issues from any tracker is complex enough given the nature of
> the problem, so adding the burden of filtering out issues from a stream
> of dumps is not helpful at all. It's just a marketing gag.
> 
> > *	Instead of introducing a brand new detector/dependency tracker,
> >	could we first improve the lockdep's dependency tracker? I think
> >	Byungchul also agrees that DEPT and lockdep should share the
> >	same dependency tracker and the benefit of improving the
> >	existing one is that we can always use the self test to catch
> >	any regression. Thoughts?
> 
> Ack. If the internal implementation of lockdep has shortcomings, then we
> can expand and/or replace it instead of having yet another
> infrastructure which is not even remotely as mature.

Ultimately, yes. We should expand or replace it instead of having
another ultimately.

	Byungchul
> 
> Thanks,
> 
>         tglx
