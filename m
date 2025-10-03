Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11901BB6FE8
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 15:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D65410E904;
	Fri,  3 Oct 2025 13:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5wwArvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA0410E904
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759497810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
 b=E5wwArvQ06M0oeU3aLaTOOZd0g+h64AlYmrj8wYYsA78jaBEns2X+ir1C8YoFwaDhYaxd5
 rzxdBcGWD4cXZFp8Wy50C+RMjlzHQfOkyf42IfFl+LkuI7SZ5x4ymEfF35cfjT7FGZzegj
 lm1bwD3TNEniFUAOyhCzBgDKZgdx0EY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-pLizQO4VPRiufLZyDTD88w-1; Fri, 03 Oct 2025 09:23:28 -0400
X-MC-Unique: pLizQO4VPRiufLZyDTD88w-1
X-Mimecast-MFC-AGG-ID: pLizQO4VPRiufLZyDTD88w_1759497808
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e45899798so9593125e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 06:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759497807; x=1760102607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i3OgrM6kqtp8r+T8wasXEeO2qtaqUyEZzjkjuxIwoHg=;
 b=H7lmXwUiMQHOj4xuVACe0ABzTxhGLmrV5foua53/+qCL5YcRIvDvH6kGfAcY2UaT6L
 0mGXcgfZYTQjAM45o/aftqjKNQKQemRsHwmqv9raRDSsOAQptgy6JPTw7RQwnayetuXN
 E1wvVB3yu0nt7zmLsGmtLqpI0uCptdV9BCnQMzXsmX7fw3qa2VbX3siV55oD3Jt77H6x
 tvFZJaaqIV6tLL/mkAhlk1Seloc/7FaF/VbiiC13WdT3SSx7lqwGMgIz3XXyI/KA9B2T
 GJ5CiQFUHBmiVqvJYQjsmnj00GyEzr1yINmPEM9kYCbEXbHYXfJ66WmS5SEwRqviLrmT
 qUdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtX6xGFONe+3br9kZINk+sdCHEs+O6eWyRk0l2tHrG/hxGH/74n3qKB1UdcZoyJd8pEHcgQvLnR/k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuiiMUDhFCzPQyDkhEiAD2u3Md0Y8OcMM1/4knpxz2Z3Uaa8CQ
 I4WEYeN2Ssm3bvW9E01V4gPKkgSp1w8y4E/Xq/6ztKcIV6t8WYWlj9MGmj4Hzmd+VvTOt7iWcZf
 46zm8B2abDCeWcgb/n7A2e5ynjf9ojXcFOSkqZBgOWOj5j6u/dUnFxGqO1+uMLBSGK2AeVw==
X-Gm-Gg: ASbGncsxKOM2V3M1dXR6cBPOW3Tzsd3Tc8kKcP7gDbGfENqe2Dp6ao8dnf8bM0t0OIA
 X8xQyJ1OWXknZQJzCpCp9ot6SQSK9SvNxo9lj5wtFOnPXa/FxU4rVirdllktXU7feyKIzOlHFoV
 +8WIpeTNatK4YXp9uF1qrZisVeLYfl26gqjX/Ssd0XGRaAGRkace0UbsGK/0pjGlcQnUS1XO8g8
 qhCZ7hN7iKmW+nZGVXhhbUEqVE2ocDfQJQX7AWvdQeTwZnFGHbZGieyIri4w6sNpqUR+ciMXSIy
 sZXZqHG/Wp8crOjO2Yd3Uw==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id
 5b1f17b1804b1-46e71140be1mr25355525e9.24.1759497807562; 
 Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOOjaj75XO52nWI2I6UTsKjmFKM3jXrNLUe3y6zOumiOqPFkEXqNu9rSWvZBXSmGhaUe3KVg==
X-Received: by 2002:a05:600c:4510:b0:46e:59bb:63cf with SMTP id
 5b1f17b1804b1-46e71140be1mr25355005e9.24.1759497807018; 
 Fri, 03 Oct 2025 06:23:27 -0700 (PDT)
Received: from localhost ([2a01:e0a:b25:f902::ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6b5csm7942733f8f.5.2025.10.03.06.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 06:23:26 -0700 (PDT)
Date: Fri, 3 Oct 2025 15:23:26 +0200
From: Maxime Ripard <mripard@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
 linux-arm-kernel@lists.infradead.org, Olivier Masse <olivier.masse@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
Message-ID: <20251003-brilliant-golden-lion-fbedc9@houat>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
 <20250911135007.1275833-3-jens.wiklander@linaro.org>
 <20251002-shaggy-mastiff-of-elevation-c8e1f0@houat>
 <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bmweveq2oxpjd6s2"
Content-Disposition: inline
In-Reply-To: <CANDhNCqS+WKhTWjeC7yBL+x4erK4S4bievTxdneaCu1haA8=hA@mail.gmail.com>
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


--bmweveq2oxpjd6s2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v12 2/9] dma-buf: dma-heap: export declared functions
MIME-Version: 1.0

On Thu, Oct 02, 2025 at 12:45:41PM -0700, John Stultz wrote:
> On Thu, Oct 2, 2025 at 12:47=E2=80=AFAM Maxime Ripard <mripard@redhat.com=
> wrote:
> > On Thu, Sep 11, 2025 at 03:49:43PM +0200, Jens Wiklander wrote:
> > > Export the dma-buf heap functions to allow them to be used by the OP-=
TEE
> > > driver. The OP-TEE driver wants to register and manage specific secure
> > > DMA heaps with it.
> > >
> > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > > Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/dma-buf/dma-heap.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > > index 3cbe87d4a464..8ab49924f8b7 100644
> > > --- a/drivers/dma-buf/dma-heap.c
> > > +++ b/drivers/dma-buf/dma-heap.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/dma-heap.h>
> > >  #include <linux/err.h>
> > > +#include <linux/export.h>
> > >  #include <linux/list.h>
> > >  #include <linux/nospec.h>
> > >  #include <linux/syscalls.h>
> > > @@ -202,6 +203,7 @@ void *dma_heap_get_drvdata(struct dma_heap *heap)
> > >  {
> > >       return heap->priv;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_drvdata, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_get_name - get heap name
> > > @@ -214,6 +216,7 @@ const char *dma_heap_get_name(struct dma_heap *he=
ap)
> > >  {
> > >       return heap->name;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
> > >
> > >  /**
> > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > @@ -303,6 +306,7 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> > >       kfree(heap);
> > >       return err_ret;
> > >  }
> > > +EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
> >
> > It's not clear to me why we would need to export those symbols.
> >
> > As far as I know, heaps cannot be removed, and compiling them as module
> > means that we would be able to remove them.
> >
> > Now, if we don't expect the users to be compiled as modules, then we
> > don't need to export these symbols at all.
> >
> > Am I missing something?
>=20
> For things like distro kernels (or in Android's case, the GKI),
> there's a benefit for modules that can be loaded permanently (not
> having a module_exit hook).
> One doesn't have to bloat the base kernel image/memory usage for
> everyone, while still not having to necessarily deal with
> complications from module unloading issues.

Ack. We should at least document it then.

Maxime

--bmweveq2oxpjd6s2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaN/OTQAKCRAnX84Zoj2+
dtj+AX9Z6mfBBmJxP6k0eTgjg+qG1U5U8jSi9QuHw6zfKnsmrcwgrOYtur1R6Pew
cpDvn3QBfR0GnE+hRXWrYWoFPItAzGGTqManWkqHoYmL3MvlOwO7ECQmeIAe8L4a
Hi/ZAVgLUQ==
=rb0f
-----END PGP SIGNATURE-----

--bmweveq2oxpjd6s2--

