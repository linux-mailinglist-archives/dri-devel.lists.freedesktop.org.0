Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F774AD560
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22ED510E170;
	Tue,  8 Feb 2022 10:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E47B10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SHfua6xrVf7u//WuxFQQq4Xc8H/KJxrHJWtrY5SKyL0=; b=XxWlh2JNMtZzVxmSNTWiT095rk
 RKz8kuofeFSgWDf07rEDg7Bgxf2lUxz1qisWzOWAAJNGkYUpLlIukFsTOWIS3mXte8Bs5hE8WM4Pt
 st/T7TWcpC7kTw9kwze+F0mausIt0UPlVyAF66BOF5ERMoR+CnlwAQM0P2h8A5FW+neKfAHpUg1sV
 uBxc4Yh1G2xAPiOTdifwS2RNR0PB/SGz/lcSQWuUIJnHlVeZ0+MnyltseB70b4u3Ap/bFdkyO+N/3
 oG/BkBFY+CI6CXi2A9oWLBKPmMGuu35R3hhLoxMhwZZcxRWRF81cfgjfnxW5k/d7NyQoak5pvQN5A
 5uZ5sUGw==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHNWV-0005md-FA; Tue, 08 Feb 2022 11:14:59 +0100
Date: Tue, 8 Feb 2022 09:14:35 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 2/9] drm: vkms: Alloc the compose frame using vzalloc
Message-ID: <20220208101435.ytc45ppjuhol6xi6@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-3-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v7u5qh6bq6xbhffr"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-3-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v7u5qh6bq6xbhffr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> Currently, the memory to the composition frame is being allocated using
> the kzmalloc. This comes with the limitation of maximum size of one
> page size(which in the x86_64 is 4Kb and 4MB for default and hugepage
> respectively).
>=20
> Somes test of igt (e.g. kms_plane@pixel-format) uses more than 4MB when
> testing some pixel formats like ARGB16161616.
=2E.. And the following error were showing up when running
kms_plane@plane-panning-bottom-right*:

[drm:vkms_composer_worker [vkms]] *ERROR* Cannot allocate memory for
output frame.=20
>=20
> This problem is addessed by allocating the memory using kvzalloc that
> circunvents this limitation.

With this patch, can you drop these debugging issues in VKMS TO-DO[1],
please?

Thanks,

Reviewed-by: Melissa Wen <mwen@igalia.com>

[1] https://dri.freedesktop.org/docs/drm/gpu/vkms.html#igt-better-support
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 9e8204be9a14..82f79e508f81 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -180,7 +180,7 @@ static int compose_active_planes(void **vaddr_out,
>  	int i;
> =20
>  	if (!*vaddr_out) {
> -		*vaddr_out =3D kzalloc(gem_obj->size, GFP_KERNEL);
> +		*vaddr_out =3D kvzalloc(gem_obj->size, GFP_KERNEL);
>  		if (!*vaddr_out) {
>  			DRM_ERROR("Cannot allocate memory for output frame.");
>  			return -ENOMEM;
> @@ -263,7 +263,7 @@ void vkms_composer_worker(struct work_struct *work)
>  				    crtc_state);
>  	if (ret) {
>  		if (ret =3D=3D -EINVAL && !wb_pending)
> -			kfree(vaddr_out);
> +			kvfree(vaddr_out);
>  		return;
>  	}
> =20
> @@ -275,7 +275,7 @@ void vkms_composer_worker(struct work_struct *work)
>  		crtc_state->wb_pending =3D false;
>  		spin_unlock_irq(&out->composer_lock);
>  	} else {
> -		kfree(vaddr_out);
> +		kvfree(vaddr_out);
>  	}
> =20
>  	/*
> --=20
> 2.30.2
>=20

--v7u5qh6bq6xbhffr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICQoQACgkQwqF3j0dL
ehzGew/400Ly0bUGhx2YB42YBZTFLTeXxOlOnJ4xaEmiguiCfPTahC/SCZQdzn5V
yuW+6ZpmT1EwOOCWueBQG19svEaM6kYRfkasi3giFMCdGhp3bSpKYDUd7SOfG6I3
r+4pLa53WYwqbRn2LslI78GEO3RcLTLLA1fC1ZpeP3lvO74IqrxIA9g7pYUKXIHo
HOQKkUNI7zqaSmlSB0DsKaksqfwqverzyRtfcFc79pv4a9796Mxy0rH/aGEE6Zrt
fhJZ17ta0VVI8Z7EAg6c6LEHT797EsnHMGVjT/I940KWEz/Zc6aZivUZEUHzQLyj
x2AxILK1DQxhYoVjtKzebWth9PUjS3XiX+aDwK/SRCvyuC5xxHSDPKYCwT8zwqUu
HOBYoPnyl4BQEqkIn10mVKGqsJrTeBl2PFSlp8mBjO0iwjHxGWGRZh203CrDSr3K
uknf3WSyJ+rn1MNnEEynvG3ExbYdKTVI/D5DDzu2i5WGTpOe4iLJ4kTANQjKot6x
PnkmBVdSuWfyWfE9PiajOfCfQR2A70QwYS0dyUEAaYG0ZCGfOnw0r9xFGktguLj4
fVu961VBNi1s/UX5kPT26HAtib9p2zZVRCNvpK4IoePer+DSbSXzTrxTZo+dAEHz
rBb3MYoS8M7Pcu6X0UHMtSfaDocb5jNILKpLxzDxIAKMVFqhpg==
=i2tj
-----END PGP SIGNATURE-----

--v7u5qh6bq6xbhffr--
