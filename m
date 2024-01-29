Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EF83FF85
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 08:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C32C10EAEB;
	Mon, 29 Jan 2024 07:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7E810EAEB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706515083;
 bh=E6VO62n4+q/I0xHB7HpecGR47Z3/uZuF9Vr3ueGF41Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M9CwaX1yOwYcM9ePrr3x57jCTB6j6esaPLvRRcsn/Nulw1bpAFbr373rbSSVD81zJ
 hSREEdYzZpOtLn3gVZEh0bfkciP648o6+4yJ4q/wk7FsUYWozvucDChnloKCVN7ESz
 EM9bZQjtOeES3i0Ozw/TqwpCHDhXhDmAV6BhbRJOQgoLTWjDGPTp6rB+wBZI1V7OUb
 5CNc8Rb1w5toJ2mjz5jKSQc5j79mBJUO9FkqH6OEsSBCPfBGkLKNcR/liCqiqcPvz6
 Vun7fsqU/9mWt7A+a2VUnvuoBq7Ew1eqSY2OEmafILiZBgDiiXmVZ4as2KnxjoHQaS
 VUWZk74KLfNlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEE32378047E;
 Mon, 29 Jan 2024 07:58:02 +0000 (UTC)
Date: Mon, 29 Jan 2024 08:58:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <20240129085801.7cd8eb12@collabora.com>
In-Reply-To: <20240122163047.1954733-1-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Jan 2024 17:30:31 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> Hello,
>=20
> This is the 4th version of the kernel driver for Mali CSF-based GPUs.
>=20
> A branch based on drm-misc-next and containing all the dependencies
> that are not yet available in drm-misc-next here[1], and another [2]
> containing extra patches to have things working on rk3588. The CSF
> firmware binary can be found here[3], and should be placed under
> /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.
>=20
> The mesa MR adding v10 support on top of panthor is available here [4].
>=20
> Steve, I intentionally dropped your R-b on "drm/panthor: Add the heap
> logical block" and "drm/panthor: Add the scheduler logical block"
> because the tiler-OOM handling changed enough to require a new review
> IMHO.
>=20
> Regarding the GPL2+MIT relicensing, I collected Cl=C3=A9ment's R-b for the
> devfreq code, but am still lacking Alexey Sheplyakov for some bits in
> panthor_gpu.c. The rest of the code is either new, or covered by the
> Linaro, Arm and Collabora acks.
>=20
> And here is a non-exhaustive changelog, check each commit for a detailed
> changelog.
>=20
> v4:
> - Fix various bugs in the VM logic
> - Address comments from Steven, Liviu, Ketil and Chris
> - Move tiler OOM handling out of the scheduler interrupt handling path
>   so we can properly recover when the system runs out of memory, and
>   panthor is blocked trying to allocate heap chunks
> - Rework the heap locking to support concurrent chunk allocation. Not
>   sure if this is supposed to happen, but we need to be robust against
>   userspace passing the same heap context to two scheduling groups.
>   Wasn't needed before the tiler_oom rework, because heap allocation
>   base serialized by the scheduler lock.
> - Make kernel BO destruction robust to NULL/ERR pointers
>=20
> v3;
> - Quite a few changes at the MMU/sched level to make the fix some
>   race conditions and deadlocks
> - Addition of the a sync-only VM_BIND operation (to support
>   vkQueueSparseBind with zero commands).
> - Addition of a VM_GET_STATE ioctl
> - Various cosmetic changes (see the commit changelogs for more details)
> - Various fixes (see the commit changelogs for more details)
>=20
> v2:
> - Rename the driver (pancsf -> panthor)
> - Split the commit adding the driver to ease review
> - Use drm_sched for dependency tracking/job submission
> - Add a VM_BIND ioctl
> - Add the concept of exclusive VM for BOs that are only ever mapped to a
>   single VM
> - Document the code and uAPI
> - Add a DT binding doc
>=20
> Regards,
>=20
> Boris
>=20
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v4
> [2]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v4+rk3588
> [3]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmwa=
re/g610/mali_csffw.bin

Here's a link to a more recent/maintained libmali tree:

[3]https://github.com/JeffyCN/mirrors/raw/libmali/firmware/g610/mali_csffw.=
bin


> [4]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
>=20
> Boris Brezillon (13):
>   drm/panthor: Add uAPI
>   drm/panthor: Add GPU register definitions
>   drm/panthor: Add the device logical block
>   drm/panthor: Add the GPU logical block
>   drm/panthor: Add GEM logical block
>   drm/panthor: Add the devfreq logical block
>   drm/panthor: Add the MMU/VM logical block
>   drm/panthor: Add the FW logical block
>   drm/panthor: Add the heap logical block
>   drm/panthor: Add the scheduler logical block
>   drm/panthor: Add the driver frontend block
>   drm/panthor: Allow driver compilation
>   drm/panthor: Add an entry to MAINTAINERS
>=20
> Liviu Dudau (1):
>   dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
>=20
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
>  Documentation/gpu/driver-uapi.rst             |    5 +
>  MAINTAINERS                                   |   11 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/panthor/Kconfig               |   23 +
>  drivers/gpu/drm/panthor/Makefile              |   15 +
>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
>  drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  544 +++
>  drivers/gpu/drm/panthor/panthor_device.h      |  393 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         | 1470 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.c          | 1334 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
>  drivers/gpu/drm/panthor/panthor_gem.c         |  228 ++
>  drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
>  drivers/gpu/drm/panthor/panthor_gpu.c         |  482 +++
>  drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
>  drivers/gpu/drm/panthor/panthor_heap.c        |  596 +++
>  drivers/gpu/drm/panthor/panthor_heap.h        |   39 +
>  drivers/gpu/drm/panthor/panthor_mmu.c         | 2760 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h         |  102 +
>  drivers/gpu/drm/panthor/panthor_regs.h        |  239 ++
>  drivers/gpu/drm/panthor/panthor_sched.c       | 3500 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
>  include/uapi/drm/panthor_drm.h                |  945 +++++
>  26 files changed, 13892 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhal=
l-csf.yaml
>  create mode 100644 drivers/gpu/drm/panthor/Kconfig
>  create mode 100644 drivers/gpu/drm/panthor/Makefile
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
>  create mode 100644 include/uapi/drm/panthor_drm.h
>=20

