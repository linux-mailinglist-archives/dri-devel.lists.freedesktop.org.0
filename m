Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB26178641
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 00:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16358902A;
	Tue,  3 Mar 2020 23:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92A26E97C;
 Tue,  3 Mar 2020 23:25:00 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 369D120716;
 Tue,  3 Mar 2020 23:25:00 +0000 (UTC)
Date: Tue, 3 Mar 2020 18:24:58 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] trace: Export anonymous tracing
Message-ID: <20200303182458.1210c3bc@gandalf.local.home>
In-Reply-To: <158310134594.5508.5362429296192213548@skylake-alporthouse-com>
References: <20200301155248.4132645-1-chris@chris-wilson.co.uk>
 <20200301131816.277dd398@oasis.local.home>
 <158310134594.5508.5362429296192213548@skylake-alporthouse-com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 01 Mar 2020 22:22:25 +0000
Chris Wilson <chris@chris-wilson.co.uk> wrote:

> Quoting Steven Rostedt (2020-03-01 18:18:16)
> > On Sun,  1 Mar 2020 15:52:47 +0000
> > Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >   
> > > To facilitate construction of per-client event ringbuffers, in
> > > particular for a per-client debug and error report log, it would be
> > > extremely useful to create an anonymous file that can be handed to
> > > userspace so that it can see its and only its events. trace already
> > > provides a means of encapsulating the trace ringbuffer into a struct
> > > file that can be opened via the tracefs, and so with a couple of minor
> > > tweaks can provide the same access via an anonymous inode.  
> > 
> > I'm curious to why we need it to be anonymous. Why not allow them to be
> > visible from the tracing directory. This could allow for easier
> > debugging. Note, the trace instances have ref counters thus they can't
> > be removed if something has a reference to it.  
> 
> Do you really want a few thousand (or even tens) i915-client-%d? That
> does not particularly seem like it adds ease-of-use, and would need to be
> restricted to the client [or root]. The intent is for the client to have
> a private channel for detailed debug/error reporting of its own calls
> into the kernel.

Fair enough,

I would still want "trace_array_create()" to take a name. If it is NULL, it
becomes anonymous, but if you want it to appear in the tracing directory,
you can add a name to it.

Again, adding kernel doc comments to the global functions is still
necessary.

-- Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
