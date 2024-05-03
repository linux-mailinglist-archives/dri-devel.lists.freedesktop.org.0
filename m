Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169B28BB6DA
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 00:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1610E370;
	Fri,  3 May 2024 22:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="THwtsig7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319D10E370
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9IJ94F6D0hpL++k4cqV+mmpX37sPSJD4rkpmP5mQjAo=; b=THwtsig7+WAGUxhmJpiJpR9PpS
 dM05ePoKzCIBs8+7lHyp2MYwmUH+LkQoxFyS7J8MCf3nIVV6rhZHD+yoHk0cBUbKkW/VwL9wGwSlH
 FIiDgOtzJmmMBhSn+6zSf5+4VLvUrVDD1OA1Xvwarz4ztGra7C11jwxp9soa7j9BITqTMU01S/hN9
 bHOKJmd/37v/eZ5fAcBjKRLO3qSZI7TUi41kh6kFaPjPKQDwUBIJ0vhiYAKp3NVN7RHtNTas5JdV4
 xLWmh4Pxfnvbotxd93o72B8taYfTfsq9oNE8cs24NFEfZi6QMXsVXGTFetDToWXKjyc9lEN+MyX+L
 aeB8WzRQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s314C-00BAkU-39; Fri, 03 May 2024 22:07:45 +0000
Date: Fri, 3 May 2024 23:07:44 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: keescook@chromium.org, axboe@kernel.dk, brauner@kernel.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 minhquangbui99@gmail.com, sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240503220744.GE2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <20240503220145.GD2118490@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503220145.GD2118490@ZenIV>
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

On Fri, May 03, 2024 at 11:01:45PM +0100, Al Viro wrote:

> Having ->poll() instance itself grab reference is really asking for problem,
> even on the boxen that have CONFIG_EPOLL turned off.  select(2) is enough;
> it will take care of references grabbed by __pollwait(), but it doesn't
> know anything about the references driver has stashed hell knows where for
> hell knows how long.

Suppose your program calls select() on a pipe and dmabuf, sees data to be read
from pipe, reads it, closes both pipe and dmabuf and exits.

Would you expect that dmabuf file would stick around for hell knows how long
after that?  I would certainly be very surprised by running into that...
