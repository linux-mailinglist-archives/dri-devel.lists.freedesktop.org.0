Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9678BB542
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8111129E1;
	Fri,  3 May 2024 21:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="Rs9B3xI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7331F113292
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NY7dpnWNXhQQKVFdAJPJlG4e4ZXMaDmQRQbDTVWLCeE=; b=Rs9B3xI+XdmJK5vPYQK8J22QKS
 EgQQjCflBDYUtxW7SIX67RGaVIh3sQxNGH90bxispPeYAm3Rch22e5sDAaxhSEmNW2ySJllWffdb5
 a4oV0hJkK1wMLB0wsYYYxmpIJp7sPoevLWMdPWdjnwETEp1S5NfsIj1h0wJX1d3jNqehubjWUYPn+
 7uDmwbVMNILcV4WyvLYqHObXMuav53kC37sidi15Uw1VLUrj5+Sngx5+0djz5feXF5HjHfmThe2Wn
 SpKgjexjGpBfd+US1tn2T08npPs/aGPCeX21rEsxXS0Wot3Ugzg/2Yns9RIFdjTU5nMXuJMK+yyG7
 QAAoXHQQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s30BR-00B72n-1X; Fri, 03 May 2024 21:11:09 +0000
Date: Fri, 3 May 2024 22:11:09 +0100
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
Message-ID: <20240503211109.GX2118490@ZenIV>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405031325.B8979870B@keescook>
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

On Fri, May 03, 2024 at 01:28:37PM -0700, Kees Cook wrote:
> 
> Is this the right approach? It still feels to me like get_file() needs
> to happen much earlier...

I don't believe it needs to happen at all.  The problem is not that
->release() can be called during ->poll() - it can't and it doesn't.
It's that this instance of ->poll() is trying to extend the lifetime
of that struct file, when it might very well be past the point of no
return.

What we need is
	* promise that ep_item_poll() won't happen after eventpoll_release_file().
AFAICS, we do have that.
	* ->poll() not playing silly buggers.

As it is, dma_buf ->poll() is very suspicious regardless of that
mess - it can grab reference to file for unspecified interval.
Have that happen shortly before reboot and you are asking for failing
umount.

->poll() must be refcount-neutral wrt file passed to it.  I'm seriously
tempted to make ->poll() take const struct file * and see if there's
anything else that would fall out.
