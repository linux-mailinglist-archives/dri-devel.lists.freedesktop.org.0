Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 656587A0705
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 16:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8220D10E299;
	Thu, 14 Sep 2023 14:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA64610E299
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 14:16:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38EDCB828B2;
 Thu, 14 Sep 2023 14:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E374C433C8;
 Thu, 14 Sep 2023 14:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694700956;
 bh=Tr9POIMyzq8MFT4KNHcXoqjpxBXXq4yYO2CZwGn8Zxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MuCUtXSxdJDeapWxnHoHIXYofkS2sntgfGtYF7HTkVf1R8xtryRvqJ7z4+br5bl25
 ILZL5GBdBFouJFkZliKI2Cw9BawJpQmsAAC1RtTxlI7Mi3DV7/r61/zrXbZgk05hzH
 yK9snbWjZXKbX9eVJRLctmKNiXV/uES7LafMh8+BkBwZwyCvT90L9kHHxm8jJU7iGP
 iHWRCBPwrV5Q+KNIixruklyVM+rN6J86TBPvqylrlCkZxv/FuWu8RMyVobT3u489Pr
 QvrtXROoxhge+BDQYMbRh3A0+hPVVsSiYm7QwAB89ebpwnNi6Vw4Q9cggSzHFWnnr9
 uQHpMpYfrFBjg==
Date: Thu, 14 Sep 2023 16:15:53 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
Message-ID: <b4gfkcv3zdtdgcpucufwfmi7225redkxll75gr72zdirqtrrj4@u4kvevdmhtvt>
References: <20230913052938.1114651-1-javierm@redhat.com>
 <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
 <871qf028ie.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7ebnueca26qc2exr"
Content-Disposition: inline
In-Reply-To: <871qf028ie.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7ebnueca26qc2exr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 03:23:53PM +0200, Javier Martinez Canillas wrote:
> Maxime Ripard <mripard@kernel.org> writes:
>=20
> Hello Maxime,
>=20
> > Hi,
> >
> > On Wed, Sep 13, 2023 at 07:29:25AM +0200, Javier Martinez Canillas wrot=
e:
> >>  static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs =
=3D {
> >>  	.mode_valid =3D ssd130x_crtc_helper_mode_valid,
> >> -	.atomic_check =3D drm_crtc_helper_atomic_check,
> >> +	.atomic_check =3D ssd130x_crtc_helper_atomic_check,
> >>  };
> >
> > Sorry I didn't catch that sooner, but there's no reason to call that
> > function a helper.
> >
>=20
> Yeah, agreed that there's no reason but others drivers already add the
> _helper prefix for struct drm_*_helper_funcs callbacks, and I did that
> in this driver as well to follow (what appears to be?) a convention.

=46rom a quick grep, it looks like it's the exception rather than the norm

> So I've to that now for the struct drm_crtc_helper_funcs handlers to be
> consistent with the rest of the driver, e.g for plane:
>=20
> static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_f=
uncs =3D {
> 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> 	.atomic_check =3D ssd130x_primary_plane_helper_atomic_check,
> 	.atomic_update =3D ssd130x_primary_plane_helper_atomic_update,
> 	.atomic_disable =3D ssd130x_primary_plane_helper_atomic_disable,
> };
>=20
> static const struct drm_plane_funcs ssd130x_primary_plane_funcs =3D {
> 	.update_plane =3D drm_atomic_helper_update_plane,
> 	.disable_plane =3D drm_atomic_helper_disable_plane,
> 	.reset =3D ssd130x_primary_plane_reset,
> 	.atomic_duplicate_state =3D ssd130x_primary_plane_duplicate_state,
> 	.atomic_destroy_state =3D ssd130x_primary_plane_destroy_state,
> 	.destroy =3D drm_plane_cleanup,
> };

Ack.

I still believe we should be removing the helper part, those are not
helpers. But it's not a big deal anyway.

Maxime

--7ebnueca26qc2exr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQMVmQAKCRDj7w1vZxhR
xWt/AP9ypE2JEYjaqM6zQFFWyW3ASQAg1IdDEF3Je2tF6IrUpgEAyCxcJ9mOiMU4
FcvhNGGQLD2XERp/mbMIjh00Hv/y9w0=
=aNXF
-----END PGP SIGNATURE-----

--7ebnueca26qc2exr--
