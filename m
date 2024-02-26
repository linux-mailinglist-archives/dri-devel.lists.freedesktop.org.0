Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55EE867737
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 14:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E688A10F1D7;
	Mon, 26 Feb 2024 13:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF07610F1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 13:50:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BB261042
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 05:51:24 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DB003F762
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 05:50:45 -0800 (PST)
Date: Mon, 26 Feb 2024 13:50:43 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Steven Price <steven.price@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, kernel@collabora.com,
 Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v5 00/14] drm: Add a driver for CSF-based Mali GPUs
Message-ID: <ZdyXM2wpQr0UEZUk@e110455-lin.cambridge.arm.com>
References: <20240218214131.3035480-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240218214131.3035480-1-boris.brezillon@collabora.com>
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

On Sun, Feb 18, 2024 at 10:41:14PM +0100, Boris Brezillon wrote:
> Hello,

Hi Boris,

> 
> This is the 5th version of the kernel driver for Mali CSF-based GPUs,
> and, unless someone has good reasons to block the merging of this
> driver, I expect it to be the last one (the gallium driver is now
> in a decent state, and is mostly waiting for the kernel driver to
> be accepted).

Series looks good to me and can be merged as far as I'm concerned.

Best regards,
Liviu

> 
> A branch based on drm-misc-next is available here[1], and here is
> another one [2] containing extra patches to have things working on
> rk3588. The CSF firmware binary is now merged in linux-firmware [3].
> 
> The mesa MR adding v10 support on top of panthor is available here [4].
> 
> Here is a non-exhaustive changelog, check each commit for a detailed
> changelog.
> 
> v5:
> - No fundamental changes in this v5
> - Various bug fixes (see the per-commit changelogs)
> - Various docs/typos fixes
> 
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
> 
> v3;
> - Quite a few changes at the MMU/sched level to make the fix some
>   race conditions and deadlocks
> - Addition of the a sync-only VM_BIND operation (to support
>   vkQueueSparseBind with zero commands).
> - Addition of a VM_GET_STATE ioctl
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v5
> [2]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v5+rk3588
> [3]https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/arm/mali/arch10.8
> [4]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358
> 
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
> 
> Liviu Dudau (1):
>   dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs
> 
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
>  Documentation/gpu/driver-uapi.rst             |    5 +
>  MAINTAINERS                                   |   11 +
>  drivers/gpu/drm/Kconfig                       |    2 +
>  drivers/gpu/drm/Makefile                      |    1 +
>  drivers/gpu/drm/panthor/Kconfig               |   23 +
>  drivers/gpu/drm/panthor/Makefile              |   15 +
>  drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
>  drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
>  drivers/gpu/drm/panthor/panthor_device.c      |  549 +++
>  drivers/gpu/drm/panthor/panthor_device.h      |  393 ++
>  drivers/gpu/drm/panthor/panthor_drv.c         | 1473 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.c          | 1362 +++++++
>  drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
>  drivers/gpu/drm/panthor/panthor_gem.c         |  228 ++
>  drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
>  drivers/gpu/drm/panthor/panthor_gpu.c         |  482 +++
>  drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
>  drivers/gpu/drm/panthor/panthor_heap.c        |  597 +++
>  drivers/gpu/drm/panthor/panthor_heap.h        |   39 +
>  drivers/gpu/drm/panthor/panthor_mmu.c         | 2766 +++++++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h         |  102 +
>  drivers/gpu/drm/panthor/panthor_regs.h        |  239 ++
>  drivers/gpu/drm/panthor/panthor_sched.c       | 3501 +++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
>  include/uapi/drm/panthor_drm.h                |  945 +++++
>  26 files changed, 13936 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
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
> 
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
