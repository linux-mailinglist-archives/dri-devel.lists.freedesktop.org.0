Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62180ADF3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:35:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B7910EB26;
	Fri,  8 Dec 2023 20:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1190110EB23
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:35:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso21683945e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 12:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702067726; x=1702672526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5WPzggr+JIIcZt9j2+N/vNpUQEAOa3KMecMg/7uW9IE=;
 b=PFWJ9SzMR4XRmB3MNGyNA7s+/Ew63zD7i03LJ58sPCWTSx7DVVPui448ScYwMxYYwf
 zsh4dhJ1HZsDiEPPPK5wLY6q2HKCnNtzQVXtlGve+FczbBzJew8+/Mj39hmIT1K6LZRW
 /1uUPL2xkZ5AcGozaySFcIJb+JzphqbhQDh3Xb8dz1QnFrb5WNV8V2x4uzAPTpssh1DF
 3Ay21rgnoO71xGrycBqVqU85sdj/zqPoqvlcN7Gvy4dD6xPWjIUCkscQvcdzco0NVXue
 vBsHoPgIDgK4IzV8QThW5rsM9dZVckhmoWyMmw7d/7x5pCpjzAwBEPZU+5TiZH/LjG2Z
 /4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702067726; x=1702672526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WPzggr+JIIcZt9j2+N/vNpUQEAOa3KMecMg/7uW9IE=;
 b=AApzJr5ih7LdkrC4p2FVN+lFrEbT6OV09S2SEd1hdN2KC5eFyQL/5hmblK6MF2bIod
 3he7glW9Wm4U+nHK+HIH+sBZAeLrav0f4hIzRI0OHb0nBscvao3jEUkfMXmmgMcxvdov
 CM2Z0Bf38SoH8nemBEbMq8wvHROrq0doEQOry1z/e14bd1sA4sDuxBdIn3NbnIrcoxEI
 nb5q2LBU3pWUbCwaBkOy97NxWaXGmbyv0hlNI4P5h+TltexjuibwwI4zXf1wLhHeaxLk
 alWy5mkaJOe3BO99mIgVCQqV/hK/lrsyKpqCHL/Ug+GsWlJYMG8WF38fS2nertcILTwV
 L7KA==
X-Gm-Message-State: AOJu0YzkDGtGa1F85yL4UwYTTAS1gVCiOFElFofsttqD2iXtaMHeUJua
 G5Jyx1snIsLfzMrWW5cowwI=
X-Google-Smtp-Source: AGHT+IHdwbAlc9QaVuOmMS3uETMk6NFLdZw5yIXklzl91LInkNaoZgu8mRrfJeijBbH68GTPvWp7PQ==
X-Received: by 2002:a05:600c:3093:b0:40b:5e21:bdbe with SMTP id
 g19-20020a05600c309300b0040b5e21bdbemr287462wmn.77.1702067725916; 
 Fri, 08 Dec 2023 12:35:25 -0800 (PST)
Received: from [192.168.8.100] ([85.255.232.89])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d434a000000b0033342338a24sm2778357wrr.6.2023.12.08.12.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 12:35:25 -0800 (PST)
Message-ID: <7e7c2c21-12ba-41c1-92c4-f32a3906f3ee@gmail.com>
Date: Fri, 8 Dec 2023 20:28:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Content-Language: en-US
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Stanislav Fomichev <sdf@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/6/23 22:55, Willem de Bruijn wrote:
> On Mon, Nov 6, 2023 at 2:34 PM Stanislav Fomichev <sdf@google.com> wrote:
>>
>> On 11/06, Willem de Bruijn wrote:
>>>>> IMHO, we need a better UAPI to receive the tokens and give them back to
>>>>> the kernel. CMSG + setsockopt(SO_DEVMEM_DONTNEED) get the job done,
>>>>> but look dated and hacky :-(
>>>>>
>>>>> We should either do some kind of user/kernel shared memory queue to
>>>>> receive/return the tokens (similar to what Jonathan was doing in his
>>>>> proposal?)
>>>>
>>>> I'll take a look at Jonathan's proposal, sorry, I'm not immediately
>>>> familiar but I wanted to respond :-) But is the suggestion here to
>>>> build a new kernel-user communication channel primitive for the
>>>> purpose of passing the information in the devmem cmsg? IMHO that seems
>>>> like an overkill. Why add 100-200 lines of code to the kernel to add
>>>> something that can already be done with existing primitives? I don't
>>>> see anything concretely wrong with cmsg & setsockopt approach, and if
>>>> we switch to something I'd prefer to switch to an existing primitive
>>>> for simplicity?
>>>>
>>>> The only other existing primitive to pass data outside of the linear
>>>> buffer is the MSG_ERRQUEUE that is used for zerocopy. Is that
>>>> preferred? Any other suggestions or existing primitives I'm not aware
>>>> of?
>>>>
>>>>> or bite the bullet and switch to io_uring.
>>>>>
>>>>
>>>> IMO io_uring & socket support are orthogonal, and one doesn't preclude
>>>> the other. As you know we like to use sockets and I believe there are
>>>> issues with io_uring adoption at Google that I'm not familiar with
>>>> (and could be wrong). I'm interested in exploring io_uring support as
>>>> a follow up but I think David Wei will be interested in io_uring
>>>> support as well anyway.
>>>
>>> I also disagree that we need to replace a standard socket interface
>>> with something "faster", in quotes.
>>>
>>> This interface is not the bottleneck to the target workload.
>>>
>>> Replacing the synchronous sockets interface with something more
>>> performant for workloads where it is, is an orthogonal challenge.
>>> However we do that, I think that traditional sockets should continue
>>> to be supported.
>>>
>>> The feature may already even work with io_uring, as both recvmsg with
>>> cmsg and setsockopt have io_uring support now.
>>
>> I'm not really concerned with faster. I would prefer something cleaner :-)
>>
>> Or maybe we should just have it documented. With some kind of path
>> towards beautiful world where we can create dynamic queues..
> 
> I suppose we just disagree on the elegance of the API.
> 
> The concise notification API returns tokens as a range for
> compression, encoding as two 32-bit unsigned integers start + length.
> It allows for even further batching by returning multiple such ranges
> in a single call.

FWIW, nothing prevents io_uring from compressing ranges. The io_uring
zc RFC returns {offset, size} as well, though at the moment the would
lie in the same page.

> This is analogous to the MSG_ZEROCOPY notification mechanism from
> kernel to user.
> 
> The synchronous socket syscall interface can be replaced by something
> asynchronous like io_uring. This already works today? Whatever

If you mean async io_uring recv, it does work. In short, internally
it polls the socket and then calls sock_recvmsg(). There is also a
feature that would make it return back to polling after sock_recvmsg()
and loop like this.

> asynchronous ring-based API would be selected, io_uring or otherwise,
> I think the concise notification encoding would remain as is.
> 
> Since this is an operation on a socket, I find a setsockopt the
> fitting interface.

-- 
Pavel Begunkov
