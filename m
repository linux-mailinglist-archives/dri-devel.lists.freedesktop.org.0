Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B0339AA97
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 20:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7C96E20B;
	Thu,  3 Jun 2021 18:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62EA6E20B;
 Thu,  3 Jun 2021 18:59:41 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E2D6A1FD4E;
 Thu,  3 Jun 2021 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622746779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP2ht9JfvwAY2+qiKvvLRo0I8aKX913pR/SrqUc8228=;
 b=KobfTakCYdMbzfLCuJXJ48muWhAazbTSg6mkuM9stDvxXP9uiFpb0FhQaly7eAGdBrxSHH
 B6nZ/4u7565J+Q+GJepOxPKE+9qDbc5YhgaDtvJo7nUGj9yH1TxMr/eephBh4SOyUY71ZU
 6OqlP4osG9pgfsD/ha1qAXdFHCm+0NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622746779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP2ht9JfvwAY2+qiKvvLRo0I8aKX913pR/SrqUc8228=;
 b=2ovMe8aWeYsPwLYKCAKH/13Av94TdYuOktcl1mxL2KsDoPoG1o9wXjLqHezMcTMWXQ1l62
 oEJdHuZLU0G3zUBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ACC90118DD;
 Thu,  3 Jun 2021 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622746779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP2ht9JfvwAY2+qiKvvLRo0I8aKX913pR/SrqUc8228=;
 b=KobfTakCYdMbzfLCuJXJ48muWhAazbTSg6mkuM9stDvxXP9uiFpb0FhQaly7eAGdBrxSHH
 B6nZ/4u7565J+Q+GJepOxPKE+9qDbc5YhgaDtvJo7nUGj9yH1TxMr/eephBh4SOyUY71ZU
 6OqlP4osG9pgfsD/ha1qAXdFHCm+0NI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622746779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NP2ht9JfvwAY2+qiKvvLRo0I8aKX913pR/SrqUc8228=;
 b=2ovMe8aWeYsPwLYKCAKH/13Av94TdYuOktcl1mxL2KsDoPoG1o9wXjLqHezMcTMWXQ1l62
 oEJdHuZLU0G3zUBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0HSiKJsmuWDzOAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Jun 2021 18:59:39 +0000
Subject: Re: [PATCH v2 3/4] drm/shmem-helper: Align to page size in dumb_create
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-4-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <180c7e54-6c34-f788-d84e-775d52766fb2@suse.de>
Date: Thu, 3 Jun 2021 20:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210603150326.1326658-4-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rPoUXTXes9xYpOvfQwHZLJA30zroDD0IE"
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rPoUXTXes9xYpOvfQwHZLJA30zroDD0IE
Content-Type: multipart/mixed; boundary="NUhNlk1ULcdScEifqDHmzwkfHKWAna4eR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <180c7e54-6c34-f788-d84e-775d52766fb2@suse.de>
Subject: Re: [PATCH v2 3/4] drm/shmem-helper: Align to page size in
 dumb_create
References: <20210603150326.1326658-1-daniel.vetter@ffwll.ch>
 <20210603150326.1326658-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20210603150326.1326658-4-daniel.vetter@ffwll.ch>

--NUhNlk1ULcdScEifqDHmzwkfHKWAna4eR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.06.21 um 17:03 schrieb Daniel Vetter:
> shmem helpers seem a bit sloppy here by automatically rounding up when
> actually creating the buffer, which results in under-reporting of what
> we actually have. Caught by igt/vgem_basic tests.
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 32f1d7601ec6..2985744b4300 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -506,13 +506,13 @@ int drm_gem_shmem_dumb_create(struct drm_file *fi=
le, struct drm_device *dev,
>  =20
>   	if (!args->pitch || !args->size) {
>   		args->pitch =3D min_pitch;
> -		args->size =3D args->pitch * args->height;
> +		args->size =3D PAGE_ALIGN(args->pitch * args->height);
>   	} else {
>   		/* ensure sane minimum values */
>   		if (args->pitch < min_pitch)
>   			args->pitch =3D min_pitch;
>   		if (args->size < args->pitch * args->height)
> -			args->size =3D args->pitch * args->height;
> +			args->size =3D PAGE_ALIGN(args->pitch * args->height);
>   	}
>  =20
>   	shmem =3D drm_gem_shmem_create_with_handle(file, dev, args->size, &a=
rgs->handle);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--NUhNlk1ULcdScEifqDHmzwkfHKWAna4eR--

--rPoUXTXes9xYpOvfQwHZLJA30zroDD0IE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmC5JpsFAwAAAAAACgkQlh/E3EQov+Bl
pQ//V7si0UegCEM33trllmr9YRDf1JXbn6QvzFqDobYE+nPbhiui2VNPm5z+dP9Np6Gj0TN8AbBV
t/s8Q6dLvBCn65tsRoArnda5THkVTaQMV9+P2aLhXnMlNx4EjUQ8HRWdVAsK2DVCUXdzfYvK+7kC
hugQmstnqU5xp8LhQuLbwJpl9LDwma7LixZLjLYExAK3dbpdb5kJkdhcwL5b9Kc1CrEK8z2AiD4P
H6EiGqpiV/nCT6Fjhd8nmSFK2tCilJAhkMFPYVS2N9IBgCm7wCssyKhvvbDEjokoncy/nVU+vS8t
+wguswtdxNYODBESjYhZrfVorTR7pQNudCntkKTERSmGyCs3Ch6bzXybNk6xf4DbZy3Qew07nP2Z
Ec4Uu5BvqKn8Swe3OxlZH4UMXdGyc5ipLWV3bfG3LH4soHvFlfuQHkiPNXnwjE6bgClVlgH5XEjt
bPJ5kFcIt5ERyCA9jNdU+SOGeDs0pheZMtgjE/WD3RwQonf0sDZgagXXzd/xe/oy1Lb6c9xiN+l6
2rzRnmbffkP+Gh960T7kqHN6TMmnyNPSRJWyG+OlqZglx6zTXwc1GSW5wd/E/YuqP6ZDHqk2rkki
nhRzF1j1/6x5+S8RQx18APtKYmL54K/2mD1l+T31Bon50IJvZfBUcpGal16tPaGKeAqi/SA+DVpy
tls=
=JGzT
-----END PGP SIGNATURE-----

--rPoUXTXes9xYpOvfQwHZLJA30zroDD0IE--
