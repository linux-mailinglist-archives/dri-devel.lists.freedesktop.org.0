Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8922958AF3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 17:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4127A10E0A4;
	Tue, 20 Aug 2024 15:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XhV8y6cZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E55510E0A4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 15:19:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 151E5CE0A66;
 Tue, 20 Aug 2024 15:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899F1C4AF0B;
 Tue, 20 Aug 2024 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724167164;
 bh=/OXYNA076GPRELh0pHtb1LqJyPMWNb0FBe4CzjTGaQs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XhV8y6cZBCxHcRXtyBXg5fkxQ0emSjT4auJjQk+246Tw8eD3OUCE057w6/vUhGK+Q
 RBjicnT8mi2sKTBuq0JANhVJTDhMvdUqDUjecxktxoY+vMrnz4MGVdsNOpaqcNAw9I
 8huEtnENFiJFKoN9IcbUvsltqlewOPHIwnN9eFpsuawwCJvXkDlHhiXl7L7Wur0fpu
 tpAX/YFnzoaY+ZA/9o5gRvZTPhKxlmy+9Auiz50bY1SO6+EAmVeqJQ3ehrBxhx64mc
 3Inbdd0jxjd2cxDx/Af/1fV60ySoP0m+sl/9zoj0NBHNWDP6FteTyA3BOpW4xPB0UC
 8Lpljm3h/QgEQ==
Date: Tue, 20 Aug 2024 08:19:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Taehee Yoo <ap420073@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend
 Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH net-next v19 03/13] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240820081920.6630a73f@kernel.org>
In-Reply-To: <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
References: <20240813211317.3381180-4-almasrymina@google.com>
 <CAMArcTWWxjsg_zwS6waWkLpyHhwdXDm_NJeVGm_dr+eT5QDZiA@mail.gmail.com>
 <20240819155257.1148e869@kernel.org>
 <CAHS8izPL4YdqFjkTpYavdxQn816=kkUv0xravQJF4Uno7Bn3ZQ@mail.gmail.com>
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

On Tue, 20 Aug 2024 00:01:02 -0400 Mina Almasry wrote:
> Took a bit of a look here. Forgive me, I'm not that familiar with XDP
> and virtual interfaces, so I'm a bit unsure what to do here.
> 
> For veth, it seems, the device behind the veth is stored in
> veth_priv->peer, so it seems maybe a dev_get_max_mp_channel() check on
> veth_priv->peer is the way to go to disable this for veth? I think we
> need to do this check on creation of the veth and on the ndo_bpf of
> veth.

veth is a SW device pair, it can't reasonably support netmem.
Given all the unreasonable features it grew over time we can't
rule out that someone will try, but that's not our problem now.

> For bonding, it seems we need to add mp channel check in bond_xdp_set,
> and bond_enslave?

Sort of, I'd factor out that logic into the core first, as some
sort of "xdp propagate" helper. Then we can add that check once.
I don't see anything bond specific in the logic.

> There are a few other drivers that define ndo_add_slave, seems a check
> in br_add_slave is needed as well.

I don't think it's that broad. Not many drivers propagate XDP:

$ git grep -C 200 '\.ndo_add_slave' | grep '\.ndo_bpf'
drivers/net/bonding/bond_main.c-	.ndo_bpf		= bond_xdp,

$ git grep --files-with-matches  'ops->ndo_bpf' -- drivers/
drivers/net/bonding/bond_main.c
drivers/net/hyperv/netvsc_bpf.c

> This seems like a potentially deep rabbit hole with a few checks to
> add all of the place. Is this blocking the series?

Protecting the stack from unreadable memory is *the* challenge
in this series. The rest is a fairly straightforward.
