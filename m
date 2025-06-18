Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C3ADE894
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 12:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C79810E7F7;
	Wed, 18 Jun 2025 10:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="mO1Kvifh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EBB10E7F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:27 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250618102226euoutp02f1e23cced618336b84f8d63afa9f7918~KG-VsDvJE2423024230euoutp02Y
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 10:22:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250618102226euoutp02f1e23cced618336b84f8d63afa9f7918~KG-VsDvJE2423024230euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750242146;
 bh=0TcTLlvTNXnhdi09fFERR1bR8C5OCa05BlXUBy02BfU=;
 h=From:Subject:Date:To:Cc:References:From;
 b=mO1KvifhXurpQsTa5kb8jnKuDORAQ1Q0yjh6qBE2nXT/pKBcf+vnr+V50XAF43VjD
 tWCpkm5J4UZh/x8Z7gimkuihNTN2wJJ2wXEwcfNkMQbz7W4gqK5U1oZC8qlxbBI9Yo
 gsPaLyjHKgqKbkL5cpPeqWuE/UMBflFG+vvSbvA8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468~KG-U2pE4g1594115941eucas1p1W;
 Wed, 18 Jun 2025 10:22:25 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250618102223eusmtip1122d5fc54046bf201876d71a690fa28d~KG-TeGlmQ1170811708eusmtip1H;
 Wed, 18 Jun 2025 10:22:23 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Date: Wed, 18 Jun 2025 12:22:06 +0200
Message-Id: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+TUmgC/33OSw7CIBCA4as0rMXwLMWV9zCmQaAtC6EBJZqmd
 5d205hUl/8k881MINnobAKnagLRZpdc8CX4oQJ6UL630JnSgCDCEcMMqjG2mLVdiG2y3jjfQ36
 jEosGC6U1KItjtJ17rejlWnpw6RHie72RyTL9y2UCERRIc9UR1clan5O6p6fvjzrcwQJmuiGco
 l2EFqShhgvGjJRiB2EbUv/4hC2IpZJx3WCpzTcyz/MHzvG97kABAAA=
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
X-CMS-MailID: 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468
X-EPHeader: CA
X-CMS-RootMailID: 20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
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

Link to v4 of this series - [3].

v5:

- reworked the pwrseq-thead-gpu driver, now using manual resource
  management in .match and a .remove callback
- refactored the drm/imagination driver to use function pointers for
  power management instead of a boolean flag
- switched the pmdomain driver to use the generic
  device_property_match_string() helper
- added MMU and COMPILE_TEST dependencies to Kconfig to fix RISC-V
  build warnings.

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
[3] - https://lore.kernel.org/all/20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com/

---
Changes in v5:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v4: https://lore.kernel.org/r/20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com

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
 drivers/gpu/drm/imagination/Kconfig                |   4 +-
 drivers/gpu/drm/imagination/pvr_device.c           |  31 ++-
 drivers/gpu/drm/imagination/pvr_device.h           |  19 ++
 drivers/gpu/drm/imagination/pvr_drv.c              |  30 ++-
 drivers/gpu/drm/imagination/pvr_power.c            | 112 ++++++----
 drivers/gpu/drm/imagination/pvr_power.h            |   6 +
 drivers/pmdomain/thead/Kconfig                     |   1 +
 drivers/pmdomain/thead/th1520-pm-domains.c         |  51 +++++
 drivers/power/sequencing/Kconfig                   |   8 +
 drivers/power/sequencing/Makefile                  |   1 +
 drivers/power/sequencing/pwrseq-thead-gpu.c        | 231 +++++++++++++++++++++
 15 files changed, 487 insertions(+), 49 deletions(-)
---
base-commit: 4774cfe3543abb8ee98089f535e28ebfd45b975a
change-id: 20250414-apr_14_for_sending-5b3917817acc

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

