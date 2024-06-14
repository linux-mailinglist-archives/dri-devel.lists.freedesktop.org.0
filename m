Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E749080B3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 03:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4C910EB36;
	Fri, 14 Jun 2024 01:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sg9ZtS8y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F0B10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 01:35:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C0251CE1BF9;
 Fri, 14 Jun 2024 01:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61242C2BBFC;
 Fri, 14 Jun 2024 01:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718328897;
 bh=CYOxmE4ntQW4bNMvxq9UIlsEBzTRL4qLB1FV48Xatv4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sg9ZtS8yEezxbjTVPI568a2KvEHqvKq8ud8+uPe6dGMbTueQSEMPMAgj2PCgXuIB9
 Il047nqeXnP6P/oSYmAKQCAxosjwrgYOaHdSYN8DpizcnGRlWkldLzTTe90OSa9FGv
 MBAW9iL444FGaNr9FcdswWY3pHc51pXPD6UDrHaFRQu/JWFwS+m0CctYfvcTP+Y/us
 3tPXqBkvjF/1WlqhH8l2wOQHXRcCWEIeW4JHfm3b/MLKWXXuS8tFi+ZMZi3LlOasMl
 Pv1svqR65L1eeiVLZrRKEQMiPGyOnYtk2TTlgDn5OVb4lEV9805bZIfH/6hgbdu1Gs
 S7zj/D1FRPg8w==
Date: Thu, 13 Jun 2024 18:34:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Arnd Bergmann <arnd@arndb.de>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, "Christian
 =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, Nikolay
 Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v12 00/13] Device Memory TCP
Message-ID: <20240613183453.2423e23b@kernel.org>
In-Reply-To: <20240613013557.1169171-1-almasrymina@google.com>
References: <20240613013557.1169171-1-almasrymina@google.com>
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

On Thu, 13 Jun 2024 01:35:37 +0000 Mina Almasry wrote:
> v12: https://patchwork.kernel.org/project/netdevbpf/list/?series=859747&state=*

patches 5 and 6 transiently break the build

../include/trace/events/page_pool.h:65:23: error: use of undeclared identifier 'NET_IOV'
   65 |                   __entry->netmem & NET_IOV, __entry->pfn, __entry->release)
      |                                     ^
../include/trace/events/page_pool.h:91:23: error: use of undeclared identifier 'NET_IOV'
   91 |                   __entry->netmem & NET_IOV, __entry->pfn, __entry->hold)
      |                                     ^

Looking at NIPA status the builders are 12h behind, so please don't
repost immediately. This series takes a lot of compute cycles to build.

FWIW there is a docker version of NIPA checks in the nipa repo.

https://github.com/linux-netdev/nipa/tree/main/docker

IDK if it still works, but could help avoid mistakes..
