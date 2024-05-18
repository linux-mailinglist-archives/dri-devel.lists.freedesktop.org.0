Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35178C8EEA
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 02:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F0310E081;
	Sat, 18 May 2024 00:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="WUAicdk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E7C10E081
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2024 00:39:32 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1edfc57ac0cso24917995ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 17:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1715992772; x=1716597572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p7Punv+O2VI5RKAkHRkhtEk7CBj9yRK2PJX5XN6bfhc=;
 b=WUAicdk5oKsiGmkvRTLIZcTxxMHaNQIwhAL843kUmAUNpbD54ivYx7F+3u7Uxbypcg
 /o7DUrh+bO3lfyg+SOaPwktSeE+1vFlYyfL09YKqug722p2Yu+XR1rfhl7R8vbJDWHLX
 qeLvU5eGzd1b7igsZlt1QVcr3Rt0p2F969evoz6QhzVjtMORdbjubXxR98gkkc7WHSXL
 0MF3/StaOvB4jE+xZ76p8Nu6KYNXA6PXcRzKIzzeG4BY2EBL4g/gY6hiZPCTKOXsffiB
 3Zj5toplZcebGzOzUSaCEjcy0thGGdaXXgMmy/RVp7lx7YFUxO09MOdJ+0ZNTsmbJfq7
 AzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715992772; x=1716597572;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p7Punv+O2VI5RKAkHRkhtEk7CBj9yRK2PJX5XN6bfhc=;
 b=SUxWknozQpW1sd01uOP8L7p3pbIbbViq7TotHEdHhc5AimjLOOXaMCUr7DBPSMjG3X
 wDY77jwGUUDzXzwPUUpo7ktZEjiT6zt/9/dYJ2/eYQu5H12rZxzn/QTKX7VyhbIcld3K
 AruzmQuHl7naEp9fTMKT+0yTH321aM6pKxfzwX3HTT3eBA/KeBYLykluWuJSzUR4YnMp
 r/Dqcl43pRqGKDCsIv4K/XDoVgpyBkSatWfD8eE1kNZuo8jv0hhTg3tKUoxyffNkZGr1
 l5dyOknTnSPdUER3x7c3kSlHwr3C3hnYgdrdn4bYJ+HV2jxoJxt0sbcFKJiyPoFf27MD
 zgyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuLIayBCkD6jM/r6TpAVKKiuwo5zpbmiUxZzXNwc2PE3nZdVbraWsgedIzFzdZs3vpxJc6mUj+JWbB3Z0p1XMEARXiedUqAYXHJPRXHMsN
X-Gm-Message-State: AOJu0YxRgFkWXRztfoAcd+PKYnmjK8lspU955Mug4cb37d/oHkXNTBQY
 EJIZJFWKczEhGj9W0rLE8OG7JH3MMLPMmgQK3gxLowxgLyRPgrlCCC7pPT8FWUE=
X-Google-Smtp-Source: AGHT+IG2kizdOiSw0uylPEq0qK5Nujj1quEtxgB2wxc39/tXdkGx33RSfpvHjRCh3dNNGsAUN6Msjg==
X-Received: by 2002:a05:6a00:1397:b0:6e6:89ad:1233 with SMTP id
 d2e1a72fcca58-6f4e02a6150mr30537733b3a.2.1715992772166; 
 Fri, 17 May 2024 17:39:32 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:1cbd:da2b:a9f2:881?
 ([2620:10d:c090:500::6:9fd9]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f4d2af2bccsm16503658b3a.170.2024.05.17.17.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 May 2024 17:39:31 -0700 (PDT)
Message-ID: <090be3c0-42e6-4b97-8b03-eb64b06a2911@davidwei.uk>
Date: Fri, 17 May 2024 17:39:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 05/14] netdev: netdevice devmem allocator
Content-Language: en-GB
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
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
 Pavel Begunkov <asml.silence@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
 <20240510232128.1105145-6-almasrymina@google.com>
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20240510232128.1105145-6-almasrymina@google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-05-10 16:21, Mina Almasry wrote:
> +/* This returns the absolute dma_addr_t calculated from
> + * net_iov_owner(niov)->owner->base_dma_addr, not the page_pool-owned
> + * niov->dma_addr.
> + *
> + * The absolute dma_addr_t is a dma_addr_t that is always uncompressed.
> + *
> + * The page_pool-owner niov->dma_addr is the absolute dma_addr compressed into
> + * an unsigned long. Special handling is done when the unsigned long is 32-bit
> + * but the dma_addr_t is 64-bit.
> + *
> + * In general code looking for the dma_addr_t should use net_iov_dma_addr(),
> + * while page_pool code looking for the unsigned long dma_addr which mirrors
> + * the field in struct page should use niov->dma_addr.
> + */
> +static inline dma_addr_t net_iov_dma_addr(const struct net_iov *niov)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner = net_iov_owner(niov);
> +
> +	return owner->base_dma_addr +
> +	       ((dma_addr_t)net_iov_idx(niov) << PAGE_SHIFT);
> +}

This part feels like devmem TCP specific, yet the function is in
netmem.h. Please consider moving it into devmem.{h,c} which makes it
less likely that people not reading your comment will try using it.

> +
> +static inline struct net_devmem_dmabuf_binding *
> +net_iov_binding(const struct net_iov *niov)
> +{
> +	return net_iov_owner(niov)->binding;
> +}
> +
>  /* netmem */
>  
>  /**
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index d82f92d7cf9ce..1f90e23a81441 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -54,6 +54,42 @@ void __net_devmem_dmabuf_binding_free(struct net_devmem_dmabuf_binding *binding)
>  	kfree(binding);
>  }
>  
> +struct net_iov *
> +net_devmem_alloc_dmabuf(struct net_devmem_dmabuf_binding *binding)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner;
> +	unsigned long dma_addr;
> +	struct net_iov *niov;
> +	ssize_t offset;
> +	ssize_t index;
> +
> +	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
> +					(void **)&owner);
> +	if (!dma_addr)
> +		return NULL;
> +
> +	offset = dma_addr - owner->base_dma_addr;
> +	index = offset / PAGE_SIZE;
> +	niov = &owner->niovs[index];
> +
> +	niov->dma_addr = 0;
> +
> +	net_devmem_dmabuf_binding_get(binding);
> +
> +	return niov;
> +}
> +
> +void net_devmem_free_dmabuf(struct net_iov *niov)
> +{
> +	struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
> +	unsigned long dma_addr = net_iov_dma_addr(niov);
> +
> +	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
> +		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
> +
> +	net_devmem_dmabuf_binding_put(binding);
> +}
> +
>  /* Protected by rtnl_lock() */
>  static DEFINE_XARRAY_FLAGS(net_devmem_dmabuf_bindings, XA_FLAGS_ALLOC1);
>  
