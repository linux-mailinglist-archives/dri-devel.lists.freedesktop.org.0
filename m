Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7751F215
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 02:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127310F470;
	Mon,  9 May 2022 00:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id D61D910F470
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 00:18:15 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.52 with ESMTP; 9 May 2022 09:18:13 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 9 May 2022 09:18:13 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Mon, 9 May 2022 09:16:37 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220509001637.GA6047@X58A-UD3R>
References: <CAHk-=whnPePcffsNQM+YSHMGttLXvpf8LbBQ8P7HEdqFXaV7Lg@mail.gmail.com>
 <1651795895-8641-1-git-send-email-byungchul.park@lge.com>
 <YnYd0hd+yTvVQxm5@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnYd0hd+yTvVQxm5@hyeyoo>
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
 cl@linux.com, will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, ngupta@vflare.org,
 johannes.berg@intel.com, jack@suse.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, tytso@mit.edu, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 07, 2022 at 04:20:50PM +0900, Hyeonggon Yoo wrote:
> On Fri, May 06, 2022 at 09:11:35AM +0900, Byungchul Park wrote:
> > Linus wrote:
> > >
> > > On Wed, May 4, 2022 at 1:19 AM Byungchul Park <byungchul.park@lge.com> wrote:
> > > >
> > > > Hi Linus and folks,
> > > >
> > > > I've been developing a tool for detecting deadlock possibilities by
> > > > tracking wait/event rather than lock(?) acquisition order to try to
> > > > cover all synchonization machanisms.
> > > 
> > > So what is the actual status of reports these days?
> > > 
> > > Last time I looked at some reports, it gave a lot of false positives
> > > due to mis-understanding prepare_to_sleep().
> > 
> > Yes, it was. I handled the case in the following way:
> > 
> > 1. Stage the wait at prepare_to_sleep(), which might be used at commit.
> >    Which has yet to be an actual wait that Dept considers.
> > 2. If the condition for sleep is true, the wait will be committed at
> >    __schedule(). The wait becomes an actual one that Dept considers.
> > 3. If the condition is false and the task gets back to TASK_RUNNING,
> >    clean(=reset) the staged wait.
> > 
> > That way, Dept only works with what actually hits to __schedule() for
> > the waits through sleep.
> > 
> > > For this all to make sense, it would need to not have false positives
> > > (or at least a very small number of them together with a way to sanely
> > 
> > Yes. I agree with you. I got rid of them that way I described above.
> >
> 
> IMHO DEPT should not report what lockdep allows (Not talking about

No.

> wait events). I mean lockdep allows some kind of nested locks but
> DEPT reports them.

You have already asked exactly same question in another thread of
LKML. That time I answered to it but let me explain it again.

---

CASE 1.

   lock L with depth n
   lock_nested L' with depth n + 1
   ...
   unlock L'
   unlock L

This case is allowed by Lockdep.
This case is allowed by DEPT cuz it's not a deadlock.

CASE 2.

   lock L with depth n
   lock A
   lock_nested L' with depth n + 1
   ...
   unlock L'
   unlock A
   unlock L

This case is allowed by Lockdep.
This case is *NOT* allowed by DEPT cuz it's a *DEADLOCK*.

---

The following scenario would explain why CASE 2 is problematic.

   THREAD X			THREAD Y

   lock L with depth n
				lock L' with depth n
   lock A
				lock A
   lock_nested L' with depth n + 1
				lock_nested L'' with depth n + 1
   ...				...
   unlock L'			unlock L''
   unlock A			unlock A
   unlock L			unlock L'

Yes. I need to check if the report you shared with me is a true one, but
it's not because DEPT doesn't work with *_nested() APIs.

	Byungchul
