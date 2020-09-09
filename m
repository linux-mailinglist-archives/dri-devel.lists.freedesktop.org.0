Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A3262ABB
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 10:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB32D6EADE;
	Wed,  9 Sep 2020 08:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD776EADE
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 08:45:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DCB23AD82;
 Wed,  9 Sep 2020 08:45:11 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] drm/ast: Disable HW cursor when switching modes
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com, 
 emil.l.velikov@gmail.com
References: <20200813135109.10724-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <73fe8315-fc20-a41e-9cd1-2416d2a77f70@suse.de>
Date: Wed, 9 Sep 2020 10:45:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813135109.10724-1-tzimmermann@suse.de>
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
Content-Type: multipart/mixed; boundary="===============1509478833=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1509478833==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iCehp1KkGFY5MCKlXIUvyXT3BHRX9RsTX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iCehp1KkGFY5MCKlXIUvyXT3BHRX9RsTX
Content-Type: multipart/mixed; boundary="5czU7a7eF2FcwW3TbWzwr9LDggpZm1Qbr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.l.velikov@gmail.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <73fe8315-fc20-a41e-9cd1-2416d2a77f70@suse.de>
Subject: Re: [PATCH v3 0/4] drm/ast: Disable HW cursor when switching modes
References: <20200813135109.10724-1-tzimmermann@suse.de>
In-Reply-To: <20200813135109.10724-1-tzimmermann@suse.de>

--5czU7a7eF2FcwW3TbWzwr9LDggpZm1Qbr
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

ping for review

Am 13.08.20 um 15:51 schrieb Thomas Zimmermann:
> Since converting the ast driver to atomic modesettting, modesetting
> occationally locks up the graphics hardware and turns the display
> permanently dark. This happens once or twice per 10 mode switches.
> Investigation shows that the ast hardware presumably requires the HW
> cursor to be disabled while the modeswitch takes place.
>=20
> This patchset fixes the problem by disabling planes before programming
> the CRTC mode. After the switch, the planes gets re-enabled if they wer=
e
> enabled before. For mere pageflip operations, nothing changes.
>=20
> Patches #1 makes format changes work as intended: format registers are
> only updated if necessary. They used to be changed on each pageflip.
>=20
> Patches #2 to #4 change the modesetting logic such that planes will be
> disabled with the CRTC, then the CRTC's new mode is being programmed,
> and finally planes are reenabled. The primary plane is enabled before
> the cursor plane. With this setup way, the cursor plane always has a
> valid mode and framebuffer available.
>=20
> Tested on AST2100 HW. The issue is not 100% reproducible, but does not
> show up after applying the patchset. I think the problem has been fixed=
=2E
>=20
> v3:
> 	* rewrote the patchset again
> 	* format setup is now done on primary-plane update
> 	* don't disable cursor for format changes (does not seem necessary)
> 	* disable planes in CRTC atomic_disable()
> 	* do modeset in atomic_enable()
> 	* drop Fixes tags; it's too complicated for a simple bugfix
>=20
> v2:
> 	* rewrote the whole patchset
> 	* dropped the cursor patches
> 	* moved modesetting into atomic_begin()
> 	* disable planes in commit-tail function
> 	* don't require full modeset for format changes
>=20
> Thomas Zimmermann (4):
>   drm/ast: Set format registers in primary plane's update
>   drm/ast: Disable planes while switching display modes
>   drm/ast: Program display mode in CRTC's atomic_enable()
>   drm/ast: Enable CRTC before planes
>=20
>  drivers/gpu/drm/ast/ast_drv.h  |   2 +
>  drivers/gpu/drm/ast/ast_mode.c | 103 ++++++++++++++++++++-------------=

>  2 files changed, 64 insertions(+), 41 deletions(-)
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


--5czU7a7eF2FcwW3TbWzwr9LDggpZm1Qbr--

--iCehp1KkGFY5MCKlXIUvyXT3BHRX9RsTX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9YlhIUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiO9iggAuaHATHlugO2eJ+eRy5i++WZGCiDG
3ENnwuDh28jFfZdYex35OnXwS7RqSdfkNo56dfxdBS2OnFUMW6jELkNcuTiTBV8e
/Am9F3RxDVU7GtHug0oI/wAJJwI0CNzTrIqRHNz2EY7fc+8P7tU5jNcDsthRLOaL
ulfi3o0HaHSr4hu7E5KOkAbSHu6n+CYl+QBEaCZ1z6Iv/l138PkCbsy5ac/5OMmK
ouHBU9A80TG8ePiYt7YHUu6nX1c2ix+at/wXclE6uo3I/XDwqB4ka92jePXXG+fQ
RSDsizD4VxjjOY3GKqDqsVaXdVqfHt78XXBd0RwBH+pqceA3MrAO7Ylc5g==
=VP/t
-----END PGP SIGNATURE-----

--iCehp1KkGFY5MCKlXIUvyXT3BHRX9RsTX--

--===============1509478833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1509478833==--
