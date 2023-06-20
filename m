Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0507385FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1304A10E490;
	Wed, 21 Jun 2023 13:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7D4110E2B0;
 Tue, 20 Jun 2023 10:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=XU0Fg2KaF1xcsfWW4v0Y+xi9FWHK/c2RL/uvt8tfibM=;
 b=SYJk9LdyJhPjfLKMgCx73S9NtUWTih27uuWU9rq/6ldf3OoWdEaG0ogiK9bse7
 XT3b4Xoh6KQqOFpazPOam6O3wJg23kmcF8lldzsuAaAEAUDS0wips5cDqbJTnudv
 OvRnqM6H0vBtTFhROYrfjlFFtjdUS5C9AoWslDCnu86no=
Received: from openarena.loongson.cn (unknown [114.242.206.180])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wAXg3CldZFkB8yiAQ--.11241S2;
 Tue, 20 Jun 2023 17:47:17 +0800 (CST)
From: Sui Jingfeng <18949883232@163.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 00/11] drm/etnaviv: Add pci device driver support
Date: Tue, 20 Jun 2023 17:47:05 +0800
Message-Id: <20230620094716.2231414-1-18949883232@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAXg3CldZFkB8yiAQ--.11241S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4UJrWkGrW7WF4rWrWruFg_yoW5GF4xpF
 4UGFyYyry8urW3Kw17JFn5JFy3C3WxWF9Y93srt3s09w45AryjvryDKF45Jr9xJr4rAF12
 qr1a9r13WF1UArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jD5r7UUUUU=
X-Originating-IP: [114.242.206.180]
X-CM-SenderInfo: jprymkizyyjjits6il2tof0z/xtbBdQeU0VaEE2i9qQACsI
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

There is a Vivante GC1000 (v5037) in LS2K1000 and LS7A1000, this GPU is a
PCI device, and it has 2D and 3D cores in the same core. This series is
trying to add PCI device driver support to drm/etnaviv.

v6:
	* Fix build issue on system without CONFIG_PCI enabled
v7:
	* Add a separate patch for the platform driver rearrangement (Bjorn)
	* Switch to runtime check if the GPU is dma coherent or not (Lucas)
	* Add ETNAVIV_PARAM_GPU_COHERENT to allow userspace to query (Lucas)
	* Remove etnaviv_gpu.no_clk member (Lucas)
	* Various Typos and coding style fixed (Bjorn)
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

Rob Herring (1):
  drm/etnaviv: Replace of_platform.h with explicit includes

Sui Jingfeng (10):
  drm/etnaviv: Add a dedicated function to register an irq handler
  drm/etnaviv: Add a dedicated function to get various clocks
  drm/etnaviv: Add dedicated functions to create and destroy platform
    device
  drm/etnaviv: Add helpers for private data construction and destruction
  drm/etnaviv: Allow bypass component framework
  drm/etnaviv: Add driver support for the PCI devices
  drm/etnaviv: Add support for the dma coherent device
  drm/etnaviv: Add a dedicated function to create the virtual master
  drm/etnaviv: Clean up etnaviv_pdev_probe() function
  drm/etnaviv: Keep the curly brace aligned

 drivers/gpu/drm/etnaviv/Kconfig             |  10 +
 drivers/gpu/drm/etnaviv/Makefile            |   2 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 322 ++++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  10 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  22 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   7 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c       | 166 ++++++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h       |   9 +
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c   |  75 +++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h   |  18 ++
 include/uapi/drm/etnaviv_drm.h              |   1 +
 11 files changed, 481 insertions(+), 161 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

-- 
2.25.1

