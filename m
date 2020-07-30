Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FBE232F6F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7B96E027;
	Thu, 30 Jul 2020 09:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C5B6E027
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:23:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 950F7AD5D;
 Thu, 30 Jul 2020 09:23:32 +0000 (UTC)
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
 <20200728180649.GD1114934@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <abebcb6c-8765-1996-6e44-f384e5d7c281@suse.de>
Date: Thu, 30 Jul 2020 11:23:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728180649.GD1114934@ravnborg.org>
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
Cc: airlied@redhat.com, emil.l.velikov@gmail.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1214096435=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1214096435==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vv1EqkeuJzWAZDXq31EmbNuJRSB6rySGd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vv1EqkeuJzWAZDXq31EmbNuJRSB6rySGd
Content-Type: multipart/mixed; boundary="hrvLLEK7XCwBBaLfZI6CFDOQSA2BxbzML";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Message-ID: <abebcb6c-8765-1996-6e44-f384e5d7c281@suse.de>
Subject: Re: [PATCH 04/13] drm/ast: Managed release of I2C adapter
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-5-tzimmermann@suse.de>
 <20200728180649.GD1114934@ravnborg.org>
In-Reply-To: <20200728180649.GD1114934@ravnborg.org>

--hrvLLEK7XCwBBaLfZI6CFDOQSA2BxbzML
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.20 um 20:06 schrieb Sam Ravnborg:
> On Tue, Jul 28, 2020 at 09:44:16AM +0200, Thomas Zimmermann wrote:
>> Managed releases of the device's I2C adapter simplify the connector's
>> release.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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
> The intro of ast_i2c_fini() and then removal again confuses me a little=
=2E
> But end result looks simple so I guess thats what counts.

The intention was to separate _fini from _destroy and make the patch
series more readable. But looking at it now, this idea did not really
work. I guess, I'll drop _fini.

Best regards
Thomas

>=20
> 	Sam
>=20
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
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
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


--hrvLLEK7XCwBBaLfZI6CFDOQSA2BxbzML--

--vv1EqkeuJzWAZDXq31EmbNuJRSB6rySGd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ikYcUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMbHgf/ac4Sqw99lHUA3HZVLIX1SCguVGpI
HPh0ZP2eaqRaV5TPbaObWVuAHJIGsgehCW3+4+5RYPTdmAKU9NAjgxaU6Pu+m7CG
JLIY0O5XFLTr/+Do37EllfLA7sigujdPHuo3i0r3QKIvypTI7bPPKro7Ap7a8WkE
AHm7FmErj9OHUovDVmCpI/r1Pt9xk3qg7/F1vzDVvYGjbKBkS6SAxltXQgyP1nIQ
ZJulKo1OYPNAj+bya52XfGB5t9AdQUX9zoGPp6ypLxpwZh4X7rSV775jeckoSMb0
CrXsHT2W17V9y+rEZnQi/x7t2DXgiJI94hT5DmLOFkjrpczdE8A/Rs7GUQ==
=msdY
-----END PGP SIGNATURE-----

--vv1EqkeuJzWAZDXq31EmbNuJRSB6rySGd--

--===============1214096435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1214096435==--
