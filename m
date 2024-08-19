Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF99577F8
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 00:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872110E3DD;
	Mon, 19 Aug 2024 22:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SROf+HJO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8A10E3DD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 22:45:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E9249602F8;
 Mon, 19 Aug 2024 22:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C33C32782;
 Mon, 19 Aug 2024 22:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724107551;
 bh=J5q5uBzN4noHKYqi53b0GrvoaGSBGa+HJHli2/GUX5Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SROf+HJOW26xj6Eb+qvALMO23ofHkbMQrVuGD3hxiBBOOf8QwTZfzJfrwfxf+r6E9
 wvoW3HyjL7Vl7oKFURngKHRPu97VZpVepVHUruLzXrsqmXaGWayRKkzHhVvMlP0HJz
 gByRQYGWCnTlYf1PNzBfYOzjxHh9SYtiVHR4/JD5r/zCfkpyPjN3YRM4W56FElDu7b
 1Q1t/oB2/EY13LwPzw2uQWwAQzaAymTW20GIvRjXkYHIGrCkPVEapoOmbk1OTEL8OA
 t22Zqjorjg2+Sy9rlyf8eXrW5NLJY6VtwY1WrPs0+cQYIwBjnQNSt2fHyeokmG7VIr
 7nav8hvllxaCA==
Date: Mon, 19 Aug 2024 15:45:49 -0700
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
 Taehee Yoo <ap420073@gmail.com>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v20 00/13] Device Memory TCP
Message-ID: <20240819154549.3df4589b@kernel.org>
In-Reply-To: <CAHS8izMqcLnmo9792FPkkXPQSBWSjFGO+QHhkou=PaDHLwtsRw@mail.gmail.com>
References: <20240819035448.2473195-1-almasrymina@google.com>
 <CAHS8izMqcLnmo9792FPkkXPQSBWSjFGO+QHhkou=PaDHLwtsRw@mail.gmail.com>
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

On Mon, 19 Aug 2024 16:38:32 -0400 Mina Almasry wrote:
> Looks like in this iteration I resolved the previous test failure, but
> introduced a build regression with certain configs:
> 
> ld: vmlinux.o: in function `netdev_rx_queue_restart':
> (.text+0x6a4133): undefined reference to `page_pool_check_memory_provider'
> make[3]: *** [../scripts/Makefile.vmlinux:34: vmlinux] Error 1
> make[2]: *** [/home/kunit/testing/Makefile:1156: vmlinux] Error 2
> make[1]: *** [/home/kunit/testing/Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> Looks like I'm not build testing with enough config variations (in
> this case CONFIG_NET=y but CONFIG_PAGE_POOL=n). I've fixed the issue
> locally and added a test to my presubmit checks with this config and a
> couple of risky others. Sorry about that.

Happens! Please share v21 later today I'll skip reviewing this one.
