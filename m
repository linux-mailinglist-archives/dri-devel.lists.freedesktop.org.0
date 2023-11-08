Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205DB7E4FA9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 05:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E8810E37C;
	Wed,  8 Nov 2023 04:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3F10E37C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 04:10:25 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SQBMj57xdzMmh5;
 Wed,  8 Nov 2023 12:05:53 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 8 Nov
 2023 11:48:49 +0800
Subject: Re: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
To: Mina Almasry <almasrymina@google.com>, David Ahern <dsahern@kernel.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-6-almasrymina@google.com>
 <3b0d612c-e33b-48aa-a861-fbb042572fc9@kernel.org>
 <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <6c629d6d-6927-3857-edaa-1971a94b6e93@huawei.com>
Date: Wed, 8 Nov 2023 11:48:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izOHYx+oYnzksUDrK1S0+6CdMJmirApntP5W862yFumezw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
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
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/8 6:10, Mina Almasry wrote:
> On Mon, Nov 6, 2023 at 3:44 PM David Ahern <dsahern@kernel.org> wrote:
>>
>> On 11/5/23 7:44 PM, Mina Almasry wrote:
>>> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
>>> index eeeda849115c..1c351c138a5b 100644
>>> --- a/include/linux/netdevice.h
>>> +++ b/include/linux/netdevice.h
>>> @@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
>>>  };
>>>
>>>  #ifdef CONFIG_DMA_SHARED_BUFFER
>>> +struct page_pool_iov *
>>> +netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
>>> +void netdev_free_devmem(struct page_pool_iov *ppiov);
>>
>> netdev_{alloc,free}_dmabuf?
>>
> 
> Can do.
> 
>> I say that because a dmabuf can be host memory, at least I am not aware
>> of a restriction that a dmabuf is device memory.
>>
> 
> In my limited experience dma-buf is generally device memory, and
> that's really its use case. CONFIG_UDMABUF is a driver that mocks
> dma-buf with a memfd which I think is used for testing. But I can do
> the rename, it's more clear anyway, I think.
> 
> On Mon, Nov 6, 2023 at 11:45 PM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> On 2023/11/6 10:44, Mina Almasry wrote:
>>> +
>>> +void netdev_free_devmem(struct page_pool_iov *ppiov)
>>> +{
>>> +     struct netdev_dmabuf_binding *binding = page_pool_iov_binding(ppiov);
>>> +
>>> +     refcount_set(&ppiov->refcount, 1);
>>> +
>>> +     if (gen_pool_has_addr(binding->chunk_pool,
>>> +                           page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
>>
>> When gen_pool_has_addr() returns false, does it mean something has gone
>> really wrong here?
>>
> 
> Yes, good eye. gen_pool_has_addr() should never return false, but then
> again, gen_pool_free()  BUG_ON()s if it doesn't find the address,
> which is an extremely severe reaction to what can be a minor bug in
> the accounting. I prefer to leak rather than crash the machine. It's a
> bit of defensive programming that is normally frowned upon, but I feel
> like in this case it's maybe warranted due to the very severe reaction
> (BUG_ON).

I would argue that why is the above defensive programming not done in the
gen_pool core:)

> 
