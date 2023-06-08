Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F7727CD8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 12:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3410E5B1;
	Thu,  8 Jun 2023 10:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FFB10E5B1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 10:30:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01BA261778;
 Thu,  8 Jun 2023 10:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEACC433EF;
 Thu,  8 Jun 2023 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686220248;
 bh=AIcUCUodS6F4QcEhJCLrF01g4EKFhRYJxgN/H52FebY=;
 h=Date:From:To:Cc:Subject:From;
 b=lQJ9fY7gKIjqidoDN3FfowD4WCilJ3wYrX8Xl0HNU4sJuTPF5UqgXPLBu7oLu+/QF
 evbmLbfMn+DaJUA1y5V2UlKFn3sRwnwi1IJgK+Kola70OptCqV33knlKG63M7jIc9I
 aIZZDLdETXYSeyftC9gamjLYx9GhSDqaDMk1HPCN3FAbBYk/lIw+kIjYyI55mSSa9a
 LKt6IJqXShcyCMf34HOIqYH/9/G7easZAkcWqc4xlN+N/1HRvP7Btt7ClBHp+7a6Qg
 bZzHOyPInhqXzpDshaXqgrbrLn/DoJS8xnJGHW2e34hD0muZUwecVW/JeJrwzqKJkz
 o4sD90xGxFTDw==
Date: Thu, 8 Jun 2023 13:30:43 +0300
From: Oded Gabbay <ogabbay@kernel.org>
To: airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: [git pull] habanalabs for drm-next-6.5
Message-ID: <20230608103043.GA2699019@ogabbay-vm-u20.habana-labs.com>
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

Habanalabs pull request for 6.5.

As Gaudi2 is pretty much stable, this contains mostly bug fixes and small
optimizations and improvements.

Full details are in the signed tag.

Thanks,
Oded

The following changes since commit 2e1492835e439fceba57a5b0f9b17da8e78ffa3d:

  Merge tag 'drm-misc-next-2023-06-01' of git://anongit.freedesktop.org/drm/drm-misc into drm-next (2023-06-02 13:39:00 +1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git tags/drm-habanalabs-next-2023-06-08

for you to fetch changes up to e6f49e96bc57d34fc0f617f37bfdf62a9b58d2c2:

  accel/habanalabs: refactor error info reset (2023-06-08 12:35:56 +0300)

----------------------------------------------------------------
This tag contains additional habanalabs driver changes for v6.5:

- uAPI changes:
  - Return 0 when user queries if there was a h/w or f/w error and no such error happened.
    Previously we returned an error in such case.

- New features and improvements:
  - Add pci health check when we lose connection with the firmware. This can be used to
    distinguish between pci link down and firmware getting stuck.
  - Add more info to the error print when TPC interrupt occur.
  - Reduce amount of code under mutex in the command submission of signal event.

- Firmware related fixes:
  - Fixes to the handshake protocol during f/w initialization.
  - Display information that the f/w sends us when encountering a DMA error.
  - Do soft-reset using a message sent to firmware instead of writing to MMIO.
  - Prepare generic code to extract f/w version numbers.

- Bug fixes and code cleanups. Notable fixes are:
  - Unsecure certain TPC registers that the user should access.
  - Fix handling of QMAN errors
  - Fix memory leak when recording errors (to later pass them to the user)
  - Multiple fixes to razwi interrupt handling code

----------------------------------------------------------------
Dafna Hirschfeld (6):
      accel/habanalabs: add helper to extract the FW major/minor
      accel/habanalabs: rename fw_{major/minor}_version to fw_inner_{major/minor}_ver
      accel/habanalabs: extract and save the FW's SW major/minor/sub-minor
      accel/habanalabs: check fw version using sw version
      accel/habanalabs: do soft-reset using cpucp packet
      accel/habanalabs: add missing tpc interrupt info

Dan Carpenter (1):
      accel/habanalabs: fix gaudi2_get_tpc_idle_status() return

Dani Liberman (4):
      accel/habanalabs: use binning info when handling razwi
      accel/habanalabs: mask part of hmmu page fault captured address
      accel/habanalabs: add description to several info ioctls
      accel/habanalabs: refactor error info reset

Koby Elbaz (8):
      accel/habanalabs: remove commented code that won't be used
      accel/habanalabs: minimize encapsulation signal mutex lock time
      accel/habanalabs: refactor abort of completions and waits
      accel/habanalabs: poll for device status update following WFE cmd
      accel/habanalabs: fix a static warning - 'dubious: x & !y'
      accel/habanalabs: rename security functions related arguments
      accel/habanalabs: upon DMA errors, use FW-extracted error cause
      accel/habanalabs: update state when loading boot fit

Moti Haimovski (3):
      accel/habanalabs: fix bug in free scratchpad memory
      accel/habanalabs: call to HW/FW err returns 0 when no events exist
      accel/habanalabs: fix mem leak in capture user mappings

Oded Gabbay (5):
      accel/habanalabs: set unused bit as reserved
      accel/habanalabs: align to latest firmware specs
      accel/habanalabs: print max timeout value on CS stuck
      accel/habanalabs: remove sim code
      accel/habanalabs: move ioctl error print to debug level

Ofir Bitton (7):
      accel/habanalabs: unsecure TPC bias registers
      accel/habanalabs: add pci health check during heartbeat
      accel/habanalabs: always fetch pci addr_dec error info
      accel/habanalabs: remove support for mmu disable
      accel/habanalabs: fix bug of not fetching addr_dec info
      accel/habanalabs: unsecure TSB_CFG_MTRR regs
      accel/habanalabs: add event queue extra validation

Rakesh Ughreja (1):
      accel/habanalabs: allow user to modify EDMA RL register

Tal Cohen (1):
      accel/habanalabs: ignore false positive razwi

Tom Rix (1):
      accel/habanalabs: remove variable gaudi_irq_name

Tomer Tayar (3):
      accel/habanalabs: expose debugfs files later
      accel/habanalabs: use lower QM in QM errors handling
      accel/habanalabs: print qman data on error only for lower qman

Yang Li (1):
      accel/habanalabs: Fix some kernel-doc comments

 drivers/accel/habanalabs/common/command_buffer.c   |   6 -
 .../accel/habanalabs/common/command_submission.c   |  61 ++--
 drivers/accel/habanalabs/common/debugfs.c          |  60 ++--
 drivers/accel/habanalabs/common/device.c           | 112 ++++---
 drivers/accel/habanalabs/common/firmware_if.c      | 212 ++++++++++---
 drivers/accel/habanalabs/common/habanalabs.h       |  77 ++---
 drivers/accel/habanalabs/common/habanalabs_drv.c   |   9 +-
 drivers/accel/habanalabs/common/habanalabs_ioctl.c |  35 +--
 drivers/accel/habanalabs/common/irq.c              |   2 +-
 drivers/accel/habanalabs/common/memory.c           | 104 +------
 drivers/accel/habanalabs/common/mmu/mmu.c          |  56 +---
 drivers/accel/habanalabs/common/security.c         |  57 ++--
 drivers/accel/habanalabs/gaudi/gaudi.c             |  13 +-
 drivers/accel/habanalabs/gaudi2/gaudi2.c           | 334 ++++++++-------------
 drivers/accel/habanalabs/gaudi2/gaudi2P.h          |   2 +-
 drivers/accel/habanalabs/gaudi2/gaudi2_security.c  |  15 +-
 drivers/accel/habanalabs/goya/goya.c               |   3 -
 drivers/accel/habanalabs/goya/goya_coresight.c     |   9 +-
 drivers/accel/habanalabs/include/common/cpucp_if.h |  22 +-
 .../accel/habanalabs/include/common/hl_boot_if.h   |  41 +--
 .../include/gaudi2/asic_reg/gaudi2_regs.h          |  11 +
 .../accel/habanalabs/include/gaudi2/gaudi2_fw_if.h |   2 +-
 include/uapi/drm/habanalabs_accel.h                |  10 +
 23 files changed, 557 insertions(+), 696 deletions(-)
