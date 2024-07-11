Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEF92DDE0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 03:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8AA10E008;
	Thu, 11 Jul 2024 01:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Nu7j9vqd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A263E10E008
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:22:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0ED19CE13C6;
 Thu, 11 Jul 2024 01:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA79C32781;
 Thu, 11 Jul 2024 01:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720660925;
 bh=QjOULS8b+CZJ29PyHWRuJmie+Hn55IcoVG3HP/3LohE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nu7j9vqdXFB65PlvnMG07kLL4ivK1FfVmXPHqTj2KJK596Mc9VqYs9lJeZEnKP7ON
 zXThKeg9bymdodZ2PIefG7emFD2gdT5qBsgTLm+H20XqJqPqzN0EFhC0m76b69HAKY
 IYbR340PfQzawxYhWyFufDRPBQHIiiklguQ7ygzJqm+l2Li6ovHnuc9HjM2IhUp6DQ
 /pG5oYdKyNVQMInWszt3EtEL8K4E758yZUnsbrn5XLQuIRBzGAmZ53YVSi6XiVF6Hp
 w6+ekApzB8N7QHyw3aeV+j7GzkIcFhh/EmmQxXvlulGRFFFtOWh1wCj2EME4SmvAhb
 q7RK7aphR1DUQ==
Date: Wed, 10 Jul 2024 18:22:02 -0700
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
Message-ID: <20240710182202.0324279f@kernel.org>
In-Reply-To: <CAHS8izPnFxeEMEQkxq=A9Rp7T8ADJ__3eWfeQmC2hEBYQVzcvw@mail.gmail.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-6-almasrymina@google.com>
 <20240710094900.0f808684@kernel.org>
 <CAHS8izPnFxeEMEQkxq=A9Rp7T8ADJ__3eWfeQmC2hEBYQVzcvw@mail.gmail.com>
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

On Wed, 10 Jul 2024 13:29:03 -0700 Mina Almasry wrote:
> If we want to add __skb_frag_ref() support for net_iov I suggest something like:
> 
> diff --git a/include/linux/skbuff_ref.h b/include/linux/skbuff_ref.h
> index 0f3c58007488a..02f7f4c7d4821 100644
> --- a/include/linux/skbuff_ref.h
> +++ b/include/linux/skbuff_ref.h
> @@ -17,7 +17,13 @@
>   */
>  static inline void __skb_frag_ref(skb_frag_t *frag)
>  {
> -       get_page(skb_frag_page(frag));
> +       netmem_ref netmem = skb_frag_netmem(frag);
> +
> +       /* netmem always uses pp-refs for refcounting. Never non-pp refs. */
> +       if (!netmem_is_net_iov(netmem))
> +               get_page(netmem_to_page(netmem));
> +       else
> +               page_pool_ref_netmem(netmem);
>  }

Probably not much better since freeing still looks at the recycle bit.
Eric and Willem acked patch 8, maybe it works, and if it doesn't we
know who to call :) I can't point out any case that won't work so if 
y'all think this is fine, let's leave it.
