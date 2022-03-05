Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F014CE27F
	for <lists+dri-devel@lfdr.de>; Sat,  5 Mar 2022 04:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D664710E9B5;
	Sat,  5 Mar 2022 03:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06BB10E9B5
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Mar 2022 03:41:27 +0000 (UTC)
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
 [108.7.220.252]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 2253eZvh017067
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 4 Mar 2022 22:40:36 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id B8EDD15C0038; Fri,  4 Mar 2022 22:40:35 -0500 (EST)
Date: Fri, 4 Mar 2022 22:40:35 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Byungchul Park <byungchul.park@lge.com>
Subject: Re: Report 2 in ext4 and journal based on v5.17-rc1
Message-ID: <YiLbs9rszWXpHm/P@mit.edu>
References: <YiAow5gi21zwUT54@mit.edu>
 <1646285013-3934-1-git-send-email-byungchul.park@lge.com>
 <YiDSabde88HJ/aTt@mit.edu> <20220304032002.GD6112@X58A-UD3R>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304032002.GD6112@X58A-UD3R>
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

On Fri, Mar 04, 2022 at 12:20:02PM +0900, Byungchul Park wrote:
> 
> I found a point that the two wait channels don't lead a deadlock in
> some cases thanks to Jan Kara. I will fix it so that Dept won't
> complain it.

I sent my last (admittedly cranky) message before you sent this.  I'm
glad you finally understood Jan's explanation.  I was trying to tell
you the same thing, but apparently I failed to communicate in a
sufficiently clear manner.  In any case, what Jan described is a
fundamental part of how wait queues work, and I'm kind of amazed that
you were able to implement DEPT without understanding it.  (But maybe
that is why some of the DEPT reports were completely incomprehensible
to me; I couldn't interpret why in the world DEPT was saying there was
a problem.)

In any case, the thing I would ask is a little humility.  We regularly
use lockdep, and we run a huge number of stress tests, throughout each
development cycle.

So if DEPT is issuing lots of reports about apparently circular
dependencies, please try to be open to the thought that the fault is
in DEPT, and don't try to argue with maintainers that their code MUST
be buggy --- but since you don't understand our code, and DEPT must be
theoretically perfect, that it is up to the Maintainers to prove to
you that their code is correct.

I am going to gently suggest that it is at least as likely, if not
more likely, that the failure is in DEPT or your understanding of what
how kernel wait channels and locking works.  After all, why would it
be that we haven't found these problems via our other QA practices?

Cheers,

						- Ted
