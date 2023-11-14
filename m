Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383D57EB484
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADB410E46D;
	Tue, 14 Nov 2023 16:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647110E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:11:05 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-66cfd35f595so29861376d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699978264; x=1700583064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WcBBKnTEqaoj3LxtGCYhc7t/cWobqHG+KSslQabs03I=;
 b=J0u3XrIlba1mFksuOGSxJaA408QArXvDPO83/gx4SyLcfGsrPd01hv80xZ2WoAA2Tn
 f4OE3k6piBVgYOpmi4bLjgPzodeSFXFOYHcf06YTUTZz3ow58SB8tM5TMcuV0Xc6SKYa
 gTnDFy3LT3S1QHdw1zSp1h3sOiwH25UoyAbw0Uzh7Q4m0+kfL2/1FJusS++Kf0adUWvT
 BVPs8w3acE9g/jPd/eBIKU55XhWmxBymkSzNhEbNbdRMebAFORgxOs55RPKSQE8Wu+jQ
 xG5V/MzvawhXf0QWTSXC5kiYgBgsySWu0bvJ8vjM4pPuSOO4gk08/hU0MYzCA5KHnSZJ
 mfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699978264; x=1700583064;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WcBBKnTEqaoj3LxtGCYhc7t/cWobqHG+KSslQabs03I=;
 b=TQTzkpm74NxJKCLjapmMxOPz+/ujSn6pRLNh4Y6vnGBSQjkgjh+NYqOBTXrh6jIhuE
 Z7T/kIYvHifmP5px5uhEIBXsztEKKXxoz3j8wdBfKOLzp1iw1DQkV07UyGuFgqnkrEWo
 FA91wjlPst+ra53El60N4zOUOT3BXyYdi9IOMkQcik4cI5PLLEu1A6sWO6jGxUkYRoXv
 s9QauVUnt2FVx5kMGrox8RLXUH4gCZcuVuLDUBXFYGIzk51MHnkWay/nk31FMqoDiikv
 jVcJJ2EFWwzumoIDe2wP8HnItJAxETA6TqNCp0AZ6kYknwBRQHajFV7fudMwam+V8oii
 +N0Q==
X-Gm-Message-State: AOJu0YyhmiXMKckoPeX8U2hh49YSWx4WfkHfDXldB+rMQqdGDgDMWtEm
 npRUyMc7pH7VrREC5WCxP+A=
X-Google-Smtp-Source: AGHT+IFP/S3WR7/gOKNC8Du/goDp8eEHlLIGAtwXreEQAWZa6gXfFFZ7r8yADmexKAwCka48pB7dfg==
X-Received: by 2002:a05:6214:1245:b0:66d:6af7:4571 with SMTP id
 r5-20020a056214124500b0066d6af74571mr4183692qvv.17.1699978264358; 
 Tue, 14 Nov 2023 08:11:04 -0800 (PST)
Received: from [172.25.81.254] ([12.186.190.1])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a0cf841000000b00656329bb3b1sm3023598qvo.10.2023.11.14.08.11.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 08:11:03 -0800 (PST)
Message-ID: <2aa9c139-eee8-c707-6e62-5415c26c2a1a@gmail.com>
Date: Tue, 14 Nov 2023 16:09:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To: David Ahern <dsahern@kernel.org>, Mina Almasry <almasrymina@google.com>,
 David Wei <dw@davidwei.uk>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
 <CAHS8izMKDOw5_y2MLRfuJHs=ai+sZ6GF7Rg1NuR_JqONg-5u5Q@mail.gmail.com>
 <3687e70e-29e6-34af-c943-8c0830ff92b8@gmail.com>
 <f59c200f-4659-4c71-8c83-4457d0b08fe1@kernel.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <f59c200f-4659-4c71-8c83-4457d0b08fe1@kernel.org>
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

On 11/11/23 17:19, David Ahern wrote:
> On 11/10/23 7:26 AM, Pavel Begunkov wrote:
>> On 11/7/23 23:03, Mina Almasry wrote:
>>> On Tue, Nov 7, 2023 at 2:55 PM David Ahern <dsahern@kernel.org> wrote:
>>>>
>>>> On 11/7/23 3:10 PM, Mina Almasry wrote:
>>>>> On Mon, Nov 6, 2023 at 3:44 PM David Ahern <dsahern@kernel.org> wrote:
>>>>>>
>>>>>> On 11/5/23 7:44 PM, Mina Almasry wrote:
>>>>>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>>>>>> index eeeda849115c..1c351c138a5b 100644
>>>>>>> --- a/include/linux/netdevice.h
>>>>>>> +++ b/include/linux/netdevice.h
>>>>>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>>>>>>>    };
>>>>>>>
>>>>>>>    #ifdef CONFIG_DMA_SHARED_BUFFER
>>>>>>> +struct page_pool_iov *
>>>>>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
>>>>>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
>>>>>>
>>>>>> netdev_{alloc,free}_dmabuf?
>>>>>>
>>>>>
>>>>> Can do.
>>>>>
>>>>>> I say that because a dmabuf can be host memory, at least I am not
>>>>>> aware
>>>>>> of a restriction that a dmabuf is device memory.
>>>>>>
>>>>>
>>>>> In my limited experience dma-buf is generally device memory, and
>>>>> that's really its use case. CONFIG_UDMABUF is a driver that mocks
>>>>> dma-buf with a memfd which I think is used for testing. But I can do
>>>>> the rename, it's more clear anyway, I think.
>>>>
>>>> config UDMABUF
>>>>           bool "userspace dmabuf misc driver"
>>>>           default n
>>>>           depends on DMA_SHARED_BUFFER
>>>>           depends on MEMFD_CREATE || COMPILE_TEST
>>>>           help
>>>>             A driver to let userspace turn memfd regions into dma-bufs.
>>>>             Qemu can use this to create host dmabufs for guest
>>>> framebuffers.
>>>>
>>>>
>>>> Qemu is just a userspace process; it is no way a special one.
>>>>
>>>> Treating host memory as a dmabuf should radically simplify the io_uring
>>>> extension of this set.
>>>
>>> I agree actually, and I was about to make that comment to David Wei's
>>> series once I have the time.
>>>
>>> David, your io_uring RX zerocopy proposal actually works with devmem
>>> TCP, if you're inclined to do that instead, what you'd do roughly is
>>> (I think):
>> That would be a Frankenstein's monster api with no good reason for it.
> 
> It brings a consistent API from a networking perspective.
> 
> io_uring should not need to be in the page pool and memory management
> business. Have you or David coded up the re-use of the socket APIs with
> dmabuf to see how much smaller it makes the io_uring change - or even
> walked through from a theoretical perspective?

Yes, we did the mental exercise, which is why we're converting to pp.
I don't see many opportunities for reuse for the main data path,
potentially apart from using the iov format instead of pages.

If the goal is to minimise the amount of code, it can mimic the tcp
devmem api with netlink, ioctl-ish buffer return, but that'd be a
pretty bad api for io_uring, overly complicated and limiting
optimisation options. If not, then we have to do some buffer
management in io_uring, and I don't see anything wrong with that. It
shouldn't be a burden for networking if all that extra code is
contained in io_uring and only exposed via pp ops and following
the rules.

-- 
Pavel Begunkov
