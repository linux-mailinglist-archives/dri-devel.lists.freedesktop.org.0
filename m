Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16114CE52E
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 15:16:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D38D10E423;
	Sat,  5 Mar 2022 14:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0487810E423
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 14:16:03 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.52 with ESMTP; 5 Mar 2022 23:16:01 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 5 Mar 2022 23:16:01 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Sat, 5 Mar 2022 23:15:38 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220305141538.GA31268@X58A-UD3R>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304004237.GB6112@X58A-UD3R>
 <YiLYX0sqmtkTEM5U@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiLYX0sqmtkTEM5U@mit.edu>
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

On Fri, Mar 04, 2022 at 10:26:23PM -0500, Theodore Ts'o wrote:
> On Fri, Mar 04, 2022 at 09:42:37AM +0900, Byungchul Park wrote:
> > 
> > All contexts waiting for any of the events in the circular dependency
> > chain will be definitely stuck if there is a circular dependency as I
> > explained. So we need another wakeup source to break the circle. In
> > ext4 code, you might have the wakeup source for breaking the circle.
> > 
> > What I agreed with is:
> > 
> >    The case that 1) the circular dependency is unevitable 2) there are
> >    another wakeup source for breadking the circle and 3) the duration
> >    in sleep is short enough, should be acceptable.
> > 
> > Sounds good?
> 
> These dependencies are part of every single ext4 metadata update,
> and if there were any unnecessary sleeps, this would be a major
> performance gap, and this is a very well studied part of ext4.
> 
> There are some places where we sleep, sure.  In some case
> start_this_handle() needs to wait for a commit to complete, and the
> commit thread might need to sleep for I/O to complete.  But the moment
> the thing that we're waiting for is complete, we wake up all of the
> processes on the wait queue.  But in the case where we wait for I/O
> complete, that wakeupis coming from the device driver, when it
> receives the the I/O completion interrupt from the hard drive.  Is
> that considered an "external source"?  Maybe DEPT doesn't recognize
> that this is certain to happen just as day follows the night?  (Well,
> maybe the I/O completion interrupt might not happen if the disk drive
> bursts into flames --- but then, you've got bigger problems. :-)

Almost all you've been blaming at Dept are totally non-sense. Based on
what you're saying, I'm conviced that you don't understand how Dept
works even 1%. You don't even try to understand it before blame.

You don't have to understand and support it. But I can't response to you
if you keep saying silly things that way.

> In any case, if DEPT is going to report these "circular dependencies
> as bugs that MUST be fixed", it's going to be pure noise and I will
> ignore all DEPT reports, and will push back on having Lockdep replaced

Dept is going to be improved so that what you are concerning about won't
be reported.

> by DEPT --- because Lockdep give us actionable reports, and if DEPT

Right. Dept should give actionable reports, too.

> can't tell the difference between a valid programming pattern and a
> bug, then it's worse than useless.

Needless to say.

