Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A7247FE8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B46289D2E;
	Tue, 18 Aug 2020 07:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rnd-relay.smtp.broadcom.com (rnd-relay.smtp.broadcom.com
 [192.19.229.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE6689F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 21:53:36 +0000 (UTC)
Received: from mail-irv-17.broadcom.com (mail-irv-17.lvn.broadcom.net
 [10.75.242.48])
 by rnd-relay.smtp.broadcom.com (Postfix) with ESMTP id EA47830C20B;
 Mon, 17 Aug 2020 14:51:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 rnd-relay.smtp.broadcom.com EA47830C20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1597701072;
 bh=ubBMJ940rYl92I/Jyrk5HpYWcSFbpmpmT4Ss/yrNXcU=;
 h=From:To:Cc:Subject:Date:From;
 b=l8GCsv6KPSY0S1UZ1zKkiYsiS7/SWlE4tXKWNxfa+ncXvzCCAgXe4UriCgEJoloWA
 qjY6cwXbGngkg2fLIu25m8FOwM8SKprirpCW9NkYKqtPoCM5E8QD7QTgZ77Zy8M5CM
 trzPUIS3Q8VBJ/azsTHutBZUf1rkmLhMtNsTlXGw=
Received: from stbsrv-and-01.and.broadcom.net (stbsrv-and-01.and.broadcom.net
 [10.28.16.211])
 by mail-irv-17.broadcom.com (Postfix) with ESMTP id 7D633140069;
 Mon, 17 Aug 2020 14:53:31 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 bcm-kernel-feedback-list@broadcom.com, james.quinlan@broadcom.com
Subject: [PATCH RESEND v10 00/11] PCI: brcmstb: enable PCIe for STB chips
Date: Mon, 17 Aug 2020 17:53:02 -0400
Message-Id: <20200817215326.30912-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 18 Aug 2020 07:50:42 +0000
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patchset Summary:
  Enhance a PCIe host controller driver.  Because of its unusual design
  we are foced to change dev->dma_pfn_offset into a more general role
  allowing multiple offsets.  See the 'v1' notes below for more info.

v10: 
  Commit: "device-mapping: Introduce DMA range map, supplanting ..."
  -- change title of commit; "bus core:" => "device-mapping:"
  -- instead of allocating the DMA map with devm, use kcalloc
     and call kfree() during device_release().  (RobH) Also,
     for three cases that want to use the same DMA map, copy
     the dma_range_map using a helper function.
  -- added a missing 'return = 0;' to of_dma_get_range().  (Nicolas)
  -- removed dma_range_overlaps(); instead return error if there
     is an existing DMA map. (Christoph).
  Commit: "PCI: brcmstb: Set additional internal memory DMA ..."
  -- Changed constant 1 to 1ULL. (Nicolas)
  Commit: "ata: ahci_brcm: Fix use of BCM7216 reset controller"
     This commit has been removed from this patchset and will be
     submitted on its own.

v9:
  Commit: "device core: Introduce DMA range map, supplanting ..."
  -- A number of code improvements were implemented as suggested by
     ChristophH.  Unfortunately, some of these changes reversed the
     implemented suggestions of other reviewers; for example, the new
     macros PFN_DMA_ADDR(), DMA_ADDR_PFN() have been pulled.

v8:
  Commit: "device core: Introduce DMA range map, supplanting ..."
  -- To satisfy a specific m68 compile configuration, I moved the 'struct
     bus_dma_region; definition out of #ifdef CONFIG_HAS_DMA and also defined
     three inline functions for !CONFIG_HAS_DMA (kernel test robot).
  -- The sunXi drivers -- suc4i_csi, sun6i_csi, cedrus_hw -- set
     a pfn_offset outside of_dma_configure() but the code offers no 
     insight on the size of the translation window.  V7 had me using
     SIZE_MAX as the size.  I have since contacted the sunXi maintainer and
     he said that using a size of SZ_4G would cover sunXi configurations.

v7:
  Commit: "device core: Introduce DMA range map, supplanting ..."
  -- remove second kcalloc/copy in device.c (AndyS)
  -- use PTR_ERR_OR_ZERO() and PHYS_PFN() (AndyS)
  -- indentation, sizeof(struct ...) => sizeof(*r) (AndyS)
  -- add pfn.h definitions: PFN_DMA_ADDR(), DMA_ADDR_PFN() (AndyS)
  -- Fixed compile error in "sun6i_csi.c" (kernel test robot)
  Commit "ata: ahci_brcm: Fix use of BCM7216 reset controller"
  -- correct name of function in the commit msg (SergeiS)
  
v6:
  Commit "device core: Introduce DMA range map":
  -- of_dma_get_range() now takes a single argument and returns either
     NULL, a valid map, or an ERR_PTR. (Robin)
  -- offsets are no longer a PFN value but an actual address. (Robin)
  -- the bus_dma_region struct stores the range size instead of
     the cpu_end and pci_end values. (Robin)
  -- devices that were setting a single offset with no boundaries
     have been modified to have boundaries; in a few places
     where this information was unavilable a /* FIXME: ... */
     comment was added. (Robin)
  -- dma_attach_offset_range() can be called when an offset
     map already exists; if it's range is already present
     nothing is done and success is returned. (Robin)
  All commits:
  -- Man name/style/corrections/etc changed (Bjorn)
  -- rebase to Torvalds master

v5:
  Commit "device core: Introduce multiple dma pfn offsets"
  -- in of/address.c: "map_size = 0" => "*map_size = 0"
  -- use kcalloc instead of kzalloc (AndyS)
  -- use PHYS_ADDR_MAX instead of "~(phys_addr_t)0"
  Commit "PCI: brcmstb: Set internal memory viewport sizes"
  -- now gives error on missing dma-ranges property.
  Commit "dt-bindings: PCI: Add bindings for more Brcmstb chips"
  -- removed "Allof:" from brcm,scb-sizes definition (RobH)
  All Commits:
  -- indentation style, use max chars 100 (AndyS)
  -- rebased to torvalds master

v4:
  Commit "device core: Introduce multiple dma pfn offsets"
  -- of_dma_get_range() does not take a dev param but instead
     takes two "out" params: map and map_size.  We do this so
     that the code that parses dma-ranges is separate from
     the code that modifies 'dev'.   (Nicolas)
  -- the separate case of having a single pfn offset has
     been removed and is now processed by going through the
     map array. (Nicolas)
  -- move attach_uniform_dma_pfn_offset() from of/address.c to
     dma/mapping.c so that it does not depend on CONFIG_OF. (Nicolas)
  -- devm_kcalloc => devm_kzalloc (DanC)
  -- add/fix assignment to dev->dma_pfn_offset_map for func
     attach_uniform_dma_pfn_offset() (DanC, Nicolas)
  -- s/struct dma_pfn_offset_region/struct bus_dma_region/ (Nicolas)
  -- s/attach_uniform_dma_pfn_offset/dma_attach_uniform_pfn_offset/
  -- s/attach_dma_pfn_offset_map/dma_attach_pfn_offset_map/
  -- More use of PFN_{PHYS,DOWN,UP}. (AndyS)
  Commit "of: Include a dev param in of_dma_get_range()"
  -- this commit was sqaushed with "device core: Introduce ..."

v3:
  Commit "device core: Introduce multiple dma pfn offsets"
  Commit "arm: dma-mapping: Invoke dma offset func if needed"
  -- The above two commits have been squashed.  More importantly,
     the code has been modified so that the functionality for
     multiple pfn offsets subsumes the use of dev->dma_pfn_offset.
     In fact, dma_pfn_offset is removed and supplanted by
     dma_pfn_offset_map, which is a pointer to an array.  The
     more common case of a uniform offset is now handled as
     a map with a single entry, while cases requiring multiple
     pfn offsets use a map with multiple entries.  Code paths
     that used to do this:

         dev->dma_pfn_offset = mydrivers_pfn_offset;

     have been changed to do this:

         attach_uniform_dma_pfn_offset(dev, pfn_offset);

  Commit "dt-bindings: PCI: Add bindings for more Brcmstb chips"
  -- Add if/then clause for required props: resets, reset-names (RobH)
  -- Change compatible list from const to enum (RobH)
  -- Change list of u32-tuples to u64 (RobH)

  Commit "of: Include a dev param in of_dma_get_range()"
  -- modify of/unittests.c to add NULL param in of_dma_get_range() call.

  Commit "device core: Add ability to handle multiple dma offsets"
  -- align comment in device.h (AndyS).
  -- s/cpu_beg/cpu_start/ and s/dma_beg/dma_start/ in struct
     dma_pfn_offset_region (AndyS).

v2:
Commit: "device core: Add ability to handle multiple dma offsets"
  o Added helper func attach_dma_pfn_offset_map() in address.c (Chistoph)
  o Helpers funcs added to __phys_to_dma() & __dma_to_phys() (Christoph)
  o Added warning when multiple offsets are needed and !DMA_PFN_OFFSET_MAP
  o dev->dma_pfn_map => dev->dma_pfn_offset_map
  o s/frm/from/ for dma_pfn_offset_frm_{phys,dma}_addr() (Christoph)
  o In device.h: s/const void */const struct dma_pfn_offset_region */
  o removed 'unlikely' from unlikely(dev->dma_pfn_offset_map) since
    guarded by CONFIG_DMA_PFN_OFFSET_MAP (Christoph)
  o Since dev->dma_pfn_offset is copied in usb/core/{usb,message}.c, now
    dev->dma_pfn_offset_map is copied as well.
  o Merged two of the DMA commits into one (Christoph).

Commit "arm: dma-mapping: Invoke dma offset func if needed":
  o Use helper functions instead of #if CONFIG_DMA_PFN_OFFSET

Other commits' changes:
  o Removed need for carrying of_id var in priv (Nicolas)
  o Commit message rewordings (Bjorn)
  o Commit log messages filled to 75 chars (Bjorn)
  o devm_reset_control_get_shared())
    => devm_reset_control_get_optional_shared (Philipp)
  o Add call to reset_control_assert() in PCIe remove routines (Philipp)

v1:
This patchset expands the usefulness of the Broadcom Settop Box PCIe
controller by building upon the PCIe driver used currently by the
Raspbery Pi.  Other forms of this patchset were submitted by me years
ago and not accepted; the major sticking point was the code required
for the DMA remapping needed for the PCIe driver to work [1].

There have been many changes to the DMA and OF subsystems since that
time, making a cleaner and less intrusive patchset possible.  This
patchset implements a generalization of "dev->dma_pfn_offset", except
that instead of a single scalar offset it provides for multiple
offsets via a function which depends upon the "dma-ranges" property of
the PCIe host controller.  This is required for proper functionality
of the BrcmSTB PCIe controller and possibly some other devices.

[1] https://lore.kernel.org/linux-arm-kernel/1516058925-46522-5-git-send-email-jim2101024@gmail.com/


Jim Quinlan (11):
  PCI: brcmstb: PCIE_BRCMSTB depends on ARCH_BRCMSTB
  dt-bindings: PCI: Add bindings for more Brcmstb chips
  PCI: brcmstb: Add bcm7278 register info
  PCI: brcmstb: Add suspend and resume pm_ops
  PCI: brcmstb: Add bcm7278 PERST# support
  PCI: brcmstb: Add control of rescal reset
  device-mapping: Introduce DMA range map, supplanting dma_pfn_offset
  PCI: brcmstb: Set additional internal memory DMA viewport sizes
  PCI: brcmstb: Accommodate MSI for older chips
  PCI: brcmstb: Set bus max burst size by chip type
  PCI: brcmstb: Add bcm7211, bcm7216, bcm7445, bcm7278 to match list

 .../bindings/pci/brcm,stb-pcie.yaml           |  56 ++-
 arch/arm/include/asm/dma-mapping.h            |  10 +-
 arch/arm/mach-keystone/keystone.c             |  17 +-
 arch/sh/drivers/pci/pcie-sh7786.c             |   9 +-
 arch/sh/kernel/dma-coherent.c                 |  15 +-
 arch/x86/pci/sta2x11-fixup.c                  |   7 +-
 drivers/acpi/arm64/iort.c                     |   5 +-
 drivers/base/core.c                           |   2 +
 drivers/gpu/drm/sun4i/sun4i_backend.c         |   5 +-
 drivers/iommu/io-pgtable-arm.c                |   2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |   5 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      |   4 +-
 drivers/of/address.c                          |  72 ++-
 drivers/of/device.c                           |  43 +-
 drivers/of/of_private.h                       |  10 +-
 drivers/of/unittest.c                         |  31 +-
 drivers/pci/controller/Kconfig                |   3 +-
 drivers/pci/controller/pcie-brcmstb.c         | 409 +++++++++++++++---
 drivers/remoteproc/remoteproc_core.c          |   8 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   7 +-
 drivers/usb/core/message.c                    |   9 +-
 drivers/usb/core/usb.c                        |   7 +-
 include/linux/device.h                        |   4 +-
 include/linux/dma-direct.h                    |   8 +-
 include/linux/dma-mapping.h                   |  36 ++
 kernel/dma/coherent.c                         |  10 +-
 kernel/dma/mapping.c                          |  65 +++
 27 files changed, 672 insertions(+), 187 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
