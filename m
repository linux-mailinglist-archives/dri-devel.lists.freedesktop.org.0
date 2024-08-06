Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D119489B8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 09:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0C210E1AC;
	Tue,  6 Aug 2024 07:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="cSj5dWQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755B810E1AC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 07:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1722927849; x=1723532649; i=markus.elfring@web.de;
 bh=7HePuyoWPygVPxh4qKr24Yod2wxAsQz31TbzWEQpLRQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=cSj5dWQR8D/Yr2XelvdA8aIdw86g7FambXKBGbjODYndTbX5iKhfNMKgdwW5BLry
 OABVGiyjAI1RZngwW8YAbH5Dl+6EF/aXusJ/IYrSJczvGGcF/pskZtUJEHdr19Mf7
 LAjsJAfDmHUhAOj4vC3HCMJqEecd27PKEqh7q0CDGri0lJQ0SjUOV3LOFHEW3CPvx
 /QdGJMyatjTHk7LsbSLKBdy0ubVqpTfDC9jfZnDZtRgdqthgms8rqnxfMzGbnuZFj
 pQvBd4isJhFXUq7lQugceo/nPt869eQe9my2BViz4oG6l7UiqB6KmTnHiHdq1kjGX
 sr/NTW+HbpwVQ+CFSw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbTL1-1s3oIK0Nk9-00mINb; Tue, 06
 Aug 2024 09:04:09 +0200
Message-ID: <9aad36fe-cd4c-4ce5-b4d8-6c8619d10c46@web.de>
Date: Tue, 6 Aug 2024 09:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v17 03/14] netdev: support binding dma-buf to
 netdevice
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Pavel Begunkov
 <asml.silence@gmail.com>, Willem de Bruijn <willemb@google.com>,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Andreas Larsson <andreas@gaisler.com>,
 Arnd Bergmann <arnd@arndb.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, Helge Deller <deller@gmx.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jakub Kicinski
 <kuba@kernel.org>,
 "James E. J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 <5d3c74da-7d44-4b88-8961-60f21f84f0ac@web.de>
 <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAHS8izPxfCv1VMFBK1FahGTjVmUSSfrabgY5y6V+XtaszoHQ4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ud03T+VJ0WQWkNGa/SuDGe/nuF0sGbh6xFVs6sj7mBpoHZmEK9m
 /g8pgN0ga+9LIF+xkm8yuxipRI1qpxk9O/iv4my6GHrRWDZdHWWggRKyAqliCerii6f6rsb
 4m+YAthbpuAnnWrnfbwf6MXbKNd/W6OA+m2MMbRtZr+OncP4jJnp6T9Z97ykCCWrjKOacd6
 hZrRGnLMzDmwJNYA5qgFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aqu47A+e2O0=;VzM8pvVSm8FhEM3nRa0vhoyP6PH
 FQqVL1fyGLNyHAR4hDHZH7aZ7oGRyq3D1xBu2DsdbqBNfRzalGoisLJFmiN5KYXs3tr7oRf2z
 wEThWi3/+MqOG+uYQnkY5FPKQ8rBxaCZzl0YcW0ToXYVLHlGvPSBUjcHOJKMWxHDPwgj97dK1
 D88Gd97X8XYY8lbARLnuK9KyaIIalXAGzkz4ywcutwpsjya92DOt5yKnnBZOCwwqAQLt/mMLQ
 c91VZzBWpbVkwd02pLcGttlbbVGcZmYx9kxtjFzH8SuBnHkZKC/I3W7wJ3qxYCfQXQiAghQY6
 ARtMyoAIB89mRLOnqRZhrtP6HAhNLV/cIJ/9KF31qGNTBeGGws4OoKeDC5r1emhA5OPT9eGrl
 j8JA/uAxaNtoNEaNjxo8Mb68ceg4G+NwUINofu7s4hllMjx+3skyOC53z5FNA6LQQq05BhONR
 kCbUXuId/cek5DRfXGLkqC0RUK3a50MdShfknWeKGeWIVr6/9WEiZvjt+fSTOU3n9YBUYjVF8
 QsPbRGfkRc8q/3+IgXMR75cHvoWk/N2ikNW/DWqPf9bfoNoRuFMOQa1BDBfCtOkMuk3iFdzWf
 4KpHzAtCivOaJRY9bo7zYmOCj4Iyxb0xaxdLof+HbuphJGx3XWn8zn1lGi+Wo8iv6gtpH0H9x
 NDTuWZOB+/cAQhhYmiET925TKYbmV5OC+4mxfL5eAEu8suEHDPBk8712x2MI7yXV6zGEVA4aN
 iZ8ZOedfqstQsce12f0C1DMMMfRkmzHUGkGWZLF737YPKdIyHM4xAuLPT8Evtiv466ApSBs14
 +0RwYZEtniMiEB7qAH6Gz88w==
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

>> =E2=80=A6
>>> +++ b/include/net/devmem.h
>>> @@ -0,0 +1,115 @@
>> =E2=80=A6
>>> +#ifndef _NET_DEVMEM_H
>>> +#define _NET_DEVMEM_H
>> =E2=80=A6
>>
>> I suggest to omit leading underscores from such identifiers.
>> https://wiki.sei.cmu.edu/confluence/display/c/DCL37-C.+Do+not+declare+o=
r+define+a+reserved+identifier
>>
>
> I was gonna apply this change, but I ack'd existing files and I find
> that all of them include leading underscores, including some very
> recently added files like net/core/page_pool_priv.h.
>
> I would prefer to stick to existing conventions if that's OK, unless
> there is widespread agreement to the contrary.

Under which circumstances would you become interested to reduce developmen=
t risks
also according to undefined behaviour?
https://wiki.sei.cmu.edu/confluence/display/c/CC.+Undefined+Behavior#CC.Un=
definedBehavior-ub_106

Regards,
Markus
