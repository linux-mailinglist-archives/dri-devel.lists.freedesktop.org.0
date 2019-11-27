Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8310AFBB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 13:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A056E29B;
	Wed, 27 Nov 2019 12:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 988C76E29B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 12:43:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E4F2B326;
 Wed, 27 Nov 2019 12:43:39 +0000 (UTC)
Subject: Re: [PATCH v2] drm/ast: Fix potential NULL-pointer read during atomic
 mode setting
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191127073109.9807-1-tzimmermann@suse.de>
 <20191127104927.GF29965@phenom.ffwll.local>
 <a35ade35-3d64-d8f2-3cd8-f96412f053f0@suse.de>
 <20191127123842.GC406127@phenom.ffwll.local>
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
Message-ID: <d8d62894-2e01-e952-94fd-7f702ae336f2@suse.de>
Date: Wed, 27 Nov 2019 13:43:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191127123842.GC406127@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============0459125485=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0459125485==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8WswLKodzZBWKtH5xJlWSCvwdkjPCPeYb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8WswLKodzZBWKtH5xJlWSCvwdkjPCPeYb
Content-Type: multipart/mixed; boundary="gztQHqYF2fbBSJb7fMuHsr2BEg1R74Hpt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: kraxel@redhat.com, airlied@redhat.com, daniel.vetter@ffwll.ch,
 yc_chen@aspeedtech.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Message-ID: <d8d62894-2e01-e952-94fd-7f702ae336f2@suse.de>
Subject: Re: [PATCH v2] drm/ast: Fix potential NULL-pointer read during atomic
 mode setting
References: <20191127073109.9807-1-tzimmermann@suse.de>
 <20191127104927.GF29965@phenom.ffwll.local>
 <a35ade35-3d64-d8f2-3cd8-f96412f053f0@suse.de>
 <20191127123842.GC406127@phenom.ffwll.local>
In-Reply-To: <20191127123842.GC406127@phenom.ffwll.local>

--gztQHqYF2fbBSJb7fMuHsr2BEg1R74Hpt
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 27.11.19 um 13:38 schrieb Daniel Vetter:
> On Wed, Nov 27, 2019 at 01:31:25PM +0100, Thomas Zimmermann wrote:
>> Hi Daniel
>>
>> Am 27.11.19 um 11:49 schrieb Daniel Vetter:
>>> On Wed, Nov 27, 2019 at 08:31:09AM +0100, Thomas Zimmermann wrote:
>>>> When enabling the CRTC after waking up from a power-saving mode, the=

>>>> primary plane's framebuffer might be NULL, which leads to a stack tr=
ace
>>>> as shown below.
>>>>
>>>>   [  632.624608] BUG: kernel NULL pointer dereference, address: 0000=
000000000048
>>>>   [  632.624631] #PF: supervisor read access in kernel mode
>>>>   [  632.624639] #PF: error_code(0x0000) - not-present page
>>>>   [  632.624647] PGD 0 P4D 0
>>>>   [  632.624654] Oops: 0000 [#1] SMP PTI
>>>>   [  632.624662] CPU: 0 PID: 2082 Comm: gnome-shell Tainted: G      =
      E     5.4.0-rc7-1-default+ #114
>>>>   [  632.624673] Hardware name: Sun Microsystems SUN FIRE X2270 M2/S=
UN FIRE X2270 M2, BIOS 2.05    07/01/2010
>>>>   [  632.624689] RIP: 0010:ast_crtc_helper_atomic_enable+0x7d/0x680 =
[ast]
>>>>   [  632.624698] Code: 48 8b 80 e0 02 00 00 4c 8b 60 10 31 c0 f3 48 =
ab 48 8b 83 78 04 00 00 4c 89 ef 48 8d 70 18 e8 9a e9 55 ce 48 8b 83 78 0=
4 00 00 <49> 8b 7c 24 48 4c 89 ea 4c 8d 44 24 28 48 8d 4c 24 20 48 8d 70 =
18
>>>>   [  632.624718] RSP: 0018:ffffbe9ec123fa40 EFLAGS: 00010246
>>>>   [  632.624726] RAX: ffff95a13cfd3400 RBX: ffff95a13cf32000 RCX: 00=
00000000000000
>>>>   [  632.624735] RDX: 0000000000000000 RSI: ffff95a13cfd34e8 RDI: ff=
ffbe9ec123fb40
>>>>   [  632.624744] RBP: ffffbe9ec123fb80 R08: 0000000000000000 R09: 00=
00000000000003
>>>>   [  632.624753] R10: 0000000000000000 R11: 0000000000000000 R12: 00=
00000000000000
>>>>   [  632.624762] R13: ffffbe9ec123fa70 R14: ffff95a13beb7000 R15: ff=
ff95a13cf32800
>>>>   [  632.624772] FS:  00007f6d2763e140(0000) GS:ffff95a134000000(000=
0) knlGS:0000000000000000
>>>>   [  632.624782] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>   [  632.624790] CR2: 0000000000000048 CR3: 00000001192f8004 CR4: 00=
000000000206f0
>>>>   [  632.624800] Call Trace:
>>>>   [  632.624811]  ? __lock_acquire+0x409/0x7c0
>>>>   [  632.624830]  drm_atomic_helper_commit_modeset_enables+0x1af/0x2=
00
>>>>   [  632.624840]  drm_atomic_helper_commit_tail+0x32/0x70
>>>>   [  632.624849]  commit_tail+0xc7/0x110
>>>>   [  632.624857]  drm_atomic_helper_commit+0x121/0x130
>>>>   [  632.624867]  drm_atomic_connector_commit_dpms+0xd7/0x100
>>>>   [  632.624878]  set_property_atomic+0xaf/0x110
>>>>   [  632.624890]  drm_mode_obj_set_property_ioctl+0xbb/0x190
>>>>   [  632.624899]  ? drm_mode_obj_find_prop_id+0x40/0x40
>>>>   [  632.624909]  drm_ioctl_kernel+0x86/0xd0
>>>>   [  632.624918]  drm_ioctl+0x1e4/0x36b
>>>>   [  632.624925]  ? drm_mode_obj_find_prop_id+0x40/0x40
>>>>   [  632.624939]  do_vfs_ioctl+0x4bd/0x6e0
>>>>   [  632.624949]  ksys_ioctl+0x5e/0x90
>>>>   [  632.624957]  __x64_sys_ioctl+0x16/0x20
>>>>   [  632.624966]  do_syscall_64+0x5a/0x220
>>>>   [  632.624976]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
>>>>   [  632.624984] RIP: 0033:0x7f6d2b0de387
>>>>   [  632.624991] Code: 00 00 90 48 8b 05 f9 9a 0c 00 64 c7 00 26 00 =
00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 0=
0 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c9 9a 0c 00 f7 d8 64 89 01 =
48
>>>>   [  632.625011] RSP: 002b:00007fffb49def38 EFLAGS: 00000246 ORIG_RA=
X: 0000000000000010
>>>>   [  632.625021] RAX: ffffffffffffffda RBX: 00007fffb49def70 RCX: 00=
007f6d2b0de387
>>>>   [  632.625030] RDX: 00007fffb49def70 RSI: 00000000c01864ba RDI: 00=
00000000000009
>>>>   [  632.625040] RBP: 00000000c01864ba R08: 0000000000000000 R09: 00=
000000c0c0c0c0
>>>>   [  632.625049] R10: 0000000000000030 R11: 0000000000000246 R12: 00=
0055bc367eb920
>>>>   [  632.625058] R13: 0000000000000009 R14: 0000000000000002 R15: 00=
00000000000000
>>>>   [  632.625071] Modules linked in: ebtable_filter(E) ebtables(E) ip=
6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E)=
 af_packet(E) scsi_transport_iscsi(E) dmi_sysfs(E) msr(E) xfs(E) intel_po=
werclamp(E) coretemp(E) k)
>>>>   [  632.625185] CR2: 0000000000000048
>>>>
>>>> The STR is
>>>>
>>>>   * start gdm and wait for it to switch off the display
>>>>   * wake up the display by pressing a key
>>>>
>>>> The fix implements atomic_check for planes and rejects configuration=
s
>>>> with an invisible primary plane.
>>>>
>>>> v2:
>>>> 	* do an atomic check for plane
>>>> 	* reject invisible primary planes
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Fixes: b48e1b6ffd28 ("drm/ast: Add CRTC helpers for atomic modesetti=
ng")
>>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>> ---
>>>>  drivers/gpu/drm/ast/ast_mode.c | 50 +++++++++++++++++++++++++++++++=
++-
>>>>  1 file changed, 49 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/as=
t_mode.c
>>>> index 4725ec911a66..8e7bb8ce8130 100644
>>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>>> @@ -31,6 +31,7 @@
>>>>  #include <linux/export.h>
>>>>  #include <linux/pci.h>
>>>>
>>>> +#include <drm/drm_atomic.h>
>>>>  #include <drm/drm_atomic_helper.h>
>>>>  #include <drm/drm_atomic_state_helper.h>
>>>>  #include <drm/drm_crtc.h>
>>>> @@ -556,6 +557,31 @@ static const uint32_t ast_primary_plane_formats=
[] =3D {
>>>>  int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>>  					  struct drm_plane_state *state)
>>>>  {
>>>> +	struct drm_crtc *crtc;
>>>> +	struct drm_crtc_state *crtc_state;
>>>> +	int ret;
>>>> +
>>>> +	if (state->crtc)
>>>> +		crtc =3D state->crtc;
>>>> +	else if (plane->state && plane->state->crtc)
>>>> +		crtc =3D plane->state->crtc;
>>>> +	else
>>>> +		return 0; /* disabling an already disabled plane */
>>>> +
>>>> +	crtc_state =3D drm_atomic_get_new_crtc_state(state->state, crtc);
>>>> +	if (WARN_ON_ONCE(!crtc_state))
>>>> +		return -EINVAL; /* BUG: no new CRTC state allocated */
>>>
>>> The above is a lot more complicated than necessary, see e.g.
>>> atmel_hlcdc_plane_atomic_check. And even that is too complicated, sin=
ce
>>> crtc is set iff fb is set, you only need to check one of them.
>>
>> Thanks for your review. This comment sounds as if it's at the wrong
>> position?
>=20
> Nope. Instead of the stuff above you have do this:
>=20
> 	if (!state->crtc)
> 		return 0;
>=20
> 	crtc_state =3D drm_atomic_get_existing_crtc_state(s->state, s->crtc);
> 	mode =3D &crtc_state->adjusted_mode;
>=20
> which is what atmel has, except the redundant fb check dropped. Same fo=
r
> the cursor version below too.

Thanks for clarifying.

> -Daniel
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>>> +
>>>> +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
>>>> +						  DRM_PLANE_HELPER_NO_SCALING,
>>>> +						  DRM_PLANE_HELPER_NO_SCALING,
>>>> +						  false, true);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (!state->visible)
>>>> +		return -EINVAL; /* primary plane must be visible */
>>>> +
>>>>  	return 0;
>>>>  }
>>>>
>>>> @@ -567,7 +593,7 @@ void ast_primary_plane_helper_atomic_update(stru=
ct drm_plane *plane,
>>>>  	struct drm_gem_vram_object *gbo;
>>>>  	s64 gpu_addr;
>>>>
>>>> -	if (!crtc || !state->fb)
>>>> +	if (!crtc || !state->fb || !state->visible)
>>>>  		return;
>>>>
>>>>  	gbo =3D drm_gem_vram_of_gem(state->fb->obj[0]);
>>>> @@ -660,6 +686,28 @@ ast_cursor_plane_helper_prepare_fb(struct drm_p=
lane *plane,
>>>>  static int ast_cursor_plane_helper_atomic_check(struct drm_plane *p=
lane,
>>>>  						struct drm_plane_state *state)
>>>>  {
>>>> +	struct drm_crtc *crtc;
>>>> +	struct drm_crtc_state *crtc_state;
>>>> +	int ret;
>>>> +
>>>> +	if (state->crtc)
>>>> +		crtc =3D state->crtc;
>>>> +	else if (plane->state && plane->state->crtc)
>>>> +		crtc =3D plane->state->crtc;
>>>> +	else
>>>> +		return 0; /* disabling an already disabled plane */
>>>> +
>>>> +	crtc_state =3D drm_atomic_get_new_crtc_state(state->state, crtc);
>>>> +	if (WARN_ON_ONCE(!crtc_state))
>>>> +		return -EINVAL; /* BUG: no new CRTC state allocated */
>>>> +
>>>> +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
>>>> +						  DRM_PLANE_HELPER_NO_SCALING,
>>>> +						  DRM_PLANE_HELPER_NO_SCALING,
>>>> +						  false, true);
>>>
>>> Pretty sure you want your cursor to be positionable ...
>>> -Daniel
>>>
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>>  	return 0;
>>>>  }
>>>>
>>>> --
>>>> 2.23.0
>>>>
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
>=20
>=20
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--gztQHqYF2fbBSJb7fMuHsr2BEg1R74Hpt--

--8WswLKodzZBWKtH5xJlWSCvwdkjPCPeYb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3eb3cACgkQaA3BHVML
eiOoHAf+K4yCQjrq5yf1cMiH8kiqyKfPUgPH7DCiLmEKuzzSEo54EdZO3Cq6kown
MUNOdsJDxdO4fzaZ2YqZKjJJAUFE4DOjsYwyjWg9mXv3Vr4eCf1QlVM8lwfJCqwb
oOk0BMTqUuiHK8p35FzD+Pa57HOesu4tB0Ve/5o6BtvAF8D3nrqnqMEcFflYVDI/
be1fkgCI6O5I05LcwWCBJtRkFNu2fqWvLCl1tR7NX9MWmaOQHb0gT5sRYlENsaO5
KOILVw+5geR9ssXQ1qoWMcURy8wuWEvKEXZYmDir7f3+1GhFjiMZT1SwTUQquImL
P1J/sjBsFmRA9MV9UdWCLz3mqs7B3g==
=jSLB
-----END PGP SIGNATURE-----

--8WswLKodzZBWKtH5xJlWSCvwdkjPCPeYb--

--===============0459125485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0459125485==--
