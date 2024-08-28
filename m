Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7C961C23
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DFD10E439;
	Wed, 28 Aug 2024 02:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b9Bmt1JR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBED110E13D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:32:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2D776CE1712;
 Wed, 28 Aug 2024 02:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E784C4FEE9;
 Wed, 28 Aug 2024 02:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724811874;
 bh=tbhzQ1da3mBVV060Og29QANn1s4vz5Vd4ovZ/NNJcUg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b9Bmt1JRKFBCrnIFqkRTsrtV2UxALLlwq9vjsa8mb6ADifsmdWpQkF6hV/RYp8vQA
 KnlrsUZWHHrZTtadELynyygYzNgxIL5XjiYXqvsDF4WjDbVNdoVWcjeJP/CMV5jE+5
 zHY1WzE7dhEgfg1nYdKdE+Kss/9anIAQAvEtqTsmXn5d1UFI9SFv6kPJc99SCMRNQM
 e5zmbEEJvj2B7cIjhKHtljG3nSZ00UtlbSdrVtBkmpzbQotM4l2h2mL+SWEBBmpQt7
 JSmguwlN4ydS894ghDp569iFgNhfAjPbkNp3FHOMAwrnt4gmuwMvVn9FUd04rX88Ko
 f0IMC8yARB4lw==
Date: Tue, 27 Aug 2024 19:24:31 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
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
 Taehee Yoo <ap420073@gmail.com>, linux-mm@kvack.org, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH net-next v22 05/13] page_pool: devmem support
Message-ID: <20240827192431.7145b06e@kernel.org>
In-Reply-To: <20240825041511.324452-6-almasrymina@google.com>
References: <20240825041511.324452-1-almasrymina@google.com>
 <20240825041511.324452-6-almasrymina@google.com>
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

On Sun, 25 Aug 2024 04:15:03 +0000 Mina Almasry wrote:
> +	/* Assume net_iov are on the preferred node without actually
> +	 * checking...
> +	 *
> +	 * This check is only used to check for recycling memory in the page
> +	 * pool's fast paths. Currently the only implementation of net_iov
> +	 * is dmabuf device memory. It's a deliberate decision by the user to
> +	 * bind a certain dmabuf to a certain netdev, and the netdev rx queue
> +	 * would not be able to reallocate memory from another dmabuf that
> +	 * exists on the preferred node, so, this check doesn't make much sense
> +	 * in this case. Assume all net_iovs can be recycled for now.
> +	 */

This is probably a bit too verbose, and we shouldn't talk about dmabuf
specifically:

	/* NUMA node preference only makes sense if we're allocating
	 * system memory. Memory providers (which give us net_iovs)
	 * choose for us.
	 */

Some of the code moves could be a separate patch, but either way:

Acked-by: Jakub Kicinski <kuba@kernel.org>
