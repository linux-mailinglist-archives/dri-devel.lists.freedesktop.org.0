Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA17C6758
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 10:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B66C10E437;
	Thu, 12 Oct 2023 08:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name
 [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06DC10E437
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 08:01:41 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 37FDE153CACD;
 Thu, 12 Oct 2023 10:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1697097698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ym8znVE/KNVZ2ABkurRPnWvCdBcwyMiA231koj0IzME=;
 b=RHv5a8hfYSsjGosuqXiM5HN4jBVFx9JzxhfRYPkbwVRUiakAp/Hupi2vIYb+4UPZc3sKSd
 9NUE2039F9zJvlRGh3tY8xURchgzAgNstbmNDKkqwtbEYng4RqvFmbNzyALxU+QbluM9tv
 G7di96YOnIw3j0q3NyvORUekdJK7uvM=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [PATCH] drm: Do not overrun array in drm_gem_get_pages()
Date: Thu, 12 Oct 2023 10:01:23 +0200
Message-ID: <2703014.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20231005135648.2317298-1-willy@infradead.org>
References: <20231005135648.2317298-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12302735.O9o76ZdvQC";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart12302735.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [PATCH] drm: Do not overrun array in drm_gem_get_pages()
Date: Thu, 12 Oct 2023 10:01:23 +0200
Message-ID: <2703014.mvXUDI8C0e@natalenko.name>
In-Reply-To: <20231005135648.2317298-1-willy@infradead.org>
References: <20231005135648.2317298-1-willy@infradead.org>
MIME-Version: 1.0

On =C4=8Dtvrtek 5. =C5=99=C3=ADjna 2023 15:56:47 CEST Matthew Wilcox (Oracl=
e) wrote:
> If the shared memory object is larger than the DRM object that it backs,
> we can overrun the page array.  Limit the number of pages we install
> from each folio to prevent this.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Link: https://lore.kernel.org/lkml/13360591.uLZWGnKmhe@natalenko.name/
> Fixes: 3291e09a4638 ("drm: convert drm_gem_put_pages() to use a folio_bat=
ch")
> Cc: stable@vger.kernel.org # 6.5.x
> ---
>  drivers/gpu/drm/drm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6129b89bb366..44a948b80ee1 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -540,7 +540,7 @@ struct page **drm_gem_get_pages(struct drm_gem_object=
 *obj)
>  	struct page **pages;
>  	struct folio *folio;
>  	struct folio_batch fbatch;
> -	int i, j, npages;
> +	long i, j, npages;
> =20
>  	if (WARN_ON(!obj->filp))
>  		return ERR_PTR(-EINVAL);
> @@ -564,11 +564,13 @@ struct page **drm_gem_get_pages(struct drm_gem_obje=
ct *obj)
> =20
>  	i =3D 0;
>  	while (i < npages) {
> +		long nr;
>  		folio =3D shmem_read_folio_gfp(mapping, i,
>  				mapping_gfp_mask(mapping));
>  		if (IS_ERR(folio))
>  			goto fail;
> -		for (j =3D 0; j < folio_nr_pages(folio); j++, i++)
> +		nr =3D min(npages - i, folio_nr_pages(folio));
> +		for (j =3D 0; j < nr; j++, i++)
>  			pages[i] =3D folio_file_page(folio, i);
> =20
>  		/* Make sure shmem keeps __GFP_DMA32 allocated pages in the
>=20

Gentle ping. It would be nice to have this picked so that it gets into the =
stable kernel rather sooner than later.

Thanks.

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart12302735.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUnp9MACgkQil/iNcg8
M0syoA//dDht5ZzqbjFSuWQmAUIPSUFsvQJN++9JIZ3meMgB/R8u8l0+hvQgo5pa
SSOW/C6YPgDJn40fjQy/D+Z7WlbfpLdfm2SfE2TIvG2D87b1ve8iY2/Opk2LA9l5
ezOWkm+M1Pq2Hrht7xiUGH4Y1WPuj4GRNl6ZAVQ0iLHUuFcNfcmio0lLY/z+1RN+
6ODQv9nXMEhmsAWXQHNQ7PpJz0lyzYM8pe/CJM+gn1jtTBlIE9bN7AktIVR1XOvC
7XMRiMbBKe7q/osmyDJ1VBgSn1EEWzupLnCwIjuLY0v9Hm7hTS030lbd0zUsiUe3
PvtR96R+3udApMH0ch6bBBCuKjXSBoDlbtFrEgJy9UFlJsqvNyEipsYFRDe2qKJ7
tNBOWQJCkTucQnn5e81XzzE429nqUYjUlR5qfYQF/sPXO7NewC1km/xO3bhePH3B
vGOQAvpGrJ1llN8HQr3PNgDuviJIXqVSIGLvXLf/FdKlN6NmxOgQdeq0+BQq91dN
s3J6ZxcGyoPt7y2WfY3ruExAl3lbpebYmK9Ti1O7mNpsIxdIl1gOkT3EtFICAIvJ
rTz3ie7SKhie3FudN5ceC6s2/Di2k5ute1a2gVsKrbSMsAwxJczb2r/7H/EwGExw
xMnCWyJ/SFIaxNcBIFTU7hQQcfbofJ7+Bf1mdhD6sCjfWfj0BwI=
=Gk16
-----END PGP SIGNATURE-----

--nextPart12302735.O9o76ZdvQC--



