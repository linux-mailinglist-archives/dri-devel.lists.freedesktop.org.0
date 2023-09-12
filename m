Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D949D79CA38
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 10:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D417310E3BB;
	Tue, 12 Sep 2023 08:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B93D10E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 08:40:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BD55B81B81;
 Tue, 12 Sep 2023 08:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B646AC433C8;
 Tue, 12 Sep 2023 08:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694508007;
 bh=a0CyG+Fm9N1FxQvDM4Ss0c8iVzL1ahh4KEeqhhs3EOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RejPJgHbE5cQKWxAGkyKIEVva7UZ7xy73n6B/z1MAtv8PQVFqZqfrVCnx4s31eNHh
 wIt0nVKSeHo+zAh6SMY7UimpRQiSB6VhFHp1QJZqgnJT1J4nfKdaVNihw8DkHz4EKf
 cBmEOa+Idq/63it1yWUgO405GKgxIsPfPQ1oi+34ZcBvs4vfreVZlyrc9Wtgg0do+/
 mx7GyqkGB/vTAgzUWIvYt3GgPiLMZEUkjvSQ9CfJaQBlBYxQerdRJxEYEuE+yUrQFV
 FPGbV9Ilb4Kn7TjyxYZZgRNiS2BML0gAED8BCE8oQdj1Z++6ntTntHApHT08LHrTwr
 jYV59nMa+vK8w==
Date: Tue, 12 Sep 2023 10:40:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
Message-ID: <x75lakzrl2awslaid5ffneepxusej7b7ojvz36bgpdwriztcru@h4bvwr2oeaov>
References: <20230910094041.715408-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hvty5qodf4v2nkrj"
Content-Disposition: inline
In-Reply-To: <20230910094041.715408-1-javierm@redhat.com>
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


--hvty5qodf4v2nkrj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 10, 2023 at 11:40:28AM +0200, Javier Martinez Canillas wrote:
> The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
> .atomic_check() callback") moved the allocation of the intermediate and
> HW buffers from the encoder's .atomic_enable callback, to the plane's
> .atomic_check callback.
>=20
> This was suggested by Maxime Ripard, because drivers aren't allowed to
> fail after the drm_atomic_helper_swap_state() function has been called.
>=20
> And the encoder's .atomic_enable happens after the new atomic state has
> been swapped, so allocations (that can fail) shouldn't be done there.
>=20
> But the HW buffer isn't really tied to the plane's state. It has a fixed
> size that only depends on the (also fixed) display resolution defined in
> the Device Tree Blob.
>=20
> That buffer can be considered part of the CRTC state, and for this reason
> makes more sense to do its allocation in the CRTC .atomic_check callback.
>=20
> The other allocated buffer (used to store a conversion from the emulated
> XR24 format to the native R1 format) is part of the plane's state, since
> it will be optional once the driver supports R1 and allows user-space to
> set that pixel format.
>=20
> So let's keep the allocation for it in the plane's .atomic_check callback,
> this can't be moved to the CRTC's .atomic_check because changing a format
> does not trigger a CRTC mode set.
>=20
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/dri-devel/CAMuHMdWv_QSatDgihr8=3D2SXHhvp=
=3DicNxumZcZOPwT9Q_QiogNQ@mail.gmail.com/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
> Changes in v2:
> - Drop RFC prefix.
> - Fix typo in commit message (Thomas Zimmermann).
> - Store the HW buffer in the driver's private CRTC state (Thomas Zimmerma=
nn).
> - Just use kmalloc() kcalloc() when allocating buffers (Thomas Zimmermann=
).
> - Keep the allocation of the intermediate buffer in the plane's .atomic_c=
heck
>=20
>  drivers/gpu/drm/solomon/ssd130x.c | 143 ++++++++++++++++++++++--------
>  1 file changed, 108 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/=
ssd130x.c
> index 3b4dde09538a..c866dd40d163 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -141,14 +141,23 @@ const struct ssd130x_deviceinfo ssd130x_variants[] =
=3D {
>  };
>  EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
> =20
> +struct ssd130x_crtc_state {
> +	struct drm_crtc_state base;
> +	/* Buffer to store pixels in HW format and written to the panel */
> +	u8 *data_array;
> +};
> +
>  struct ssd130x_plane_state {
>  	struct drm_shadow_plane_state base;
>  	/* Intermediate buffer to convert pixels from XRGB8888 to HW format */
>  	u8 *buffer;
> -	/* Buffer to store pixels in HW format and written to the panel */
> -	u8 *data_array;
>  };
> =20
> +static inline struct ssd130x_crtc_state *to_ssd130x_crtc_state(struct dr=
m_crtc_state *state)
> +{
> +	return container_of(state, struct ssd130x_crtc_state, base);
> +}
> +
>  static inline struct ssd130x_plane_state *to_ssd130x_plane_state(struct =
drm_plane_state *state)
>  {
>  	return container_of(state, struct ssd130x_plane_state, base.base);
> @@ -448,13 +457,11 @@ static int ssd130x_init(struct ssd130x_device *ssd1=
30x)
>  }
> =20
>  static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
> -			       struct ssd130x_plane_state *ssd130x_state,
> -			       struct drm_rect *rect)
> +			       struct drm_rect *rect, u8 *buf,
> +			       u8 *data_array)
>  {
>  	unsigned int x =3D rect->x1;
>  	unsigned int y =3D rect->y1;
> -	u8 *buf =3D ssd130x_state->buffer;
> -	u8 *data_array =3D ssd130x_state->data_array;

That's just a matter of taste I guess, but I would pass the crtc_state
pointer there instead of an opaque byte array (without any boundary).

>  	unsigned int width =3D drm_rect_width(rect);
>  	unsigned int height =3D drm_rect_height(rect);
>  	unsigned int line_length =3D DIV_ROUND_UP(width, 8);
> @@ -550,12 +557,10 @@ static int ssd130x_update_rect(struct ssd130x_devic=
e *ssd130x,
>  	return ret;
>  }
> =20
> -static void ssd130x_clear_screen(struct ssd130x_device *ssd130x,
> -				 struct ssd130x_plane_state *ssd130x_state)
> +static void ssd130x_clear_screen(struct ssd130x_device *ssd130x, u8 *dat=
a_array)
>  {
>  	unsigned int page_height =3D ssd130x->device_info->page_height;
>  	unsigned int pages =3D DIV_ROUND_UP(ssd130x->height, page_height);
> -	u8 *data_array =3D ssd130x_state->data_array;
>  	unsigned int width =3D ssd130x->width;
>  	int ret, i;
> =20
> @@ -594,15 +599,13 @@ static void ssd130x_clear_screen(struct ssd130x_dev=
ice *ssd130x,
>  	}
>  }
> =20
> -static int ssd130x_fb_blit_rect(struct drm_plane_state *state,
> +static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb,
>  				const struct iosys_map *vmap,
> -				struct drm_rect *rect)
> +				struct drm_rect *rect,
> +				u8 *buf, u8 *data_array)
>  {
> -	struct drm_framebuffer *fb =3D state->fb;
>  	struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
>  	unsigned int page_height =3D ssd130x->device_info->page_height;
> -	struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_state(st=
ate);
> -	u8 *buf =3D ssd130x_state->buffer;
>  	struct iosys_map dst;
>  	unsigned int dst_pitch;
>  	int ret =3D 0;
> @@ -622,7 +625,7 @@ static int ssd130x_fb_blit_rect(struct drm_plane_stat=
e *state,
> =20
>  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
> =20
> -	ssd130x_update_rect(ssd130x, ssd130x_state, rect);
> +	ssd130x_update_rect(ssd130x, rect, buf, data_array);
> =20
>  	return ret;
>  }
> @@ -634,8 +637,6 @@ static int ssd130x_primary_plane_helper_atomic_check(=
struct drm_plane *plane,
>  	struct ssd130x_device *ssd130x =3D drm_to_ssd130x(drm);
>  	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
state, plane);
>  	struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_state(pl=
ane_state);
> -	unsigned int page_height =3D ssd130x->device_info->page_height;
> -	unsigned int pages =3D DIV_ROUND_UP(ssd130x->height, page_height);
>  	const struct drm_format_info *fi;
>  	unsigned int pitch;
>  	int ret;
> @@ -654,14 +655,6 @@ static int ssd130x_primary_plane_helper_atomic_check=
(struct drm_plane *plane,
>  	if (!ssd130x_state->buffer)
>  		return -ENOMEM;
> =20
> -	ssd130x_state->data_array =3D kcalloc(ssd130x->width, pages, GFP_KERNEL=
);
> -	if (!ssd130x_state->data_array) {
> -		kfree(ssd130x_state->buffer);
> -		/* Set to prevent a double free in .atomic_destroy_state() */
> -		ssd130x_state->buffer =3D NULL;
> -		return -ENOMEM;
> -	}
> -
>  	return 0;
>  }
> =20
> @@ -671,6 +664,10 @@ static void ssd130x_primary_plane_helper_atomic_upda=
te(struct drm_plane *plane,
>  	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state(=
state, plane);
>  	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_st=
ate(state, plane);
>  	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pla=
ne_state(plane_state);
> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(sta=
te, plane_state->crtc);

You can have CRTC-less commits if you only modify a property of the
plane for example. drm_atomic_get_new_crtc_state will retrieve the CRTC
state in the global state passed as an argument, but will not make any
effort to retrieve the current CRTC state if it's not part of that commit.

You should add a call to drm_atomic_get_crtc_state in your atomic_check
hook to pull the CRTC state if it's not there so you can rely on it
here.

Maxime

--hvty5qodf4v2nkrj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQAj5AAKCRDj7w1vZxhR
xSpLAP9z31gWbcp2x3gi9duxMKDLvHGmUCskLHHgzZLFnSuo7QD9EcKwvLbAlZ3z
9TS4dNcR+qP6GtZ9dImTpzMoKQxwzgE=
=D2Y6
-----END PGP SIGNATURE-----

--hvty5qodf4v2nkrj--
