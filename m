Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F2782C132
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 14:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33CB10E113;
	Fri, 12 Jan 2024 13:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0ED10E113
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 13:56:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E5F0BB822E5;
 Fri, 12 Jan 2024 13:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB984C433C7;
 Fri, 12 Jan 2024 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705067780;
 bh=XwlWj+FhkeZ4Hd0BdDkCkRmx8VOp97TG6l6o6iCtJkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVoswFlLWRHkWdkg8l11qUwt9zT26X3irO+ghzVM0grjGX3lU0oBDgvnQTmiEhq0B
 HbvKYb4ckLdZ+l7Npw9+NUygyynKVx4bKfd2l44QJ2HvDpe8wdi0oEhT6zb9bRrer7
 m+sAjblA+PIZLxbyZ5wenD3hsKoUcxPgRv9tA4lFsHYqv+P1/39H16mabVYm88/efq
 g1N+rRUBaB+EQSanWX978ORJ0IlDOiTtx67Dk3sZaZGMTlpsSyAvc/RNJOAQwakBdW
 Mzq4V1I0psha/wx24FMezvo8KqgZVmkbiJXkix6NfJ8ETMNS4JUaTJIY+UELANVfi6
 /XN9l+L6arxpg==
Date: Fri, 12 Jan 2024 14:56:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v7 5/9] drm/fb_dma: Add generic get_scanout_buffer() for
 drm_panic
Message-ID: <l3podaaakwaai7xuxaa7cdb5c4s7m6jc6pitepk6uk7o3knn2b@jg5a2hnla77z>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-6-jfalempe@redhat.com>
 <ZaFBofhe217zCmWN@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ubkfypkz55rcxr7"
Content-Disposition: inline
In-Reply-To: <ZaFBofhe217zCmWN@phenom.ffwll.local>
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


--2ubkfypkz55rcxr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 02:41:53PM +0100, Daniel Vetter wrote:
> > +		fb =3D plane->state->fb;
> > +		/* Only support linear modifier */
> > +		if (fb->modifier !=3D DRM_FORMAT_MOD_LINEAR)
> > +			continue;
> > +
> > +		/* Check if color format is supported */
> > +		if (!drm_panic_is_format_supported(fb->format->format))
> > +			continue;
> > +
> > +		dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);
> > +
> > +		/* Buffer should be accessible from the CPU */
> > +		if (dma_obj->base.import_attach)
>=20
> This might be a bit too restrictive, since some drivers import dma-buf
> including a vmap. So just checking for ->vaddr might be better. But can be
> changed later on.
>=20
> > +			continue;
> > +
> > +		/* Buffer should be already mapped to CPU */
>=20
> I'd clarify this comment to state that vaddr is invariant over the
> lifetime of the buffer and therefore needs no locking. Correct locking
> that a) takes all the locks b) never ever stalls for one is absolutely
> crucial for a panic handler that won't make the situation worse.

I think this comment was made to address buffers that are accessible to
the CPU but don't have a CPU mapping (ie, created with
DMA_ATTR_NO_KERNEL_MAPPING for example).

Maxime

--2ubkfypkz55rcxr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaFFAAAKCRDj7w1vZxhR
xSdmAQDWbpshnhMFgpGCNlKd+VGz210yJlrUD4u3I/BsOsnkPwD/Z/QqTRGfqxpg
ZS2Ii/JcC1e+yjQWh+3IEJIPAWs1hwk=
=Yqeg
-----END PGP SIGNATURE-----

--2ubkfypkz55rcxr7--
