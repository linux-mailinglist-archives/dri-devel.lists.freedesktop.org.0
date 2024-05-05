Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E741E8BC021
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 12:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CD710F866;
	Sun,  5 May 2024 10:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e5L3jU3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84C3310F866
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 10:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C591CE09AF;
 Sun,  5 May 2024 10:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B1EC113CC;
 Sun,  5 May 2024 10:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714906228;
 bh=A0pA9gFmx/KX+0Pa4DEPpSZCbQRPr/bicmqz+Fp/D+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5L3jU3FZTdPXwhW7v4hVB9ximQhq8UCZ0c9TGS4U1UkDy9SoEAFc5NcwjdpsIkoS
 y5500oXQvODSiP70b98akmj6jmj+4sIElipq9Sppz0r6ueMZ5+eoTun24p+V22Tcsc
 HaEAjxcM6qfbfzwdvMKKH0Bzaupg7FpgBHRmFAtU8wyAoJkMIQ+EcEkI2ftcOlZkWI
 aYekeYbhJGpP03mC0HcdhmtZ5hdyxwJFb24ZNgDWJ/rfxASaSIkLf4OS9WJJBKMSOh
 qzzyyX+Lq+QiMQ+t6jgW/KeVXyFOY4AUvFgw8NNBYWWqzu+JmgCOPLMaezQ+o0HooC
 CPk8Qe18RVxwQ==
Date: Sun, 5 May 2024 12:50:21 +0200
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
Message-ID: <20240505-gelehnt-anfahren-8250b487da2c@brauner>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
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

On Sat, May 04, 2024 at 08:40:25AM -0700, Linus Torvalds wrote:
> On Sat, 4 May 2024 at 08:32, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Now, during this TOTALLY INNOCENT sock_poll(), in another thread, the
> > file closing completes, eventpoll_release() finishes [..]
> 
> Actually, Al is right that ep_item_poll() should be holding the
> ep->mtx, so eventpoll_release() -> eventpoll_release_file_file() ->
> mutex_lock(&ep->mtx) should block and the file doesn't actually get
> released.

So I know you've seen it yourself but for my own peace of mind I've said
that in the other mail and in the other thread already that all callers
of ep_item_poll() do already hold the ep->mtx:

do_epoll_ctl()
-> epoll_mutex_lock(&ep->mtx)
-> ep_insert()
   -> ep_item_poll()

do_epoll_ctl()
-> epoll_mutex_lock(&ep->mtx)
-> ep_modify()
   -> ep_item_poll()

ep_send_events()
-> mutex_lock(&ep->mtx)
-> ep_item_poll()

/* nested; and all callers of ep_item_poll() already hold ep->mtx */
__ep_eventpoll_poll()
-> mutex_lock_nested(&ep->mtx, wait)
-> ep_item_poll()

So it's simply not possible to end up with a UAF in f_op->poll() because
eventpoll_release_file_file() serializes on ep->mtx as well:

__fput()
-> eventpoll_release()
   -> eventpoll_release_file()
      {
              // @file->f_count is zero _but file is not freed_
              // so taking file->f_lock is absolutely fine
              spin_lock(&file->f_lock);
              // mark as dying

              // serialzed on ep->mtx
              mutex_lock(&ep->mtx);
              __ep_rmove(ep, epi);
              ...

      }
      -> mutex_lock(&ep->mtx)

-> f_op->release()
-> kfree(file)

So afaict it's simply not possible to end up with a UAF in f_op->poll().

And I agree with you that for some instances it's valid to take another
reference to a file from f_op->poll() but then they need to use
get_file_active() imho and simply handle the case where f_count is zero.
And we need to document that in Documentation/filesystems/file.rst or
locking.rst.

But if it's simply just dma buf that cares about that long-term
reference then really we should just force them to take the reference
like I suggested but don't penalize everyone else. When I took a glance
at all f_op->poll() implementations I didn't spot one that did take
extra references.

But if you absolutely want to have epoll take the reference before it
calls into f_op->poll() that's fine with me as well. But we might end up
forcing epoll to do a lot of final fput()s which I'm not sure is all
that desirable.
