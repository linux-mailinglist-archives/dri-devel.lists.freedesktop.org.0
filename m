Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1994FA7C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 01:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBBC210E1B5;
	Mon, 12 Aug 2024 23:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yu7jc8ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224ED10E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 23:57:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6795CCE10AB;
 Mon, 12 Aug 2024 23:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2500C4AF0E;
 Mon, 12 Aug 2024 23:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723507031;
 bh=Jr9ZiAeKQT2m5eKlEJkFL1K/dVRLIXlbe8RR0cKjDv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yu7jc8msljkFCiQiwDF8/zfbezYJqanad92vT7bLx1dIuUShflvBssxWFPxEF/6Tn
 Y6qZR26h6davxDADewPqVrDbdDczF8Qcfmj7XUmuNBVgamCljt10Aq6S9lIkNZrlTC
 DI1MmuAnHiAfpgm3qDz7e1Bxg9pWMNEsq3xGTfFREDalBFadkOa+tffRzqkA0tT8uP
 fY9gXJLt3AIpZK7oFuq6X15n6MRFUxghZeDdZK64myodmq9N2bG7na/OJa4W3FBwc+
 VjF7d55qI3ua0l1zhG9f4oRBuranyt4ci5N38sYz5rLuG4RyFeUjSKg0qqpUAjLWuY
 q9MRn2l+gjx0g==
Date: Mon, 12 Aug 2024 16:57:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Donald Hunter
 <donald.hunter@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jonathan
 Corbet <corbet@lwn.net>, Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>, Jesper
 Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>, Steffen
 Klassert <steffen.klassert@secunet.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem de
 Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>, David Wei <dw@davidwei.uk>, Jason
 Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend
 Chand <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem
 memory provider
Message-ID: <20240812165708.33234ed6@kernel.org>
In-Reply-To: <a6747b29-ed79-49d4-9ffe-b62074db1e09@gmail.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
 <20240806135924.5bb65ec7@kernel.org>
 <CAHS8izOA80dxpB9rzOwv7Oe_1w4A7vo5S3c3=uCES8TSnjyzpg@mail.gmail.com>
 <20240808192410.37a49724@kernel.org>
 <CAHS8izMH4UhD+UDYqMjt9d=gu-wpGPQBLyewzVrCWRyoVtQcgA@mail.gmail.com>
 <fc6a8f0a-cdb4-4705-a08f-7033ef15213e@gmail.com>
 <20240809205236.77c959b0@kernel.org>
 <CAHS8izOXwZS-8sfvn3DuT1XWhjc--7-ZLjr8rMn1XHr5F+ckbA@mail.gmail.com>
 <48f3a61f-9e04-4755-b50c-8fae6e6112eb@gmail.com>
 <20240812105732.5d2845e4@kernel.org>
 <CAHS8izPb51gvEHGHeQwWTs4YmimLLamau1c4j=Z4KGM8ZJrx5g@mail.gmail.com>
 <a6747b29-ed79-49d4-9ffe-b62074db1e09@gmail.com>
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

On Mon, 12 Aug 2024 20:10:39 +0100 Pavel Begunkov wrote:
> > 1. Drivers need to be able to say "I support unreadable netmem".
> > Failure to report unreadable netmem support should cause the netlink
> > API to fail when the user tries to bind dmabuf/io uring memory.
> > 
> > 2. Drivers need to be able to say "I want a header pool (with readable
> > netmem)" or "I want a data pool (potentially with unreadable netmem)".
> > 
> > Pavel is suggesting implementing both of these in 2 different flags.
> > 
> > Jakub is suggesting implementing both with 1 flag which says "I can
> > support unreadable netmem for this pool" , and guarding against #1
> > with a refcount check to detect if a dmabuf pool should have been
> > created but wasn't.  
> 
> That would be iffy IIUC, but I think Jakub just explicitly said
> that the refcount trick was just for debugging purposes and not
> for gauging errors like "providers are not supported by the driver".
> 
> "Yup, the refcount (now: check of the page pool list) was meant
> as a WARN_ONCE() to catch bad drivers."

Sorry, insufficient caffeine level in the morning.
We can't WARN_ONCE(), indeed.
