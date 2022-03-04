Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BE4CCB71
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 02:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBAD10E409;
	Fri,  4 Mar 2022 01:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1505B10E254
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 01:57:14 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.51 with ESMTP; 4 Mar 2022 10:57:13 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 4 Mar 2022 10:57:13 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Fri, 4 Mar 2022 10:56:51 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Jan Kara <jack@suse.cz>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <20220304015650.GC6112@X58A-UD3R>
References: <1645096204-31670-2-git-send-email-byungchul.park@lge.com>
 <20220221190204.q675gtsb6qhylywa@quack3.lan>
 <20220223003534.GA26277@X58A-UD3R>
 <20220223144859.na2gjgl5efgw5zhn@quack3.lan>
 <20220224011102.GA29726@X58A-UD3R>
 <20220224102239.n7nzyyekuacgpnzg@quack3.lan>
 <20220228092826.GA5201@X58A-UD3R>
 <20220228101444.6frl63dn5vmgycbp@quack3.lan>
 <20220303010033.GB20752@X58A-UD3R>
 <20220303095456.kym32pxshwryescx@quack3.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303095456.kym32pxshwryescx@quack3.lan>
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
Cc: hamohammed.sa@gmail.com, peterz@infradead.org, daniel.vetter@ffwll.ch,
 amir73il@gmail.com, david@fromorbit.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, bfields@fieldses.org, linux-ide@vger.kernel.org,
 adilger.kernel@dilger.ca, joel@joelfernandes.org, cl@linux.com,
 will@kernel.org, duyuyang@gmail.com, sashal@kernel.org,
 paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, airlied@linux.ie, mingo@redhat.com,
 djwong@kernel.org, vdavydov.dev@gmail.com, rientjes@google.com,
 dennis@kernel.org, linux-ext4@vger.kernel.org, linux-mm@kvack.org,
 ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
 dan.j.williams@intel.com, josef@toxicpanda.com, rostedt@goodmis.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz,
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 03, 2022 at 10:54:56AM +0100, Jan Kara wrote:
> On Thu 03-03-22 10:00:33, Byungchul Park wrote:
> > Unfortunately, it's neither perfect nor safe without another wakeup
> > source - rescue wakeup source.
> > 
> >    consumer			producer
> > 
> > 				lock L
> > 				(too much work queued == true)
> > 				unlock L
> > 				--- preempted
> >    lock L
> >    unlock L
> >    do work
> >    lock L
> >    unlock L
> >    do work
> >    ...
> >    (no work == true)
> >    sleep
> > 				--- scheduled in
> > 				sleep
> > 
> > This code leads a deadlock without another wakeup source, say, not safe.
> 
> So the scenario you describe above is indeed possible. But the trick is
> that the wakeup from 'consumer' as is doing work will remove 'producer'
> from the wait queue and change the 'producer' process state to
> 'TASK_RUNNING'. So when 'producer' calls sleep (in fact schedule()), the
> scheduler will just treat this as another preemption point and the
> 'producer' will immediately or soon continue to run. So indeed we can think
> of this as "another wakeup source" but the source is in the CPU scheduler
> itself. This is the standard way how waitqueues are used in the kernel...

Nice! Thanks for the explanation. I will take it into account if needed.

> > Lastly, just for your information, I need to explain how Dept works a
> > little more for you not to misunderstand Dept.
> > 
> > Assuming the consumer and producer guarantee not to lead a deadlock like
> > the following, Dept won't report it a problem:
> > 
> >    consumer			producer
> > 
> > 				sleep
> >    wakeup work_done
> > 				queue work
> >    sleep
> > 				wakeup work_queued
> >    do work
> > 				sleep
> >    wakeup work_done
> > 				queue work
> >    sleep
> > 				wakeup work_queued
> >    do work
> > 				sleep
> >    ...				...
> > 
> > Dept does not consider all waits preceeding an event but only waits that
> > might lead a deadlock. In this case, Dept works with each region
> > independently.
> > 
> >    consumer			producer
> > 
> > 				sleep <- initiates region 1
> >    --- region 1 starts
> >    ...				...
> >    --- region 1 ends
> >    wakeup work_done
> >    ...				...
> > 				queue work
> >    ...				...
> >    sleep <- initiates region 2
> > 				--- region 2 starts
> >    ...				...
> > 				--- region 2 ends
> > 				wakeup work_queued
> >    ...				...
> >    do work
> >    ...				...
> > 				sleep <- initiates region 3
> >    --- region 3 starts
> >    ...				...
> >    --- region 3 ends
> >    wakeup work_done
> >    ...				...
> > 				queue work
> >    ...				...
> >    sleep <- initiates region 4
> > 				--- region 4 starts
> >    ...				...
> > 				--- region 4 ends
> > 				wakeup work_queued
> >    ...				...
> >    do work
> >    ...				...
> > 
> > That is, Dept does not build dependencies across different regions. So
> > you don't have to worry about unreasonable false positives that much.
> > 
> > Thoughts?
> 
> Thanks for explanation! And what exactly defines the 'regions'? When some
> process goes to sleep on some waitqueue, this defines a start of a region
> at the place where all the other processes are at that moment and wakeup of
> the waitqueue is an end of the region?

Yes. Let me explain it more for better understanding.
(I copied it from the talk I did with Matthew..)


   ideal view
   -----------
   context X			context Y

   request event E		...
      write REQUESTEVENT	when (notice REQUESTEVENT written)
   ...				   notice the request from X [S]

				--- ideally region 1 starts here
   wait for the event		...
      sleep			if (can see REQUESTEVENT written)
   				   it's on the way to the event
   ...				
   				...
				--- ideally region 1 ends here

				finally the event [E]

Dept basically works with the above view with regard to wait and event.
But it's very hard to identify the ideal [S] point in practice. So Dept
instead identifies [S] point by checking WAITSTART with memory barriers
like the following, which would make Dept work conservatively.


   Dept's view
   ------------
   context X			context Y

   request event E		...
      write REQUESTEVENT	when (notice REQUESTEVENT written)
   ...				   notice the request from X

				--- region 2 Dept gives up starts
   wait for the event		...
      write barrier
      write WAITSTART		read barrier
      sleep			when (notice WAITSTART written)
				   ensure the request has come [S]

				--- region 2 Dept gives up ends
				--- region 3 starts here
				...
				if (can see WAITSTART written)
				   it's on the way to the event
   ...				
   				...
				--- region 3 ends here

   				finally the event [E]

In short, Dept works with region 3.

Thanks,
Byungchul
