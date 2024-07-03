Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF9926830
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 20:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CA410E059;
	Wed,  3 Jul 2024 18:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q2b4SjCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DCE10E059
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 18:31:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 29B58CE2986;
 Wed,  3 Jul 2024 18:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E514C2BD10;
 Wed,  3 Jul 2024 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720031470;
 bh=Mv6mqBHDiM3rqFh3B+/o0KLetPfZfBn8uV4dFhO0sVc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q2b4SjCOlyBR4b/A3cmxrRvK0ldKPKPA/5Ju8X3w1MZKrzDVOjm9dFDbkuHNXVTjV
 Yc1e0yhldj7plTo3apSg+jVo6STh8apoZk6wpDfN0MqfhsFyigTWNB9g2DX4j2jS4b
 +w8JA7QKiAncIv+0WG92BVz3xe8SwulYg9HPOlqQm6UjlUb3YkYr+TjunG3SDVCbcB
 sB9aAIY80O1Db9Z1a1S1h+eAsTQNk+2QlMSIpNIoEBjXnifANuXwfRYiD0tmztUbty
 viYAY7ZzuNIMsS4G6hLdlW+IpND3TTcBhbU/XLJe3wOZj+bdJP08UkDGbYMOx4a12C
 iLv3UkwECWtkA==
Date: Wed, 3 Jul 2024 11:31:07 -0700
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
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, Nikolay
 Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, Kaiyuan
 Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v15 03/14] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240703113107.11ed8a18@kernel.org>
In-Reply-To: <CAHS8izOCuNZWfZR_jecFOMu2XGqcYUkuVf38wRqBvoE9tmGzoQ@mail.gmail.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
 <20240702180908.0eccf78f@kernel.org>
 <CAHS8izOCuNZWfZR_jecFOMu2XGqcYUkuVf38wRqBvoE9tmGzoQ@mail.gmail.com>
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

On Wed, 3 Jul 2024 09:56:45 -0700 Mina Almasry wrote:
> > Is this really sufficient in terms of locking? @binding is not
> > RCU-protected and neither is the reader guaranteed to be in
> > an RCU critical section. Actually the "reader" tries to take a ref
> > and use this struct so it's not even a pure reader.
> >
> > Let's add a lock or use one of the existing locks
> 
> Can we just use rtnl_lock() for this synchronization? It seems it's
> already locked everywhere that access mp_params.mp_priv, so the
> WRITE/READ_ONCE are actually superfluous. Both the dmabuf bind/unbind
> already lock rtnl_lock, and the only other place that access
> mp_params.mp_priv is page_pool_init(). I think it's reasonable to
> assume rtnl_lock is also held during page_pool_init, no? AFAICT it
> would be very weird for some code path to be reconfiguring the driver
> page_pools without holding rtnl_lock?
> 
> What I wanna do here is delete the incorrect comment, remove the
> READ/WRITE_ONCE, and maybe add a DEBUG_NET_WARN_ON(!rtnl_is_locked())
> in mp_dmabuf_devmem_init() but probably that is too defensive.

The only concern I have is driver error recovery paths. They may be
async and may happen outside of rtnl_lock. Same situation we have
with the queue <> NAPI <> IRQ mapping helpers. queue <> NAPI <> IRQ
helpers require rtnl_lock today, and Intel recently had a number of
fixes because that complicates their error recovery paths.

But I guess any locking here will take non-trivial amount of analysis.
Let's go with rtnl_lock, that's fine.
