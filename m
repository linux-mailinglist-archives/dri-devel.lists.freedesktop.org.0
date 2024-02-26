Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BE866BFB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 09:19:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BDA10EF48;
	Mon, 26 Feb 2024 08:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DfsvuGI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BEE10EF48
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:19:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BDC8F60CF7;
 Mon, 26 Feb 2024 08:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69163C433F1;
 Mon, 26 Feb 2024 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708935594;
 bh=++qqaqfH7Tvc28NkPjNcV7gIMmkiZbM59EPFnVGO7H0=;
 h=Date:From:To:Cc:Subject:From;
 b=DfsvuGI+U6+EOlcPMvbEatGlNNWuWqNAn3o3XyUrF8wb+lssVNimJUJ9s1x7c2sw+
 aNmiOzV8XJ/YKP30eg5QWryGFagZ/lwBSF6Mzhax1NSV+lvLpbfpHCFxMAc7ZpYy1k
 Ja7HTHzkuH7E02nLzFVKpOm2AfD4LtRVzvBUg1bK8qEpA6ktiAjp0CXrw5lRtzSiIX
 gRmTqVunG+maQgsSX+kDZaAD7On1eiJ8rS2wDtcmJ8TcuZnftHGI8re13Zi3gOa4EN
 H5l89MgjfttEcHEKl+yvfk3f9lX1rRmfChaWq30HZ1iWf09Z0A5zfl1eW5ZNNWlIhi
 SodyUeJia+i6Q==
Date: Mon, 26 Feb 2024 10:19:50 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Subject: [git pull] habanalabs for drm-next-6.9
Message-ID: <ZdxJprop0EniVQtf@ogabbay-vm-u22.habana-labs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave, Sima.

Habanalabs pull request for 6.9.

No uapi changes this time. Just minor features, improvements, code cleanups
and bug fixes. Also one small change in accel subsystem file.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 40d47c5fb4f2a7c1ef168598f01bdcbd31ba4038:

  Merge tag 'amd-drm-next-6.9-2024-02-19' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-02-22 13:21:19 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2024-02-26

for you to fetch changes up to 576d7cc5a9e29e4cc579ffb0f9afc209e34eea31:

  accel: constify the struct device_type usage (2024-02-26 09:59:18 +0200)

----------------------------------------------------------------
This tag contains habanalabs driver and accel changes for v6.9.

The notable changes are:

- New features and improvements:
  - Configure interrupt affinity according to NUMA nodes for the MSI-X interrupts that are
    assigned to the userspace application which acquires the device.
  - Move the HBM MMU page tables to reside inside the HBM to minimize latency when doing
    page-walks.
  - Improve the device reset mechanism when consecutive heartbeat failures occur (firmware
    fails to ack on heartbeat message).
  - Check also extended errors in the PCIe addr_dec interrupt information.
  - Rate limit the error messages that can be printed to dmesg log by userspace actions.

- Firmware related fixes:
  - Handle requests from firmware to reserve device memory

- Bug fixes and code cleanups:
  - constify the struct device_type usage in accel (accel_sysfs_device_minor).
  - Fix the PCI health check by reading uncached register.
  - Fix reporting of drain events.
  - Fix debugfs files permissions.
  - Fix calculation of DRAM BAR base address.

----------------------------------------------------------------
Avri Kehat (1):
      accel/habanalabs: fix debugfs files permissions

Colin Ian King (1):
      accel/habanalabs/goya: remove redundant assignment to pointer 'input'

Dani Liberman (3):
      accel/habanalabs/gaudi2: add interrupt affinity for user interrupts
      accel/habanalabs: remove call to deprecated function
      accel/habanalabs: fix error print

Erick Archer (1):
      accel/habanalabs: use kcalloc() instead of kzalloc()

Farah Kassabri (2):
      accel/habanalabs/gaudi2: move HMMU page tables to device memory
      accel/habanalabs: remove hop size from asic properties

Koby Elbaz (1):
      accel/habanalabs: increase HL_MAX_STR to 64 bytes to avoid warnings

Malkoot Khan (1):
      accel/habanalabs: Remove unnecessary braces from if statement

Ofir Bitton (3):
      accel/habanalabs/gaudi2: drain event lacks rd/wr indication
      accel/habanalabs/hwmon: rate limit errors user can generate
      accel/habanalabs: modify pci health check

Ricardo B. Marliere (1):
      accel: constify the struct device_type usage

Tal Risin (1):
      accel/habanalabs: initialize maybe-uninitialized variables

Tomer Tayar (8):
      accel/habanalabs: fix DRAM BAR base address calculation
      accel/habanalabs: abort device reset for consecutive heartbeat failures
      accel/habanalabs/gaudi2: fail memory memset when failing to copy QM packet to device
      accel/habanalabs: modify print for skip loading linux FW to debug log
      accel/habanalabs/gaudi2: check extended errors according to PCIe addr_dec interrupt info
      accel/habanalabs: fix glbl error cause handling
      accel/habanalabs: handle reserved memory request when working with full FW
      accel/habanalabs: keep explicit size of reserved memory for FW

 drivers/accel/drm_accel.c                          |   2 +-
 .../accel/habanalabs/common/command_submission.c   |   3 +-
 drivers/accel/habanalabs/common/debugfs.c          |  18 +-
 drivers/accel/habanalabs/common/device.c           |  55 +++-
 drivers/accel/habanalabs/common/firmware_if.c      |  25 +-
 drivers/accel/habanalabs/common/habanalabs.h       |  43 ++-
 drivers/accel/habanalabs/common/hw_queue.c         |  17 +
 drivers/accel/habanalabs/common/hwmon.c            |  29 +-
 drivers/accel/habanalabs/common/mmu/Makefile       |   2 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          | 223 ++++++++++++-
 drivers/accel/habanalabs/common/mmu/mmu_v1.c       | 354 +++------------------
 drivers/accel/habanalabs/common/mmu/mmu_v2.c       | 338 ++++++++++++++++++++
 drivers/accel/habanalabs/common/mmu/mmu_v2_hr.c    |  24 +-
 drivers/accel/habanalabs/common/security.c         |  33 +-
 drivers/accel/habanalabs/common/security.h         |   3 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |   9 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 308 ++++++++++++------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |  15 +-
 drivers/accel/habanalabs/goya/goya.c               |  12 +-
 drivers/accel/habanalabs/goya/goya_coresight.c     |   3 +-
 .../habanalabs/include/hw_ip/mmu/mmu_general.h     |   2 +
 21 files changed, 1008 insertions(+), 510 deletions(-)
 create mode 100644 drivers/accel/habanalabs/common/mmu/mmu_v2.c
