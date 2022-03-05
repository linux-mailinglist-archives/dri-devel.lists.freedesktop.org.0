Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACADF4CE26F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 04:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C9010E1F2;
	Sat,  5 Mar 2022 03:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7902710E596
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 03:27:50 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2253QNNF013482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Mar 2022 22:26:24 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 7552F15C0038; Fri,  4 Mar 2022 22:26:23 -0500 (EST)
Date: Fri, 4 Mar 2022 22:26:23 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <YiLYX0sqmtkTEM5U@mit.edu>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304004237.GB6112@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304004237.GB6112@X58A-UD3R>
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

On Fri, Mar 04, 2022 at 09:42:37AM +0900, Byungchul Park wrote:
> 
> All contexts waiting for any of the events in the circular dependency
> chain will be definitely stuck if there is a circular dependency as I
> explained. So we need another wakeup source to break the circle. In
> ext4 code, you might have the wakeup source for breaking the circle.
> 
> What I agreed with is:
> 
>    The case that 1) the circular dependency is unevitable 2) there are
>    another wakeup source for breadking the circle and 3) the duration
>    in sleep is short enough, should be acceptable.
> 
> Sounds good?

These dependencies are part of every single ext4 metadata update,
and if there were any unnecessary sleeps, this would be a major
performance gap, and this is a very well studied part of ext4.

There are some places where we sleep, sure.  In some case
start_this_handle() needs to wait for a commit to complete, and the
commit thread might need to sleep for I/O to complete.  But the moment
the thing that we're waiting for is complete, we wake up all of the
processes on the wait queue.  But in the case where we wait for I/O
complete, that wakeupis coming from the device driver, when it
receives the the I/O completion interrupt from the hard drive.  Is
that considered an "external source"?  Maybe DEPT doesn't recognize
that this is certain to happen just as day follows the night?  (Well,
maybe the I/O completion interrupt might not happen if the disk drive
bursts into flames --- but then, you've got bigger problems. :-)

In any case, if DEPT is going to report these "circular dependencies
as bugs that MUST be fixed", it's going to be pure noise and I will
ignore all DEPT reports, and will push back on having Lockdep replaced
by DEPT --- because Lockdep give us actionable reports, and if DEPT
can't tell the difference between a valid programming pattern and a
bug, then it's worse than useless.

Sounds good?

							- Ted
