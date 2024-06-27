Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D27A91ADC2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 19:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D6910EB0A;
	Thu, 27 Jun 2024 17:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jdT2GY36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F8510EA9D;
 Thu, 27 Jun 2024 17:16:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED21961E14;
 Thu, 27 Jun 2024 17:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB2DC2BBFC;
 Thu, 27 Jun 2024 17:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719508570;
 bh=sSeDFPLANRtdCM3W5AaKh+hXR3lM6y6nXqJeEH89EL0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jdT2GY3651qQ8ySaOjVCeu1i6mUXn4kbzneO/06+6TL90hewAkhxeRwFIfQY2C3+a
 hRPnYCpnbQrMjqi4GjpSn2CqyXE8MVqbgBRTwq9Mat2vjPspxeFhMi1oGL234JB+HW
 vIvEFfR49tfh7YBT6j6zBoVLacpuKruzBkVjDeVeUAci2DvClA1WRoL8SlP+mYLuZv
 vR16hFCG8zK5xThzW2Q3wvVlXPB3bdkcWVEir6e8V60E2gSXokjDUXPEEJKtn2+zQz
 SDzgGknxNP9tUsP9KQkpxeBtklw7JadnygMfF/VyG8pPRiOkVBEn6Y7zBAGXoTBdj3
 eFiEJ7l0D/L/g==
Date: Thu, 27 Jun 2024 19:16:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Zefan Li <lizefan.x@bytedance.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/6] drm/cgroup: Add memory accounting DRM cgroup
Message-ID: <20240627-paper-vicugna-of-fantasy-c549ed@houat>
References: <20240627154754.74828-1-maarten.lankhorst@linux.intel.com>
 <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4x267kq4clbw44gl"
Content-Disposition: inline
In-Reply-To: <20240627154754.74828-3-maarten.lankhorst@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4x267kq4clbw44gl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for working on this!

On Thu, Jun 27, 2024 at 05:47:21PM GMT, Maarten Lankhorst wrote:
> The initial version was based roughly on the rdma and misc cgroup
> controllers, with a lot of the accounting code borrowed from rdma.
>=20
> The current version is a complete rewrite with page counter; it uses
> the same min/low/max semantics as the memory cgroup as a result.
>=20
> There's a small mismatch as TTM uses u64, and page_counter long pages.
> In practice it's not a problem. 32-bits systems don't really come with
> >=3D4GB cards and as long as we're consistently wrong with units, it's
> fine. The device page size may not be in the same units as kernel page
> size, and each region might also have a different page size (VRAM vs GART
> for example).
>=20
> The interface is simple:
> - populate drmcgroup_device->regions[..] name and size for each active
>   region, set num_regions accordingly.
> - Call drm(m)cg_register_device()
> - Use drmcg_try_charge to check if you can allocate a chunk of memory,
>   use drmcg_uncharge when freeing it. This may return an error code,
>   or -EAGAIN when the cgroup limit is reached. In that case a reference
>   to the limiting pool is returned.
> - The limiting cs can be used as compare function for
>   drmcs_evict_valuable.
> - After having evicted enough, drop reference to limiting cs with
>   drmcs_pool_put.
>=20
> This API allows you to limit device resources with cgroups.
> You can see the supported cards in /sys/fs/cgroup/drm.capacity
> You need to echo +drm to cgroup.subtree_control, and then you can
> partition memory.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>

I'm sorry, I should have wrote minutes on the discussion we had with TJ
and Tvrtko the other day.

We're all very interested in making this happen, but doing a "DRM"
cgroup doesn't look like the right path to us.

Indeed, we have a significant number of drivers that won't have a
dedicated memory but will depend on DMA allocations one way or the
other, and those pools are shared between multiple frameworks (DRM,
V4L2, DMA-Buf Heaps, at least).

This was also pointed out by Sima some time ago here:
https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

So we'll want that cgroup subsystem to be cross-framework. We settled on
a "device" cgroup during the discussion, but I'm sure we'll have plenty
of bikeshedding.

The other thing we agreed on, based on the feedback TJ got on the last
iterations of his series was to go for memcg for drivers not using DMA
allocations.

It's the part where I expect some discussion there too :)

So we went back to a previous version of TJ's work, and I've started to
work on:

  - Integration of the cgroup in the GEM DMA and GEM VRAM helpers (this
    works on tidss right now)

  - Integration of all heaps into that cgroup but the system one
    (working on this at the moment)

  - Integration into v4l2 (next on my list)

Maxime

--4x267kq4clbw44gl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn2eVwAKCRDj7w1vZxhR
xReyAP4+9TGUgVyaERT/3Z2Q6QCqUYta9dlEvaZaPjxpE/PzCgD9GtTKU1rmEBJN
XhhmHQ04LONiQxG4Qp4fDvfFOussXgY=
=InwG
-----END PGP SIGNATURE-----

--4x267kq4clbw44gl--
