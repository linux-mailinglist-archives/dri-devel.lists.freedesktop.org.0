Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76D923C09
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4CC210E201;
	Tue,  2 Jul 2024 11:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CgCm+Mws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976D310E201
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719918499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vID7AvfrgxCnqWbRxxpuc8m1ckeq50XPU868Y8vMac8=;
 b=CgCm+MwsJ1AEkb0otB8Baawxz/TYh0MZBUKUyxcDazFd9XjwWOMyQDIlYBXggUbnXM8XsX
 V4d5vlLxD8APzYGpYqlVraJ4XVIjL2M/EfVjD45eaqj6hzIbbtp3+Uaic9Ppo5KJv6z+qB
 v/9hyXv9vLs7roI1C5TLbvMxrvMORa4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-fe6aTNVINFKgoToarwhZOg-1; Tue, 02 Jul 2024 07:08:17 -0400
X-MC-Unique: fe6aTNVINFKgoToarwhZOg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4257e8a0af9so1737205e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 04:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719918496; x=1720523296;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yLXwC7q0adn0kB7P9GTh9OjXrMCR2dcYkc/lqgAiV5o=;
 b=ujMxOQDXVdQoIq2VVQS4eRCySNwIPvlkhbu+/aD+V+doca17oc6IiM9+KpuQYsbkdQ
 o22DUsyXCUnlENjqAZdTv3HahpzOrLO4MtjmxK5zo4FOWihOJ8ua14iWd8pS5VnRwwx8
 jItw7KKkQrNV0PWH0wyfPiWMUBFH4MtDAlWT+eA0Ju3bWvmiQNKW+CX3hIg5hdwyNx5D
 8Qjsyr4++7qlB7kyDGsY+4tmp5ELSGW3JCr53Y/HVKhViuUuTJCs+8+VRYBMyNi+MIIB
 cffAC1RIUVYI0ARTYDE0cvS3Z6C9tpfSHlifL6/BsQRJaL2T+8VBeKyyMDevEU/ihKQg
 sOmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYJpcrYsvwhlUGdg97stMdUMbJLu3Y/TCyOKakhegXwyWfc2o/MEW25pkswHT5kCtyKDO9QDEv3bjCHO9GQQAKvnp2XYBQ3SKTGdbRTTGg
X-Gm-Message-State: AOJu0YwM7uf3dJgGsSczN5Gw9zMgNR5wj3BSK7QIKGB2x4Hp/zDHrJtY
 8vuIyoLUkTfQRflIwHtlvAT4qzLam60AGEOryMfl4gyxhUK9VoRsh+Hb7mcJmS6nQkQmncrLsor
 uthEsX88xe5QgNdg3SUPgiDza4NJCZauFzkRGG6FGfjfC7JyIdUyyutsd7I/A/JTpwQ==
X-Received: by 2002:a05:600c:19c9:b0:424:a74b:32d3 with SMTP id
 5b1f17b1804b1-4257a010c08mr62104605e9.0.1719918496687; 
 Tue, 02 Jul 2024 04:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKqrIbcrzbaQKWKLXTl4pIVJyKi2r/i/19ZzeCV+kPU4ZooLecdwzZnhxEombaOdJJRY43eg==
X-Received: by 2002:a05:600c:19c9:b0:424:a74b:32d3 with SMTP id
 5b1f17b1804b1-4257a010c08mr62104055e9.0.1719918496277; 
 Tue, 02 Jul 2024 04:08:16 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b0a6:6710:872d:b0f7:af0b:a62f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b097bd6sm196621575e9.30.2024.07.02.04.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:08:15 -0700 (PDT)
Message-ID: <29c65e23b88002eef6b2a8c272357fa2b2a661b6.camel@redhat.com>
Subject: Re: [PATCH net-next v15 03/14] netdev: support binding dma-buf to
 netdevice
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Richard
 Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
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
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Ahern <dsahern@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,  Shuah Khan
 <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Christoph Hellwig <hch@infradead.org>, Nikolay
 Aleksandrov <razor@blackwall.org>, Pavel Begunkov <asml.silence@gmail.com>,
 David Wei <dw@davidwei.uk>, Jason Gunthorpe <jgg@ziepe.ca>, Yunsheng Lin
 <linyunsheng@huawei.com>, Shailend Chand <shailend@google.com>, Harshitha
 Ramamurthy <hramamurthy@google.com>,  Shakeel Butt
 <shakeel.butt@linux.dev>, Jeroen de Borst <jeroendb@google.com>, Praveen
 Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn
 <willemb@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Date: Tue, 02 Jul 2024 13:08:11 +0200
In-Reply-To: <20240628003253.1694510-4-almasrymina@google.com>
References: <20240628003253.1694510-1-almasrymina@google.com>
 <20240628003253.1694510-4-almasrymina@google.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, 2024-06-28 at 00:32 +0000, Mina Almasry wrote:
> +int net_devmem_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_f=
d,
> +=09=09=09   struct net_devmem_dmabuf_binding **out)
> +{
> +=09struct net_devmem_dmabuf_binding *binding;
> +=09static u32 id_alloc_next;
> +=09struct scatterlist *sg;
> +=09struct dma_buf *dmabuf;
> +=09unsigned int sg_idx, i;
> +=09unsigned long virtual;
> +=09int err;
> +
> +=09dmabuf =3D dma_buf_get(dmabuf_fd);
> +=09if (IS_ERR(dmabuf))
> +=09=09return -EBADFD;
> +
> +=09binding =3D kzalloc_node(sizeof(*binding), GFP_KERNEL,
> +=09=09=09       dev_to_node(&dev->dev));
> +=09if (!binding) {
> +=09=09err =3D -ENOMEM;
> +=09=09goto err_put_dmabuf;
> +=09}
> +
> +=09binding->dev =3D dev;
> +
> +=09err =3D xa_alloc_cyclic(&net_devmem_dmabuf_bindings, &binding->id,
> +=09=09=09      binding, xa_limit_32b, &id_alloc_next,
> +=09=09=09      GFP_KERNEL);
> +=09if (err < 0)
> +=09=09goto err_free_binding;
> +
> +=09xa_init_flags(&binding->bound_rxq_list, XA_FLAGS_ALLOC);
> +
> +=09refcount_set(&binding->ref, 1);
> +
> +=09binding->dmabuf =3D dmabuf;
> +
> +=09binding->attachment =3D dma_buf_attach(binding->dmabuf, dev->dev.pare=
nt);
> +=09if (IS_ERR(binding->attachment)) {
> +=09=09err =3D PTR_ERR(binding->attachment);
> +=09=09goto err_free_id;
> +=09}
> +
> +=09binding->sgt =3D
> +=09=09dma_buf_map_attachment(binding->attachment, DMA_FROM_DEVICE);
> +=09if (IS_ERR(binding->sgt)) {
> +=09=09err =3D PTR_ERR(binding->sgt);
> +=09=09goto err_detach;
> +=09}
> +
> +=09/* For simplicity we expect to make PAGE_SIZE allocations, but the
> +=09 * binding can be much more flexible than that. We may be able to
> +=09 * allocate MTU sized chunks here. Leave that for future work...
> +=09 */
> +=09binding->chunk_pool =3D
> +=09=09gen_pool_create(PAGE_SHIFT, dev_to_node(&dev->dev));
> +=09if (!binding->chunk_pool) {
> +=09=09err =3D -ENOMEM;
> +=09=09goto err_unmap;
> +=09}
> +
> +=09virtual =3D 0;
> +=09for_each_sgtable_dma_sg(binding->sgt, sg, sg_idx) {
> +=09=09dma_addr_t dma_addr =3D sg_dma_address(sg);
> +=09=09struct dmabuf_genpool_chunk_owner *owner;
> +=09=09size_t len =3D sg_dma_len(sg);
> +=09=09struct net_iov *niov;
> +
> +=09=09owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> +=09=09=09=09     dev_to_node(&dev->dev));

I'm sorry for not catching this earlier, but it looks like the above
allocation lacks a NULL check.

Thanks,

Paolo

