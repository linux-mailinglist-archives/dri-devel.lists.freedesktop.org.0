Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E792DE05
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 03:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEC510E16D;
	Thu, 11 Jul 2024 01:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rZ+GOJjB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E5F10E16D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 01:36:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EBAD2CE17E0;
 Thu, 11 Jul 2024 01:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F41FC32781;
 Thu, 11 Jul 2024 01:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720661762;
 bh=Hqr9mmbkEJ+SKI+sb4EdVGkA9dVoZOX7yW+I50QePp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rZ+GOJjB93xoU6UJ2PdTrOFqj6GaZIkE9XcK6GAgChSeAygix+EySdQXQ0WR5Kz+H
 WCjNqakxEQLT6/Af+MwzHg1x4tCzR5hPjqsoOlVcL/1rcSJr6S9AeA4ZN0I0HittDJ
 bUGA3V+8b3i7ULWXkwvf6D//5Kzlg+/oUCcYIVgmnTeKxMRKg41EwjPD3SBCwBSYov
 ZTEFlT3e4YHM2jDotLjffFrrNk34zKJndcvFAfee3/1+SOhBbUPU7HaStIvkVPR6dW
 dYaO9ltHOHaCeXYK60ww88Q9AHqSlwIEYVIfGHWIGsPp/F1t2GYOu4fF58ce+oWeZp
 iBrKtAm718JUA==
Date: Wed, 10 Jul 2024 18:35:59 -0700
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
 <pkaligineedi@google.com>
Subject: Re: [PATCH net-next v16 13/13] netdev: add dmabuf introspection
Message-ID: <20240710183559.64c9071f@kernel.org>
In-Reply-To: <20240710001749.1388631-14-almasrymina@google.com>
References: <20240710001749.1388631-1-almasrymina@google.com>
 <20240710001749.1388631-14-almasrymina@google.com>
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

On Wed, 10 Jul 2024 00:17:46 +0000 Mina Almasry wrote:
> Add dmabuf information to page_pool stats:
> 
> $ ./cli.py --spec ../netlink/specs/netdev.yaml --dump page-pool-get

Aha, thanks!

Reviewed-by: Jakub Kicinski <kuba@kernel.org>
