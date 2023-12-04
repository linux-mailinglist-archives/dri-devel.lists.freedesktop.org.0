Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE6803B91
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239B910E0D7;
	Mon,  4 Dec 2023 17:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41C210E011
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:33:20 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 57B6766022D0;
 Mon,  4 Dec 2023 17:33:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701711199;
 bh=aJ209yCfkmpoN+NF39TsuQk1kC/ywCSR6OGyvuhTjB4=;
 h=From:To:Cc:Subject:Date:From;
 b=e5Sw3f08/RxA1PYbFb8cnw2i2lfZVoVDWNsoQiAHI/cfff671kCGqhXlNLBqnxESv
 wnbYqKvvhnBKHhyTlgC9wUD2VwBSnOOB7O1bSHiCaTdwEMNblZUpaNZv+MoeRjOKmx
 NtQUAwxdje1iRp7KhU9bQF+G6OXWhDWjm1NX8QOGvB2P8zI7SSWUcvyRpQGCbQhkOX
 DUOUqaVMaLCWpa0TtzY0Fiau2oEMfAyU0n54bxX/wFc0s/SuizqfyZsjBrmjXS+paK
 0N/TmQYPzatE4nsKP+QW5FRUI4el7UtSw6DudhJ+/ZRZSTf47LGOVvfyc43pfatsPD
 dpdNrbOnVPkTg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/14] drm: Add a driver for CSF-based Mali GPUs
Date: Mon,  4 Dec 2023 18:32:53 +0100
Message-ID: <20231204173313.2098733-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is the 3rd version of the kernel driver for Mali CSF-based GPUs.

With all the DRM dependencies being merged (drm-sched single entity and
drm_gpuvm), I thought now was a good time to post a new version. Note
that the iommu series we depend on [1] has been merged recently. The
only remaining dependency that hasn't been merged yet is this rather
trival drm_gpuvm [2] patch.

As for v2, I pushed a branch based on drm-misc-next and containing
all the dependencies that are not yet available in drm-misc-next
here[3], and another [4] containing extra patches to have things
working on rk3588. The CSF firmware binary can be found here[5], and
should be placed under /lib/firmware/arm/mali/arch10.8/mali_csffw.bin.

The mesa MR adding v10 support on top of panthor is available here [6].

Regarding the GPL2+MIT relicensing, Liviu did an audit and found two
more people that I didn't spot initially: Clément Péron for the devfreq
code, and Alexey Sheplyakov for some bits in panthor_gpu.c. Both are
Cc-ed on the relevant patches. The rest of the code is either new, or
covered by the Linaro, Arm and Collabora acks.

And here is a non-exhaustive changelog, check each commit for a detailed
changelog.

v3;
- Quite a few changes at the MMU/sched level to make the fix some
  race conditions and deadlocks
- Addition of the a sync-only VM_BIND operation (to support
  vkQueueSparseBind with zero commands).
- Addition of a VM_GET_STATE ioctl
- Various cosmetic changes (see the commit changelogs for more details)
- Various fixes (see the commit changelogs for more details)

v2:
- Rename the driver (pancsf -> panthor)
- Split the commit adding the driver to ease review
- Use drm_sched for dependency tracking/job submission
- Add a VM_BIND ioctl
- Add the concept of exclusive VM for BOs that are only ever mapped to a
  single VM
- Document the code and uAPI
- Add a DT binding doc

Regards,

Boris

[1]https://lore.kernel.org/linux-arm-kernel/20231124142434.1577550-1-boris.brezillon@collabora.com/T/
[2]https://patchwork.freedesktop.org/patch/570380/
[3]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3
[4]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v3+rk3588
[5]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmware/g610/mali_csffw.bin
[6]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358

Boris Brezillon (13):
  drm/panthor: Add uAPI
  drm/panthor: Add GPU register definitions
  drm/panthor: Add the device logical block
  drm/panthor: Add the GPU logical block
  drm/panthor: Add GEM logical block
  drm/panthor: Add the devfreq logical block
  drm/panthor: Add the MMU/VM logical block
  drm/panthor: Add the FW logical block
  drm/panthor: Add the heap logical block
  drm/panthor: Add the scheduler logical block
  drm/panthor: Add the driver frontend block
  drm/panthor: Allow driver compilation
  drm/panthor: Add an entry to MAINTAINERS

Liviu Dudau (1):
  dt-bindings: gpu: mali-valhall-csf: Add support for Arm Mali CSF GPUs

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  147 +
 Documentation/gpu/driver-uapi.rst             |    5 +
 MAINTAINERS                                   |   11 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/panthor/Kconfig               |   23 +
 drivers/gpu/drm/panthor/Makefile              |   15 +
 drivers/gpu/drm/panthor/panthor_devfreq.c     |  283 ++
 drivers/gpu/drm/panthor/panthor_devfreq.h     |   25 +
 drivers/gpu/drm/panthor/panthor_device.c      |  497 +++
 drivers/gpu/drm/panthor/panthor_device.h      |  381 ++
 drivers/gpu/drm/panthor/panthor_drv.c         | 1454 +++++++
 drivers/gpu/drm/panthor/panthor_fw.c          | 1332 +++++++
 drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
 drivers/gpu/drm/panthor/panthor_gem.c         |  227 ++
 drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
 drivers/gpu/drm/panthor/panthor_gpu.c         |  481 +++
 drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
 drivers/gpu/drm/panthor/panthor_heap.c        |  517 +++
 drivers/gpu/drm/panthor/panthor_heap.h        |   36 +
 drivers/gpu/drm/panthor/panthor_mmu.c         | 2653 +++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h         |  101 +
 drivers/gpu/drm/panthor/panthor_regs.h        |  237 ++
 drivers/gpu/drm/panthor/panthor_sched.c       | 3410 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
 include/uapi/drm/panthor_drm.h                |  892 +++++
 26 files changed, 13478 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
 create mode 100644 drivers/gpu/drm/panthor/Kconfig
 create mode 100644 drivers/gpu/drm/panthor/Makefile
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_device.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_device.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_drv.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gem.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_gpu.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_heap.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_mmu.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_regs.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_sched.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_sched.h
 create mode 100644 include/uapi/drm/panthor_drm.h

-- 
2.43.0

