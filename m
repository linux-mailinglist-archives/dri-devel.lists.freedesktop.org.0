Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B7965072
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 22:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A3F10E1B8;
	Thu, 29 Aug 2024 20:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pgh05sZH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C6910E1B8
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 20:06:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96739A4289A;
 Thu, 29 Aug 2024 20:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22A9C4CEC1;
 Thu, 29 Aug 2024 20:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724961962;
 bh=jjY3PbslKhfXvlshQ539eQ+z8Cll4clbilq8gY8N3I0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pgh05sZHH1ibogv5993BrLByQD2Hc0qfcAv2NJeBS3Mftf84AbXP9FW90wTGti+Tf
 ru32QNYkthl3hI0pSdGfQtUdsHeU1uWr6boa5WmBadB/vr4S5eY2mzVWaDVz/GH8Ks
 JvpRPHZu38SQAmQmVTfol3Si3hAjwgijOkJkBnM/xm9lUV+WW1lQ07x1jXV6BdovV9
 ZQLhh2jTkOWKq8dmJVXCjaUdIP0R1ph0q54o9t2g7Pi9fTt4xeg0jKN26ZYxsETwJC
 pkVrvKZrhYyJUI3CTFCDMW/PZRtCtcwBFmOQJTvVO7vMftTj08uaE4xrP321ZNlR4R
 cuA4wT2MNl2xw==
Date: Thu, 29 Aug 2024 21:05:48 +0100
From: Simon Horman <horms@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Andreas Larsson <andreas@gaisler.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>,
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Nikolay Aleksandrov <razor@blackwall.org>, Taehee Yoo <ap420073@gmail.com>,
 Willem de Bruijn <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH net-next v23 03/13] netdev: support binding dma-buf to
 netdevice
Message-ID: <20240829200548.GX1368797@kernel.org>
References: <20240829060126.2792671-1-almasrymina@google.com>
 <20240829060126.2792671-4-almasrymina@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829060126.2792671-4-almasrymina@google.com>
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

On Thu, Aug 29, 2024 at 06:01:16AM +0000, Mina Almasry wrote:

...

> diff --git a/net/core/netdev-genl-gen.c b/net/core/netdev-genl-gen.c
> index 6b7fe6035067..8b87801e8d1c 100644
> --- a/net/core/netdev-genl-gen.c
> +++ b/net/core/netdev-genl-gen.c
> @@ -8,6 +8,7 @@
>  
>  #include "netdev-genl-gen.h"
>  
> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>

Hi Mina,

Strangely, when tools/net/ynl/ynl-regen.sh -f runs, it places
the includes in the opposite order.

I raise this as it may lead to churn later.

...

> diff --git a/net/core/netdev-genl-gen.h b/net/core/netdev-genl-gen.h
> index 67c34005750c..01ef29ace149 100644
> --- a/net/core/netdev-genl-gen.h
> +++ b/net/core/netdev-genl-gen.h
> @@ -9,6 +9,7 @@
>  #include <net/netlink.h>
>  #include <net/genetlink.h>
>  
> +#include <linux/list.h>
>  #include <uapi/linux/netdev.h>

Ditto.

...
