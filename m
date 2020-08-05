Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB98323CA14
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0955B89BF3;
	Wed,  5 Aug 2020 10:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAC189BF3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:55:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30E40B680;
 Wed,  5 Aug 2020 10:56:07 +0000 (UTC)
Subject: Re: [PATCH v1 0/4] drm/ast: Disable HW cursor when switching modes
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com, 
 emil.l.velikov@gmail.com
References: <20200805105428.2590-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <64579013-da9a-f1b2-9c72-9e4a3e055948@suse.de>
Date: Wed, 5 Aug 2020 12:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805105428.2590-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0250544638=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0250544638==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Rd6brzv6acMrOnkXZa9HPT7F6BrfIhGrV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Rd6brzv6acMrOnkXZa9HPT7F6BrfIhGrV
Content-Type: multipart/mixed; boundary="YaowDgZdzdCb1E62Xsxtn9hbKKNVlj94U";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <64579013-da9a-f1b2-9c72-9e4a3e055948@suse.de>
Subject: Re: [PATCH v1 0/4] drm/ast: Disable HW cursor when switching modes
References: <20200805105428.2590-1-tzimmermann@suse.de>
In-Reply-To: <20200805105428.2590-1-tzimmermann@suse.de>

--YaowDgZdzdCb1E62Xsxtn9hbKKNVlj94U
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Should say [PATCH v2 0/4] instead

Am 05.08.20 um 12:54 schrieb Thomas Zimmermann:
> Since converting the ast driver to atomic modesettting, modesetting
> occationally locks up the graphics hardware and turns the display
> permanently dark. This happens once or twice per 10 mode switches.
> Investigation shows that the ast hardware presumably requires the HW
> cursor to be disabled while the modeswitch takes place.
>=20
> This patchset fixes the problem by disabling planes before programming
> the CRTC mode or format. After the switch, the planes gets re-enabled i=
f
> they were enabled before. For mere pageflip operations, nothing changes=
=2E
>=20
> Patches #1 makes format changes work as intended: format registers are
> only updated if necessary. They used to be changed on each pageflip.
> Patch #2 puts the modesetting code before the plane-update code. This
> way, mode setting runs while planes are disabled. Patches #3 and #4
> add a commit-tail function that disables planes if the display's mode
> or format is going to change. The active planes will later get re-enabl=
ed
> by the plane-update handler.
>=20
> Tested on AST2100 HW. The issue is not 100% reproducible, but does not
> show up after applying the patchset. I think the problem has been fixed=
=2E
>=20
> v2:
> 	* rewrote the whole patchset
> 	* dropped the cursor patches
> 	* moved modesetting into atomic_begin()
> 	* disable planes in commit-tail function
> 	* don't require full modeset for format changes
>=20
> Thomas Zimmermann (4):
>   drm/ast: Only set format registers if primary plane's format changes
>   drm/ast: Set display mode in atomic_begin()
>   drm/ast: Add commit-tail function
>   drm/ast: Disable planes while switching display modes
>=20
>  drivers/gpu/drm/ast/ast_drv.h  |   2 +
>  drivers/gpu/drm/ast/ast_mode.c | 148 +++++++++++++++++++++++++--------=

>  2 files changed, 114 insertions(+), 36 deletions(-)
>=20
> --
> 2.28.0
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--YaowDgZdzdCb1E62Xsxtn9hbKKNVlj94U--

--Rd6brzv6acMrOnkXZa9HPT7F6BrfIhGrV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8qkDYUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP2Mgf/aXfVs+K4esxDQXkOhNp8AYzuQW0y
pjktdIfJ1Y4oQoKNH6fIiJgmYTF/kyUQDUCQLP0+wV9npbnWJrIhglStd8gML6WA
Yk9BQjipmhJR3KNlhFD3j4Y86ZbZ/FEeIt2YZUwDRtvmJcss7gK40QK86qo2tGWf
CsxSLuPwdFELemwLMmu20iiiZwnx5tH7jVvlYLPtCVxQXUJ8saV1sBYvkWrwajvZ
F64DmzWVbll8G1neI84EyfOyRuz0EClJ411NLj5dSU74FVgHfMUNbPz6590Ks5dI
THL7tG6JnpM83c0gU6ciEK5n+zmAQY9R5K2DB9DkWTZdDqkmqxu4R3r4hw==
=3070
-----END PGP SIGNATURE-----

--Rd6brzv6acMrOnkXZa9HPT7F6BrfIhGrV--

--===============0250544638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0250544638==--
