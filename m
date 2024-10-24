Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC939AEC5E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 18:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98DB10E2A4;
	Thu, 24 Oct 2024 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KJ6/ZcAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB2910E2A4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 16:39:31 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso1371566e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 09:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729787969; x=1730392769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BZaWT76KQAhb/SdvegV291/fD/GVxdusDKkbeX6aAyw=;
 b=KJ6/ZcAWD4G7hcv5MOfPv9+Cn8M5OLde/gsReCKgJV5WzmhhqaGTzVLKNLxJnBUXDh
 l8bwXdOtX+lreIKaqttvN3H2P8pzAmIyNwOTENpykD+O6WIkzPgx7Mv6A8lAZ/YicvQa
 m5KYN6rs6WFNCs11n0i0lvxdOWEPF8Hn0/TiCIPYEBd2272OCaczxTqBf8KODnnxI/k5
 NuAEr7f2+pFhvFnWhJNySgv0tWAUhu72jeRrLxJIsXW/y3zPdu0kzoe5jJXMciHyoouW
 7DTPZocHScsyi7mfJZSurrbeS60aVuIWKzSRY9z3O3nhmBHMo0B6GrGa7f8HH4j4UWUX
 DE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729787969; x=1730392769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZaWT76KQAhb/SdvegV291/fD/GVxdusDKkbeX6aAyw=;
 b=IWqSEVvod160v2znXnxxL+RSKW+66+C5r8aE3yS7HrOBpp29yZ8d//8ixIwKHkDfyu
 UjSJ6XzOFPoFM3OM6v1d9Qtbfi8WO2ORNkJRHeGllxMq+4hsmF4Xzw0gJj8/6WgjQhg0
 Zx6k/WqQtSi0OuL33tT2/Nuv4o8sii6eV9dtbHopqiA8CeEzVdUo3RbJHWfSNlp5Z72s
 lYuOiwaf0HnESfgjMk/rqRyKuYbq57TocxB4cb3y7OSBIyPNxmabApWaob14iP+roSXU
 pEywUq5KCwUZpkwaho+S0njs7MYQ3oQXYLJcvQXZvaP2xI7nXIdKnWcRFLPpKp5+lPl3
 EoEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSv4USl1nL13EJ9HT+yVZsT1m49/YMO8xZGWjTfKMGdS2VdgUUw9Q9PMZiYlQkF93cWodH+J1lyZU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXo66RFnkwW5Lcb7AIh75lPEgUS0bMHFSAFx5txYknU3TLoStg
 MI+m38U9ZT/L4V8G2RUhyL5tsUlwPxOl7McGpdjy4pgo/mwlGmtI
X-Google-Smtp-Source: AGHT+IGM2QIH1fkpvyL5zXwnzN1P9Fzl21jQNKRhYToOjYGnjYn96eDsd7Ox+gI2AzCZSLVIBZlJbw==
X-Received: by 2002:a05:6512:281b:b0:539:dca9:19a2 with SMTP id
 2adb3069b0e04-53b23e69518mr1724653e87.39.1729787968611; 
 Thu, 24 Oct 2024 09:39:28 -0700 (PDT)
Received: from [192.168.42.27] ([85.255.233.224])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d638fsm645929366b.18.2024.10.24.09.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 09:39:28 -0700 (PDT)
Message-ID: <de9ae678-258d-4f68-86e1-59d5eb4b70a4@gmail.com>
Date: Thu, 24 Oct 2024 17:40:02 +0100
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
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZxpwgLRNsrTBmJEr@infradead.org>
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

On 10/24/24 17:06, Christoph Hellwig wrote:
> On Thu, Oct 24, 2024 at 03:23:06PM +0100, Pavel Begunkov wrote:
>>> That's not what this series does.  It adds the new memory_provider_ops
>>> set of hooks, with once implementation for dmabufs, and one for
>>> io_uring zero copy.
>>
>> First, it's not a _new_ abstraction over a buffer as you called it
>> before, the abstraction (net_iov) is already merged.
> 
> Umm, it is a new ops vector.

I don't understand what you mean. Callback?

>> Second, you mention devmem TCP, and it's not just a page pool with
>> "dmabufs", it's a user API to use it and other memory agnostic
>> allocation logic. And yes, dmabufs there is the least technically
>> important part. Just having a dmabuf handle solves absolutely nothing.
> 
> It solves a lot, becaue it provides a proper abstraction.

Then please go ahead and take a look at the patchset in question
and see how much of dmabuf handling is there comparing to pure
networking changes. The point that it's a new set of API and lots
of changes not related directly to dmabufs stand. dmabufs is useful
there as an abstraction there, but it's a very long stretch saying
that the series is all about it.

> 
>>> So you are precluding zero copy RX into anything but your magic
>>> io_uring buffers, and using an odd abstraction for that.
>>
>> Right io_uring zero copy RX API expects transfer to happen into io_uring
>> controlled buffers, and that's the entire idea. Buffers that are based
>> on an existing network specific abstraction, which are not restricted to
>> pages or anything specific in the long run, but the flow of which from
>> net stack to user and back is controlled by io_uring. If you worry about
>> abuse, io_uring can't even sanely initialise those buffers itself and
>> therefore asking the page pool code to do that.
> 
> No, I worry about trying to io_uring for not good reason. This

It sounds that the argument is that you just don't want any
io_uring APIs, I don't think you'd be able to help you with
that.

> pre-cludes in-kernel uses which would be extremly useful for

Uses of what? devmem TCP is merged, I'm not removing it,
and the net_iov abstraction is in there, which can be potentially
be reused by other in-kernel users if that'd even make sense.

> network storage drivers, and it precludes device memory of all
> kinds.

You can't use page pools to allocate for a storage device, it's
a network specific allocator. You can get a dmabuf around that
device's memory and zero copy into it, but there is no problem
with that. Either use devmem TCP or wait until io_uring adds
support for dmabufs, which is, again, trivial.

>> I'm even more confused how that would help. The user API has to
>> be implemented and adding a new dmabuf gives nothing, not even
>> mentioning it's not clear what semantics of that beast is
>> supposed to be.
>>
> 
> The dma-buf maintainers already explained to you last time
> that there is absolutely no need to use the dmabuf UAPI, you
> can use dma-bufs through in-kernel interfaces just fine.

You can, even though it's not needed and I don't see how
it'd be useful, but you're missing the point. A new dmabuf
implementation doesn't implement the uapi we need nor it
helps to talk to the net layer.

-- 
Pavel Begunkov
