Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C52258AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469AC89D56;
	Mon, 20 Jul 2020 07:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC7089D56
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:34:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33EA3ADDF;
 Mon, 20 Jul 2020 07:34:42 +0000 (UTC)
Subject: Re: [PATCH v2 0/6] drm/ast: Managed MM
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200716125353.31512-1-tzimmermann@suse.de>
 <20200716132433.GA1928081@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <84252f36-0b43-687f-d3e3-f58eb86862cc@suse.de>
Date: Mon, 20 Jul 2020 09:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716132433.GA1928081@ravnborg.org>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1208232160=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1208232160==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="swbQ36cKS3I3nX3WZRBzbg5UJO0oYanwr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--swbQ36cKS3I3nX3WZRBzbg5UJO0oYanwr
Content-Type: multipart/mixed; boundary="C2D5IUgsgkjdivHtgGbreal1mP8RoezAG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, noralf@tronnes.org,
 yc_chen@aspeedtech.com, dri-devel@lists.freedesktop.org
Message-ID: <84252f36-0b43-687f-d3e3-f58eb86862cc@suse.de>
Subject: Re: [PATCH v2 0/6] drm/ast: Managed MM
References: <20200716125353.31512-1-tzimmermann@suse.de>
 <20200716132433.GA1928081@ravnborg.org>
In-Reply-To: <20200716132433.GA1928081@ravnborg.org>

--C2D5IUgsgkjdivHtgGbreal1mP8RoezAG
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 16.07.20 um 15:24 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Jul 16, 2020 at 02:53:47PM +0200, Thomas Zimmermann wrote:
>> This is the second patchset for converting ast to managed DRM interfac=
es.
>> This one addresses memory management. There will be another, final rou=
nd
>> of patches for converting DRM device structures as well.
>>
>> Patch #1 introduces managed initialization for VRAM MM. Other drivers
>> using the VRAM helpers should be converted to this at some point.
>>
>> Patches #2 to #4 do some preparation that make ast look slightly nicer=
=2E
>>
>> Patch #5 fixes a long-standing bug that I found as part of the rework.=

>> Posting the GPU requires information about the installed DRAM. So the =
DRAM
>> detection has to run before the GPU-posting code. This got reversed by=
 a
>> fix in v4.11. The patch restores the original correct order of these
>> operations. As the GPU is usually posted by the VGA BIOS, the problem =
might
>> not have shown up in practice.
>>
>> With all the cleanups in place, patch #6 switches memory management to=

>> mnaged interfaces.
>>
>> Tested on AST2100 HW.
>>
>> v2:
>> 	* reworked managed VRAM MM; new interface name, returns errno
>> 	  code, improved documentation (Sam)
>>
>> Thomas Zimmermann (6):
>>   drm/vram-helper: Managed vram helpers
>>   drm/ast: Rename ast_ttm.c to ast_mm.c
>>   drm/ast: Use managed VRAM-helper initialization
>>   drm/ast: Move VRAM size detection to ast_mm.c
>>   drm/ast: Initialize DRAM type before posting GPU
>>   drm/ast: Use managed MM initialization
>=20
> Series looks good now. All patches are:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, Sam. I added the patches to drm-misc-next

>=20
>=20
> 	Sam
>>
>>  drivers/gpu/drm/ast/Makefile                |  2 +-
>>  drivers/gpu/drm/ast/ast_drv.h               |  2 -
>>  drivers/gpu/drm/ast/ast_main.c              | 45 ++---------
>>  drivers/gpu/drm/ast/{ast_ttm.c =3D> ast_mm.c} | 77 ++++++++++++++----=
-
>>  drivers/gpu/drm/drm_gem_vram_helper.c       | 84 ++++++++++++--------=
-
>>  include/drm/drm_gem_vram_helper.h           |  3 +
>>  6 files changed, 115 insertions(+), 98 deletions(-)
>>  rename drivers/gpu/drm/ast/{ast_ttm.c =3D> ast_mm.c} (63%)
>>
>> --
>> 2.27.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--C2D5IUgsgkjdivHtgGbreal1mP8RoezAG--

--swbQ36cKS3I3nX3WZRBzbg5UJO0oYanwr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8VSQgUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiP/dAf+MU8ad51mV5ZH06K4/O9Cir7NqTRU
qKe1XFE5N1njo+8wMIlXyoOOmbDx/NU8T3jJogic/y36pbkpZvvqTEU5bsXL2cNL
GgLL/2+m9jxRV2ydrrBZrkTPdcY4h61kdV09AK53PdqWJIhXV/JWxcE/mLtIJecv
avU6FVARygNlFUuMwoZ551PQcw96YUuRk7dZPWqY/eYfHQqGfxr0ggpOwOlFBAXr
yzPFokUxPToXiA4PEIHTYDtfOu8bI5+Ija4Wfd1jy/aZPQE1b6m5j9r4vHKYcgRl
Dwj9StVFZ9aKz+a/HjB+ESuqc/37ohmIpjwcHAaonf9WygbvjtHO5/+HVQ==
=Pcl4
-----END PGP SIGNATURE-----

--swbQ36cKS3I3nX3WZRBzbg5UJO0oYanwr--

--===============1208232160==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1208232160==--
