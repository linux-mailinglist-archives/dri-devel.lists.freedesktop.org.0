Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3D4BB0A0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 05:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B31510E1A6;
	Fri, 18 Feb 2022 04:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AD910E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 04:20:17 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21I4JFkK022028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 23:19:16 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id CB37615C34C8; Thu, 17 Feb 2022 23:19:15 -0500 (EST)
Date: Thu, 17 Feb 2022 23:19:15 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 00/16] DEPT(Dependency Tracker)
Message-ID: <Yg8eQ/iR5H/AHZIg@mit.edu>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <Yg5u7dzUxL3Vkncg@mit.edu>
 <20220217120005.67f5ddf4@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217120005.67f5ddf4@gandalf.local.home>
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

On Thu, Feb 17, 2022 at 12:00:05PM -0500, Steven Rostedt wrote:
> 
> I personally believe that there's potential that this can be helpful and we
> will want to merge it.
> 
> But, what I believe Ted is trying to say is, if you do not know if the
> report is a bug or not, please do not ask the maintainers to determine it
> for you. This is a good opportunity for you to look to see why your tool
> reported an issue, and learn that subsystem. Look at if this is really a
> bug or not, and investigate why.

I agree there's potential here, or I would have ignored the ext4 "bug
report".

When we can get rid of the false positives, I think it should be
merged; I'd just rather it not be merged until after the false
positives are fixed, since otherwise, someone well-meaning will start
using it with Syzkaller, and noise that maintainers need to deal with
(with people requesting reverts of two year old commits, etc) will
increase by a factor of ten or more.  (With Syzbot reproducers that
set up random cgroups, IP tunnels with wiregaurd enabled, FUSE stress
testers, etc., that file system maintainers will be asked to try to
disentangle.)

So from a maintainer's perspective, false positives are highly
negative.  It may be that from some people's POV, one bug found and 20
false positive might still be "useful".  But if your tool gains a
reputation of not valuing maintainers' time, it's just going to make
us (or at least me :-) cranky, and it's going to be very hard to
recover from perception.  So it's probably better to be very
conservative and careful in polishing it before asking for it to be
merged.

Cheers,

						- Ted

