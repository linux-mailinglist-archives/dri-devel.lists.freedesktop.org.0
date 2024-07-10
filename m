Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C249092D6D6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 18:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B595210E843;
	Wed, 10 Jul 2024 16:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GeE9psM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4B110E843
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 16:49:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 379B661B46;
 Wed, 10 Jul 2024 16:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C51C32781;
 Wed, 10 Jul 2024 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720630142;
 bh=eS/RMGP4VxRIFbhmXWkCrFvxioDBvmLiKkBEAODdwGU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GeE9psM35dHGvAUo79TtOnu4kq5cY9EUrGF2ghylZhRExsJfxInrnrbzIGYTRdEyP
 JuNUksWFVoX99WDJK0OYBlsaXy6q6YA4gtH9ruZmomvqVAnZKrQ5V0cyaDEK1nrfmj
 TYzIOxglnzs0uEzQL7xFLg0IgYd2T3xSZ3m9tEEYvl2XCdOAvnosGa5j4fJc/Yy95m
 Fc5KKtoP2fmuVTazyDqaAh0RTuL+2gSo3Q0QXNcq8mXWHgnju0cDM5kOaxJGJVc4MU
 IX9XFPAHEsGhG08l+UfVEIDuPwq1AH3mfKgmvCy5HzZT6Og5qbJjr0Ohj8oZTpGXx8
 z5HtdpFuugVEQ==
Date: Wed, 10 Jul 2024 09:49:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Donald Hunter <donald.hunter@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>, Ivan
 Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, linux-mm@kvack.org, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH net-next v16 05/13] page_pool: devmem support
Message-ID: <20240710094900.0f808684@kernel.org>
In-Reply-To: <20240710001749.1388631-6-almasrymina@google.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 10 Jul 2024 00:17:38 +0000 Mina Almasry wrote:
> @@ -68,17 +107,103 @@ static inline netmem_ref page_to_netmem(struct page *page)
>  
>  static inline int netmem_ref_count(netmem_ref netmem)
>  {
> +	/* The non-pp refcount of net_iov is always 1. On net_iov, we only
> +	 * support pp refcounting which uses the pp_ref_count field.
> +	 */
> +	if (netmem_is_net_iov(netmem))
> +		return 1;
> +
>  	return page_ref_count(netmem_to_page(netmem));
>  }

How can this work if we had to revert the patch which made all of
the networking stack take pp-aware refs? Maybe we should add the
refcount, and let it be bumped, but WARN() if the net_iov is released
with refcount other than 1? Or we need a very solid explanation why
the conversion had to be reverted and this is fine.

>  static inline unsigned long netmem_to_pfn(netmem_ref netmem)
>  {
> +	if (netmem_is_net_iov(netmem))
> +		return 0;
> +
>  	return page_to_pfn(netmem_to_page(netmem));
>  }

Can we move this out and rename it to netmem_pfn_trace() ?
Silently returning 0 is not generally okay, but since it's only 
for tracing we don't care.

> +static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
> +{
> +	return (struct net_iov *)((__force unsigned long)netmem & ~NET_IOV);
> +}
> +
> +static inline unsigned long netmem_get_pp_magic(netmem_ref netmem)
> +{
> +	return __netmem_clear_lsb(netmem)->pp_magic;
> +}
> +
> +static inline void netmem_or_pp_magic(netmem_ref netmem, unsigned long pp_magic)
> +{
> +	__netmem_clear_lsb(netmem)->pp_magic |= pp_magic;
> +}
> +
> +static inline void netmem_clear_pp_magic(netmem_ref netmem)
> +{
> +	__netmem_clear_lsb(netmem)->pp_magic = 0;
> +}
> +
> +static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
> +{
> +	return __netmem_clear_lsb(netmem)->pp;
> +}
> +
> +static inline void netmem_set_pp(netmem_ref netmem, struct page_pool *pool)
> +{
> +	__netmem_clear_lsb(netmem)->pp = pool;
> +}

Why is all this stuff in the main header? It's really low level.
Please put helpers which are only used by the core in a header
under net/core/, like net/core/dev.h
