Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98FC92EE1C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 19:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6182D10E2BF;
	Thu, 11 Jul 2024 17:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EpBBMEh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8382410E025
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 17:55:32 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1720720530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rJmBQTiFbQB/sclB7Zsha2pQcHDQo2MMWlFO6roeq84=;
 b=EpBBMEh+9wn6SeWb/TkpUMPvzL2MpHBROXgsBkwwTU+dJhmBp/MuDJCYws/AyD3ZDf77FF
 fmYrWCYBaub5xmu/WGV67J+EqcLPjfSzR36IHajv6qmHNKAdcGCaCT0oXgb+hKTCSBm2xl
 ghnxEx0j9sa1yZe420TIPNzFAegwBkE=
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: sui.jingfeng@linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 0/1]drm/loongson: Introduce component framework support
Date: Fri, 12 Jul 2024 01:55:22 +0800
Message-ID: <20240711175523.538457-1-sui.jingfeng@linux.dev>
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

In some display subsystems, the functionality of a PCIe device may too
complex to be managed by a single driver. A split of the functionality
into child devices can help to achieve better modularity. For example,
KMS drivers who has a dependency on external modules will suffer from
the deferral probe problem of those modules. The problem is that the
DRM driver has to tear down everything when it receives '-EPROBE_DEFER',
even though the independent part of the entire driver is not very closely
related.

For Loongson Graphics, the GPU and the display controller are two distinct
PCIe devices. Despite hardware units that come along with PCIe are actually
all ready to be driven, DRM driver still need to wait all of its dependency
ready before it can register the service to userspace.

The idea is to migrate(offload) the dependency to submodule, creating
submodule by creating platform device manually. Such submodules are
functional as agents, which will be responsible for attaching needed
external modules for the main body of entire KMS drive. It's also for
better modularity, as output hardware units are relatively standalone
IPs.

Add dummy GPU driver as a subcomponent, use the component framework to
bind those scatter software/hardware entities into one. Move DRM-related
codes into the loongson_drm_master_bind() function. Move output-related
things into the submodule, since the encoder/connector/ transcoder are
sometimes depend on external module. The display controller and GPIO-I2Cs
go with the PCIe master, as they have no dependency on external modules.

Make lsdc PCI driver as a subcomponent as well, creating a platform device
as proxy. The proxy will responsible attach the common drm routines to our
hardware, which keep the whole drm driver balanced (and fair) enough for
both the DC and GPU.

The lsdc PCI device is the haidden(implicit) parent, while the proxy is
the explicit master, which deal with drm related affairs for its parent.
The master won't bound until all submodules are ready, submodules are
responsible to return '-EPROBE_DEFER' back to the driver core if it needs
to do so.

v1 -> v2:
	* Squash patch 0002 and patch 0003 into one
	* Fill typos and improve commit message

v2 -> v3:
	* Squash all patch into one
	* Create another platform device as drm proxy master.
	* Make LSDC PCI driver as a subcomponent as well.

Tested with ls3a6000+ls7a2000:

[   11.307887] loongson 0000:00:06.1: Found LS7A2000 bridge chipset, revision: 2
[   11.316701] loongson 0000:00:06.1: i2c-6(sda pin mask=1, scl pin mask=2) created
[   11.325318] loongson 0000:00:06.1: i2c-7(sda pin mask=4, scl pin mask=8) created
[   12.644855] loongson 0000:00:06.1: lsdc-output.0 probed, type: HDMI-or-VGA
[   12.654461] loongson 0000:00:06.1: lsdc-output.1 probed, type: HDMI
[   12.661175] loongson 0000:00:06.1: [drm] dc: 400MHz, gmc: 1200MHz, gpu: 480MHz
[   12.669027] loongson loongson: bound lsdc-output.0 (ops lsdc_output_component_ops [loongson])
[   12.677968] loongson loongson: bound lsdc-output.1 (ops lsdc_output_component_ops [loongson])
[   12.686578] loongson 0000:00:06.1: [drm] Dedicated vram start: 0xe0020000000, size: 256MiB
[   12.700799] loongson 0000:00:06.1: lsdc irq: 61
[   12.700802] loongson loongson: bound 0000:00:06.1 (ops lsdc_component_ops [loongson])
[   12.700825] loongson 0000:00:06.1: [drm] LoongGPU(TM): LG110, revision: 0, Host: LS7A2000
[   12.700835] loongson 0000:00:06.1: [drm] LoongGPU irq: 62
[   12.700837] loongson loongson: bound 0000:00:06.0 (ops loonggpu_component_ops [loongson])
[   12.700870] loongson 0000:00:06.1: [drm] Total 2 outputs
[   12.706489] loongson 0000:00:06.1: [drm] VRAM: 16384 pages ready
[   12.746614] loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
[   12.792895] [drm] Initialized loongson 1.0.0 for 0000:00:06.1 on minor 0
[   12.879707] loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame buffer device
[   16.952830] loongson 0000:00:06.1: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem


Tested with ls3a5000+ls7a1000:

[   10.603678] loongson 0000:00:06.1: Found LS7A1000 bridge chipset, revision: 1
[   10.616429] loongson 0000:00:06.1: i2c-6(sda pin mask=1, scl pin mask=2) created
[   10.631678] loongson 0000:00:06.1: i2c-7(sda pin mask=4, scl pin mask=8) created
[   10.651926] loongson 0000:00:06.1: lsdc-output.0 probed, type: DVO
[   10.668396] loongson 0000:00:06.1: lsdc-output.1 probed, type: DVO
[   10.705771] loongson 0000:00:06.1: [drm] dc: 264MHz, gmc: 529MHz, gpu: 529MHz
[   10.755928] loongson loongson: bound lsdc-output.0 (ops lsdc_output_component_ops [loongson])
[   10.859777] loongson loongson: bound lsdc-output.1 (ops lsdc_output_component_ops [loongson])
[   10.873062] loongson 0000:00:06.1: [drm] Dedicated vram start: 0xe0030000000, size: 64MiB
[   10.891791] loongson 0000:00:06.1: lsdc irq: 57
[   10.891798] loongson loongson: bound 0000:00:06.1 (ops lsdc_component_ops [loongson])
[   10.891851] loongson 0000:00:06.1: [drm] Total 2 outputs
[   10.910159] loongson 0000:00:06.1: [drm] VRAM: 4096 pages ready
[   10.916131] loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
[   10.922391] [drm] Initialized loongson 1.0.0 for 0000:00:06.1 on minor 0
[  379.378990] Console: switching to colour frame buffer device 128x37
[  379.385261] loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame buffer device


Sui Jingfeng (1):
  drm/loongson: Introduce component framework support

 drivers/gpu/drm/loongson/Makefile             |   5 +
 drivers/gpu/drm/loongson/loonggpu_pci_drv.c   | 156 ++++++++++++
 drivers/gpu/drm/loongson/loonggpu_pci_drv.h   |  33 +++
 drivers/gpu/drm/loongson/loongson_device.c    |   1 +
 drivers/gpu/drm/loongson/loongson_drv.c       | 157 ++++++++++++
 drivers/gpu/drm/loongson/loongson_module.c    |  38 ++-
 drivers/gpu/drm/loongson/loongson_module.h    |  17 ++
 drivers/gpu/drm/loongson/lsdc_drv.c           | 235 ++++++++----------
 drivers/gpu/drm/loongson/lsdc_drv.h           |  56 ++---
 drivers/gpu/drm/loongson/lsdc_i2c.c           |  43 ++--
 drivers/gpu/drm/loongson/lsdc_i2c.h           |  11 +-
 drivers/gpu/drm/loongson/lsdc_irq.c           |  21 +-
 drivers/gpu/drm/loongson/lsdc_output.c        | 208 ++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  36 ++-
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c |   7 +-
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c |  17 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |   4 +-
 drivers/gpu/drm/loongson/lsdc_ttm.h           |   2 +-
 18 files changed, 832 insertions(+), 215 deletions(-)
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/loonggpu_pci_drv.h
 create mode 100644 drivers/gpu/drm/loongson/loongson_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c

-- 
2.43.0

