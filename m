Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE0AD9EB1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 20:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5042910E14B;
	Sat, 14 Jun 2025 18:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="m4z86KHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B978610E0DF
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:11 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250614180907euoutp02468ff0c87afdf5dd5ee5988a68d7b0fe~I_xrHCUh22365423654euoutp02p
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 18:09:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250614180907euoutp02468ff0c87afdf5dd5ee5988a68d7b0fe~I_xrHCUh22365423654euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1749924547;
 bh=3Nmmr7S6VBvNVHPnioTy4yU768+DIJTpGVnZCTNmlSM=;
 h=From:Subject:Date:To:Cc:References:From;
 b=m4z86KHBEM9mIkaQ0yZS5dFavaMxOmG7xcLo70V1N2exyZXKqKipUp4M2dxm3foeY
 YRRwEIDsPo3cMJs13eMw2p+lh/SjOmELN25UHkx9S2+nnEieb8vAgqpdm9MaTpBm2T
 2e9C721unKqgt14DPRqeYMtnev8rqLPU1450u8PY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3~I_xp0tOcK2845928459eucas1p1C;
 Sat, 14 Jun 2025 18:09:06 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250614180905eusmtip197e998d116f001834b10e9bea0ca774c~I_xoyZ9782797327973eusmtip1b;
 Sat, 14 Jun 2025 18:09:05 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v4 0/8] Add TH1520 GPU support with power sequencing
Date: Sat, 14 Jun 2025 20:06:06 +0200
Message-Id: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA66TWgC/33NSwrCMBSF4a2UjI3kaZqO3IdIiXm0GTQpiQald
 O+mnQgiDv8D97sLyDZ5m0HXLCDZ4rOPoQY7NECPKgwWelMbEEQ4YphBNaces97F1GcbjA8D5Dc
 qsWixUFqDejgn6/xzRy/X2qPP95he+49CtvUvVwhEUCDNlSPKyZM+ZzXlRxiOOk5gAwv9IJyin
 witSEsNF4wZKcUXsq7rG2YanRL7AAAA
X-Change-ID: 20250414-apr_14_for_sending-5b3917817acc
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
 Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
 <ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3
X-EPHeader: CA
X-CMS-RootMailID: 20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3
References: <CGME20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3@eucas1p1.samsung.com>
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

This patch series introduces support for the Imagination IMG BXM-4-64
GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
managing the GPU's complex power-up and power-down sequence, which
involves multiple clocks and resets.

The TH1520 GPU requires a specific sequence to be followed for its
clocks and resets to ensure correct operation. Initial discussions and
an earlier version of this series explored managing this via the generic
power domain (genpd) framework. However, following further discussions
with kernel maintainers [1], the approach has been reworked to utilize
the dedicated power sequencing (pwrseq) framework.

This revised series now employs a new pwrseq provider driver
(pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
encapsulates the SoC specific power sequence details. The Imagination
GPU driver (pvr_device.c) is updated to act as a consumer of this power
sequencer, requesting the "gpu-power" target. The sequencer driver,
during its match phase with the GPU device, acquires the necessary clock
and reset handles from the GPU device node to perform the full sequence.

This approach aligns with the goal of abstracting SoC specific power
management details away from generic device drivers and leverages the
pwrseq framework as recommended.

The series is structured as follows:

Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
         GPU's power-on/off sequence.
Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
         existing thead,th1520-aon binding.
Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
         and spawn the pwrseq-thead-gpu auxiliary driver.
Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
         framework for TH1520 GPU power management.
Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
         device tree bindings.
Patch 6: Adds the gpu-clkgen reset property to the aon node in the
         TH1520 device tree source.
Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
         required fixed-clock.
Patch 8: Enables compilation of the Imagination PowerVR driver on the
         RISC-V architecture.

This patchset finishes the work started in bigger series [2] by adding
all remaining GPU power sequencing piece. After this patchset the GPU
probes correctly.

This series supersedes the previous genpd based approach. Testing on
T-HEAD TH1520 SoC indicates the new pwrseq based solution works
correctly.

An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
defined as a fixed-clock. The specific hardware frequency for this clock
on the TH1520 could not be determined from available public
documentation. Consequently, clock-frequency = <0>; has been used as a
placeholder to enable driver functionality.

Link to v3 of this series - [3].

v4:

- the pwrseq driver is now an auxiliary driver with a robust match
  function based on the power-domains property, spawned from the AON
  node 
- Imagination DRM driver now uses of_device_id match data to
  conditionally probe for the pwrseq, solving the cross platform
  probe deferral issue
- add Reviewed-by from Ulf for the entire series

v3:

 - re-worked cover letter completely
 - complete architectural rework from using extended genpd callbacks to a
   dedicated pwrseq provider driver
 - introduced pwrseq-thead-gpu.c and associated DT bindings
   (thead,th1520-gpu-pwrseq)
 - the Imagination driver now calls devm_pwrseq_get() and uses
   pwrseq_power_on() / pwrseq_power_off() for the TH1520 GPU
 - removed the platform_resources_managed flag from dev_pm_info and
   associated logic
 - the new pwrseq driver's match() function now acquires consumer-specific
   resources (GPU clocks, GPU core reset) directly from the consumer device

v2:

Extended the series by adding two new commits:
 - introduced a new platform_resources_managed flag in dev_pm_info along
   with helper functions, allowing drivers to detect when clocks and resets
   are managed by the platform
 - updated the DRM Imagination driver to skip claiming clocks when
   platform_resources_managed is set

Split the original bindings update:
 - the AON firmware bindings now only add the GPU clkgen reset (the GPU
   core reset remains handled by the GPU node)

Reworked the TH1520 PM domain driver to:
 - acquire GPU clocks and reset dynamically using attach_dev/detach_dev
   callbacks
 - handle clkgen reset internally, while GPU core reset is obtained from
   the consumer device node
 - added a check to enforce that only a single device can be attached to
   the GPU PM domain

[1] - https://lore.kernel.org/all/CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com/
[2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung.com/
[3] - https://lore.kernel.org/all/20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com/

---
Michal Wilczynski (8):
      power: sequencing: Add T-HEAD TH1520 GPU power sequencer driver
      dt-bindings: firmware: thead,th1520: Add resets for GPU clkgen
      pmdomain: thead: Instantiate GPU power sequencer via auxiliary bus
      drm/imagination: Use pwrseq for TH1520 GPU power management
      dt-bindings: gpu: img,powervr-rogue: Add TH1520 GPU compatible
      riscv: dts: thead: th1520: Add GPU clkgen reset to AON node
      riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
      drm/imagination: Enable PowerVR driver for RISC-V

 .../bindings/firmware/thead,th1520-aon.yaml        |   7 +
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml |   9 +-
 MAINTAINERS                                        |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |  25 +++
 drivers/gpu/drm/imagination/Kconfig                |   3 +-
 drivers/gpu/drm/imagination/pvr_device.c           |  31 ++-
 drivers/gpu/drm/imagination/pvr_device.h           |  17 ++
 drivers/gpu/drm/imagination/pvr_drv.c              |   6 +
 drivers/gpu/drm/imagination/pvr_power.c            |  82 +++++---
 drivers/pmdomain/thead/Kconfig                     |   1 +
 drivers/pmdomain/thead/th1520-pm-domains.c         |  53 ++++++
 drivers/power/sequencing/Kconfig                   |   8 +
 drivers/power/sequencing/Makefile                  |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c        | 208 +++++++++++++++++++++
 14 files changed, 417 insertions(+), 35 deletions(-)
---
base-commit: 4774cfe3543abb8ee98089f535e28ebfd45b975a
change-id: 20250414-apr_14_for_sending-5b3917817acc

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

