Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F9128715A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 11:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301696E0F5;
	Thu,  8 Oct 2020 09:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289566E0F5;
 Thu,  8 Oct 2020 09:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C403AAD32;
 Thu,  8 Oct 2020 09:22:05 +0000 (UTC)
Subject: Re: [PATCH] drm/fb-helper: Add locking to sysrq handling
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20201007133036.1541639-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fedcb884-fdb0-8f32-34ce-e0a2d3238413@suse.de>
Date: Thu, 8 Oct 2020 11:22:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007133036.1541639-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============2145541787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2145541787==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jqaiaDDs6wvOiZGCkWrTkQrtES96fggdZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jqaiaDDs6wvOiZGCkWrTkQrtES96fggdZ
Content-Type: multipart/mixed; boundary="VRXRAsUNmojeTScZe7nw1K6vsp0cRzO6Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <fedcb884-fdb0-8f32-34ce-e0a2d3238413@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Add locking to sysrq handling
References: <20201007133036.1541639-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201007133036.1541639-1-daniel.vetter@ffwll.ch>

--VRXRAsUNmojeTScZe7nw1K6vsp0cRzO6Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.10.20 um 15:30 schrieb Daniel Vetter:
> We didn't take the kernel_fb_helper_lock mutex, which protects that
> code. While at it, simplify the code
> - inline the function (originally shared with kgdb I think)
> - drop the error tracking and all the complications
> - drop the pointless early out, it served nothing
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 26 +++++---------------------
>  1 file changed, 5 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_h=
elper.c
> index 8697554ccd41..c2f72bb6afb1 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -281,18 +281,12 @@ int drm_fb_helper_restore_fbdev_mode_unlocked(str=
uct drm_fb_helper *fb_helper)
>  EXPORT_SYMBOL(drm_fb_helper_restore_fbdev_mode_unlocked);
> =20
>  #ifdef CONFIG_MAGIC_SYSRQ
> -/*
> - * restore fbcon display for all kms driver's using this helper, used =
for sysrq
> - * and panic handling.
> - */
> -static bool drm_fb_helper_force_kernel_mode(void)
> +/* emergency restore, don't bother with error reporting */
> +static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)=

>  {
> -	bool ret, error =3D false;
>  	struct drm_fb_helper *helper;
> =20
> -	if (list_empty(&kernel_fb_helper_list))
> -		return false;
> -
> +	mutex_lock(&kernel_fb_helper_lock);
>  	list_for_each_entry(helper, &kernel_fb_helper_list, kernel_fb_list) {=

>  		struct drm_device *dev =3D helper->dev;
> =20
> @@ -300,22 +294,12 @@ static bool drm_fb_helper_force_kernel_mode(void)=

>  			continue;
> =20
>  		mutex_lock(&helper->lock);
> -		ret =3D drm_client_modeset_commit_locked(&helper->client);
> -		if (ret)
> -			error =3D true;
> +		drm_client_modeset_commit_locked(&helper->client);
>  		mutex_unlock(&helper->lock);
>  	}
> -	return error;
> +	mutex_unlock(&kernel_fb_helper_lock);
>  }
> =20
> -static void drm_fb_helper_restore_work_fn(struct work_struct *ignored)=

> -{
> -	bool ret;
> -
> -	ret =3D drm_fb_helper_force_kernel_mode();
> -	if (ret =3D=3D true)
> -		DRM_ERROR("Failed to restore crtc configuration\n");

Is there a specific reason for removing that warning? Even if it doesn't
show up on screen, is it not helpful in the kernel's log?

In any case, the rest looks good.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

> -}
>  static DECLARE_WORK(drm_fb_helper_restore_work, drm_fb_helper_restore_=
work_fn);
> =20
>  static void drm_fb_helper_sysrq(int dummy1)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VRXRAsUNmojeTScZe7nw1K6vsp0cRzO6Y--

--jqaiaDDs6wvOiZGCkWrTkQrtES96fggdZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9+2joUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPd5wgAtqu76l4uWu20kZS3zv2Cb/nZhKLp
AwVgtnIz55kFUunodlXvx7nse2EajWOOcN04xPGRwi2tSiMezJEiGkCmRkVZUyqW
3wfuJJRe1lE7yK35BB2bLm2FNQXzUj4xK+UWoXx/hayf9Ug1QJLf8BwX9ZzS4wMb
UCwZ2aNViLPba0vaCpWoLFAciVyXmu1Ccn6/uk+VoyfuSax892TBzKgphBbiizuE
UdJ8fYW2bgKjOCT2QZZ9IzBPw/hNQaO3hQf+EKWycJlGRNajZq5y83lEBm0WJYST
ZJHePJZf/R7OZ5p4OLTR1g2BZliYBLhfFw9XWLEjTrhmTe0O6lkt9tlwyg==
=LArN
-----END PGP SIGNATURE-----

--jqaiaDDs6wvOiZGCkWrTkQrtES96fggdZ--

--===============2145541787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2145541787==--
