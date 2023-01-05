Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8465F3E4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 19:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB0C10E1FF;
	Thu,  5 Jan 2023 18:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7456B10E1FF
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dG9Um1gMv8Ij5d3hj9/D2wXSFUj9D8SXkK0DcBK5imk=; b=kdpZQf1TD4yMkN3Qv/unEJ9I6k
 bnrVHGDG3YUvRKgj9XfBT68XGJdAhf4rKsKflr2La9VZ93IEOqt94IbKoljzkRwnYGrdt7rtsJ/GC
 NTqEgUVBVU/dcwH3/JRodrspdVCPwrJLEfcvi8bfGoM94BRpDgM9wIP+NQ4H/NR70aAHamYlyF/IT
 qK6Nau9UFQNXf9qKRiPrpb6qygNPauq0zXjuG4RCsvJqdhUpBWvaE+IH9Zq3sWy/gvWddSoO3r0CN
 v82X+IW/VP56Yo5al4sYmsjr9vfF+m0+yHmBthOGl1kQ72Mv3ytIFhIj6mrxpFmAcSGPJsHcigswT
 EXz7QE6Q==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDVD0-000IPJ-L4; Thu, 05 Jan 2023 19:43:22 +0100
Date: Thu, 5 Jan 2023 17:43:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH] drm/vkms: introduce prepare_fb and cleanup_fb functions
Message-ID: <20230105184313.uziimfnsk3cu3gzd@mail.igalia.com>
References: <20230105162148.234218-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wn4snninu5ndv3or"
Content-Disposition: inline
In-Reply-To: <20230105162148.234218-1-mcanal@igalia.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wn4snninu5ndv3or
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/05, Ma=EDra Canal wrote:
> With commit 359c6649cd9a ("drm/gem: Implement shadow-plane {begin,
> end}_fb_access with vmap"), the behavior of the shadow-plane helpers
> changed and the vunmap is now performed at the end of
> the current pageflip, instead of the end of the following pageflip.
>=20
> By performing the vunmap at the end of the current pageflip, invalid
> memory is accessed by the vkms during the plane composition, as the data
> is being unmapped before being used.

Hi Ma=EDra,

Thanks for investigating this issue. Can you add in the commit message
the kernel Oops caused by this change?

Besides that, I wonder if the right thing would be to restore the
previous behavior of vunmap in shadow-plane helpers, instead of
reintroduce driver-specific hooks for vmap/vunmap correctly to vkms.

Maybe Thomas has some inputs on this shadow-plane changing to help us on
figuring out the proper fix (?)

Best Regards,

Melissa

>=20
> Therefore, introduce again prepare_fb and cleanup_fb functions to the
> vkms, which were previously removed on commit b43e2ec03b0d ("drm/vkms:
> Let shadow-plane helpers prepare the plane's FB").
>=20
> Fixes: 359c6649cd9a ("drm/gem: Implement shadow-plane {begin, end}_fb_acc=
ess with vmap")
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 36 ++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index c3a845220e10..b3f8a115cc23 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -160,10 +160,44 @@ static int vkms_plane_atomic_check(struct drm_plane=
 *plane,
> 	return 0;
>  }
>=20
> +static int vkms_prepare_fb(struct drm_plane *plane,
> +			   struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb =3D state->fb;
> +	int ret;
> +
> +	if (!fb)
> +		return 0;
> +
> +	shadow_plane_state =3D to_drm_shadow_plane_state(state);
> +
> +	ret =3D drm_gem_plane_helper_prepare_fb(plane, state);
> +	if (ret)
> +		return ret;
> +
> +	return drm_gem_fb_vmap(fb, shadow_plane_state->map, shadow_plane_state-=
>data);
> +}
> +
> +static void vkms_cleanup_fb(struct drm_plane *plane,
> +			    struct drm_plane_state *state)
> +{
> +	struct drm_shadow_plane_state *shadow_plane_state;
> +	struct drm_framebuffer *fb =3D state->fb;
> +
> +	if (!fb)
> +		return;
> +
> +	shadow_plane_state =3D to_drm_shadow_plane_state(state);
> +
> +	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
> +}
> +
>  static const struct drm_plane_helper_funcs vkms_primary_helper_funcs =3D=
 {
> 	.atomic_update		=3D vkms_plane_atomic_update,
> 	.atomic_check		=3D vkms_plane_atomic_check,
> -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> +	.prepare_fb		=3D vkms_prepare_fb,
> +	.cleanup_fb		=3D vkms_cleanup_fb,
>  };
>=20
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> --
> 2.39.0
>=20

--wn4snninu5ndv3or
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO3GjgACgkQwqF3j0dL
ehw1Vw//e41UHispUMWentCtUjr3joi4b9tGils38YbEDBDGwIHTNOD92gBlc3+u
8wYQ5SYQO/cxICWKneUX9bQTm14agQZAO70MSVDWkBIdf7uYpU0ZV76pHo/OBa3K
oqO69PxGxgTQCMxy9vsyoHlno/nqmi3RPZOl/cVUs7cCn6mN5BnwZgAp7NN7VCJt
S4tA2aFY5Ah8m+F+Albdfir+FyobMha4a/H/3Sxt9ofEJN/kvdyopnDh5rE8fbQK
j/ttiLfo5HqLt9sg4TNYGU5JGvJn3/2kf8Ma9G6AThCsCE5Ey6Jp1vs8xFm9Xm1o
uT/YJxMXzq+GuOZr+1XbEveozdxOCxFWEPqIdM2adjKR5esyukLVf9u32wT2cXtq
/1WiRlMtj2tZFzZvCUsBadxz8EjK79/1RSiWyp6LujxINUvtmjoE4JzmmhrS3POX
r99HVlZF5vt4CqsfRN9URmEVuPDvom9sxE87kdZXSNoYLxZCzqF9zD1MXN4Clq5e
9wotyIHSI1/JyzClt4OqAO+F18Wxoo9i/B7vTVVdAmxqVqSPAf9SiNigIcdLtOGg
rwYLPEOVYS6Ghj0eFtqIoa0damPMfUW62a68cbBuSSjIOmwZnk/J1Xdn0e28Z+zq
+v69KFPDNmgNqKw1JYSFyn3PRdSs3oAXJZ8ge0sLB8KrsODTvD4=
=DhAB
-----END PGP SIGNATURE-----

--wn4snninu5ndv3or--
