Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A28232F5F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 11:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14C6E157;
	Thu, 30 Jul 2020 09:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D4D6E157
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 09:18:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 148F9AD5D;
 Thu, 30 Jul 2020 09:18:23 +0000 (UTC)
Subject: Re: [PATCH 01/13] drm/ast: Move I2C code within ast_mode.c
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-2-tzimmermann@suse.de>
 <20200728180458.GC1114934@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d6fc5534-d77c-893f-ac62-f283d6685cd5@suse.de>
Date: Thu, 30 Jul 2020 11:18:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728180458.GC1114934@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1669927253=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1669927253==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="S5dY1UuFGIdd30TA0l3nGZDb4xhSeCElF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--S5dY1UuFGIdd30TA0l3nGZDb4xhSeCElF
Content-Type: multipart/mixed; boundary="LW3WGzH9ol86PPCDk3d7GoRqygTgRp7eS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Message-ID: <d6fc5534-d77c-893f-ac62-f283d6685cd5@suse.de>
Subject: Re: [PATCH 01/13] drm/ast: Move I2C code within ast_mode.c
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-2-tzimmermann@suse.de>
 <20200728180458.GC1114934@ravnborg.org>
In-Reply-To: <20200728180458.GC1114934@ravnborg.org>

--LW3WGzH9ol86PPCDk3d7GoRqygTgRp7eS
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.20 um 20:04 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> A few comments related to the code - but not to this patch and
> not to this patch-set.
> But I noticed so here goes.

You're right on these points. But it's worth a separate patchset. I
really just move code around here.

Best regards
Thomas

>=20
> 	Sam
>=20
> On Tue, Jul 28, 2020 at 09:44:13AM +0200, Thomas Zimmermann wrote:
>> The I2C support feels slammed down to the end of ast_mode.c. Improve
>> this by moving the code before it's callers, remove the declarations,
>> rename the callbacks to match I2C's get/set sda/scl convention, and
>> prefix all functions with ast_. No functional changes have been made.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/ast/ast_mode.c | 249 +++++++++++++++++---------------=
-
>>  1 file changed, 125 insertions(+), 124 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_=
mode.c
>> index 154cd877d9d1..19f1dfc8e9e0 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -46,9 +46,6 @@
>>  #include "ast_drv.h"
>>  #include "ast_tables.h"
>> =20
>> -static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>> -static void ast_i2c_destroy(struct ast_i2c_chan *i2c);
>> -
>>  static inline void ast_load_palette_index(struct ast_private *ast,
>>  				     u8 index, u8 red, u8 green,
>>  				     u8 blue)
>> @@ -514,6 +511,131 @@ static void ast_set_start_address_crt1(struct as=
t_private *ast,
>> =20
>>  }
>> =20
>> +/*
>> + * I2C
>> + */
>> +
>> +static int ast_i2c_getscl(void *i2c_priv)
>> +{
>> +	struct ast_i2c_chan *i2c =3D i2c_priv;
>> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> +	uint32_t val, val2, count, pass;
> s/uint32_t/u32
>=20
>> +
>> +	count =3D 0;
>> +	pass =3D 0;
>> +	val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >=
> 4) & 0x01;
> So val is a bool - but anyway an int is used.
>=20
>> +	do {
>> +		val2 =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10)=
 >> 4) & 0x01;
> Likewise for val2.
>=20
>> +		if (val =3D=3D val2) {
>> +			pass++;
>> +		} else {
>> +			pass =3D 0;
>> +			val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10)=
 >> 4) & 0x01;
>> +		}
>> +	} while ((pass < 5) && (count++ < 0x10000));
>> +
>> +	return val & 1 ? 1 : 0;
> bool to int conversion could do the trick here.
>=20
>> +}
>> +
>> +static int ast_i2c_getsda(void *i2c_priv)
>> +{
>> +	struct ast_i2c_chan *i2c =3D i2c_priv;
>> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> +	uint32_t val, val2, count, pass;
>> +
>> +	count =3D 0;
>> +	pass =3D 0;
>> +	val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >=
> 5) & 0x01;
>> +	do {
>> +		val2 =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20)=
 >> 5) & 0x01;
>> +		if (val =3D=3D val2) {
>> +			pass++;
>> +		} else {
>> +			pass =3D 0;
>> +			val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20)=
 >> 5) & 0x01;
>> +		}
>> +	} while ((pass < 5) && (count++ < 0x10000));
>> +
>> +	return val & 1 ? 1 : 0;
>> +}
>> +
>> +static void ast_i2c_setscl(void *i2c_priv, int clock)
>> +{
>> +	struct ast_i2c_chan *i2c =3D i2c_priv;
>> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> +	int i;
>> +	u8 ujcrb7, jtemp;
> And now u8 is used for registers.
> Maybe because ast_get_index_reg_mask() returns uint8_t.
>=20
> So for consistentcy do the uint8_t =3D> u8 etc. conversion first.
>=20
>> +
>> +	for (i =3D 0; i < 0x10000; i++) {
>> +		ujcrb7 =3D ((clock & 0x01) ? 0 : 1);
>> +		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
>> +		jtemp =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01)=
;
>> +		if (ujcrb7 =3D=3D jtemp)
>> +			break;
>> +	}
>> +}
>> +
>> +static void ast_i2c_setsda(void *i2c_priv, int data)
>> +{
>> +	struct ast_i2c_chan *i2c =3D i2c_priv;
>> +	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> +	int i;
>> +	u8 ujcrb7, jtemp;
>> +
>> +	for (i =3D 0; i < 0x10000; i++) {
>> +		ujcrb7 =3D ((data & 0x01) ? 0 : 1) << 2;
>> +		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
>> +		jtemp =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04)=
;
>> +		if (ujcrb7 =3D=3D jtemp)
>> +			break;
>> +	}
>> +}
>> +
>> +static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>> +{
>> +	struct ast_i2c_chan *i2c;
>> +	int ret;
>> +
>> +	i2c =3D kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
>> +	if (!i2c)
>> +		return NULL;
>> +
>> +	i2c->adapter.owner =3D THIS_MODULE;
>> +	i2c->adapter.class =3D I2C_CLASS_DDC;
>> +	i2c->adapter.dev.parent =3D &dev->pdev->dev;
>> +	i2c->dev =3D dev;
>> +	i2c_set_adapdata(&i2c->adapter, i2c);
> If ast_private * was passed here and not i2c.
> Then the implementation of ast_i2c_* could be a tad simpler - no
> upclassing needed.
> And then you could drop the drm_device field.
> (And would need to invent another way to check if i2c is initialized).
>=20
>=20
>> +	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
>> +		 "AST i2c bit bus");
>> +	i2c->adapter.algo_data =3D &i2c->bit;
>> +
>> +	i2c->bit.udelay =3D 20;
>> +	i2c->bit.timeout =3D 2;
>> +	i2c->bit.data =3D i2c;
>> +	i2c->bit.setsda =3D ast_i2c_setsda;
>> +	i2c->bit.setscl =3D ast_i2c_setscl;
>> +	i2c->bit.getsda =3D ast_i2c_getsda;
>> +	i2c->bit.getscl =3D ast_i2c_getscl;
>> +	ret =3D i2c_bit_add_bus(&i2c->adapter);
>> +	if (ret) {
>> +		drm_err(dev, "Failed to register bit i2c\n");
>> +		goto out_free;
>> +	}
>> +
>> +	return i2c;
>> +out_free:
>> +	kfree(i2c);
>> +	return NULL;
>> +}
>> +
>> +static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
>> +{
>> +	if (!i2c)
>> +		return;
>> +	i2c_del_adapter(&i2c->adapter);
>> +	kfree(i2c);
>> +}
>> +
>>  /*
>>   * Primary plane
>>   */
>> @@ -1146,124 +1268,3 @@ int ast_mode_config_init(struct ast_private *a=
st)
>> =20
>>  	return 0;
>>  }
>> -
>> -static int get_clock(void *i2c_priv)
>> -{
>> -	struct ast_i2c_chan *i2c =3D i2c_priv;
>> -	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> -	uint32_t val, val2, count, pass;
>> -
>> -	count =3D 0;
>> -	pass =3D 0;
>> -	val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10) >=
> 4) & 0x01;
>> -	do {
>> -		val2 =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10)=
 >> 4) & 0x01;
>> -		if (val =3D=3D val2) {
>> -			pass++;
>> -		} else {
>> -			pass =3D 0;
>> -			val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x10)=
 >> 4) & 0x01;
>> -		}
>> -	} while ((pass < 5) && (count++ < 0x10000));
>> -
>> -	return val & 1 ? 1 : 0;
>> -}
>> -
>> -static int get_data(void *i2c_priv)
>> -{
>> -	struct ast_i2c_chan *i2c =3D i2c_priv;
>> -	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> -	uint32_t val, val2, count, pass;
>> -
>> -	count =3D 0;
>> -	pass =3D 0;
>> -	val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20) >=
> 5) & 0x01;
>> -	do {
>> -		val2 =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20)=
 >> 5) & 0x01;
>> -		if (val =3D=3D val2) {
>> -			pass++;
>> -		} else {
>> -			pass =3D 0;
>> -			val =3D (ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x20)=
 >> 5) & 0x01;
>> -		}
>> -	} while ((pass < 5) && (count++ < 0x10000));
>> -
>> -	return val & 1 ? 1 : 0;
>> -}
>> -
>> -static void set_clock(void *i2c_priv, int clock)
>> -{
>> -	struct ast_i2c_chan *i2c =3D i2c_priv;
>> -	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> -	int i;
>> -	u8 ujcrb7, jtemp;
>> -
>> -	for (i =3D 0; i < 0x10000; i++) {
>> -		ujcrb7 =3D ((clock & 0x01) ? 0 : 1);
>> -		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf4, ujcrb7);
>> -		jtemp =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x01)=
;
>> -		if (ujcrb7 =3D=3D jtemp)
>> -			break;
>> -	}
>> -}
>> -
>> -static void set_data(void *i2c_priv, int data)
>> -{
>> -	struct ast_i2c_chan *i2c =3D i2c_priv;
>> -	struct ast_private *ast =3D to_ast_private(i2c->dev);
>> -	int i;
>> -	u8 ujcrb7, jtemp;
>> -
>> -	for (i =3D 0; i < 0x10000; i++) {
>> -		ujcrb7 =3D ((data & 0x01) ? 0 : 1) << 2;
>> -		ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0xf1, ujcrb7);
>> -		jtemp =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb7, 0x04)=
;
>> -		if (ujcrb7 =3D=3D jtemp)
>> -			break;
>> -	}
>> -}
>> -
>> -static struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
>> -{
>> -	struct ast_i2c_chan *i2c;
>> -	int ret;
>> -
>> -	i2c =3D kzalloc(sizeof(struct ast_i2c_chan), GFP_KERNEL);
>> -	if (!i2c)
>> -		return NULL;
>> -
>> -	i2c->adapter.owner =3D THIS_MODULE;
>> -	i2c->adapter.class =3D I2C_CLASS_DDC;
>> -	i2c->adapter.dev.parent =3D &dev->pdev->dev;
>> -	i2c->dev =3D dev;
>> -	i2c_set_adapdata(&i2c->adapter, i2c);
>> -	snprintf(i2c->adapter.name, sizeof(i2c->adapter.name),
>> -		 "AST i2c bit bus");
>> -	i2c->adapter.algo_data =3D &i2c->bit;
>> -
>> -	i2c->bit.udelay =3D 20;
>> -	i2c->bit.timeout =3D 2;
>> -	i2c->bit.data =3D i2c;
>> -	i2c->bit.setsda =3D set_data;
>> -	i2c->bit.setscl =3D set_clock;
>> -	i2c->bit.getsda =3D get_data;
>> -	i2c->bit.getscl =3D get_clock;
>> -	ret =3D i2c_bit_add_bus(&i2c->adapter);
>> -	if (ret) {
>> -		drm_err(dev, "Failed to register bit i2c\n");
>> -		goto out_free;
>> -	}
>> -
>> -	return i2c;
>> -out_free:
>> -	kfree(i2c);
>> -	return NULL;
>> -}
>> -
>> -static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
>> -{
>> -	if (!i2c)
>> -		return;
>> -	i2c_del_adapter(&i2c->adapter);
>> -	kfree(i2c);
>> -}
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


--LW3WGzH9ol86PPCDk3d7GoRqygTgRp7eS--

--S5dY1UuFGIdd30TA0l3nGZDb4xhSeCElF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8ikE8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNmhgf/aBniMbOYYojrmHTroDy7VmimJYs9
8PXbWnjLtR7Vz8DeJkHG9NTfgCri+8ePHgC3nweVX+iev3PQgThtuD7GQFLCcOqg
NngLB/QaXNrtWgR8hYocDII+s/8nEw5basBmUg1MqwmQ5Eo383LQeNbkZLPNAGWe
fvW7WPOTrfvR+E0EcT85SQDEkx3Y23LXVwoR1z2/Gkwuf6Bo6xEVYmNfdF/dSY6x
b3RSJ1pkMz6YmhmPFJr0HJuHcxTvvJimoTQFrCzj2nIZnlZdPzxTHfd/Q8gzQsK1
sVwwmU3mD2czY3TllwT6K9ZJFPjkzoaQLhHsD9Fm5A6p7chZY7gMSZX7yg==
=mP81
-----END PGP SIGNATURE-----

--S5dY1UuFGIdd30TA0l3nGZDb4xhSeCElF--

--===============1669927253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1669927253==--
