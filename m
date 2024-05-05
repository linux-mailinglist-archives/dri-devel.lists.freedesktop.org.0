Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35CC8BC350
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 21:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9C5112D9A;
	Sun,  5 May 2024 19:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="WRqMcU/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B100112D9A
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CR8HSnmd0wpNYx92D/iUJFVLON8rnjrI0Q5oSHnNFnM=; b=WRqMcU/ZGHTJPWmlNeLfcAzApr
 RaTueuuX4UcawZAh6Js5j23MefBc0PwL5TSeboB94b+oL1d96HnFLOApzEMQVEGqnmZxdESFBaNTI
 gRx9uhQrbDV624FRxrN2uwkjDUiob3b11Q3dQS554W0u4b+UDZ2p6h0mqcGpu0KuODkBE3wJFkYrM
 Ccn0D4iIrdABSC8UQ6CYmaUJHFbMEVzW2eI8nZeDLQIvgBEdtrYLsDAd1QiS6AKOeAbO3cA3jKEtE
 HFshm2HNHREdy6EkxPFF0mTgymJ16FhUnBVz1pVnHYdV6myF9x5Uw750zSbEqR1U+RqadTs4p7amr
 uWFRmDTQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s3hoB-00DGHE-1B; Sun, 05 May 2024 19:46:03 +0000
Date: Sun, 5 May 2024 20:46:03 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>, keescook@chromium.org,
 axboe@kernel.dk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240505194603.GH2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whrSSNYVzTHNFDNGag_xcKuv=RaQUX8+n29kkic39DRuQ@mail.gmail.com>
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

On Sat, May 04, 2024 at 08:53:47AM -0700, Linus Torvalds wrote:

>   poll_wait
>     -> __pollwait
>      -> get_file (*boom*)
> 
> but the boom is very small because the poll_wait() will be undone by
> poll_freewait(), and normally poll/select has held the file count
> elevated.

Not quite.  It's not that poll_wait() calls __pollwait(); it calls
whatever callback that caller of ->poll() has set for it.

__pollwait users (select(2) and poll(2), currently) must (and do) make
sure that refcount is elevated; others (and epoll is not the only one)
need to do whatever's right for their callbacks.

I've no problem with having epoll grab a reference, but if we make that
a universal requirement ->poll() instances can rely upon, we'd better
verify that *all* vfs_poll() are OK.  And that ought to go into
Documentation/filesystems/porting.rst ("callers of vfs_poll() must
make sure that file is pinned; ->poll() instances may rely upon that,
but they'd better be very careful about grabbing extra references themselves -
it's acceptable for files on internal mounts, but *NOT* for anything on
mountable filesystems.  Any instance that does it needs an explicit
comment telling not to reuse that blindly." or something along those
lines).

Excluding epoll, select/poll and callers that have just done fdget() and will
do fdput() after vfs_poll(), we have this:

drivers/vhost/vhost.c:213:      mask = vfs_poll(file, &poll->table);
	vhost_poll_start().  Might get interesting...  Calls working
with vq->kick as file seem to rely upon vq->mutex, but I'll need to
refresh my memories of that code to check if that's all we need - and
then there's vhost_net_enable_vq(), which also needs an audit.

fs/aio.c:1738:          mask = vfs_poll(req->file, &pt) & req->events;
fs/aio.c:1932:  mask = vfs_poll(req->file, &apt.pt) & req->events;
	aio_poll() and aio_poll_wake() resp.  req->file here is actually ->ki_filp
	of iocb that contains work as iocb->req.work; it get dropped only in
	iocb_destroy(), which also frees iocb.  Any call that might've run into
	req->file not pinned is already in UAF land.

io_uring/poll.c:303:                    req->cqe.res = vfs_poll(req->file, &pt) & req->apoll_events;
io_uring/poll.c:622:    mask = vfs_poll(req->file, &ipt->pt) & poll->events;
	Should have req->file pinned, but I'll need to RTFS a bit for
details.  That, or ask Jens to confirm...

net/9p/trans_fd.c:236:  ret = vfs_poll(ts->rd, pt);
net/9p/trans_fd.c:238:          ret = (ret & ~EPOLLOUT) | (vfs_poll(ts->wr, pt) & ~EPOLLIN);
	p9_fd_poll(); ->rd and ->wr are pinned and won't get dropped until
p9_fd_close(), which frees ts immediately afterwards.  IOW, if we risk
being called with ->rd or ->wr not pinned, we are in UAF land already.
Incidentally, what the hell is this in p9_fd_open()?
         * It's technically possible for userspace or concurrent mounts to
         * modify this flag concurrently, which will likely result in a
         * broken filesystem. However, just having bad flags here should
         * not crash the kernel or cause any other sort of bug, so mark this
         * particular data race as intentional so that tooling (like KCSAN)
         * can allow it and detect further problems.
         */
Why not simply fix the race instead?  As in
	spin_lock(&ts->rd->f_lock);
        ts->rd->f_flags |= O_NONBLOCK;
	spin_unlock(&ts->rd->f_lock);
and similar for ts->wr?  Sigh...
