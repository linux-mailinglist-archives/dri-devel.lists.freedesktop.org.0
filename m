Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838422EB2B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 13:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A8789D64;
	Mon, 27 Jul 2020 11:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7C89D64
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 11:24:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED973AB3E;
 Mon, 27 Jul 2020 11:24:48 +0000 (UTC)
Subject: Re: [PATCH 1/3] drm/ast: Do full modeset if the primary plane's
 format changes
To: daniel@ffwll.ch
References: <20200727073707.21097-1-tzimmermann@suse.de>
 <20200727073707.21097-2-tzimmermann@suse.de>
 <20200727104043.GU6419@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <857217a7-aadc-f6c9-c713-679e390f2537@suse.de>
Date: Mon, 27 Jul 2020 13:24:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727104043.GU6419@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 emil.l.velikov@gmail.com, stable@vger.kernel.org, kraxel@redhat.com,
 airlied@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1786079488=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1786079488==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dKorrhmu4IyqY5vo6cPS0bOF752rVEhyK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dKorrhmu4IyqY5vo6cPS0bOF752rVEhyK
Content-Type: multipart/mixed; boundary="g0fikKUUyV1yl0ce5bgH3lBmGcTG93ywI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org
Message-ID: <857217a7-aadc-f6c9-c713-679e390f2537@suse.de>
Subject: Re: [PATCH 1/3] drm/ast: Do full modeset if the primary plane's
 format changes
References: <20200727073707.21097-1-tzimmermann@suse.de>
 <20200727073707.21097-2-tzimmermann@suse.de>
 <20200727104043.GU6419@phenom.ffwll.local>
In-Reply-To: <20200727104043.GU6419@phenom.ffwll.local>

--g0fikKUUyV1yl0ce5bgH3lBmGcTG93ywI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.07.20 um 12:40 schrieb daniel@ffwll.ch:
> On Mon, Jul 27, 2020 at 09:37:05AM +0200, Thomas Zimmermann wrote:
>> The atomic modesetting code tried to distinguish format changes from
>> full modesetting operations. In practice, this was buggy and the forma=
t
>> registers were often updated even for simple pageflips.
>=20
> Nah it's not buggy, it's intentional. Most hw can update formats in a f=
lip
> withouth having to shut down the hw to do so.

Admittedly it was intentional when I write it, but it never really
worked. I think it might have even updated these color registers on each
frame.

>=20
>=20
>> Instead do a full modeset if the primary plane changes formats. It's
>> just as rare as an actual mode change, so there will be no performance=

>> penalty.
>>
>> The patch also replaces a reference to drm_crtc_state.allow_modeset wi=
th
>> the correct call to drm_atomic_crtc_needs_modeset().
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 4961eb60f145 ("drm/ast: Enable atomic modesetting")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Emil Velikov <emil.l.velikov@gmail.com>
>> Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>
>> Cc: <stable@vger.kernel.org> # v5.6+
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 23 ++++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 154cd877d9d1..3680a000b812 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -527,8 +527,8 @@ static const uint32_t ast_primary_plane_formats[] =
=3D {
>>  static int ast_primary_plane_helper_atomic_check(struct drm_plane *pl=
ane,
>>  						 struct drm_plane_state *state)
>>  {
>> -	struct drm_crtc_state *crtc_state;
>> -	struct ast_crtc_state *ast_crtc_state;
>> +	struct drm_crtc_state *crtc_state, *old_crtc_state;
>> +	struct ast_crtc_state *ast_crtc_state, *old_ast_crtc_state;
>>  	int ret;
>> =20
>>  	if (!state->crtc)
>> @@ -550,6 +550,15 @@ static int ast_primary_plane_helper_atomic_check(=
struct drm_plane *plane,
>> =20
>>  	ast_crtc_state->format =3D state->fb->format;
>> =20
>> +	old_crtc_state =3D drm_atomic_get_old_crtc_state(state->state, state=
->crtc);
>> +	if (!old_crtc_state)
>> +		return 0;
>> +	old_ast_crtc_state =3D to_ast_crtc_state(old_crtc_state);
>> +	if (!old_ast_crtc_state)
>=20
> The above two if checks should never fail, I'd wrap them in a WARN_ON.

Really? But what's the old state when the first mode is being programmed?=


>=20
>> +		return 0;
>> +	if (ast_crtc_state->format !=3D old_ast_crtc_state->format)
>> +		crtc_state->mode_changed =3D true;
>> +
>>  	return 0;
>>  }
>> =20
>> @@ -775,18 +784,18 @@ static void ast_crtc_helper_atomic_flush(struct =
drm_crtc *crtc,
>> =20
>>  	ast_state =3D to_ast_crtc_state(crtc->state);
>> =20
>> -	format =3D ast_state->format;
>> -	if (!format)
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>>  		return;
>> =20
>> +	format =3D ast_state->format;
>> +	if (drm_WARN_ON_ONCE(dev, !format))
>> +		return; /* BUG: We didn't set format in primary check(). */
>=20
> Hm that entire ast_state->format machinery looks kinda strange, can't y=
ou
> just look up the primary plane state everywhere and that's it?
> drm_framebuffer are fully invariant and refcounted to the state, so the=
re
> really shouldn't be any need to copy format around.

ast_state->format is the format that has to be programmed in
atomic_flush(). If it's NULL, the current format was used. Updating the
primary plane's format also requires the vbios info, which depends on
CRTC state. So it's collected in the CRTC's atomic_check().

It felt natural to use the various atomic_check() functions to collect
and store and store away these structures, and later use them in
atomic_flush().

I'd prefer to keep the current design. It's the one that worked best
while writing the atomic-modesetting support for ast.

Best regard
Thomas

>=20
> But that's maybe for a next patch. With the commit message clarified th=
at
> everything works as designed, and maybe the two WARN_ON added:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> +
>>  	vbios_mode_info =3D &ast_state->vbios_mode_info;
>> =20
>>  	ast_set_color_reg(ast, format);
>>  	ast_set_vbios_color_reg(ast, format, vbios_mode_info);
>> =20
>> -	if (!crtc->state->mode_changed)
>> -		return;
>> -
>>  	adjusted_mode =3D &crtc->state->adjusted_mode;
>> =20
>>  	ast_set_vbios_mode_reg(ast, adjusted_mode, vbios_mode_info);
>> --=20
>> 2.27.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--g0fikKUUyV1yl0ce5bgH3lBmGcTG93ywI--

--dKorrhmu4IyqY5vo6cPS0bOF752rVEhyK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8euXYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiM96Af+Kz854zR9o3aAzG8U/PWfY6VAv+qc
B6Ix0FiDF0J1jeMs4EM5liJV3xYfCaAOiIJ4uMI4RSMdK3fh9/WYhHb7bTVk9wKZ
vTWw2yWM38bQ3sUUMYty6LOVkRuJeZ+s/FT7hQ8SA4wtk6Mz7q0wt93i5B3eLCJm
lhfMX/FTkd8zhLbd9dHLMWwcSyYNon+oaSX/zzXCDrvUZ30nH8NmNxH8YxNjr+Xr
RRGu3jwC9CZjXfrizBVB1fEoxVaqYHzDIZAlaHAiE6nskUiV9EKqQ2ITgTsEHDBj
yENLSbfjCykgNod4aicOgEn5+bMcYF0TY3aaqm4B5FO79FVpPwvoRZZLIQ==
=RsKO
-----END PGP SIGNATURE-----

--dKorrhmu4IyqY5vo6cPS0bOF752rVEhyK--

--===============1786079488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1786079488==--
