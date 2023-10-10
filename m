Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069007BF7F7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 11:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30E910E1BE;
	Tue, 10 Oct 2023 09:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4267010E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 09:55:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A60516159B;
 Tue, 10 Oct 2023 09:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F12C433C7;
 Tue, 10 Oct 2023 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696931726;
 bh=jBV5y4uEArflcPi3KjsalgYFx5L6UgWk4fNoDhi6KZY=;
 h=Date:From:To:Cc:Subject:From;
 b=HrcHwyYgw3OwH69eSi6foBg9n0dCjc34ecb3bye4wI2AOmyxU/CwnYyQZVuUvxUfd
 ny3nTFm65ETaNoUeIi7ORimSJjA9hG1inUvRDQm14vx/n0YNDK4w+C67WO4oAYnrRw
 6pmuRAzclDiJIT/XRGZybvXrWGulNI+KWneZsWXXQDa9hU6JjI50IU4A8dDePVECjO
 XB6xJ7xEOy5E18KXwkR4LCf8F6lMrAY+kbM/OXvqvojGAeyf468L14lPNxgnYwTSEH
 sfve2pFg5I2j8pwMiKjXZZ27q7j0LDlkF073KsIZgoq/hC7Sz7HiByID0OtdlS6BE9
 koxNKFHEXNTJA==
Date: Tue, 10 Oct 2023 12:55:21 +0300
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs for drm-next-6.7
Message-ID: <ZSUfiX4J7v4Wn0cU@ogabbay-vm-u22.habana-labs.com>
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

Habanalabs pull request for 6.7.

It's a bit all over the place, a few uapi changes, mostly improvements and
bug fixes.

Notable things are the move to the accel subsystem in the code itself,
meaning we removed the habanalabs class and the code to created device char
and instead we are registering to accel. Also notable is moving some
firmware interface files to include/linux/habanalabs. This is needed as
a pre-requisite for upstreaming the Gaudi2 NIC drivers, which will include
those files.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 389af786f92ecdff35883551d54bf4e507ffcccb:

  Merge tag 'drm-intel-next-2023-09-29' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2023-10-04 13:55:19 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-10-10

for you to fetch changes up to 4db74c0fdeb8138f6438d42a015c5dcdb2e6874c:

  accel/habanalabs/gaudi2: fix spmu mask creation (2023-10-09 12:37:24 +0300)

----------------------------------------------------------------
This tag contains habanalabs driver changes for v6.7.

The notable changes are:

- uAPI changes:
  - Expose tsc clock sampling to better sync clock information in profiler.
  - Enhance engine error reporting in the info ioctl.
  - Block access to the eventfd operations through the control device.
  - Disable the option of the user to register multiple times with the same
    offset for timestamp dump by the driver. If a user wants to use the same
    offset in the timestamp buffer for different interrupt, it needs to first
    de-register the offset.
  - When exporting dma-buf (for p2p), force the user to specify size/offset
    in multiples of PAGE_SIZE. This is instead of the driver doing the
    rounding to PAGE_SIZE, which has caused the driver to map more memory
    than was intended by the user.

- New features and improvements:
  - Complete the move of the driver to the accel subsystem by removing the
    custom habanalabs class and major and registering to accel subsystem.
  - Move the firmware interface files to include/linux/habanalabs. This is
    a pre-requisite for upstreaming the NIC drivers of Gaudi (as they need to
    include those files).
  - Perform device hard-reset upon PCIe AXI drain event to prevent the failure
    from cascading to different IP blocks in the SoC. In secured environments,
    this is done automatically by the firmware.
  - Print device name when it is removed for better debuggability.
  - Add support for trace of dma map sgtable operations.
  - Optimize handling of user interrupts by splitting the interrupts to two
    lists. One list for fast handling and second list for handling with
    timestamp recording, which is slower.
  - Prevent double device hard-reset due to 2 adjacent H/W events.
  - Set device status 'malfunction' while in rmmod.

- Firmware related fixes:
  - Extend preboot timeout because preboot loading might take longer than
    expected in certain cases.
  - Add a protection mechanism for the Event Queue. In case it is full, the
    firmware will be able to notify about it through a dedicated interrupt.
  - Perform device hard-reset in case scrubbing of memory has failed.

- Bug fixes and code cleanups:
  - Small fixes of dma-buf handling in Gaudi2, such as handling an offset != 0,
    using the correct exported size, creation of sg table.
  - Fix spmu mask creation.
  - Fix bug in wait for cs completion for decoder workloads.
  - Cleanup Greco name from documentation.
  - Fix bug in recording timestamp during cs completion interrupt handling.
  - Fix CoreSight ETF configuration and flush logic.
  - Fix small bug in hpriv_list handling (the list that contains the private
    data per process that opens our device).

----------------------------------------------------------------
Ariel Suller (1):
      accel/habanalabs: update boot status print

Arnd Bergmann (1):
      accel/habanalabs: add missing debugfs function stubs

Benjamin Dotan (3):
      accel/habanalabs/gaudi2 : remove psoc_arc access
      accel/habanalabs: fix ETR/ETF flush logic
      accel/habanalabs: improve etf configuration

Christophe JAILLET (1):
      accel/habanalabs/gaudi2: Fix incorrect string length computation in gaudi2_psoc_razwi_get_engines()

Dafna Hirschfeld (5):
      accel/habanalabs: disable events ioctls on control device
      accel/habanalabs: fix inline doc typos
      accel/habanalabs: add fw status SHUTDOWN_PREP
      accel/habanalabs: extend preboot timeout when preboot might take longer
      accel/habanalabs: remove wrong doc for init_phys_pg_pack_from_userptr

Dani Liberman (2):
      accel/habanalabs: handle arc farm razwi
      accel/habanalabs: handle f/w reserved dram space request

David Meriin (1):
      accel/habanalabs: move cpucp interface to linux/habanalabs

Hen Alon (1):
      accel/habanalabs: add tsc clock sampling to clock sync info

Igor Grinberg (2):
      accel/habanalabs/gaudi2: prepare to remove soft_rst_irq
      accel/habanalabs/gaudi2: prepare to remove cpu_rst_status

Ivan Orlov (1):
      accel: make accel_class a static const structure

Juerg Haefliger (1):
      accel/habanalabs/gaudi: Add MODULE_FIRMWARE macros

Justin Stitt (2):
      accel/habanalabs: refactor deprecated strncpy to strscpy_pad
      accel/habanalabs: refactor deprecated strncpy

Koby Elbaz (4):
      accel/habanalabs: set device status 'malfunction' while in rmmod
      accel/habanalabs: print return code when process termination fails
      accel/habanalabs: call put_pid after hpriv list is updated
      accel/habanalabs: rename fd_list to hpriv_list

Moti Haimovski (1):
      accel/habanalabs/gaudi2: print power-mode changes

Oded Gabbay (14):
      accel/habanalabs: remove pdev check on idle check
      accel/habanalabs: reset device if scrubbing failed
      accel/habanalabs/gaudi2: fix missing check of kernel ctx
      accel/habanalabs: remove unused asic functions
      accel/habanalabs: minor cosmetics update to cpucp_if.h
      accel/habanalabs: minor cosmetics update to trace file
      accel/habanalabs: change Greco to Gaudi2
      accel/habanalabs/gaudi: remove unused structure definition
      accel/habanalabs: remove unused field
      accel/habanalabs: print device name when it is removed
      accel/habanalabs: remove leftover code
      accel/habanalabs/gaudi: remove define used for simulator
      accel/habanalabs: minor cosmetic update to habanalabs.h
      accel/habanalabs/gaudi2: fix spmu mask creation

Ofir Bitton (6):
      accel/habanalabs: notify user about undefined opcode event
      accel/habanalabs: stop fetching MME SBTE error cause
      accel/habanalabs: dump temperature threshold boot error
      accel/habanalabs/gaudi2: unsecure tpc count registers
      accel/habanalabs: add info ioctl for engine error reports
      accel/habanalabs/gaudi2: include block id in ECC error reporting

Ohad Sharabi (2):
      accel/habanalabs: add traces for dma mappings
      accel/habanalabs: trace dma map sgtable

Tomer Tayar (19):
      accel/habanalabs: prevent immediate hard reset due to 2 adjacent H/W events
      accel/habanalabs: update pending reset flags with new reset requests
      accel/habanalabs: print task name and request code upon ioctl failure
      accel/habanalabs: print task name upon creation of a user context
      accel/habanalabs/gaudi2: un-secure register for engine cores interrupt
      accel/habanalabs: set default device release watchdog T/O as 30 sec
      accel/habanalabs: register compute device as an accel device
      accel/habanalabs: update sysfs-driver-habanalabs with the accel path
      accel/habanalabs: update debugfs-driver-habanalabs with the accel path
      accel/habanalabs: Move ioctls to the device specific ioctls range
      accel/habanalabs: always pass exported size to alloc_sgt_from_device_pages()
      accel/habanalabs: use exported size from dma_buf and not from phys_pg_pack
      accel/habanalabs: export dma-buf only if size/offset multiples of PAGE_SIZE
      accel/habanalabs: tiny refactor of hl_map_dmabuf()
      accel/habanalabs: fix SG table creation for dma-buf mapping
      accel/habanalabs: set hl_dmabuf_priv.device_address only when needed
      accel/habanalabs: add missing offset handling for dma-buf
      accel/habanalabs: add debug prints to dump content of SG table for dma-buf
      accel/habanalabs/gaudi2: perform hard-reset upon PCIe AXI drain event

farah kassabri (10):
      accel/habanalabs: fix standalone preboot descriptor request
      accel/habanalabs: Allow single timestamp registration request at a time
      accel/habanalabs: fix wait_for_interrupt abortion flow
      accel/habanalabs/gaudi2: handle eq health heartbeat check
      accel/habanalabs/gaudi2: add eq health check using irq
      accel/habanalabs: prevent sending heartbeat before events are enabled
      accel/habanalabs: fix bug in timestamp interrupt handling
      accel/habanalabs: optimize timestamp registration handler
      accel/habanalabs: split user interrupts pending list
      accel/habanalabs: fix bug in decoder wait for cs completion

 .../ABI/testing/debugfs-driver-habanalabs          |  82 ++--
 Documentation/ABI/testing/sysfs-driver-habanalabs  |  64 +--
 MAINTAINERS                                        |   1 +
 drivers/accel/drm_accel.c                          |  21 +-
 drivers/accel/habanalabs/common/command_buffer.c   |   5 +-
 .../accel/habanalabs/common/command_submission.c   | 488 ++++++++++++---------
 drivers/accel/habanalabs/common/context.c          |   9 +-
 drivers/accel/habanalabs/common/debugfs.c          |  22 +-
 drivers/accel/habanalabs/common/device.c           | 425 +++++++++++-------
 drivers/accel/habanalabs/common/firmware_if.c      |  45 +-
 drivers/accel/habanalabs/common/habanalabs.h       | 212 +++++----
 drivers/accel/habanalabs/common/habanalabs_drv.c   | 186 ++++----
 drivers/accel/habanalabs/common/habanalabs_ioctl.c | 112 +++--
 drivers/accel/habanalabs/common/irq.c              | 180 ++++++--
 drivers/accel/habanalabs/common/memory.c           | 308 +++++++------
 drivers/accel/habanalabs/gaudi/gaudi.c             |  17 +-
 drivers/accel/habanalabs/gaudi/gaudiP.h            |   2 +-
 drivers/accel/habanalabs/gaudi/gaudi_coresight.c   |  12 +
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 487 ++++++++++++++++----
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |   4 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_coresight.c |  46 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |  21 +-
 drivers/accel/habanalabs/goya/goya.c               |  10 +-
 drivers/accel/habanalabs/goya/goyaP.h              |   2 +-
 drivers/accel/habanalabs/goya/goya_coresight.c     |  10 +
 .../accel/habanalabs/include/gaudi/gaudi_fw_if.h   |  32 --
 .../include/gaudi2/gaudi2_async_events.h           |   7 +
 .../include/gaudi2/gaudi2_async_ids_map_extended.h |  16 +-
 .../common => include/linux/habanalabs}/cpucp_if.h |  36 +-
 .../linux/habanalabs}/hl_boot_if.h                 |   7 +
 include/trace/events/habanalabs.h                  |  45 +-
 include/uapi/drm/habanalabs_accel.h                |  68 +--
 32 files changed, 1919 insertions(+), 1063 deletions(-)
 rename {drivers/accel/habanalabs/include/common => include/linux/habanalabs}/cpucp_if.h (98%)
 rename {drivers/accel/habanalabs/include/common => include/linux/habanalabs}/hl_boot_if.h (98%)
