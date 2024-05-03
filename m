Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCE8BB7D8
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 01:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10610E075;
	Fri,  3 May 2024 23:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="ZKRWD2ib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649A10E075
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 23:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cSDdKBLN0a5uI9scqsrmM49KsAV9URcP7+bHrbasnBA=; b=ZKRWD2ibo8voqmliDBcVDvN5cn
 /J5M/yDDbeZNdFnxzKaOxhsSkppprX3nENPQ0z3ugjwuDMe8tlOqb2H9u0+kPfmRHjzW0fkG5yIqK
 5oMf9bmXAKEj7jmrC9MBBwV0BQN7ufjs49HUQ5Wy/J9G7EnLMFlsSbDAMOO2TRReS+grtgUOcSqnR
 M6fY72Cud6MedRUa79lH44WMOzNeJnHRW2gs7c2goZq9n8vvF96i89CfhXI5/xAijTEX7PXVxsOZu
 mNJv9YI0vA9p2YJOkwZNX3RMTA7af85jNkMRbId/g0Q7XANJDk1Fv/AEo0Bggo7yTWSDvAtdOh+wY
 kTLCW7YA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1s31vy-00BEDK-1T; Fri, 03 May 2024 23:03:18 +0000
Date: Sat, 4 May 2024 00:03:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, axboe@kernel.dk,
 brauner@kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, io-uring@vger.kernel.org,
 jack@suse.cz, laura@labbott.name, linaro-mm-sig@lists.linaro.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, minhquangbui99@gmail.com,
 sumit.semwal@linaro.org,
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] epoll: try to be a _bit_ better about file lifetimes
Message-ID: <20240503230318.GF2118490@ZenIV>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240503214531.GB2118490@ZenIV>
 <CAHk-=wgC+QpveKCJpeqsaORu7htoNNKA8mp+d9mvJEXmSKjhbw@mail.gmail.com>
 <202405031529.2CD1BFED37@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405031529.2CD1BFED37@keescook>
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

On Fri, May 03, 2024 at 03:46:25PM -0700, Kees Cook wrote:
> On Fri, May 03, 2024 at 02:52:38PM -0700, Linus Torvalds wrote:
> > That means that the file will be released - and it means that you have
> > violated all the refcounting rules for poll().
> 
> I feel like I've been looking at this too long. I think I see another
> problem here, but with dmabuf even when epoll is fixed:
> 
> dma_buf_poll()
> 	get_file(dmabuf->file)		/* f_count + 1 */
> 	dma_buf_poll_add_cb()
> 		dma_resv_for_each_fence ...
> 			dma_fence_add_callback(fence, ..., dma_buf_poll_cb)
> 
> dma_buf_poll_cb()
> 	...
>         fput(dmabuf->file);		/* f_count - 1 ... for each fence */
> 
> Isn't it possible to call dma_buf_poll_cb() (and therefore fput())
> multiple times if there is more than 1 fence? Perhaps I've missed a
> place where a single struct dma_resv will only ever signal 1 fence? But
> looking through dma_fence_signal_timestamp_locked(), I don't see
> anything about resv nor somehow looking into other fence cb_list
> contents...

At a guess,
                r = dma_fence_add_callback(fence, &dcb->cb, dma_buf_poll_cb);
		if (!r)
			return true;

prevents that - it returns 0 on success and -E... on error;
insertion into the list happens only when it's returning 0,
so...
