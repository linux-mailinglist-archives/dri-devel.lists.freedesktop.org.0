Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F074A365ECA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 19:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107176E88A;
	Tue, 20 Apr 2021 17:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73686E88A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 17:47:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85D7FAE93;
 Tue, 20 Apr 2021 17:47:32 +0000 (UTC)
Subject: Re: [PATCH] drm/bochs: Add screen blanking support
To: Takashi Iwai <tiwai@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210420165659.23163-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6d2f59c0-113f-2d9e-1fb3-a794dafbd74a@suse.de>
Date: Tue, 20 Apr 2021 19:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420165659.23163-1-tiwai@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============1656818790=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1656818790==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="upFGBTJuhzTG1kLZEuVD8z83NERT1gLUE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--upFGBTJuhzTG1kLZEuVD8z83NERT1gLUE
Content-Type: multipart/mixed; boundary="aHJGaqLLv0JPrVs0jpLkJ6GVyLewlwkMf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Message-ID: <6d2f59c0-113f-2d9e-1fb3-a794dafbd74a@suse.de>
Subject: Re: [PATCH] drm/bochs: Add screen blanking support
References: <20210420165659.23163-1-tiwai@suse.de>
In-Reply-To: <20210420165659.23163-1-tiwai@suse.de>

--aHJGaqLLv0JPrVs0jpLkJ6GVyLewlwkMf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.04.21 um 18:56 schrieb Takashi Iwai:
> On bochs DRM driver, the execution of "setterm --blank force" results
> in a frozen screen instead of a blank screen.  It's due to the lack of
> the screen blanking support in its code.
>=20
> Actually, the QEMU bochs vga side can switch to the blanking mode when
> the bit 0x20 is cleared on VGA_ATT_IW register (0x3c0), which updates
> ar_index in QEMU side.  So, essentially, we'd just need to clear the
> bit at pipe disable callback; that's what this patch does essentially.
>=20
> However, a tricky part is that the QEMU vga code does treat VGA_ATT_IW
> register always as "flip-flop"; the first write is for index and the
> second write is for the data like palette.  Meanwhile, in the current
> bochs DRM driver, the flip-flop wasn't considered, and it calls only
> the register update once with the value 0x20.
>=20

Unless bochs does things very different, the index should first be reset =

by reading 0x3da. Then write the index, then the data.

https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/vg=
areg.htm#attribute

Best regards
Thomas

> So, in this patch, we fix the behavior by simply writing the
> VGA_ATT_IW register value twice at each place as well.
>=20
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   drivers/gpu/drm/bochs/bochs_hw.c  | 13 ++++++++++++-
>   drivers/gpu/drm/bochs/bochs_kms.c |  8 ++++++++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/b=
ochs_hw.c
> index 2d7380a9890e..9a6f90216d6c 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -213,6 +213,14 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>   	if (!drm_dev_enter(bochs->dev, &idx))
>   		return;
>  =20
> +	if (!mode) {
> +		DRM_DEBUG_DRIVER("crtc disabled\n");
> +		/* set to blank mode; send twice for ar_flip_flop */
> +		bochs_vga_writeb(bochs, 0x3c0, 0);
> +		bochs_vga_writeb(bochs, 0x3c0, 0);
> +		goto exit;
> +	}
> +
>   	bochs->xres =3D mode->hdisplay;
>   	bochs->yres =3D mode->vdisplay;
>   	bochs->bpp =3D 32;
> @@ -223,7 +231,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>   			 bochs->xres, bochs->yres, bochs->bpp,
>   			 bochs->yres_virtual);
>  =20
> -	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
> +	/* unblank; send twice for ar_flip_flop */
> +	bochs_vga_writeb(bochs, 0x3c0, 0x20);
> +	bochs_vga_writeb(bochs, 0x3c0, 0x20);
>  =20
>   	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
>   	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
> @@ -239,6 +249,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>   	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
>   			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
>  =20
> + exit:
>   	drm_dev_exit(idx);
>   }
>  =20
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/=
bochs_kms.c
> index 853081d186d5..b0d77d6d3ae4 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -57,6 +57,13 @@ static void bochs_pipe_enable(struct drm_simple_disp=
lay_pipe *pipe,
>   	bochs_plane_update(bochs, plane_state);
>   }
>  =20
> +static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct bochs_device *bochs =3D pipe->crtc.dev->dev_private;
> +
> +	bochs_hw_setmode(bochs, NULL);
> +}
> +
>   static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
>   			      struct drm_plane_state *old_state)
>   {
> @@ -67,6 +74,7 @@ static void bochs_pipe_update(struct drm_simple_displ=
ay_pipe *pipe,
>  =20
>   static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs =3D=20
{
>   	.enable	    =3D bochs_pipe_enable,
> +	.disable    =3D bochs_pipe_disable,
>   	.update	    =3D bochs_pipe_update,
>   	.prepare_fb =3D drm_gem_vram_simple_display_pipe_prepare_fb,
>   	.cleanup_fb =3D drm_gem_vram_simple_display_pipe_cleanup_fb,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--aHJGaqLLv0JPrVs0jpLkJ6GVyLewlwkMf--

--upFGBTJuhzTG1kLZEuVD8z83NERT1gLUE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB/E7MFAwAAAAAACgkQlh/E3EQov+D6
FxAAuT0d/eBrm30dkVWuMrQ1Vk0j4VGdJ7WwuDe/mpeDgwx0MYsbkk8P3kAjESM7qcfMLZa5oluz
Xj5bk+o1+bGYp110rhz5NgVOlYllWJ/FHRfeGoDWPJKRqeUwYgPycPKu7rc9VKKvjxJjLdzJ8Uku
NrZcqL3i9NDjKASk70YD2DByjpEm8oowgvB8QAc1bMpf9BO8wpLJTXZBjNRteKAcunDe+jeuR4KH
D9ZTJ+DMyDkjYegDvb/yj0YeLkPyTpwnTGdra958+AkhhLLkL1NE7YFPRN97jXc3oJC8JdOIQ0Rj
lMh5soym8MD/Z3yKM5nO4GC5qsoUBm4+7F5atyZtilvKEGY/vsIWLmaAAsF5hAKIl2Rj4Fud9Kg0
0IeUGGT0LXulOy40zKpAdnie3YuLqL3O9C19/wvhjhInfOG9YfNQz4pl0ZN7JNFOCWUJnB3cJizc
HEHjBrMryNW9mZkr+OHd9tSHQfGz/q4P8EWJotJ37ExxMN5cwXQ2mZoCCRJJs2CcJMRP0vLYzEK3
v0CyRX7iedrzYcL/zvSI9SNbMSmL9r2+ntm8ld+vxHFOXQmbeeqzYrpRi43/gc7BaJw2ibHOP0eF
v4+QbaDvtygv8eLmBLPCZoKM8wOtG2hA8YPCAVjGEsy1JRqFuAOzPai+Qj04MriypXkGxdpZrhCy
YPk=
=Co6c
-----END PGP SIGNATURE-----

--upFGBTJuhzTG1kLZEuVD8z83NERT1gLUE--

--===============1656818790==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1656818790==--
