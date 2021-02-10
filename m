Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F26D31618A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59166EC2C;
	Wed, 10 Feb 2021 08:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEB06EC2C;
 Wed, 10 Feb 2021 08:55:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1EBBB165;
 Wed, 10 Feb 2021 08:55:45 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9c290abd-7770-e386-76a4-c821ab33752b@suse.de>
Date: Wed, 10 Feb 2021 09:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210083338.100068-1-khaled.almahallawy@intel.com>
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
Cc: seanpaul@chromium.org
Content-Type: multipart/mixed; boundary="===============1969664607=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1969664607==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DVUc5GaGOYlYOAmMaDETCDrK0K4Sei0EM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DVUc5GaGOYlYOAmMaDETCDrK0K4Sei0EM
Content-Type: multipart/mixed; boundary="77wenKwGYsHoCDRXXlCsZ8mlzhQyLnICv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: seanpaul@chromium.org
Message-ID: <9c290abd-7770-e386-76a4-c821ab33752b@suse.de>
Subject: Re: [RFC PATCH 1/2] drm/dp: Make number of AUX retries configurable
 by display drivers.
References: <20210210083338.100068-1-khaled.almahallawy@intel.com>
In-Reply-To: <20210210083338.100068-1-khaled.almahallawy@intel.com>

--77wenKwGYsHoCDRXXlCsZ8mlzhQyLnICv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.02.21 um 09:33 schrieb Khaled Almahallawy:
> The number of AUX retries specified in the DP specs is 7. Currently, to=
 make Dell 4k monitors happier, the number of retries are 32.
> i915 also retries 5 times (intel_dp_aux_xfer) which means in the case o=
f AUX timeout we actually retries 32 * 5 =3D 160 times.
>=20
> So making the number of aux retires a variable to allow for fine tuning=
 and optimization of aux timing.
>=20
> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>   drivers/gpu/drm/drm_dp_helper.c | 10 +++-------
>   include/drm/drm_dp_helper.h     |  1 +
>   2 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_h=
elper.c
> index eedbb48815b7..8fdf57b4a06c 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -249,13 +249,7 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *a=
ux, u8 request,
>  =20
>   	mutex_lock(&aux->hw_mutex);
>  =20
> -	/*
> -	 * The specification doesn't give any recommendation on how often to
> -	 * retry native transactions. We used to retry 7 times like for
> -	 * aux i2c transactions but real world devices this wasn't
> -	 * sufficient, bump to 32 which makes Dell 4k monitors happier.
> -	 */
> -	for (retry =3D 0; retry < 32; retry++) {
> +	for (retry =3D 0; retry < aux->num_retries; retry++) {
>   		if (ret !=3D 0 && ret !=3D -ETIMEDOUT) {
>   			usleep_range(AUX_RETRY_INTERVAL,
>   				     AUX_RETRY_INTERVAL + 100);
> @@ -1744,6 +1738,8 @@ void drm_dp_aux_init(struct drm_dp_aux *aux)
>   	aux->ddc.retries =3D 3;
>  =20
>   	aux->ddc.lock_ops =3D &drm_dp_i2c_lock_ops;
> +	/*Still making the Dell 4k monitors happier*/

The original comment was helpful; this one isn't.

Besides that, what problem does this patchset address? Too much probing? =

If I connect a Dell monitor to an Intel card, how often does it have to=20
probe?

Best regards
Thomas

> +	aux->num_retries =3D 32;
>   }
>   EXPORT_SYMBOL(drm_dp_aux_init);
>  =20
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index edffd1dcca3e..16cbfc8f5e66 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1876,6 +1876,7 @@ struct drm_dp_aux {
>   	struct mutex hw_mutex;
>   	struct work_struct crc_work;
>   	u8 crc_count;
> +	int num_retries;
>   	ssize_t (*transfer)(struct drm_dp_aux *aux,
>   			    struct drm_dp_aux_msg *msg);
>   	/**
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--77wenKwGYsHoCDRXXlCsZ8mlzhQyLnICv--

--DVUc5GaGOYlYOAmMaDETCDrK0K4Sei0EM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAjn4wFAwAAAAAACgkQlh/E3EQov+BZ
sA/+OfoYRMJV3GXwS1EFX3pmZejo09AybPdejQHEiI5T+pByfFMeBzBzD3UURsEpfdQ59oKbln0u
Oc4oQTsV6jycLx6CsvUb35+MJYEdheRa8S8iym9F7sdiwbKdlo7HpXLHtGdUmIILqQ3gIZ/I93rr
ZvvQuOcMj4imKyxB4iJn7jVIG8gzb30/85cFgUde8KBJhWQb3affliFUB2LjRvL1ga+wDSIOSsmw
uwiBILIntPdD/iewCvc6pNOuHgBe7AA1X1QxpG1l5M+QXCYQFfxg4dG4gdNGYrSRnEXPQGG8g6kn
zHDnmy7UqDkDswhVKDHrlMzyE2QmNPp+BxSWvJ8HZ77jchmFlZ4eTrnFfO9+M1NN334kYMK9i0tf
R0Av6Q64Q0Be01ubOgPm9Iud8d+muCSd5FCOMnkZltttx6voEzbVGUnZR/F6FlPXBVNZdVIcJhdI
cbilzrxz5CQZiGZsCxvJ2DWcmuu3u+DCWff9ocQgcoUXORXA9fyAFX12BrfZoQchADzZrCefZR8a
vCLM2fi2V7BddOkcX2ypjjjRu759vNgYouF+I37e/yPHPZ7ENkJvK8QQ09M7smvqbc/KBPvygUEy
dmcTObD+Lm3OFn8wQ3AWvzYAjpYyI32CdQE/odmVvyQHnhpABdaBfZXp5Kqguwo3I1tItEX9+TFm
6/Q=
=fc2S
-----END PGP SIGNATURE-----

--DVUc5GaGOYlYOAmMaDETCDrK0K4Sei0EM--

--===============1969664607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1969664607==--
