Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D93F697DDD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116F10E0F7;
	Wed, 15 Feb 2023 13:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA36B10E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1676469147; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XbpiqG5t2GsPDg7j0qEdkn6EKRYRa6CH+nGlsTJwnqw=;
 b=hzFOVWWXH8CD/SFSBFtrhb8Ni6P4ourJnZVpwTK86A70LxFLU/yD9jkvT4UiY6Iv/ChQMr
 hkEuPvXJ83h3Dq6BU4lEMr6QqEkimi47t/eszOA6xwMHHA2ob817h7fsFbR2GBXalqFKdc
 km10QZwTKGhulkKKMXH2hP8thJVJiZQ=
Message-ID: <0a128bd44ee7f33369b19b1e984c9e6ffc926ae4.camel@crapouillou.net>
Subject: Re: Question: partial transfers of DMABUFs
From: Paul Cercueil <paul@crapouillou.net>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 15 Feb 2023 13:52:24 +0000
In-Reply-To: <bf3771bc-bbdc-8a9f-b9e7-425812a66ea9@amd.com>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <c5fe8089-49e9-2bec-eac5-e8a035412cf3@amd.com>
 <db4d83f3c3c8dc4f3ef5f850fe4c1c04aa648d47.camel@crapouillou.net>
 <bf3771bc-bbdc-8a9f-b9e7-425812a66ea9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 14:46 +0100, Christian K=C3=B6nig a=
 =C3=A9crit=C2=A0:
> Am 15.02.23 um 14:24 schrieb Paul Cercueil:
> > Hi Christian,
> >=20
> > Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 13:58 +0100, Christian K=C3=B6n=
ig a
> > =C3=A9crit=C2=A0:
> > > Hi Paul,
> > >=20
> > > Am 15.02.23 um 11:48 schrieb Paul Cercueil:
> > > > Hi,
> > > >=20
> > > > I am working on adding support for DMABUFs in the IIO
> > > > subsystem.
> > > >=20
> > > > One thing we want there, is the ability to specify the number
> > > > of
> > > > bytes
> > > > to transfer (while still defaulting to the DMABUF size).
> > > >=20
> > > > Since dma_buf_map_attachment() returns a sg_table,
> > > Please don't assume that this is an sg_table. We just used it as
> > > container for DMA addresses, but this has proven to be a mistake.
> > TL/DR, why was it a mistake? Just curious.
>=20
> The sg_table should have just contained DMA addresses, but we had=20
> multiple people who tried to use the pages instead.
>=20
> This works to some extend, but goes boom as soon as somebody messes
> with=20
> the pages reference counts or tries to map it into an address space
> or=20
> something like that.
>=20
> We got so far that we now intentionally mangle the page addresses in
> the=20
> sg_table to prevent people from using it:=20
> https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#=
L763

Isn't that breaking the chains though? I'd expect page_link to be
mangled only if !sg_is_chain(sg).

> > > There is work underway to replace the sg_table with (for example)
> > > just
> > > an array of DMA addresses.
> > Ok, so I believe at some point we will need an equivalent of
> > dmaengine_prep_slave_sg() which takes an array of DMA addresses.
>=20
> Well we will probably come up with a new container for this, but
> yeah.

Understood.

You said there was work underway, could you point me to the
corresponding mailing list threads and/or code?

> Regards,
> Christian.

Cheers,
-Paul

> >=20
> > > > I basically have two options, and I can't decide which one is
> > > > the
> > > > best (or the less ugly):
> > > >=20
> > > > - Either I add a new API function similar to
> > > > dmaengine_prep_slave_sg(),
> > > > which still takes a scatterlist as argument but also takes the
> > > > number
> > > > of bytes as argument;
> > > >=20
> > > > - Or I add a function to duplicate the scatterlist and then
> > > > shrink
> > > > it
> > > > manually, which doesn't sound like a good idea either.
> > > >=20
> > > > What would be the recommended way?
> > > I strongly recommend to come up with a new function which only
> > > takes
> > > DMA
> > > addresses and separate segment length.
> > Alright, thanks for your input.
> >=20
> > So I would add a new dma_device.dma_prep_slave_dma_array() callback
> > with a corresponding API function, and then the drivers can be
> > converted from using .dma_prep_slave_sg() to this new function in
> > due
> > time.
> >=20
> > Vinod, that works for you?
> >=20
> > Cheers,
> > -Paul
>=20

