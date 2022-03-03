Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9EE4CB460
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 02:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771710E921;
	Thu,  3 Mar 2022 01:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id 430A110E921
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 01:36:57 +0000 (UTC)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
 by 156.147.23.52 with ESMTP; 3 Mar 2022 10:36:56 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.126 with ESMTP; 3 Mar 2022 10:36:56 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Thu, 3 Mar 2022 10:36:35 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220303013635.GC20752@X58A-UD3R>
References: <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-2-git-send-email-byungchul.park@lge.com>
 <20220221190204.q675gtsb6qhylywa@quack3.lan>
 <20220223003534.GA26277@X58A-UD3R>
 <20220223144859.na2gjgl5efgw5zhn@quack3.lan>
 <20220224011102.GA29726@X58A-UD3R>
 <20220224102239.n7nzyyekuacgpnzg@quack3.lan>
 <20220228092826.GA5201@X58A-UD3R>
 <20220228101444.6frl63dn5vmgycbp@quack3.lan>
 <Yh09sIsw5vh+qCeU@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yh09sIsw5vh+qCeU@mit.edu>
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>, peterz@infradead.org,
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
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 04:25:04PM -0500, Theodore Ts'o wrote:
> On Mon, Feb 28, 2022 at 11:14:44AM +0100, Jan Kara wrote:
> > > case 1. Code with an actual circular dependency, but not deadlock.
> > > 
> > >    A circular dependency can be broken by a rescue wakeup source e.g.
> > >    timeout. It's not a deadlock. If it's okay that the contexts
> > >    participating in the circular dependency and others waiting for the
> > >    events in the circle are stuck until it gets broken. Otherwise, say,
> > >    if it's not meant, then it's anyway problematic.
> > > 
> > >    1-1. What if we judge this code is problematic?
> > >    1-2. What if we judge this code is good?
> > > 
> > > I've been wondering if the kernel guys esp. Linus considers code with
> > > any circular dependency is problematic or not, even if it won't lead to
> > > a deadlock, say, case 1. Even though I designed Dept based on what I
> > > believe is right, of course, I'm willing to change the design according
> > > to the majority opinion.
> > > 
> > > However, I would never allow case 1 if I were the owner of the kernel
> > > for better stability, even though the code works anyway okay for now.
> 
> Note, I used the example of the timeout as the most obvious way of
> explaining that a deadlock is not possible.  There is also the much
> more complex explanation which Jan was trying to give, which is what
> leads to the circular dependency.  It can happen that when trying to
> start a handle, if either (a) there is not enough space in the journal
> for new handles, or (b) the current transaction is so large that if we
> don't close the transaction and start a new hone, we will end up
> running out of space in the future, and so in that case,
> start_this_handle() will block starting any more handles, and then
> wake up the commit thread.  The commit thread then waits for the
> currently running threads to complete, before it allows new handles to
> start, and then it will complete the commit.  In the case of (a) we
> then need to do a journal checkpoint, which is more work to release
> space in the journal, and only then, can we allow new handles to start.

Thank you for the full explanation of how journal things work.

> The botom line is (a) it works, (b) there aren't significant delays,
> and for DEPT to complain that this is somehow wrong and we need to
> completely rearchitect perfectly working code because it doesn't
> confirm to DEPT's idea of what is "correct" is not acceptable.

Thanks to you and Jan Kara, I realized it's not a real dependency in the
consumer and producer scenario but again *ONLY IF* there is a rescue
wakeup source. Dept should track the rescue wakeup source instead in the
case.

I won't ask you to rearchitect the working code. The code looks sane.

Thanks a lot.

Thanks,
Byungchul

> > We have a queue of work to do Q protected by lock L. Consumer process has
> > code like:
> > 
> > while (1) {
> > 	lock L
> > 	prepare_to_wait(work_queued);
> > 	if (no work) {
> > 		unlock L
> > 		sleep
> > 	} else {
> > 		unlock L
> > 		do work
> > 		wake_up(work_done)
> > 	}
> > }
> > 
> > AFAIU Dept will create dependency here that 'wakeup work_done' is after
> > 'wait for work_queued'. Producer has code like:
> > 
> > while (1) {
> > 	lock L
> > 	prepare_to_wait(work_done)
> > 	if (too much work queued) {
> > 		unlock L
> > 		sleep
> > 	} else {
> > 		queue work
> > 		unlock L
> > 		wake_up(work_queued)
> > 	}
> > }
> > 
> > And Dept will create dependency here that 'wakeup work_queued' is after
> > 'wait for work_done'. And thus we have a trivial cycle in the dependencies
> > despite the code being perfectly valid and safe.
> 
> Cheers,
> 
> 							- Ted
