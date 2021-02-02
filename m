Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 197D530BBAE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 11:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06326E0E3;
	Tue,  2 Feb 2021 10:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34346E0E3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 10:02:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DD93AD37;
 Tue,  2 Feb 2021 10:02:36 +0000 (UTC)
Subject: Re: [PATCH] drm/vc4: hvs: Fix buffer overflow with the dlist handling
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20210129160647.128373-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ce9614e2-b9f8-c303-7272-b292189ce662@suse.de>
Date: Tue, 2 Feb 2021 11:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129160647.128373-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0407401850=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0407401850==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FRQEcoD6NeG80U3o8KSA1GRHOIN34AK1Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FRQEcoD6NeG80U3o8KSA1GRHOIN34AK1Z
Content-Type: multipart/mixed; boundary="rOXb3NFlMXEJNBDOL70afMYEvOyIPprto";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Message-ID: <ce9614e2-b9f8-c303-7272-b292189ce662@suse.de>
Subject: Re: [PATCH] drm/vc4: hvs: Fix buffer overflow with the dlist handling
References: <20210129160647.128373-1-maxime@cerno.tech>
In-Reply-To: <20210129160647.128373-1-maxime@cerno.tech>

--rOXb3NFlMXEJNBDOL70afMYEvOyIPprto
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 29.01.21 um 17:06 schrieb Maxime Ripard:
> Commit 0a038c1c29a7 ("drm/vc4: Move LBM creation out of
> vc4_plane_mode_set()") changed the LBM allocation logic from first
> allocating the LBM memory for the plane to running mode_set,
> adding a gap in the LBM, and then running the dlist allocation filling
> that gap.
>=20
> The gap was introduced by incrementing the dlist array index, but was
> never checking whether or not we were over the array length, leading
> eventually to memory corruptions if we ever crossed this limit.
>=20
> vc4_dlist_write had that logic though, and was reallocating a larger
> dlist array when reaching the end of the buffer. Let's share the logic
> between both functions.
>=20
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Eric Anholt <eric@anholt.net>
> Fixes: 0a038c1c29a7 ("drm/vc4: Move LBM creation out of vc4_plane_mode_=
set()")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_plane.c | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_=
plane.c
> index b5586c92bfe5..3d33fe3dacea 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -227,7 +227,7 @@ static void vc4_plane_reset(struct drm_plane *plane=
)
>   	__drm_atomic_helper_plane_reset(plane, &vc4_state->base);
>   }
>  =20
> -static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val=
)
> +static void vc4_dlist_counter_increment(struct vc4_plane_state *vc4_st=
ate)
>   {
>   	if (vc4_state->dlist_count =3D=3D vc4_state->dlist_size) {
>   		u32 new_size =3D max(4u, vc4_state->dlist_count * 2);
> @@ -242,7 +242,15 @@ static void vc4_dlist_write(struct vc4_plane_state=
 *vc4_state, u32 val)
>   		vc4_state->dlist_size =3D new_size;
>   	}
>  =20
> -	vc4_state->dlist[vc4_state->dlist_count++] =3D val;
> +	vc4_state->dlist_count++;
> +}
> +
> +static void vc4_dlist_write(struct vc4_plane_state *vc4_state, u32 val=
)
> +{
> +	unsigned int idx =3D vc4_state->dlist_count;
> +
> +	vc4_dlist_counter_increment(vc4_state);
> +	vc4_state->dlist[idx] =3D val;
>   }
>  =20
>   /* Returns the scl0/scl1 field based on whether the dimensions need t=
o
> @@ -1057,8 +1065,10 @@ static int vc4_plane_mode_set(struct drm_plane *=
plane,
>   		 * be set when calling vc4_plane_allocate_lbm().
>   		 */
>   		if (vc4_state->y_scaling[0] !=3D VC4_SCALING_NONE ||
> -		    vc4_state->y_scaling[1] !=3D VC4_SCALING_NONE)
> -			vc4_state->lbm_offset =3D vc4_state->dlist_count++;
> +		    vc4_state->y_scaling[1] !=3D VC4_SCALING_NONE) {
> +			vc4_state->lbm_offset =3D vc4_state->dlist_count;
> +			vc4_dlist_counter_increment(vc4_state);
> +		}
>  =20
>   		if (num_planes > 1) {
>   			/* Emit Cb/Cr as channel 0 and Y as channel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--rOXb3NFlMXEJNBDOL70afMYEvOyIPprto--

--FRQEcoD6NeG80U3o8KSA1GRHOIN34AK1Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAZIzsFAwAAAAAACgkQlh/E3EQov+Cr
mg//b/6oC5hY3le0Oof7fBAJZTSPWFQAeTS1OYTQAQ8/9DAjJ0hXkqVMeohm84/c3XBWhqETUCMQ
tu0xZdTjzPs6tSLx3/t8Tqxlwnoi1mv0JbjHn7UmnB5BGELNmCj+8N9mxYIWAgPjxLqOzIBFqkkD
zQNYgiIBHwAqWOomPZ71WoDuNqSa+M3g6YN6ZI5e8BO19XNCZxDnta404+mI60F/UqEeyEdlTgwj
ahD4APKZljwAKkqkj+Oik6DkXI2xOTugrGKt9YB/MOAUdecM2I1kQqV1n8uC+aJ8BCIXsan8IOz+
AiAa5Odf1esejfNTSijl86/8uWK5q+ggay5jiavqg72VJIl/7FKbuYx7SKDkls8PGDew+AQu2if9
iIB/r72RMQu3udgaAhJD2tMGeMnR5bjZ4SjwD21cDdH9HQny1Z1hX+geO9W+LytJl1MRKrx/fIV2
gHklOoqKFCuJmPwuNwH4uAKKt6OoqZnz8Gah4Qev3+NVf0U53ovXfqrUpZjVUWPXlk/Ah8mBOtnY
LjGhL59NcJAmlKiH2u6phiKAVFtLxTXNG6iGA5DqjufemN+4iRHlRRKZ+Ap7v28AbxCxESeIpyEc
ck4vBVionDGEgolR6DUqxkWoUeQHeVsJOYdH0PFWNcZTandMimXIktMv+m96y7hAGbKHBOou+vrv
/4w=
=Zw10
-----END PGP SIGNATURE-----

--FRQEcoD6NeG80U3o8KSA1GRHOIN34AK1Z--

--===============0407401850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0407401850==--
