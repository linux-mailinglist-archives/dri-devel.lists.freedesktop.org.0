Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0C213482
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BDD6E8CF;
	Fri,  3 Jul 2020 06:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FCD6E8CF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 06:53:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 707B9AD26;
 Fri,  3 Jul 2020 06:53:24 +0000 (UTC)
Subject: Re: [PATCH v2 00/14] drm/ast: Managed modesetting
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200703064444.GB1690637@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <723622a5-be1d-93a5-b854-2c678ec59d10@suse.de>
Date: Fri, 3 Jul 2020 08:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200703064444.GB1690637@ravnborg.org>
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
Content-Type: multipart/mixed; boundary="===============1495380030=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1495380030==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rSKqq5EYOOMvBR4ceCZSYoKS5mjkp1bac"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rSKqq5EYOOMvBR4ceCZSYoKS5mjkp1bac
Content-Type: multipart/mixed; boundary="PXpYxbMCYMFkVLCrTwkWmjVkWHsLRWl4w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com
Message-ID: <723622a5-be1d-93a5-b854-2c678ec59d10@suse.de>
Subject: Re: [PATCH v2 00/14] drm/ast: Managed modesetting
References: <20200702115029.5281-1-tzimmermann@suse.de>
 <20200703064444.GB1690637@ravnborg.org>
In-Reply-To: <20200703064444.GB1690637@ravnborg.org>

--PXpYxbMCYMFkVLCrTwkWmjVkWHsLRWl4w
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 03.07.20 um 08:44 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Jul 02, 2020 at 01:50:15PM +0200, Thomas Zimmermann wrote:
>> This is the first patchset to convert ast to use managed interfaces. T=
hese
>> patches address modesetting. I expect that there will be at least one =
more
>> set of patches for memory management and one for device structures.
>>
>> Patches 1 to 11 tackle HW cursor handling. The overall point is to get=

>> cursor support out of the plane functions and put the code into helper=
s.
>> There are quite a few improvements that make cursors easier and faster=
 to
>> use. Patch 10 converts cursors to managed release.
>>
>> With cursors out of the way, modesetting initialization is much more
>> simple. Patches 12 to 14 put all related code next to each other and
>> switch to managed initialization.
>>
>> The patchset was tested on AST2100 hardware.
>>
>> v2:
>> 	* use to_ast_private() instead of
>> 	  struct drm_device.dev_private (Sam)
>>
>> Thomas Zimmermann (14):
>>   drm/ast: Move cursor functions to ast_cursor.c
>>   drm/ast: Pass struct ast_private instance to cursor init/fini
>>     functions
>>   drm/ast: Move cursor fb pinning and mapping into helper
>>   drm/ast: Update cursor image and checksum from same function
>>   drm/ast: Move cursor pageflip into helper
>>   drm/ast: Replace ast_cursor_move() with ast_cursor_show()
>>   drm/ast: Don't enable HW cursors twice during atomic update
>>   drm/ast: Add helper to hide cursor
>>   drm/ast: Keep cursor HW BOs mapped
>>   drm/ast: Managed cursor release
>>   drm/ast: Init cursors before creating modesetting structures
>>   drm/ast: Replace struct ast_crtc with struct drm_crtc
>>   drm/ast: Use managed mode-config init
>>   drm/ast: Initialize mode setting in ast_mode_config_init()
> I have browsed the patch-set. Nothing jumped at me but then
> most of the bo handling I do not understand.
>=20
> Feel free to add:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> to all patches.
>=20
> But I hope someone else that knows this better could jump in and
> take a look too.

Thank you so much. Finding reviewers for such obscure drivers is not
easy. I appreciate your feedback.

Best regards
Thomas

>=20
> 	Sam
>=20
>>
>>  drivers/gpu/drm/ast/Makefile     |   3 +-
>>  drivers/gpu/drm/ast/ast_cursor.c | 289 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/ast/ast_drv.h    |  19 +-
>>  drivers/gpu/drm/ast/ast_main.c   |  35 +---
>>  drivers/gpu/drm/ast/ast_mode.c   | 322 ++++++------------------------=
-
>>  5 files changed, 359 insertions(+), 309 deletions(-)
>>  create mode 100644 drivers/gpu/drm/ast/ast_cursor.c
>>
>> --
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


--PXpYxbMCYMFkVLCrTwkWmjVkWHsLRWl4w--

--rSKqq5EYOOMvBR4ceCZSYoKS5mjkp1bac
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7+1eMUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPqUQgAw1ojvyAjfs0AR9EcKRJR0THIkBuK
qkUaK1rC7/aHxkGsTyGQOi9liBq92m6L8RodCZLJuPV8tbpqknpp38KBT9kyLcLh
5m799XRoubk2cVr4LC/c2Yi9w5Cm0FK6nAiA3jSLu2oRs+Urb2/mJ7VMYJLpcMvi
SUrBmYfWg7LCrm0Q8U5XGrpBygBt63PTBKdEARqa+R0O++FjH4KReTdmKVFnhYef
W2cYhR98cLdH1L6Li74RLb7yQmkk51ED3hgTgoYUD3Ql9658D82almtDCwLqF/ZQ
uDJBX6YAnL3geCZY9aUuvsYePhYiVkO3pjnqDOqXdLxmeuDbk4w+WQacmg==
=e6+9
-----END PGP SIGNATURE-----

--rSKqq5EYOOMvBR4ceCZSYoKS5mjkp1bac--

--===============1495380030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1495380030==--
