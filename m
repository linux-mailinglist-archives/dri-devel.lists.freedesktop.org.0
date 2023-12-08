Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725B880AB60
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 18:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB89F10EAF7;
	Fri,  8 Dec 2023 17:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E59410EA06
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 17:56:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B21116254C;
 Fri,  8 Dec 2023 17:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A69DC433C8;
 Fri,  8 Dec 2023 17:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702058200;
 bh=9xxAbGXzLKVinje/1qrTMCGO6En/seWuAJ9zKs2OvRo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KktLrsaHMqHuSdviPwgKD8eaGdxnuIIA4B6K6LyNeKKK7EhZ2jsE5y2g0PbAlQLer
 5AZD+X8hVBf/pb6iCzYpjpO1mYT0e5phnU3CUE6Ye44qGWVDkbiSW1wIJ01RKfpqH1
 aIsWiOCHUl+yjhU69kpDY6WMx48AuAE3yhIXC1chevQQLoEBFmjqiEysAoA2jweMb9
 EmhyG8e1p62psBESzHBntY1HPYMm/o6U/cZsY2Jw/gG5H1OkQdrGgZc5bezgme0n3P
 vdBkZN5APkNeAlIxu6r+1QD1FytYmVy1OGPCUGxcdSSgAwFdHKWNbrN/KOExS72/Km
 KOcx35phxF+6w==
Message-ID: <462da4bf-34f8-40c4-8772-9850b3127baf@kernel.org>
Date: Fri, 8 Dec 2023 10:56:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v1 07/16] netdev: netdevice devmem allocator
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>,
 Shailend Chand <shailend@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20231208005250.2910004-1-almasrymina@google.com>
 <20231208005250.2910004-8-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231208005250.2910004-8-almasrymina@google.com>
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
> diff --git a/net/core/dev.c b/net/core/dev.c
> index b8c8be5a912e..30667e4c3b95 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -2120,6 +2120,41 @@ static int netdev_restart_rx_queue(struct net_device *dev, int rxq_idx)
>  	return err;
>  }
>  
> +struct page_pool_iov *netdev_alloc_dmabuf(struct netdev_dmabuf_binding *binding)
> +{
> +	struct dmabuf_genpool_chunk_owner *owner;
> +	struct page_pool_iov *ppiov;
> +	unsigned long dma_addr;
> +	ssize_t offset;
> +	ssize_t index;
> +
> +	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,

Any reason not to allow allocation sizes other than PAGE_SIZE? e.g.,
2048 for smaller MTUs or 8192 for larger ones. It can be a property of
page_pool and constant across allocations vs allowing different size for
each allocation.
