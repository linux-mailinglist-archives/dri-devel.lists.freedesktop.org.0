Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332228BCFE9
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 16:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1339112094;
	Mon,  6 May 2024 14:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XQUTHXDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A994110EDDF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 14:19:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A6346CE0EAA;
 Mon,  6 May 2024 14:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FA1C116B1;
 Mon,  6 May 2024 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715005153;
 bh=l39k6V0I7wZACUt8VAIAhxRDJ0/vIbV1E6k1IrSGtK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XQUTHXDJ6U4b3MW5pJhdFcgCJ8GRlt0WUo07V6/eFe4FkmlpEPSUBRp9vzJif66tz
 48bynhPLwPbGqNMjPjj6OCh966S+vS0L+TkmKifUTt5sqDR6RUpnaGxjEj7U0EF0V9
 qXKKSVwP8jp/jZeB3jCnG0uVdSbcj857lvLjY9a3itUWr2kcoFj+c6vnZ8m+ECCUAz
 kbUkpPgsM/Pww3u4arhcLXvQW5lj1M6fvyJbgQYolNLKm2LesyooMdJvsfHZae8613
 tNt1E2bagVx7r2Gbuqaow7JCziJ74q3PJGx+P71AqPMmgTbDhK1CamdAE2gqEK620F
 lC4wZIfMVgufQ==
Date: Mon, 6 May 2024 16:19:06 +0200
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
Message-ID: <20240506-zerbrach-zehnkampf-80281b1452c8@brauner>
References: <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <20240505-gelehnt-anfahren-8250b487da2c@brauner>
 <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
 <20240506-injizieren-administration-f5900157566a@brauner>
 <20240506-zweibeinig-mahnen-daa579a233db@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240506-zweibeinig-mahnen-daa579a233db@brauner>
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

On Mon, May 06, 2024 at 11:27:04AM +0200, Christian Brauner wrote:
> On Mon, May 06, 2024 at 10:45:35AM +0200, Christian Brauner wrote:
> > > The fact is, it's not dma-buf that is violating any rules. It's epoll.
> > 
> > I agree that epoll() not taking a reference on the file is at least
> > unexpected and contradicts the usual code patterns for the sake of
> > performance and that it very likely is the case that most callers of
> > f_op->poll() don't know this.
> > 
> > Note, I cleary wrote upthread that I'm ok to do it like you suggested
> > but raised two concerns a) there's currently only one instance of
> > prolonged @file lifetime in f_op->poll() afaict and b) that there's
> > possibly going to be some performance impact on epoll().
> > 
> > So it's at least worth discussing what's more important because epoll()
> > is very widely used and it's not that we haven't favored performance
> > before.
> > 
> > But you've already said that you aren't concerned with performance on
> > epoll() upthread. So afaict then there's really not a lot more to
> > discuss other than take the patch and see whether we get any complaints.
> 
> Two closing thoughts:
> 
> (1) I wonder if this won't cause userspace regressions for the semantics
>     of epoll because dying files are now silently ignored whereas before
>     they'd generated events.
> 
> (2) The other part is that this seems to me that epoll() will now
>     temporarly pin filesystems opening up the possibility for spurious
>     EBUSY errors.
> 
>     If you register a file descriptor in an epoll instance and then
>     close it and umount the filesystem but epoll managed to do an fget()
>     on that fd before that close() call then epoll will pin that
>     filesystem.
> 
>     If the f_op->poll() method does something that can take a while
>     (blocks on a shared mutex of that subsystem) that umount is very
>     likely going to return EBUSY suddenly.
> 
>     Afaict, before that this wouldn't have been an issue at all and is
>     likely more serious than performance.
> 
>     (One option would be to only do epi_fget() for stuff like
>     dma-buf that's never unmounted. That'll cover nearly every
>     driver out there. Only "real" filesystems would have to contend with
>     @file count going to zero but honestly they also deal with dentry
>     lookup under RCU which is way more adventurous than this.)
> 
>     Maybe I'm barking up the wrong tree though.

Sorry, had to step out for an appointment.

Under the assumption that I'm not entirely off with this - and I really
could be ofc - then one possibility would be that we enable persistence
of files from f_op->poll() for SB_NOUSER filesystems.

That'll catch everything that's relying on anonymous inodes (drm and all
drivers) and init_pseudo() so everything that isn't actually unmountable
(pipefs, pidfs, sockfs, etc.).

So something like the _completely untested_ diff on top of your proposal
above:

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index a3f0f868adc4..95968a462544 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1018,8 +1018,24 @@ static struct file *epi_fget(const struct epitem *epi)
 static __poll_t ep_item_poll(const struct epitem *epi, poll_table *pt,
                                 int depth)
 {
-       struct file *file = epi_fget(epi);
+       struct file *file = epi->ffd.file;
        __poll_t res;
+       bool unrefd = false;
+
+       /*
+        * Taking a reference for anything that isn't mountable is fine
+        * because we don't have to worry about spurious EBUSY warnings
+        * from umount().
+        *
+        * File count might go to zero in f_op->poll() for mountable
+        * filesystems.
+        */
+       if (file->f_inode->i_sb->s_flags & SB_NOUSER) {
+               unrefd = true;
+               file = epi_fget(epi);
+       } else if (file_count(file) == 0) {
+               file = NULL;
+       }

        /*
         * We could return EPOLLERR | EPOLLHUP or something,
@@ -1034,7 +1050,9 @@ static __poll_t ep_item_poll(const struct epitem *epi, poll_table *pt,
                res = vfs_poll(file, pt);
        else
                res = __ep_eventpoll_poll(file, pt, depth);
-       fput(file);
+
+       if (unrefd)
+               fput(file);
        return res & epi->event.events;
 }

Basically, my worry is that we end up with really annoying to debug
EBUSYs caused by epoll(). I'd really like to avoid that. But again, I
might be wrong and this isn't an issue.
