Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD63908674
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 10:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5DE10E1F1;
	Fri, 14 Jun 2024 08:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="UCBixyj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A7D10EC9C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1718354196; x=1718958996; i=markus.elfring@web.de;
 bh=tEN7viMJ5j3aehgKMwObJKvDGkUQ8ivpak0HTe06Zb0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=UCBixyj5wpF5GgGFSwmalxQQctIhRpiA18Je4F3tDkkWuZZtiUZZrMUXCZPyMOVZ
 BYZDl3EpPwwD/apF1P25VP9Ot+K2kyLQsaUNIrvXQyRqIlOwyDeh2APn34DkOfBys
 SIr96xLKx5ejIBZ2mKYVLUfEGwLjwzplWyXuVBcV2qqaKyzmtbFzBGdYnm5eSnwGl
 9up3Ikch+oqHIj3d5yJ9fTsVN7xSkTw0ZW9pQ/I4wRSREavOCJmmBv6zIcRLK6R3i
 ZC0sZGi+QLFDNnlR2nKGYrlV/sUVxn91jET0tkNih/92sP3GHPQ6U6mBFDsfAkyD1
 +H7DKcisO4YMufm+og==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTOha-1roSMR2rm8-00NMNN; Fri, 14
 Jun 2024 10:36:35 +0200
Message-ID: <e8763c5a-564f-4028-9a53-6952bb8d3567@web.de>
Date: Fri, 14 Jun 2024 10:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kaiyuan Zhang <kaiyuanz@google.com>, Mina Almasry
 <almasrymina@google.com>, Willem de Bruijn <willemb@google.com>,
 netdev@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, Andreas Larsson <andreas@gaisler.com>,
 Andrii Nakryiko <andrii@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, Daniel Borkmann
 <daniel@iogearbox.net>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, David Wei <dw@davidwei.uk>,
 Donald Hunter <donald.hunter@gmail.com>, Eduard Zingerman
 <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Hao Luo <haoluo@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>,
 Helge Deller <deller@gmx.de>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jakub Kicinski
 <kuba@kernel.org>,
 "James E. J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Matt Turner <mattst88@gmail.com>, Nikolay Aleksandrov <razor@blackwall.org>,
 Paolo Abeni <pabeni@redhat.com>, Pavel Begunkov <asml.silence@gmail.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Shailend Chand <shailend@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Steven Rostedt <rostedt@goodmis.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?=
 <tsbogend@alpha.franken.de>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Yunsheng Lin <linyunsheng@huawei.com>
References: <20240613013557.1169171-4-almasrymina@google.com>
Subject: Re: [PATCH net-next v12 03/13] netdev: support binding dma-buf to
 netdevice
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240613013557.1169171-4-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+k1dYnD+EokvOe1vbwZlKNTe1TX0WUdQkgaGG/qsgw+71bzJaIU
 QidjeMvWeiD+dR5qKEkr1x+LV3+NTDoz+xri6Tx700wOznJ1fcTyqDWN8Zimu67gntD9Pmc
 /opcmuVaUY3GrrOadwjoget165QeYilWHUurHYshbsEVVlXEFAA4s6i99lnb50QeTC8K9+C
 Uz8ayCasgXn+9xWrignEw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BWour/0vIC0=;GtGBkBE59JGFyQW5lwppqOQAJBO
 uUOT/qCm3s5hRQMKWcOgrm418Qdi4TOAZQBmou+I/sOwuv1i0hshrjzqo3MtvwrCL59oveA5C
 gtnkjHRykPBBeQBxupv6OnToEd23YIvzF+eG9l90ogEgzFGYxS9vNTzIcNhEZma4YGAmX8ITh
 MRmp2BAbgjuQRBd2F+7RPDHNvybhEmzY8pmyXVK4LJL+qr8DRmTqyiBmz4pmuG1LubCE6e0dW
 wl/bh5SP42t8LGPBA3IT76V7Ckqi7e/MKnmL2RioijJNeq+h7L3udV4p9KWr3qZmicA2RKscL
 mqt3OrMpu4uyAHqDvqlsCUpLHPvX5GhhRCFXP/JRyyITzDhcNf0DVERCEURylJJxEwaJG1OsD
 wopYbRTfG+YokVG8icH2pVI2/uRp2EIRqRuAgOh6DUzPZovh7LBwyj+0ok2hm9VkhWfp2Lp+J
 TAIv6wXbXHrhubxFbGjdmGSRph4Bow72Z7FscIUZDsTmrsT5ocGItVRpAY+Z8B8i9gU5JHc7o
 I9JZVHUxLWeKXDVW4EG9dfLtUDNw78xIWH4yTAizE5+UWLA0CWFmjuyDYMxe7gjjQZzPyQ5Gu
 NETFv6FRokjhiYVoUBKSSWhMFAc7c1YAPuvb/l7/u4oNblimt1rBfyvIV5SyHtCvxFsqlz4Xp
 RCRtXf7r2iGX1Slo230gSISOxIBvS3BYvNrArD1fT2IuVcntR4VMmwVylu7dRSULhioUKnByW
 8t0dfDjUXyACqbKCgOJfWEuAvo6cPVlN18Zof2kowY/767rdYgQam5blW2HRgtvrkfhBhdKzL
 YhNAMFS5MC9go/S33daoNUGbIZbVyFgs+cN3xErNaBkb0=
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
> +++ b/net/core/netdev-genl.c
=E2=80=A6
>  int netdev_nl_bind_rx_doit(struct sk_buff *skb, struct genl_info *info)
>  {
=E2=80=A6
> +	rtnl_lock();
> +
> +	netdev =3D __dev_get_by_index(genl_info_net(info), ifindex);
=E2=80=A6
> +err_unlock:
> +	rtnl_unlock();
> +	return err;
>  }
=E2=80=A6

Would you become interested to apply another lock guard?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#=
L124

Will scope-based resource management become more attractive
(also for the current source code adjustment)?

Regards,
Markus
