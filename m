Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66192F13C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 23:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C40F10E0B6;
	Thu, 11 Jul 2024 21:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zp1w1M0V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A084410E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 21:41:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7861461E15;
 Thu, 11 Jul 2024 21:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45582C116B1;
 Thu, 11 Jul 2024 21:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720734070;
 bh=g1fNHOiGZm5mn96BaOhihxmzcRcyf74Q/bsZs8K17xc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zp1w1M0VOLmBNoOKjAT5CTE8BYrya+H1UwJrflrWESuo7uZue7iRKRZ4zpVGBcO2r
 JfHDmhOh1K91cHcdNCjHshXjwawtPn6kxyHX3Y6rlLk3zHEnjhuBZX277+OqLX05+W
 +wUPVw/el9mcJ7uNpa3f0WEVqpMx9whj46qVyNBYA1YxFt6Gc+Aap+0IpsZsYS6b6x
 99LfRRVFyVT/9XwfcLz99b+8pOGsjni6NXPXPe6e3QNwec5LKy0mZnyaCTJLepsVDG
 wYu/+B5BdVB3cVS+n3GFpmp+4R/sbXU58e8C1Y6LSMHLZtG/aJJGaGXSa+fE4rRz4E
 M3SWkeRQ1GlnA==
Date: Thu, 11 Jul 2024 14:41:07 -0700
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
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
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
Message-ID: <20240711144107.0086e0e1@kernel.org>
In-Reply-To: <CAHS8izNMsCHhJM4hf7pf2p98sp9-3gxL6o7sC6JQnqThxiWjYw@mail.gmail.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com>
 <20240710094900.0f808684@kernel.org>
 <CAHS8izPTqsNQnQWKpDPTxULTFL4vr4k6j9Zw8TQzJVDBMXWMaA@mail.gmail.com>
 <20240710182322.667f0108@kernel.org>
 <CAHS8izNMsCHhJM4hf7pf2p98sp9-3gxL6o7sC6JQnqThxiWjYw@mail.gmail.com>
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

On Thu, 11 Jul 2024 13:57:01 -0700 Mina Almasry wrote:
> > > Sorry none of those are only used by net/core/*. Pretty much all of
> > > these are used by include/net/page_pool/helpers.h, and some have
> > > callers in net/core/devmem.c or net/core/skbuff.c
> > >
> > > Would you like me to move these pp specific looking ones to
> > > include/net/page_pool/netmem.h or something similar?  
> >
> > That's because some things already in helpers have no real business
> > being there either. Why is page_pool_set_pp_info() in helpers.h?  
> 
> OK, I looked into this a bit. It looks like I can trivially move
> page_pool_set/clear_pp_info() to page_pool_priv.h, and that lets me
> move out a few of these netmem helpers to a header under net/core.
> 
> However, to move more of these netmem helpers to a private header, I
> think I need to move all the page pool dma helpers and reffing helpers
> to a private header or the .c file, which I think will uninline them
> as they're eventually called from drivers.
> 
> I had guessed the previous authors put those dma and ref helpers in
> the .h file to inline them as they're used in fast paths. Do you think
> the refactor and the uninling is desirable? Or should I just do with
> the trivial moving of the page_pool_set/clear_pp_info() to the private
> file?

The helpers which modify pp_magic and dma_addr should go. I don't see
anything else on a quick look, but in general the public header
shouldn't contain helpers which are meant for setup / init of a buffer.
