Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD536B93A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAD06E86C;
	Mon, 26 Apr 2021 18:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2206E870
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 18:44:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00B56AE42;
 Mon, 26 Apr 2021 18:44:56 +0000 (UTC)
To: Takashi Iwai <tiwai@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210421080859.14869-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
Message-ID: <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de>
Date: Mon, 26 Apr 2021 20:44:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421080859.14869-1-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0953901824=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0953901824==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3TF5EEK75Bex1zJrbCBAOgosVR9k9OTbb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3TF5EEK75Bex1zJrbCBAOgosVR9k9OTbb
Content-Type: multipart/mixed; boundary="WacJJIduCEeuKpZ5K8xk2r0oRzTBumfEP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Message-ID: <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de>
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
References: <20210421080859.14869-1-tiwai@suse.de>
In-Reply-To: <20210421080859.14869-1-tiwai@suse.de>

--WacJJIduCEeuKpZ5K8xk2r0oRzTBumfEP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.04.21 um 10:08 schrieb Takashi Iwai:
> On bochs DRM driver, the execution of "setterm --blank force" results
> in a frozen screen instead of a blank screen.  It's due to the lack of
> the screen blanking support in its code.
>=20
> Actually, the QEMU bochs vga side can switch to the blanking mode when
> the bit 0x20 is cleared on VGA_ATT_IW register (0x3c0), which updates
> ar_index in QEMU side.  So, essentially, we'd just need to clear the
> bit at pipe disable callback; that's what this patch does essentially.
>=20
> However, a tricky part is that the access via VGA_ATT_IW is done in
> "flip-flop"; the first write is for index and the second write is for
> the data like palette.  Meanwhile, in the current bochs DRM driver,
> the flip-flop wasn't considered, and it calls only the register update
> once with the value 0x20.

I read up on the details of what the attribute registers do and what=20
you're modifying is the PAS field in the attribute index register. It=20
controls write access to the attribute fields.

=20
https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/at=
trreg.htm#3C0

It's located in the index register and cleared while attributes/palettes =

are updated. I guess that in this mode the stdvga disables the palette=20
entirely (hence the screen turns dark).

While it works, it feels wrong to do this.

I to do blanking/unblanking with the SR field in SEQ0

=20
https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga/se=
qreg.htm#00

That's what drivers usually do AFAICT. I think the 'unblank' comment=20
next to the existing code might be misleading.

Best regards
Thomas

>=20
> The spec and the actual VGA implementation in QEMU suggests that the
> flip flop flag is discarded by reading the CRTC index register
> (VGA_IS1_RC, 0x3da).  So, in this patch, we add the helper to read a
> byte and the call to clear the flip flop flag before changing the
> blank / unblank setup via VGA_ATT_IW register.
>=20
> v1->v2:
> * discard ar_flip_flop by reading 0x3da, add bochs_vga_readb()
> * include video/vga.h for VGA register definitions
> * move the blank/unblank code to bochs_hw_blank()
>=20
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   drivers/gpu/drm/bochs/bochs.h     |  1 +
>   drivers/gpu/drm/bochs/bochs_hw.c  | 25 ++++++++++++++++++++++++-
>   drivers/gpu/drm/bochs/bochs_kms.c |  8 ++++++++
>   3 files changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/boch=
s.h
> index e5bd1d517a18..e9645c612aff 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -78,6 +78,7 @@ struct bochs_device {
>   int bochs_hw_init(struct drm_device *dev);
>   void bochs_hw_fini(struct drm_device *dev);
>  =20
> +void bochs_hw_blank(struct bochs_device *bochs, bool blank);
>   void bochs_hw_setmode(struct bochs_device *bochs,
>   		      struct drm_display_mode *mode);
>   void bochs_hw_setformat(struct bochs_device *bochs,
> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/b=
ochs_hw.c
> index 2d7380a9890e..7d3426d8cc69 100644
> --- a/drivers/gpu/drm/bochs/bochs_hw.c
> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
> @@ -7,6 +7,7 @@
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fourcc.h>
>  =20
> +#include <video/vga.h>
>   #include "bochs.h"
>  =20
>   /* ------------------------------------------------------------------=
---- */
> @@ -24,6 +25,19 @@ static void bochs_vga_writeb(struct bochs_device *bo=
chs, u16 ioport, u8 val)
>   	}
>   }
>  =20
> +static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)
> +{
> +	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
> +		return 0xff;
> +
> +	if (bochs->mmio) {
> +		int offset =3D ioport - 0x3c0 + 0x400;
> +		return readb(bochs->mmio + offset);
> +	} else {
> +		return inb(ioport);
> +	}
> +}
> +
>   static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
>   {
>   	u16 ret =3D 0;
> @@ -205,6 +219,15 @@ void bochs_hw_fini(struct drm_device *dev)
>   	kfree(bochs->edid);
>   }
>  =20
> +void bochs_hw_blank(struct bochs_device *bochs, bool blank)
> +{
> +	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
> +	/* discard ar_flip_flop */
> +	(void)bochs_vga_readb(bochs, VGA_IS1_RC);
> +	/* blank or unblank; we need only update index and set 0x20 */
> +	bochs_vga_writeb(bochs, VGA_ATT_W, blank ? 0 : 0x20);
> +}
> +
>   void bochs_hw_setmode(struct bochs_device *bochs,
>   		      struct drm_display_mode *mode)
>   {
> @@ -223,7 +246,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,
>   			 bochs->xres, bochs->yres, bochs->bpp,
>   			 bochs->yres_virtual);
>  =20
> -	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
> +	bochs_hw_blank(bochs, false);
>  =20
>   	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
>   	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/=
bochs_kms.c
> index 853081d186d5..99410e77d51a 100644
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
> +	bochs_hw_blank(bochs, true);
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


--WacJJIduCEeuKpZ5K8xk2r0oRzTBumfEP--

--3TF5EEK75Bex1zJrbCBAOgosVR9k9OTbb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCHCicFAwAAAAAACgkQlh/E3EQov+CP
xxAApz07b7PXfVpIqepgJfV6rc2UDWjKD7dNTpOsemxxFGhr5o+bK7VfI8oC0Ox251yilRf5wS6G
FFRSEaKH2p8AKv0Bh907WoERvMht8hl7yVV5zO+yXVi7YIZKUgR5dMUA0QpDbLnm/CgXpNI2W+Mk
uVwhmVauj4xWmhiXC9XgKBV0+AdVeydUMammYJeujrdn6+X+7KvKy4hHQCx9ixNH8fThguv0STJw
1boec0dpj77mQm+7Xx8bvYX+/cw41JOjYMYgzqCLgIdJqze7yrgqUqK1DVmWKFZJAowVlIcCALXr
mj/RlSgYN4rsRoM7hQ8UbZNKQPYtD2AvcLVxrt+TA/jDfY1THnDGp48xkKjj1tvhUDBcmxmrRF2h
vGEXJBOAcjgzuBxrc7BDOdJgJTWRunREGRh6WrthgmJmr06R+7CVj5uaomYAOoRA4lGBGSiRmj4v
0UqEzilM1cvIagCO81UTrMlK3CeypFpXKg22+Z6XH4OlIk98UbqfWoz8O3kXVlWMSt8mj08iLWQB
hHbVIlr9Aigy44/Az6tBbUP88jvhpB1skSwnOq704AIjb2jsWkKasUnWc2zL0ebdvpJu6eb0Qbd3
Pe2IYTPp6TSMXKZtBYe3ZGbx5KpD412u5L0E2a+pAGQF4922nbcnx0bowtyx7mo/561+JKgGX+no
hBY=
=CHYf
-----END PGP SIGNATURE-----

--3TF5EEK75Bex1zJrbCBAOgosVR9k9OTbb--

--===============0953901824==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0953901824==--
