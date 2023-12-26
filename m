Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211481E803
	for <lists+dri-devel@lfdr.de>; Tue, 26 Dec 2023 16:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55E010E1C5;
	Tue, 26 Dec 2023 15:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010810E1C5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Dec 2023 15:30:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6BA7EB80BD1;
 Tue, 26 Dec 2023 15:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB4BC433C8;
 Tue, 26 Dec 2023 15:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703604643;
 bh=+DXbzpdkr8gy1jHBrPxa1rews3taczzI9G1V+1FZGxA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oZ/WFyxxLo4THXqtr3qO8etYffapGkwoFzxmZmrJ+HO+EJ6IsSoL0RZexYf1h2Ydq
 Izm/eezZbv6G83yFPq7Mb5SSG4xHcrjagA/CudV15eu7/hyl+qjFOIvN6+hcFzn8MG
 pIEdHaQUuX7o0fzThtdPSc1sHsPWLcsMDMtzk242MhN8Xn7Zlwso2ZVYoJz3UjabrW
 8zkSQXq8O4YiqEoWiXUAvN6FYwHIU7a8k7UULcXZauDwrbbX5XRxmiCyMaMktCC+sd
 O02Ey1MXSrJo5zpbSJYB843md3ZUdx8XQ3jNW5eUKoAqi/LUTcYqdUTN6dAkV0Ms9Y
 bmh3AIaVE76mw==
Date: Tue, 26 Dec 2023 15:30:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Subject: Re: [PATCH v5 6/8] iio: buffer-dma: Enable support for DMABUFs
Message-ID: <20231226153037.1a2052f3@jic23-huawei>
In-Reply-To: <219abc43b4fdd4a13b307ed2efaa0e6869e68e3f.camel@gmail.com>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-7-paul@crapouillou.net>
 <20231221160445.0e3e5a8c@jic23-huawei>
 <219abc43b4fdd4a13b307ed2efaa0e6869e68e3f.camel@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linaro-mm-sig@lists.linaro.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> > > +struct iio_dma_buffer_block *
> > > +iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct dma_buf_attachment *attach)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_buffer_queu=
e *queue =3D iio_buffer_to_queue(buffer);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct iio_dma_buffer_bloc=
k *block;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int err;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&queue->lock); =
=20
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0guard(mutex)(&queue->lo=
ck); =20
>=20
> I'm also a big fan of this new stuff but shouldn't we have a prep patch m=
aking the
> transition to that? Otherwise we'll end up with a mix of styles. I'm happ=
y to clean
> up stuff with follow up patches (even some coding style could be improved=
 IIRC) but
> typically that's not how we handle things like this I believe...

Ideally yes, I think a prep patch would make sense - but I'm not that fussed
about it and follow up patches would be fine here.=20

There are cases for using this that are much easier to justify than
others, so I don't really mind if simple

mutex_lock();
do_something
mutex_unlock();

cases are left for ever not using guard(), though I also don't mind if peop=
le want to use
scoped_guard() or guard for these just to be consistent.  Either way is pre=
tty
easy to read.  We'll probably also continue to gain new uses of this logic =
such
as the conditional guard stuff that is queued up for the next merge window =
and
whilst that is going on we are going to have a bit of mixed style.

Jonathan


>=20
> - Nuno S=C3=A1
> >  =20
>=20

