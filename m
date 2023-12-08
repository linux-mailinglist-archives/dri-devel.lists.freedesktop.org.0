Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01480AB1D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB8610E2A4;
	Fri,  8 Dec 2023 17:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960F910E2A4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:48:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D5E7062538;
 Fri,  8 Dec 2023 17:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2B6C433C7;
 Fri,  8 Dec 2023 17:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702057715;
 bh=QhXQPyvQgWIfvDkbSx67u+Zj6uEqAYuquxDBwKePCJE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vG3IUgCI7Vl1Ae7jqY3QTraWz66PaiSD+WpG1WvnBrANgyZraJ2iA8SAnKT3INQU1
 LVtpqSYOJ9jbHnCfywwcF7ri2RUAha1/EgX+42PNhDgQRuFRKz3ra0rg1DtBj9H9KJ
 RoNZsIGJ2YbO1TilE2f329bwgtfBR5Lg+IvgWvF0hqn/2yhF5oFSu2vNWsFAk0b/gZ
 rTidktVHR0u7SzSqDA9u7ShRYuFqrCmUFLY6J8SOVqhfrC6mUBoqKWEYdaBAQ9nADl
 6hzrOGEKkLY9HhwOn/M1/P6d9j/R6K2mTpn1xHIzAf+7KIiRibqlj8BlKFQi4kS5ym
 tFNg+JaK/IVqA==
Message-ID: <5752508c-f7bc-44ac-8778-c807b2ee5831@kernel.org>
Date: Fri, 8 Dec 2023 10:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 06/16] netdev: support binding dma-buf to netdevice
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-7-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231208005250.2910004-7-almasrymina@google.com>
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/23 5:52 PM, Mina Almasry wrote:
> +
> +static int netdev_restart_rx_queue(struct net_device *dev, int rxq_idx)
> +{
> +	void *new_mem;
> +	void *old_mem;
> +	int err;
> +
> +	if (!dev || !dev->netdev_ops)
> +		return -EINVAL;
> +
> +	if (!dev->netdev_ops->ndo_queue_stop ||
> +	    !dev->netdev_ops->ndo_queue_mem_free ||
> +	    !dev->netdev_ops->ndo_queue_mem_alloc ||
> +	    !dev->netdev_ops->ndo_queue_start)
> +		return -EOPNOTSUPP;
> +
> +	new_mem = dev->netdev_ops->ndo_queue_mem_alloc(dev, rxq_idx);
> +	if (!new_mem)
> +		return -ENOMEM;
> +
> +	err = dev->netdev_ops->ndo_queue_stop(dev, rxq_idx, &old_mem);
> +	if (err)
> +		goto err_free_new_mem;
> +
> +	err = dev->netdev_ops->ndo_queue_start(dev, rxq_idx, new_mem);
> +	if (err)
> +		goto err_start_queue;
> +
> +	dev->netdev_ops->ndo_queue_mem_free(dev, old_mem);
> +
> +	return 0;
> +
> +err_start_queue:
> +	dev->netdev_ops->ndo_queue_start(dev, rxq_idx, old_mem);
> +
> +err_free_new_mem:
> +	dev->netdev_ops->ndo_queue_mem_free(dev, new_mem);
> +
> +	return err;
> +}
> +
> +/* Protected by rtnl_lock() */
> +static DEFINE_XARRAY_FLAGS(netdev_dmabuf_bindings, XA_FLAGS_ALLOC1);
> +
> +void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	unsigned long xa_idx;
> +	unsigned int rxq_idx;
> +
> +	if (!binding)
> +		return;
> +
> +	if (binding->list.next)
> +		list_del(&binding->list);
> +
> +	xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
> +		if (rxq->binding == binding) {
> +			/* We hold the rtnl_lock while binding/unbinding
> +			 * dma-buf, so we can't race with another thread that
> +			 * is also modifying this value. However, the driver
> +			 * may read this config while it's creating its
> +			 * rx-queues. WRITE_ONCE() here to match the
> +			 * READ_ONCE() in the driver.
> +			 */
> +			WRITE_ONCE(rxq->binding, NULL);
> +
> +			rxq_idx = get_netdev_rx_queue_index(rxq);
> +
> +			netdev_restart_rx_queue(binding->dev, rxq_idx);

Blindly restarting a queue when a dmabuf is heavy handed. If the dmabuf
has no outstanding references (ie., no references in the RxQ), then no
restart is needed.

> +		}
> +	}
> +
> +	xa_erase(&netdev_dmabuf_bindings, binding->id);
> +
> +	netdev_dmabuf_binding_put(binding);
> +}
> +
> +int netdev_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> +				struct netdev_dmabuf_binding *binding)
> +{
> +	struct netdev_rx_queue *rxq;
> +	u32 xa_idx;
> +	int err;
> +
> +	rxq = __netif_get_rx_queue(dev, rxq_idx);
> +
> +	if (rxq->binding)
> +		return -EEXIST;
> +
> +	err = xa_alloc(&binding->bound_rxq_list, &xa_idx, rxq, xa_limit_32b,
> +		       GFP_KERNEL);
> +	if (err)
> +		return err;
> +
> +	/* We hold the rtnl_lock while binding/unbinding dma-buf, so we can't
> +	 * race with another thread that is also modifying this value. However,
> +	 * the driver may read this config while it's creating its * rx-queues.
> +	 * WRITE_ONCE() here to match the READ_ONCE() in the driver.
> +	 */
> +	WRITE_ONCE(rxq->binding, binding);
> +
> +	err = netdev_restart_rx_queue(dev, rxq_idx);

Similarly, here binding a dmabuf to a queue. I was expecting the dmabuf
binding to add entries to the page pool for the queue. If the pool was
previously empty, then maybe the queue needs to be "started" in the
sense of creating with h/w or just pushing buffers into the queue and
moving the pidx.


