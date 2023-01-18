Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9528671CDF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 14:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7C410E740;
	Wed, 18 Jan 2023 13:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 490 seconds by postgrey-1.36 at gabe;
 Wed, 18 Jan 2023 13:03:48 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE5410E740
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 13:03:48 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1674046535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AB+InJFKr3A1hH76vbzTChAWIkJom+fRvriRNNNTKpo=;
 b=ageL71ICTbkCOZ+nxBWyWkzol2RTpEDfAtuxHDdk+oA0FdqjcjKXSUkF9inonv4ABtk15r
 oK8DBFK58aaT5/QzdDugGKSJzh81kHFqnR2EfMHG5j0+tsDI7mxPeOje1FLE88KjgMHuxW
 p9VC5bB01OSk0VGh3OhxAGVEG4W5Emfq3pbOOqRqbbGx+opCyRLc30Uq39GtLuYv7BGepM
 Nu0iSXPbwX5LudmSv5tlt1RWjOHLvM7m1i4n2NfF0/ovbFR/RpcvK1VAoEYKFcBkrzNrLa
 kxIN7zJOzgQryGkh9TI0SeFPbreQcetsJBkf8nWsJ6ViHrKp5s0Fb4IHVx8jGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1674046535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AB+InJFKr3A1hH76vbzTChAWIkJom+fRvriRNNNTKpo=;
 b=BRCPqEs33kUEXskwliUVCvnmh8wCJdDfDjrmbTNuzayEWcjpccjqIWU1fLzS/xuCffBT88
 uSrX6hUeLwzgQ6Dg==
To: Boqun Feng <boqun.feng@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC v7 00/23] DEPT(Dependency Tracker)
In-Reply-To: <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
References: <1673235231-30302-1-git-send-email-byungchul.park@lge.com>
 <CAHk-=whpkWbdeZE1zask8YPzVYevJU2xOXqOposBujxZsa2-tQ@mail.gmail.com>
 <Y8bmeffIQ3iXU3Ux@boqun-archlinux>
Date: Wed, 18 Jan 2023 13:55:34 +0100
Message-ID: <873588j92x.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
 ngupta@vflare.org, johannes.berg@intel.com, josef@toxicpanda.com,
 rostedt@goodmis.org, gwan-gyeong.mun@intel.com,
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, Waiman Long <longman@redhat.com>,
 dan.j.williams@intel.com, vbabka@suse.cz, melissa.srw@gmail.com,
 linux-block@vger.kernel.org, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, linux-ide@vger.kernel.org,
 gregkh@linuxfoundation.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 penberg@kernel.org, minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 17 2023 at 10:18, Boqun Feng wrote:
> On Mon, Jan 16, 2023 at 10:00:52AM -0800, Linus Torvalds wrote:
>> I also recall this giving a fair amount of false positives, are they all fixed?
>
> From the following part in the cover letter, I guess the answer is no?
> 	...
>         6. Multiple reports are allowed.
>         7. Deduplication control on multiple reports.
>         8. Withstand false positives thanks to 6.
> 	...
>
> seems to me that the logic is since DEPT allows multiple reports so that
> false positives are fitlerable by users?

I really do not know what's so valuable about multiple reports. They
produce a flood of information which needs to be filtered, while a
single report ensures that the first detected issue is dumped, which
increases the probability that it can be recorded and acted upon.

Filtering out false positives is just the wrong approach. Decoding
dependency issues from any tracker is complex enough given the nature of
the problem, so adding the burden of filtering out issues from a stream
of dumps is not helpful at all. It's just a marketing gag.

> *	Instead of introducing a brand new detector/dependency tracker,
> 	could we first improve the lockdep's dependency tracker? I think
> 	Byungchul also agrees that DEPT and lockdep should share the
> 	same dependency tracker and the benefit of improving the
> 	existing one is that we can always use the self test to catch
> 	any regression. Thoughts?

Ack. If the internal implementation of lockdep has shortcomings, then we
can expand and/or replace it instead of having yet another
infrastructure which is not even remotely as mature.

Thanks,

        tglx
