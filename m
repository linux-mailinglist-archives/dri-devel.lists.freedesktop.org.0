Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 335D036C5D5
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E296E949;
	Tue, 27 Apr 2021 12:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F386E94F;
 Tue, 27 Apr 2021 12:10:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FEC4B18F;
 Tue, 27 Apr 2021 12:10:40 +0000 (UTC)
Subject: Re: [PATCH v7 0/4] drm: Move struct drm_device.pdev to legacy
To: Jani Nikula <jani.nikula@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, chris@chris-wilson.co.uk
References: <20210427111421.2386-1-tzimmermann@suse.de>
 <87v9883pd9.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <495a983e-f995-e63c-b63b-9a29daa2edbf@suse.de>
Date: Tue, 27 Apr 2021 14:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <87v9883pd9.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0322772355=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0322772355==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Fp3hbdaPMkG55bjOjfzNQaB9WL2nRsrL1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Fp3hbdaPMkG55bjOjfzNQaB9WL2nRsrL1
Content-Type: multipart/mixed; boundary="VuQR3NnQOzCnZJEOOPZEgnAlcKuUiq5U7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, chris@chris-wilson.co.uk
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <495a983e-f995-e63c-b63b-9a29daa2edbf@suse.de>
Subject: Re: [PATCH v7 0/4] drm: Move struct drm_device.pdev to legacy
References: <20210427111421.2386-1-tzimmermann@suse.de>
 <87v9883pd9.fsf@intel.com>
In-Reply-To: <87v9883pd9.fsf@intel.com>

--VuQR3NnQOzCnZJEOOPZEgnAlcKuUiq5U7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Jani

Am 27.04.21 um 14:04 schrieb Jani Nikula:
> On Tue, 27 Apr 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> V7 of the patchset fixes some bitrot in the intel driver.
>>
>> The pdev field in struct drm_device points to a PCI device structure a=
nd
>> goes back to UMS-only days when all DRM drivers were for PCI devices.
>> Meanwhile we also support USB, SPI and platform devices. Each of those=

>> uses the generic device stored in struct drm_device.dev.
>>
>> To reduce duplication and remove the special case of PCI, this patchse=
t
>> converts all modesetting drivers from pdev to dev and makes pdev a fie=
ld
>> for legacy UMS drivers.
>>
>> For PCI devices, the pointer in struct drm_device.dev can be upcasted =
to
>> struct pci_device; or tested for PCI with dev_is_pci(). In several pla=
ces
>> the code can use the dev field directly.
>>
>> After converting all drivers and the DRM core, the pdev fields becomes=

>> only relevant for legacy drivers. In a later patchset, we may want to
>> convert these as well and remove pdev entirely.
>=20
> On the series,
>=20
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>=20
> How should we merge these?

Thanks for the quick reply.

There is another pdev patch that I just sent out. [1] It has to go into=20
the intel tree. After it landed, I want to get this patchset into=20
drm-misc-next ASAP. Otherwise, drm-tip would stop building.

This should fix things in the correct order and finally remove pdev for=20
current drivers.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210427110747.2065-1-tzimmermann@suse.=
de/T/#u

>=20
>=20
>=20
>>
>> v7:
>> 	* fix instances of pdev that have benn added under i915/
>> v6:
>> 	* also remove assignment in i915/selftests in later patch (Chris)
>> v5:
>> 	* remove assignment in later patch (Chris)
>> v4:
>> 	* merged several patches
>> 	* moved core changes into separate patch
>> 	* vmwgfx build fix
>> v3:
>> 	* merged several patches
>> 	* fix one pdev reference in nouveau (Jeremy)
>> 	* rebases
>> v2:
>> 	* move whitespace fixes into separate patches (Alex, Sam)
>> 	* move i915 gt/ and gvt/ changes into separate patches (Joonas)
>>
>> Thomas Zimmermann (4):
>>    drm/i915/gt: Remove reference to struct drm_device.pdev
>>    drm/i915: Remove reference to struct drm_device.pdev
>>    drm/i915: Don't assign to struct drm_device.pdev
>>    drm: Move struct drm_device.pdev to legacy section
>>
>>   drivers/gpu/drm/i915/gt/intel_region_lmem.c      | 2 +-
>>   drivers/gpu/drm/i915/i915_drv.c                  | 1 -
>>   drivers/gpu/drm/i915/intel_runtime_pm.h          | 2 +-
>>   drivers/gpu/drm/i915/selftests/mock_gem_device.c | 1 -
>>   include/drm/drm_device.h                         | 6 +++---
>>   5 files changed, 5 insertions(+), 7 deletions(-)
>>
>> --
>> 2.31.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VuQR3NnQOzCnZJEOOPZEgnAlcKuUiq5U7--

--Fp3hbdaPMkG55bjOjfzNQaB9WL2nRsrL1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCH/z8FAwAAAAAACgkQlh/E3EQov+BM
DA//daeE4VneNVAmNNIwjIb2wJgJT6Oqgyi3dD6GhzGHrAnN3FCqasnbjTsZ6JwEJQ5HP+qjWg9w
LjaU2u5B22iFJrE5bCixTWBXYTCVwTCrTq2IhMkKbezw2Ze55bbdsVL5MFTfndopcnt95CuUcmdE
VG6vWwOCfnYRAjnfihXRbKyYhbDeBpcPPk2j1W1u4ELFYncBuN1FWpYlIhqWr0jXo7XLL8Sn167N
SG6295Z/fwjKtDZN1XMKkuZcXczJwDfJQQ2HqWpqxnViOUeuAAvuDSm3wQ6o5U1OcasH0NgHvPdG
YTHXZ07tZR78BmWOY9fN5SargyBGw2iMQBCUDZN3ARezTUlWzCjNb/M+b1sjZaiOZOop8MEoBxOL
+PBj3KcVRfEqbGoYS77vTuh7QHJnBcdQTUGsLvx6JjcqOpg6V0rmFMY7IPe34ZkDsmlyy5BVxVT9
EsOzhDEHKz/gseBZD7bnepYa9VghIwyo+6Ctok1VrfZFpCoCXNCGTZD2HIe1IdUjR/57aKQZSKHu
fnB8WCs5aIrAAxcD0WszpIOBY5v8k7iiEeLWRIW2l+AgBafvzAGCxl2eNLXzsDx+Vf2btamjBOG+
BXxh/2U3PJEAyh+KJb71uBsQF4OEQlCB7WQlg5qKstM1ETnvVvkGFXYY5c+Co5EKOoxTHglXDwl4
jX0=
=A+hK
-----END PGP SIGNATURE-----

--Fp3hbdaPMkG55bjOjfzNQaB9WL2nRsrL1--

--===============0322772355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0322772355==--
