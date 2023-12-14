Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7EC813A12
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 19:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5228510E24E;
	Thu, 14 Dec 2023 18:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48810E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 18:37:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 47D5962375;
 Thu, 14 Dec 2023 18:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F064C433C8;
 Thu, 14 Dec 2023 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702579031;
 bh=vpATXB9ZfJqiRMhK/beTBXKGGltxawXVeLlpMXdj6m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p7mzFzN0sGqY2pEHMeXE/4PZVHwIkPvad5srCJDbt3p8H/g79YQe2Qg7ex7H3wbsH
 MPLeG5NlR3L8NYJyp60EdsBXdoeXGaLtAwZ1Tz02jMTrVkw67/4a9oSHB/caJEv1Kl
 no6AWcNwV7pgnILjM2D7M9YgYTVpispDzfDIgPCJBs25ml7G72sHkzduejcYFUtXvw
 xZbM2e4VazrFeGM5kOjONjI2o29vTlaBiJSf4nSirEnedbGjdIteWfEPd/jnC+nYCw
 wtdWszOb8oVxLZlzTJrelnffaV8gal1FAw3pNxNRZ7ghkSMY8PkTL2EROjyrHJSLRM
 fRPKF6i41lBPg==
Date: Thu, 14 Dec 2023 19:37:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v5 6/6] drm/imx: Add drm_panic support
Message-ID: <va2vitynjawcvtayi562qvwq32l4m7bt3ils2bvnbbv2hcsbgb@j3gy552jgseh>
References: <20231103145526.628138-1-jfalempe@redhat.com>
 <20231103145526.628138-7-jfalempe@redhat.com>
 <4rmhvbb7kli4dm7swqhmjgbh5at6e4mwh73krloxanxgsd3bkv@zxz7mx4e5ft4>
 <3081e418-275c-4069-b22c-c3e9770fc641@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oijoksd4zq2f37ln"
Content-Disposition: inline
In-Reply-To: <3081e418-275c-4069-b22c-c3e9770fc641@redhat.com>
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
Cc: bluescreen_avenger@verizon.net, tzimmermann@suse.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, gpiccoli@igalia.com, noralf@tronnes.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oijoksd4zq2f37ln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 04:03:04PM +0100, Jocelyn Falempe wrote:
> > > +static int imx_drm_get_scanout_buffer(struct drm_device *dev,
> > > +				      struct drm_scanout_buffer *sb)
> > > +{
> > > +	struct drm_plane *plane;
> > > +	struct drm_gem_dma_object *dma_obj;
> > > +
> > > +	drm_for_each_plane(plane, dev) {
> > > +		if (!plane->state || !plane->state->fb || !plane->state->visible ||
> > > +		    plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
> > > +			continue;
> > > +
> > > +		dma_obj =3D drm_fb_dma_get_gem_obj(plane->state->fb, 0);
> > > +		if (!dma_obj->vaddr)
> > > +			continue;
> > > +
> > > +		iosys_map_set_vaddr(&sb->map, dma_obj->vaddr);
> > > +		sb->format =3D plane->state->fb->format;
> >=20
> > Planes can be using a framebuffer in one of the numerous YUV format the
> > driver advertises.
> >=20
> > > +		sb->height =3D plane->state->fb->height;
> > > +		sb->width =3D plane->state->fb->width;
> > > +		sb->pitch =3D plane->state->fb->pitches[0];
> >=20
> > And your code assumes that the buffer will be large enough for an RGB
> > buffer, which probably isn't the case for a single-planar YUV format,
> > and certainly not the case for a multi-planar one.
>=20
> Yes, this code is a bit hacky, and on my test setup the framebuffer was in
> RGB, so I didn't handle other formats.
> Also it should be possible to add YUV format later, but I would like to h=
ave
> a minimal drm_panic merged, before adding more features.

Sure. Having a minimal panic code is reasonable, but we should properly
handle not supporting them still :)

There's cases where, with the current architecture anyway, you just
won't be able to print a panic message and that's fine. The important
part is not crashing the kernel further and being as loud as we can that
we couldn't print a panic message on the screen because of the setup.

> > When the driver gives back its current framebuffer, the code should che=
ck:
> >=20
> >    * If the buffer backed by an actual buffer (and not a dma-buf handle)
>=20
> Regarding the struct drm_framebuffer, I'm not sure how do you differentia=
te
> an actual buffer from a dma-buf handle ?

Its backing drm_gem_object should be set and have the field import_attach s=
et

> >    * If the buffer is mappable by the CPU
>=20
> If "dma_obj->vaddr" is not null, then it's already mapped by the CPU righ=
t ?

I'm not sure. drm_gem_dma_create will only ever create CPU-mappable
buffers, but drm_gem_dma_prime_import_sg_table won't for example.

> >    * If the buffer is in a format that the panic code can handle
> >    * If the buffer uses a linear modifier
>=20
> Yes, that must be checked too.
>=20
> >=20
> > Failing that, your code cannot work at the moment. We need to be clear
> > about that and "gracefully" handle things instead of going forward and
> > writing pixels to places we might not be able to write to.
> >=20
> > Which kind of makes me think, why do we need to involve the driver at
> > all there?
> >=20
> > If in the panic code, we're going over all enabled CRTCs, finding the
> > primary plane currently setup for them and getting the drm_framebuffer
> > assigned to them, it should be enough to get us all the informations we
> > need, right?
>=20
> Yes, I think I can do a generic implementation for the drivers using the
> drm_gem_dma helper like imx6.
> But for simpledrm, ast, or mgag200, I need to retrieve the VRAM address,
> because it's not in the drm_framebuffer struct, so they won't be able to =
use
> this generic implementation.

Sure :)

I guess we could have a CRTC function then that by default will just
return the current primary plane framebuffer (or could be a plane
function?), and if it's not there just grabs the one from the current
active state.

Maxime

--oijoksd4zq2f37ln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXtLVAAKCRDj7w1vZxhR
xfZ2AQC+E9YdTMmPfjmlgD3bRjN8oGc8tD6y6rA7mFVvXnlBaQD+NldANFP8hOjn
ii2dMqEZjVlRZV2eSa4iTvHIyYrliAg=
=oDTy
-----END PGP SIGNATURE-----

--oijoksd4zq2f37ln--
