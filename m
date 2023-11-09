Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B54D7E6556
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 09:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C11010E1DD;
	Thu,  9 Nov 2023 08:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C8110E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699518601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wfBB7jOmzZuQURxz539iTcHy3NIYfOzypWCfu2aQUto=;
 b=Hw2uKHLQgCKO/EkjE/9E+saKUsFIudRQqhGGNRHK1aVsXDMPx3dbK+3rPJ1mRz1ngfIWTr
 PhaRjCvDWmoDo50LQiRNVYoJ3i8UJaUcwnb+3tWGGs5MXNREYePh522KbQcsjAKHh3jNgT
 +Fr2fy6amVy5NTfusUUe9JNduoNKBGI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-S9pwXQpcPTaV-oYmxuLTzw-1; Thu, 09 Nov 2023 03:29:58 -0500
X-MC-Unique: S9pwXQpcPTaV-oYmxuLTzw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9c45a6a8832so11662366b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 00:29:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699518597; x=1700123397;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0qGu6ReB5a+EcqdKKJhEiSap1D12mNLXKF1UNlxFd2w=;
 b=SY+rEOT+zg+LPAZYAATemiWe4E77tj4A4PhPxKM7zGotM/FN1ji5VdDwDlVxZIHPur
 ceWKM39mMxsXreN7paUG/olRI3uPasCL8+ljiJcmmbPbXVERnIYQVGu4Ax94RCuYZvr3
 S+bc1w9kzXydtDR/t4GJUcaCg8+oRxz7gi7RqUfrwu/6OOxnCcUTEB2WUbNOHcuSE8m8
 7GZxnUgAyPEswCjQQk6TWaZVgnZxvefqXFNIOR2FxWmzYE084In2cjYhbT9wgLOJuspm
 PkLeJ6F/qIIZz7u+WHCJCACTrSwGhal+616TaeiITDR/hFOI3tgt2imDvhcGQYI3aHyb
 EG9Q==
X-Gm-Message-State: AOJu0Yx2aWGFDGri4YgBsK9sPjyWXP1J9PA2DcDVAUvz76iKImUPjlFK
 VyEHB5CNtUphlR6XQp+Vdg8gWMHY8tkYWujt6kDH7GRqKBdOFZPAmBeLjyr703AXqpeo9T54U5i
 bxcxGXyOfDPjSJkGa3yOhV/HYJXBQ
X-Received: by 2002:a17:907:9725:b0:9dd:b624:dea9 with SMTP id
 jg37-20020a170907972500b009ddb624dea9mr3415520ejc.7.1699518597397; 
 Thu, 09 Nov 2023 00:29:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFQLHA2HdtAUf7yiWJ3zu6Jf15htwDL4OIcB2ox9NPft2Q3sVGGotT9BWcb+BUEytSXl5ggw==
X-Received: by 2002:a17:907:9725:b0:9dd:b624:dea9 with SMTP id
 jg37-20020a170907972500b009ddb624dea9mr3415493ejc.7.1699518597043; 
 Thu, 09 Nov 2023 00:29:57 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-228-197.dyn.eolo.it.
 [146.241.228.197]) by smtp.gmail.com with ESMTPSA id
 v25-20020a170906381900b009dfd3b80ba3sm2221221ejc.35.2023.11.09.00.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 00:29:56 -0800 (PST)
Message-ID: <076fa6505f3e1c79cc8acdf9903809fad6c2fd31.camel@redhat.com>
Subject: Re: [RFC PATCH v3 04/12] netdev: support binding dma-buf to netdevice
From: Paolo Abeni <pabeni@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 09 Nov 2023 09:29:54 +0100
In-Reply-To: <20231106024413.2801438-5-almasrymina@google.com>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-5-almasrymina@google.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
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
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-11-05 at 18:44 -0800, Mina Almasry wrote:
[...]
> +int netdev_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
> +=09=09       struct netdev_dmabuf_binding **out)
> +{
> +=09struct netdev_dmabuf_binding *binding;
> +=09struct scatterlist *sg;
> +=09struct dma_buf *dmabuf;
> +=09unsigned int sg_idx, i;
> +=09unsigned long virtual;
> +=09int err;
> +
> +=09if (!capable(CAP_NET_ADMIN))
> +=09=09return -EPERM;
> +
> +=09dmabuf =3D dma_buf_get(dmabuf_fd);
> +=09if (IS_ERR_OR_NULL(dmabuf))
> +=09=09return -EBADFD;
> +
> +=09binding =3D kzalloc_node(sizeof(*binding), GFP_KERNEL,
> +=09=09=09       dev_to_node(&dev->dev));
> +=09if (!binding) {
> +=09=09err =3D -ENOMEM;
> +=09=09goto err_put_dmabuf;
> +=09}
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
> +=09=09goto err_free_binding;
> +=09}
> +
> +=09binding->sgt =3D dma_buf_map_attachment(binding->attachment,
> +=09=09=09=09=09      DMA_BIDIRECTIONAL);
> +=09if (IS_ERR(binding->sgt)) {
> +=09=09err =3D PTR_ERR(binding->sgt);
> +=09=09goto err_detach;
> +=09}
> +
> +=09/* For simplicity we expect to make PAGE_SIZE allocations, but the
> +=09 * binding can be much more flexible than that. We may be able to
> +=09 * allocate MTU sized chunks here. Leave that for future work...
> +=09 */
> +=09binding->chunk_pool =3D gen_pool_create(PAGE_SHIFT,
> +=09=09=09=09=09      dev_to_node(&dev->dev));
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
> +=09=09struct page_pool_iov *ppiov;
> +
> +=09=09owner =3D kzalloc_node(sizeof(*owner), GFP_KERNEL,
> +=09=09=09=09     dev_to_node(&dev->dev));
> +=09=09owner->base_virtual =3D virtual;
> +=09=09owner->base_dma_addr =3D dma_addr;
> +=09=09owner->num_ppiovs =3D len / PAGE_SIZE;
> +=09=09owner->binding =3D binding;
> +
> +=09=09err =3D gen_pool_add_owner(binding->chunk_pool, dma_addr,
> +=09=09=09=09=09 dma_addr, len, dev_to_node(&dev->dev),
> +=09=09=09=09=09 owner);
> +=09=09if (err) {
> +=09=09=09err =3D -EINVAL;
> +=09=09=09goto err_free_chunks;
> +=09=09}
> +
> +=09=09owner->ppiovs =3D kvmalloc_array(owner->num_ppiovs,
> +=09=09=09=09=09       sizeof(*owner->ppiovs),
> +=09=09=09=09=09       GFP_KERNEL);
> +=09=09if (!owner->ppiovs) {
> +=09=09=09err =3D -ENOMEM;
> +=09=09=09goto err_free_chunks;
> +=09=09}
> +
> +=09=09for (i =3D 0; i < owner->num_ppiovs; i++) {
> +=09=09=09ppiov =3D &owner->ppiovs[i];
> +=09=09=09ppiov->owner =3D owner;
> +=09=09=09refcount_set(&ppiov->refcount, 1);
> +=09=09}
> +
> +=09=09dma_addr +=3D len;

I'm trying to wrap my head around the whole infra... the above line is
confusing. Why do you increment dma_addr? it will be re-initialized in
the next iteration.

Cheers,

Paolo

