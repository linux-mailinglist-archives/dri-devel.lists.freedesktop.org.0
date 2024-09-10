Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ABE9726C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 03:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DF810E637;
	Tue, 10 Sep 2024 01:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LsjAGTQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD2310E637
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 01:56:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 68887A40E16;
 Tue, 10 Sep 2024 01:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09B3C4CEC5;
 Tue, 10 Sep 2024 01:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725933379;
 bh=hQIohTpGoGCWnimJ1WTILi++IMB0fJOotB8xmPurEMY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LsjAGTQMGnJ6P2MG1V7Cg14/mW7M47zCU3SUxtCsppTwztGealCF8izjpQT2zu61A
 wYHXnyY4N0r09fOMnUWI5YC3b4HmKxm+Ay0HQTYrk+Dm1IEMe0T8CAGnDfTpmaTgdb
 WBrDLGImIhSrlix8oxBiFCHVhhDVCkXVX3PGTjURUIgLMdPDjJ3b7BwdShJQ4BfDaj
 GnnwTU0+HMb7C05k51WOPUbMUik7MLxyhB5Buwf1hXG0dLn9zUHLsMTQJsQ/D3cb/i
 h+uqGxW9xZ5PAiQLKeH5dZLeHwdme2LgmmdAPBg0rfO8+OcOXh7k+PNEZcNV0ansmm
 /T+2TYSXw2xIw==
Date: Mon, 9 Sep 2024 18:56:17 -0700
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
 Taehee Yoo <ap420073@gmail.com>, Willem de Bruijn <willemb@google.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [PATCH net-next v25 06/13] memory-provider: dmabuf devmem
 memory provider
Message-ID: <20240909185617.79b0d3fa@kernel.org>
In-Reply-To: <20240909054318.1809580-7-almasrymina@google.com>
References: <20240909054318.1809580-1-almasrymina@google.com>
 <20240909054318.1809580-7-almasrymina@google.com>
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

On Mon,  9 Sep 2024 05:43:11 +0000 Mina Almasry wrote:
> diff --git a/include/net/netmem.h b/include/net/netmem.h
> index 5eccc40df92d..8a6e20be4b9d 100644
> --- a/include/net/netmem.h
> +++ b/include/net/netmem.h
> @@ -8,6 +8,7 @@
>  #ifndef _NET_NETMEM_H
>  #define _NET_NETMEM_H
>  
> +#include <linux/mm.h>
>  #include <net/net_debug.h>

This should be in the previous patch, I think. page_address() etc.

> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 52659db2d765..c737200f4fac 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -11,6 +11,7 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  
> +#include <net/netdev_rx_queue.h>
>  #include <net/page_pool/helpers.h>
>  #include <net/xdp.h>
>  
> @@ -24,8 +25,10 @@
>  
>  #include <trace/events/page_pool.h>
>  
> +#include "mp_dmabuf_devmem.h"
>  #include "netmem_priv.h"
>  #include "page_pool_priv.h"
> +#include "mp_dmabuf_devmem.h"

nit: duplicate include

With that:

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
-- 
pw-bot: cr
