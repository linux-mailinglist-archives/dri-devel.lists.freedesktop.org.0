Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E632213B625
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 00:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB70F89B84;
	Tue, 14 Jan 2020 23:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B0989B84
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 23:50:18 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id n8so6562559qvg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ltWFIHCyY7OrWG5Cg+S59nIkaHWj+/GSD9PDSisGf+I=;
 b=qm2ZNpGjogw/nTc0qK/av1kE/Uzpfeh8KI+FHfu25NiBau+Snbh1kww4DSggXpKQM8
 ioBiZdABqqnwcmu5B0YM6br72P3MOvTdaiZoJQ9LLE2/wo5KIOPe4wbccOh11Dvg9DCu
 +uD0mh8Tzoo0YDrFWXGSPqkgjpJMGrzAZZJPa2nprnjconvJ0ClsFwCq2WIZJ47rU6a3
 1F2zB6NJbNY9VEVx1JavcSLQYdLWwmJSvrsLNszR2dKzQulgiT+bwvA3HEmYKHqPLKcy
 c7DBJAnxgx5plNKuOQ4YVzNaxakYGxAohLZlCTuzMP7A/krBpRbj6nuDsMGUe2o4I69R
 EYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ltWFIHCyY7OrWG5Cg+S59nIkaHWj+/GSD9PDSisGf+I=;
 b=QXiAmAaiz57/2NHSjhIsqJfp4QOff2RTz7Nb1OqK/E5iQV8XeIy+gDZmOC7wUWwndA
 hFMlMyBmGC59XLXhrbiax/OtELQPsbKt2HjRsHDm+/jYJ3fyFa0r+yjLYnopzQpm6M4+
 9xNvqVzAXA0mbAYspF3iRC2NSd/P15SiME2gywZLUg6zfIp8qPvvIA4yTGLYX/U8heKr
 X8xetyMDSUiKMYDTqVwmqAOqrkyy+7Lu4A2/Lv/JjerLAIGQTPqBXrrCRi0TCegaIlAn
 Jbwdm1nwAa6Zq+cyaiF4D+w2DIpMcpW+yvgVBBq46e3Vckju9NFu56UIluL/Qxh+kXFq
 Va2A==
X-Gm-Message-State: APjAAAVz4uinlg+Pw8zo3qOL0wao+3pPQxI4cm0Y6R0pS1M4yfpTTHUK
 hYkCxc1q3H4syJoCmy6/M+g=
X-Google-Smtp-Source: APXvYqxi864iIohQ1jlGvEqnBFBtc+lyFBNwFKyCwBF6hrlUCBaXVvFwV5pjxuKyf9DmT96Rk7yXdA==
X-Received: by 2002:a0c:aa8a:: with SMTP id f10mr19631909qvb.200.1579045817752; 
 Tue, 14 Jan 2020 15:50:17 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id v7sm8604606qtk.89.2020.01.14.15.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 15:50:16 -0800 (PST)
Date: Tue, 14 Jan 2020 18:50:13 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/10] drm/vkms: plane_state->fb iff plane_state->crtc
Message-ID: <20200114235013.o6y2hgu6mzfpf6dx@smtp.gmail.com>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-9-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20191213172612.1514842-9-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: multipart/mixed; boundary="===============0259765431=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0259765431==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a75u4bat3424wry7"
Content-Disposition: inline


--a75u4bat3424wry7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/13, Daniel Vetter wrote:
> Checking both is one too much, so wrap a WARN_ON around it to stope
> the copypasta.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 5fc8f85aaf3d..6d31265a2ab7 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -117,7 +117,7 @@ static int vkms_plane_atomic_check(struct drm_plane *=
plane,
>  	bool can_position =3D false;
>  	int ret;
> =20
> -	if (!state->fb | !state->crtc)
> +	if (!state->fb || WARN_ON(!state->crtc))
>  		return 0;
> =20
>  	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> --=20
> 2.24.0
>

Hi,

Sorry, the delay in taking a look at this patch.

I tried to find the whole series for getting the context related to this
patch, but I could not find it in my mailbox. Could you shed some light
here? Why check fb and crtc is too much? How the WARN_ON fix the issue?

Best Regards

Ps.: in the commit message: "stope" -> "stop"

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--a75u4bat3424wry7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl4eU64ACgkQWJzP/com
vP/eNhAAwufnWl5lI5OK5c6YC5MIs1mT2pq2lQRM+6OguXvMYLFUNUeN04OqFV7i
xhqSlwc32wHx5Ik2DEsfItEAkWA2yFTtRg2CDPnLtVF1Z8odFdxeExqUiH2yFYzj
n+s/1kXc0kRmHRW8l1+bZe+jzcCQWugb7bRks8besMYTEzSXdZs6yZ0Ylnqr1aRv
AZ+rIpiq3TCduqPiA2ylqtIDOzG4cA7bG3XZqmSeUjB6rVlu9a30/tJ/TpD3C60m
VOCQaJiQL0ty8+BNonLpQJ0QxRFoZ0h/9rRuZ9Nmzs+eOoRkBQwoDJd2QpMKywq9
ymPBSUv9DzrK/gnyHka06Lh8so0eZrgYOmfLjgqNkeiE/SwlM62zhJwYRtCEUu8x
1KZ/19tJQQHGsDMCR9tSQouyQInCJkIg+2J5kU5xPjX/zvr5gdd5/Lz4YUvXajMF
U64KveTs+sVhCWoguGtJaxnul5JEcEKos6B1bTYTB1JfCLw5ftjNm65JJuRPOtGp
uqx+eY0ietcHVMxgxqoknUE9LXc5lgwBTo5gPl2NF247Vr/kcZxBZ9TVYZK8EaEk
cA67gchHRCfO7mObcjC5aJ4WcZffgm3GLlUYFBFtdCDem+zNL9Y8Agat24vX8r8G
GxyP7ozbCq+nRUK91I6rbUYh5D1RW4Wa65ul2KFJ6utAEEt8j54=
=3FtI
-----END PGP SIGNATURE-----

--a75u4bat3424wry7--

--===============0259765431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0259765431==--
