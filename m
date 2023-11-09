Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 723D87E66D4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 10:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7F410E873;
	Thu,  9 Nov 2023 09:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3BD10E214
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 09:30:53 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SQxWy6kV1zfb3k;
 Thu,  9 Nov 2023 17:30:38 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 9 Nov
 2023 17:30:16 +0800
Subject: Re: [RFC PATCH v3 07/12] page-pool: device memory support
To: Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-8-almasrymina@google.com>
 <4a0e9d53-324d-e19b-2a30-ba86f9e5569e@huawei.com>
 <CAHS8izNbw7vAGo2euQGA+TF9CgQ8zwrDqTVGsOSxh22_uo0R1w@mail.gmail.com>
 <d4309392-711a-75b0-7bf0-9e7de8fd527e@huawei.com>
 <CAHS8izM1P6d8jgyWE9wFJUJah2YFsjHP2uikDwA0vR=3QA+BXQ@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <a8ae22dc-5b85-9efe-16c7-d95d455828fa@huawei.com>
Date: Thu, 9 Nov 2023 17:30:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izM1P6d8jgyWE9wFJUJah2YFsjHP2uikDwA0vR=3QA+BXQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
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
Cc: dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/9 11:20, Mina Almasry wrote:
> On Wed, Nov 8, 2023 at 2:56 AM Yunsheng Lin <linyunsheng@huawei.com> wrote:

> 
> Agreed everything above is undoable.
> 
>> But we might be able to do something as folio is doing now, mm subsystem
>> is still seeing 'struct folio/page', but other subsystem like slab is using
>> 'struct slab', and there is still some common fields shared between
>> 'struct folio' and 'struct slab'.
>>
> 
> In my eyes this is almost exactly what I suggested in RFC v1 and got
> immediately nacked with no room to negotiate. What we did for v1 is to
> allocate struct pages for dma-buf to make dma-bufs look like struct
> page to mm subsystem. Almost exactly what you're describing above.

Maybe the above is where we have disagreement:
Do we still need make dma-bufs look like struct page to mm subsystem?
IMHO, the answer is no. We might only need to make dma-bufs look like
struct page to net stack and page pool subsystem. I think that is already
what this pacthset is trying to do, what I am suggesting is just make
it more like 'struct page' to net stack and page pool subsystem, in order
to try to avoid most of the 'if' checking in net stack and page pool
subsystem.

> It's a no-go. I don't think renaming struct page to netmem is going to
> move the needle (it also re-introduces code-churn). What I feel like I
> learnt is that dma-bufs are not struct pages and can't be made to look
> like one, I think.
> 
>> As the netmem patchset, is devmem able to reuse the below 'struct netmem'
>> and rename it to 'struct page_pool_iov'?
> 
> I don't think so. For the reasons above, but also practically it
> immediately falls apart. Consider this field in netmem:
> 
> + * @flags: The same as the page flags.  Do not use directly.
> 
> dma-buf don't have or support page-flags, and making dma-buf looks
> like they support page flags or any page-like features (other than
> dma_addr) seems extremely unacceptable to mm folks.

As far as I tell, as we limit the devmem usage in netstack, the below
is the related mm function call for 'struct page' for devmem:
page_ref_*(): page->_refcount does not need changing
page_is_pfmemalloc(): which is corresponding to page->pp_magic, and
                      devmem provider can set/unset it in it's 'alloc_pages'
                      ops.
page_to_nid(): we may need to handle it differently somewhat like this
               patch does as page_to_nid() may has different implementation
               based on different configuration.
page_pool_iov_put_many(): as mentioned in other thread, if net stack is not
                          calling page_pool_page_put_many() directly, we
                          can reuse napi_pp_put_page() for devmem too, and
                          handle the special case for devmem in 'release_page'
                          ops.

> 
>> So that 'struct page' for normal
>> memory and 'struct page_pool_iov' for devmem share the common fields used
>> by page pool and net stack?
> 
> Are you suggesting that we'd cast a netmem* to a page* and call core
> mm APIs on it? It's basically what was happening with RFC v1, where
> things that are not struct pages were made to look like struct pages.
> 
> Also, there isn't much upside for what you're suggesting, I think. For
> example I can align the refcount variable in struct page_pool_iov with
> the refcount in struct page so that this works:
> 
> put_page((struct page*)ppiov);
> 
> but it's a disaster. Because put_page() will call __put_page() if the
> page is freed, and __put_page() will try to return the page to the
> buddy allocator!

As what I suggested above, Can we handle this in devmem provider's
'release_page' ops instead of calling put_page() directly as for devmem.

> 
>>  And we might be able to reuse the 'flags',
>> '_pp_mapping_pad' and '_mapcount' for specific mem provider, which is enough
>> for the devmem only requiring a single pointer to point to it's
>> owner?
>>
> 
> All the above seems quite similar to RFC v1 again, using netmem
> instead of struct page. In RFC v1 we re-used zone_device_data() for
> the dma-buf owner equivalent.

As we have added a few checkings to limit 'struct page' for devmem to
be only used in net stack, we can decouple 'struct page' for devmem
from mm subsystem, zone_device_data() is not really needed, right?

If we can decouple 'struct page' for normal memory from mm subsystem
through the folio work in the future, then we may define a more abstract
structure for page pool and net stack instead of reusing 'struct page'
from mm.

> 
