Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 822F223B5A9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB07F6E43B;
	Tue,  4 Aug 2020 07:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 567 seconds by postgrey-1.36 at gabe;
 Mon, 03 Aug 2020 22:28:46 UTC
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7448D6E162
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 22:28:46 +0000 (UTC)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1k2iwZ-008hXp-IY; Mon, 03 Aug 2020 22:28:31 +0000
Date: Mon, 3 Aug 2020 23:28:31 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200803222831.GI1236603@ZenIV.linux.org.uk>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
 <20200803161230.GB23808@casper.infradead.org>
 <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpGot1Lr+eS_AU30gqrrjc0aFWikxySe0667_GTJNsGTMw@mail.gmail.com>
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, linux-doc@vger.kernel.org,
 Ioannis Ilkos <ilkos@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, Ingo Molnar <mingo@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Kalesh Singh <kaleshsingh@google.com>,
 linux-fsdevel@vger.kernel.org, kernel-team <kernel-team@android.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 03, 2020 at 09:22:53AM -0700, Suren Baghdasaryan wrote:
> On Mon, Aug 3, 2020 at 9:12 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Aug 03, 2020 at 09:00:00AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > > > > +static void dma_buf_fd_install(int fd, struct file *filp)
> > > > > +{
> > > > > +     trace_dma_buf_fd_ref_inc(current, filp);
> > > > > +}
> > > >
> > > > You're adding a new file_operation in order to just add a new tracepoint?
> > > > NACK.
> > >
> > > Hi Matthew,
> > > The plan is to attach a BPF to this tracepoint in order to track
> > > dma-buf users. If you feel this is an overkill, what would you suggest
> > > as an alternative?
> >
> > I'm sure BPF can attach to fd_install and filter on file->f_ops belonging
> > to dma_buf, for example.
> 
> Sounds like a workable solution. Will explore that direction. Thanks Matthew!

No, it is not a solution at all.

What kind of locking would you use?  With _any_ of those approaches.

How would you use the information that is hopelessly out of date/incoherent/whatnot
at the very moment you obtain it?

IOW, what the hell is that horror for?  You do realize, for example, that there's
such thing as dup(), right?  And dup2() as well.  And while we are at it, how
do you keep track of removals, considering the fact that you can stick a file
reference into SCM_RIGHTS datagram sent to yourself, close descriptors and an hour
later pick that datagram, suddenly getting descriptor back?

Besides, "I have no descriptors left" != "I can't be currently sitting in the middle
of syscall on that sucker"; close() does *NOT* terminate ongoing operations.

You are looking at the drastically wrong abstraction level.  Please, describe what
it is that you are trying to achieve.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
