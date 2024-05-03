Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6A8BB3DD
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A526B113201;
	Fri,  3 May 2024 19:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="U064ytO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DB610E982
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:22:35 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6edb76d83d0so67983b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714764155; x=1715368955;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wZE9sdMty9EFGzepC01irLfs4hOfSOdCceQaPVz49U0=;
 b=U064ytO3Miwd67dVbRsswYMzB/nXo7W33pBESV8r8Kc5xY8j/V3LAtqpPHXNV5eFrb
 wPfZKvuPzLi2fU9HCrq30mMnnhfHM4wdxSk3KUGNjV2QU5+tHVsuaU9HOq+OhOSledXL
 Lezv3gZ/lVyRQ2RDo70pKwL/pjW94iTby5mWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714764155; x=1715368955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZE9sdMty9EFGzepC01irLfs4hOfSOdCceQaPVz49U0=;
 b=BajPzT6mx/cTMhBfjIa0t8VISd4vWDbICpmtaXqnFx9HLjV/57c2/fCeTedmKCIpvP
 B4TfLLiyi9aFTG2HdGZJhlj1wHJBA6UXj1e0Q9gNx1gcB5kqvEWBUivYw3kc1C0RiSqZ
 vq6K3gh2gp6YfmRg+VPsvL5SyJBbo2bAiTw3aEq2zsD4bBpPcHFxtc4WVIZzB71M4cht
 tYUcQzeLcTijVTxeUhpStKMiPctB8yMJUf6CZ66x/m8fraiN9iogbi+j6y43+YhzU/QQ
 pRgLuZWVnTHCnqq+b7H2IzZCkQd4MgWFbybn8qdOQSrmu+vbGYF/qcGr3BGl3tWxFEjV
 4Mrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdiFyL3Y+ONutcOivHvyxrjT770YKj90WuSxfqR2bEM+pXV2ObJbdlFwMoOyDs5wJOlvPw5wLP8PmJbTIbQ9qzzxoND4wux3+oGe6A/QPS
X-Gm-Message-State: AOJu0Yya5DL4ksPQhXnqj8D2QyTn4ZYj7zGSE6V+/V2fp3pwZXdcbpj9
 pCLLJtXBA96Nx/TAgbqos9O8mo/YHIN7QU1QyPO3e9RJL7n36j5r5+zecOYfBA==
X-Google-Smtp-Source: AGHT+IH/cnBf5AmDAraYkoF01FtIBT3d+Li+us/ROEA5peZIO3ZUwaNqrc+r9saLXIGgSIOvwv5RWw==
X-Received: by 2002:a05:6a00:801:b0:6ed:21d5:fc2c with SMTP id
 m1-20020a056a00080100b006ed21d5fc2cmr4136967pfk.26.1714764154703; 
 Fri, 03 May 2024 12:22:34 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 y29-20020aa79e1d000000b006ed59172d2fsm3415250pfq.87.2024.05.03.12.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 12:22:33 -0700 (PDT)
Date: Fri, 3 May 2024 12:22:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Bui Quang Minh <minhquangbui99@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Message-ID: <202405031207.9D62DA4973@keescook>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
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

On Fri, May 03, 2024 at 12:49:11PM -0600, Jens Axboe wrote:
> On 5/3/24 12:26 PM, Kees Cook wrote:
> > Thanks for doing this analysis! I suspect at least a start of a fix
> > would be this:
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 8fe5aa67b167..15e8f74ee0f2 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >  
> >  		if (events & EPOLLOUT) {
> >  			/* Paired with fput in dma_buf_poll_cb */
> > -			get_file(dmabuf->file);
> > -
> > -			if (!dma_buf_poll_add_cb(resv, true, dcb))
> > +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
> > +			    !dma_buf_poll_add_cb(resv, true, dcb))
> >  				/* No callback queued, wake up any other waiters */
> 
> Don't think this is sane at all. I'm assuming you meant:
> 
> 	atomic_long_inc_not_zero(&dmabuf->file->f_count);

Oops, yes, sorry. I was typed from memory instead of copy/paste.

> but won't fly as you're not under RCU in the first place. And what
> protects it from being long gone before you attempt this anyway? This is
> sane way to attempt to fix it, it's completely opposite of what sane ref
> handling should look like.
> 
> Not sure what the best fix is here, seems like dma-buf should hold an
> actual reference to the file upfront rather than just stash a pointer
> and then later _hope_ that it can just grab a reference. That seems
> pretty horrible, and the real source of the issue.

AFAICT, epoll just doesn't hold any references at all. It depends,
I think, on eventpoll_release() (really eventpoll_release_file())
synchronizing with epoll_wait() (but I don't see how this happens, and
the race seems to be against ep_item_poll() ...?)

I'm really confused about how eventpoll manages the lifetime of polled
fds.

> > Due to this issue I've proposed fixing get_file() to detect pathological states:
> > https://lore.kernel.org/lkml/20240502222252.work.690-kees@kernel.org/
> 
> I don't think this would catch this case, as the memory could just be
> garbage at this point.

It catches it just fine! :) I tested it against the published PoC.

And for cases where further allocations have progressed far enough to
corrupt the freed struct file and render the check pointless, nothing
different has happened than what happens today. At least now we have a
window to catch the situation across the time frame before it is both
reallocated _and_ the contents at the f_count offset gets changed to
non-zero.

-- 
Kees Cook
