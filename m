Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E17696518A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 23:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E18510E765;
	Thu, 29 Aug 2024 21:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="us1i7LvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E110E765
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 21:12:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B4B38A4288A;
 Thu, 29 Aug 2024 21:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD0C4CEC1;
 Thu, 29 Aug 2024 21:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724965936;
 bh=SdFDbc/FKfVCaHZ3R/u6SOjH9IobabUDvHC41qgaXUk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=us1i7LvNVt8Qyg0Ds3Qzx74/wqCdnCowJCXYSfINx9H2q6n5Kit1aO8FDlGGeTMaf
 vHRHoicpP5fkO3U2+B+81byJTxSyg+s/JKaYfAXXXdaGZWJ8id+HmCmmuUmWdaElQn
 gv+atJ2B0Ww51vx9gFkQVsIDp8BIu4oIA7f7e5Fp9659+RAYm3nte+AWc4etT9Sc/o
 /HVToybUJrWVLFvJ3z5lls1n69Cce9t5gwg1hA83miP9iDl4xOg9yZp2+Rj04tO4em
 wlA6UgNFKwOVnSaAgjOChfdDXWkt/q9nVjfwSzRkZxy01PXMkIQpvgBVgXQ7kosnUy
 Ykx86deotI6gw==
Date: Thu, 29 Aug 2024 14:12:12 -0700
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
 Taehee Yoo <ap420073@gmail.com>, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240829141212.1d146a16@kernel.org>
In-Reply-To: <20240829060126.2792671-4-almasrymina@google.com>
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com>
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

On Thu, 29 Aug 2024 06:01:16 +0000 Mina Almasry wrote:
> +		if (NL_REQ_ATTR_CHECK(info->extack, attr, tb, NETDEV_A_QUEUE_ID) ||
> +		    NL_REQ_ATTR_CHECK(info->extack, attr, tb, NETDEV_A_QUEUE_TYPE) ||
> +		    nla_get_u32(tb[NETDEV_A_QUEUE_TYPE]) != NETDEV_QUEUE_TYPE_RX) {

I keep going back and forth if I should complain.. so nit:

The first two conditions can be together, but for the third one
you want to NL_SET_BAD_ATTR(info->extack, tb[NETDEV_A_QUEUE_TYPE]));
so separate if() is needed. I think I suggested the combining
but I meant just the NL_REQ_ATTR.. ones.
