Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91055228D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 03:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F2310E523;
	Wed, 11 May 2022 01:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC60E10E4D7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 01:18:16 +0000 (UTC)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
 by 156.147.23.52 with ESMTP; 11 May 2022 10:18:15 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.125 with ESMTP; 11 May 2022 10:18:14 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Wed, 11 May 2022 10:16:37 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: tytso@mit.edu
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220511011637.GC18445@X58A-UD3R>
References: <YnnAnzPFZZte/UR8@mit.edu>
 <1652161060-26531-1-git-send-email-byungchul.park@lge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652161060-26531-1-git-send-email-byungchul.park@lge.com>
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
 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org, duyuyang@gmail.com,
 sashal@kernel.org, paolo.valente@linaro.org, damien.lemoal@opensource.wdc.com,
 willy@infradead.org, hch@infradead.org, mingo@redhat.com, djwong@kernel.org,
 vdavydov.dev@gmail.com, rientjes@google.com, dennis@kernel.org,
 linux-ext4@vger.kernel.org, ngupta@vflare.org, johannes.berg@intel.com,
 jack@suse.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, melissa.srw@gmail.com,
 sj@kernel.org, rodrigosiqueiramelo@gmail.com, kernel-team@lge.com,
 gregkh@linuxfoundation.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 02:37:40PM +0900, Byungchul Park wrote:
> Ted wrote:
> > On Tue, May 10, 2022 at 09:32:13AM +0900, Byungchul Park wrote:
> > > DEPT is tracking way more objects than Lockdep so it's inevitable to be
> > > slower, but let me try to make it have the similar performance to
> > > Lockdep.
> > 
> > In order to eliminate some of these false positives, I suspect it's
> > going to increase the number of object classes that DEPT will need to
> > track even *more*.  At which point, the cost/benefit of DEPT may get
> > called into question, especially if all of the false positives can't
> > be suppressed.
> 
> Look. Let's talk in general terms. There's no way to get rid of the
> false positives all the way. It's a decision issue for *balancing*
> between considering potential cases and only real ones. Definitely,
> potential is not real. The more potential things we consider, the higher
> the chances are, that false positives appear.
> 
> But yes. The advantage we'd take by detecting potential ones should be
> higher than the risk of being bothered by false ones. Do you think a
> tool is useless if it produces a few false positives? Of course, it'd
> be a problem if it's too many, but otherwise, I think it'd be a great
> tool if the advantage > the risk.
> 
> Don't get me wrong here. It doesn't mean DEPT is perfect for now. The
> performance should be improved and false alarms that appear should be
> removed, of course. I'm talking about the direction.
> 
> For now, there's no tool to track wait/event itself in Linux kernel -
> a subset of the functionality exists tho. DEPT is the 1st try for that
> purpose and can be a useful tool by the right direction.
> 
> I know what you are concerning about. I bet it's false positives that
> are going to bother you once merged. I'll insist that DEPT shouldn't be
> used as a mandatory testing tool until considered stable enough. But
> what about ones who would take the advantage use DEPT. Why don't you
> think of folks who will take the advantage from the hints about
> dependency of synchronization esp. when their subsystem requires very
> complicated synchronization? Should a tool be useful only in a final
> testing stage? What about the usefulness during development stage?
> 
> It's worth noting DEPT works with any wait/event so any lockups e.g.
> even by HW-SW interface, retry logic or the like can be detected by DEPT
> once all waits and events are tagged properly. I believe the advantage
> by that is much higher than the bad side facing false alarms. It's just
> my opinion. I'm goning to respect the majority opinion.

s/take advantage/have the benefit/g

	Byungchul
