Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A4C90B2B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 16:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84EE10E3FF;
	Mon, 17 Jun 2024 14:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QRn4ezTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34E310E3FF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 14:45:43 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a6f0e153eddso573313966b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718635542; x=1719240342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ah3rcgKtsiLLs9s7Ep0iHOREj7mRgLBYmdEE8sYGz64=;
 b=QRn4ezTqaBm2slFD9sIczN1tJgGDOcVnBrUFeETXg1orAf16RPUvg55ei+WnVDqr8J
 uz5jSnHl03riy0ngWrZvMMNsTlVKp6F5AbIaNZ7Wf3tgVV9BF3LDmh3YZ0tl1vUf0MQ3
 dW98yGM6Sa1jszgXC419gI27c3m/io6GJO6Vf3V80zC6p2GYaLxiOQE9fug1TqTVuk/9
 xUlmxPqwehCHYpbzOAFuRkI2FPc2EVejCq5+GIZlS5LL7FdSoBhUiiu/mErrjuf+mEzW
 rWpt1alJ/80Rce3IXGPUoU3i3h/QHAtmt2lHTL/F4X/GRGvP/X6xyA+G4kWB8O2r6r/I
 k69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718635542; x=1719240342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ah3rcgKtsiLLs9s7Ep0iHOREj7mRgLBYmdEE8sYGz64=;
 b=BkaA3dWqGGxcVcHF3Hde/luqv3fHj2feNtKUHqtbbbSwHkthmnNSqCagDXcNoMPMnx
 6COiAqnv6IhfnmZiqRjfHKhFOgTMOTW2Im4T8N1NC1iPO3HNHfbSq57hkNcovFdMPUbL
 B0BCXsqXUDTa+3MLCjmhS1qHA9D4QnJmd4IA4jTAY1FtADIgg/hVuKaBkxn/YRpYmhMr
 xpPxgBxH/Depgr2MtLhDao5WCxCPTcn7dbvIw+QRnjf1KGhh0yrB8MPPEPC4ZgEjBWWq
 KDkb8zo0KugXKPs2DWnCu/3shVsWfWrzvVLFP19Av6X378otb4dLwLOQ+KBFV+GcTpJY
 q1UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7CJANs7iNh+8rjHAWb8THseyyYksMMLFVWvxGGhHDCnH8As7edhKl30PPh2FveugvhuUH9GqmC49dsbULV+IU4MqCWLAzx1YfLxOk3nY7
X-Gm-Message-State: AOJu0Yx2v48AI8867cre6Rin7hkU9E7g1o5NpLlyC29ISzThjzD03V/P
 fb9l+du5ZvX9TU66b8WOgU6i3F3mWm9mcHKBizfdxK3PZnUKy6K7
X-Google-Smtp-Source: AGHT+IGy29Bog/6x0frVCqVR0gtIWSVZ7NmfaBwvNVXbu4bGaKBQqObsvBBOakN7w58CXi9kwdrLlg==
X-Received: by 2002:a17:906:aacb:b0:a5a:6bde:c3fb with SMTP id
 a640c23a62f3a-a6f60d29568mr573906666b.28.1718635541341; 
 Mon, 17 Jun 2024 07:45:41 -0700 (PDT)
Received: from [192.168.42.82] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa41cbsm522762466b.225.2024.06.17.07.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 07:45:40 -0700 (PDT)
Message-ID: <14b7af66-04fe-4b49-94d6-bea5d554252e@gmail.com>
Date: Mon, 17 Jun 2024 15:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 07/13] memory-provider: dmabuf devmem memory
 provider
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
 <20240613013557.1169171-8-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240613013557.1169171-8-almasrymina@google.com>
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
> Implement a memory provider that allocates dmabuf devmem in the form of
> net_iov.
> 
> The provider receives a reference to the struct netdev_dmabuf_binding
> via the pool->mp_priv pointer. The driver needs to set this pointer for
> the provider in the net_iov.
> 
> The provider obtains a reference on the netdev_dmabuf_binding which
> guarantees the binding and the underlying mapping remains alive until
> the provider is destroyed.
> 
> Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
> the page_pool can provide the driver with the dma-addrs of the devmem.
> 
> Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity & p.order !=
> 0.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Comments below, apart from them

Reviewed-by: Pavel Begunkov <asml.silence@gmail.com>


> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index f4fd9b9dbb675..d3843eade5fc2 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -17,6 +17,7 @@
...
> +
> +bool mp_dmabuf_devmem_release_page(struct page_pool *pool, netmem_ref netmem)
> +{
> +	WARN_ON_ONCE(!netmem_is_net_iov(netmem));
> +	WARN_ON_ONCE(atomic_long_read(netmem_get_pp_ref_count_ref(netmem)) !=
> +		     1);

If you're adding it anyway, maybe
"if (warn) return" ?

> +
> +	page_pool_clear_pp_info(netmem);
> +
> +	net_devmem_free_dmabuf(netmem_to_net_iov(netmem));
> +
> +	/* We don't want the page pool put_page()ing our net_iovs. */
> +	return false;
> +}
> +
>   #endif
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 1152e3547795a..22e3c58648d42 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -13,6 +13,7 @@
...
> @@ -269,7 +275,25 @@ static int page_pool_init(struct page_pool *pool,
>   	if (pool->dma_map)
>   		get_device(pool->p.dev);
>   
> +	if (pool->p.queue)
> +		pool->mp_priv = READ_ONCE(pool->p.queue->mp_params.mp_priv);
> +
> +	if (pool->mp_priv) {
> +		err = mp_dmabuf_devmem_init(pool);
> +		if (err) {
> +			pr_warn("%s() mem-provider init failed %d\n", __func__,
> +				err);
> +			goto free_ptr_ring;

Should also free stats, look up

free_percpu(pool->recycle_stats);

-- 
Pavel Begunkov
