Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AB4697CF7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35C010E13A;
	Wed, 15 Feb 2023 13:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B910E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1676467068; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jo1hcFRAlyScdE9l1OosLx/8lHX5O2IFB6fOVnE2huo=;
 b=dyI3tzY/o5ySfHS2uP9etLBRf86yxechHKW5lri8USdQRBHHrd0w/KLW0upLzNQcIJAtgD
 DYCqbacZeOamgDEdoobPUajkTc8GRMAgpAAwvdrSUKR8E72yJ5Utyd+bMDGgFbcc1fstVA
 kLIO0hpgIVwSprX9suKvFbufOz/fZ5w=
Message-ID: <53753ec9589aeb1f7ce035414220c67f0c02c983.camel@crapouillou.net>
Subject: Re: Question: partial transfers of DMABUFs
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Vinod Koul <vkoul@kernel.org>
Date: Wed, 15 Feb 2023 13:17:45 +0000
In-Reply-To: <9e6b428e-81c0-4e2a-6825-43f022483013@linux.intel.com>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
 <d540965a25138772fa063d62e907ffd611f93205.camel@crapouillou.net>
 <05fb3949-d0aa-b653-d9a3-236a4c95a5a3@linux.intel.com>
 <77fc4dec6738d57ae6ca6232e502e3b228b1ae03.camel@crapouillou.net>
 <9e6b428e-81c0-4e2a-6825-43f022483013@linux.intel.com>
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

Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 13:13 +0100, Maarten Lankhorst a =
=C3=A9crit=C2=A0:
>=20
> On 2023-02-15 13:00, Paul Cercueil wrote:
> > Hi Maarten,
> >=20
> > Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 12:52 +0100, Maarten Lankhorst =
a
> > =C3=A9crit=C2=A0:
> > > Hey,
> > >=20
> > > On 2023-02-15 12:47, Paul Cercueil wrote:
> > > > Hi Maarten,
> > > >=20
> > > > Le mercredi 15 f=C3=A9vrier 2023 =C3=A0 12:30 +0100, Maarten Lankho=
rst a
> > > > =C3=A9crit=C2=A0:
> > > > > Hey,
> > > > >=20
> > > > > On 2023-02-15 11:48, Paul Cercueil wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > I am working on adding support for DMABUFs in the IIO
> > > > > > subsystem.
> > > > > >=20
> > > > > > One thing we want there, is the ability to specify the
> > > > > > number
> > > > > > of
> > > > > > bytes
> > > > > > to transfer (while still defaulting to the DMABUF size).
> > > > > >=20
> > > > > > Since dma_buf_map_attachment() returns a sg_table, I
> > > > > > basically
> > > > > > have
> > > > > > two
> > > > > > options, and I can't decide which one is the best (or the
> > > > > > less
> > > > > > ugly):
> > > > > >=20
> > > > > > - Either I add a new API function similar to
> > > > > > dmaengine_prep_slave_sg(),
> > > > > > which still takes a scatterlist as argument but also takes
> > > > > > the
> > > > > > number
> > > > > > of bytes as argument;
> > > > > >=20
> > > > > > - Or I add a function to duplicate the scatterlist and then
> > > > > > shrink
> > > > > > it
> > > > > > manually, which doesn't sound like a good idea either.
> > > > > >=20
> > > > > > What would be the recommended way?
> > > > > Does this need an api change? If you create a DMA-BUF of size
> > > > > X,
> > > > > it
> > > > > has
> > > > > to be of size X. You can pad with a dummy page probably if
> > > > > you
> > > > > know
> > > > > it
> > > > > in advance. But after it has been imported, it cannot change
> > > > > size.
> > > > Yes, the sizes are fixed.
> > > >=20
> > > > > You don=C2=B4t have to write the entire dma-buf either, so if you
> > > > > want
> > > > > to
> > > > > create a 1GB buf and only use the first 4K, that is allowed.
> > > > > The
> > > > > contents of=C2=A0 the remainder of the DMA-BUF are undefined. It'=
s
> > > > > up
> > > > > to
> > > > > userspace to assign a meaning to it.
> > > > >=20
> > > > > I think I'm missing something here that makes the whole
> > > > > question
> > > > > m,ake
> > > > > more sense.
> > > > I want my userspace to be able to specify how much of the
> > > > DMABUF is
> > > > to
> > > > be read from or written to.
> > > >=20
> > > > So in my new "dmabuf enqueue" IOCTL that I want to add to IIO,
> > > > I
> > > > added
> > > > a parameter to specify the number of bytes to transfer (where 0
> > > > means
> > > > the whole buffer).
> > > >=20
> > > > The problem I have now, is that the current dmaengine core does
> > > > not
> > > > have a API function that takes a scatterlist (returned by
> > > > dma_map_attachment()) and a transfer size in bytes, it will
> > > > always
> > > > transfer the whole scatterlist.
> > > >=20
> > > > So my two options would be to add a new API function to support
> > > > specifying a bytes count, or add a mechanism to duplicate a
> > > > scatterlist, so that I can tweak it to the right size.
> > > This doesn't have to happen through DMA-BUF. Presumably you are
> > > both
> > > the
> > > importer and the exporter, so after you know how much is read,
> > > you
> > > can
> > > tell this to the importer that X number of bytes can be read from
> > > DMA-BUF Y.
> > Yes, I do that already as it is an argument in my ioctl.
> >=20
> > > In your case, when enqueing you will get a full SG list, but if
> > > you
> > > know
> > > only X bytes are read/written you only have to map the first X
> > > bytes
> > > to
> > > your IIO device. The rest of the SG list could be ignored safely.
> > Yes. But I don't know how to "ignore the rest of the SG list".
> >=20
> > - dma_buf_map_attachment() does not have a parameter to specify
> > that I
> > only need the first X bytes mapped;
> >=20
> > - if I map the whole thing, dmaengine_prep_slave_sg() does not have
> > an
> > option to specify that I only want the first X bytes transferred.
>=20
> sg_split apppears to allow you to split it? I'm not 100% sure whether
> it=20
> leaves the original SG untouched, but you can try to put it in
> between=20
> those 2 calls to get a smaller SG to pass to prep_slave_sg.

I overlooked sg_split. It looks like it could work for me.

Thanks!

Cheers,
-Paul
