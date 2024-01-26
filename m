Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A1983DA43
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 13:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DC310F1AD;
	Fri, 26 Jan 2024 12:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C939910F1AD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 12:39:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52C9A623EB;
 Fri, 26 Jan 2024 12:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09E4C433C7;
 Fri, 26 Jan 2024 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706272774;
 bh=1RmIO20ZrVFOJhkIEU21RVyS1vhtimFH2h8BiYD1gsM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ujjFCZbpLBpX26i3RyiVdqhwPAX9LhS8uh1aqdd23t1B7Fnx/fomJOq3vjr4HAgjb
 sdd2QDNvy2pn5b1gwaDUOU6A9snOV9OiV1VPFHpUFIGDtLE6pNLrLrzV+dbe+TaLQa
 cSDKUvKMtue5yZuxbJVvhH703ESM7U3sbSKF7/ZuTRNuYuDE61xMVroMP58JMIgtB2
 5eLCgODXEOVp2Lz96A09wVDIsNWSgCiHvJ/UVJ16DO5Q+uYaSgISjkmAlAG+PkM1nZ
 n6QvGwF9gX6ARPqDkGMWhDrbRo3DzXGjPcoePYCMvCComs6hLgY30plSJG2ckXGSmV
 Hj68eMXlXEktg==
Date: Fri, 26 Jan 2024 13:39:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer()
 for drm_panic
Message-ID: <z7llrzae4uqqsfdbu5syv6udmrhzuq2oqdc2lmpehmgep4st7z@hrvspcsdonrf>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <ZaFBofhe217zCmWN@phenom.ffwll.local>
 <l3podaaakwaai7xuxaa7cdb5c4s7m6jc6pitepk6uk7o3knn2b@jg5a2hnla77z>
 <Zakp7YbFeRlhhIwd@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zpclabjy7jg7adgd"
Content-Disposition: inline
In-Reply-To: <Zakp7YbFeRlhhIwd@phenom.ffwll.local>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 noralf@tronnes.org, tzimmermann@suse.de, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zpclabjy7jg7adgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 02:38:53PM +0100, Daniel Vetter wrote:
> On Fri, Jan 12, 2024 at 02:56:17PM +0100, Maxime Ripard wrote:
> > On Fri, Jan 12, 2024 at 02:41:53PM +0100, Daniel Vetter wrote:
> > > > +		fb =3D plane->state->fb;
> > > > +		/* Only support linear modifier */
> > > > +		if (fb->modifier !=3D DRM_FORMAT_MOD_LINEAR)
> > > > +			continue;
> > > > +
> > > > +		/* Check if color format is supported */
> > > > +		if (!drm_panic_is_format_supported(fb->format->format))
> > > > +			continue;
> > > > +
> > > > +		dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);
> > > > +
> > > > +		/* Buffer should be accessible from the CPU */
> > > > +		if (dma_obj->base.import_attach)
> > >=20
> > > This might be a bit too restrictive, since some drivers import dma-buf
> > > including a vmap. So just checking for ->vaddr might be better. But c=
an be
> > > changed later on.
> > >=20
> > > > +			continue;
> > > > +
> > > > +		/* Buffer should be already mapped to CPU */
> > >=20
> > > I'd clarify this comment to state that vaddr is invariant over the
> > > lifetime of the buffer and therefore needs no locking. Correct locking
> > > that a) takes all the locks b) never ever stalls for one is absolutely
> > > crucial for a panic handler that won't make the situation worse.
> >=20
> > I think this comment was made to address buffers that are accessible to
> > the CPU but don't have a CPU mapping (ie, created with
> > DMA_ATTR_NO_KERNEL_MAPPING for example).
>=20
> But then the NULL value of vaddr would also be invariant ...
>=20
> My emphasis is more that we need to be really careful with all the locking
> rules here in the panic handler and not just assume it's going to be safe.
> I've stitched some tricky design together, but need to still move it from
> the whiteboard to a patch.

Oh, sorry.

I misinterpreted what you were going for with that review. Sorry for the no=
ise.

Maxime

--zpclabjy7jg7adgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbOoAgAKCRDj7w1vZxhR
xbA9AQCAvklcucHWwM7fOt/tGfobT54QK4rTLF19mkmriPZq8AD/Ymlo2WDhEwlb
MsUBbPXxN3T8LiF348h4N1piX35ksAs=
=nLyd
-----END PGP SIGNATURE-----

--zpclabjy7jg7adgd--
