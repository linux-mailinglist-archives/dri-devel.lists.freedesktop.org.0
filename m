Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 358D43CD9D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40868891E1;
	Tue, 11 Jun 2019 13:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35AE891E1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 13:52:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42B8CAE24;
 Tue, 11 Jun 2019 13:52:16 +0000 (UTC)
Subject: Re: [PATCH] drm: Reverse lock order in pan_display_legacy()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20190611115716.7052-1-tzimmermann@suse.de>
 <20190611123701.GE2458@phenom.ffwll.local>
 <fc01251c-3f1f-2e1b-36a3-8563b28f7f20@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <e90d2deb-1b01-bf07-51bd-e9c408f9e283@suse.de>
Date: Tue, 11 Jun 2019 15:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fc01251c-3f1f-2e1b-36a3-8563b28f7f20@tronnes.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1344509474=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1344509474==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dX4qeRaXs9U2E2BGGPISDijgzO6Dsa9rK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dX4qeRaXs9U2E2BGGPISDijgzO6Dsa9rK
Content-Type: multipart/mixed; boundary="wyhCmuVzRkT4tyK1FzNRIxg7rm0bJGr0C";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <e90d2deb-1b01-bf07-51bd-e9c408f9e283@suse.de>
Subject: Re: [PATCH] drm: Reverse lock order in pan_display_legacy()
References: <20190611115716.7052-1-tzimmermann@suse.de>
 <20190611123701.GE2458@phenom.ffwll.local>
 <fc01251c-3f1f-2e1b-36a3-8563b28f7f20@tronnes.org>
In-Reply-To: <fc01251c-3f1f-2e1b-36a3-8563b28f7f20@tronnes.org>

--wyhCmuVzRkT4tyK1FzNRIxg7rm0bJGr0C
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 11.06.19 um 15:29 schrieb Noralf Tr=C3=B8nnes:
>=20
>=20
> Den 11.06.2019 14.37, skrev Daniel Vetter:
>> On Tue, Jun 11, 2019 at 01:57:16PM +0200, Thomas Zimmermann wrote:
>>> Acquiring drm_client_dev.modeset_mutex after the locks in drm_fb_help=
er.dev
>>> creates a deadlock with drm_setup_crtcs() as shown below:
>>>
>>>   [    4.959319] fbcon: radeondrmfb (fb0) is primary device
>>>   [    4.993952] Console: switching to colour frame buffer device 240=
x67
>>>   [    4.994040]
>>>   [    4.994041] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>   [    4.994041] WARNING: possible circular locking dependency detect=
ed
>>>   [    4.994042] 5.2.0-rc4-1-default+ #39 Tainted: G            E
>>>   [    4.994043] ----------------------------------------------------=
--
>>>   [    4.994043] systemd-udevd/369 is trying to acquire lock:
>>>   [    4.994044] 00000000fb622acb (&client->modeset_mutex){+.+.}, at:=
 drm_fb_helper_pan_display+0x103/0x1f0 [drm_kms_helper]
>>>   [    4.994055]
>>>   [    4.994055] but task is already holding lock:
>>>   [    4.994055] 0000000028767ae4 (crtc_ww_class_mutex){+.+.}, at: dr=
m_modeset_lock+0x42/0xf0 [drm]
>>>   [    4.994072]
>>>   [    4.994072] which lock already depends on the new lock.
>>>   [    4.994072]
>>>   [    4.994072]
>>>   [    4.994072] the existing dependency chain (in reverse order) is:=

>>>   [    4.994073]
>>>   [    4.994073] -> #3 (crtc_ww_class_mutex){+.+.}:
>>>   [    4.994076]        lock_acquire+0x9e/0x170
>>>   [    4.994079]        __ww_mutex_lock.constprop.18+0x97/0xf40
>>>   [    4.994080]        ww_mutex_lock+0x30/0x90
>>>   [    4.994091]        drm_modeset_lock+0x42/0xf0 [drm]
>>>   [    4.994102]        drm_modeset_lock_all_ctx+0x1f/0xe0 [drm]
>>>   [    4.994113]        drm_modeset_lock_all+0x5e/0x1a0 [drm]
>>>   [    4.994163]        intel_modeset_init+0x60b/0xda0 [i915]
>>>   ..
>>>   [    4.994253]
>>>   [    4.994253] -> #2 (crtc_ww_class_acquire){+.+.}:
>>>   [    4.994255]        lock_acquire+0x9e/0x170
>>>   [    4.994270]        drm_modeset_acquire_init+0xcc/0x100 [drm]
>>>   [    4.994280]        drm_modeset_lock_all+0x44/0x1a0 [drm]
>>>   [    4.994320]        intel_modeset_init+0x60b/0xda0 [i915]
>>>   ..
>>>   [    4.994403]
>>>   [    4.994403] -> #1 (&dev->mode_config.mutex){+.+.}:
>>>   [    4.994405]        lock_acquire+0x9e/0x170
>>>   [    4.994408]        __mutex_lock+0x62/0x8c0
>>>   [    4.994413]        drm_setup_crtcs+0x17c/0xc50 [drm_kms_helper]
>>>   [    4.994418]        __drm_fb_helper_initial_config_and_unlock+0x3=
4/0x530 [drm_kms_helper]
>>>   [    4.994450]        radeon_fbdev_init+0x110/0x130 [radeon]
>>>   ..
>>>   [    4.994535]
>>>   [    4.994535] -> #0 (&client->modeset_mutex){+.+.}:
>>>   [    4.994537]        __lock_acquire+0xa85/0xe90
>>>   [    4.994538]        lock_acquire+0x9e/0x170
>>>   [    4.994540]        __mutex_lock+0x62/0x8c0
>>>   [    4.994545]        drm_fb_helper_pan_display+0x103/0x1f0 [drm_km=
s_helper]
>>>   [    4.994547]        fb_pan_display+0x92/0x120
>>>   [    4.994549]        bit_update_start+0x1a/0x40
>>>   [    4.994550]        fbcon_switch+0x392/0x580
>>>   [    4.994552]        redraw_screen+0x12c/0x220
>>>   [    4.994553]        do_bind_con_driver.cold.30+0xe1/0x10d
>>>   [    4.994554]        do_take_over_console+0x113/0x190
>>>   [    4.994555]        do_fbcon_takeover+0x58/0xb0
>>>   [    4.994557]        notifier_call_chain+0x47/0x70
>>>   [    4.994558]        blocking_notifier_call_chain+0x44/0x60
>>>   [    4.994559]        register_framebuffer+0x231/0x310
>>>   [    4.994564]        __drm_fb_helper_initial_config_and_unlock+0x2=
fd/0x530 [drm_kms_helper]
>>>   [    4.994590]        radeon_fbdev_init+0x110/0x130 [radeon]
>>>   ..
>>>
>>> This problem was introduced in
>>>
>>>   d81294afe	drm/fb-helper: Remove drm_fb_helper_crtc
>>>
>>> Reversing the lock ordering in pan_display_legacy() fixes the issue. =
The fix
>>> was suggested by Daniel Vetter.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: d81294afeecdacc8d84804ba0bcb3d39e64d0f27
>>
>> I think for ocd consistency it be nice to pull the lock out from both
>> pan_display_atomic and pan_disaply_legacy and move it into
>> drm_fb_helper_pan_display. Like we do drm_fb_helper_dpms or
>> drm_fb_helper_setcmap or restore_fbdev_mode_force.
>=20
> Is 'lock' referring to modeset_mutex? If so it can't be moved out
> because pan_display_atomic() calls drm_client_modeset_commit_force()
> which in turn takes the modeset_mutex lock.
>=20
> The locking in _pan_display isn't so nice looking, but I figured that n=
o
> other client would need to do panning so I kept the ugliness in
> drm_fb_helper instead of adding complexity to drm_client.
>=20
> Thanks for fixing this Thomas.
> Do you have commit rights or should I apply this?

I do, but wait a second. After going through Daniel's reply, I made a
patch that moves the panning code to the DRM client. I'll post it in a bi=
t.

Best regards
Thomas

>=20
> Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>=20
> Noralf.
>=20
>>
>> Either way Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>
>>> ---
>>>  drivers/gpu/drm/drm_fb_helper.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
>>> index 7b388674a456..d6991f07cb17 100644
>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>> @@ -1586,8 +1586,8 @@ static int pan_display_legacy(struct fb_var_scr=
eeninfo *var,
>>>  	struct drm_mode_set *modeset;
>>>  	int ret =3D 0;
>>> =20
>>> -	drm_modeset_lock_all(fb_helper->dev);
>>>  	mutex_lock(&client->modeset_mutex);
>>> +	drm_modeset_lock_all(fb_helper->dev);
>>>  	drm_client_for_each_modeset(modeset, client) {
>>>  		modeset->x =3D var->xoffset;
>>>  		modeset->y =3D var->yoffset;
>>> @@ -1600,8 +1600,8 @@ static int pan_display_legacy(struct fb_var_scr=
eeninfo *var,
>>>  			}
>>>  		}
>>>  	}
>>> -	mutex_unlock(&client->modeset_mutex);
>>>  	drm_modeset_unlock_all(fb_helper->dev);
>>> +	mutex_unlock(&client->modeset_mutex);
>>> =20
>>>  	return ret;
>>>  }
>>> --=20
>>> 2.21.0
>>>
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--wyhCmuVzRkT4tyK1FzNRIxg7rm0bJGr0C--

--dX4qeRaXs9U2E2BGGPISDijgzO6Dsa9rK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAlz/sgsACgkQaA3BHVML
eiOdAAgAsD5x6BspQK9jYzniucacFjBV+wvWgijp+iVu6MiTJJ4ZuD1aeqPVd7hh
CN9CxpQ8peltMECUoCCJhnoSR3pEBl9MVGYuowdFB/kF62vv9jAk9AGlkeoJx3Mc
G/X8QjPkA2chF+y6/oMO70yE8yIssyqPMDL6gjMR92a3SbtfCyU8WbERTH+gO7Hj
FfcK8R3S2gku9orIYsNt6M3c4cqLGrAv4/47aReqxtkMlONQgNtyJVZMHArd5BMf
3CaWTvZ5s/kDEZwtkqNxZCAo4ap9FthHZukiO86th2SPkVSJU+4bT0Xx+5Q5xEFJ
f6TBx+B7aLnfSCDiudzV4HmyFnh2qw==
=grOZ
-----END PGP SIGNATURE-----

--dX4qeRaXs9U2E2BGGPISDijgzO6Dsa9rK--

--===============1344509474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1344509474==--
