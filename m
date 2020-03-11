Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C3F18142D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 10:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F8F6E943;
	Wed, 11 Mar 2020 09:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0002B6E93D;
 Wed, 11 Mar 2020 09:10:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 51A15AF5B;
 Wed, 11 Mar 2020 09:10:21 +0000 (UTC)
Subject: Re: [PATCH 06/51] drm/udl: Use drmm_add_final_kfree
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-7-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <bd6a3f23-5736-f4a6-c4a4-c21dd3f3f75f@suse.de>
Date: Wed, 11 Mar 2020 10:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-7-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0149049919=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0149049919==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="samOmoDWrLh4ugNquPXlae0Wj88N2huzw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--samOmoDWrLh4ugNquPXlae0Wj88N2huzw
Content-Type: multipart/mixed; boundary="C65QLCmuQAM2FZSfrdlWWfKsSk11ApGQE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Emil Velikov <emil.l.velikov@gmail.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Thomas Gleixner <tglx@linutronix.de>
Message-ID: <bd6a3f23-5736-f4a6-c4a4-c21dd3f3f75f@suse.de>
Subject: Re: [PATCH 06/51] drm/udl: Use drmm_add_final_kfree
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20200302222631.3861340-7-daniel.vetter@ffwll.ch>

--C65QLCmuQAM2FZSfrdlWWfKsSk11ApGQE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 02.03.20 um 23:25 schrieb Daniel Vetter:
> With this we can drop the final kfree from the release function.
>=20
> v2: We need drm_dev_put to unroll the driver creation (once
> drm_dev_init and drmm_add_final_kfree suceeded), otherwise
> the drmm_ magic doesn't happen.
>=20
> v3: Actually squash in the fixup (Laurent).
>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=C3=B8nnes" <noralf@tronnes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_dr=
v.c
> index e6c1cd77d4d4..6a5594946096 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_print.h>
> @@ -38,7 +39,6 @@ static void udl_driver_release(struct drm_device *dev=
)
>  	udl_fini(dev);
>  	udl_modeset_cleanup(dev);
>  	drm_dev_fini(dev);
> -	kfree(dev);
>  }
> =20
>  static struct drm_driver driver =3D {
> @@ -77,11 +77,11 @@ static struct udl_device *udl_driver_create(struct =
usb_interface *interface)
> =20
>  	udl->udev =3D udev;
>  	udl->drm.dev_private =3D udl;
> +	drmm_add_final_kfree(&udl->drm, udl);
> =20
>  	r =3D udl_init(udl);
>  	if (r) {
> -		drm_dev_fini(&udl->drm);
> -		kfree(udl);
> +		drm_dev_put(&udl->drm);
>  		return ERR_PTR(r);
>  	}
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--C65QLCmuQAM2FZSfrdlWWfKsSk11ApGQE--

--samOmoDWrLh4ugNquPXlae0Wj88N2huzw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5oqvwACgkQaA3BHVML
eiNSiAf/UdEfnOfffPPOGp2VJtk0TsPJ60bFqi8bbzCKnuLnQMfSv8D/f7+lQ8SP
J/Tw152WTLzUydOjpmo/dM6svIPJ5huqowhBNnctmSxEs3iHlnmEWIL04JKu+7BL
hUukIFwZM14sSXJXjPe++8i0CF8wRXXKs4LbloYmuAOBLR5Hh/HWliA2qZz5eVwh
gwWRkU89VNERqGQxgRdFeTbPCYOrcnt+C68eFequLW76IIgW3Sib87PPL5JwCJPU
A+Jt94///t+r+uKmfHA8EX77wS1AGxBnllL3SDxS9J1u4krqxhhen69ohWJcvYtL
JrV+tHv+rScenEkDFJgu37PzBSjDWw==
=BOeF
-----END PGP SIGNATURE-----

--samOmoDWrLh4ugNquPXlae0Wj88N2huzw--

--===============0149049919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0149049919==--
