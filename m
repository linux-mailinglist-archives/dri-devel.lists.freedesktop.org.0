Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0C6C19F7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9FA10E5D4;
	Mon, 20 Mar 2023 15:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65CD10E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:40:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 470FE615B5;
 Mon, 20 Mar 2023 15:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161A9C4339B;
 Mon, 20 Mar 2023 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679326831;
 bh=OypbbCk6/Jyiq1/dB5l1hHVuJiiIKIwkUNds1mOoCGw=;
 h=Date:From:To:Cc:Subject:From;
 b=fZGn+Cdt84Fq6Abguk13gw/5sqBxwpvjGfVk+pGgcJact5uWvoGuc856Iz4lHGuzk
 7pclZdZ2ms17W/9QLlbzTRe1hwIuvgptVSp8ySdAAa2MzhHTK37+UFxXjmkR7VYEVq
 Rupkb20Rj9Zu46WV+Jj3Ma26sc4p/gqjgoPNGLh8FpTGwfzos8fMisGIikdVOAgR+f
 ULlehfH1VBWHYDQWkMZSPIxN2iw/qpn/Li/nL+r1KroU+OLzn6k2oOzzvm3Azihpw9
 7bUAGIv9Bv271hgE3t0MqkCo6MXn66fyGjkXuIh9wsad3Vnbn+BBNLRh3yI3YZU6Dy
 nmD9DH1O2boOQ==
Date: Mon, 20 Mar 2023 17:40:26 +0200
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs for drm-next-6.4
Message-ID: <20230320154026.GA766126@ogabbay-vm-u20.habana-labs.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel.

First pull request for 6.4.

Changes are all over the place - new uAPI, new features, optimizations, bug
fixes, cleanups, etc.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 8bf6e20253b2d2b614f2c0b491f840e956fa6b05:

  Merge tag 'drm-intel-next-2023-03-07' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-03-15 14:59:31 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-03-20

for you to fetch changes up to 75b445753047872a69709cfba7e3939660f0ecc1:

  accel/habanalabs: remove redundant TODOs (2023-03-20 17:35:34 +0200)

----------------------------------------------------------------
This tag contains habanalabs driver and accel changes for v6.4:

- uAPI changes:

  - Add opcodes to the CS ioctl to allow user to stall/resume specific engines
    inside Gaudi2. This is to allow the user to perform power
    testing/measurements when training different topologies.

  - Expose in the INFO ioctl the amount of device memory that the driver
    and f/w reserve for themselves.

  - Expose in the INFO ioctl a bit-mask of the available rotator engines
    in Gaudi2. This is to align with other engines that are already exposed.

  - Expose in the INFO ioctl the register's address of the f/w that should
    be used to trigger interrupts from within the user's code running in the
    compute engines.

  - Add a critical-event bit in the eventfd bitmask so the user will know the
    event that was received was critical, and a reset will now occur

  - Expose in the INFO ioctl two new opcodes to fetch information on h/w and
    f/w events. The events recorded are the events that were reported in the
    eventfd.

- New features and improvements:

  - Add a dedicated interrupt ID in MSI-X in the device to the notification of
    an unexpected user-related event in Gaudi2. Handle it in the driver by
    reporting this event.

  - Allow the user to fetch the device memory current usage even when the
    device is undergoing compute-reset (a reset type that only clears the
    compute engines).

  - Enable graceful reset mechanism for compute-reset. This will give the
    user a few seconds before the device is reset. For example, the user can,
    during that time, perform certain device operations (dump data for debug)
    or close the device in an orderly fashion.

  - Align the decoder with the rest of the engines in regard to notification
    to the user about interrupts and in regard to performing graceful reset
    when needed (instead of immediate reset).

  - Add support for assert interrupt from the TPC engine.

  - Get the reset type that is necessary to perform per event from the
    auto-generated irq_map array.

  - Print the specific reason why a device is still in use when notifying to
    the user about it (after the user closed the device's FD).

  - Move to threaded IRQ when handling interrupts of workload completions.

- Firmware related fixes:

  - Fix RAZWI event handler to match newest f/w version.

  - Read error cause register in dma core events because the f/w doesn't
    do that.

  - Increase maximum time to wait for completion of Gaudi2 reset due to f/w
    bug.

  - Align to the latest firmware specs.

- Enforce the release order of the compute device and dma-buf.
  i.e increment the device file refcount for any dma-buf that was exported
  for that device. This will make sure the compute device release function
  won't be called until the user closes all the FDs of the relevant
  dma-bufs. Without this change, closing the device's FD before/without
  closing the dma-buf's FD would always lead to hard-reset of the device.

- Fix a link in the drm documentation to correctly point to the accel section.

- Compilation warnings cleanups

- Misc bug fixes and code cleanups

----------------------------------------------------------------
Bagas Sanjaya (1):
      accel: Link to compute accelerator subsystem intro

Bjorn Helgaas (1):
      accel/habanalabs: Drop redundant pci_enable_pcie_error_reporting()

Colin Ian King (1):
      accel/habanalabs: Fix spelling mistake "maped" -> "mapped"

Dafna Hirschfeld (12):
      accel/habanalabs: tiny refactor of hl_device_reset for readability
      accel/habanalabs: in hl_device_reset remove 'hard_instead_of_soft'
      accel/habanalabs: in hl_device_reset small refactor for readabilty
      accel/habanalabs: don't trace cpu accessible dma alloc/free
      accel/habanalabs: change hw_fini to return int to indicate error
      accel/habanalabs: assert return value of hw_fini
      accel/habanalabs: allow getting HL_INFO_DRAM_USAGE during soft-reset
      accel/habanalabs: unify err log of hw-fini failure in dirty state
      accel/habanalabs: move soft-reset wait to soft-reset execute
      accel/habanalabs: in hw_fini return error code if polling timed-out
      accel/habanalabs: fix use of var reset_sleep_ms
      accel/habanalabs: in {e/p}dma_core events read the err cause reg

Dani Liberman (3):
      accel/habanalabs: fix address decode RAZWI handling
      accel/habanalabs: fix page fault event clear
      accel/habanalabs: change razwi handle after fw fix

Koby Elbaz (12):
      accel/habanalabs: capture RAZWI info only if HW indication detected
      accel/habanalabs: unsecure CFG_TPC_ID register
      accel/habanalabs: disable PCI when escalating compute to hard-reset
      accel/habanalabs: rename security function parameters
      accel/habanalabs: break is_idle function into per-engine sub-routines
      accel/habanalabs: verify return code after scrubbing ARCs DCCMs
      accel/habanalabs: remove a useless is_idle TPC flag
      accel/habanalabs: fix register address on PDMA/EDMA idle check
      accel/habanalabs: use a mutex rather than a spinlock
      accel/habanalabs: add uapi to stall/resume engine
      accel/habanalabs: do not verify engine modes after being changed
      accel/habanalabs: return tlb inv error code upon failure

Moti Haimovski (2):
      accel/habanalabs: add critical-event bit in notifier
      accel/habanalabs: minimize error prints when mem map fails

Oded Gabbay (6):
      accel/habanalabs: split cdev creation to separate function
      accel/habanalabs: save class in hdev
      accel/habanalabs: refactor debugfs init
      accel/habanalabs: make gaudi2_is_device_idle() static
      accel/habanalabs: align to latest firmware specs
      accel/habanalabs: fix field names in hl_info_hw_ip_info

Ofir Bitton (9):
      accel/habanalabs: increase user interrupt grace time
      accel/habanalabs: expose engine core int reg address
      accel/habanalabs: capture interrupt timestamp in handler
      accel/habanalabs: add support for TPC assert
      accel/habanalabs: increase reset poll timeout
      accel/habanalabs: expose dram reserved size by kmd
      accel/habanalabs: expose rotator mask to userspace
      accel/habanalabs: add handling for unexpected user event
      accel/habanalabs: remove redundant TODOs

Ohad Sharabi (3):
      accel/habanalabs: get reset type indication from irq_map
      accel/habanalabs: modify events reset policy
      accel/habanalabs: regenerate gaudi2 ids_map_extended

Sagiv Ozeri (2):
      accel/habanalabs: organize hl_device structure comment
      accel/habanalabs: add device id to all threads names

Tal Cohen (1):
      accel/habanalabs: change user interrupt to threaded IRQ

Tom Rix (2):
      accel/habanalabs: change unused extern decl of hdev to forward decl of hl_device
      accel/habanalabs: set hl_capture_*_err storage-class-specifier to static

Tomer Tayar (15):
      accel/habanalabs: use memhash_node_export_put() in hl_release_dmabuf()
      accel/habanalabs: add info when FD released while device still in use
      accel/habanalabs: enforce release order of compute device and dma-buf
      accel/habanalabs: enable graceful reset mechanism for compute-reset
      accel/habanalabs: fix print in hl_irq_handler_eq()
      accel/habanalabs: remove hl_irq_handler_default()
      accel/habanalabs: improve readability of engines idle mask print
      accel/habanalabs: remove unneeded irq_handler variable
      accel/habanalabs: add helper function to get vm hash node
      accel/habanalabs: use notifications and graceful reset for decoder
      accel/habanalabs: use scnprintf() in print_device_in_use_info()
      accel/habanalabs: postpone mem_mgr IDR destruction to hpriv_release()
      accel/habanalabs: remove '\n' when passing strings to gaudi2_print_event()
      accel/habanalabs: fix a maybe-uninitialized compilation warnings
      accel/habanalabs: fix a missing-braces compilation warning

farah kassabri (1):
      accel/habanalabs: fix few misspelled words in the code

 .../accel/habanalabs/common/command_submission.c   |  130 +-
 drivers/accel/habanalabs/common/debugfs.c          |  142 +-
 drivers/accel/habanalabs/common/decoder.c          |   22 +-
 drivers/accel/habanalabs/common/device.c           |  315 +-
 drivers/accel/habanalabs/common/firmware_if.c      |    2 +-
 drivers/accel/habanalabs/common/habanalabs.h       |  129 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   14 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |   60 +-
 drivers/accel/habanalabs/common/irq.c              |   73 +-
 drivers/accel/habanalabs/common/memory.c           |  133 +-
 drivers/accel/habanalabs/common/memory_mgr.c       |   15 +-
 drivers/accel/habanalabs/common/mmu/mmu.c          |    6 +-
 drivers/accel/habanalabs/common/security.c         |    6 +-
 drivers/accel/habanalabs/common/security.h         |    2 +-
 drivers/accel/habanalabs/gaudi/gaudi.c             |   65 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 1543 ++++--
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |    9 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |    2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_masks.h     |    3 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |    1 +
 drivers/accel/habanalabs/goya/goya.c               |   21 +-
 drivers/accel/habanalabs/include/common/cpucp_if.h |    9 +-
 .../accel/habanalabs/include/common/hl_boot_if.h   |   47 +-
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |    5 +
 drivers/accel/habanalabs/include/gaudi2/gaudi2.h   |    2 +
 .../include/gaudi2/gaudi2_async_events.h           |    4 +-
 .../include/gaudi2/gaudi2_async_ids_map_extended.h | 5294 ++++++++++----------
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |    5 +-
 include/drm/drm_file.h                             |    3 +-
 include/uapi/drm/habanalabs_accel.h                |  102 +-
 30 files changed, 4541 insertions(+), 3623 deletions(-)
