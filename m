Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A35CC23B5A4
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF496E444;
	Tue,  4 Aug 2020 07:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1702E88E07
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Jjt0E9vK/ahlYCJCf6JgaQ1Z9HcAiypA/MZQmN7aHDI=; b=v9sEOjX05M53TG5F7vsJHkJRxP
 SUTLinHGW8UeImHcg5h5r26zVeM83lGqIf30Yy9SeON0G5OGgCTBOdtMQx8O0FmjKiLsgtkb6e4TW
 P/wXIMlPMyR86sWjfVd6waN4/ik7a+SFeewP54KG25p1OgId9RVIQG3PcPP9KxdOI5qLXOUworZDQ
 3L/fKCnhvTCxtAfV0Ya2HVHZuvGzke8HG/pf3tvNI0t944RaJoAjFGoyZd87WT7Ls8WC6RzSi59po
 Yk7XpxFG9iqhxpw3XSW9HuLbSoxqgTlM3u0WQAZYbLjSO6N6GM/jOYdW7lDMAGNZd/RXMic9r8m8s
 EP0V+iyw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1k2d4g-0002EU-MF; Mon, 03 Aug 2020 16:12:30 +0000
Date: Mon, 3 Aug 2020 17:12:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 2/2] dmabuf/tracing: Add dma-buf trace events
Message-ID: <20200803161230.GB23808@casper.infradead.org>
References: <20200803144719.3184138-1-kaleshsingh@google.com>
 <20200803144719.3184138-3-kaleshsingh@google.com>
 <20200803154125.GA23808@casper.infradead.org>
 <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJuCfpFLikjaoopvt+vGN3W=m9auoK+DLQNgUf-xUbYfC=83Mw@mail.gmail.com>
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
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Kalesh Singh <kaleshsingh@google.com>, linux-fsdevel@vger.kernel.org,
 kernel-team <kernel-team@android.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 03, 2020 at 09:00:00AM -0700, Suren Baghdasaryan wrote:
> On Mon, Aug 3, 2020 at 8:41 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Mon, Aug 03, 2020 at 02:47:19PM +0000, Kalesh Singh wrote:
> > > +static void dma_buf_fd_install(int fd, struct file *filp)
> > > +{
> > > +     trace_dma_buf_fd_ref_inc(current, filp);
> > > +}
> >
> > You're adding a new file_operation in order to just add a new tracepoint?
> > NACK.
> 
> Hi Matthew,
> The plan is to attach a BPF to this tracepoint in order to track
> dma-buf users. If you feel this is an overkill, what would you suggest
> as an alternative?

I'm sure BPF can attach to fd_install and filter on file->f_ops belonging
to dma_buf, for example.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
