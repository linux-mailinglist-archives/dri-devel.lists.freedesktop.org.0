Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E235694994E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E6C10E401;
	Tue,  6 Aug 2024 20:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R8zSpgND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A4A10E401
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:43:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 01454CE0F7B;
 Tue,  6 Aug 2024 20:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D02C4AF0C;
 Tue,  6 Aug 2024 20:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722976977;
 bh=DaWt36xVGk9LrklCuq9Y0WSIGFkdQ2NrucnH139qhVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R8zSpgNDpucslJ9LhHrQaMFd6aOxtjVFNEMk72wbX0BbIXsv1hWz5ikW325uy5hAX
 b9LL2LirkHn6itCJ2gENxcbo+u4UY28lITGzhQfEk1w1qEblRxpxf0KGH1/tbuIFIj
 B8qkvfb7eya3zycothhbQgRmzJoqJYIYuDVblJoKiRyk0ezPjDEnOEkIikiLyOw4lM
 MbQ3rHHYOVNtFYvjsXeFob26WqDOEfua5n4XkL1yftJAKY+pZysVkedFwKlNtoxU6l
 cOWmdEg7sfcXdnL031h9LxhlO28iHpjp8CJWr3VjvOUXn96T6a+mmquVofe/a0KqTO
 /FAxA9i1hII4w==
Date: Tue, 6 Aug 2024 13:42:54 -0700
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
 <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v18 05/14] page_pool: move dmaddr helpers to .c
 file
Message-ID: <20240806134254.265e2bfb@kernel.org>
In-Reply-To: <20240805212536.2172174-6-almasrymina@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-6-almasrymina@google.com>
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

On Mon,  5 Aug 2024 21:25:18 +0000 Mina Almasry wrote:
> +dma_addr_t page_pool_get_dma_addr_netmem(netmem_ref netmem)
> +{
> +	struct page *page = netmem_to_page(netmem);
> +
> +	dma_addr_t ret = page->dma_addr;
> +
> +	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
> +		ret <<= PAGE_SHIFT;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(page_pool_get_dma_addr_netmem);

Get should stay in the header.

> +bool page_pool_set_dma_addr_netmem(netmem_ref netmem, dma_addr_t addr)
> +{
> +	struct page *page = netmem_to_page(netmem);
> +
> +	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
> +		page->dma_addr = addr >> PAGE_SHIFT;
> +
> +		/* We assume page alignment to shave off bottom bits,
> +		 * if this "compression" doesn't work we need to drop.
> +		 */
> +		return addr != (dma_addr_t)page->dma_addr << PAGE_SHIFT;
> +	}
> +
> +	page->dma_addr = addr;
> +	return false;
> +}
> +EXPORT_SYMBOL(page_pool_set_dma_addr_netmem);

Set should not be in the public (include/linux) header at all,
and should not be exported. net/core/page_pool_priv.h already
exists. Feel free to break this out of the series.
