Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 979DF940BCF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149B210E24E;
	Tue, 30 Jul 2024 08:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="iBhmIlEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5541A10E24E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722328685; x=1722933485; i=markus.elfring@web.de;
 bh=07fx0OcCY32v0SirWQHDNSZfPG7HMF4hAqbJnMhyg3s=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iBhmIlEu1DTEhbIId4CW/iiPJylb+jiOQ9na/RS5h69bGT/imWvKAbYeaJ6pivjz
 JMnQXpy3cOlHf6p3bxFw2uqBaGPOuz17LrdoEApiGvMmHL9F2kIIYCb9ueGy62+tI
 Z412cOhJGP5xxEr98kCfPNdYFjVPufN30A6OcLhTRbHeOoqDpZ30cxm7YBR3nSSWl
 8w95ukxErNzkX2hWTvH3N3Q/O+9nRoQJ+CINjbJQKXo8kr7CjpakPcjmpI9mTGMkm
 t7htz1r1rdr1c1sSbkVKfGHWXeJSssKDwuuEu3A8VxxvqEIW9YncbE1WpCLHOz/i4
 zpVozzeWA1xcB3gjBw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKMA1-1sq6tO21QF-00MgS1; Tue, 30
 Jul 2024 10:38:05 +0200
Message-ID: <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
Date: Tue, 30 Jul 2024 10:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry <almasrymina@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andreas Larsson
 <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jakub Kicinski
 <kuba@kernel.org>,
 "James E. J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shailend Chand <shailend@google.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Shuah Khan <shuah@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Taehee Yoo <ap420073@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Yunsheng Lin <linyunsheng@huawei.com>
References: <20240730022623.98909-4-almasrymina@google.com>
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to
 netdevice
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240730022623.98909-4-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3zASUQdt0WnRJJo2JsH8HgMCSLLJrSOm6wxlRg1HbHDrGJYPFAR
 4UrI46t5fFnsIQP5D20a4Q4/ar+Qe149EAafa7XhskHQN56xyU9dWXWOdOe9cqX+BeVMF3I
 8WFhpDkIxnYHJeZdnRHZDAN3teiQz55j6x07IL1LXqdRPVKwtTq1AIEwtRutuGvYx2Pn/lI
 6wer7tct5AinmIXcBPXRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pHmLyOskFkY=;I7pCl1VILl5yztEF5uEKXmycDP5
 HNg30ml4ujtQp8hDTQ3k68nNJHnulVh43c1GvXrokXoDUhvvfoxNn12GmkZ+HgPxu8P5cN86n
 HjOpfP8/MmUIpzxPlAqq3wxO4BHOXC7nCoou7XGF6loLekm4A+xubNt9riTQyV1qFBcyB94i1
 9nkx3l/0I3vtPPF6IXAuFeSgWGNbnMAc5yBzRdvhRx4NgMckDkjJvObOV+sApUE4abxW5IdYc
 buKUkVmNMowUtx9d8ohNyHP5l0MvM+BrMJ+U6i6NSpHCcHyN+Db4gk/km/Nfpyxzicq+cw9kM
 dbUuFQy20IeEzlt0JBmJTvh3npkouDOC8d+ppHNvGFDc2VX95QZiP8oAV1KqYVeet622rengR
 3AtZYxLW2HL9cJRJdGCFiSSoh2Ma1PdedqtRTNQE8x65ul4oZ5zC5oC7GI0KrfC2lDBmt7U9H
 d3quaXmP5M08fs3HGNmDo2dJT4Mof8Rvu8b/1zeyNdFkx2ISKEqxruq9cgOvPVDOzWnM6q1hQ
 j/Oo//f3eoHLmD9gSZJlyPqNPXnEofdZIoAkzr1NHrrLlxHQQCxQg4K2Ctyi0eEOGrXaAGGMW
 U86dnhPzR1dN3MoSlZwMFv+d+ur6MNAU2LFwQiVgsiYO2r4PdA6g2/epD6XWGMZzsV3xD1bW9
 ezFK4C0vxtvaDH0C0PO+CEdfJXWpA6ElBZbDAsD0DefszWZDdZo0DdR8nfhg96M442XbukoWM
 HqCWkB1S51RK5OLQqCoLFxLM1/As4Y1LHCojxd9Oj8S237g0l+yUpVWT2ul1az/vHGJE2iOpx
 VrU7WYLZwjqQf3tDPMnChwHw==
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

=E2=80=A6
> +++ b/include/net/devmem.h
> @@ -0,0 +1,115 @@
=E2=80=A6
> +#ifndef _NET_DEVMEM_H
> +#define _NET_DEVMEM_H
=E2=80=A6

I suggest to omit leading underscores from such identifiers.
https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+or+d=
efine+a+reserved+identifier

Regards,
Markus
