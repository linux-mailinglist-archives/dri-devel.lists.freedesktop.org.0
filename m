Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B40987F5D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 09:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF610EC30;
	Fri, 27 Sep 2024 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C279110EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 07:25:21 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XFMMk1vKlz1HKGY;
 Fri, 27 Sep 2024 15:21:22 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
 by mail.maildlp.com (Postfix) with ESMTPS id C25E81A0188;
 Fri, 27 Sep 2024 15:25:14 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 27 Sep 2024 15:25:14 +0800
Message-ID: <2a495d47-f1ca-42ee-a23d-736d4cd47880@huawei.com>
Date: Fri, 27 Sep 2024 15:25:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Mina Almasry <almasrymina@google.com>
CC: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <liuyonglong@huawei.com>, <fanghaiqing@huawei.com>, <zhangkun09@huawei.com>,
 Robin Murphy <robin.murphy@arm.com>, Alexander Duyck
 <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, Wei Fang
 <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Tariq Toukan
 <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo
 <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew
 Morton <akpm@linux-foundation.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, <imx@lists.linux.dev>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <intel-wired-lan@lists.osuosl.org>, <bpf@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-mm@kvack.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
 <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
 <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
 <CAHS8izN-3Ooiexsr+Xp2234=GqMUy0sTTMqExKVkXAgmjeWQ6w@mail.gmail.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <CAHS8izN-3Ooiexsr+Xp2234=GqMUy0sTTMqExKVkXAgmjeWQ6w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.120.129]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf200006.china.huawei.com (7.185.36.61)
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

adding Sumit & Christian & dma-buf maillist

On 2024/9/27 13:54, Mina Almasry wrote:
> On Thu, Sep 26, 2024 at 8:58 PM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> On 2024/9/27 2:15, Mina Almasry wrote:
>>>
>>>> In order not to do the dma unmmapping after driver has already
>>>> unbound and stall the unloading of the networking driver, add
>>>> the pool->items array to record all the pages including the ones
>>>> which are handed over to network stack, so the page_pool can
>>>> do the dma unmmapping for those pages when page_pool_destroy()
>>>> is called.
>>>
>>> One thing I could not understand from looking at the code: if the
>>> items array is in the struct page_pool, why do you need to modify the
>>> page_pool entry in the struct page and in the struct net_iov? I think
>>> the code could be made much simpler if you can remove these changes,
>>> and you wouldn't need to modify the public api of the page_pool.
>>
>> As mentioned in [1]:
>> "There is no space in 'struct page' to track the inflight pages, so
>> 'pp' in 'struct page' is renamed to 'pp_item' to enable the tracking
>> of inflight page"
>>
>> As we still need pp for "struct page_pool" for page_pool_put_page()
>> related API, the container_of() trick is used to get the pp from the
>> pp_item.
>>
>> As you had changed 'struct net_iov' to be mirroring the 'struct page',
>> so change 'struct net_iov' part accordingly.
>>
>> 1. https://lore.kernel.org/all/50a463d5-a5a1-422f-a4f7-d3587b12c265@huawei.com/
>>
> 
> I'm not sure we need the pages themselves to have the list of pages
> that need to be dma unmapped on page_pool_destroy. The pool can have
> the list of pages that need to be unmapped on page_pool_destroy, and
> the individual pages need not track them, unless I'm missing
> something.

It is about the pool having the list of pages that need to be unmapped.
The point is that the list of pages that need to be unmapped is dynamic,
it is not a static list:
1. How to find a empty space in the list and add a page to the list?
2. How to find a page in the list and delete it from the list?
3. How to do the about two steps concurrently without obvious overhead?

I am not sure how it is possible to do the above without something like
the 'pp_item' added in this patch? Even the lockless list in the
include/linux/llist.h need a 'struct llist_node' for that to work.
But if it is possible, please share the idea in your mind.

> 
>>>
>>>> As the pool->items need to be large enough to avoid
>>>> performance degradation, add a 'item_full' stat to indicate the
>>>> allocation failure due to unavailability of pool->items.
>>>>
>>>
>>> I'm not sure there is any way to size the pool->items array correctly.
>>
>> Currently the size of pool->items is calculated in page_pool_create_percpu()
>> as below, to make sure the size of pool->items is somewhat twice of the
>> size of pool->ring so that the number of page sitting in the driver's rx
>> ring waiting for the new packet is the similar to the number of page that is
>> still being handled in the network stack as most drivers seems to set the
>> pool->pool_size according to their rx ring size:
>>
>> +#define PAGE_POOL_MIN_INFLIGHT_ITEMS           512
>> +       unsigned int item_cnt = (params->pool_size ? : 1024) +
>> +                               PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_INFLIGHT_ITEMS;
>> +       item_cnt = roundup_pow_of_two(item_cnt);
>>
> 
> I'm not sure it's OK to add a limitation to the page_pool that it can
> only allocate N pages. At the moment, AFAIU, N is unlimited and it may
> become a regression if we add a limitation.

Maybe, let's see if there is some stronger argument that it is not ok
to add the limitation or some testing that does show the limitation
does bring a regression.

> 
>>> Can you use a data structure here that can grow? Linked list or
>>> xarray?
>>>
>>> AFAIU what we want is when the page pool allocates a netmem it will
>>> add the netmem to the items array, and when the pp releases a netmem
>>> it will remove it from the array. Both of these operations are slow
>>> paths, right? So the performance of a data structure more complicated
>>> than an array may be ok. bench_page_pool_simple will tell for sure.
>>
>> The question would be why do we need the pool->items to grow with the
>> additional overhead and complication by dynamic allocation of item, using
>> complicated data structure and concurrent handling?
>>
>> As mentioned in [2], it was the existing semantics, but it does not means
>> we need to keep it. The changing of semantics seems like an advantage
>> to me, as we are able to limit how many pages is allowed to be used by
>> a page_pool instance.
>>
>> 2. https://lore.kernel.org/all/2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com/
>>
>>>
>>>> Note, the devmem patchset seems to make the bug harder to fix,
>>>> and may make backporting harder too. As there is no actual user
>>>> for the devmem and the fixing for devmem is unclear for now,
>>>> this patch does not consider fixing the case for devmem yet.
>>>>
>>>
>>> net_iovs don't hit this bug, dma_unmap_page_attrs() is never called on
>>> them, so no special handling is needed really. However for code
>>
>> I am really doubtful about your above claim. As at least the below
>> implementaion of dma_buf_unmap_attachment_unlocked() called in
>> __net_devmem_dmabuf_binding_free() seems be using the DMA API directly:
>>
>> https://elixir.bootlin.com/linux/v6.7-rc8/source/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#L215
>>
>> Or am I missing something obvious here?
>>
> 
> I mean currently net_iovs don't hit the __page_pool_release_page_dma
> function that causes the crash in the stack trace. The dmabuf layer
> handles the unmapping when the dmabuf dies (I assume correctly).

It seems like the similar assumption made about the normal page.
How is dmabuf layer able to handles the unmapping when the driver
which creates the page_pool with the devmem pages has unbound and
the 'struct device' behind the driver has became invalid?

If dmabuf layer is able to handle that, it seems the page_pool may
be able to handle that too. Adding the maintainers of Dma-buf to see
if there is some clarifying from them.

> 
