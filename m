Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD82A8BB5E3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4E01129FE;
	Fri,  3 May 2024 21:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="QT8f1mjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6B11129FE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=J3cXx30+FsboiPTcISOtZ9TwfuIcCg4JxBIH2uqHWq8=; b=QT8f1mjVdApb6qDPIYAjbnpkXa
 huWJ8WJkoI5MWTqxqBfivrYJAGWWz9GQcJDFBaHiLEkKu3dwesImOrNP9SYMXxS1z4uhtQCjc+Lkl
 SUirU7g26F8NX/T0yaZVYScsT1TccXQaORjVO3HH+n+JjgdGmmtvVLBK5raOfaCu9jSJyxJAQVtDy
 qIsaithpJee/MVfppIsBP4Z3bqcg+1vZWIgupErqLWUqr6KIim87g5615EV32qW3zOigsdrpMFT9K
 NoLhUSqNDAw8suQ4f7sPMc02J2taTcMV4BLsWPBBjLg+Kp4m+dBi71MZhNGBdEM+XhSQPtKevD8SG
 6LiY+Ybg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s30Zt-00B8nN-0t; Fri, 03 May 2024 21:36:25 +0000
Date: Fri, 3 May 2024 22:36:25 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>, Bui Quang Minh <minhquangbui99@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Message-ID: <20240503213625.GA2118490@ZenIV>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503211109.GX2118490@ZenIV>
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

On Fri, May 03, 2024 at 10:11:09PM +0100, Al Viro wrote:
> On Fri, May 03, 2024 at 01:28:37PM -0700, Kees Cook wrote:
> > 
> > Is this the right approach? It still feels to me like get_file() needs
> > to happen much earlier...
> 
> I don't believe it needs to happen at all.  The problem is not that
> ->release() can be called during ->poll() - it can't and it doesn't.
> It's that this instance of ->poll() is trying to extend the lifetime
> of that struct file, when it might very well be past the point of no
> return.
> 
> What we need is
> 	* promise that ep_item_poll() won't happen after eventpoll_release_file().
> AFAICS, we do have that.
> 	* ->poll() not playing silly buggers.
> 
> As it is, dma_buf ->poll() is very suspicious regardless of that
> mess - it can grab reference to file for unspecified interval.
> Have that happen shortly before reboot and you are asking for failing
> umount.
> 
> ->poll() must be refcount-neutral wrt file passed to it.  I'm seriously
> tempted to make ->poll() take const struct file * and see if there's
> anything else that would fall out.

... the last part is no-go - poll_wait() must be able to grab a reference
(well, the callback in it must)
