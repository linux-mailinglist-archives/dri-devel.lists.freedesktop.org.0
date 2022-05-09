Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902AD520971
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 01:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8649B10F0FD;
	Mon,  9 May 2022 23:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 521F710F0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 23:40:17 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.52 with ESMTP; 10 May 2022 08:40:15 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 10 May 2022 08:40:14 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Tue, 10 May 2022 08:38:38 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220509233838.GC6047@X58A-UD3R>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo> <20220509001637.GA6047@X58A-UD3R>
 <20220509164712.746e236b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509164712.746e236b@gandalf.local.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, linux-mm@kvack.org,
 linux-ide@vger.kernel.org, adilger.kernel@dilger.ca, joel@joelfernandes.org,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 04:47:12PM -0400, Steven Rostedt wrote:
> On Mon, 9 May 2022 09:16:37 +0900
> Byungchul Park <byungchul.park@lge.com> wrote:
> 
> > CASE 2.
> > 
> >    lock L with depth n
> >    lock A
> >    lock_nested L' with depth n + 1
> >    ...
> >    unlock L'
> >    unlock A
> >    unlock L
> > 
> > This case is allowed by Lockdep.
> > This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.
> > 
> > ---
> > 
> > The following scenario would explain why CASE 2 is problematic.
> > 
> >    THREAD X			THREAD Y
> > 
> >    lock L with depth n
> > 				lock L' with depth n
> >    lock A
> > 				lock A
> >    lock_nested L' with depth n + 1
> 
> I'm confused by what exactly you are saying is a deadlock above.
> 
> Are you saying that lock A and L' are inversed? If so, lockdep had better

Hi Steven,

Yes, I was talking about A and L'.

> detect that regardless of L. A nested lock associates the the nesting with

When I checked Lockdep code, L' with depth n + 1 and L' with depth n
have different classes in Lockdep.

That's why I said Lockdep cannot detect it. By any chance, has it
changed so as to consider this case? Or am I missing something?

> the same type of lock. That is, in lockdep nested tells lockdep not to
> trigger on the L and L' but it will not ignore that A was taken.

It will not ignore A but it would work like this:

   THREAD X			THREAD Y

   lock Ln
				lock Ln
   lock A
				lock A
   lock_nested Lm
				lock_nested Lm

So, Lockdep considers this case safe, actually not tho.

	Byungchul

> 
> -- Steve
> 
> 
> 
> > 				lock_nested L'' with depth n + 1
> >    ...				...
> >    unlock L'			unlock L''
> >    unlock A			unlock A
> >    unlock L			unlock L'
