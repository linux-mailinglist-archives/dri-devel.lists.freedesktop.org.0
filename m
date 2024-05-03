Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B38BB646
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CD3112A15;
	Fri,  3 May 2024 21:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="LBITSpJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3301132BF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3lCoy8uzoX7QQd8eqESv9U82+gq2FTw7cMvL87kLhkY=; b=LBITSpJYboAcmP2sLMLog8nydW
 mt/eEb1k1RxaC/1rf9axcfr3DpdDFVZWBzSM5oiyiRFUxSmSTNk7S/pL3r/LyK0sUx0B7ulVQ3JNQ
 r6F9ALR0ltwB+yhzi14FlChXAh3y8p88L3KhQBzlGvQE9Qyjmf9GyQKp0ImLKiTti9oHi8k3hRvo3
 wVh2ps6XnwBsfVzZeN71mN1klcTNC+Iw2ovocjktngU/aRLmD9i2C0kfkNl/XDxg43VHY7LcXvmHW
 cP5n8cc1rlrFA4QbwGKtuB0RilMr6TQXDJT8CFkSL/wplslwGYSr1h0+/PUFgSGJlDgXOv0RWp+HJ
 KdWj72Tw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s30ih-00B9OV-2B; Fri, 03 May 2024 21:45:31 +0000
Date: Fri, 3 May 2024 22:45:31 +0100
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
Message-ID: <20240503214531.GB2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

What does that have to do with ep_item_poll()?

eventpoll_release_file() itself calls __ep_remove().  Have that
happen while ep_item_poll() is running in another thread and
you've got a problem.

AFAICS, exclusion is on ep->mtx.  Callers of ep_item_poll() are
* __ep_eventpoll_poll() - grabs ->mtx
* ep_insert() - called under ->mtx
* ep_modify() - calls are under ->mtx
* ep_send_events() - grabs ->mtx

and eventpoll_release_file() grabs ->mtx around __ep_remove().

How do you get through eventpoll_release_file() while someone
has entered ep_item_poll()?
