Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92F90AF0D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 15:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D45610E3BA;
	Mon, 17 Jun 2024 13:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jYWyhkR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3F810E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 13:22:46 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a6e43dad8ecso757531066b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718630564; x=1719235364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pwj3Fw5B61alhB5+Nki7VXPagt0jdp377yGvLMhtmxI=;
 b=jYWyhkR9Kaxb3xuBQF+K5vIhu4qNurZJ9aC7sJy9Aph471FEVa2vRtoD0DYOnxfwF/
 KVDS+nmqWh2cROkJfMATiawhq33StMIoWOkx6IeOs9hE5loATIr1gtZxuw6RNorr+iGM
 7vKpH2f8qCP/0zyC7m/Yn06ABYy+t4ZZHrWWGj9qVylpsUKR+U+1R1J8gtsMH2hffUB+
 YNfsuvJnKqx/UxKuUpnv3sh0wGcYEh3KyMS1HAikDAmumvdusVImt7sorJR/ZPZJPbZM
 Ansc45VXfpzHXmFUU/JE8jq0R4NyZkaYNEi4QAcYGV53TrXitIBm6j4KJjiWaKag3jRe
 pbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718630564; x=1719235364;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pwj3Fw5B61alhB5+Nki7VXPagt0jdp377yGvLMhtmxI=;
 b=CFiYqX7DNAM8vQOuOzYXh9JjCQcrmU9QnYIzSkk710ffoGjp3SIdBuo/FlyOkO88Gs
 +yle+W4kKms2ZGGtrlmzo7jRbxdu6xw+OMO9scYyLPNDXVrLW7m+/MaTervulYGT3CQJ
 Hv2brYG3QFPEsBDJ/FfqCuDStr9RKvTj7gBDZvnqZvmnKr48jlqg9eMEpraH6YbLANWw
 iFK0fIhUiV9y4twZtvkiSkgYg1qweRiP9hneua/tPvi0mFYvqDI3nLtqU3UDTq6oHjtz
 paVY5ICsk6G79Wu4Yg+vBKMUg9J9Zsb1BmBTcOaAD+XG2htEOE4oiWDcW8T0cvkzTPA9
 nqxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo02a1CcHMJpKo1cKwFGKnTxRq/TZC3EtDoawDJyA1NF/599Pq8FQr6LWfXWh26u78suE3MEBjY9n4eYZ+W0Vohx2TUhBVIQCFNyEgJxI8
X-Gm-Message-State: AOJu0Yz+WYZTc4t5yqFPJVvkI9un7fFVwYGCs13Bu2DsN2zeVAboyPu0
 Rk3MGuW4vpcMb04JeV23jQvGdUQtW0SXVU4qk/QWjYvyVLOdtGXl
X-Google-Smtp-Source: AGHT+IEU7bSdU44tFLpRT61VrE4rRir5BezTbPl/p80FyKx5ycfOabVN7gLSnIoqzOZDAYrOc9lyjA==
X-Received: by 2002:a17:906:f851:b0:a6f:b5a:f5b9 with SMTP id
 a640c23a62f3a-a6f608b9addmr640674266b.32.1718630564415; 
 Mon, 17 Jun 2024 06:22:44 -0700 (PDT)
Received: from [192.168.42.82] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6a1f2cb9sm383873066b.17.2024.06.17.06.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:22:44 -0700 (PDT)
Message-ID: <c45c5888-497b-4e95-a139-43a05279af65@gmail.com>
Date: Mon, 17 Jun 2024 14:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 03/13] netdev: support binding dma-buf to
 netdevice
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
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240613013557.1169171-1-almasrymina@google.com>
 <20240613013557.1169171-4-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240613013557.1169171-4-almasrymina@google.com>
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
> Add a netdev_dmabuf_binding struct which represents the
> dma-buf-to-netdevice binding. The netlink API will bind the dma-buf to
> rx queues on the netdevice. On the binding, the dma_buf_attach
> & dma_buf_map_attachment will occur. The entries in the sg_table from
> mapping will be inserted into a genpool to make it ready
> for allocation.
> 
> The chunks in the genpool are owned by a dmabuf_chunk_owner struct which
> holds the dma-buf offset of the base of the chunk and the dma_addr of
> the chunk. Both are needed to use allocations that come from this chunk.
> 
> We create a new type that represents an allocation from the genpool:
> net_iov. We setup the net_iov allocation size in the
> genpool to PAGE_SIZE for simplicity: to match the PAGE_SIZE normally
> allocated by the page pool and given to the drivers.
> 
> The user can unbind the dmabuf from the netdevice by closing the netlink
> socket that established the binding. We do this so that the binding is
> automatically unbound even if the userspace process crashes.
> 
> The binding and unbinding leaves an indicator in struct netdev_rx_queue
> that the given queue is bound, but the binding doesn't take effect until
> the driver actually reconfigures its queues, and re-initializes its page
> pool.
> 
> The netdev_dmabuf_binding struct is refcounted, and releases its
> resources only when all the refs are released.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Apart from the comment below

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com> # excluding netlink


> diff --git a/include/net/devmem.h b/include/net/devmem.h
> new file mode 100644
> index 0000000000000..eaf3fd965d7a8
...
> diff --git a/net/core/dev.c b/net/core/dev.c
> index c361a7b69da86..84c9f96a6c9bf 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -158,6 +158,9 @@
>   #include <net/page_pool/types.h>
>   #include <net/page_pool/helpers.h>
>   #include <net/rps.h>
> +#include <linux/genalloc.h>
> +#include <linux/dma-buf.h>
> +#include <net/devmem.h>
>   
>   #include "dev.h"
>   #include "net-sysfs.h"
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> new file mode 100644
> index 0000000000000..951a06004c430
> --- /dev/null
> +++ b/net/core/devmem.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *      Devmem TCP
> + *
> + *      Authors:	Mina Almasry <almasrymina@google.com>
> + *			Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> + *			Kaiyuan Zhang <kaiyuanz@google.com
> + */
> +
> +#include <linux/types.h>
> +#include <linux/mm.h>
> +#include <linux/netdevice.h>
> +#include <trace/events/page_pool.h>
> +#include <net/netdev_rx_queue.h>
> +#include <net/page_pool/types.h>
> +#include <net/page_pool/helpers.h>
> +#include <linux/genalloc.h>
> +#include <linux/dma-buf.h>
> +#include <net/devmem.h>
> +#include <net/netdev_queues.h>
> +
> +/* Device memory support */
> +
> +#if defined(CONFIG_DMA_SHARED_BUFFER) && defined(CONFIG_GENERIC_ALLOCATOR)
> +static void net_devmem_dmabuf_free_chunk_owner(struct gen_pool *genpool,
> +					       struct gen_pool_chunk *chunk,
> +					       void *not_used)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner = chunk->owner;
> +
> +	kvfree(owner->niovs);
> +	kfree(owner);
> +}
> +
> +void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
> +{
> +	size_t size, avail;
> +
> +	gen_pool_for_each_chunk(binding->chunk_pool,
> +				net_devmem_dmabuf_free_chunk_owner, NULL);
> +
> +	size = gen_pool_size(binding->chunk_pool);
> +	avail = gen_pool_avail(binding->chunk_pool);
> +
> +	if (!WARN(size != avail, "can't destroy genpool. size=%zu, avail=%zu",
> +		  size, avail))
> +		gen_pool_destroy(binding->chunk_pool);
> +
> +	dma_buf_unmap_attachment(binding->attachment, binding->sgt,
> +				 DMA_FROM_DEVICE);

It's unmapped here as DMA_FROM_DEVICE, a fail path does DMA_BIDIRECTIONAL,
dma_buf_map_attachment() passes BIDIRECTIONAL.


> +	dma_buf_detach(binding->dmabuf, binding->attachment);
> +	dma_buf_put(binding->dmabuf);
> +	xa_destroy(&binding->bound_rxq_list);
> +	kfree(binding);
> +}
> +
> +/* Protected by rtnl_lock() */
> +static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
> +
...

-- 
Pavel Begunkov
