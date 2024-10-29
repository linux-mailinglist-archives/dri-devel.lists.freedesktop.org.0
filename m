Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C7F9B4F66
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 17:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88BE10E6A3;
	Tue, 29 Oct 2024 16:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R6zVuJBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0C210E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 16:35:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43193678216so43540195e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730219698; x=1730824498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+u5Ty9K6ARrub3VQWTBAHNUC9+t1wfrSDcH0T/9nwt8=;
 b=R6zVuJBGhoYYF/TpmGs6/86TQGSIJ9HEr3qLOvGuvLx5bNYZzsJ4cYTgKR9TKVlPKv
 oTFNf8+uQlU7hft4k0YK+swwnqlIaHs3Uxp3oxPnUkzgyiC9HxEsuWKEOtppA1O1/9Vv
 Mx8KMrF+a/v++5wJ39CHdU0RGIBCIMhd+dB45rfsJdUhoYzCqlNH+lpbZrHl95iZ2oiF
 g2lHAjNWtAeWA3VT5Y2MVd9AM4SzCete25mqTlcAx8i785GZLY9ibijVtUAaIXlDh7Jz
 N1ASx6pbbc5No4MCc8PX9ER2zQ0iDBnvLLdOS1SwGgkIRs9rObSD1a7VCL/XzHGYC/dR
 Gb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730219698; x=1730824498;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+u5Ty9K6ARrub3VQWTBAHNUC9+t1wfrSDcH0T/9nwt8=;
 b=PHVLrvwusxcbAJRWDu0oggnrUGWVEAXs1iI2GM+pUMpVLn7ZkletAy8lFb/oOb+xOh
 H9dT4xvWoQoueyfLn2TCUTyiKG94xnmCBBeyp4z+1q4W0n1v0rDlvCV4Ko6kq+UAEuja
 6twNV4F5UlgyEk2Q2AQGw2rEuPfrfw1o5wjwpefAz8gydO8zXddqrByyrEkwKLHr5gV0
 Ezc2q3zSB2GX4cj1eYCghDl6TAbU9cB+HAy/+hY7A9fiQB8zjCwfROHMRJx/cKNbYzkz
 E2X9cTvPGvlwJQn9lD9Y7NH6tOecs/FaeHrHKg5AvKWZi4YEnVqwTqZpXazk6EMf7LnN
 V5Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoM17yzPXDoME/KIqdOsqlEUjrZFK9EawCyAo7fEPP1EvhmBIulwMS86w7dYdJZ5uZtheDZpU9flQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvkZaYi/gRBT03evbGi2amn+CZk91+xp/kzfqPuV8pF6K2fsOM
 aZErDALo2Hu7B0yGFHc2kAqVsUpbu3AJObn2rNEKcNf2g0osu91l
X-Google-Smtp-Source: AGHT+IFGeVvWfs2GbjjZ9Xw4mTo06zaHYge/2mupAU5QXpyOurso+KUqnM1MIi7YA6r0q9wC6cUBrQ==
X-Received: by 2002:a5d:5146:0:b0:37d:5496:290c with SMTP id
 ffacd0b85a97d-380610f255fmr9152980f8f.7.1730219698083; 
 Tue, 29 Oct 2024 09:34:58 -0700 (PDT)
Received: from [192.168.42.53] ([148.252.132.209])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b7124csm13055685f8f.81.2024.10.29.09.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 09:34:57 -0700 (PDT)
Message-ID: <9a14e132-6a13-4077-973d-b1eca417e563@gmail.com>
Date: Tue, 29 Oct 2024 16:35:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] net: generalise net_iov chunk owners
To: Christoph Hellwig <hch@infradead.org>
Cc: David Wei <dw@davidwei.uk>, io-uring@vger.kernel.org,
 netdev@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, David Ahern <dsahern@kernel.org>,
 Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <stfomichev@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20241016185252.3746190-1-dw@davidwei.uk>
 <20241016185252.3746190-3-dw@davidwei.uk> <ZxijxiqNGONin3IY@infradead.org>
 <264c8f95-2a69-4d49-8af6-d035fa890ef1@gmail.com>
 <ZxoSBhC6sMEbXQi8@infradead.org>
 <a6864bf1-dd88-4ae0-bc67-b88bb4c17b44@gmail.com>
 <ZxpwgLRNsrTBmJEr@infradead.org>
 <de9ae678-258d-4f68-86e1-59d5eb4b70a4@gmail.com>
 <Zx9_iYLVnkyE05Hh@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <Zx9_iYLVnkyE05Hh@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 10/28/24 12:11, Christoph Hellwig wrote:
> On Thu, Oct 24, 2024 at 05:40:02PM +0100, Pavel Begunkov wrote:
>> On 10/24/24 17:06, Christoph Hellwig wrote:
>>> On Thu, Oct 24, 2024 at 03:23:06PM +0100, Pavel Begunkov wrote:
>>>>> That's not what this series does.  It adds the new memory_provider_ops
>>>>> set of hooks, with once implementation for dmabufs, and one for
>>>>> io_uring zero copy.
>>>>
>>>> First, it's not a _new_ abstraction over a buffer as you called it
>>>> before, the abstraction (net_iov) is already merged.
>>>
>>> Umm, it is a new ops vector.
>>
>> I don't understand what you mean. Callback?
> 
> struct memory_provider_ops.  It's a method table or ops vetor, no
> callbacks involved.

I see, the reply is about your phrase about additional memory
abstractions:

"... don't really need to build memory buffer abstraction over
memory buffer abstraction."

>> Then please go ahead and take a look at the patchset in question
>> and see how much of dmabuf handling is there comparing to pure
>> networking changes. The point that it's a new set of API and lots
>> of changes not related directly to dmabufs stand. dmabufs is useful
>> there as an abstraction there, but it's a very long stretch saying
>> that the series is all about it.
> 
> I did take a look, that's why I replied.
> 
>>>> on an existing network specific abstraction, which are not restricted to
>>>> pages or anything specific in the long run, but the flow of which from
>>>> net stack to user and back is controlled by io_uring. If you worry about
>>>> abuse, io_uring can't even sanely initialise those buffers itself and
>>>> therefore asking the page pool code to do that.
>>>
>>> No, I worry about trying to io_uring for not good reason. This
>>
>> It sounds that the argument is that you just don't want any
>> io_uring APIs, I don't think you'd be able to help you with
>> that.
> 
> No, that's complete misinterpreting what I'm saying.  Of course an
> io_uring API is fine.  But tying low-level implementation details to
> to is not.

It works with low level concepts, i.e. private NIC queues, but it does
that through well established abstractions (page pool) already extended
for such cases. There is no directly going into a driver / hardware and
hard coding queue allocation, some memory injection or anything similar.
The user api has to embrace the hardware limitations, right, there is no
way around it without completely changing the approach and performance
and/or applicability. And queues as first class citizens is not a new
concept in general.

>>> pre-cludes in-kernel uses which would be extremly useful for
>>
>> Uses of what? devmem TCP is merged, I'm not removing it,
>> and the net_iov abstraction is in there, which can be potentially
>> be reused by other in-kernel users if that'd even make sense.
> 
> How when you are hardcoding io uring memory registrations instead
> of making them a generic dmabuf?  Which btw would also really help

If you mean internals, making up a dmabuf that has never existed in the
picture in the first place is not cleaner or easier in any way. If that
changes, e.g. there is more code to reuse in the future, we can unify it
then.

If that's about user api, you've just mentioned before that it can be
pages / user pointers. As to why it goes through io_uring, I explained
it before, but in short, it gives a better api for io_uring users, we
can avoid creating a yet another file (netlink socket) and keeping it
around, that way we don't need to synchronise with the nl socket and/or
trying to steal memory from it, and the devmem api is also too
monolithic for such purposes, so even that would need to change, i.e.
splitting queue and memory registration.

> with pre-registering the memry with the iommu to get good performance
> in IOMMU-enabled setups.

The page pool already does that just like it handles the normal
path without providers.

-- 
Pavel Begunkov
