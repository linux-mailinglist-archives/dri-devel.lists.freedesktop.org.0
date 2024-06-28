Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F591BC3B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F7710E1F2;
	Fri, 28 Jun 2024 10:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MDbA2bYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13BE10E1F2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:10:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52db11b1d31so612509e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 03:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719569433; x=1720174233; darn=lists.freedesktop.org;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JoVOae80H1zl51jGISvif7zbZc8/4VB5Y/Zsc6sy8rw=;
 b=MDbA2bYauFNSsU3+UbXIREo6StQ+SFy+8WUwzhkeYRVmK49qh+nBRPARME3BhazJay
 /eyMILGFO9LfufoVt21LV7gcIIr3k0ZpVzRIIOMfwj9pqzQX7Jy9/SjRACa1TIdb4hgT
 efs4nortZ5HkQivk4dMgLe9gySYeRzN3CioNWD8oYbHJUBW/H1vlqCe3ne7rX5KM9Y3X
 M8HjF8yiNJspu8DnQHYMmzM3JCpa5PVOaUFodu3D/MbcEctqovPOnqKQVcFYKwup1dZ7
 cBOelewMc6fS5LeitmJsEzoFFEcTFF2R4xcJDrna/awkO8uANeXFoRqhtVRzMynaJq82
 yFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719569433; x=1720174233;
 h=mime-version:user-agent:references:message-id:date:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JoVOae80H1zl51jGISvif7zbZc8/4VB5Y/Zsc6sy8rw=;
 b=AGjXjNjGRVApm9J6IpHfO7skFHv7pYL/rGv73mWPR8HRI2/rrYOMF+VwP3jZ/muPtY
 lQhJZ01UDdnrtbMIKTOZERlk80P6pELftLxUC8tog9Kc/D5YBvrxkJkL8UZyvf4mTipB
 RM6pM7b+TWDBUuuvv8NxsIxZeVfkktTvQaQaUwdyQ5QDCeP5tUqyfIgmwhbudBIQlrK0
 Ie1Se+AziJlh97b4Dsn4WUd7E1wg05R1hb4HCrgrMOFuommbZK3PlqCjd3nk5kk4h8td
 KoUNSKWl6/tyZY7G+yEznR1eASDB3IkyJ4CTGEXF4GT/fWunqvJtwzdvkIVJI6jbiQAW
 bAKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUePZ8v0q23jTR0fhZf4FVwuxjbkEpdDK9MmUOqRJCBLXL87evr1rC+fsl+YefwLBWMt+9j5+EFbyPWEDM4yhh+Gr6scwUjbmlVEVcqVvI
X-Gm-Message-State: AOJu0YxKvNWPRg/duMZLNdEhvb8P+yrW8MidD6dmzm8tLB/v2trLSfvC
 3lZghNtXxdNcjairZFHw0xYZhU6EioTKRu6pT7uaRGNaQwOTtJj9
X-Google-Smtp-Source: AGHT+IFKCvR38XvVqm5Um9a+klNoommoEfbRwaz/Xc5lSqRtlPbKvQJbMiSu5WsIA9vNHRnXI96lzA==
X-Received: by 2002:a19:f012:0:b0:52c:8024:1db with SMTP id
 2adb3069b0e04-52cdf82671amr9494131e87.63.1719569432448; 
 Fri, 28 Jun 2024 03:10:32 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:49ff:2a2d:712c:9944])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af5b66csm27439095e9.18.2024.06.28.03.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 03:10:31 -0700 (PDT)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,  linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org,  linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-trace-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org,  bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Jonathan
 Corbet <corbet@lwn.net>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>,  Matt Turner <mattst88@gmail.com>,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Helge Deller <deller@gmx.de>,
 Andreas Larsson <andreas@gaisler.com>,  Jesper Dangaard Brouer
 <hawk@kernel.org>,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>,  Masami Hiramatsu
 <mhiramat@kernel.org>,  Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>,  Arnd Bergmann <arnd@arndb.de>,  Alexei
 Starovoitov <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,  Martin KaFai Lau
 <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,  Song Liu
 <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,  John
 Fastabend <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo <haoluo@google.com>,  Jiri
 Olsa <jolsa@kernel.org>,  Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,  David Ahern
 <dsahern@kernel.org>,  Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Shuah Khan <shuah@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,  Bagas Sanjaya
 <bagasdotme@gmail.com>,  Christoph Hellwig <hch@infradead.org>,  Nikolay
 Aleksandrov <razor@blackwall.org>,  Pavel Begunkov
 <asml.silence@gmail.com>,  David Wei <dw@davidwei.uk>,  Jason Gunthorpe
 <jgg@ziepe.ca>,  Yunsheng Lin <linyunsheng@huawei.com>,  Shailend Chand
 <shailend@google.com>,  Harshitha Ramamurthy <hramamurthy@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>,
 Stanislav Fomichev <sdf@google.com>
Subject: Re: [PATCH net-next v15 02/14] net: netdev netlink api to bind
 dma-buf to a net device
In-Reply-To: <20240628003253.1694510-3-almasrymina@google.com> (Mina Almasry's
 message of "Fri, 28 Jun 2024 00:32:39 +0000")
Date: Fri, 28 Jun 2024 11:04:27 +0100
Message-ID: <m27ce9cris.fsf@gmail.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-3-almasrymina@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

Mina Almasry <almasrymina@google.com> writes:
> +  -
> +    name: bind-dmabuf
> +    attributes:
> +      -
> +        name: ifindex
> +        doc: netdev ifindex to bind the dma-buf to.

Minor nit:

The series uses a mix of dmabuf and dma-buf but the doc additions
(devmem.rst) consistently uses dmabuf. I think it would be helpful to be
consistent here and say 'devmem dmabuf' in the docstring to highlight
whos dmabuf it is and keep the generated netdev docs in alignment.

> +        type: u32
> +        checks:
> +          min: 1
> +      -
> +        name: queues
> +        doc: receive queues to bind the dma-buf to.

And here.

> +        type: nest
> +        nested-attributes: queue-dmabuf
> +        multi-attr: true
> +      -
> +        name: dmabuf-fd
> +        doc: dmabuf file descriptor to bind.
> +        type: u32
> +      -
> +        name: dmabuf-id
> +        doc: id of the dmabuf binding
> +        type: u32
> +        checks:
> +          min: 1
> +
>  
>    -
>      name: qstats
> @@ -579,6 +618,20 @@ operations:
>            attributes:
>              - ifindex
>          reply: *queue-get-op
> +    -
> +      name: bind-rx
> +      doc: Bind dmabuf to netdev

And here.

> +      attribute-set: bind-dmabuf
> +      flags: [ admin-perm ]
> +      do:
> +        request:
> +          attributes:
> +            - ifindex
> +            - dmabuf-fd
> +            - queues
> +        reply:
> +          attributes:
> +            - dmabuf-id
