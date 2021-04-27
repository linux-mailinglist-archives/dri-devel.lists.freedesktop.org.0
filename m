Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C718936BF8C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 08:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B66E900;
	Tue, 27 Apr 2021 06:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C056E900
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 06:58:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D3E9EAF9C;
 Tue, 27 Apr 2021 06:58:35 +0000 (UTC)
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
To: Takashi Iwai <tiwai@suse.de>
References: <20210421080859.14869-1-tiwai@suse.de>
 <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de> <s5hk0oo1c9d.wl-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
Date: Tue, 27 Apr 2021 08:58:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <s5hk0oo1c9d.wl-tiwai@suse.de>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============0137890011=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0137890011==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5VfHzjXGKY4Bp7DBCovbXHtLxQw2QFajo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5VfHzjXGKY4Bp7DBCovbXHtLxQw2QFajo
Content-Type: multipart/mixed; boundary="NflIGcYDCC7PD56qc8Fs6aE2xzAEXhWUP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 virtualization@lists.linux-foundation.org
Message-ID: <a557e727-d866-3dd3-ec96-741e7da7cf62@suse.de>
Subject: Re: [PATCH v2] drm/bochs: Add screen blanking support
References: <20210421080859.14869-1-tiwai@suse.de>
 <d1b1fa01-2254-f5cf-0ed0-f8e9c1c3f9ae@suse.de> <s5hk0oo1c9d.wl-tiwai@suse.de>
In-Reply-To: <s5hk0oo1c9d.wl-tiwai@suse.de>

--NflIGcYDCC7PD56qc8Fs6aE2xzAEXhWUP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.04.21 um 08:18 schrieb Takashi Iwai:
> On Mon, 26 Apr 2021 20:44:55 +0200,
> Thomas Zimmermann wrote:
>>
>> Hi
>>
>> Am 21.04.21 um 10:08 schrieb Takashi Iwai:
>>> On bochs DRM driver, the execution of "setterm --blank force" results=

>>> in a frozen screen instead of a blank screen.  It's due to the lack o=
f
>>> the screen blanking support in its code.
>>>
>>> Actually, the QEMU bochs vga side can switch to the blanking mode whe=
n
>>> the bit 0x20 is cleared on VGA_ATT_IW register (0x3c0), which updates=

>>> ar_index in QEMU side.  So, essentially, we'd just need to clear the
>>> bit at pipe disable callback; that's what this patch does essentially=
=2E
>>>
>>> However, a tricky part is that the access via VGA_ATT_IW is done in
>>> "flip-flop"; the first write is for index and the second write is for=

>>> the data like palette.  Meanwhile, in the current bochs DRM driver,
>>> the flip-flop wasn't considered, and it calls only the register updat=
e
>>> once with the value 0x20.
>>
>> I read up on the details of what the attribute registers do and what
>> you're modifying is the PAS field in the attribute index register. It
>> controls write access to the attribute fields.
>>
>>
>> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga=
/attrreg.htm#3C0
>>
>> It's located in the index register and cleared while
>> attributes/palettes are updated. I guess that in this mode the stdvga
>> disables the palette entirely (hence the screen turns dark).
>>
>> While it works, it feels wrong to do this.
>>
>> I to do blanking/unblanking with the SR field in SEQ0
>>
>>
>> https://web.stanford.edu/class/cs140/projects/pintos/specs/freevga/vga=
/seqreg.htm#00
>>
>> That's what drivers usually do AFAICT. I think the 'unblank' comment
>> next to the existing code might be misleading.
>=20
> Yeah, when you look at the existing vga16fb.c in kernel, we can find a
> relatively complex blanking procedure.  OTOH, what I changed is rather
> based on the the actual behavior of bochs is more or less simplified.
> QEMU hw/display/vga.c contains a code like:
>=20
> static void vga_update_display(void *opaque)
> {
>      VGACommonState *s =3D opaque;
>      DisplaySurface *surface =3D qemu_console_surface(s->con);
>      int full_update, graphic_mode;
>=20
>      qemu_flush_coalesced_mmio_buffer();
>=20
>      if (surface_bits_per_pixel(surface) =3D=3D 0) {
>          /* nothing to do */
>      } else {
>          full_update =3D 0;
>          if (!(s->ar_index & 0x20)) {
>              graphic_mode =3D GMODE_BLANK;
>          } else {
>              graphic_mode =3D s->gr[VGA_GFX_MISC] & VGA_GR06_GRAPHICS_M=
ODE;
>          }
>          if (graphic_mode !=3D s->graphic_mode) {
>              s->graphic_mode =3D graphic_mode;
>              s->cursor_blink_time =3D qemu_clock_get_ms(QEMU_CLOCK_VIRT=
UAL);
>              full_update =3D 1;
>          }
>          switch(graphic_mode) {
>          case GMODE_TEXT:
>              vga_draw_text(s, full_update);
>              break;
>          case GMODE_GRAPH:
>              vga_draw_graphic(s, full_update);
>              break;
>          case GMODE_BLANK:
>          default:
>              vga_draw_blank(s, full_update);
>              break;
>          }
>      }
> }
>=20
> So, it simply checks the ar_index () at each update and switches
> from/to the blank mode depending on the bit 0x20.
>=20
> I'm fine to change in any better way, of course, so feel free to
> modify the patch.

If no one objects, I'll merge it as-is. It's somewhat wrong wrt to VGA,=20
but apparently what qemu wants.

Best regards
Thomas

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> The spec and the actual VGA implementation in QEMU suggests that the
>>> flip flop flag is discarded by reading the CRTC index register
>>> (VGA_IS1_RC, 0x3da).  So, in this patch, we add the helper to read a
>>> byte and the call to clear the flip flop flag before changing the
>>> blank / unblank setup via VGA_ATT_IW register.
>>>
>>> v1->v2:
>>> * discard ar_flip_flop by reading 0x3da, add bochs_vga_readb()
>>> * include video/vga.h for VGA register definitions
>>> * move the blank/unblank code to bochs_hw_blank()
>>>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>> ---
>>>    drivers/gpu/drm/bochs/bochs.h     |  1 +
>>>    drivers/gpu/drm/bochs/bochs_hw.c  | 25 ++++++++++++++++++++++++-
>>>    drivers/gpu/drm/bochs/bochs_kms.c |  8 ++++++++
>>>    3 files changed, 33 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bo=
chs.h
>>> index e5bd1d517a18..e9645c612aff 100644
>>> --- a/drivers/gpu/drm/bochs/bochs.h
>>> +++ b/drivers/gpu/drm/bochs/bochs.h
>>> @@ -78,6 +78,7 @@ struct bochs_device {
>>>    int bochs_hw_init(struct drm_device *dev);
>>>    void bochs_hw_fini(struct drm_device *dev);
>>>    +void bochs_hw_blank(struct bochs_device *bochs, bool blank);
>>>    void bochs_hw_setmode(struct bochs_device *bochs,
>>>    		      struct drm_display_mode *mode);
>>>    void bochs_hw_setformat(struct bochs_device *bochs,
>>> diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs=
/bochs_hw.c
>>> index 2d7380a9890e..7d3426d8cc69 100644
>>> --- a/drivers/gpu/drm/bochs/bochs_hw.c
>>> +++ b/drivers/gpu/drm/bochs/bochs_hw.c
>>> @@ -7,6 +7,7 @@
>>>    #include <drm/drm_drv.h>
>>>    #include <drm/drm_fourcc.h>
>>>    +#include <video/vga.h>
>>>    #include "bochs.h"
>>>      /*
>>> ---------------------------------------------------------------------=
-
>>> */
>>> @@ -24,6 +25,19 @@ static void bochs_vga_writeb(struct bochs_device *=
bochs, u16 ioport, u8 val)
>>>    	}
>>>    }
>>>    +static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)=

>>> +{
>>> +	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
>>> +		return 0xff;
>>> +
>>> +	if (bochs->mmio) {
>>> +		int offset =3D ioport - 0x3c0 + 0x400;
>>> +		return readb(bochs->mmio + offset);
>>> +	} else {
>>> +		return inb(ioport);
>>> +	}
>>> +}
>>> +
>>>    static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
>>>    {
>>>    	u16 ret =3D 0;
>>> @@ -205,6 +219,15 @@ void bochs_hw_fini(struct drm_device *dev)
>>>    	kfree(bochs->edid);
>>>    }
>>>    +void bochs_hw_blank(struct bochs_device *bochs, bool blank)
>>> +{
>>> +	DRM_DEBUG_DRIVER("hw_blank %d\n", blank);
>>> +	/* discard ar_flip_flop */
>>> +	(void)bochs_vga_readb(bochs, VGA_IS1_RC);
>>> +	/* blank or unblank; we need only update index and set 0x20 */
>>> +	bochs_vga_writeb(bochs, VGA_ATT_W, blank ? 0 : 0x20);
>>> +}
>>> +
>>>    void bochs_hw_setmode(struct bochs_device *bochs,
>>>    		      struct drm_display_mode *mode)
>>>    {
>>> @@ -223,7 +246,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,=

>>>    			 bochs->xres, bochs->yres, bochs->bpp,
>>>    			 bochs->yres_virtual);
>>>    -	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
>>> +	bochs_hw_blank(bochs, false);
>>>      	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
>>>    	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp)=
;
>>> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/boch=
s/bochs_kms.c
>>> index 853081d186d5..99410e77d51a 100644
>>> --- a/drivers/gpu/drm/bochs/bochs_kms.c
>>> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
>>> @@ -57,6 +57,13 @@ static void bochs_pipe_enable(struct drm_simple_di=
splay_pipe *pipe,
>>>    	bochs_plane_update(bochs, plane_state);
>>>    }
>>>    +static void bochs_pipe_disable(struct drm_simple_display_pipe
>>> *pipe)
>>> +{
>>> +	struct bochs_device *bochs =3D pipe->crtc.dev->dev_private;
>>> +
>>> +	bochs_hw_blank(bochs, true);
>>> +}
>>> +
>>>    static void bochs_pipe_update(struct drm_simple_display_pipe *pipe=
,
>>>    			      struct drm_plane_state *old_state)
>>>    {
>>> @@ -67,6 +74,7 @@ static void bochs_pipe_update(struct drm_simple_dis=
play_pipe *pipe,
>>>      static const struct drm_simple_display_pipe_funcs
>>> bochs_pipe_funcs =3D
>> {
>>>    	.enable	    =3D bochs_pipe_enable,
>>> +	.disable    =3D bochs_pipe_disable,
>>>    	.update	    =3D bochs_pipe_update,
>>>    	.prepare_fb =3D drm_gem_vram_simple_display_pipe_prepare_fb,
>>>    	.cleanup_fb =3D drm_gem_vram_simple_display_pipe_cleanup_fb,
>>>
>>
>> --=20
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>> (HRB 36809, AG N=C3=BCrnberg)
>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>
>> [2 OpenPGP digital signature <application/pgp-signature (7bit)>]
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NflIGcYDCC7PD56qc8Fs6aE2xzAEXhWUP--

--5VfHzjXGKY4Bp7DBCovbXHtLxQw2QFajo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCHthsFAwAAAAAACgkQlh/E3EQov+Cr
wg//cz2Pzea8/1jCISQzbTlgjjil3QaWd6KOhe6aOe77Dmckc+HmC70as/lzVG9V0g1DGKGe8KJY
w950g7zjvbu6xNijqf3VLgQJPGEzHO7drQm1kGX2MXwdYEy2MgHO+WWk4ei2ZZ0um+eMMvkQj5zh
u2Adf0HdpmM8ZoGUVoTk5yiC07gVYJRQVYK5x1xF0QK2qlvqU1zfzueLBLbwomT3AQYqyPvMbn70
FNoBok+9vO4lJLQnVZBirRqGFw0UyBDYc/fZpqPB5wZ31TKQvZPMYl+/pe2yYM43LtAnmLc46/Bj
6rhQadvt3jAyucFdHUwWoWZTRqt2gAeASeoEReXi4rDAeDqJnSg0fAjTg/vzGFU/JbHGNBg2ahAQ
9cfReo7FgaJb36HvAA6REtOLTf72l1TZTO1tj/CNUEWH6BEJx/eKdYvKaxKznoaDx52lH6GbVGrV
UfzAeF5DapBHWVf1+JblZNioEnbv3J1OZPSEAxk2gf6ggFn9uUECfSsAmojRhw3YdlRr90lG0S+T
HrvhipWrzdAoa92VAXiC1f9tHB5Np1AMtW8/q99AQJuYvoJ3GcvvuBUoxluLj3Q07TlbpQp9eydb
YvRJicxCwLFLBkufMDftE6PI7f6cYTiF5QcxEIq1G1MsRpaC0JXWHiOb8bs06V2EDVwrDDXR/hVp
Mlc=
=Uspz
-----END PGP SIGNATURE-----

--5VfHzjXGKY4Bp7DBCovbXHtLxQw2QFajo--

--===============0137890011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0137890011==--
