Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF749DEB8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6847897F0;
	Tue, 27 Aug 2019 07:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C286E332
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 23:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 21ADB28531C
Date: Mon, 26 Aug 2019 16:35:31 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/8] panfrost: Locking and runtime PM fixes
Message-ID: <20190826233531.GA29519@kevin>
References: <20190826223317.28509-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============1263441913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1263441913==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A-b from me; let's see what others say.

On Mon, Aug 26, 2019 at 05:33:09PM -0500, Rob Herring wrote:
> With further testing of recent changes with lockdep identified some
> locking issues. Avoiding lockdep issues means we need to avoid some
> locks in panfrost_mmu_unmap which in turn means avoiding runtime PM
> resume. In the process of re-working runtime PM several runtime PM
> and locking clean-ups have been identified.
>=20
> v3:
>  - Applied patches 1, 4, 5, and 6
>  - Fix race in job timeout handling with ISR
>  - Remove some no longer needed locks
>  - Fix panfrost_mmu_unmap when autosuspend delay is > 0
>  - Disable AS MMU when freeing page tables
>=20
> v2:
>  - Drop already applied 'drm/panfrost: Fix sleeping while atomic in
>    panfrost_gem_open'
>  - Runtime PM clean-ups
>  - Keep panfrost_gem_purge and use mutex_trylock there
>  - Rework panfrost_mmu_unmap runtime PM
>=20
> Rob
>=20
> Rob Herring (8):
>   drm/panfrost: Rework runtime PM initialization
>   drm/panfrost: Hold runtime PM reference until jobs complete
>   drm/panfrost: Remove unnecessary mmu->lock mutex
>   drm/panfrost: Rework page table flushing and runtime PM interaction
>   drm/panfrost: Split mmu_hw_do_operation into locked and unlocked
>     version
>   drm/panfrost: Add cache/TLB flush before switching address space
>   drm/panfrost: Flush and disable address space when freeing page tables
>   drm/panfrost: Remove unnecessary hwaccess_lock spin_lock
>=20
>  drivers/gpu/drm/panfrost/panfrost_device.c | 10 ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  3 -
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 10 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 43 ++++++----
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 91 ++++++++++------------
>  5 files changed, 76 insertions(+), 81 deletions(-)
>=20
> --
> 2.20.1

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1kbL4ACgkQ/v5QWgr1
WA3WBQ/+JyCxni0F8yMSGN5Vtzmzjs5aq/DLFS16KghADnVaVAgsW4yukDEiTxjT
oQc4NfAxgpgRQ3oIuKrA2mz4MvHYO91tbwGq7sppzF3rUb2LzpyhX3m2LgzK0GyD
y92vlGDEvcymea+pGoKGOvs7JuJrRbAzv6N6c0cKiTZzCi2KWzWGZONjCowadzVv
O/Sr4npqXPbGE+ejQRfWBaGfv3NNi9Krp4KyJmLSTf+qHNV2i6rz5TXb3YFpTm27
6OPGPFWi0mdy/j47yzQRBh0WZEBXnDBuu3HLlEGr1GQOSw/6z6wAILlGNPmB25OM
FbiQx+MmJUTq0TF/zgGkJvy1fiC2dIL0QZkIFwUrK/iz6/5kjfwPe092Tufa5Q34
zZR82DBT0gMJnR5+rvX6n4e7n8LpM36rVcOwZqqSMPrclC+UfFojN5ObXsujFm5V
jmyY3q62iG2A4F8hNkAM6CMc9XiALlye1Obnlo8B+F8iZfLx1bWw7xG7RolcEQn2
rqgrC/jKH22GiJqVUccNxtda3UQtL6KleKVS14sVnQxlsWF6SqTuoWiWSTLswqqW
J3IEMI/zgM4dWNXE/pHi9wZnrRmXKlbSQ+m5EdoFG9+PThQ3xMAMengy3vpcBl+Z
HhZHwxqbYh+nvGhEBAi5qAyyXQ2QcxPVNUIojOp0NfuwJ+JKiOQ=
=Dltj
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

--===============1263441913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1263441913==--
