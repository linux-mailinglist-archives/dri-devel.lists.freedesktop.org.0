Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B6CAFE68
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEE910E54C;
	Tue,  9 Dec 2025 12:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fqs1sVhN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA21E10E53A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765282824;
 bh=ZeSJqs5kWyra8SvjMuw8tjO8Za3GwPbaSrOhTP1mEYk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fqs1sVhNtJ5KExIII+sF76ElYuzMBmHMPyWPV5zKM56s5+yE4NQrNG/b8sRMyNTAx
 31GCWk4KAzo41oPEgoo5u6ZZv0ihncPC5xvs01uBdVvL7TpIbNtf2pvB7GDwcmR5Vz
 8TsvLH48HKNKPfRdAByqipcaZIPqp1D56zads1e5SijSRYmJ5F6aNKZ18YiQ+BXlIe
 R6ChNN5Ync+BSa7sCDFd3Z+eCf++KP9ojK9lx0+n3pA4GniaX4HuJD3q/0exJHh/gC
 ICjX6IaBUTRDXs9RQtBYuI9+ye3/AdevUVOjKmCKxTPIhuEPACFeE/jkMhqDqxoeb6
 QNK8k9M6TN52A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id BBFD817E1017;
 Tue,  9 Dec 2025 13:20:23 +0100 (CET)
Date: Tue, 9 Dec 2025 13:20:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Faith Ekstrand
 <faith.ekstrand@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v8 00/13] drm/panfrost,panthor: Cached maps and explicit
 flushing
Message-ID: <20251209132018.14e2848c@fedora>
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon,  8 Dec 2025 11:08:27 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> This series implements cached maps and explicit flushing for both panfrost
> and panthor.
>=20
> The PanVK MR to use this lives here:
>=20
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36385
>=20
> This version moves away from the code sharing proposed at the
> drm_prime/gem_shmem level and hand-roll a bunch of things that
> could potentially be shared. The goal here is to take the path
> of least resistance and discuss this controversial code-sharing
> topic in a follow-up MR. Dropping driver maintainers Cc-ed on v7
> since they should now be aware that we changed gears and hand-rolled
> our own thing in pan{thor,frost}.
>=20
> Changes in v2:
> - Expose the coherency so userspace can know when it should skip cache
>   maintenance
> - Hook things up at drm_gem_object_funcs level to dma-buf cpu_prep hooks
>   can be implemented generically
> - Revisit the semantics of the flags passed to gem_sync()
> - Add BO_QUERY_INFO ioctls to query BO flags on imported objects and
>   let the UMD know when cache maintenance is needed on those
>=20
> Changes in v3:
> - New patch to fix panthor_gpu_coherency_set()
> - No other major changes, check each patch changelog for more details
>=20
> Changes in v4:
> - Two trivial fixes, check each patch changelog for more details
>=20
> Changes in v5:
> - Add a way to overload dma_buf_ops while still relying on the drm_prime
>   boilerplate
> - Add default shmem implementation for
>   dma_buf_ops::{begin,end}_cpu_access()
> - Provide custom dma_buf_ops to deal with CPU cache flushes around CPU
>   accesses when the BO is CPU-cacheable
> - Go back to a version of drm_gem_shmem_sync() that only deals with
>   cache maintenance, and adjust the semantics to make it clear this is
>   the only thing it cares about
> - Adjust the BO_SYNC ioctls according to the new drm_gem_shmem_sync()
>   semantics
>=20
> Changes in v6:
> - No major changes, check the changelog in each patch for more details
>=20
> Changes in v7:
> - Drop the drm_prime/gem_shmem helpers and duplicate the logic in
>   panthor/panfrost
>=20
> Changes in v8:
> - Fix a double struct field assignment and collect R-b tags
>=20
> Boris Brezillon (8):
>   drm/panthor: Provide a custom dma_buf implementation
>   drm/panthor: Fix panthor_gpu_coherency_set()
>   drm/panthor: Expose the selected coherency protocol to the UMD
>   drm/panthor: Add a PANTHOR_BO_SYNC ioctl
>   drm/panthor: Add an ioctl to query BO flags
>   drm/panfrost: Provide a custom dma_buf implementation
>   drm/panfrost: Expose the selected coherency protocol to the UMD
>   drm/panfrost: Add an ioctl to query BO flags
>=20
> Faith Ekstrand (4):
>   drm/panthor: Bump the driver version to 1.7
>   drm/panfrost: Add a PANFROST_SYNC_BO ioctl
>   drm/panfrost: Add flag to map GEM object Write-Back Cacheable
>   drm/panfrost: Bump the driver version to 1.6
>=20
> Lo=C3=AFc Molinari (1):
>   drm/panthor: Add flag to map GEM object Write-Back Cacheable

Queued to drm-misc-next.

>=20
>  drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c    | 101 ++++++++-
>  drivers/gpu/drm/panfrost/panfrost_gem.c    | 239 ++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_gem.h    |  10 +
>  drivers/gpu/drm/panfrost/panfrost_gpu.c    |  26 ++-
>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  10 +-
>  drivers/gpu/drm/panthor/panthor_device.c   |  10 +-
>  drivers/gpu/drm/panthor/panthor_drv.c      |  79 ++++++-
>  drivers/gpu/drm/panthor/panthor_gem.c      | 240 ++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_gem.h      |   6 +
>  drivers/gpu/drm/panthor/panthor_gpu.c      |   2 +-
>  drivers/gpu/drm/panthor/panthor_sched.c    |  18 +-
>  include/uapi/drm/panfrost_drm.h            |  76 ++++++-
>  include/uapi/drm/panthor_drm.h             | 157 +++++++++++++-
>  14 files changed, 953 insertions(+), 22 deletions(-)
>=20

