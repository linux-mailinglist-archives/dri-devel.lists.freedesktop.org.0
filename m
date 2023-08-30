Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B533378EFF1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D3710E187;
	Thu, 31 Aug 2023 15:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1078 seconds by postgrey-1.36 at gabe;
 Wed, 30 Aug 2023 12:56:43 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094C10E132
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 12:56:43 +0000 (UTC)
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RbP1q4vDGz1L8Vq;
 Wed, 30 Aug 2023 20:37:03 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 30 Aug
 2023 20:38:42 +0800
Subject: Re: [RFC PATCH v2 02/11] netdev: implement netlink api to bind
 dma-buf to netdevice
To: Mina Almasry <almasrymina@google.com>, <netdev@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-3-almasrymina@google.com>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <fc501cbd-1630-4140-e5b4-c7b147c82831@huawei.com>
Date: Wed, 30 Aug 2023 20:38:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20230810015751.3297321-3-almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 31 Aug 2023 15:10:31 +0000
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/8/10 9:57, Mina Almasry wrote:

...

> +
> +int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
> +				u32 rxq_idx, struct netdev_dmabuf_binding **out)
> +{
> +	struct netdev_dmabuf_binding *binding;
> +	struct netdev_rx_queue *rxq;
> +	struct scatterlist *sg;
> +	struct dma_buf *dmabuf;
> +	unsigned int sg_idx, i;
> +	unsigned long virtual;
> +	u32 xa_idx;
> +	int err;
> +
> +	rxq = __netif_get_rx_queue(dev, rxq_idx);
> +
> +	if (rxq->binding)
> +		return -EEXIST;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR_OR_NULL(dmabuf))
> +		return -EBADFD;
> +
> +	binding = kzalloc_node(sizeof(*binding), GFP_KERNEL,
> +			       dev_to_node(&dev->dev));
> +	if (!binding) {
> +		err = -ENOMEM;
> +		goto err_put_dmabuf;
> +	}
> +
> +	xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
> +
> +	refcount_set(&binding->ref, 1);
> +
> +	binding->dmabuf = dmabuf;
> +
> +	binding->attachment = dma_buf_attach(binding->dmabuf, dev->dev.parent);
> +	if (IS_ERR(binding->attachment)) {
> +		err = PTR_ERR(binding->attachment);
> +		goto err_free_binding;
> +	}
> +
> +	binding->sgt = dma_buf_map_attachment(binding->attachment,
> +					      DMA_BIDIRECTIONAL);
> +	if (IS_ERR(binding->sgt)) {
> +		err = PTR_ERR(binding->sgt);
> +		goto err_detach;
> +	}
> +
> +	/* For simplicity we expect to make PAGE_SIZE allocations, but the
> +	 * binding can be much more flexible than that. We may be able to
> +	 * allocate MTU sized chunks here. Leave that for future work...
> +	 */
> +	binding->chunk_pool = gen_pool_create(PAGE_SHIFT,
> +					      dev_to_node(&dev->dev));
> +	if (!binding->chunk_pool) {
> +		err = -ENOMEM;
> +		goto err_unmap;
> +	}
> +
> +	virtual = 0;
> +	for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
> +		dma_addr_t dma_addr = sg_dma_address(sg);
> +		struct dmabuf_genpool_chunk_owner *owner;
> +		size_t len = sg_dma_len(sg);
> +		struct page_pool_iov *ppiov;
> +
> +		owner = kzalloc_node(sizeof(*owner), GFP_KERNEL,
> +				     dev_to_node(&dev->dev));
> +		owner->base_virtual = virtual;
> +		owner->base_dma_addr = dma_addr;
> +		owner->num_ppiovs = len / PAGE_SIZE;
> +		owner->binding = binding;
> +
> +		err = gen_pool_add_owner(binding->chunk_pool, dma_addr,
> +					 dma_addr, len, dev_to_node(&dev->dev),
> +					 owner);
> +		if (err) {
> +			err = -EINVAL;
> +			goto err_free_chunks;
> +		}
> +
> +		owner->ppiovs = kvmalloc_array(owner->num_ppiovs,
> +					       sizeof(*owner->ppiovs),
> +					       GFP_KERNEL);

I guess the 'struct page_pool_iov' is the metadat for each chunk, just
like the 'struct page' for each page?
Do we want to make it cache line aligned as 'struct page' does, so that
there is no cache bouncing between different ppiov when freeing and
allocating?

And we may be able to get rid of the gen_pool if we add more field
to store the dma addree, the binding, etc in 'struct page_pool_iov'
as devmem is not usable by other subsystem other than net stack
and we can use a big page_pool->ring as the backing for all the
devmem chunks to replace the gen_pool, at least for current
implemention, dmabuf:page_pool/queue is 1:1. If we want to have
the same dmabuf shared by different page_pool, it seems better
to implement it in page_pool core instead of specific provider,
so that other provider or native page pool can make use of that
too.

As far as we go here, I am not sure if it is possible and reasonable
to reuse 'struct page' used by normal memory as much as possible,
and add some specific union fields for devmem like page pool does,
so that we can have more common handling between devmem and normal
memory?

I think we may need to split out metadata used by page pool
currently from 'struct page', something like the netmem patch
set does, as willy was trying to avoid more users using the
'struct page' directly instead of adding more direct users to it:

https://lore.kernel.org/linux-mm/20230111042214.907030-1-willy@infradead.org/

> +		if (!owner->ppiovs) {
> +			err = -ENOMEM;
> +			goto err_free_chunks;
> +		}
> +
> +		for (i = 0; i < owner->num_ppiovs; i++) {
> +			ppiov = &owner->ppiovs[i];
> +			ppiov->owner = owner;
> +			refcount_set(&ppiov->refcount, 1);
> +		}
> +
> +		dma_addr += len;
> +		virtual += len;
> +	}
> +
> +	/* TODO: need to be able to bind to multiple rx queues on the same
> +	 * netdevice. The code should already be able to handle that with
> +	 * minimal changes, but the netlink API currently allows for 1 rx
> +	 * queue.
> +	 */
> +	err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
> +		       GFP_KERNEL);
> +	if (err)
> +		goto err_free_chunks;
> +
> +	rxq->binding = binding;
> +	*out = binding;
> +
> +	return 0;
> +
> +err_free_chunks:
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				netdev_devmem_free_chunk_owner, NULL);
> +	gen_pool_destroy(binding->chunk_pool);
> +err_unmap:
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_BIDIRECTIONAL);
> +err_detach:
> +	dma_buf_detach(dmabuf, binding->attachment);
> +err_free_binding:
> +	kfree(binding);
> +err_put_dmabuf:
> +	dma_buf_put(dmabuf);
> +	return err;
> +}
> +

