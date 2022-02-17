Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33494BA692
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 18:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AE010E127;
	Thu, 17 Feb 2022 17:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C976E10E127
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 17:00:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F762615F2;
 Thu, 17 Feb 2022 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA09C340E8;
 Thu, 17 Feb 2022 17:00:06 +0000 (UTC)
Date: Thu, 17 Feb 2022 12:00:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <20220217120005.67f5ddf4@gandalf.local.home>
In-Reply-To: <Yg5u7dzUxL3Vkncg@mit.edu>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
 ngupta@vflare.org, melissa.srw@gmail.com, johannes.berg@intel.com,
 jack@suse.com, dan.j.williams@intel.com, josef@toxicpanda.com,
 Byungchul Park <byungchul.park@lge.com>, linux-fsdevel@vger.kernel.org,
 jglisse@redhat.com, viro@zeniv.linux.org.uk, tglx@linutronix.de,
 mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, rodrigosiqueiramelo@gmail.com,
 kernel-team@lge.com, gregkh@linuxfoundation.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, penberg@kernel.org, minchan@kernel.org,
 hannes@cmpxchg.org, tj@kernel.org, akpm@linux-foundation.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Feb 2022 10:51:09 -0500
"Theodore Ts'o" <tytso@mit.edu> wrote:

> I know that you're trying to help us, but this tool needs to be far
> better than Lockdep before we should think about merging it.  Even if
> it finds 5% more potential deadlocks, if it creates 95% more false
> positive reports --- and the ones it finds are crazy things that
> rarely actually happen in practice, are the costs worth the benefits?
> And who is bearing the costs, and who is receiving the benefits?

I personally believe that there's potential that this can be helpful and we
will want to merge it.

But, what I believe Ted is trying to say is, if you do not know if the
report is a bug or not, please do not ask the maintainers to determine it
for you. This is a good opportunity for you to look to see why your tool
reported an issue, and learn that subsystem. Look at if this is really a
bug or not, and investigate why.

The likely/unlikely tracing I do finds issues all over the kernel. But
before I report anything, I look at the subsystem and determine *why* it's
reporting what it does. In some cases, it's just a config issue. Where, I
may submit a patch saying "this is 100% wrong in X config, and we should
just remove the "unlikely". But I did the due diligence to find out exactly
what the issue is, and why the tooling reported what it reported.

I want to stress that your Dept tooling looks to have the potential of
being something that will be worth while including. But the false positives
needs to be down to the rate of lockdep false positives. As Ted said, if
it's reporting 95% false positives, nobody is going to look at the 5% of
real bugs that it finds.

-- Steve
