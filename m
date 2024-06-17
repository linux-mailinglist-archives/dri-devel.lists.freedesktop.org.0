Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353DE90AF00
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACF10E3C7;
	Mon, 17 Jun 2024 13:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LKzQQokk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3612810E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:20:44 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a6f92065036so21375366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718630442; x=1719235242; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FUae8JuWsbpwcHSTs/RVPWcmF5+7RW32qrRGZUORids=;
 b=LKzQQokk+7l/aJmvs7Tda6J0G5a+QmfhkZK57fSzMKNJXM/Aw5fh7415qdvNjVZU6V
 moY5mgb42gSokwMSg9sS4dWbIXIJ0to7TA7WQq29pvpYPMcZtjaA7Fzdkgb3jhofRoIN
 rf9aox4JwwtyJu8tPqlurp353JQfdRSVYCyGnM+yMkm6T1+H1996BvJZyxHgyrvKdVDS
 m7iyGOmk40bajxslP3GCBLiUp4yHtgClwl2uLBh/mRxqRuMHHiko2RJQgjM65mhlnSSh
 EiTJNBlKSV/vDqQfFDw2raAcDnpveOfox3YAffpfniGUGI+TTqQWlwHI9S9m7vvlTYjU
 tDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718630442; x=1719235242;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUae8JuWsbpwcHSTs/RVPWcmF5+7RW32qrRGZUORids=;
 b=MEEdCvMZNt9A0exBTWOYPCTHogM/2V2aVoCM2fKgMCXvYWzyNZyG6eUKKx+3T7xk/C
 gm7a37DIrw3GFuXt8Q79h2mpCmdvfq6chYwheeBrXRbcuC8dz1Ks7Zxrx4JPvODrBjXQ
 sqA4iEWU5g5BhtjYQTGnVyRqjo5CAho9o2KAHQL7pYwZC5odMhGqy/rqtDNcRA1/HYrP
 kzEMUFuTLv7u+AGQBuTxqVnoLARZ+bhwHKaGr40PxzsqRX32ulW1enuuVNbaFx9+zkpV
 YbRXayPfWNzhguTQHV89jwW68cJbXJfOu0ERT4QwzIweZUNde7iDikSgEDUPypKnYnm2
 vnog==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQgjuB1z3W+Npcib6M2cpxmmBBqZhDJcW2yk5NL+rSsCVzXO4LPi1UH/DezGxCQBS1GWsWZZgBRXl30i811ILtAiGSJtlXOJU8o8PrjrYy
X-Gm-Message-State: AOJu0YwO2VXsGLBYB8mgZXB5f/Db5A86Yhyo28H9FpTI248ZexPkIt8P
 5ID5WPZkYP84WqtuYM9eXYCE7swfFxDrcySo+cFRlyA6r7Bk53ix
X-Google-Smtp-Source: AGHT+IHyYrCA4cWOAfaQmJOiDF7VHhRCpPr7ss5P86Xw14pxsXCUj8adUxCN6A9F4atdUbL10vfY8g==
X-Received: by 2002:a17:906:354e:b0:a6f:c17:1572 with SMTP id
 a640c23a62f3a-a6f5247429amr788950266b.33.1718630442157; 
 Mon, 17 Jun 2024 06:20:42 -0700 (PDT)
Received: from [192.168.42.82] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f41700sm514847966b.152.2024.06.17.06.20.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:20:41 -0700 (PDT)
Message-ID: <8cd3af33-3a86-478a-a5ac-462c2cca732a@gmail.com>
Date: Mon, 17 Jun 2024 14:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 01/13] netdev: add netdev_rx_queue_restart()
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert
 <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-2-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240613013557.1169171-2-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/13/24 02:35, Mina Almasry wrote:
> Add netdev_rx_queue_restart() function to netdev_rx_queue.h

see nit below

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>


> Signed-off-by: David Wei <dw@davidwei.uk>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v11:
> - Fix not checking dev->queue_mgmt_ops (Pavel).
> - Fix ndo_queue_mem_free call that passed the wrong pointer (David).
> 
> v9: https://lore.kernel.org/all/20240502045410.3524155-4-dw@davidwei.uk/
> (submitted by David).
> - fixed SPDX license identifier (Simon).
> - Rebased on top of merged queue API definition, and changed
>    implementation to match that.
> - Replace rtnl_lock() with rtnl_is_locked() to make it useable from my
>    netlink code where rtnl is already locked.
> 
> ---
>   include/net/netdev_rx_queue.h |  3 ++
>   net/core/Makefile             |  1 +
>   net/core/netdev_rx_queue.c    | 74 +++++++++++++++++++++++++++++++++++
>   3 files changed, 78 insertions(+)
>   create mode 100644 net/core/netdev_rx_queue.c
> 
> diff --git a/include/net/netdev_rx_queue.h b/include/net/netdev_rx_queue.h
> index aa1716fb0e53c..e78ca52d67fbf 100644
> --- a/include/net/netdev_rx_queue.h
> +++ b/include/net/netdev_rx_queue.h
> @@ -54,4 +54,7 @@ get_netdev_rx_queue_index(struct netdev_rx_queue *queue)
>   	return index;
>   }
>   #endif
> +
> +int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq);
> +
>   #endif
> diff --git a/net/core/Makefile b/net/core/Makefile
> index 62be9aef25285..f82232b358a2c 100644
> --- a/net/core/Makefile
> +++ b/net/core/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_NETDEV_ADDR_LIST_TEST) += dev_addr_lists_test.o
>   
>   obj-y += net-sysfs.o
>   obj-y += hotdata.o
> +obj-y += netdev_rx_queue.o
>   obj-$(CONFIG_PAGE_POOL) += page_pool.o page_pool_user.o
>   obj-$(CONFIG_PROC_FS) += net-procfs.o
>   obj-$(CONFIG_NET_PKTGEN) += pktgen.o
> diff --git a/net/core/netdev_rx_queue.c b/net/core/netdev_rx_queue.c
> new file mode 100644
> index 0000000000000..de0575cf6df5d
> --- /dev/null
> +++ b/net/core/netdev_rx_queue.c
> @@ -0,0 +1,74 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/netdevice.h>
> +#include <net/netdev_queues.h>
> +#include <net/netdev_rx_queue.h>
> +
> +int netdev_rx_queue_restart(struct net_device *dev, unsigned int rxq_idx)
> +{
> +	void *new_mem, *old_mem;
> +	int err;
> +
> +	if (!dev->queue_mgmt_ops || !dev->queue_mgmt_ops->ndo_queue_stop ||
> +	    !dev->queue_mgmt_ops->ndo_queue_mem_free ||
> +	    !dev->queue_mgmt_ops->ndo_queue_mem_alloc ||
> +	    !dev->queue_mgmt_ops->ndo_queue_start)
> +		return -EOPNOTSUPP;
> +
> +	DEBUG_NET_WARN_ON_ONCE(!rtnl_is_locked());
> +
> +	new_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
> +	if (!new_mem)
> +		return -ENOMEM;
> +
> +	old_mem = kvzalloc(dev->queue_mgmt_ops->ndo_queue_mem_size, GFP_KERNEL);
> +	if (!old_mem) {
> +		err = -ENOMEM;
> +		goto err_free_new_mem;
> +	}
> +
> +	err = dev->queue_mgmt_ops->ndo_queue_mem_alloc(dev, new_mem, rxq_idx);
> +	if (err)
> +		goto err_free_old_mem;
> +
> +	err = dev->queue_mgmt_ops->ndo_queue_stop(dev, old_mem, rxq_idx);
> +	if (err)
> +		goto err_free_new_queue_mem;
> +
> +	err = dev->queue_mgmt_ops->ndo_queue_start(dev, new_mem, rxq_idx);
> +	if (err)
> +		goto err_start_queue;
> +
> +	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, old_mem);
> +
> +	kvfree(old_mem);
> +	kvfree(new_mem);
> +
> +	return 0;
> +
> +err_start_queue:
> +	/* Restarting the queue with old_mem should be successful as we haven't
> +	 * changed any of the queue configuration, and there is not much we can
> +	 * do to recover from a failure here.
> +	 *
> +	 * WARN if the we fail to recover the old rx queue, and at least free

nit "if the we"

> +	 * old_mem so we don't also leak that.
> +	 */
> +	if (dev->queue_mgmt_ops->ndo_queue_start(dev, old_mem, rxq_idx)) {
> +		WARN(1,
> +		     "Failed to restart old queue in error path. RX queue %d may be unhealthy.",
> +		     rxq_idx);
> +		dev->queue_mgmt_ops->ndo_queue_mem_free(dev, old_mem);
> +	}
> +
> +err_free_new_queue_mem:
> +	dev->queue_mgmt_ops->ndo_queue_mem_free(dev, new_mem);
> +
> +err_free_old_mem:
> +	kvfree(old_mem);
> +
> +err_free_new_mem:
> +	kvfree(new_mem);
> +
> +	return err;
> +}

-- 
Pavel Begunkov
