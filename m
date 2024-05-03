Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A80F8BB46C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 22:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A1010F8FD;
	Fri,  3 May 2024 19:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FUFSXm9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA8310F8FD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:59:54 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1e65a1370b7so307425ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714766394; x=1715371194;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kXbuS/Hft89FN1tBWD1yXoLgj43aVjsF859uRSyCcO8=;
 b=FUFSXm9is/M4w8cseUQZ0cHkYvp0g3VEE2axwgO+oXI37ffctZPubaWArrg53N44TY
 e/hwxWnj4afSH0u6VW7C2Xmx5N26euNY1KuTFuyCjaAK7gwkTDsX7wQju21lqUFrFGHq
 JqZAJXXgxIA0SYq6XAhiGcUDBAnS8x+wRfMds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714766394; x=1715371194;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXbuS/Hft89FN1tBWD1yXoLgj43aVjsF859uRSyCcO8=;
 b=gzv0Fqy/21DodA2KtS67zyivaOypVkoW/ptudVOOSulTlKrVwc0KnYfi68LYpy+RvX
 aRr/TNvVyeL8lYJJA+BxPHi239MFkU7NGXlMecSgI3jrpnb519lFL/6FYiLWruLeMrlx
 6O92l/rwYKxVF+YZfpBmiWJXSnXJDSOlnBfEAWIrjcsMJyTFO9vsGO7J51YYzfsRJhfY
 +LQQxLngtN35Qy6yHQJwaTroRNvt6jHW9wyQfZPiYAXRBXzw5RT0U7JjwbPYaKSlnaB7
 jW4u1cOygSgoog7wsJiYw31SY9BWw0YTuMuPhoe91EbrUJkpxMfZKo+mQJq8bpD16xEd
 eQGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV24dAcLHFxoBwyxeT2jUbxxVL0tAJ8waG+js7pag1EWQ13KXnF2REhBU6P5Vvc6PdWgwQnJvM3Xc5TJxPrpoUAEbB5pKV6HXdDOYpjMK+t
X-Gm-Message-State: AOJu0YxPTEQW+vc7rlelXgmAanWwH1SfT4MKEX4hsXLCJ3z9Es+4ZvVC
 8YHJWUCBquoHXpXvoSjO51E9sdq/mWzXkGf9VEgGpp4mTIysYkkjNIppWgORYg==
X-Google-Smtp-Source: AGHT+IF7CJaHehS47rwSXtmiD/0Qq2/Az5cGhZ/XA6S28lF8JjtukRtodBuIYdyT740U/+9Oz5YhZA==
X-Received: by 2002:a17:902:d58d:b0:1eb:d79a:c111 with SMTP id
 k13-20020a170902d58d00b001ebd79ac111mr5316118plh.4.1714766394020; 
 Fri, 03 May 2024 12:59:54 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3651440plh.43.2024.05.03.12.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 12:59:52 -0700 (PDT)
Date: Fri, 3 May 2024 12:59:52 -0700
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
Message-ID: <202405031237.B6B8379@keescook>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
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

On Fri, May 03, 2024 at 01:35:09PM -0600, Jens Axboe wrote:
> On 5/3/24 1:22 PM, Kees Cook wrote:
> > On Fri, May 03, 2024 at 12:49:11PM -0600, Jens Axboe wrote:
> >> On 5/3/24 12:26 PM, Kees Cook wrote:
> >>> Thanks for doing this analysis! I suspect at least a start of a fix
> >>> would be this:
> >>>
> >>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> >>> index 8fe5aa67b167..15e8f74ee0f2 100644
> >>> --- a/drivers/dma-buf/dma-buf.c
> >>> +++ b/drivers/dma-buf/dma-buf.c
> >>> @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
> >>>  
> >>>  		if (events & EPOLLOUT) {
> >>>  			/* Paired with fput in dma_buf_poll_cb */
> >>> -			get_file(dmabuf->file);
> >>> -
> >>> -			if (!dma_buf_poll_add_cb(resv, true, dcb))
> >>> +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
> >>> +			    !dma_buf_poll_add_cb(resv, true, dcb))
> >>>  				/* No callback queued, wake up any other waiters */
> >>
> >> Don't think this is sane at all. I'm assuming you meant:
> >>
> >> 	atomic_long_inc_not_zero(&dmabuf->file->f_count);
> > 
> > Oops, yes, sorry. I was typed from memory instead of copy/paste.
> 
> Figured :-)
> 
> >> but won't fly as you're not under RCU in the first place. And what
> >> protects it from being long gone before you attempt this anyway? This is
> >> sane way to attempt to fix it, it's completely opposite of what sane ref
> >> handling should look like.
> >>
> >> Not sure what the best fix is here, seems like dma-buf should hold an
> >> actual reference to the file upfront rather than just stash a pointer
> >> and then later _hope_ that it can just grab a reference. That seems
> >> pretty horrible, and the real source of the issue.
> > 
> > AFAICT, epoll just doesn't hold any references at all. It depends,
> > I think, on eventpoll_release() (really eventpoll_release_file())
> > synchronizing with epoll_wait() (but I don't see how this happens, and
> > the race seems to be against ep_item_poll() ...?)
> >
> > I'm really confused about how eventpoll manages the lifetime of polled
> > fds.
> 
> epoll doesn't hold any references, and it's got some ugly callback to
> deal with that. It's not ideal, nor pretty, but that's how it currently
> works. See eventpoll_release() and how it's called. This means that
> epoll itself is supposedly safe from the file going away, even though it
> doesn't hold a reference to it.

Right -- what remains unclear to me is how struct file lifetime is
expected to work in the struct file_operations::poll callbacks. Because
using get_file() there looks clearly unsafe...

> Except that in this case, the file is already gone by the time
> eventpoll_release() is called. Which presumably is some interaction with
> the somewhat suspicious file reference management that dma-buf is doing.
> But I didn't look into that much, outside of noting it looks a bit
> suspect.

Not yet, though. Here's (one) race state from the analysis. I added lines
for the dma_fence_add_callback()/dma_buf_poll_cb() case, since that's
the case that would escape any eventpoll_release/epoll_wait
synchronization (if it exists?):

close(dmabuf->file)
__fput_sync (f_count == 1, last ref)
f_count-- (f_count == 0 now)
__fput
                                     epoll_wait
                                     vfs_poll(dmabuf->file)
                                     get_file(dmabuf->file)(f_count == 1)
                                     dma_fence_add_callback()
eventpoll_release
dmabuf->file deallocation
                                     dma_buf_poll_cb()
                                     fput(dmabuf->file) (f_count == 1)
                                     f_count--
                                     dmabuf->file deallocation

Without fences to create a background callback, we just do a double-free:

close(dmabuf->file)
__fput_sync (f_count == 1, last ref)
f_count-- (f_count == 0 now)
__fput
                                     epoll_wait
                                     vfs_poll(dmabuf->file)
                                     get_file(dmabuf->file)(f_count == 1)
                                     dma_buf_poll_cb()
                                     fput(dmabuf->file) (f_count == 1)
                                     f_count--
                                     eventpoll_release
                                     dmabuf->file deallocation
eventpoll_release
dmabuf->file deallocation


get_file(), via epoll_wait()->vfs_poll()->dma_buf_poll(), has raised
f_count again. Then eventpoll_release() is doing things to remove
dmabuf->file from the eventpoll lists, but I *think* this is synchronized
so that an epoll_wait() will only call .poll handlers with a valid
(though possibly f_count==0) file, but I can't figure out where that
happens. (If it's not happening, we have a much bigger problem, but I
imagine we'd see massive corruption all the time, which we don't.)

So, yeah, I can't figure out how eventpoll_release() and epoll_wait()
are expected to behave safely for .poll handlers.

Regardless, for the simple case: it seems like it's just totally illegal
to use get_file() in a poll handler. Is this known/expected? And if so,
how can dmabuf possibly deal with that?

-- 
Kees Cook
