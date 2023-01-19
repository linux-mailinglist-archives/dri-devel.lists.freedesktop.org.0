Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58944672DC3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 01:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DE810E041;
	Thu, 19 Jan 2023 00:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBD1210E041
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 00:58:41 +0000 (UTC)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
 by 156.147.23.53 with ESMTP; 19 Jan 2023 09:58:39 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO localhost.localdomain) (10.177.244.38)
 by 156.147.1.151 with ESMTP; 19 Jan 2023 09:58:39 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
From: Byungchul Park <byungchul.park@lge.com>
To: torvalds@linux-foundation.org
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
Date: Thu, 19 Jan 2023 09:58:27 +0900
Message-Id: <1674089907-31690-1-git-send-email-byungchul.park@lge.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
References: <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, mhocko@kernel.org, linux-mm@kvack.org,
 kernel-team@lge.com, adilger.kernel@dilger.ca, chris.p.wilson@intel.com,
 joel@joelfernandes.org, 42.hyeyoo@gmail.com, cl@linux.com, will@kernel.org,
 duyuyang@gmail.com, sashal@kernel.org, paolo.valente@linaro.org,
 damien.lemoal@opensource.wdc.com, willy@infradead.org, hch@infradead.org,
 mingo@redhat.com, djwong@kernel.org, vdavydov.dev@gmail.com,
 rientjes@google.com, dennis@kernel.org, linux-ext4@vger.kernel.org,
 ngupta@vflare.org, johannes.berg@intel.com, dan.j.williams@intel.com,
 josef@toxicpanda.com, rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, jglisse@redhat.com,
 viro@zeniv.linux.org.uk, tglx@linutronix.de, vbabka@suse.cz,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, linux-ide@vger.kernel.org,
 gregkh@linuxfoundation.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 penberg@kernel.org, minchan@kernel.org, max.byungchul.park@gmail.com,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Torvalds wrote:
> On Sun, Jan 8, 2023 at 7:33 PM Byungchul Park <byungchul.park@lge.com> wrote:
>>
>> I've been developing a tool for detecting deadlock possibilities by
>> tracking wait/event rather than lock(?) acquisition order to try to
>> cover all synchonization machanisms. It's done on v6.2-rc2.
> 
> Ugh. I hate how this adds random patterns like

I undertand what you mean.. But all the synchronization primitives
should let DEPT know the beginning and the end of each. However, I will
remove the 'if' statement that looks ugly from the next spin, and place
the pattern to a better place if possible.

> 	if (timeout == MAX_SCHEDULE_TIMEOUT)
> 		sdt_might_sleep_strong(NULL);
> 	else
> 		sdt_might_sleep_strong_timeout(NULL);
> 	...
> 	sdt_might_sleep_finish();
> 
> to various places, it seems so very odd and unmaintainable.
> 
> I also recall this giving a fair amount of false positives, are they all fixed?

Yes. Of course I removed all the false positives we found.

> Anyway, I'd really like the lockdep people to comment and be involved.
> We did have a fairly recent case of "lockdep doesn't track page lock
> dependencies because it fundamentally cannot" issue, so DEPT might fix
> those kinds of missing dependency analysis. See

Sure. That's exactly what DEPT works for e.g. PG_locked.

> 	https://lore.kernel.org/lkml/00000000000060d41f05f139aa44@google.com/

I will reproduce it and share the result.

> for some context to that one, but at teh same time I would *really*
> want the lockdep people more involved and acking this work.
> 
> Maybe I missed the email where you reported on things DEPT has found
> (and on the lack of false positives)?

Maybe you didn't miss. It's still too hard to make a decision between:

	Aggressive detection with false alarms that need to be fixed by
	manual classification as Lockdep did, focusing on potential
	possibility more.

	versus

	Conservative detection with few false alarms, which requires us
	to test much longer to get result we expect, focusing on actual
	happening.

> 
> 	Linus

	Byungchul
