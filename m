Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EC0966880
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C9310E549;
	Fri, 30 Aug 2024 17:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LjZbkURy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E8C10E549
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:59:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00FD15C10B5;
 Fri, 30 Aug 2024 17:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC5CC4CEC2;
 Fri, 30 Aug 2024 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725040743;
 bh=2Jkgq5he2WxrmzFT3bK4fOcS2dH6LFp69dhviYcUaOg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LjZbkURyQNKOAXItRoOtb5ppDFUPv+/i17eT3Ov4/nCswre0krz2mianWNuHI1r8v
 yExKTIdr9UX67PvPwuSPK4U3Wf+NlFoWyTljiZhgcBStuHt1V2pUJopoJyailtq18K
 yLPiChNodDGr4fr4tlLmC/K3qIiUjplzLeLAa7oR7VDZMYP+vUGFTZkOKxxb2cDhYD
 TBO3c0v91ccwTLdQahN5cxNE1w/rE6kPrNVD6eh0vVP3WbCWknqpNHcP5Tqc1ImrEE
 TBJtJvmIu954K/MBIzWorcfi12TV8HA6GQP5d7NasrFNQTufqL94j3/PGxTK3U3gxf
 cGCV90knr8wOg==
Date: Fri, 30 Aug 2024 10:59:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240830105901.27e2e139@kernel.org>
In-Reply-To: <CAHS8izOy26r0uoWdASgmBCENNS6cDjHpkp+AHhOaKVkZR1LZqQ@mail.gmail.com>
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com>
 <20240829140824.555d016c@kernel.org>
 <e6df00ec-2c52-489e-a510-b69db7e9dbf9@linux.dev>
 <CAHS8izOy26r0uoWdASgmBCENNS6cDjHpkp+AHhOaKVkZR1LZqQ@mail.gmail.com>
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

On Thu, 29 Aug 2024 22:41:17 -0700 Mina Almasry wrote:
> Thank you, I think the right fix here is to reacquire rtnl_lock before
> the `goto err_unbind;`, since err_unbind expects rtnl to be locked at
> this point.

FWIW it's best to keep the error path a mirror image of the success
path, so I'd add a new label "err_relock" or something. But..

> This could introduce a weird edge case where we drop rtnl_lock, then
> find out genlmsg_reply failed, then reacquire rtnl_lock to do the
> cleanup. I can't think of anything that would horribly break if we do
> that, but I may be missing something. In theory we could race with a
> dmabuf unbind call happening in parallel.
> 
> If we can't reacquire rtnl_lock to do the cleanup, I think I need to
> revert back to doing genlmsg_reply inside of rtnl_lock, and dropping
> the lock before we return from the function.

..indeed, best to keep it atomic. So let's hold rtnl_lock longer.
genlmsg_reply() shouldn't block, AFAIU.

BTW CI is quite behind but Yunsheng ignored it and reposted his
"refactor" which is going to take us another 10 hours back, 
so whatever, just post v24 when you're ready...
