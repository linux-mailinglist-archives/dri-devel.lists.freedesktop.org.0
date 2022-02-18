Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 495654BC753
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1A10F683;
	Sat, 19 Feb 2022 10:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF7E610EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:09:35 +0000 (UTC)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
 by 156.147.23.51 with ESMTP; 18 Feb 2022 15:09:33 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: byungchul.park@lge.com
Received: from unknown (HELO X58A-UD3R) (10.177.244.38)
 by 156.147.1.127 with ESMTP; 18 Feb 2022 15:09:33 +0900
X-Original-SENDERIP: 10.177.244.38
X-Original-MAILFROM: byungchul.park@lge.com
Date: Fri, 18 Feb 2022 15:09:26 +0900
From: Byungchul Park <byungchul.park@lge.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 02/16] dept: Implement Dept(Dependency Tracker)
Message-ID: <20220218060926.GA26206@X58A-UD3R>
References: <1645095472-26530-1-git-send-email-byungchul.park@lge.com>
 <1645095472-26530-3-git-send-email-byungchul.park@lge.com>
 <20220217123656.389e8783@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217123656.389e8783@gandalf.local.home>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
 dan.j.williams@intel.com, josef@toxicpanda.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jglisse@redhat.com, viro@zeniv.linux.org.uk,
 tglx@linutronix.de, mhocko@kernel.org, vbabka@suse.cz, axboe@kernel.dk,
 melissa.srw@gmail.com, sj@kernel.org, tytso@mit.edu,
 rodrigosiqueiramelo@gmail.com, kernel-team@lge.com, gregkh@linuxfoundation.org,
 jlayton@kernel.org, linux-kernel@vger.kernel.org, penberg@kernel.org,
 minchan@kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 akpm@linux-foundation.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 12:36:56PM -0500, Steven Rostedt wrote:
> > +struct dept_ecxt;
> > +struct dept_iecxt {
> > +	struct dept_ecxt *ecxt;
> > +	int enirq;
> > +	bool staled; /* for preventing to add a new ecxt */
> > +};
> > +
> > +struct dept_wait;
> > +struct dept_iwait {
> > +	struct dept_wait *wait;
> > +	int irq;
> > +	bool staled; /* for preventing to add a new wait */
> > +	bool touched;
> > +};
> 
> Nit. It makes it easier to read (and then review) if structures are spaced
> where their fields are all lined up:
> 
> struct dept_iecxt {
> 	struct dept_ecxt		*ecxt;
> 	int				enirq;
> 	bool				staled;
> };
> 
> struct dept_iwait {
> 	struct dept_wait		*wait;
> 	int				irq;
> 	bool				staled;
> 	bool				touched;
> };
> 
> See, the fields stand out, and is nicer on the eyes. Especially for those
> of us that are getting up in age, and our eyes do not work as well as they
> use to ;-)

Sure! I will apply this.

> > + * ---
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your ootion) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful, but
> > + * WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> > + * General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, you can access it online at
> > + * http://www.gnu.org/licenses/gpl-2.0.html.
> 
> The SPDX at the top of the file is all that is needed. Please remove this
> boiler plate. We do not use GPL boiler plates in the kernel anymore. The
> SPDX code supersedes that.

Thank you for informing it!

> > +/*
> > + * Can use llist no matter whether CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG is
> > + * enabled because DEPT never race with NMI by nesting control.
> 
>                          "never races with"

Good eyes!

> Although, I'm confused by what you mean with "by nesting control".

I should've expressed it more clearly. It meant NMI and other contexts
never run inside of Dept concurrently in the same CPU by preventing
reentrance.

> > +static void initialize_class(struct dept_class *c)
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < DEPT_IRQS_NR; i++) {
> > +		struct dept_iecxt *ie = &c->iecxt[i];
> > +		struct dept_iwait *iw = &c->iwait[i];
> > +
> > +		ie->ecxt = NULL;
> > +		ie->enirq = i;
> > +		ie->staled = false;
> > +
> > +		iw->wait = NULL;
> > +		iw->irq = i;
> > +		iw->staled = false;
> > +		iw->touched = false;
> > +	}
> > +	c->bfs_gen = 0U;
> 
> Is the U really necessary?

I was just wondering if it's really harmful? I want to leave this if
it's harmless because U let us guess the data type of ->bfs_gen correctly
at a glance. Or am I missing some reason why I should fix this?

Thank you very much, Steven.

