Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142D954DCC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 17:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37FE10E7FA;
	Fri, 16 Aug 2024 15:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bKSTGrm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AC410E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 15:35:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 124E2CE2016;
 Fri, 16 Aug 2024 15:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C32C32782;
 Fri, 16 Aug 2024 15:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723822513;
 bh=Q18cNSCViMkznglQB7U8THt2jlE6uRjEx/JSrUARwzc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bKSTGrm8LaF2gwztx+/6SinSoy24s5gR4CldYRBEkiNOSwgcpm7hLvrrK2gtq0Pvx
 hMOv7Np2xjcElkjbz06G6kxT1paCcuIl6tgDnhA1FReWgEk0VrJIV5VnmY28VW+uM3
 rZACO8v+MYhjqas3sNB0o4umHsNfCDqpROl01Mt/tH5odX/nLSTCmpnMqAFo9lHFii
 7gaHt6gXGlFMnEUaVC739Sgm/hKhGjvNlG4yZPxcjScZu7DwFyzYVs8aZxgV2ToxjC
 MflEhOxEm/9blSXnL7eNEt3U0O1uRbAir3rluhSYsWuh/JjkeQLFqL1D7S/NCKi2I7
 8SQyYhQ0iAcDw==
Date: Fri, 16 Aug 2024 08:35:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org,
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
 Taehee Yoo <ap420073@gmail.com>, David Wei <dw@davidwei.uk>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend
 Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v19 06/13] memory-provider: dmabuf devmem
 memory provider
Message-ID: <20240816083510.3386fb10@kernel.org>
In-Reply-To: <CAHS8izO9LDM9rLVnJPgp6QXb4YLW5+3ziGOHTqScy-SKOLejYA@mail.gmail.com>
References: <20240813211317.3381180-7-almasrymina@google.com>
 <de7daf80-a2e4-4451-b666-2a67ccc3649e@gmail.com>
 <CAHS8izPMC+XhXKbJOQ3ymizyKuARSOv_cO_xO+q1EG4zoy6Gig@mail.gmail.com>
 <31640ff4-25a6-4115-85e6-82092ce57393@gmail.com>
 <20240815182245.2b5e3f44@kernel.org>
 <CAHS8izO9LDM9rLVnJPgp6QXb4YLW5+3ziGOHTqScy-SKOLejYA@mail.gmail.com>
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

On Fri, 16 Aug 2024 08:20:44 -0400 Mina Almasry wrote:
> > I'd keep the current check with a WARN_ON_ONCE(), tho.
> > Given the absence of tests driver developers can use.
> > Especially those who _aren't_ supporting the feature.
> 
> Yes what I have locally is the driver setting
> netdev_rx_queue->unreadable_netmem_supported when header split is
> turned on, and additionally a WARN_ON_ONCE around the check in core. I
> was about to send that when I read your email. I'm hoping we don't
> have to go through the scope creep of adding configuration via the
> queue API, which I think is a very significant undertaking.

I don't like adding more and more transient stuff to netdev_rx_queue.
It's one thing if we create a temporary solution in the core, which
we can easily redo later. It's another altogether when we expect drivers
to keep some bit up to date across all the reconfiguration paths they
have. Just to then got an replace that with another API.

If the post-check works let's go with that for now.
