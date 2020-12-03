Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D22CD876
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 15:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6D56EB8B;
	Thu,  3 Dec 2020 14:05:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4956EB70
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 14:05:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A03B6AC6A;
 Thu,  3 Dec 2020 14:05:31 +0000 (UTC)
Subject: Re: [PATCH v2 0/7] drm/vram-helper: Lock GEM BOs while they are mapped
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org
References: <20201203140259.26580-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6665380f-34ab-1a12-5e91-ed2a3b08d58c@suse.de>
Date: Thu, 3 Dec 2020 15:05:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0837415484=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0837415484==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dkbQa55aa9CMLAyD29PlhVxn7ZNfWQLNf"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dkbQa55aa9CMLAyD29PlhVxn7ZNfWQLNf
Content-Type: multipart/mixed; boundary="mwMelpGe05OU4EKH5oN38ktdQ0fNFbkcb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Message-ID: <6665380f-34ab-1a12-5e91-ed2a3b08d58c@suse.de>
Subject: Re: [PATCH v2 0/7] drm/vram-helper: Lock GEM BOs while they are
 mapped
References: <20201203140259.26580-1-tzimmermann@suse.de>
In-Reply-To: <20201203140259.26580-1-tzimmermann@suse.de>

--mwMelpGe05OU4EKH5oN38ktdQ0fNFbkcb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 03.12.20 um 15:02 schrieb Thomas Zimmermann:
> GEM VRAM helpers used to pin the BO in their implementation of vmap, so=

> that they could not be relocated. In a recent discussion, [1] it became=


Grrr, [1] was again supposed to point to the discussion at

   https://patchwork.freedesktop.org/patch/400054/?series=3D83765&rev=3D1=


> clear that this is incorrect and that vmap should rather repend on the
> reservation lock to prevent relocation. This patchset addresses the iss=
ue.
>=20
> Version 2 of the patchset is a significant rework. In particular, the
> helper function drm_gem_vram_vmap_unlocked() is gone and importers now
> acquire the reservation locks by themselves. I took Christian's A-bs on=
ly
> for patches that were not affected.
>=20
> Patches 1 and 2 prepare the ast cursor code for the later changes.
>=20
> Patch 3 pushes the BO locking into callers of vmap and vunmap. Besides
> the VRAM helpers, this affects ast, vboxvideo and the generic fbdev
> emulation.
>=20
> Patches 4 to 6 clean up afterwards. BO pinning is not required any long=
er
> and the VRAM-internal helpers are not needed.
>=20
> Patch 7 adds documentation to vmap and vunmap in struct dma_buf_ops. It=

> hopefully reflects the discussion on the patchset's version 1.
>=20
> Tested on ast with GEM VRAM and also on mgag200 to verify that the fbde=
v
> change does not interfere with GEM SHMEM.
>=20
> v2:
> 	* make importers acquire resv locks by themselves
> 	* document dma-buf vamp/vunmap ops
>=20
> Thomas Zimmermann (7):
>    drm/ast: Don't pin cursor source BO explicitly during update
>    drm/ast: Only map cursor BOs during updates
>    drm/vram-helper: Move BO locking from vmap code into callers
>    drm/vram-helper: Remove pinning from drm_gem_vram_{vmap,vunmap}()
>    drm/vram-helper: Remove vmap reference counting
>    drm/vram-helper: Simplify vmap implementation
>    dma-buf: Write down some rules for vmap usage
>=20
>   Documentation/gpu/todo.rst            | 15 +++++
>   drivers/gpu/drm/ast/ast_cursor.c      | 70 +++++++++++++---------
>   drivers/gpu/drm/ast/ast_drv.h         |  2 -
>   drivers/gpu/drm/drm_client.c          | 31 ++++++++++
>   drivers/gpu/drm/drm_fb_helper.c       | 10 +++-
>   drivers/gpu/drm/drm_gem_vram_helper.c | 85 ++++++--------------------=
-
>   drivers/gpu/drm/vboxvideo/vbox_mode.c | 11 ++--
>   include/drm/drm_client.h              |  2 +
>   include/drm/drm_gem.h                 |  4 ++
>   include/drm/drm_gem_vram_helper.h     | 17 +-----
>   include/linux/dma-buf.h               | 45 ++++++++++++++
>   11 files changed, 175 insertions(+), 117 deletions(-)
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


--mwMelpGe05OU4EKH5oN38ktdQ0fNFbkcb--

--dkbQa55aa9CMLAyD29PlhVxn7ZNfWQLNf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/I8KoFAwAAAAAACgkQlh/E3EQov+Bk
5A/+OyMbzLG9nxTg4sZA2IKtd1zWhvcWLZZQloMtqM1aOmv5UHLpCP50SNnNOMk2VAtJxwk4hXxq
iy0458/N26VpQ+7QQMGrqLAItXbTPwHAPMxuCqLUUgNvLyRZxlTqJCNRw1FuWfFXDPEXFFhD8Lfw
NJlOgd3yhuAXJ6oFjowG1XdZotWrr+agF0X1KNxBXYLH/5FUN9CcqZd5sBLieYOOo0W5wTnotQY2
8D9r9AAkuVaXNtkjoCDnJwNfNwBICBszmPP6DJ6fujED8uDyeSB2zGXaUJ1L9JAcu5zWyy2F2BQD
UXvztibqEp56xJlcYu4dpcjELxv/8QhZcs+19Rn/5HyJpucEuZ3xiFbUnr5It/QPejUN9WS08GWf
i/zHYPjEYqtFAR5ZRvGhhCZkafDrh7mW5F628tZitP6VVzwKOnbOFDb2r3kR2O4qd+uzB3ZfbjYu
j1kBWM7w+VErk8gyFkqnij7RYgzsNq89mmZN4Y5sbwRtJq147GeU92Wl7c3m+uWSgPF2+yIDLO4/
NE/qc9V9jD0n3aUb8Wzys+lOGc8eFJMZ11Ze4GVff6ClLkYrXo+DQ/YnGsnGJTqxd9vZyeW265se
KwuIPFqTh/sNHU0vF5W7aGWPQ/qEuNTX7eD3ejt9rJTsJPE2rx+d7EUVRL4cs6xUpK9iFB0N7lxW
les=
=D+kl
-----END PGP SIGNATURE-----

--dkbQa55aa9CMLAyD29PlhVxn7ZNfWQLNf--

--===============0837415484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0837415484==--
