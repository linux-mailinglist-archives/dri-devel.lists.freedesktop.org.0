Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B709651E2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376D10E0BD;
	Thu, 29 Aug 2024 21:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q/aH4yCw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AA310E0BD
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 21:26:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B7A25A43B88;
 Thu, 29 Aug 2024 21:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5BBC4CEC1;
 Thu, 29 Aug 2024 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724966807;
 bh=qv1w3i8ppp9WEatmXOTIDaygnDc4b+KopM2kue4iUXA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q/aH4yCwlgAE0YdZkEXc5ZWzCRJpVizL7u3qOFqjdHTLBh/GACVu7V+LYtSu7k99i
 fuCsKpIG7Ycih3jx7Nea0jL7wfVPoPaH1K7VToVloVY9GnEbAh3blFw6mIfvwkfi8P
 v86W/H6gdGgrjLiTOcnC8zC7buNYkwMeca7w7pi0Q4Fy5cqWuRd9dFXOCmrZIEh0OG
 +egu64hiZCWHl0GbAoGuKWN2aH034agEq7Cezds5QwuoX+mPfEdjmTihMkJMsnin7J
 6kRj6oJBykEyxE6SnnmmUTf7JH4YP5PCAIPbElrGwvuwvXryYVm9axq9Kg8g+IWpFZ
 IMeHpXeFot+4w==
Date: Thu, 29 Aug 2024 14:26:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Donald
 Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, "=?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?B?bA==?=" <bjorn@kernel.org>, Magnus Karlsson
 <magnus.karlsson@intel.com>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>
Subject: Re: [PATCH net-next v23 13/13] netdev: add dmabuf introspection
Message-ID: <20240829142643.4aa5c52a@kernel.org>
In-Reply-To: <20240829060126.2792671-14-almasrymina@google.com>
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-14-almasrymina@google.com>
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

On Thu, 29 Aug 2024 06:01:26 +0000 Mina Almasry wrote:
> +		binding = (struct net_devmem_dmabuf_binding *)
> +				  rxq->mp_params.mp_priv;
> +		if (binding) {
> +			if (nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF,
> +					binding->id))
> +				goto nla_put_failure;
> +		}


> +	struct net_devmem_dmabuf_binding *binding = pool->mp_priv;

> +	if (binding && nla_put_u32(rsp, NETDEV_A_PAGE_POOL_DMABUF, binding->id))
> +		goto err_cancel;

nit: this is better than the put in queue_fill_one()
no need to cast void pointer there, and you can use a single 

		if (binding &&
		    nla_put_u32(rsp, NETDEV_A_QUEUE_DMABUF, binding->id)))
			goto nla_put_failure;
