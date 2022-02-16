Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943134B9042
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 19:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753BB10E85E;
	Wed, 16 Feb 2022 18:33:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E7410E85E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 18:33:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB466615F0;
 Wed, 16 Feb 2022 18:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3B5C340E8;
 Wed, 16 Feb 2022 18:33:19 +0000 (UTC)
Date: Wed, 16 Feb 2022 13:33:18 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Report in ata_scsi_port_error_handler()
Message-ID: <20220216133318.204f36ac@gandalf.local.home>
In-Reply-To: <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
References: <1644984747-26706-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-1-git-send-email-byungchul.park@lge.com>
 <1644984964-28300-3-git-send-email-byungchul.park@lge.com>
 <94b1cba2-0e78-bbc0-0321-8be70b2b3be2@opensource.wdc.com>
 <CAHk-=wgfpfWuNQi2SjXQL1ir6iKCpUdBruJ+kmOQP1frH7Zdig@mail.gmail.com>
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
Cc: hamohammed.sa@gmail.com, Jan Kara <jack@suse.cz>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Amir Goldstein <amir73il@gmail.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, "J.
 Bruce Fields" <bfields@fieldses.org>, kernel-team@lge.com,
 Joel Fernandes <joel@joelfernandes.org>, Christoph Lameter <cl@linux.com>,
 Will Deacon <will@kernel.org>, duyuyang@gmail.com,
 Sasha Levin <sashal@kernel.org>, paolo.valente@linaro.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 Dave Airlie <airlied@linux.ie>, Ingo Molnar <mingo@redhat.com>, "Darrick
 J. Wong" <djwong@kernel.org>, Vladimir Davydov <vdavydov.dev@gmail.com>,
 David Rientjes <rientjes@google.com>, Dennis Zhou <dennis@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, ngupta@vflare.org, melissa.srw@gmail.com,
 johannes.berg@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Josef Bacik <josef@toxicpanda.com>, Byungchul Park <byungchul.park@lge.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Jerome Glisse <jglisse@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
 linux-block <linux-block@vger.kernel.org>, sj@kernel.org,
 Theodore Ts'o <tytso@mit.edu>, rodrigosiqueiramelo@gmail.com,
 linux-ide@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, Minchan Kim <minchan@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Feb 2022 10:09:14 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Byungchul, could you fix those two issues? Some of your reports may
> well be entirely valid, but the hard-to-read hex offsets and the
> knowledge that at least some of them are confused about how
> prepare_to_wait -> wait actually works makes the motivation to look at
> the details much less..

Hi Byungchul,

I'm not sure what your tool is using to attach to the kernel to analyze the
events (perhaps tracepoints?). But you can have the prepare_to_wait event
just flag the task is about to wait, and then attach to the schedule
(sched_switch) event to denote that it actually waited.

Of course have the finish_wait() clear the flag.

-- Steve
