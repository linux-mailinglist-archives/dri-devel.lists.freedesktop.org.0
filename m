Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F350080B797
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755D010E329;
	Sat,  9 Dec 2023 23:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E03610E329
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:29:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 51A87B801BF;
 Sat,  9 Dec 2023 23:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB64C433C8;
 Sat,  9 Dec 2023 23:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702164551;
 bh=c9kOjfPZi63X+asNNxhMNmUxQDfFEzKNIVa3FVoqTpU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b6Hyp1OBNvus/wYWvXxgvsrIZmxWDbJmG7M94TiargWR0ivsB/QtcAV15++RbJpw4
 0aBA5M26kNQea5FdiS2dxZto+AGylSMARPzNHWPxVoeLKiA0l6cIpNgoAMvW7REZqh
 c2PQK/kmpYgy9PugIfR9kwNsrZdY4LqqihHztRYSxkc0KCU4dNqt/0Wv0kcB+cWFox
 YUDbgRYcK7BMoi+NkWVzj/MJSIR5RKcu5gsSTeGkzfQCwahZHG3Vhh7dbv3fYM7C0m
 IQsB2hHL6ZcSA5LR7vaDJi4nu1TqHUL4AZvEpnYmBrscOL9JKv+KMYpX68+ufgKMLS
 bL2ldjH3T1UQA==
Message-ID: <279a2999-3c0a-4839-aa2e-602864197410@kernel.org>
Date: Sat, 9 Dec 2023 16:29:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-7-almasrymina@google.com>
 <5752508c-f7bc-44ac-8778-c807b2ee5831@kernel.org>
 <CAHS8izPsQ2XoJy-vYWkn051Yc=D_kSprtQcG4mmPutf1G3+-aw@mail.gmail.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <CAHS8izPsQ2XoJy-vYWkn051Yc=D_kSprtQcG4mmPutf1G3+-aw@mail.gmail.com>
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
Cc: linux-doc@vger.kernel.org, Kaiyuan Zhang <kaiyuanz@google.com>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/8/23 12:22 PM, Mina Almasry wrote:
> On Fri, Dec 8, 2023 at 9:48 AM David Ahern <dsahern@kernel.org> wrote:
>>
>> On 12/7/23 5:52 PM, Mina Almasry wrote:
> ...
>>> +
>>> +     xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
>>> +             if (rxq->binding == binding) {
>>> +                     /* We hold the rtnl_lock while binding/unbinding
>>> +                      * dma-buf, so we can't race with another thread that
>>> +                      * is also modifying this value. However, the driver
>>> +                      * may read this config while it's creating its
>>> +                      * rx-queues. WRITE_ONCE() here to match the
>>> +                      * READ_ONCE() in the driver.
>>> +                      */
>>> +                     WRITE_ONCE(rxq->binding, NULL);
>>> +
>>> +                     rxq_idx = get_netdev_rx_queue_index(rxq);
>>> +
>>> +                     netdev_restart_rx_queue(binding->dev, rxq_idx);
>>
>> Blindly restarting a queue when a dmabuf is heavy handed. If the dmabuf
>> has no outstanding references (ie., no references in the RxQ), then no
>> restart is needed.
>>
> 
> I think I need to stop the queue while binding to a dmabuf for the
> sake of concurrency, no? I.e. the softirq thread may be delivering a
> packet, and in parallel a separate thread holds rtnl_lock and tries to
> bind the dma-buf. At that point the page_pool recreation will race
> with the driver doing page_pool_alloc_page(). I don't think I can
> insert a lock to handle this into the rx fast path, no?

I think it depends on the details of how entries are added and removed
from the pool. I am behind on the pp details at this point, so I do need
to do some homework.

> 
> Also, this sounds like it requires (lots of) more changes. The
> page_pool + driver need to report how many pending references there
> are (with locking so we don't race with incoming packets), and have
> them reported via an ndo so that we can skip restarting the queue.
> Implementing the changes in to a huge issue but handling the
> concurrency may be a genuine blocker. Not sure it's worth the upside
> of not restarting the single rx queue?

It has to do with the usability of this overall solution. As I mentioned
most ML use cases can (and will want to) use many memory allocations for
receiving packets - e.g., allocations per message and receiving multiple
messages per socket connection.

> 
>>> +             }
>>> +     }
>>> +
>>> +     xa_erase(&netdev_dmabuf_bindings, binding->id);
>>> +
>>> +     netdev_dmabuf_binding_put(binding);
>>> +}
>>> +
>>> +int netdev_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
>>> +                             struct netdev_dmabuf_binding *binding)
>>> +{
>>> +     struct netdev_rx_queue *rxq;
>>> +     u32 xa_idx;
>>> +     int err;
>>> +
>>> +     rxq = __netif_get_rx_queue(dev, rxq_idx);
>>> +
>>> +     if (rxq->binding)
>>> +             return -EEXIST;
>>> +
>>> +     err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
>>> +                    GFP_KERNEL);
>>> +     if (err)
>>> +             return err;
>>> +
>>> +     /* We hold the rtnl_lock while binding/unbinding dma-buf, so we can't
>>> +      * race with another thread that is also modifying this value. However,
>>> +      * the driver may read this config while it's creating its * rx-queues.
>>> +      * WRITE_ONCE() here to match the READ_ONCE() in the driver.
>>> +      */
>>> +     WRITE_ONCE(rxq->binding, binding);
>>> +
>>> +     err = netdev_restart_rx_queue(dev, rxq_idx);
>>
>> Similarly, here binding a dmabuf to a queue. I was expecting the dmabuf
>> binding to add entries to the page pool for the queue.
> 
> To be honest, I think maybe there's a slight disconnect between how
> you think the page_pool works, and my primitive understanding of how
> it works. Today, I see a 1:1 mapping between rx-queue and page_pool in
> the code. I don't see 1:many or many:1 mappings.

I am not referring to 1:N or N:1 for page pool and queues. I am
referring to entries within a single page pool for a single Rx queue.


> 
> In theory mapping 1 rx-queue to n page_pools is trivial: the driver
> can call page_pool_create() multiple times to generate n queues and
> decide for incoming packets which one to use.
> 
> However, mapping n rx-queues to 1 page_pool seems like a can of worms.
> I see code in the page_pool that looks to me (and Willem) like it's
> safe only because the page_pool is used from the same napi context.
> with a n rx-queueue: 1 page_pool mapping, that is no longer true, no?
> There is a tail end of issues to resolve to be able to map 1 page_pool
> to n queues as I understand and even if resolved I'm not sure the
> maintainers are interested in taking the code.
> 
> So, per my humble understanding there is no such thing as "add entries
> to the page pool for the (specific) queue", the page_pool is always
> used by 1 queue.
> 
> Note that even though this limitation exists, we still support binding
> 1 dma-buf to multiple queues, because multiple page pools can use the
> same netdev_dmabuf_binding. I should add that to the docs.
> 
>> If the pool was
>> previously empty, then maybe the queue needs to be "started" in the
>> sense of creating with h/w or just pushing buffers into the queue and
>> moving the pidx.
>>
>>
> 
> I don't think it's enough to add buffers to the page_pool, no? The
> existing buffers in the page_pool (host mem) must be purged. I think
> maybe the queue needs to be stopped as well so that we don't race with
> incoming packets and end up with skbs with devmem and non-devmem frags
> (unless you're thinking it becomes a requirement to support that, I
> think things are complicated as-is and it's a good simplification).
> When we already purge the existing buffers & restart the queue, it's
> little effort to migrate this to become in line with Jakub's queue-api
> that he also wants to use for per-queue configuration & ndo_stop/open.
> 

