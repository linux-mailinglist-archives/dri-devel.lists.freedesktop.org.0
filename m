Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BC7E8BD6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 18:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAC610E109;
	Sat, 11 Nov 2023 17:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F66C10E109
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 17:19:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F068960B72;
 Sat, 11 Nov 2023 17:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C2DC433C8;
 Sat, 11 Nov 2023 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699723147;
 bh=NgpKnj5nzW/ae95+vZHVPjMxvDXA89DOUJ9HvG7wcRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hFKFk+ZamKmhKyj7bEJVHKQQ1UL6rBZnH9b8IwFaQflQC0QDjGiR8TW+vR2jfuH5F
 cANfiI4eIvdmmyIUqoXiRpJC4s7BxEvWM9oh1SOwBP/kdL4Yk8j9+NfqVYlSQpB1hO
 6bFisDNKhGV9lGq/O7MZStKzfpUNVqOGTNikgZ4FBpwqvQ4PnXHgy15fcm3LnKdlka
 UqH4WHVRR44ISDNH0scX2ITCDFZz6qbUG/EkCkheyKe10W41KlEfTmvmDZlHGbr24R
 J5G6ziaMn6j191JLlKPmjSH9rz/sPK96QLPCJmT20V+qeocSSGy67LHqpy8m1tfc/X
 MAwiRifHVFSiQ==
Message-ID: <f59c200f-4659-4c71-8c83-4457d0b08fe1@kernel.org>
Date: Sat, 11 Nov 2023 10:19:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
Content-Language: en-US
To: Pavel Begunkov <asml.silence@gmail.com>,
 Mina Almasry <almasrymina@google.com>, David Wei <dw@davidwei.uk>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
 <a5b95e6b-8716-4e2e-9183-959b754b5b5e@kernel.org>
 <CAHS8izMKDOw5_y2MLRfuJHs=ai+sZ6GF7Rg1NuR_JqONg-5u5Q@mail.gmail.com>
 <3687e70e-29e6-34af-c943-8c0830ff92b8@gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <3687e70e-29e6-34af-c943-8c0830ff92b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 11/10/23 7:26 AM, Pavel Begunkov wrote:
> On 11/7/23 23:03, Mina Almasry wrote:
>> On Tue, Nov 7, 2023 at 2:55 PM David Ahern <dsahern@kernel.org> wrote:
>>>
>>> On 11/7/23 3:10 PM, Mina Almasry wrote:
>>>> On Mon, Nov 6, 2023 at 3:44 PM David Ahern <dsahern@kernel.org> wrote:
>>>>>
>>>>> On 11/5/23 7:44 PM, Mina Almasry wrote:
>>>>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>>>>> index eeeda849115c..1c351c138a5b 100644
>>>>>> --- a/include/linux/netdevice.h
>>>>>> +++ b/include/linux/netdevice.h
>>>>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>>>>>>   };
>>>>>>
>>>>>>   #ifdef CONFIG_DMA_SHARED_BUFFER
>>>>>> +struct page_pool_iov *
>>>>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
>>>>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
>>>>>
>>>>> netdev_{alloc,free}_dmabuf?
>>>>>
>>>>
>>>> Can do.
>>>>
>>>>> I say that because a dmabuf can be host memory, at least I am not
>>>>> aware
>>>>> of a restriction that a dmabuf is device memory.
>>>>>
>>>>
>>>> In my limited experience dma-buf is generally device memory, and
>>>> that's really its use case. CONFIG_UDMABUF is a driver that mocks
>>>> dma-buf with a memfd which I think is used for testing. But I can do
>>>> the rename, it's more clear anyway, I think.
>>>
>>> config UDMABUF
>>>          bool "userspace dmabuf misc driver"
>>>          default n
>>>          depends on DMA_SHARED_BUFFER
>>>          depends on MEMFD_CREATE || COMPILE_TEST
>>>          help
>>>            A driver to let userspace turn memfd regions into dma-bufs.
>>>            Qemu can use this to create host dmabufs for guest
>>> framebuffers.
>>>
>>>
>>> Qemu is just a userspace process; it is no way a special one.
>>>
>>> Treating host memory as a dmabuf should radically simplify the io_uring
>>> extension of this set.
>>
>> I agree actually, and I was about to make that comment to David Wei's
>> series once I have the time.
>>
>> David, your io_uring RX zerocopy proposal actually works with devmem
>> TCP, if you're inclined to do that instead, what you'd do roughly is
>> (I think):
> That would be a Frankenstein's monster api with no good reason for it.

It brings a consistent API from a networking perspective.

io_uring should not need to be in the page pool and memory management
business. Have you or David coded up the re-use of the socket APIs with
dmabuf to see how much smaller it makes the io_uring change - or even
walked through from a theoretical perspective?


