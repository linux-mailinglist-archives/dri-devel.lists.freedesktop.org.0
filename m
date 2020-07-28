Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3666D230695
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 11:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C956E222;
	Tue, 28 Jul 2020 09:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117E6E222
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:32:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B8F8AF19;
 Tue, 28 Jul 2020 09:32:18 +0000 (UTC)
Subject: Re: [PATCH 11/13] drm/ast: Managed release of ast firmware
To: daniel@ffwll.ch
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-12-tzimmermann@suse.de>
 <20200728091711.GB6419@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9105824f-2d8c-e234-510b-e2da7d7d1ace@suse.de>
Date: Tue, 28 Jul 2020 11:32:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728091711.GB6419@phenom.ffwll.local>
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
Cc: sam@ravnborg.org, airlied@redhat.com, emil.l.velikov@gmail.com,
 kraxel@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0572380836=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0572380836==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7O5hBYN40o7dDjexdoFOHH9AfXLPxjDft"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7O5hBYN40o7dDjexdoFOHH9AfXLPxjDft
Content-Type: multipart/mixed; boundary="tGMyVCfp84Vk7fippE5jdtz8F8K7n5h3G";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Message-ID: <9105824f-2d8c-e234-510b-e2da7d7d1ace@suse.de>
Subject: Re: [PATCH 11/13] drm/ast: Managed release of ast firmware
References: <20200728074425.2749-1-tzimmermann@suse.de>
 <20200728074425.2749-12-tzimmermann@suse.de>
 <20200728091711.GB6419@phenom.ffwll.local>
In-Reply-To: <20200728091711.GB6419@phenom.ffwll.local>

--tGMyVCfp84Vk7fippE5jdtz8F8K7n5h3G
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.20 um 11:17 schrieb daniel@ffwll.ch:
> On Tue, Jul 28, 2020 at 09:44:23AM +0200, Thomas Zimmermann wrote:
>> The ast driver loads firmware for the DP501 display encoder. The
>> patch replaces the removal code with a managed release function.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Hm a devm_request_firmware which does exactly this would be nice I thin=
k.
> Maybe as a follow-up refactor?

There are so many ideas for follow-up patches wrt. devres and drmres, we
should add a todo item to collect them. Especially, devres is much more
over head in terms of reviews and kernel building/testing tha tit makes
sense to collect ideas and address them in larger chunks.

Best regards
Thomas

> -Daniel
>=20
>> ---
>>  drivers/gpu/drm/ast/ast_dp501.c | 23 ++++++++++++++---------
>>  drivers/gpu/drm/ast/ast_drv.h   |  1 -
>>  drivers/gpu/drm/ast/ast_main.c  |  3 ---
>>  3 files changed, 14 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c b/drivers/gpu/drm/ast/ast=
_dp501.c
>> index 4b85a504825a..88121c0e0d05 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -8,11 +8,24 @@
>> =20
>>  MODULE_FIRMWARE("ast_dp501_fw.bin");
>> =20
>> +static void ast_release_firmware(void *data)
>> +{
>> +	struct ast_private *ast =3D data;
>> +
>> +	release_firmware(ast->dp501_fw);
>> +	ast->dp501_fw =3D NULL;
>> +}
>> +
>>  static int ast_load_dp501_microcode(struct drm_device *dev)
>>  {
>>  	struct ast_private *ast =3D to_ast_private(dev);
>> +	int ret;
>> +
>> +	ret =3D request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->de=
v);
>> +	if (ret)
>> +		return ret;
>> =20
>> -	return request_firmware(&ast->dp501_fw, "ast_dp501_fw.bin", dev->dev=
);
>> +	return devm_add_action_or_reset(dev->dev, ast_release_firmware, ast)=
;
>>  }
>> =20
>>  static void send_ack(struct ast_private *ast)
>> @@ -435,11 +448,3 @@ void ast_init_3rdtx(struct drm_device *dev)
>>  		}
>>  	}
>>  }
>> -
>> -void ast_release_firmware(struct drm_device *dev)
>> -{
>> -	struct ast_private *ast =3D to_ast_private(dev);
>> -
>> -	release_firmware(ast->dp501_fw);
>> -	ast->dp501_fw =3D NULL;
>> -}
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_d=
rv.h
>> index 86c9a7ac712b..02908d005b99 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -312,7 +312,6 @@ bool ast_backup_fw(struct drm_device *dev, u8 *add=
r, u32 size);
>>  bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>>  u8 ast_get_dp501_max_clk(struct drm_device *dev);
>>  void ast_init_3rdtx(struct drm_device *dev);
>> -void ast_release_firmware(struct drm_device *dev);
>> =20
>>  /* ast_cursor.c */
>>  int ast_cursor_init(struct ast_private *ast);
>> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_=
main.c
>> index 792fb7f616ec..e3b7748335a3 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -442,11 +442,8 @@ struct ast_private *ast_device_create(struct drm_=
driver *drv,
>> =20
>>  void ast_device_destroy(struct ast_private *ast)
>>  {
>> -	struct drm_device *dev =3D &ast->base;
>> -
>>  	/* enable standard VGA decode */
>>  	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa1, 0x04);
>> =20
>> -	ast_release_firmware(dev);
>>  	kfree(ast->dp501_fw_addr);
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


--tGMyVCfp84Vk7fippE5jdtz8F8K7n5h3G--

--7O5hBYN40o7dDjexdoFOHH9AfXLPxjDft
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8f8JQUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP9/AgAwJVewGjJyUl7CJmPICrQYDM+Mhfw
FrRCzG/XTpYGRyqjRz9FAUhhPTMPmt+78SpC6AKfevzr2VKVdMeWzoYE6tZ0BIdr
OWxd2Gd+wAgzfNb6JLJ6TFE5lDYoMGIFDzg4gqIG/jjpRlAjKNrcyDlOSv/bnlyJ
c18d5/moTaRdvJwVojejtUKBbjEF5uSxSDEQIz5t0b7cFKuqUbuV58CoTF9QSBCT
Cq30l2lBrt3/tARbxR3ljtRBmpU+UgpamQtlMtXIC7aatAszLUli5k9hE/XLzY26
e8DSVdO1/I0KfHD0lJGLqzEH92c0UuKwoS+2YqKR50h8uc6lvIMQshLNVg==
=X9Rk
-----END PGP SIGNATURE-----

--7O5hBYN40o7dDjexdoFOHH9AfXLPxjDft--

--===============0572380836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0572380836==--
