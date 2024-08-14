Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF553952120
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121BC10E4F3;
	Wed, 14 Aug 2024 17:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gEwMyUpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C9A10E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 17:30:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E27861B33;
 Wed, 14 Aug 2024 17:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86B2C4AF09;
 Wed, 14 Aug 2024 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723656651;
 bh=wWHERfWY68t43c/I0nTa2dlB6DGK9M9cJU/cQg1GFRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gEwMyUpeNPru3Xnvr2ilgC6PztNBLoeEdZ8ljTX9udmARzUvA9tkqTJZfy3yTn6fq
 CC9tyjWcRnePf7SmaBwaTEHJyhBH+xxVOIwaS6ReKH9/JKW/+lyEAovr9qNpoMrHMg
 7zHdLphV5CaALjf4WmDfwutI2/blIXXAqRWfHcNqCCem8svfdm6I9QIQKeUZA0sS8W
 6n2URHv+udD6i037bJJvn5y84H/PIUz8+xYAd3KJplA6M4XmJAmWU4eo8P2dcQaii3
 PdA/UOkZN3gLKvNdxbnXqcLXVv7klKRFi8fGIYk3SScvZEX/E1nwb92PRJ1s9dyEg4
 1EqU+ww04GwTg==
Date: Wed, 14 Aug 2024 10:30:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
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
 de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v19 00/13] Device Memory TCP
Message-ID: <20240814103048.670378e9@kernel.org>
In-Reply-To: <20240813211317.3381180-1-almasrymina@google.com>
References: <20240813211317.3381180-1-almasrymina@google.com>
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

On Tue, 13 Aug 2024 21:13:02 +0000 Mina Almasry wrote:
> v18 got a thorough review (thanks!), and this iteration addresses the
> feedback.
> 
> Major changes:
> - Prevent deactivating mp bound queues.
> - Prevent installing xdp on mp bound netdevs, or installing mps on xdp
>   installed netdevs.
> - Fix corner cases in netlink API vis-a-vis missing attributes.
> - Iron out the unreadable netmem driver support story. To be honest, the
>   conversation with Jakub & Pavel got a bit confusing for me. I've
>   implemented an approach in this set that makes sense to me, and
>   AFAICT, addresses the requirements. It may be good as-is, or it
>   may be a conversation starter/continuer. To be honest IMO there
>   are many ways to skin this cat and I don't see an extremely strong
>   reason to go for one approach over another. Here is one approach you
>   may like.
> - Don't reset niov dma_addr on allocation & free.
> - Add some tests to the selftest that catches some of the issues around
>   missing netlink attributes or deactivating mp-bound queues.

Something is going awry in two existing test:

https://netdev.bots.linux.dev/contest.html?branch=net-next-2024-08-14--15-00&pw-n=0&pass=0

Example:

https://netdev-3.bots.linux.dev/vmksft-net-drv/results/727462/2-queues-py/stdout

I'll take a closer look at the code in the evening, but gotta discard
if from pw already..
-- 
pw-bot: cr
