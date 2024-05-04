Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AC8BBA6A
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 11:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 225F410E678;
	Sat,  4 May 2024 09:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aRV49p2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACB110E678
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 09:59:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 03584CE111A;
 Sat,  4 May 2024 09:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B45BC072AA;
 Sat,  4 May 2024 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714816756;
 bh=3eAFHKCZTttF0x3ER2rv6cp3C35EVzmnYui996ngcl4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aRV49p2kxe5ltj/B9peDkbgJgfXfbYtKd1XRfmyWXgwH7ZTSIh5ErUDb4K7kvzduA
 szU81/XNWqirbrNe7B/5nzcj36srk+gSP8sacvtTA6V5UVmkEkYohniuRLu/ceZ6yS
 Ai6X1rLcpuzAI0amzfcW6XivashfnZxmgqPz7ePjHg/jInw+OeXA57XdjY0rhsBPWz
 8Go9hjLJOFf3/OHnz+1VhQEGYl2QOjEEAEUxhQRtix7b2rJS/k9SkLHqZtVUaTpbP5
 Pnk4L1u/jXW6LA6fliX548c2RO+mrS4ZfSTLIe5o9blOHsFEvZuhv8Fmt4TapnuuWD
 DehmZcVkWqZxQ==
Date: Sat, 4 May 2024 11:59:09 +0200
From: Christian Brauner <brauner@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>, 
 Bui Quang Minh <minhquangbui99@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Message-ID: <20240504-irrsinn-sinnlich-83cf0890c7dc@brauner>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202405031237.B6B8379@keescook>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 03, 2024 at 12:59:52PM -0700, Kees Cook wrote:
> On Fri, May 03, 2024 at 01:35:09PM -0600, Jens Axboe wrote:
> > On 5/3/24 1:22 PM, Kees Cook wrote:
> > > On Fri, May 03, 2024 at 12:49:11PM -0600, Jens Axboe wrote:
> > >> On 5/3/24 12:26 PM, Kees Cook wrote:
> > >>> Thanks for doing this analysis! I suspect at least a start of a fix
> > >>> would be this:
> > >>>
> > >>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > >>> index 8fe5aa67b167..15e8f74ee0f2 100644
> > >>> --- a/drivers/dma-buf/dma-buf.c
> > >>> +++ b/drivers/dma-buf/dma-buf.c
> > >>> @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> > >>>  
> > >>>  		if (events & EPOLLOUT) {
> > >>>  			/* Paired with fput in dma_buf_poll_cb */
> > >>> -			get_file(dmabuf->file);
> > >>> -
> > >>> -			if (!dma_buf_poll_add_cb(resv, true, dcb))
> > >>> +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
> > >>> +			    !dma_buf_poll_add_cb(resv, true, dcb))
> > >>>  				/* No callback queued, wake up any other waiters */
> > >>
> > >> Don't think this is sane at all. I'm assuming you meant:
> > >>
> > >> 	atomic_long_inc_not_zero(&dmabuf->file->f_count);
> > > 
> > > Oops, yes, sorry. I was typed from memory instead of copy/paste.
> > 
> > Figured :-)
> > 
> > >> but won't fly as you're not under RCU in the first place. And what
> > >> protects it from being long gone before you attempt this anyway? This is
> > >> sane way to attempt to fix it, it's completely opposite of what sane ref
> > >> handling should look like.
> > >>
> > >> Not sure what the best fix is here, seems like dma-buf should hold an
> > >> actual reference to the file upfront rather than just stash a pointer
> > >> and then later _hope_ that it can just grab a reference. That seems
> > >> pretty horrible, and the real source of the issue.
> > > 
> > > AFAICT, epoll just doesn't hold any references at all. It depends,
> > > I think, on eventpoll_release() (really eventpoll_release_file())
> > > synchronizing with epoll_wait() (but I don't see how this happens, and
> > > the race seems to be against ep_item_poll() ...?)
> > >
> > > I'm really confused about how eventpoll manages the lifetime of polled
> > > fds.
> > 
> > epoll doesn't hold any references, and it's got some ugly callback to
> > deal with that. It's not ideal, nor pretty, but that's how it currently
> > works. See eventpoll_release() and how it's called. This means that
> > epoll itself is supposedly safe from the file going away, even though it
> > doesn't hold a reference to it.
> 
> Right -- what remains unclear to me is how struct file lifetime is
> expected to work in the struct file_operations::poll callbacks. Because
> using get_file() there looks clearly unsafe...

If you're in ->poll() you're holding the epoll mutex and
eventpoll_release_file() needs to acquire ep->mtx as well. So if you're
in ->poll() then you know that eventpoll_release_file() can't progress
and therefore eventpoll_release() can't make progress. So
f_op->release() won't be able to be called as it happens after
eventpoll_release() in __fput(). But f_count being able to go to zero is
expected.
