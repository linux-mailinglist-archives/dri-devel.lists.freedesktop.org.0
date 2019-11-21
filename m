Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A5104D0D
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514476EB81;
	Thu, 21 Nov 2019 08:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A026EB7B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:59:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70936AAC3;
 Thu, 21 Nov 2019 07:59:52 +0000 (UTC)
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
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
Message-ID: <07cf5eed-558c-0434-a2ed-6800271efaac@suse.de>
Date: Thu, 21 Nov 2019 08:59:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0201758160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0201758160==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xIokA3bsAqvErMABcGuvSdbZMGuJaLQYE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xIokA3bsAqvErMABcGuvSdbZMGuJaLQYE
Content-Type: multipart/mixed; boundary="XjyiM6P75heBiB8eQWlOxiAdHT4gDeXzN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <07cf5eed-558c-0434-a2ed-6800271efaac@suse.de>
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
In-Reply-To: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>

--XjyiM6P75heBiB8eQWlOxiAdHT4gDeXzN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.11.19 um 12:47 schrieb Daniel Vetter:
> Hi all,
>=20
> I've been looking at dma_buf_v(un)map, with a goal to standardize
> locking for at least dynamic dma-buf exporters/importers, most likely
> by requiring dma_resv_lock. And I got questions around how this is
> supposed to work, since a big chunk of drivers seem to entirely lack
> locking around ttm_bo_kmap. Two big ones:
>=20
> - ttm_bo_kmap looks at bo->mem to figure out what/where to kmap to get
> at that buffer. bo->mem is supposed to be protected with
> dma_resv_lock, but at least amgpu/nouveau/radeon/qxl don't grab that
> in their prime vmap function.
>=20
> - between the vmap and vunmap something needs to make sure the backing
> storage doesn't move around. I didn't find that either anywhere,
> ttm_bo_kmap simply seems to set up the mapping, leaving locking and
> refcounting to callers.

You have to pin and unpin storage before and after mapping.

> - vram helpers have at least locking, but I'm still missing the
> refcounting. vmwgfx doesn't bother with vmap.

There's a ref counter for pinning [1] and there's a counter for mapping.
[2] Are you looking for something else?

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/include/drm/drm_gem_vram_he=
lper.h?id=3D8d3996ceedcd5c64f5a354e9dcc64db4a1f72dd6#n69
[2]
https://cgit.freedesktop.org/drm/drm-tip/tree/include/drm/drm_gem_vram_he=
lper.h?id=3D8d3996ceedcd5c64f5a354e9dcc64db4a1f72dd6#n63

>=20
> What am I missing?
>=20
> Thanks, Daniel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--XjyiM6P75heBiB8eQWlOxiAdHT4gDeXzN--

--xIokA3bsAqvErMABcGuvSdbZMGuJaLQYE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3WQ/QACgkQaA3BHVML
eiOgZggAnogGKuess1u62IUksTclcttAxpd9IJq00ajJPCLu8kk8c7V5t5EK9HuK
3cTZCIuw0tyITPlihtHz9ZgP9uj7uaCip573Qu3wtG0panY23TvSUm3ywfgZIv5z
KYaRbduieJYfcR2m+wdYSZAh0ubiYH1Brwf+17+n8unXCrYiz3aQyZ5de2JF7K+w
GeU9OQoi9RrRY+lpwEQvtYtxgMflySHgInYcnAZQnkDtOBMLzqSNtICLEhUGSZXh
IEncGcOf1mcj8uBKvJW7b2LYC0oWC92em9OeQOkMK/P8KahW6Ws8Xuiqk1KhOejd
mJkuqrs8xiD+ZqQhWDljTi1ZHRnPbw==
=n4z1
-----END PGP SIGNATURE-----

--xIokA3bsAqvErMABcGuvSdbZMGuJaLQYE--

--===============0201758160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0201758160==--
