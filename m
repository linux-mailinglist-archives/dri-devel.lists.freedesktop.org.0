Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316C2C8444
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 13:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C40E6E489;
	Mon, 30 Nov 2020 12:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125DD6E489
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:45:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3B51AC75;
 Mon, 30 Nov 2020 12:45:29 +0000 (UTC)
Subject: Re: [PATCH 0/8] drm/vram-helper: Lock GEM BOs while they are mapped
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
References: <20201130120433.7205-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1d8874bf-3683-0b53-da69-d39dc6fd5d1d@suse.de>
Date: Mon, 30 Nov 2020 13:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>
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
Content-Type: multipart/mixed; boundary="===============1484858752=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1484858752==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Kbt4FkrkqVseP6uyAxThfMoy76CY5ymIn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Kbt4FkrkqVseP6uyAxThfMoy76CY5ymIn
Content-Type: multipart/mixed; boundary="RvTWiosfZTvXSj1pAAQYXmXl5WQoYfLm4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <1d8874bf-3683-0b53-da69-d39dc6fd5d1d@suse.de>
Subject: Re: [PATCH 0/8] drm/vram-helper: Lock GEM BOs while they are mapped
References: <20201130120433.7205-1-tzimmermann@suse.de>
In-Reply-To: <20201130120433.7205-1-tzimmermann@suse.de>

--RvTWiosfZTvXSj1pAAQYXmXl5WQoYfLm4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 13:04 schrieb Thomas Zimmermann:
> GEM VRAM helpers used to pin the BO in their implementation of vmap, so=

> that they could not be relocated. In a recent discussion, [1] it became=


[1] was supposed to point to the discussion at

   https://patchwork.freedesktop.org/patch/400054/?series=3D83765&rev=3D1=




> clear that this is incorrect and that vmap should rather repend on the
> reservation lock to prevent relocation. This patchset addresses the iss=
ue.
> Besides the vram helpers, this affects ast, vboxvideo and the generic
> fbdev emulation.
>=20
> Patch 1 adds a few more rules to vmap internfaces. With VRAM, it is
> necessary to keep the BO evictable, which requires soem care when mappi=
ng
> the memory. Patch 2 changes ast's cursor code accordingly.
>=20
> Patch 3 adds vram helpers that acquires the reservation lock and vmap t=
he
> memory buffer. Same for vunmap in reverse. Patches 4 and 5 convert ast
> and vboxvideo to the new helper.
>=20
> Patch 6 removes pinning and locking from VRAM helper's vmap and vunmap.=

> The affected users in ast and fbdev emulation acquire the reservation
> locks of the GEM objects before vmapping BOs. VRAM helpers don't suppor=
t
> to export the buffer, so there are no other users of these functions.
>=20
> The the pinning and locking removed, vmap can be simplified as done in
> patches 7 and 8.
>=20
> Tested on ast with GEM VRAM and also on mgag200 to verify that the fbde=
v
> change does not interfere with GEM SHMEM.
>=20
> Thomas Zimmermann (8):
>    drm/gem: Write down some rules for vmap usage
>    drm/ast: Only map cursor BOs during updates
>    drm/vram-helper: Provide drm_gem_vram_vmap_unlocked()
>    drm/ast: Use drm_gem_vram_vmap_unlocked() in ast_cursor_show()
>    drm/vboxvideo: Use drm_gem_vram_vmap_unlocked() in cursor update
>    drm/vram-helper: Remove pinning and locking from drm_gem_vram_vmap()=

>    drm/vram-helper: Remove vmap reference counting
>    drm/vram-helper: Simplify vmap implementation
>=20
>   drivers/gpu/drm/ast/ast_cursor.c      |  63 +++++++++-------
>   drivers/gpu/drm/ast/ast_drv.h         |   2 -
>   drivers/gpu/drm/drm_client.c          |  31 ++++++++
>   drivers/gpu/drm/drm_fb_helper.c       |  10 ++-
>   drivers/gpu/drm/drm_gem_vram_helper.c | 101 +++++++++++++------------=
-
>   drivers/gpu/drm/drm_prime.c           |   6 ++
>   drivers/gpu/drm/vboxvideo/vbox_mode.c |   7 +-
>   include/drm/drm_client.h              |   2 +
>   include/drm/drm_gem.h                 |  16 ++++
>   include/drm/drm_gem_vram_helper.h     |  21 ++----
>   10 files changed, 159 insertions(+), 100 deletions(-)
>=20
> --
> 2.29.2
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RvTWiosfZTvXSj1pAAQYXmXl5WQoYfLm4--

--Kbt4FkrkqVseP6uyAxThfMoy76CY5ymIn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/E6WgFAwAAAAAACgkQlh/E3EQov+Az
HhAAwLPM4LU9UUajLDv/wj+9v2PE7gwRn/pKUyVKm7EREz8nOZS9KX8rUDC23R6LOxa20bLNFJG+
rJBz9/vGJtvFLWpfBaxo8yugfRRpZsDMnPabLNxMOdoycUxnPjo5Zg3gRdAjJNbk1SeCtwp0V0To
IMOEtTumfB8MY/RNipQ4fatBhFp79ui1g3WnKiIxseSgU/WVkfBHVubXjHIluYDML2vDdYzFRxwL
Y5KJJSDfnTp05nvWs49PGk5AknD+P2e2mYdUAxPmPWkxNHUZpEuqRMM40cZvEXrSVK1g8zbxgVOn
iMifZzlg51NfE7qEkY40YDMN8G2HVMDm0CiKnWjrGoBv3uxHyvqAiTrLy9Y5rwLuE6iTsusmZiqi
ZmGaVRerUCtpU51puewahqVRTPMivWcLoEDmxsEZTk9EtpiZWAkZajaKM3QlfWu4NVJ0K8wGcxMF
dRBOIoD0iakEtxITM6m35FDCnhMSoXtckg2bZ48S+Tp3YqaZyYfg4ygrHp6Jj3n0MnhmtGM13TRv
6sasrp+k3SEU/eEM52OetPpNK0WJtTT3gyuxZRPg1EmcoVhaEkuei6DTyi2HjDeuOf3ZbeNklatC
JP1x35zz4/DA7jpmBAFzgN9WWlE/LtzWSlpJdp/T6DCYGZgpJhF2DSSHbmljDpKBdymf5EkkKjR0
7W0=
=Risp
-----END PGP SIGNATURE-----

--Kbt4FkrkqVseP6uyAxThfMoy76CY5ymIn--

--===============1484858752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1484858752==--
