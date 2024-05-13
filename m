Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513BD8C4A13
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 01:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96C10E594;
	Mon, 13 May 2024 23:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UJ4+eKX9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41D610E594
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 23:31:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 26140CE10BF;
 Mon, 13 May 2024 23:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781EFC113CC;
 Mon, 13 May 2024 23:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715643077;
 bh=edYEvfVF7LrKCEOZSZcW2VnvwSmiDi2QkoyU4leeWL4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UJ4+eKX9Jjb5n009vEa+fw3qm93HTsbq6E/2kjaqWw2wukzg/halQAfNZEZXm/LE4
 VseHIcoczFEhUFNJrX+hE4brEcaqhJYLF5QDeawrQXHzGtVSeWHqMAph2zfIoqyKzs
 dOJA+Rc3OrJVxsqBTVfE67aPPpe9lMIgv3q46l/7C7ygJVD9GHoY5L6Ff+NHFHfw2i
 EpUgZS3K/R4TIL0bsax/NTea+fsRH6i/BQKSVamsq7sDeOuVD37dm9gghM9OITGk7Y
 MbBxbNA6+ZDp6bsz2N1nY5IAOc0jzEJb0dHK2wgUTlLTS0Qe7idImQezxoSFuJYfYW
 r/H0ew9pGJ3Hg==
Date: Mon, 13 May 2024 16:31:14 -0700
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
 <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, "Christian
 =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Pavel Begunkov
 <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, Jason Gunthorpe
 <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, Shailend Chand
 <shailend@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v9 00/14] Device Memory TCP
Message-ID: <20240513163114.52b44f66@kernel.org>
In-Reply-To: <20240510232128.1105145-1-almasrymina@google.com>
References: <20240510232128.1105145-1-almasrymina@google.com>
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

On Fri, 10 May 2024 16:21:11 -0700 Mina Almasry wrote:
> Device Memory TCP

Sorry Mina, this is too big to apply during the merge window :(
-- 
pw-bot: defer
