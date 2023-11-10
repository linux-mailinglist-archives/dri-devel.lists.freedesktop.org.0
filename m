Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413587E79CB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 08:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEFF10E93E;
	Fri, 10 Nov 2023 07:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF30410E940
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 07:38:32 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4SRVtv2NmgzMmjR;
 Fri, 10 Nov 2023 15:33:59 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 10 Nov
 2023 15:38:29 +0800
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Mina Almasry <almasrymina@google.com>, Paolo Abeni <pabeni@redhat.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <076fa6505f3e1c79cc8acdf9903809fad6c2fd31.camel@redhat.com>
 <CAHS8izOGSE-PJ1uShkH_Mr6kUoC1EjM_9P1J=_TO6nLFP9K53Q@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <aec0f586-c3b9-8da8-6a39-f313105267f8@huawei.com>
Date: Fri, 10 Nov 2023 15:38:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izOGSE-PJ1uShkH_Mr6kUoC1EjM_9P1J=_TO6nLFP9K53Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/10 10:59, Mina Almasry wrote:
> On Thu, Nov 9, 2023 at 12:30 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> I'm trying to wrap my head around the whole infra... the above line is
>> confusing. Why do you increment dma_addr? it will be re-initialized in
>> the next iteration.
>>
> 
> That is just a mistake, sorry. Will remove this increment.

You seems to be combining comments in different thread and replying in
one thread, I am not sure that is a good practice and I almost missed the
reply below as I don't seem to be cc'ed.

> 
> On Thu, Nov 9, 2023 at 1:29 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:> >>>
>>>>> gen_pool_destroy BUG_ON() if it's not empty at the time of destroying.
>>>>> Technically that should never happen, because
>>>>> __netdev_devmem_binding_free() should only be called when the refcount
>>>>> hits 0, so all the chunks have been freed back to the gen_pool. But,
>>>>> just in case, I don't want to crash the server just because I'm
>>>>> leaking a chunk... this is a bit of defensive programming that is
>>>>> typically frowned upon, but the behavior of gen_pool is so severe I
>>>>> think the WARN() + check is warranted here.
>>>>
>>>> It seems it is pretty normal for the above to happen nowadays because of
>>>> retransmits timeouts, NAPI defer schemes mentioned below:
>>>>
>>>> https://lkml.kernel.org/netdev/168269854650.2191653.8465259808498269815.stgit@firesoul/
>>>>
>>>> And currently page pool core handles that by using a workqueue.
>>>
>>> Forgive me but I'm not understanding the concern here.
>>>
>>> __netdev_devmem_binding_free() is called when binding->ref hits 0.
>>>
>>> binding->ref is incremented when an iov slice of the dma-buf is
>>> allocated, and decremented when an iov is freed. So,
>>> __netdev_devmem_binding_free() can't really be called unless all the
>>> iovs have been freed, and gen_pool_size() == gen_pool_avail(),
>>> regardless of what's happening on the page_pool side of things, right?
>>
>> I seems to misunderstand it. In that case, it seems to be about
>> defensive programming like other checking.
>>
>> By looking at it more closely, it seems napi_frag_unref() call
>> page_pool_page_put_many() directly， which means devmem seems to
>> be bypassing the napi_safe optimization.
>>
>> Can napi_frag_unref() reuse napi_pp_put_page() in order to reuse
>> the napi_safe optimization?
>>
> 
> I think it already does. page_pool_page_put_many() is only called if
> !recycle or !napi_pp_put_page(). In that case
> page_pool_page_put_many() is just a replacement for put_page(),
> because this 'page' may be an iov.

Is there a reason why not calling napi_pp_put_page() for devmem too
instead of calling page_pool_page_put_many()? mem provider has a
'release_page' ops, calling page_pool_page_put_many() directly here
seems to be bypassing the 'release_page' ops, which means devmem is
bypassing most of the main features of page pool.

As far as I can tell, the main features of page pool:
1. Allow lockless allocation and freeing in pool->alloc cache by
   utilizing NAPI non-concurrent context.
2. Allow concurrent allocation and freeing in pool->ring cache by
   utilizing ptr_ring.
3. Allow dma map/unmap and cache sync optimization.
4. Allow detailed stats logging and tracing.
5. Allow some bulk allocation and freeing.
6. support both skb packet and xdp frame.

I am wondering what is the main features that devmem is utilizing
by intergrating into page pool?

It seems the driver can just call netdev_alloc_devmem() and
napi_frag_unref() can call netdev_free_devmem() directly without
intergrating into page pool and it should just works too?

Maybe we should consider creating a new thin layer, in order to
demux to page pool, devmem or other mem type if my suggestion does
not work out too?

> 
