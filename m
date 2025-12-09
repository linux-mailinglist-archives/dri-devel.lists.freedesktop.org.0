Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECACB047A
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED4C10E63F;
	Tue,  9 Dec 2025 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FMvR9bZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1516910E64F;
 Tue,  9 Dec 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765290460;
 bh=fH/yI37b5CK9f8w3kxUP+w4Moli9Bpyfut5heK/ikhg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FMvR9bZ3AcGXFQnqGk1Yx3Uo5+eJPUlqPh7rok1EJ7EvYjEogXTjJab8p3cC+mzHf
 CRH4WQXITPwHDxnXSTeTFle5jdQYO7H7qEIs9WdBKIed7QvDx86tYEsg4QphPU/knb
 k9W6XNxjOmU8Af/QwZaq9dN0Uja5iSRclQa34AS5dWLpTaNrrJaliM+JFyHjLHd4ae
 zP1LT7f5wbzIpJ8X0W6qxxHjFQJTdhxrs104gjyZw7WvVpilOb6FNaHUkmcL55Yxug
 4bcNzM9CP0nkzH9fo3rN384vN863GIYJ+OTpsPKVH8fvozUHcifhNGB1Ykqlg7f06I
 Bl/L8v41ZgwDQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5A3E17E1216;
 Tue,  9 Dec 2025 15:27:39 +0100 (CET)
Date: Tue, 9 Dec 2025 15:27:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, ogabbay@kernel.org, mamin506@gmail.com,
 lizhi.hou@amd.com, maciej.falkowski@linux.intel.com,
 karol.wachowski@linux.intel.com, tomeu@tomeuvizoso.net,
 frank.binns@imgtec.com, matt.coster@imgtec.com, yuq825@gmail.com,
 robh@kernel.org, steven.price@arm.com, adrian.larumbe@collabora.com,
 liviu.dudau@arm.com, mwen@igalia.com, kraxel@redhat.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH 00/13] drm: Introduce GEM-UMA memory management
Message-ID: <20251209152734.6851f3ac@fedora>
In-Reply-To: <20251209140141.94407-1-tzimmermann@suse.de>
References: <20251209140141.94407-1-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  9 Dec 2025 14:41:57 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Duplicate GEM-SHMEM to GEM-UMA. Convert all DRM drivers for UMA
> systems if they currently use GEM-SHMEM.
> 
> Many DRM drivers for hardware with Unified Memory Architecture (UMA)
> currently builds upon GEM-SHMEM and extends the helpers with features
> for managing the GPU MMU. This allows the GPU to access the GEM buffer
> content for its operation.
> 
> There is another, larger, set of DRM drivers that use GEM-SHMEM merely
> as buffer management with no hardware support. These drivers copy the
> buffer content to the GPU on each page flip. The GPU itself has no direct
> access. Hardware of this type is usually in servers, behind slow busses
> (SPI, USB), or provided by firmware (drivers in sysfb/).
> 
> After some discussion with Boris on the future of GEM-SHMEM, it seems
> to me that both use cases more and more diverge from each other. The
> most prominent example is the implementation of gem_prime_import,
> where both use cases use distinct approaches.
> 
> So we discussed the introduction of a GEM-UMA helper library for
> UMA-based hardware. GEM-UMA will remain flexible enough for drivers
> to extend it for their use case. GEM-SHMEM will become focused on the
> simple-hardware use case. The benefit for both libraries is that they
> will be easier to understand and maintain. GEM-SHMEM can be simplified
> signiifcantly, I think.
> 
> This RFC series introduces GEM-UMA and converts the UMA-related drivers.
> 
> Patches 1 and 2 fix issues in GEM-SHMEM, so that we don't duplicate
> errornous code.
> 
> Patch 3 copies GEM-SHMEM to GEM-UMA. Patch 4 then does soem obvious
> cleanups of unnecessary code.

Instead of copying the code as-is, I'd rather take a step back and think
about what we need and how we want to handle more complex stuff, like
reclaim. I've started working on a shrinker for panthor [1], and as part
of this series, I've added a commit implementing just enough to replace
what gem-shmem currently provides. Feels like the new GEM-UMA thing
could be designed on a composition rather than inheritance model,
where we have sub-components (backing, cpu_map, gpu_map) that can be
pulled in and re-used by the driver implementation. The common helpers
would take those sub-components instead of a plain GEM object. That
would leave the drivers free of how their internal gem_object fields are
laid out and wouldn't require overloading the ->gem_create_object()
function. It seems to be that it would better match the model you were
describing the other day.

> 
> Patches 5 to 13 update the drivers that can be converted to GEM-UMA.
> These changes are just symbol renaming. There are so far no functional
> differences between the memory managers.
> 
> A gave GEM-UMA some smoke testing by running virtgpu.

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/commits/panthor-shrinker-revisited/drivers?ref_type=heads
[2]https://gitlab.freedesktop.org/bbrezillon/linux/-/commit/4e6927fc2c60265b77a5a88013f55377bc4f4ab3

> 
> Thomas Zimmermann (13):
>   drm/gem-shmem: Fix typos in documentation
>   drm/gem-shmem: Fix the MODULE_LICENSE() string
>   drm: Add GEM-UMA helpers for memory management
>   drm/gem-uma: Remove unused interfaces
>   drm/imagination: Use GEM-UMA helpers for memory management
>   drm/lima: Use GEM-UMA helpers for memory management
>   drm/panfrost: Use GEM-UMA helpers for memory management
>   drm/panthor: Use GEM-UMA helpers for memory management
>   drm/v3d: Use GEM-UMA helpers for memory management
>   drm/virtgpu: Use GEM-UMA helpers for memory management
>   accel/amdxdna: Use GEM-UMA helpers for memory management
>   accel/ivpu: Use GEM-UMA helpers for memory management
>   accel/rocket: Use GEM-UMA helpers for memory management
> 
>  Documentation/gpu/drm-mm.rst                  |  12 +
>  drivers/accel/amdxdna/Kconfig                 |   2 +-
>  drivers/accel/amdxdna/aie2_ctx.c              |   1 -
>  drivers/accel/amdxdna/aie2_message.c          |   1 -
>  drivers/accel/amdxdna/aie2_pci.c              |   1 -
>  drivers/accel/amdxdna/aie2_psp.c              |   1 -
>  drivers/accel/amdxdna/aie2_smu.c              |   1 -
>  drivers/accel/amdxdna/amdxdna_ctx.c           |   7 +-
>  drivers/accel/amdxdna/amdxdna_gem.c           |  49 +-
>  drivers/accel/amdxdna/amdxdna_gem.h           |   5 +-
>  .../accel/amdxdna/amdxdna_mailbox_helper.c    |   1 -
>  drivers/accel/amdxdna/amdxdna_pci_drv.c       |   1 -
>  drivers/accel/amdxdna/amdxdna_sysfs.c         |   1 -
>  drivers/accel/ivpu/Kconfig                    |   2 +-
>  drivers/accel/ivpu/ivpu_gem.c                 |  36 +-
>  drivers/accel/ivpu/ivpu_gem.h                 |   4 +-
>  drivers/accel/rocket/Kconfig                  |   2 +-
>  drivers/accel/rocket/rocket_gem.c             |  46 +-
>  drivers/accel/rocket/rocket_gem.h             |   6 +-
>  drivers/gpu/drm/Kconfig                       |   9 +
>  drivers/gpu/drm/Kconfig.debug                 |   1 +
>  drivers/gpu/drm/Makefile                      |   4 +
>  drivers/gpu/drm/drm_fbdev_uma.c               | 203 +++++
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |   5 +-
>  drivers/gpu/drm/drm_gem_uma_helper.c          | 787 ++++++++++++++++++
>  drivers/gpu/drm/imagination/Kconfig           |   4 +-
>  drivers/gpu/drm/imagination/pvr_drv.c         |   2 +-
>  drivers/gpu/drm/imagination/pvr_free_list.c   |   2 +-
>  drivers/gpu/drm/imagination/pvr_gem.c         |  74 +-
>  drivers/gpu/drm/imagination/pvr_gem.h         |  12 +-
>  drivers/gpu/drm/lima/Kconfig                  |   4 +-
>  drivers/gpu/drm/lima/lima_drv.c               |   2 +-
>  drivers/gpu/drm/lima/lima_gem.c               |  30 +-
>  drivers/gpu/drm/lima/lima_gem.h               |   6 +-
>  drivers/gpu/drm/panfrost/Kconfig              |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 +-
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |   6 +-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |  30 +-
>  drivers/gpu/drm/panfrost/panfrost_mmu.c       |   8 +-
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
>  drivers/gpu/drm/panthor/Kconfig               |   2 +-
>  drivers/gpu/drm/panthor/panthor_drv.c         |   2 +-
>  drivers/gpu/drm/panthor/panthor_fw.c          |   4 +-
>  drivers/gpu/drm/panthor/panthor_gem.c         |  40 +-
>  drivers/gpu/drm/panthor/panthor_gem.h         |   8 +-
>  drivers/gpu/drm/panthor/panthor_mmu.c         |  10 +-
>  drivers/gpu/drm/panthor/panthor_sched.c       |   1 -
>  drivers/gpu/drm/tests/Makefile                |   1 +
>  drivers/gpu/drm/tests/drm_gem_uma_test.c      | 385 +++++++++
>  drivers/gpu/drm/v3d/Kconfig                   |   2 +-
>  drivers/gpu/drm/v3d/v3d_bo.c                  |  45 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                 |   4 +-
>  drivers/gpu/drm/v3d/v3d_mmu.c                 |   9 +-
>  drivers/gpu/drm/virtio/Kconfig                |   4 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |   4 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.h          |  12 +-
>  drivers/gpu/drm/virtio/virtgpu_object.c       |  64 +-
>  drivers/gpu/drm/virtio/virtgpu_plane.c        |   6 +-
>  drivers/gpu/drm/virtio/virtgpu_vq.c           |   6 +-
>  include/drm/drm_fbdev_uma.h                   |  20 +
>  include/drm/drm_gem_uma_helper.h              | 293 +++++++
>  62 files changed, 2018 insertions(+), 312 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_fbdev_uma.c
>  create mode 100644 drivers/gpu/drm/drm_gem_uma_helper.c
>  create mode 100644 drivers/gpu/drm/tests/drm_gem_uma_test.c
>  create mode 100644 include/drm/drm_fbdev_uma.h
>  create mode 100644 include/drm/drm_gem_uma_helper.h
> 
> 
> base-commit: 0a21e96e0b6840d2a4e0b45a957679eeddeb4362
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
> prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29
> prerequisite-patch-id: 0bbc85bc6b528c32592e07f4ceafa51795c4cad9
> prerequisite-patch-id: c856d9c8a026e3244c44ec829e426e0ad4a685ab
> prerequisite-patch-id: 13441c9ed3062ae1448a53086559dfcbbd578177
> prerequisite-patch-id: 951c039657c1f58e4b6e36bc01c7a1c69ed59767
> prerequisite-patch-id: 4370b8b803ca439666fb9d2beb862f6e78347ce3
> prerequisite-patch-id: ebbaad226ed599f7aad4784fb3f4aaebe34cb110
> prerequisite-patch-id: cb907c3e3e14de7f4d13b429f3a2a88621a8a9fe
> prerequisite-patch-id: 0e243b426742122b239af59e36d742da5795a8b1
> prerequisite-patch-id: 120f97fa1af9891375a0dcf52c51c1907b01fe6a

