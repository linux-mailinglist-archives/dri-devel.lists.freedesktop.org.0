Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE75977985
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758C110ECA3;
	Fri, 13 Sep 2024 07:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aDxap+/x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9DA10ECA3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726212205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b93YWU3rhmaRyjLgAvJQJ1ANck/SGc/RMmQtFmrEuHg=;
 b=aDxap+/x8alMxydJUk6izuh0gZazYeF51nMrsco6kgh0G8d0dG/QKQnnFnVUKQlxAfQq2A
 llC/T4799hZ+TNdxEb3ihbQHLXeV6+VFdp5zR3VYnB1BG7eMZYYTKyANElp13U+SCknhRY
 yqE0TveT6IN/JA3fnBpYMChySryc3SM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-82eKyJ39MHCIqT4vA9D0zA-1; Fri, 13 Sep 2024 03:23:24 -0400
X-MC-Unique: 82eKyJ39MHCIqT4vA9D0zA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb33e6299so11299825e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726212203; x=1726817003;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wEPkCaZKy1gcsUUkXj7hF8KDUw7ZLQ7b19EknkTWqYU=;
 b=e1Vr7NmhnU3CrUkTY5UhiLn2uwums1iK/1iNKwV1Z0P2Kxa+rEwBZYW1Df9ORg5+er
 wsyM57O5756ROlVrn7ldVgvmlYJhVawYnWJ6Fqw1TzAySxSURZI46HPsY9kQFQ8gc6M3
 9ZEwYelOV7oYpbHsUZtepTb2cGOJkcULHBUGmB6CTHVODzC8CxCkrA8MiCY+mnMlWoKQ
 hpqB68MVmUkM46J65JyLH8fqYdMMnBx3UbT5reg2ICOrJgpeA/6zELIeL5iTtavciBgB
 I5HTKH8P9yhX1bRjJ0X+duxAkfR23y4EDeQXHMoJ0xMD2Gbf00M3u8euDR/zhWxEdJBi
 dz1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV73lllo8y4L/bMEepqOaFN5zG+ipxVAz3oO502eCHV7g9hlHRV/wpoTvJ9JE5gTMUL0jBQaNHOAak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6eOC3IPjFctUmMBtsWVK1WYeWygFN+sfBTkpACHIN8IC6URXy
 b3S2/GoeSf7mx1IrrBd6PkIf7w6yajC3YrhGWLx98EliInEo9NzCo/W4Jm+ommb56X49ElC3s45
 GBl3OV4iovYJ05tHIMSgKLafW9tafw4UUVsGxmdv1t5aFoKsdTXtHB1UINi5m5seDowKdI3gbTQ
 ==
X-Received: by 2002:a05:600c:1c28:b0:42c:ba1f:5452 with SMTP id
 5b1f17b1804b1-42cdb57c022mr46476745e9.25.1726212202768; 
 Fri, 13 Sep 2024 00:23:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFspJAnfojknLvIcCJH5mZbBB61ZZDFNCyF6d1gPOfrkHm0d6H/JURZot55/89L3vb6FpP6g==
X-Received: by 2002:a05:600c:1c28:b0:42c:ba1f:5452 with SMTP id
 5b1f17b1804b1-42cdb57c022mr46476565e9.25.1726212202223; 
 Fri, 13 Sep 2024 00:23:22 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3d2a:6400:5050:48a2:62f2:4d16?
 ([2001:16b8:3d2a:6400:5050:48a2:62f2:4d16])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956ddae5sm15957220f8f.97.2024.09.13.00.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 00:23:21 -0700 (PDT)
Message-ID: <b3c158b83efc16ed305daabe3608346b4849b955.camel@redhat.com>
Subject: Re: [PATCH 1/7] dma-buf: add WARN_ON() illegal dma-fence signaling
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Date: Fri, 13 Sep 2024 09:23:20 +0200
In-Reply-To: <d8161fdb-411c-4a8f-bb2c-456d7bf6ebd7@gmail.com>
References: <20240911085903.1496-1-christian.koenig@amd.com>
 <20240911085903.1496-2-christian.koenig@amd.com>
 <55b17b3e4af2ee28d44645535f0c8995c72f842c.camel@redhat.com>
 <d8161fdb-411c-4a8f-bb2c-456d7bf6ebd7@gmail.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
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

On Thu, 2024-09-12 at 16:55 +0200, Christian K=C3=B6nig wrote:
> Am 11.09.24 um 11:44 schrieb Philipp Stanner:
> > On Wed, 2024-09-11 at 10:58 +0200, Christian K=C3=B6nig wrote:
> > > Calling the signaling a NULL fence is obviously a coding error in
> > > a
> > > driver. Those functions unfortunately just returned silently
> > > without
> > > raising a warning.
> > Good catch
> >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/dma-buf/dma-fence.c | 4 ++--
> > > =C2=A0=C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-
> > > fence.c
> > > index 0393a9bba3a8..325a263ac798 100644
> > > --- a/drivers/dma-buf/dma-fence.c
> > > +++ b/drivers/dma-buf/dma-fence.c
> > > @@ -412,7 +412,7 @@ int dma_fence_signal_timestamp(struct
> > > dma_fence
> > > *fence, ktime_t timestamp)
> > > =C2=A0=C2=A0=09unsigned long flags;
> > > =C2=A0=C2=A0=09int ret;
> > > =C2=A0=20
> > > -=09if (!fence)
> > > +=09if (WARN_ON(!fence))
> > > =C2=A0=C2=A0=09=09return -EINVAL;
> > While one can do that, as far as I can see there are only a hand
> > full
> > of users of that function anyways.
>=20
> The dma_fence_signal() function has tons of users, it's basically the
> core of the DMA-buf framework.

I meant dma_fence_signal_timestamp() itself.

>=20
> > Couldn't one (additionally) add the error check of
> > dma_fenc_signal_timestapm() to those? Like in
> > dma_fenc_allocate_private_stub().
> >=20
> > It seems some of them are void functions, though. Hm.
> > There is also the attribute __must_check that could be considered
> > now
> > or in the future for such functions.
>=20
> I actually want to remove the error return from dma_fence_signal()
> and=20
> the other variants. There is no valid reason that those functions
> should=20
> fail.

Makes sense to me.
+1

P.

>=20
> The only user is some obscure use case in AMDs KFD driver and I would
> rather like to clean that one up.
>=20
> Regards,
> Christian.
>=20
> >=20
> > Regards,
> > P.
> >=20
> >=20
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09spin_lock_irqsave(fence->lock, flags);
> > > @@ -464,7 +464,7 @@ int dma_fence_signal(struct dma_fence *fence)
> > > =C2=A0=C2=A0=09int ret;
> > > =C2=A0=C2=A0=09bool tmp;
> > > =C2=A0=20
> > > -=09if (!fence)
> > > +=09if (WARN_ON(!fence))
> > > =C2=A0=C2=A0=09=09return -EINVAL;
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09tmp =3D dma_fence_begin_signalling();
>=20

