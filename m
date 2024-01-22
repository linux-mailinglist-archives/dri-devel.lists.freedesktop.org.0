Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F475836AA8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93AC10F5B7;
	Mon, 22 Jan 2024 16:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487310F59E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705941049;
 bh=9c4Ipuz72ru9BB+H+rgOS9/5TTKic0d7VUV5jMAfq14=;
 h=From:To:Cc:Subject:Date:From;
 b=GD7ED5qwrSxeM93uyWxA+0gIbbTlhmh6MY9sIMP6MBjItNCsoccaXwCxESxbBPo9t
 yy09SwU+VDFd/Psy2lGIcS7OAE37IX4o4A7Xia6/V1Avb7XT1rIqD24XbZcgSlwWx/
 0h4XqIkuovgGX62Ixx9Deu09hC2yQzm8a9VUnurqR72YROQrYrAHMYVRwErqtg6hp0
 QvKM77+Ie1ky7+/4aUW76mjP6FTmmWfYdr8kWBSFPcsMLt+0BKOx0F9Gzd+v5MqVdi
 K3ti2zhlHPTD2M+AvwDIQvLLHCrn37Pad2YnlvumEaX2siIZaR0kd8P2Ye9e1BCS2L
 inN+Ohm5oj80g==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CD09737813B5;
 Mon, 22 Jan 2024 16:30:48 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
Date: Mon, 22 Jan 2024 17:30:31 +0100
Message-ID: <20240122163047.1954733-1-boris.brezillon@collabora.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is the 4th version of the kernel driver for Mali CSF-based GPUs.

A branch based on drm-misc-next and containing all the dependencies
that are not yet available in drm-misc-next here[1], and another [2]
containing extra patches to have things working on rk3588. The CSF
firmware binary can be found here[3], and should be placed under
/lib/firmware/arm/mali/arch10.8/mali_csffw.bin.

The mesa MR adding v10 support on top of panthor is available here [4].

Steve, I intentionally dropped your R-b on "drm/panthor: Add the heap
logical block" and "drm/panthor: Add the scheduler logical block"
because the tiler-OOM handling changed enough to require a new review
IMHO.

Regarding the GPL2+MIT relicensing, I collected Clément's R-b for the
devfreq code, but am still lacking Alexey Sheplyakov for some bits in
panthor_gpu.c. The rest of the code is either new, or covered by the
Linaro, Arm and Collabora acks.

And here is a non-exhaustive changelog, check each commit for a detailed
changelog.

v4:
- Fix various bugs in the VM logic
- Address comments from Steven, Liviu, Ketil and Chris
- Move tiler OOM handling out of the scheduler interrupt handling path
  so we can properly recover when the system runs out of memory, and
  panthor is blocked trying to allocate heap chunks
- Rework the heap locking to support concurrent chunk allocation. Not
  sure if this is supposed to happen, but we need to be robust against
  userspace passing the same heap context to two scheduling groups.
  Wasn't needed before the tiler_oom rework, because heap allocation
  base serialized by the scheduler lock.
- Make kernel BO destruction robust to NULL/ERR pointers

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

[1]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v4
[2]https://gitlab.freedesktop.org/panfrost/linux/-/tree/panthor-v4+rk3588
[3]https://gitlab.com/firefly-linux/external/libmali/-/raw/firefly/firmware/g610/mali_csffw.bin
[4]https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26358

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
 drivers/gpu/drm/panthor/panthor_device.c      |  544 +++
 drivers/gpu/drm/panthor/panthor_device.h      |  393 ++
 drivers/gpu/drm/panthor/panthor_drv.c         | 1470 +++++++
 drivers/gpu/drm/panthor/panthor_fw.c          | 1334 +++++++
 drivers/gpu/drm/panthor/panthor_fw.h          |  504 +++
 drivers/gpu/drm/panthor/panthor_gem.c         |  228 ++
 drivers/gpu/drm/panthor/panthor_gem.h         |  144 +
 drivers/gpu/drm/panthor/panthor_gpu.c         |  482 +++
 drivers/gpu/drm/panthor/panthor_gpu.h         |   52 +
 drivers/gpu/drm/panthor/panthor_heap.c        |  596 +++
 drivers/gpu/drm/panthor/panthor_heap.h        |   39 +
 drivers/gpu/drm/panthor/panthor_mmu.c         | 2760 +++++++++++++
 drivers/gpu/drm/panthor/panthor_mmu.h         |  102 +
 drivers/gpu/drm/panthor/panthor_regs.h        |  239 ++
 drivers/gpu/drm/panthor/panthor_sched.c       | 3500 +++++++++++++++++
 drivers/gpu/drm/panthor/panthor_sched.h       |   48 +
 include/uapi/drm/panthor_drm.h                |  945 +++++
 26 files changed, 13892 insertions(+)
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

