Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A417E7D3A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 16:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0CD10E0D2;
	Fri, 10 Nov 2023 15:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F1F10E089
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 14:28:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso2911559e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 06:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699626482; x=1700231282; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lmt2rY/D/CtOpYCyO0BO3zcHPLGs1JE21dVJIkVZZMQ=;
 b=kPe7JRY4H/+vRLRAoM7iMnPIQDNQYLDwxqdY9fvT4HZcrgGSOa1bUimr6G9LBi28rC
 wMD5mp96NM4LOWhAHHvUXw+ywpgAVtVHZP3+EZk547FjjgDIbkklotOmAn0DtoeSXwBi
 uOsTaAqx5tRxa+gGA3BzNTNZ31nrfzIgPLXJ7PuG+ieG62RevX9YMPZZY5yhNzXjFlg5
 KU6KWZy2a1phWSjtxWKGrGlSueOg3Zm4o1gusWDTVfrmkAxymoovThA8gEydYAh6x2gh
 ztHwY8MqVfpVXHUUCnApdwaZDlimQ2g9f5O1JAixPgb3GK8gTQPzbd/Fs2sl8edeIL+z
 7Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699626482; x=1700231282;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lmt2rY/D/CtOpYCyO0BO3zcHPLGs1JE21dVJIkVZZMQ=;
 b=w68eXJU8KHMohR0mhB4R5sgMf7/3OkypkwV2zT70mu8VpSoRJTR/yjxSyY+3hxsqSB
 Q1CIssKbShA+tP5P7Z//SanhB38gFJM1pl0LGHxbT2qKZwaD/HBVOt8hff7u0XXWBURL
 drWoHABWZ9ItK6JwnML00ddi0CrsUpqSOUQ9sQjMbECScHOo3ITWW6/ROu7xNpP1nTZB
 UNeTcHM7x5nwr3t2GfUiA9vtbTGuUVaLBn3nv6iqWd59ovgjt+dzyYRolv1urL6APMdq
 9PbWoZxHfFXs1eWUwRNAiiPWBWFipyqe1c/aqlkh8aHeHxtlqHLeNY2yoZmWrnbFO0h3
 /fzw==
X-Gm-Message-State: AOJu0Yy/JZDnr+cGs0CfeU15Sae+a2IUf8E2hcE9kgi+pEYA/W0nRKpq
 s7uvNjU4bPEN/WsKl3xKMIE=
X-Google-Smtp-Source: AGHT+IFTo4QzKaHnf9JDfRPiLL22Yfoec65OGGtyn4UX6ZCRDspRCqMEHROz96TnecT8pMjBqFvQ1w==
X-Received: by 2002:a19:7107:0:b0:507:9787:6776 with SMTP id
 m7-20020a197107000000b0050797876776mr3970775lfc.5.1699626481467; 
 Fri, 10 Nov 2023 06:28:01 -0800 (PST)
Received: from [192.168.8.100] ([148.252.132.154])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d6945000000b0032fdcbfb093sm2003034wrw.81.2023.11.10.06.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 06:28:00 -0800 (PST)
Message-ID: <3687e70e-29e6-34af-c943-8c0830ff92b8@gmail.com>
Date: Fri, 10 Nov 2023 14:26:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To: Mina Almasry <almasrymina@google.com>, David Ahern <dsahern@kernel.org>,
 David Wei <dw@davidwei.uk>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
 <CAHS8izMKDOw5_y2MLRfuJHs=ai+sZ6GF7Rg1NuR_JqONg-5u5Q@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAHS8izMKDOw5_y2MLRfuJHs=ai+sZ6GF7Rg1NuR_JqONg-5u5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 10 Nov 2023 15:02:01 +0000
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
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/7/23 23:03, Mina Almasry wrote:
> On Tue, Nov 7, 2023 at 2:55 PM David Ahern <dsahern@kernel.org> wrote:
>>
>> On 11/7/23 3:10 PM, Mina Almasry wrote:
>>> On Mon, Nov 6, 2023 at 3:44 PM David Ahern <dsahern@kernel.org> wrote:
>>>>
>>>> On 11/5/23 7:44 PM, Mina Almasry wrote:
>>>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>>>> index eeeda849115c..1c351c138a5b 100644
>>>>> --- a/include/linux/netdevice.h
>>>>> +++ b/include/linux/netdevice.h
>>>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>>>>>   };
>>>>>
>>>>>   #ifdef CONFIG_DMA_SHARED_BUFFER
>>>>> +struct page_pool_iov *
>>>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
>>>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
>>>>
>>>> netdev_{alloc,free}_dmabuf?
>>>>
>>>
>>> Can do.
>>>
>>>> I say that because a dmabuf can be host memory, at least I am not aware
>>>> of a restriction that a dmabuf is device memory.
>>>>
>>>
>>> In my limited experience dma-buf is generally device memory, and
>>> that's really its use case. CONFIG_UDMABUF is a driver that mocks
>>> dma-buf with a memfd which I think is used for testing. But I can do
>>> the rename, it's more clear anyway, I think.
>>
>> config UDMABUF
>>          bool "userspace dmabuf misc driver"
>>          default n
>>          depends on DMA_SHARED_BUFFER
>>          depends on MEMFD_CREATE || COMPILE_TEST
>>          help
>>            A driver to let userspace turn memfd regions into dma-bufs.
>>            Qemu can use this to create host dmabufs for guest framebuffers.
>>
>>
>> Qemu is just a userspace process; it is no way a special one.
>>
>> Treating host memory as a dmabuf should radically simplify the io_uring
>> extension of this set.
> 
> I agree actually, and I was about to make that comment to David Wei's
> series once I have the time.
> 
> David, your io_uring RX zerocopy proposal actually works with devmem
> TCP, if you're inclined to do that instead, what you'd do roughly is
> (I think):
That would be a Frankenstein's monster api with no good reason for it.
You bind memory via netlink because you don't have a proper context to
work with otherwise, io_uring serves as the context with a separate and
precise abstraction around queues. Same with dmabufs, it totally makes
sense for device memory, but wrapping host memory into a file just to
immediately unwrap it back with no particular benefits from doing so
doesn't seem like a good uapi. Currently, the difference will be
hidden by io_uring.

And we'd still need to have a hook in pp's get page to grab buffers from
the buffer ring instead of refilling via SO_DEVMEM_DONTNEED and a
callback for when skbs are dropped. It's just instead of a new pp ops
it'll be a branch in the devmem path. io_uring might want to use the
added iov format in the future for device memory or even before that,
io_uring doesn't really care whether it's pages or not.

It's also my big concern from how many optimisations it'll fence us off.
With the current io_uring RFC I can get rid of all buffer atomic
refcounting and replace it with a single percpu counting per skb.
Hopefully, that will be doable after we place it on top of pp providers.


> - Allocate a memfd,
> - Use CONFIG_UDMABUF to create a dma-buf out of that memfd.
> - Bind the dma-buf to the NIC using the netlink API in this RFC.
> - Your io_uring extensions and io_uring uapi should work as-is almost
> on top of this series, I think.
> 
> If you do this the incoming packets should land into your memfd, which
> may or may not work for you. In the future if you feel inclined to use
> device memory, this approach that I'm describing here would be more
> extensible to device memory, because you'd already be using dma-bufs
> for your user memory; you'd just replace one kind of dma-buf (UDMABUF)
> with another.
> 
>> That the io_uring set needs to dive into
>> page_pools is just wrong - complicating the design and code and pushing
>> io_uring into a realm it does not need to be involved in.

I disagree. How does it complicate it? io_uring will be just a yet another
provider implementing the callbacks of the API created for such use cases
and not changing common pp/net bits. The rest of code is in io_uring
implementing interaction with userspace and other usability features, but
there will be anyway some amount of code if we want to have a convenient
and performant api via io_uring.


>>
>> Most (all?) of this patch set can work with any memory; only device
>> memory is unreadable.

-- 
Pavel Begunkov
