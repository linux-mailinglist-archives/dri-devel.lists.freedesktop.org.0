Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60A99A789
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 17:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4C110EB15;
	Fri, 11 Oct 2024 15:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I8L75zVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0F610EB15
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 15:27:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 40AA45C59EC;
 Fri, 11 Oct 2024 15:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64E81C4CEC7;
 Fri, 11 Oct 2024 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728660431;
 bh=sGWntrz3wIyVB8alp9rpncuZ1V1KDuURy3H+JpEcM7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I8L75zVtrZx7w5SpRULZ/piL2MAHcg+XRpGLvOSuuaq79SJWN4Fma1eeimZ3TTbVB
 s3Tj07SktC4NyMlxdWrHxkP9B09QxKjTACbn46Lcb7EZmhdJiFuU6u5LM0LB+VOnwB
 ipxmM/V1tJE/lNo+oR0h67Z16lt34GSW47dbcRsA2Rcnm7hvFzitsQaVu0tDTBL7I1
 XrWK27pP7SdJ/JUMi4LEQxyVwYXTQYUn1hmQM2ozZex/gG6pI4W/jWyE7zsMYDHYlF
 b7b0dB6+vFHNuxfWZal17srhcGgebXOevLR69yA//3wjEvgTu0P9zbH1pTrGNR4W9m
 VsL6bpzNsWhgg==
Date: Fri, 11 Oct 2024 08:27:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: "Lai, Yi" <yi1.lai@linux.intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
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
 Bruijn <willemdebruijn.kernel@gmail.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej
 Fijalkowski <maciej.fijalkowski@intel.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Shuah Khan <shuah@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, John
 Fastabend <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Pavel Begunkov <asml.silence@gmail.com>, David
 Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Christoph
 Hellwig <hch@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>,
 Taehee Yoo <ap420073@gmail.com>, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, yi1.lai@intel.com
Subject: Re: [PATCH net-next v25 10/13] net: add SO_DEVMEM_DONTNEED
 setsockopt to release RX frags
Message-ID: <20241011082707.5de66f15@kernel.org>
In-Reply-To: <CAHS8izPuEUA20BDXvwq2vW-24ez36YFJFMQok-oBDbgk6bajSA@mail.gmail.com>
References: <20240909054318.1809580-1-almasrymina@google.com>
 <20240909054318.1809580-11-almasrymina@google.com>
 <Zwe3lWTN36IUaIdd@ly-workstation>
 <CAHS8izPuEUA20BDXvwq2vW-24ez36YFJFMQok-oBDbgk6bajSA@mail.gmail.com>
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

On Thu, 10 Oct 2024 12:05:38 -0700 Mina Almasry wrote:
> diff --git a/net/core/sock.c b/net/core/sock.c
> index 083d438d8b6f..cb3d8b19de14 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -1071,11 +1071,11 @@ sock_devmem_dontneed(struct sock *sk,
> sockptr_t optval, unsigned int optlen)
>             optlen > sizeof(*tokens) * MAX_DONTNEED_TOKENS)
>                 return -EINVAL;
> 
> -       tokens = kvmalloc_array(optlen, sizeof(*tokens), GFP_KERNEL);
> +       num_tokens = optlen / sizeof(struct dmabuf_token);
> +       tokens = kvmalloc_array(num_tokens, sizeof(*tokens), GFP_KERNEL);
>         if (!tokens)
>                 return -ENOMEM;
> 
> -       num_tokens = optlen / sizeof(struct dmabuf_token);
>         if (copy_from_sockptr(tokens, optval, optlen)) {
>                 kvfree(tokens);
>                 return -EFAULT;
> @@ -1083,6 +1083,10 @@ sock_devmem_dontneed(struct sock *sk, sockptr_t
> optval, unsigned int optlen)
> 
>         xa_lock_bh(&sk->sk_user_frags);
>         for (i = 0; i < num_tokens; i++) {
> +
> +               if (tokens[i].token_count > MAX_DONTNEED_TOKENS)
> +                       continue;

For the real fix let's scan the tokens before we take the xa lock
and return an error rather than silently skipping?

>                 for (j = 0; j < tokens[i].token_count; j++) {

