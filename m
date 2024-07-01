Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF3D91E829
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2410E4D5;
	Mon,  1 Jul 2024 19:05:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qoXGPzP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DE410E4D5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 19:05:03 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6b52eb2ee2eso14562656d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1719860702; x=1720465502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1iyaJckUfwKLOavZsL0Dti/NvsfMxOg4fM60nbeLb3c=;
 b=qoXGPzP6sEn4rF8baq2ErHtF5iVJYP3YiiGPczdkFSd5fxE2GXfObOlikl83T2ltsG
 DKLAReet9MuOevw59p71XAKvMMVLvhlDVouhKbL2p+xdRuVom60SD+qH3Q4x4sWUta8X
 /J+CyAb6QNLjSNhRONHOziiTbVWq0PBTUykxu/EVae5crxQDGscBiDo51ox49gk/oEhw
 67F0VzQuqodCOy3q1S72vT+dx8UGomKaZVkPHhfOUtU99+StqXz3L7r3DvAYi57k7PIv
 TkZhmIVTIsQmkXSQlg9g+xuDN3ElsDjF4gsOLIvCMqfZDF+DYM0KLkGtU25x9+c03jKx
 CNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719860702; x=1720465502;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1iyaJckUfwKLOavZsL0Dti/NvsfMxOg4fM60nbeLb3c=;
 b=R1mCkzmqZA3fZEhx+tq/f7rqhwxz6fIcfpMkvGej81ahq6TyqlsPc0Qs+m+BqomAkQ
 2yRFAi7Ezyz/36ha+KO4aHnPvRz4Xg3vegCOAw0ltfGSOIOS5i4/I9ACNlPdWenQ7QHX
 QBh8wgzw3E7oOyUxQpSnLdjJEVZ9VPX/L9JTqe/gG5F3XciTZlrxoZ0ZttHOUoDQBHei
 DuMkbu/Anm0MyyD57DbnOP0UrffhUVwEnUGDpEF8xl9SV1BuvzHSq0/3VsZBctoow7wS
 +SXz62T2Fdgj3GzZHII2RCXUgqG23jDAEeErYT9I63tTV07Hsbfn8ISuEhsNMGZwgrsd
 3pjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXk1XKu0HZI6hjEjVL8O+uk7gT0IDf0IAbg3MKOzV25psacuTfHWAghhg0FOs52M8Cxm6hXcQxSug+nXf9g5bzdbZksw0lr1QDKWDvhuYpH
X-Gm-Message-State: AOJu0Yz7w9CqNOMke/oEQbbF+q58/ZMYtaJfIWPTjim6pe9d0pLy+Bo+
 YRj9O0s9z8BqtlYYBIXQuxEc08nM7XXy2lnG5tC2ko/h01eHeKk/SOhBfvo/3lfek8iHXoxRAab
 LNmSyTsfaF674neNeaFOdYumMSMWzmAyTSwyA
X-Google-Smtp-Source: AGHT+IFMk/Fy8HmApu9Nagm7rkVtZNRgXI7ZtAkmxpMtHuX4P9lSyGrItN72Z9tf2GD9wH/LCrC3alUkG3t3FzAjxFY=
X-Received: by 2002:ad4:5762:0:b0:6b5:413a:3f96 with SMTP id
 6a1803df08f44-6b5b704f0e0mr82787156d6.10.1719860701461; Mon, 01 Jul 2024
 12:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-3-almasrymina@google.com> <m27ce9cris.fsf@gmail.com>
In-Reply-To: <m27ce9cris.fsf@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 1 Jul 2024 12:04:49 -0700
Message-ID: <CAHS8izNM8TjJ1DU+7gzq-0kH=tVeM6j-QsaKk=2FHNDF6RLwnA@mail.gmail.com>
Subject: Re: [PATCH net-next v15 02/14] net: netdev netlink api to bind
 dma-buf to a net device
To: Donald Hunter <donald.hunter@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 
 Andreas Larsson <andreas@gaisler.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Arnd Bergmann <arnd@arndb.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, 
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 Nikolay Aleksandrov <razor@blackwall.org>,
 Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin <linyunsheng@huawei.com>, 
 Shailend Chand <shailend@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Jun 28, 2024 at 3:10=E2=80=AFAM Donald Hunter <donald.hunter@gmail.=
com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
> > +  -
> > +    name: bind-dmabuf
> > +    attributes:
> > +      -
> > +        name: ifindex
> > +        doc: netdev ifindex to bind the dma-buf to.
>
> Minor nit:
>
> The series uses a mix of dmabuf and dma-buf but the doc additions
> (devmem.rst) consistently uses dmabuf. I think it would be helpful to be
> consistent here and say 'devmem dmabuf' in the docstring to highlight
> whos dmabuf it is and keep the generated netdev docs in alignment.
>

To be honest, even the dmabuf docs mixes 'dma-buf' and 'dmabuf', to my eye:

https://docs.kernel.org/driver-api/dma-buf.html

I can edit these docs I'm adding so these are consistent.

But on 'devmem dmabuf', not sure to be honest. Technically all dmabufs
are supported, even non-devmem ones. I'm not sure non-devmem dmabufs
are common at all, the only example I can think of is udmabuf whose
primary user is qemu and testing, so it's somewhat implied that the
dmabuf is devmem, and even if it isn't, it would be supported. I
prefer to keep the docs saying just 'dmabuf' as technically all are
supported. Maybe I should add a note about this somewhere in the
dedicated docs.

--=20
Thanks,
Mina
