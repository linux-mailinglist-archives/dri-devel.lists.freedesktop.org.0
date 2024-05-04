Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECF08BBA4C
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 11:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A439810EA03;
	Sat,  4 May 2024 09:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uMavHk//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595B110EA03
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2024 09:37:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E33FCCE0D9A;
 Sat,  4 May 2024 09:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A037C072AA;
 Sat,  4 May 2024 09:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714815458;
 bh=iBRxGQJjRoROFxKq58LLxfgM50Q+YDQejQATifgx5Mg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uMavHk//UYBlcW8RF+QF3+ZaD+R7GOT79sK90E6pyBxxoEp742dLivqK3dkPq715a
 dU8PE7fABkGVbY8i1D8DCAoPk5gogBaWjAaUK707J9DXBS4Oge68+2bgVfN3lyfivp
 OIS5ZtNlbDvXRdQivUMKYhbZ1F7HohjvG2fS3YqHE11Kl23ulvUw3LELqAfcmZgxE9
 +IcZDIyYUvoI2NiQZGo+g79bnPNlMYTRFgki6Xyt7dbB3KHA0omA07pvxCT5rFfzTv
 tWqFqvW309XZ7kIR0csaSLmkTuYfL1c2OLLbOglGYu9QyHzC9UOVwJ7VT0zi5KkgTt
 fe/wh2z4c+AEQ==
Date: Sat, 4 May 2024 11:37:31 +0200
From: Christian Brauner <brauner@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
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

On Fri, May 03, 2024 at 02:33:37PM -0700, Linus Torvalds wrote:
> On Fri, 3 May 2024 at 14:24, Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Can we get to ep_item_poll(epi, ...) after eventpoll_release_file()
> > got past __ep_remove()?  Because if we can, we have a worse problem -
> > epi freed under us.
> 
> Look at the hack in __ep_remove(): if it is concurrent with
> eventpoll_release_file(), it will hit this code
> 
>         spin_lock(&file->f_lock);
>         if (epi->dying && !force) {
>                 spin_unlock(&file->f_lock);
>                 return false;
>         }
> 
> and not free the epi.
> 
> But as far as I can tell, almost nothing else cares about the f_lock
> and dying logic.
> 
> And in fact, I don't think doing
> 
>         spin_lock(&file->f_lock);
> 
> is even valid in the places that look up file through "epi->ffd.file",
> because the lock itself is inside the thing that you can't trust until
> you've taken the lock...
> 
> So I agree with Kees about the use of "atomic_dec_not_zero()" kind of
> logic - but it also needs to be in an RCU-readlocked region, I think.

Why isn't it enough to just force dma_buf_poll() to use
get_file_active()? Then that whole problem goes away afaict.

So the fix I had yesterday before I had to step away from the computer
was literally just that [1]. It currently uses two atomic incs
potentially but that can probably be fixed by the dma folks to be
smarter about when they actually need to take a file reference.

> 
> I wish epoll() just took the damn file ref itself. But since it relies
> on the file refcount to release the data structure, that obviously
> can't work.
> 
>                 Linus

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..7149c45976e1 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -244,13 +244,18 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
        if (!dmabuf || !dmabuf->resv)
                return EPOLLERR;

+       if (!get_file_active(&dmabuf->file))
+               return EPOLLERR;
+
        resv = dmabuf->resv;

        poll_wait(file, &dmabuf->poll, poll);

        events = poll_requested_events(poll) & (EPOLLIN | EPOLLOUT);
-       if (!events)
+       if (!events) {
+               fput(file);
                return 0;
+       }

        dma_resv_lock(resv, NULL);

@@ -268,7 +273,6 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
                if (events & EPOLLOUT) {
                        /* Paired with fput in dma_buf_poll_cb */
                        get_file(dmabuf->file);
-
                        if (!dma_buf_poll_add_cb(resv, true, dcb))
                                /* No callback queued, wake up any other waiters */
                                dma_buf_poll_cb(NULL, &dcb->cb);
@@ -301,6 +305,7 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
        }

        dma_resv_unlock(resv);
+       fput(file);
        return events;
 }
