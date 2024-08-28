Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B2963074
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 20:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F2C10E5B1;
	Wed, 28 Aug 2024 18:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ROtLpkCE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 18:50:47 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9746310E5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 18:50:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 8D84AAE2CBA;
 Wed, 28 Aug 2024 18:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72659C4CEC0;
 Wed, 28 Aug 2024 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724870616;
 bh=bWjjtD9ux0QAGG3fGYObh74lsPxgFpjHa3YWm0m0vIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ROtLpkCEGD8Ucdbs7a1iRfvuc32G3qJBY6quO3vEkfgfTtRxHiuhmUPG4800e2RsG
 /Lm2aGh9ZM5echC/qr/x2EXrVQ45i6g+DGFDj3b4IL1+1nBBMKPOO7F2EVPH21SXWt
 D3wyLlY3wzUG+pAwc9PiOyoANcpRLYBPjrk80WBsoM0sK/mk/Y/+Np3wR59Dnj9tMd
 zCiuTrI/cV8v34a6M0pTb4HTETCCVIQdFJzGlV39b2ciDrjitNDYPxuwRZojB40abg
 4ctkvmZU35i1iPs5RMsbgdrXOvldO8psyPOoy6iI6yqUNNrEivtWT76jv46HwMkF1o
 46/gB0lOrWDFQ==
Date: Wed, 28 Aug 2024 11:43:33 -0700
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
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Arnd Bergmann
 <arnd@arndb.de>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert
 Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, Willem
 de Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBl?=
 =?UTF-8?B?bA==?= <bjorn@kernel.org>, Magnus Karlsson
 <magnus.karlsson@intel.com>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v22 04/13] netdev: netdevice devmem allocator
Message-ID: <20240828114333.560895f0@kernel.org>
In-Reply-To: <CAHS8izP8T5Xj97M7efecBmCrG9z8E0PYTxWCYZ0ym0hv13-DKg@mail.gmail.com>
References: <20240825041511.324452-1-almasrymina@google.com>
 <20240825041511.324452-5-almasrymina@google.com>
 <20240827191519.5464a0b2@kernel.org>
 <CAHS8izP8T5Xj97M7efecBmCrG9z8E0PYTxWCYZ0ym0hv13-DKg@mail.gmail.com>
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

On Wed, 28 Aug 2024 00:20:23 -0700 Mina Almasry wrote:
> > On Sun, 25 Aug 2024 04:15:02 +0000 Mina Almasry wrote:  
> > > +void net_devmem_free_dmabuf(struct net_iov *niov)
> > > +{
> > > +     struct net_devmem_dmabuf_binding *binding = net_iov_binding(niov);
> > > +     unsigned long dma_addr = net_devmem_get_dma_addr(niov);
> > > +
> > > +     if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
> > > +             gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);  
> >
> > Is the check necessary for correctness? Should it perhaps be a WARN
> > under DEBUG_NET instead? The rest LGTM:
> >  
> 
> Not really necessary for correctness per se, but if we try to free a
> dma_addr that is not in a gen_pool (due to some other bug in the
> code), then gen_pool_free ends up BUG_ON, crashing the kernel.
> 
> Arguably gen_pool_free should not BUG_ON, but I think that's an old
> API, and existing call sites have worked around the BUG_ON by doing a
> gen_pool_has_addr check like I do here, for example kernel/dma/pool.c.
> So I did not seek to change this established behavior.
> 
> I think WARN seems fine to me, but maybe not under DEBUG_NET. I don't
> want production code crashing due to this error, if it's OK with you.
> 
> Unless I hear otherwise I'll add a WARN without debug here.

WARN makes sense, I didn't know about the BUG_ON() hiding inside
gen_pool :(
