Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42CC4BA503
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9815810E532;
	Thu, 17 Feb 2022 15:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E22F10ED92
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:52:32 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21HFp9Kg004053
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 10:51:11 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 4815815C34C8; Thu, 17 Feb 2022 10:51:09 -0500 (EST)
Date: Thu, 17 Feb 2022 10:51:09 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <Yg5u7dzUxL3Vkncg@mit.edu>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
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
 axboe@kernel.dk, melissa.srw@gmail.com, sj@kernel.org,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 07:57:36PM +0900, Byungchul Park wrote:
> 
> I've got several reports from the tool. Some of them look like false
> alarms and some others look like real deadlock possibility. Because of
> my unfamiliarity of the domain, it's hard to confirm if it's a real one.
> Let me add the reports on this email thread.

The problem is we have so many potentially invalid, or
so-rare-as-to-be-not-worth-the-time-to-investigate-in-the-
grand-scheme-of-all-of-the-fires-burning-on-maintainers laps that it's
really not reasonable to ask maintainers to determine whether
something is a false alarm or not.  If I want more of these unreliable
potential bug reports to investigate, there is a huge backlog in
Syzkaller.  :-)

Looking at the second ext4 report, it doesn't make any sense.  Context
A is the kjournald thread.  We don't do a commit until (a) the timeout
expires, or (b) someone explicitly requests that a commit happen
waking up j_wait_commit.  I'm guessing that complaint here is that
DEPT thinks nothing is explicitly requesting a wake up.  But note that
after 5 seconds (or whatever journal->j_commit_interval) is configured
to be we *will* always start a commit.  So ergo, there can't be a deadlock.

At a higher level of discussion, it's an unfair tax on maintainer's
times to ask maintainers to help you debug DEPT for you.  Tools like
Syzkaller and DEPT are useful insofar as they save us time in making
our subsystems better.  But until you can prove that it's not going to
be a massive denial of service attack on maintainer's time, at the
*very* least keep an RFC on the patch, or add massive warnings that
more often than not DEPT is going to be sending maintainers on a wild
goose chase.

If you know there there "appear to be false positives", you need to
make sure you've tracked them all down before trying to ask that this
be merged.

You may also want to add some documentation about why we should trust
this; in particular for wait channels, when a process calls schedule()
there may be multiple reasons why the thread will wake up --- in the
worst case, such as in the select(2) or epoll(2) system call, there
may be literally thousands of reasons (one for every file desriptor
the select is waiting on) --- why the process will wake up and thus
resolve the potential "deadlock" that DEPT is worrying about.  How is
DEPT going to handle those cases?  If the answer is that things need
to be tagged, then at least disclose potential reasons why DEPT might
be untrustworthy to save your reviewers time.

I know that you're trying to help us, but this tool needs to be far
better than Lockdep before we should think about merging it.  Even if
it finds 5% more potential deadlocks, if it creates 95% more false
positive reports --- and the ones it finds are crazy things that
rarely actually happen in practice, are the costs worth the benefits?
And who is bearing the costs, and who is receiving the benefits?

Regards,

					- Ted
