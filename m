Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F267E4F8C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 04:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC2710E36A;
	Wed,  8 Nov 2023 03:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F3710E36A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 03:41:09 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4SQ9px2b6kzfb1V;
 Wed,  8 Nov 2023 11:40:57 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 8 Nov
 2023 11:40:41 +0800
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
To: Mina Almasry <almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
 <1fee982f-1e96-4ae8-ede0-7e57bf84c5f7@huawei.com>
 <CAHS8izPV3isMWyjFnr7bJDDPANg-zm_M=UbHyuhYWv1Viy7fRw@mail.gmail.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <c1b689bd-a05b-85e9-0ce4-7264c818c2dc@huawei.com>
Date: Wed, 8 Nov 2023 11:40:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izPV3isMWyjFnr7bJDDPANg-zm_M=UbHyuhYWv1Viy7fRw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
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
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/11/8 5:59, Mina Almasry wrote:
> On Mon, Nov 6, 2023 at 11:46 PM Yunsheng Lin <linyunsheng@huawei.com> wrote:
>>
>> On 2023/11/6 10:44, Mina Almasry wrote:
>>> +
>>> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
>>> +{
>>> +     size_t size, avail;
>>> +
>>> +     gen_pool_for_each_chunk(binding->chunk_pool,
>>> +                             netdev_devmem_free_chunk_owner, NULL);
>>> +
>>> +     size = gen_pool_size(binding->chunk_pool);
>>> +     avail = gen_pool_avail(binding->chunk_pool);
>>> +
>>> +     if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
>>> +               size, avail))
>>> +             gen_pool_destroy(binding->chunk_pool);
>>
>>
>> Is there any other place calling the gen_pool_destroy() when the above
>> warning is triggered? Do we have a leaking for binding->chunk_pool?
>>
> 
> gen_pool_destroy BUG_ON() if it's not empty at the time of destroying.
> Technically that should never happen, because
> __netdev_devmem_binding_free() should only be called when the refcount
> hits 0, so all the chunks have been freed back to the gen_pool. But,
> just in case, I don't want to crash the server just because I'm
> leaking a chunk... this is a bit of defensive programming that is
> typically frowned upon, but the behavior of gen_pool is so severe I
> think the WARN() + check is warranted here.

It seems it is pretty normal for the above to happen nowadays because of
retransmits timeouts, NAPI defer schemes mentioned below:

https://lkml.kernel.org/netdev/168269854650.2191653.8465259808498269815.stgit@firesoul/

And currently page pool core handles that by using a workqueue.
