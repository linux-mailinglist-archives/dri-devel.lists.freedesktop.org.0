Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45688276EB3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 12:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873F26E1BB;
	Thu, 24 Sep 2020 10:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196B26E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 10:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6365ACC6;
 Thu, 24 Sep 2020 10:28:18 +0000 (UTC)
Subject: Re: [PATCH] drm/ast: Reload gamma LUT after changing primary plane's
 color format
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200922144655.23624-1-tzimmermann@suse.de>
 <20200923153017.GR438822@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0cc79212-1b45-135b-3a7b-e872c8efaf69@suse.de>
Date: Thu, 24 Sep 2020 12:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923153017.GR438822@phenom.ffwll.local>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============2010859360=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2010859360==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4cddwez388lYGimaf3XOYuIYdwcC3WqLd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4cddwez388lYGimaf3XOYuIYdwcC3WqLd
Content-Type: multipart/mixed; boundary="5r7R1LcnlWksI5uNHPLlp8GnUDj3cBMHC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <0cc79212-1b45-135b-3a7b-e872c8efaf69@suse.de>
Subject: Re: [PATCH] drm/ast: Reload gamma LUT after changing primary plane's
 color format
References: <20200922144655.23624-1-tzimmermann@suse.de>
 <20200923153017.GR438822@phenom.ffwll.local>
In-Reply-To: <20200923153017.GR438822@phenom.ffwll.local>

--5r7R1LcnlWksI5uNHPLlp8GnUDj3cBMHC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.09.20 um 17:30 schrieb Daniel Vetter:
> On Tue, Sep 22, 2020 at 04:46:55PM +0200, Thomas Zimmermann wrote:
>> The gamma LUT has to be reloaded after changing the primary plane's
>> color format. This used to be done implicitly by the CRTC atomic_enabl=
e()
>> helper after updating the primary plane. With the recent reordering of=

>> the steps, the primary plane's setup was moved last and invalidated
>> the gamma LUT. Fix this by setting the LUT from within atomic_flush().=

>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 2f0ddd89fe32 ("drm/ast: Enable CRTC before planes")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>=20
> Does what it says in the commit message, and makes sense.
>=20
> Maybe add a comment to the load_lut function or where it's called stati=
ng
> that this must be done after every plane color change, seems like an
> important piece of information to carry around in the code itself and n=
ot
> just in the commit message.

I'll do that before committing the patch.

>=20
> Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks

Best regards
Thomas

>=20
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 834a156e3a75..ba3bf76e104d 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -742,7 +742,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, i=
nt mode)
>>  	case DRM_MODE_DPMS_SUSPEND:
>>  		if (ast->tx_chip_type =3D=3D AST_TX_DP501)
>>  			ast_set_dp501_video_output(crtc->dev, 1);
>> -		ast_crtc_load_lut(ast, crtc);
>>  		break;
>>  	case DRM_MODE_DPMS_OFF:
>>  		if (ast->tx_chip_type =3D=3D AST_TX_DP501)
>> @@ -777,6 +776,17 @@ static int ast_crtc_helper_atomic_check(struct dr=
m_crtc *crtc,
>>  	return 0;
>>  }
>> =20
>> +static void
>> +ast_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_s=
tate *old_crtc_state)
>> +{
>> +	struct ast_private *ast =3D to_ast_private(crtc->dev);
>> +	struct ast_crtc_state *ast_crtc_state =3D to_ast_crtc_state(crtc->st=
ate);
>> +	struct ast_crtc_state *old_ast_crtc_state =3D to_ast_crtc_state(old_=
crtc_state);
>> +
>> +	if (old_ast_crtc_state->format !=3D ast_crtc_state->format)
>> +		ast_crtc_load_lut(ast, crtc);
>> +}
>> +
>>  static void
>>  ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>  			      struct drm_crtc_state *old_crtc_state)
>> @@ -830,6 +840,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *cr=
tc,
>> =20
>>  static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs =3D {=

>>  	.atomic_check =3D ast_crtc_helper_atomic_check,
>> +	.atomic_flush =3D ast_crtc_helper_atomic_flush,
>>  	.atomic_enable =3D ast_crtc_helper_atomic_enable,
>>  	.atomic_disable =3D ast_crtc_helper_atomic_disable,
>>  };
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--5r7R1LcnlWksI5uNHPLlp8GnUDj3cBMHC--

--4cddwez388lYGimaf3XOYuIYdwcC3WqLd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9sdJUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOOXgf/difMOu6y4OoNEfRwlWhKjE11t0+5
980DltJzLpPCzEO0aggyBrrf2gmFzIB81Z5/AQLainUPleN1+octnT4Ai9IUzBsb
+lpu0MppWNxnZTjc0zatl/YEnElcLF5bpKqhi5yHh3GyPA1CSHkY01hw5E8SMWr9
GRyul+wGVd8guO+VtVInlbwyVUnG+pdTcTWX9LtJTcdv8T0rWRVSMJJAtKRpBVTB
YHKMAg6sFSwFcd+PtJKN/6knT8frIQpZHIRBUbRHjjBcEenE85N9znH3X6A75iAC
aS0zTsJp/csKp6dzjwlFb5f8cZ3rEEyNsZnvVjuHzN5MTdmb1Jg4MdUzGA==
=hcLi
-----END PGP SIGNATURE-----

--4cddwez388lYGimaf3XOYuIYdwcC3WqLd--

--===============2010859360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2010859360==--
