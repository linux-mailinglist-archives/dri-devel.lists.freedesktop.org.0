Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08C7F7201
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CD510E1AA;
	Fri, 24 Nov 2023 10:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD410E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:48:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 4E190B83008;
 Fri, 24 Nov 2023 10:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D963C433C8;
 Fri, 24 Nov 2023 10:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700822927;
 bh=zysSZGvXrCbjCkNU5T+HVpgGk/opMa6u/fjLGWPdamA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTGLHLRkeWT7p2NtFKIaJPtU0xmJtdVXzOJTjqJ24XPyj6Az8c9s6/XRvnCB5fUr3
 X6RVHahwnCGE5cIoe1l+aVNJMxGdDT8TXfWopsFBtpeEbRkM79Mh+JZUaboJwnnUi6
 CTrlLz1+sRoQdzHiGAKBIQcUVnsTL0vDX28TOmfL5XRYWJDBfO1ZfyNsctD9iDVrUv
 rHXj0jarstAfAHeLJV2KBmOLCDKs5vpqgtTUfb0gfJ+0HwRIYBWnAbIL+Fu+ZIcVXs
 QBUDBU12X/eHss4YmdyUqhil//rSPydelKJ3UdcNj1ZwTpuFfuljf8USFKN+fOneoB
 plgyAnkRdNZgQ==
Date: Fri, 24 Nov 2023 11:48:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v18 09/26] drm/shmem-helper: Switch
 drm_gem_shmem_vmap/vunmap to use pin/unpin
Message-ID: <mvcfua6pzigfuaziynxmrzwkxpc3qphil7b6bbim43m63iajw7@zhizwn4pqgmi>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
 <20231029230205.93277-10-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4lop2eds5vd4c6em"
Content-Disposition: inline
In-Reply-To: <20231029230205.93277-10-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Steven Price <steven.price@arm.com>,
 virtualization@lists.linux-foundation.org, Qiang Yu <yuq825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4lop2eds5vd4c6em
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 02:01:48AM +0300, Dmitry Osipenko wrote:
> The vmapped pages shall be pinned in memory and previously get/put_pages()
> were implicitly hard-pinning/unpinning the pages. This will no longer be
> the case with addition of memory shrinker because pages_use_count > 0 won=
't
> determine anymore whether pages are hard-pinned (they will be soft-pinned=
),
> while the new pages_pin_count will do the hard-pinning. Switch the
> vmap/vunmap() to use pin/unpin() functions in a preparation of addition
> of the memory shrinker support to drm-shmem.
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

The naming convention discussion aside, and once it's settled and fixed:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--4lop2eds5vd4c6em
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWB/jAAKCRDj7w1vZxhR
xa3pAP9hrcOY656LtJ0jepRAz3Rd+bj52uTM2ZvzdbEGSMjhwQEAj7bIm9/CTTzB
VnDL++pXP/ULo/+hXA7txBt3hwH+Awk=
=aWnC
-----END PGP SIGNATURE-----

--4lop2eds5vd4c6em--
