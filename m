Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494C18C3D6D
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3CB10E520;
	Mon, 13 May 2024 08:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gOmFuGSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A0310E505
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715589592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NafnT6nxtfip1QG/byPJKrL48bOdfUlcszFB+gXZGRk=;
 b=gOmFuGSXyX7U8hs+XlUbGvYwNQoP27YDwW+3IaSbQ985RE/xbabqtNtNCFW5v26ENjxfUT
 CuneHChw/WMN3wBwa6h1iewZ3v8SwAxYcOVceQJwtbfA3IjJcGrtTtgAjFnJ2deRSveh5R
 3IQEu+Qbs4D42AIDi0DsheLXxK/J/wA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-mKZqjyv7ObGiTptEWM6p2A-1; Mon, 13 May 2024 04:39:50 -0400
X-MC-Unique: mKZqjyv7ObGiTptEWM6p2A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-41fe6df6ef3so14287845e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 01:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715589589; x=1716194389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NafnT6nxtfip1QG/byPJKrL48bOdfUlcszFB+gXZGRk=;
 b=gIGeBVDa+pQUzQbFaLfMLg/dkhZpJWJ58zNm4ebcAPZJ9aNHoV58xssDn/nwM7Hyb5
 rixzFhDsXC7pE+tqPAtKzgRbe8Ra55mPyLfIdLHp2qVaoh9I+rjCDtuL/E50sSxttHh+
 mU4qnsRW3MyErGsj42aQcG1dAKBxsoUnQ6Z+mNFPxYMPfR9h/m1xmec4NpRd4vBjAh2z
 UT3m7eZvGmlh+ga/wce3/czVl1ASywMsKJUWoP4/Z4njdeGTgp0IK08JZgjpthwrgkyv
 4xaxopJVAZBXqthZMtZdBQgoE5TZrLRx3UDcwzyEisMxBCTE7Eo/HVoqOvwrNTKsZn26
 u4FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdzung3koB9hTams2taToGi8e5i5bUAQHQdktYQ/rFPMi9nbv0yUw0FemB59V25gAwShOwHuVT1sulDVTJVgBkK+O3NZPXOiH12VV4hEy1
X-Gm-Message-State: AOJu0Yzz4AU5SUhEP/qvPigk/AsW8wvRGqLZey8LbN/VQjyg91HAtS3V
 DhXsXqlKl2LCBHbsFYhmmIreF6pO25CZdEMm9af44/bmxj/hurnnbw5WB/C6ZeP4kA/EcH14+Il
 i23yWd/azNpawVronkemjeFbiM5U4IOzQgROnZkJisQD/u82bBy66pF0OWIaDwVYIEg==
X-Received: by 2002:a05:600c:3caa:b0:41b:55b1:6cfc with SMTP id
 5b1f17b1804b1-41feaa2f3a3mr60665275e9.1.1715589589254; 
 Mon, 13 May 2024 01:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSHY3Vs6wnO8Hqo+e75wM+DuYwRlx0w2YGHoHP++IqYSQpbYZoInfS6/LKCMB/0qMhU4uo5Q==
X-Received: by 2002:a05:600c:3caa:b0:41b:55b1:6cfc with SMTP id
 5b1f17b1804b1-41feaa2f3a3mr60665135e9.1.1715589588807; 
 Mon, 13 May 2024 01:39:48 -0700 (PDT)
Received: from localhost ([2a01:e34:ec60:48a0:b89c:e3fb:cb18:893d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b2648fsm185332075e9.7.2024.05.13.01.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 01:39:48 -0700 (PDT)
Date: Mon, 13 May 2024 10:39:48 +0200
From: Maxime Ripard <mripard@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>, 
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Milan Zamazal <mzamazal@redhat.com>, 
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <20240513-delectable-busy-serval-fbe3fe@penduick>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <ojduxo54lpcbfg2wfuhqhy7k3phncamtklh65z7gvttcwztmhk@zkifewcy4ovi>
 <3c0c7e7e-1530-411b-b7a4-9f13e0ff1f9e@redhat.com>
 <e7ilwp3vc32xze3iu2ejgqlgz44codsktnvyiufjhuf2zxcnnf@tnwzgzoxvbg2>
 <d2a512b2-e6b1-4675-b406-478074bbbe95@linaro.org>
 <CAA8EJpr4bJUQt2T63_FZ=KHGEm4vixfpk3pMV9naABEONJfMmQ@mail.gmail.com>
 <20240507184049.GC20390@pendragon.ideasonboard.com>
 <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qh6aaiqzlccizapn"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqLu5w7gnqtDyuDDQBd7AEROTd6LTYi8muzjToXmkKR3w@mail.gmail.com>
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


--qh6aaiqzlccizapn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 10:59:42PM +0300, Dmitry Baryshkov wrote:
> On Tue, 7 May 2024 at 21:40, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > On Tue, May 07, 2024 at 06:19:18PM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 7 May 2024 at 18:15, Bryan O'Donoghue wrote:
> > > > On 07/05/2024 16:09, Dmitry Baryshkov wrote:
> > > > > Ah, I see. Then why do you require the DMA-ble buffer at all? If =
you are
> > > > > providing data to VPU or DRM, then you should be able to get the =
buffer
> > > > > from the data-consuming device.
> > > >
> > > > Because we don't necessarily know what the consuming device is, if =
any.
> > > >
> > > > Could be VPU, could be Zoom/Hangouts via pipewire, could for argume=
nt
> > > > sake be GPU or DSP.
> > > >
> > > > Also if we introduce a dependency on another device to allocate the
> > > > output buffers - say always taking the output buffer from the GPU, =
then
> > > > we've added another dependency which is more difficult to guarantee
> > > > across different arches.
> > >
> > > Yes. And it should be expected. It's a consumer who knows the
> > > restrictions on the buffer. As I wrote, Zoom/Hangouts should not
> > > require a DMA buffer at all.
> >
> > Why not ? If you want to capture to a buffer that you then compose on
> > the screen without copying data, dma-buf is the way to go. That's the
> > Linux solution for buffer sharing.
>=20
> Yes. But it should be allocated by the DRM driver. As Sima wrote,
> there is no guarantee that the buffer allocated from dma-heaps is
> accessible to the GPU.

And there is no guarantee that the buffer allocated from the GPU is
accessible to the display engine. In practice, I've yet to see an issue
with that assumption.

And there's the other elephant in the room that hasn't been addressed.
Buffers typically allocated by the data-consuming frameworks are
coherent buffers, which on arm/arm64 usually mean non-cacheable.

Performances are *terrible*. Meanwhile, dma-heaps and dma-buf provide
cacheable buffers with a cache synchronization API, which allow to have
it run much faster.

Maxime

--qh6aaiqzlccizapn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkHR0wAKCRAnX84Zoj2+
dmpnAYCn9sxfeRSm1Faf0OjKfvfKYpA6+XhCEJJVQzH6jGId/Sk32BahqCR3ZucO
/1TsALQBf160+BzC2jF6k7Xud+ixD5QuBdXfxo6UziSenQ1ClVh2UFdyf0TG2Tzj
I+TfIOqSEg==
=cY/A
-----END PGP SIGNATURE-----

--qh6aaiqzlccizapn--

