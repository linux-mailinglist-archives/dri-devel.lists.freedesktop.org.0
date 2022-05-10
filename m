Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C4520A3B
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 02:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAEA10F2AC;
	Tue, 10 May 2022 00:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE82E88BE3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 00:33:51 +0000 (UTC)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
 by 156.147.23.51 with ESMTP; 10 May 2022 09:33:49 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.121 with ESMTP; 10 May 2022 09:33:49 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Tue, 10 May 2022 09:32:13 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH RFC v6 00/21] DEPT(Dependency Tracker)
Message-ID: <20220510003213.GD6047@X58A-UD3R>
References: <1651652269-15342-1-git-send-email-byungchul.park@lge.com>
 <YnmCE2iwa0MSqocr@mit.edu> <YnmVgVQ7usoXnJ1N@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnmVgVQ7usoXnJ1N@mit.edu>
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
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 airlied@linux.ie, mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 linux-mm@kvack.org, ngupta@vflare.org, johannes.berg@intel.com, jack@suse.com,
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

On Mon, May 09, 2022 at 06:28:17PM -0400, Theodore Ts'o wrote:
> Oh, one other problem with DEPT --- it's SLOW --- the overhead is
> enormous.  Using kvm-xfstests[1] running "kvm-xfstests smoke", here
> are some sample times:

Yes, right. DEPT has never been optimized. It rather turns on
CONFIG_LOCKDEP and even CONFIG_PROVE_LOCKING when CONFIG_DEPT gets on
because of porting issue. I have no choice but to rely on those to
develop DEPT out of tree. Of course, that's what I don't like.

Plus, for now, I'm focusing on removing false positives. Once it's
considered settled down, I will work on performance optimizaition. But
it should still keep relying on Lockdep CONFIGs and adding additional
overhead on it until DEPT can be developed in the tree.

> 			LOCKDEP		DEPT
> Time to first test	49 seconds	602 seconds
> ext4/001      		2 s		22 s
> ext4/003		2 s		8 s
> ext4/005		0 s		7 s
> ext4/020		1 s		8 s
> ext4/021		11 s		17 s
> ext4/023		0 s		83 s
> generic/001		4 s		76 s
> generic/002		0 s		11 s
> generic/003		10 s		19 s
> 
> There are some large variations; in some cases, some xfstests take 10x
> as much time or more to run.  In fact, when I first started the
> kvm-xfstests run with DEPT, I thought something had hung and that
> tests would never start.  (In fact, with gce-xfstests the default
> watchdog "something has gone terribly wrong with the kexec" had fired,
> and I didn't get any test results using gce-xfstests at all.  If DEPT
> goes in without any optimizations, I'm going to have to adjust the
> watchdogs timers for gce-xfstests.)

Thank you for informing it. I will go for the optimization as well.

> The bottom line is that at the moment, between the false positives,
> and the significant overhead imposed by DEPT, I would suggest that if
> DEPT ever does go in, that it should be possible to disable DEPT and
> only use the existing CONFIG_PROVE_LOCKING version of LOCKDEP, just
> because DEPT is S - L - O - W.
> 
> [1] https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
> 
> 						- Ted
> 
> P.S.  Darrick and I both have disabled using LOCKDEP by default
> because it slows down ext4 -g auto testing by a factor 2, and xfs -g
> auto testing by a factor of 3.  So the fact that DEPT is a factor of
> 2x to 10x or more slower than LOCKDEP when running various xfstests
> tests should be a real concern.

DEPT is tracking way more objects than Lockdep so it's inevitable to be
slower, but let me try to make it have the similar performance to
Lockdep.

	Byungchul
