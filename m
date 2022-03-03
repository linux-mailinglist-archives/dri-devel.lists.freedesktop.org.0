Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538774CB4F7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 03:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E0E10E9B6;
	Thu,  3 Mar 2022 02:34:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF6810E9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 02:34:00 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2232WZtW020610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Mar 2022 21:32:36 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 7634315C0038; Wed,  2 Mar 2022 21:32:35 -0500 (EST)
Date: Wed, 2 Mar 2022 21:32:35 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <YiAow5gi21zwUT54@mit.edu>
References: <1645096204-31670-1-git-send-email-byungchul.park@lge.com>
 <1645096204-31670-2-git-send-email-byungchul.park@lge.com>
 <20220221190204.q675gtsb6qhylywa@quack3.lan>
 <20220223003534.GA26277@X58A-UD3R>
 <20220223144859.na2gjgl5efgw5zhn@quack3.lan>
 <20220224011102.GA29726@X58A-UD3R>
 <20220224102239.n7nzyyekuacgpnzg@quack3.lan>
 <20220228092826.GA5201@X58A-UD3R>
 <20220228101444.6frl63dn5vmgycbp@quack3.lan>
 <20220303010033.GB20752@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220303010033.GB20752@X58A-UD3R>
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

On Thu, Mar 03, 2022 at 10:00:33AM +0900, Byungchul Park wrote:
> 
> Unfortunately, it's neither perfect nor safe without another wakeup
> source - rescue wakeup source.
> 
>    consumer			producer
> 
> 				lock L
> 				(too much work queued == true)
> 				unlock L
> 				--- preempted
>    lock L
>    unlock L
>    do work
>    lock L
>    unlock L
>    do work
>    ...
>    (no work == true)
>    sleep
> 				--- scheduled in
> 				sleep

That's not how things work in ext4.  It's **way** more complicated
than that.  We have multiple wait channels, one wake up the consumer
(read: the commit thread), and one which wakes up any processes
waiting for commit thread to have made forward progress.  We also have
two spin-lock protected sequence number, one which indicates the
current commited transaction #, and one indicating the transaction #
that needs to be committed.

On the commit thread, it will sleep on j_wait_commit, and when it is
woken up, it will check to see if there is work to be done
(j_commit_sequence != j_commit_request), and if so, do the work, and
then wake up processes waiting on the wait_queue j_wait_done_commit.
(Again, all of this uses the pattern, "prepare to wait", then check to
see if we should sleep, if we do need to sleep, unlock j_state_lock,
then sleep.   So this prevents any races leading to lost wakeups.

On the start_this_handle() thread, if we current transaction is too
full, we set j_commit_request to its transaction id to indicate that
we want the current transaction to be committed, and then we wake up
the j_wait_commit wait queue and then we enter a loop where do a
prepare_to_wait in j_wait_done_commit, check to see if
j_commit_sequence == the transaction id that we want to be completed,
and if it's not done yet, we unlock the j_state_lock spinlock, and go
to sleep.  Again, because of the prepare_to_wait, there is no chance
of a lost wakeup.

So there really is no "consumer" and "producer" here.  If you really
insist on using this model, which really doesn't apply, for one
thread, it's the consumer with respect to one wait queue, and the
producer with respect to the *other* wait queue.  For the other
thread, the consumer and producer roles are reversed.

And of course, this is a highly simplified model, since we also have a
wait queue used by the commit thread to wait for the number of active
handles on a particular transaction to go to zero, and
stop_this_handle() will wake up commit thread via this wait queue when
the last active handle on a particular transaction is retired.  (And
yes, that parameter is also protected by a different spin lock which
is per-transaction).

So it seems to me that a fundamental flaw in DEPT's model is assuming
that the only waiting paradigm that can be used is consumer/producer,
and that's simply not true.  The fact that you use the term "lock" is
also going to lead a misleading line of reasoning, because properly
speaking, they aren't really locks.  We are simply using wait channels
to wake up processes as necessary, and then they will check other
variables to decide whether or not they need to sleep or not, and we
have an invariant that when these variables change indicating forward
progress, the associated wait channel will be woken up.

Cheers,

						- Ted


P.S.  This model is also highly simplified since there are other
reasons why the commit thread can be woken up, some which might be via
a timeout, and some which is via the j_wait_commit wait channel but
not because j_commit_request has been changed, but because file system
is being unmounted, or the file system is being frozen in preparation
of a snapshot, etc.  These are *not* necessary to prevent a deadlock,
because under normal circumstances the two wake channels are
sufficient of themselves.  So please don't think of them as "rescue
wakeup sources"; again, that's highly misleading and the wrong way to
think of them.

And to make things even more complicated, we have more than 2 wait
channel --- we have *five*:

	/**
	 * @j_wait_transaction_locked:
	 *
	 * Wait queue for waiting for a locked transaction to start committing,
	 * or for a barrier lock to be released.
	 */
	wait_queue_head_t	j_wait_transaction_locked;

	/**
	 * @j_wait_done_commit: Wait queue for waiting for commit to complete.
	 */
	wait_queue_head_t	j_wait_done_commit;

	/**
	 * @j_wait_commit: Wait queue to trigger commit.
	 */
	wait_queue_head_t	j_wait_commit;

	/**
	 * @j_wait_updates: Wait queue to wait for updates to complete.
	 */
	wait_queue_head_t	j_wait_updates;

	/**
	 * @j_wait_reserved:
	 *
	 * Wait queue to wait for reserved buffer credits to drop.
	 */
	wait_queue_head_t	j_wait_reserved;

	/**
	 * @j_fc_wait:
	 *
	 * Wait queue to wait for completion of async fast commits.
	 */
	wait_queue_head_t	j_fc_wait;


"There are more things in heaven and Earth, Horatio,
 Than are dreamt of in your philosophy."
      	  	    - William Shakespeare, Hamlet
