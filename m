Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7537E8C954C
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 18:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C285C10E0B7;
	Sun, 19 May 2024 16:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="fX+avRDV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671F910E0B7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 16:53:48 +0000 (UTC)
X-Envelope-To: l.stach@pengutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716137625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FuOak0X2GaG4L1svxVLJRuYwxll44K4jK0Xm/fybtzo=;
 b=fX+avRDV73axaKVDoFcR27s4jvjZaOb7pQ9X38faGhAP26IqI4fiMG4SXcIohUHk2+de70
 7in4/TWaGNc1FnQ82uqvCajnwLsE99RZICVyd9dBX1ZA48tAK424jRMiEyoiqGaayR8eXn
 NUbtuc8VNBEycMeRqtrnzCFrg3SmXEA=
X-Envelope-To: linux+etnaviv@armlinux.org.uk
X-Envelope-To: christian.gmeiner@gmail.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: etnaviv@lists.freedesktop.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [etnaviv-next v14 0/8] drm/etnaviv: Add driver wrapper for vivante
 GPUs attached on PCI(e) device
Date: Mon, 20 May 2024 00:53:13 +0800
Message-Id: <20240519165321.2123356-1-sui.jingfeng@linux.dev>
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
time. This works well for various SoCs, yet there are some PCIe card has
the vivante GPU cores integrated. The driver lacks the support for PCIe
devices currently.

Adds PCIe driver wrapper on the top of what drm/etnaviv already has, the
component framework is still being used to bind subdevices, even though
there is only one GPU core. But the process is going to be reversed, we
create virtual platform device for each of the vivante GPU IP core shipped
by the PCIe master. The PCIe master is real, bind all the virtual child
to the master with component framework.


v6:
	* Fix build issue on system without CONFIG_PCI enabled
v7:
	* Add a separate patch for the platform driver rearrangement (Bjorn)
	* Switch to runtime check if the GPU is dma coherent or not (Lucas)
	* Add ETNAVIV_PARAM_GPU_COHERENT to allow userspace to query (Lucas)
	* Remove etnaviv_gpu.no_clk member (Lucas)
	* Fix Various typos and coding style fixed (Bjorn)
v8:
	* Fix typos and remove unnecessary header included (Bjorn).
	* Add a dedicated function to create the virtual master platform
	  device.
v9:
	* Use PCI_VDEVICE() macro (Bjorn)
	* Add trivial stubs for the PCI driver (Bjorn)
	* Remove a redundant dev_err() usage (Bjorn)
	* Clean up etnaviv_pdev_probe() with etnaviv_of_first_available_node()
v10:
	* Add one more cleanup patch
	* Resolve the conflict with a patch from Rob
	* Make the dummy PCI stub inlined
	* Print only if the platform is dma-coherrent
V11:
	* Drop unnecessary changes (Lucas)
	* Tweak according to other reviews of v10.

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

Tested with JD9230P GPU and LingJiu GP102 GPU.

Sui Jingfeng (8):
  drm/etnaviv: Add a dedicated helper function to get various clocks
  drm/etnaviv: Add constructor and destructor for the
    etnaviv_drm_private structure
  drm/etnaviv: Embed struct drm_device into struct etnaviv_drm_private
  drm/etnaviv: Fix wrong cache property being used for vmap()
  drm/etnaviv: Add support for cached coherent caching mode
  drm/etnaviv: Replace the '&pdev->dev' with 'dev'
  drm/etnaviv: Allow creating subdevices and pass platform specific data
  drm/etnaviv: Add support for vivante GPU cores attached via PCIe
    device

 drivers/gpu/drm/etnaviv/Kconfig              |   8 +
 drivers/gpu/drm/etnaviv/Makefile             |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c        | 159 ++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  27 +++
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        |  22 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 144 +++++++++-----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |   4 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c    | 187 +++++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h    |  18 ++
 include/uapi/drm/etnaviv_drm.h               |   1 +
 12 files changed, 468 insertions(+), 110 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h


base-commit: 52272bfff15ee70c7bd5be9368f175948fb8ecfd
-- 
2.34.1

