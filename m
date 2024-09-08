Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D576970613
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABB510E132;
	Sun,  8 Sep 2024 09:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rHaEmaBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6C10E07E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:44:11 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iKnfMiLB9a0irdtB/pTgb8p6Wd2qUK1Juyy7jyAjfjI=;
 b=rHaEmaBicjBGAmqWhHkyYqdYs01Q6y4bCAls4YnFnT9zwYVLf0hloQCPz+A9zRYxDMFlmc
 9PSeDg8TU2ARUZwu+gJbJR/DUTue8a4SXBVOm6Ra763oB2C6edY1pGmsawHSIRdgIw8931
 9NNhBa6nOfGaOwC5Bsy6JHC4sOoPB04=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 00/19] drm/etnaviv: Add driver wrapper for vivante GPUs
 attached on PCI(e) device
Date: Sun,  8 Sep 2024 17:43:38 +0800
Message-ID: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

drm/etnaviv use the component framework to bind multiple GPU cores to a
virtual master, the virtual master is manually create during driver load
time. This may works well for SoCs, yet there are some PCIe card has the
vivante GPU cores integrated. The driver lacks support for PCIe devices
currently.

Adds PCIe driver wrapper on the top of drm/etnaviv, the component
framework is still being used to bind subdevices, even though there is
only one GPU core. But the process is going to be reversed, we create
virtual platform device for each of the vivante GPU IP core that is
shipped by the PCIe card. Select the PCIe device as parent, generate a
virtual platform device as component master to take over the bind actions.

Sui Jingfeng (19):
  drm/etnaviv: Implement drm_gem_object_funcs::print_info()
  drm/etnaviv: Export drm_gem_print_info() and use it
  drm/etnaviv: Implement drm_gem_object_funcs::vunmap()
  drm/etnaviv: Make etnaviv_gem_prime_vmap() a static function
  drm/etnaviv: Add contructor and destructor for etnaviv_gem_get_mapping
    structure
  drm/etnaviv: Prefer drm_device based drm_WARN_ON() over regular
    WARN_ON()
  drm/etnaviv: Add a dedicated helper function to get various clocks
  drm/etnaviv: Fix wrong caching mode being used for non writecombine
    buffers
  drm/etnaviv: Add constructor and destructor for the
    etnaviv_drm_private structure
  drm/etnaviv: Embed struct drm_device into struct etnaviv_drm_private
  drm/etnaviv: Add etnaviv_gem_obj_remove() helper
  drm/etnaviv: Add support for cached coherent caching mode
  drm/etnaviv: Add support for vivante GPU cores attached via PCIe
    device
  drm/etnaviv: Add PCIe IP setup code
  drm/etnaviv: Make more use of the etnaviv_gem_new_private() function
  drm/etnaviv: Call etnaviv_gem_obj_add() in ernaviv_gem_new_private()
  drm/etnaviv: Support to manage dedicated VRAM base on drm_mm
  drm/etnaviv: Allow userspace specify the domain of etnaviv GEM buffer
    object
  drm/etnaviv: Expose basic sanity tests via debugfs

v10:
	* Add one more cleanup patch
	* Resolve the conflict with a patch from Rob
	* Make the dummy PCI stub inlined
	* Print only if the platform is dma-coherrent
V11:
	* Process reviews since V10.
	* Provide a side by side implement

V12:
	* Create a virtual platform device for the subcomponent GPU cores
	* Bind all subordinate GPU cores to the real PCI master via component.

V13:
	* Drop the non-component code path, always use the component framework
	  to bind subcomponent GPU core. Even though there is only one core.
	* Defer the irq handler register.
	* Rebase and improve the commit message

V14:
	* Rebase onto etnaviv-next and improve commit message.

V15:
	* Plug in a drm-mm based dedicated VRAM range allocator.

 drivers/gpu/drm/drm_gem.c                    |   1 +
 drivers/gpu/drm/etnaviv/Kconfig              |   9 +
 drivers/gpu/drm/etnaviv/Makefile             |   5 +
 drivers/gpu/drm/etnaviv/etnaviv_debugfs.c    | 118 +++++++++
 drivers/gpu/drm/etnaviv/etnaviv_debugfs.h    |  15 ++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 183 +++++++++----
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  40 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        | 224 ++++++++++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.h        |  21 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c  |  31 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c   | 264 +++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h   |  14 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 136 +++++++---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |   4 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |  11 +-
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c    | 217 +++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h    |  63 +++++
 drivers/gpu/drm/etnaviv/pcie_ip_setup.c      | 109 ++++++++
 include/drm/drm_gem.h                        |   2 +
 include/uapi/drm/etnaviv_drm.h               |  13 +
 21 files changed, 1308 insertions(+), 174 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_debugfs.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_debugfs.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_gem_vram.h
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
 create mode 100644 drivers/gpu/drm/etnaviv/pcie_ip_setup.c

-- 
2.43.0

