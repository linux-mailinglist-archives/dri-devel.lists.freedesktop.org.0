Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A98BC386
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 22:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A6F10E3CA;
	Sun,  5 May 2024 20:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="CnaLgPQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B910E3CA
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FIBoGZquZ/VQe2BKe30XapKIaNM49ftHl1jJXnJm4k8=; b=CnaLgPQ6MmvvpktCsT6C2eJz3J
 oqeWQSgZ0Dw3Z1EwSS6+OhHluY6tG92atgAY7KqTo8lvS0C4CTfQS+YJdqrXUmNiCcgIWA/qDCv4F
 s39hw0eIJcULyRbooAxulMm+VWMPzYxFEtZRNKC6y8s03L9r9hOjO8MVk+OxNQxEtohB3mdEPcwq5
 6/svRI0/B+7pstJPhzIp6uyDiT4G31Y96bNSnZYHdZOFYnk3S4Ug7be4CUKX33+ebiIFEa1lDFzTN
 xhRECPgfGVbrmNkgd137h6fDVgyJHDe3j4aMst3q7MaunQnGbEO5wbFc8SEimuuHg5ZTrfxyAuqHm
 6pSrN7Nw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s3iEA-00DH5K-0Z; Sun, 05 May 2024 20:12:54 +0000
Date: Sun, 5 May 2024 21:12:54 +0100
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
Message-ID: <20240505201254.GI2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wirxPSQgRV1u7t4qS1t4ED7w7OeehdUSC-LYZXspqa49w@mail.gmail.com>
 <20240505-gelehnt-anfahren-8250b487da2c@brauner>
 <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
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

On Sun, May 05, 2024 at 09:46:05AM -0700, Linus Torvalds wrote:

> WHY?
> 
> Why cannot you and Al just admit that the problem is in epoll. Always
> has been, always will be.

Nobody (well, nobody who'd ever read epoll) argues that epoll is not
a problem.

> The fact is, it's not dma-buf that is violating any rules.

Now, that is something I've a trouble with.  Use of get_file() in there
actually looks rather fishy, regardless of epoll.

At the very least it needs a comment discouraging other instances from
blindly copying this.  A reference to struct file pins down more than
driver-internal objects; if nothing else, it pins down a mount and
if you don't have SB_NOUSER on file_inode(file)->i_sb->s_flags, it's
really not a good idea.

What's more, the reason for that get_file() is, AFAICS, that nodes
we put into callback queue for fence(s) in question[*] are embedded
into dmabuf and we don't want them gone before the callbacks have
happened.  Which looks fishy - it would make more sense to cancel
these callbacks and drop the fence(s) in question from ->release().

I've no problem whatsoever with fs/eventpoll.c grabbing/dropping
file reference around vfs_poll() calls.  And I don't believe that
"try to grab" has any place in dma_buf_poll(); it's just that I'm not
happy about get_file() call being there in the first place.

Sure, the call of ->poll() can bloody well lead to references being
grabbed - by the pollwait callback, which the caller of ->poll()
is aware of.  It's ->poll() instance *itself* grabbing such references
with vfs_poll() caller having no idea what's going on that has
potential for being unpleasant.  And we can't constify 'file' argument
of ->poll() because of poll_wait(), so it's hard to catch those who
do that kind of thing; I've explicitly said so upthread, I believe.

But similar calls of get_file() in ->poll() instances (again, not
the ones that are made by pollwait callback) are something to
watch out for and having the caller pin struct file does not solve
the problem.

[*] at most one per direction, and I've no idea whether there can be more
than one signalling fence for given dmabuf) 
