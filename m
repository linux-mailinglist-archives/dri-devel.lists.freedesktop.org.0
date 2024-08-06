Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306B9499B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 22:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4E10E0F8;
	Tue,  6 Aug 2024 20:59:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bD3DuZ2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2312610E0F8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 20:59:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2449A60F08;
 Tue,  6 Aug 2024 20:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82C3C32786;
 Tue,  6 Aug 2024 20:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722977967;
 bh=oQ7qityzvDiPJTZS3Szpb70s0aIQdtnagYi0Qj0kT00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bD3DuZ2+SxmgaCgzJWHtZH/BYbg66l2gd+LZppP8V0SjvcVqsJKtaaiDssO1v+eTr
 DepGkqmJxITFe54Lre2tS/vEGrc22Vu63ljH1RRMC3HUSH2BP59CbVsybYRx5BroxY
 QzqlaSzYfm+jheMBLL1UJu7QHVFmgQmRAU9zimWldMZ8D1XFiUqchTvoNAaiXS7hzH
 URysUscNMnVRS9xQk9PTPdzDrWF0jmd8XP7i5YGixpWl4NoGrnzp/dD/HTEvG8s/13
 HUuL28HXkNnUqRHm0Cu4xB/2+bNxvDDDYP/Iqrw7CXRtllgNPubXkFhZKGOucEcp/W
 CHGsOnZxxgIOw==
Date: Tue, 6 Aug 2024 13:59:24 -0700
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
 <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, Kaiyuan
 Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v18 07/14] memory-provider: dmabuf devmem
 memory provider
Message-ID: <20240806135924.5bb65ec7@kernel.org>
In-Reply-To: <20240805212536.2172174-8-almasrymina@google.com>
References: <20240805212536.2172174-1-almasrymina@google.com>
 <20240805212536.2172174-8-almasrymina@google.com>
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

On Mon,  5 Aug 2024 21:25:20 +0000 Mina Almasry wrote:
> +	if (pool->p.queue) {
> +		/* We rely on rtnl_lock()ing to make sure netdev_rx_queue
> +		 * configuration doesn't change while we're initializing the
> +		 * page_pool.
> +		 */
> +		ASSERT_RTNL();
> +		pool->mp_priv = pool->p.queue->mp_params.mp_priv;

How do you know that the driver:
 - supports net_iov at all (let's not make implicit assumptions based
   on presence of queue API);
 - supports net_iov in current configuration (eg header-data split is
   enabled)
 - supports net_iov for _this_ pool (all drivers must have separate
   buffer pools for headers and data for this to work, some will use
   page pool for both)

What comes to mind is adding an "I can gobble up net_iovs from this
pool" flag in page pool params (the struct that comes from the driver),
and then on the installation path we can check if after queue reset
the refcount of the binding has increased. If it did - driver has
created a pool as we expected, otherwise - fail, something must be off.
Maybe that's a bit hacky?
