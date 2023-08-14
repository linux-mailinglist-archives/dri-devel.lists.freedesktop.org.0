Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4F277AF19
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 03:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8D10E039;
	Mon, 14 Aug 2023 01:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CF210E039
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 01:10:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB29062755;
 Mon, 14 Aug 2023 01:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37007C433C7;
 Mon, 14 Aug 2023 01:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691975437;
 bh=sSoPoNHGalzvIc70oDi0FxnGludM4NLeHbZZnOdBj90=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eJZRaOCVMLsbH1+BfzU6qUmRBhziWNQDcW0phtDKDVv9Q/O3xDA63VWTr5k5qxJuH
 Mxj5bIAqH3kFZZFDvb5CtFXywQeGtbTn7kgqpUJPWf+kAqjRUZ1ui5kslyh3IENqEI
 DsFhdLcLUMYrAb/XosQpGbYGHN9XbRA6mT/i3cF5oc4KawmYhgMIggm/xYUU5RMO/Q
 ABjxA4NwmU08k10E/NfmJycF8iwET1HkMcgSYmg7gVpfuNK/phWQI6y9xYIUBWztno
 XYKAwZQJ2ioHAr3n77eOROL2fpoi7ZpOEA6tgUkkwSd5M8XfP2wC/Q9tkKzP7JAdx7
 y0OvFvXpsvgSg==
Message-ID: <7dd4f5b0-0edf-391b-c8b4-3fa82046ab7c@kernel.org>
Date: Sun, 13 Aug 2023 19:10:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH v2 02/11] netdev: implement netlink api to bind
 dma-buf to netdevice
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-3-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230810015751.3297321-3-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/9/23 7:57 PM, Mina Almasry wrote:
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 8e7d0cb540cd..02a25ccf771a 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -151,6 +151,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/prandom.h>
>  #include <linux/once_lite.h>
> +#include <linux/genalloc.h>
> +#include <linux/dma-buf.h>
> 
>  #include "dev.h"
>  #include "net-sysfs.h"
> @@ -2037,6 +2039,182 @@ static int call_netdevice_notifiers_mtu(unsigned long val,
>  	return call_netdevice_notifiers_info(val, &info.info);
>  }
> 
> +/* Device memory support */
> +
> +static void netdev_devmem_free_chunk_owner(struct gen_pool *genpool,
> +					   struct gen_pool_chunk *chunk,
> +					   void *not_used)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner = chunk->owner;
> +
> +	kvfree(owner->ppiovs);
> +	kfree(owner);
> +}
> +
> +void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
> +{
> +	size_t size, avail;
> +
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				netdev_devmem_free_chunk_owner, NULL);
> +
> +	size = gen_pool_size(binding->chunk_pool);
> +	avail = gen_pool_avail(binding->chunk_pool);
> +
> +	if (!WARN(size != avail, "can't destroy genpool. size=%lu, avail=%lu",
> +		  size, avail))
> +		gen_pool_destroy(binding->chunk_pool);
> +
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_BIDIRECTIONAL);
> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	dma_buf_put(binding->dmabuf);
> +	kfree(binding);
> +}
> +
> +void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	unsigned long xa_idx;
> +
> +	list_del_rcu(&binding->list);
> +
> +	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq)
> +		if (rxq->binding == binding)
> +			rxq->binding = NULL;
> +
> +	netdev_devmem_binding_put(binding);

This does a put on the binding but it does not notify the driver that
that the dmabuf references need to be flushed from the rx queue.

Also, what about the device getting deleted - e.g., the driver is removed?

> +}
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

So this proposal is limiting a binding to a single dmabuf at a time? Is
this just for the RFC?

Also, this suggests that the Rx queue is unique to the flow. I do not
recall a netdev API to create H/W queues on the fly (only a passing
comment from Kuba), so how is the H/W queue (or queue set since a
completion queue is needed as well) created for the flow? And in turn if
it is unique to the flow, what deletes the queue if an app does not do a
proper cleanup? If the queue sticks around, the dmabuf references stick
around.

Also, if this is an app specific h/w queue, flow steering is not
mentioned in this RFC.

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
>  #ifdef CONFIG_NET_INGRESS
>  static DEFINE_STATIC_KEY_FALSE(ingress_needed_key);
> 
> diff --git a/net/core/netdev-genl.c b/net/core/netdev-genl.c
> index bf7324dd6c36..288ed0112995 100644
> --- a/net/core/netdev-genl.c
> +++ b/net/core/netdev-genl.c> @@ -167,10 +231,37 @@ static int netdev_genl_netdevice_event(struct
notifier_block *nb,
>  	return NOTIFY_OK;
>  }
> 
> +static int netdev_netlink_notify(struct notifier_block *nb, unsigned long state,
> +				 void *_notify)
> +{
> +	struct netlink_notify *notify = _notify;
> +	struct netdev_dmabuf_binding *rbinding;
> +
> +	if (state != NETLINK_URELEASE || notify->protocol != NETLINK_GENERIC)
> +		return NOTIFY_DONE;
> +
> +	rcu_read_lock();
> +
> +	list_for_each_entry_rcu(rbinding, &netdev_rbinding_list, list) {
> +		if (rbinding->owner_nlportid == notify->portid) {
> +			netdev_unbind_dmabuf_to_queue(rbinding);

This ties the removal of a dmabuf to the close of the netlink socket as
suggested in the previous round of comments. What happens if the process
closes the dmabuf fd? Is the outstanding dev binding sufficient to keep
the allocation / use in place?

