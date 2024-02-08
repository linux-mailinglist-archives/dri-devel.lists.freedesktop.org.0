Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0BD84E40A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 16:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0309D10E90F;
	Thu,  8 Feb 2024 15:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DpSojsJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED2110E90F;
 Thu,  8 Feb 2024 15:27:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3BB5461DCD;
 Thu,  8 Feb 2024 15:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D658C433F1;
 Thu,  8 Feb 2024 15:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707406025;
 bh=GBu1L6Qu6+/4Qs9Yi/qh0tgbEXDDN4laJMxWZ9C7Tuw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=DpSojsJnuqSoDLLtz5HK1cI35wvGFwc6kia7Ruvlv52ZvyBZehSLKVCtSTZJvhXL/
 4rKpJHKIbdhORWx/69Qu0qHD/berxtS3XM2MS9LF6ZJoXYf1Psso1rw0+2g5i8EpUX
 z06HMKBh7H8wAuj/+uUSWhxjs7cCZCHehJQCtet5B6MD+Fr6zLA4uhOExt0AigpBXR
 pZ+Sd3adi3ClHhGQdlq1SIYQTgHN0GbHsn1qYSfZipi2tOkTRgv69KEe31+LYbYtjq
 cxcG8pt97G/bGraJxVWAnkbvHcoPTakriO+3QhMhkcdmpwZQSJjqztUqfZo2KcyrRP
 qmVIWuJzu2naw==
Date: Thu, 8 Feb 2024 16:27:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [etnaviv-next v13 7/7] drm/etnaviv: Add support for vivante
 GPU cores attached via PCI(e)
Message-ID: <jahydq72bqb27de2ijwwmdjh4ri326mxhfjn5pbvf7cqcpnauq@rw5hjdiroi5d>
References: <20240206172759.421737-1-sui.jingfeng@linux.dev>
 <20240206172759.421737-8-sui.jingfeng@linux.dev>
 <ZcNO9aZwWzyYs-Rv@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hwkb76o32yktfxzj"
Content-Disposition: inline
In-Reply-To: <ZcNO9aZwWzyYs-Rv@phenom.ffwll.local>
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


--hwkb76o32yktfxzj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2024 at 10:35:49AM +0100, Daniel Vetter wrote:
> On Wed, Feb 07, 2024 at 01:27:59AM +0800, Sui Jingfeng wrote:
> > The component helper functions are the glue, which is used to bind mult=
iple
> > GPU cores to a virtual master platform device. Which is fine and works =
well
> > for the SoCs who contains multiple GPU cores.
> >=20
> > The problem is that usperspace programs (such as X server and Mesa) will
> > search the PCIe device to use if it is exist. In other words, usperspace
> > programs open the PCIe device with higher priority. Creating a virtual
> > master platform device for PCI(e) GPUs is unnecessary, as the PCI device
> > has been created by the time drm/etnaviv is loaded.
> >=20
> > we create virtual platform devices as a representation for the vivante =
GPU
> > ip core. As all of subcomponent are attached via the PCIe master device,
> > we reflect this hardware layout by binding all of the virtual child to =
the
> > the real master.
> >=20
> > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>=20
> Uh so my understanding is that drivers really shouldn't create platform
> devices of their own. For this case here I think the aux-bus framework is
> the right thing to use. Alternatively would be some infrastructure where
> you feed a DT tree to driver core or pci subsystem and it instantiates it
> all for you correctly, and especially with hotunplug all done right since
> this is pci now, not actually part of the soc that cannot be hotunplugged.

I don't think we need intermediate platform devices at all. We just need
to register our GPU against the PCI device and that's it. We don't need
a platform device, we don't need the component framework.

> I think I've seen some other pci devices from arm soc designs that would
> benefit from this too, so lifting this logic into a pci function would
> make sense imo.

Nouveau supports both iirc.

Maxime

--hwkb76o32yktfxzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcTyxgAKCRDj7w1vZxhR
xU/nAP9mow5guLkslcBCvuv6TFgr11GyScivYWuSXZHgYNZLnQD/eAOxy+J5YgcC
XBGxRyLQK9yYcpBQobofgQYNz6vOkgg=
=GQu8
-----END PGP SIGNATURE-----

--hwkb76o32yktfxzj--
