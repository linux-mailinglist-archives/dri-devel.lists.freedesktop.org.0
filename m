Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B619232F66
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308986E15E;
	Thu, 30 Jul 2020 09:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388C36E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:19:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2DEF1AD5D;
 Thu, 30 Jul 2020 09:20:05 +0000 (UTC)
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
To: daniel@ffwll.ch
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
 <20200728092337.GD6419@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d0f92d24-d995-26d0-ec60-1a41ec1433da@suse.de>
Date: Thu, 30 Jul 2020 11:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728092337.GD6419@phenom.ffwll.local>
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
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============2079595237=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2079595237==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xjzp45G9tr2U2gmUjaYXCI3YjS4bjq8np"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Xjzp45G9tr2U2gmUjaYXCI3YjS4bjq8np
Content-Type: multipart/mixed; boundary="C6COSrZ1MrqQjQiOw21BZmGlRoqPeBmA5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Cc: airlied@redhat.com, sam@ravnborg.org, emil.l.velikov@gmail.com,
 kraxel@redhat.com, yc_chen@aspeedtech.com, dri-devel@lists.freedesktop.org
Message-ID: <d0f92d24-d995-26d0-ec60-1a41ec1433da@suse.de>
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
 <20200728092337.GD6419@phenom.ffwll.local>
In-Reply-To: <20200728092337.GD6419@phenom.ffwll.local>

--C6COSrZ1MrqQjQiOw21BZmGlRoqPeBmA5
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.20 um 11:23 schrieb daniel@ffwll.ch:
> On Tue, Jul 28, 2020 at 09:44:16AM +0200, Thomas Zimmermann wrote:
>> Managed releases of the device's I2C adapter simplify the connector's
>> release.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I think this breaks bisect, since at this point the release callback is=

> called when the connector is already gone. At the end of the series it'=
s
> fine again though.

I'll move the auto-release of I2C to the end of the series. It should
work then.

Best regards
Thomas

>=20
> I've done a very cursory reading of your series to look for high-level
> issues, I think overall reasonable. On the series:
>=20
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
> But maybe you want to polish a bit more, up to you.
> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 21 ++++++++++-----------
>>  1 file changed, 10 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index f421a60d8a96..27eb49bd12b3 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -39,6 +39,7 @@
>>  #include <drm/drm_fourcc.h>
>>  #include <drm/drm_gem_framebuffer_helper.h>
>>  #include <drm/drm_gem_vram_helper.h>
>> +#include <drm/drm_managed.h>
>>  #include <drm/drm_plane_helper.h>
>>  #include <drm/drm_probe_helper.h>
>>  #include <drm/drm_simple_kms_helper.h>
>> @@ -591,6 +592,14 @@ static void ast_i2c_setsda(void *i2c_priv, int da=
ta)
>>  	}
>>  }
>> =20
>> +static void ast_i2c_release(struct drm_device *dev, void *data)
>> +{
>> +	struct ast_i2c_chan *i2c =3D data;
>> +
>> +	i2c_del_adapter(&i2c->adapter);
>> +	i2c->dev =3D NULL; /* clear to signal absence of I2C support */
>> +}
>> +
>>  static int ast_i2c_init(struct ast_i2c_chan *i2c, struct drm_device *=
dev)
>>  {
>>  	int ret;
>> @@ -618,7 +627,7 @@ static int ast_i2c_init(struct ast_i2c_chan *i2c, =
struct drm_device *dev)
>> =20
>>  	i2c->dev =3D dev; /* signals presence of I2C support */
>> =20
>> -	return 0;
>> +	return drmm_add_action_or_reset(dev, ast_i2c_release, i2c);
>>  }
>> =20
>>  static bool ast_i2c_is_initialized(struct ast_i2c_chan *i2c)
>> @@ -626,14 +635,6 @@ static bool ast_i2c_is_initialized(struct ast_i2c=
_chan *i2c)
>>  	return !!i2c->dev;
>>  }
>> =20
>> -static void ast_i2c_fini(struct ast_i2c_chan *i2c)
>> -{
>> -	if (!ast_i2c_is_initialized(i2c))
>> -		return;
>> -	i2c_del_adapter(&i2c->adapter);
>> -	i2c->dev =3D NULL; /* clear to signal absence of I2C support */
>> -}
>> -
>>  /*
>>   * Primary plane
>>   */
>> @@ -1139,8 +1140,6 @@ static enum drm_mode_status ast_mode_valid(struc=
t drm_connector *connector,
>> =20
>>  static void ast_connector_destroy(struct drm_connector *connector)
>>  {
>> -	struct ast_connector *ast_connector =3D to_ast_connector(connector);=

>> -	ast_i2c_fini(&ast_connector->i2c);
>>  	drm_connector_cleanup(connector);
>>  	kfree(connector);
>>  }
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


--C6COSrZ1MrqQjQiOw21BZmGlRoqPeBmA5--

--Xjzp45G9tr2U2gmUjaYXCI3YjS4bjq8np
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ikLgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNixwgAvGnR3zjZRi2kfBLlDRh7jihilPN1
AM9SeA+DEyPAWZNmVSJsNjOBwmJjRe8P+mE1M3DZkZynV2XFsBIn6iPb5ek99GKC
zq6W8g4epvwa5vj/JeR48B9oGBiGIqr2Dt5Rm7GnC5ZACzoLqJzjx3wvbCHBaK7U
42QPTb+zOsjsYQ/b6gXkTdgGG2iBge44TesK82DmMOICbtEl5m8Ez8PWw9NhmdRk
/8heX4txrkDV0WQ6LS96G+kcucaaiQBaKAgCtv7pPnF4ATKNWD2/vtKBrUkKwpYM
1eT20YoZKU7Zj7DVHT4aKoDYdYbbty3I9M7NrDpe2WeiRagK1VxG0etpXg==
=zokg
-----END PGP SIGNATURE-----

--Xjzp45G9tr2U2gmUjaYXCI3YjS4bjq8np--

--===============2079595237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2079595237==--
