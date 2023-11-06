Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B8C7E31A3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814DF10E111;
	Mon,  6 Nov 2023 23:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7204E10E111
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:49:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8B2A6CE0E57;
 Mon,  6 Nov 2023 23:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E181EC433C8;
 Mon,  6 Nov 2023 23:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699314562;
 bh=vxZh7uQV/qwyCfhEVz7KfEgklD4PUHvJkzFT4Xt+7Io=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TFosqqH0vuGDxkFCsh+y8Th4LUHgwk30AfF75ljEHSTXLtMUk2YpH/GAXfDeG1cB3
 EzzTqqwD10r+HNVDCDGMl/N9V+DlnnlaMlnsdhCSKRXW7kiDd6ZX/CfRV6Cct4HtiQ
 wzhiUJixHByChVm0W6BzlMoNriYyTYKbS8P7oxUmWSqfycy8waSYkgLZ8G7l6DcUb9
 yRu6v2+nPnJJ/LEhXXMhAppXHfuR2Ot211vqmVt2x0dQ0FQD/LjomoseKxhd4IkmfI
 nO3xKT4vKQZHAedO3bH2w68OluwUQn9mgzPzFUjOGKBQBQdEfJLpsI+oxYPSbYpJ42
 d4M9M97iHVSYw==
Message-ID: <583db67b-96c6-4e17-bea0-b5a14799db4a@kernel.org>
Date: Mon, 6 Nov 2023 16:49:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory
 provider
Content-Language: en-US
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-7-almasrymina@google.com>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20231106024413.2801438-7-almasrymina@google.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/23 7:44 PM, Mina Almasry wrote:
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 78cbb040af94..b93243c2a640 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -111,6 +112,45 @@ page_pool_iov_binding(const struct page_pool_iov *ppiov)
>  	return page_pool_iov_owner(ppiov)->binding;
>  }
>  
> +static inline int page_pool_iov_refcount(const struct page_pool_iov *ppiov)
> +{
> +	return refcount_read(&ppiov->refcount);
> +}
> +
> +static inline void page_pool_iov_get_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	refcount_add(count, &ppiov->refcount);
> +}
> +
> +void __page_pool_iov_free(struct page_pool_iov *ppiov);
> +
> +static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
> +					  unsigned int count)
> +{
> +	if (!refcount_sub_and_test(count, &ppiov->refcount))
> +		return;
> +
> +	__page_pool_iov_free(ppiov);
> +}
> +
> +/* page pool mm helpers */
> +
> +static inline bool page_is_page_pool_iov(const struct page *page)
> +{
> +	return (unsigned long)page & PP_DEVMEM;

This is another one where the code can be more generic to not force a
lot changes later.  e.g., PP_CUSTOM or PP_NO_PAGE. Then io_uring use
case with host memory can leverage the iov pool in a similar manner.

That does mean skb->devmem needs to be a flag on the page pool and not
just assume iov == device memory.


