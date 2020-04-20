Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B781B0E08
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:13:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982536E591;
	Mon, 20 Apr 2020 14:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEF66E591
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:13:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14117AC44;
 Mon, 20 Apr 2020 14:13:24 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <158738670022.7365.11535132795669408878.stgit@buzz>
 <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
 <24722c20-ac21-473a-a544-bd7a063f92df@yandex-team.ru>
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
Message-ID: <9cf7de45-773b-5446-f803-523ad4a77b10@suse.de>
Date: Mon, 20 Apr 2020 16:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24722c20-ac21-473a-a544-bd7a063f92df@yandex-team.ru>
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
Content-Type: multipart/mixed; boundary="===============0703907626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0703907626==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wsNAE33imHZRNYBLGh7KdbkkXs2b5uaU6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wsNAE33imHZRNYBLGh7KdbkkXs2b5uaU6
Content-Type: multipart/mixed; boundary="Zz3gPpYpUEZQqgDADFZIf1LTehj7kcvSL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Message-ID: <9cf7de45-773b-5446-f803-523ad4a77b10@suse.de>
Subject: Re: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
References: <158738670022.7365.11535132795669408878.stgit@buzz>
 <30efe6f4-3d2f-f147-0801-9f727f797725@suse.de>
 <24722c20-ac21-473a-a544-bd7a063f92df@yandex-team.ru>
In-Reply-To: <24722c20-ac21-473a-a544-bd7a063f92df@yandex-team.ru>

--Zz3gPpYpUEZQqgDADFZIf1LTehj7kcvSL
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.04.20 um 14:58 schrieb Konstantin Khlebnikov:
>=20
>=20
> On 20/04/2020 15.55, Thomas Zimmermann wrote:
>> Hi Konstantin
>>
>> Am 20.04.20 um 14:45 schrieb Konstantin Khlebnikov:
>>> I've stumbled upon this too. Trivial fix was posted but stuck in revi=
ew.
>>> This is patch from Thomas Zimmermann changed according to suggestions=
 by
>>> Daniel Vetter from https://patchwork.kernel.org/patch/11356157/
>>
>> Did you find it on the mailing list? I was waiting for this patch to g=
et
>> merged. Apparently I forgot to push it? I'll take care of the patch.
>=20
> Ah, my bad. After deeper look I've found v2
> https://patchwork.kernel.org/patch/11357645/
> But in State=3DNew, it's definitely lost

The patch's now in drm-misc-next. [1] Thanks for the reminder.

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Df0adbc382b8bb46a24=
67c4e5e1027763a197c8e1

>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>>
>>> The ast driver inherits from DRM's CRTC state, but still uses the ato=
mic
>>> helper for struct drm_crtc_funcs.reset, drm_atomic_helper_crtc_reset(=
).
>>>
>>> The helper only allocates enough memory for the core CRTC state. That=

>>> results in an out-ouf-bounds access when duplicating the initial CRTC=

>>> state. Simplified backtrace shown below:
>>>
>>> [=C2=A0=C2=A0 21.469321]
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [=C2=A0=C2=A0 21.469434] BUG: KASAN: slab-out-of-bounds in
>>> ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
>>> [=C2=A0=C2=A0 21.469445] Read of size 8 at addr ffff888036c1c5f8 by t=
ask
>>> systemd-udevd/382
>>> [=C2=A0=C2=A0 21.469451]
>>> [=C2=A0=C2=A0 21.469464] CPU: 2 PID: 382 Comm: systemd-udevd Tainted:=

>>> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 E=
=C2=A0=C2=A0=C2=A0=C2=A0 5.5.0-rc6-1-default+ #214
>>> [=C2=A0=C2=A0 21.469473] Hardware name: Sun Microsystems SUN FIRE X22=
70 M2/SUN
>>> FIRE X2270 M2, BIOS 2.05=C2=A0=C2=A0=C2=A0 07/01/2010
>>> [=C2=A0=C2=A0 21.469480] Call Trace:
>>> [=C2=A0=C2=A0 21.469501]=C2=A0 dump_stack+0xb8/0x110
>>> [=C2=A0=C2=A0 21.469528]=C2=A0 print_address_description.constprop.0+=
0x1b/0x1e0
>>> [=C2=A0=C2=A0 21.469557]=C2=A0 ? ast_crtc_atomic_duplicate_state+0x84=
/0x100 [ast]
>>> [=C2=A0=C2=A0 21.469581]=C2=A0 ? ast_crtc_atomic_duplicate_state+0x84=
/0x100 [ast]
>>> [=C2=A0=C2=A0 21.469597]=C2=A0 __kasan_report.cold+0x1a/0x35
>>> [=C2=A0=C2=A0 21.469640]=C2=A0 ? ast_crtc_atomic_duplicate_state+0x84=
/0x100 [ast]
>>> [=C2=A0=C2=A0 21.469665]=C2=A0 kasan_report+0xe/0x20
>>> [=C2=A0=C2=A0 21.469693]=C2=A0 ast_crtc_atomic_duplicate_state+0x84/0=
x100 [ast]
>>> [=C2=A0=C2=A0 21.469733]=C2=A0 drm_atomic_get_crtc_state+0xbf/0x1c0
>>> [=C2=A0=C2=A0 21.469768]=C2=A0 __drm_atomic_helper_set_config+0x81/0x=
5a0
>>> [=C2=A0=C2=A0 21.469803]=C2=A0 ? drm_atomic_plane_check+0x690/0x690
>>> [=C2=A0=C2=A0 21.469843]=C2=A0 ? drm_client_rotation+0xae/0x240
>>> [=C2=A0=C2=A0 21.469876]=C2=A0 drm_client_modeset_commit_atomic+0x230=
/0x390
>>> [=C2=A0=C2=A0 21.469888]=C2=A0 ? __mutex_lock+0x8f0/0xbe0
>>> [=C2=A0=C2=A0 21.469929]=C2=A0 ? drm_client_firmware_config.isra.0+0x=
a60/0xa60
>>> [=C2=A0=C2=A0 21.469948]=C2=A0 ? drm_client_modeset_commit_force+0x28=
/0x230
>>> [=C2=A0=C2=A0 21.470031]=C2=A0 ? memset+0x20/0x40
>>> [=C2=A0=C2=A0 21.470078]=C2=A0 drm_client_modeset_commit_force+0x90/0=
x230
>>> [=C2=A0=C2=A0 21.470110]=C2=A0 drm_fb_helper_restore_fbdev_mode_unloc=
ked+0x5f/0xc0
>>> [=C2=A0=C2=A0 21.470132]=C2=A0 drm_fb_helper_set_par+0x59/0x70
>>> [=C2=A0=C2=A0 21.470155]=C2=A0 fbcon_init+0x61d/0xad0
>>> [=C2=A0=C2=A0 21.470185]=C2=A0 ? drm_fb_helper_restore_fbdev_mode_unl=
ocked+0xc0/0xc0
>>> [=C2=A0=C2=A0 21.470232]=C2=A0 visual_init+0x187/0x240
>>> [=C2=A0=C2=A0 21.470266]=C2=A0 do_bind_con_driver+0x2e3/0x460
>>> [=C2=A0=C2=A0 21.470321]=C2=A0 do_take_over_console+0x20a/0x290
>>> [=C2=A0=C2=A0 21.470371]=C2=A0 do_fbcon_takeover+0x85/0x100
>>> [=C2=A0=C2=A0 21.470402]=C2=A0 register_framebuffer+0x2fd/0x490
>>> [=C2=A0=C2=A0 21.470425]=C2=A0 ? kzalloc.constprop.0+0x10/0x10
>>> [=C2=A0=C2=A0 21.470503]=C2=A0 __drm_fb_helper_initial_config_and_unl=
ock+0xf2/0x140
>>> [=C2=A0=C2=A0 21.470533]=C2=A0 drm_fbdev_client_hotplug+0x162/0x250
>>> [=C2=A0=C2=A0 21.470563]=C2=A0 drm_fbdev_generic_setup+0xd2/0x155
>>> [=C2=A0=C2=A0 21.470602]=C2=A0 ast_driver_load+0x688/0x850 [ast]
>>> <...>
>>> [=C2=A0=C2=A0 21.472625]
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>
>>> Allocating enough memory for struct ast_crtc_state in a custom ast CR=
TC
>>> reset handler fixes the problem.
>>>
>>> Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
>>> Fixes: 83be6a3ceb11 ("drm/ast: Introduce struct ast_crtc_state")
>>> Link: https://patchwork.kernel.org/patch/11356157/
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> ---
>>> =C2=A0 drivers/gpu/drm/ast/ast_mode.c |=C2=A0=C2=A0 13 ++++++++++++-
>>> =C2=A0 1 file changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index cdd6c46d6557..17143e6bbfec 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -918,8 +918,19 @@ static void ast_crtc_atomic_destroy_state(struct=

>>> drm_crtc *crtc,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(ast_state);
>>> =C2=A0 }
>>> =C2=A0 +static void ast_crtc_reset(struct drm_crtc *crtc)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct ast_crtc_state *state =3D
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kzalloc(sizeof(*state), G=
FP_KERNEL);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (crtc->state)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ast_crtc_atomic_destroy_s=
tate(crtc, crtc->state);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 __drm_atomic_helper_crtc_reset(crtc, &state->base=
);
>>> +}
>>> +
>>> =C2=A0 static const struct drm_crtc_funcs ast_crtc_funcs =3D {
>>> -=C2=A0=C2=A0=C2=A0 .reset =3D drm_atomic_helper_crtc_reset,
>>> +=C2=A0=C2=A0=C2=A0 .reset =3D ast_crtc_reset,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .set_config =3D drm_crtc_helper_set_co=
nfig,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gamma_set =3D drm_atomic_helper_legac=
y_gamma_set,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .destroy =3D ast_crtc_destroy,
>>>
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Zz3gPpYpUEZQqgDADFZIf1LTehj7kcvSL--

--wsNAE33imHZRNYBLGh7KdbkkXs2b5uaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6drf8ACgkQaA3BHVML
eiPdYAf/SiQ0CFJKZA2D6EWqFnkvJRrrOqIY12luPU26Rc/2qwfnt+WEDb4UxNyj
mBbIjRUJ0b0YF4U8V3YLThs2ooZqR/j7W0kUoWZVK0+VO+JqyCx8ItVzy5kbgBPN
q3h3jUPH1Tcm7N8RNzDkfxY3qyCPW3ctDqQWuAUG5A/ojTi6EPS708peIar5eVvh
7VgJ3LwhlsAnAN3aFXZLa/U/a5FYb+tzj4h6hZXdZeBQDS8hbtRM4V6AuQb+Pj+8
n9sxT9AE+7GkMWJpFf6owTinGnEPIITK3a46ltaFvPGTUHYqa/uRW1Mlg4cktXPC
5o5MQj8YfltCpRK8clTG9+ay8qJAtQ==
=h6Rr
-----END PGP SIGNATURE-----

--wsNAE33imHZRNYBLGh7KdbkkXs2b5uaU6--

--===============0703907626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0703907626==--
