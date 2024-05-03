Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74C98BB42A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CAD113208;
	Fri,  3 May 2024 19:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="zFYRG5+h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FE5113208
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:35:12 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2b432d0252cso20256a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 12:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1714764911; x=1715369711;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORetLTXl3HzmbjljZHEUgf3Mmr/eaSDx8Jozq/iEtsM=;
 b=zFYRG5+hfg+2ZlGYWiak2Z3iBlT55TOZ+ksoD70VeryY+PxCZN8waYwmvC44thRv6e
 4pf5Ano2jW3XVGu0WrpGjTS4cbWwqiWKYhvW9ODxlN2l++CteVqoUiOEntjywZRXjZUx
 d+KJIpEk7FhVfK+lcSOSwZTNiTH1urKaRMwq34j+RENLDlsn7xqvmXRyw5uwbQ8ULRlv
 mOHcG4U5ymO4aNKUcIYF8ED5rr9aiT9wMPnAnL0fMrgNM1a/xpBlC7f5lSUCmLX24rzX
 VurxOzI2eS/8kM6gPEkTPz0LYvVLtKvW2dZ1lawxreg2uuvxxlhGDS/HSb0KQHx0wCz7
 ntKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714764911; x=1715369711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ORetLTXl3HzmbjljZHEUgf3Mmr/eaSDx8Jozq/iEtsM=;
 b=tfSwvhqvIFdRkw78Cd6BYlpRQN5RxssbihbfRk9m3JNNqrDK7nXSF2m/Ge9bOpT8eW
 bJNBuMGekPAyOhAquIJKzAk7QzPc6HweQdHxlhlaQINBipiKKIyRMR/ekp+XmZN6AUz1
 PNYAZreEigm+zF4hVyFCCr+ujhebAZZPzYBJD0ccqXkG/W6+lGRolSMAVbzqpRQi/kLT
 my4qhD5cBIJ94p4CAKdZJdWLL+ozaZHqRfiXvaxBDC5AziQA265pC/KODZZ0+NV/3sw3
 BKKc1oD3WxnjYARuFzoAo/U7pCzURDQR4vH/nHwtj7Xdb7IsLrfe/70ksDIZRaR3qTlT
 zLiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr5SY6zUzneYkzbFKyAb+7WgZApe03HhfltPsG2/3OnbE9Se4CrnvE2Q142veSv3xNDI7wdL0UMIKhOlDBuyKJZkAqu8+mhBEdxfOtwHev
X-Gm-Message-State: AOJu0YzAtGjfXV84RuEg5uEFqIydnSnkl1yMSNc4cML75alvL72PXZoN
 cWFYcS6U4bUp+37SGDkbILCRUCyPzzG817gL2ifM14SYwNRADGLTnpRufgjlxMs=
X-Google-Smtp-Source: AGHT+IHPB1IZ4O2sSxiGYAZKvpeGjbdnZ2bAwpyCrMWAsjHJbfq5KyMCcWf/Ef7me/A0cgN11ffW+A==
X-Received: by 2002:aa7:880c:0:b0:6ec:ef1c:5c55 with SMTP id
 c12-20020aa7880c000000b006ecef1c5c55mr3736637pfo.2.1714764911345; 
 Fri, 03 May 2024 12:35:11 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.194])
 by smtp.gmail.com with ESMTPSA id
 gx14-20020a056a001e0e00b006f44be6cef2sm1664133pfb.114.2024.05.03.12.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 12:35:10 -0700 (PDT)
Message-ID: <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
Date: Fri, 3 May 2024 13:35:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
To: Kees Cook <keescook@chromium.org>
Cc: Bui Quang Minh <minhquangbui99@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Laura Abbott <laura@labbott.name>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <202405031207.9D62DA4973@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 5/3/24 1:22 PM, Kees Cook wrote:
> On Fri, May 03, 2024 at 12:49:11PM -0600, Jens Axboe wrote:
>> On 5/3/24 12:26 PM, Kees Cook wrote:
>>> Thanks for doing this analysis! I suspect at least a start of a fix
>>> would be this:
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 8fe5aa67b167..15e8f74ee0f2 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -267,9 +267,8 @@ static __poll_t dma_buf_poll(struct file *file, poll_table *poll)
>>>  
>>>  		if (events & EPOLLOUT) {
>>>  			/* Paired with fput in dma_buf_poll_cb */
>>> -			get_file(dmabuf->file);
>>> -
>>> -			if (!dma_buf_poll_add_cb(resv, true, dcb))
>>> +			if (!atomic_long_inc_not_zero(&dmabuf->file) &&
>>> +			    !dma_buf_poll_add_cb(resv, true, dcb))
>>>  				/* No callback queued, wake up any other waiters */
>>
>> Don't think this is sane at all. I'm assuming you meant:
>>
>> 	atomic_long_inc_not_zero(&dmabuf->file->f_count);
> 
> Oops, yes, sorry. I was typed from memory instead of copy/paste.

Figured :-)

>> but won't fly as you're not under RCU in the first place. And what
>> protects it from being long gone before you attempt this anyway? This is
>> sane way to attempt to fix it, it's completely opposite of what sane ref
>> handling should look like.
>>
>> Not sure what the best fix is here, seems like dma-buf should hold an
>> actual reference to the file upfront rather than just stash a pointer
>> and then later _hope_ that it can just grab a reference. That seems
>> pretty horrible, and the real source of the issue.
> 
> AFAICT, epoll just doesn't hold any references at all. It depends,
> I think, on eventpoll_release() (really eventpoll_release_file())
> synchronizing with epoll_wait() (but I don't see how this happens, and
> the race seems to be against ep_item_poll() ...?)
>
> I'm really confused about how eventpoll manages the lifetime of polled
> fds.

epoll doesn't hold any references, and it's got some ugly callback to
deal with that. It's not ideal, nor pretty, but that's how it currently
works. See eventpoll_release() and how it's called. This means that
epoll itself is supposedly safe from the file going away, even though it
doesn't hold a reference to it.

Except that in this case, the file is already gone by the time
eventpoll_release() is called. Which presumably is some interaction with
the somewhat suspicious file reference management that dma-buf is doing.
But I didn't look into that much, outside of noting it looks a bit
suspect.

>>> Due to this issue I've proposed fixing get_file() to detect pathological states:
>>> https://lore.kernel.org/lkml/20240502222252.work.690-kees@kernel.org/
>>
>> I don't think this would catch this case, as the memory could just be
>> garbage at this point.
> 
> It catches it just fine! :) I tested it against the published PoC.

Sure it _may_ catch the issue, but the memory may also just be garbage
at that point. Not saying it's a useless addition, outside of the usual
gripes of making the hot path slower, just that it won't catch all
cases. Which I guess is fine and expected.

> And for cases where further allocations have progressed far enough to
> corrupt the freed struct file and render the check pointless, nothing
> different has happened than what happens today. At least now we have a
> window to catch the situation across the time frame before it is both
> reallocated _and_ the contents at the f_count offset gets changed to
> non-zero.

Right.

-- 
Jens Axboe

