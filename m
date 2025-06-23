Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6FEAE3E3C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 13:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5497D10E370;
	Mon, 23 Jun 2025 11:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="jB3SvszP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9E610E370
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:44:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250623114430euoutp0178e3456e49ab269aeeb76c642b9a9797~LqVa2cI6I3256132561euoutp01r
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 11:44:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250623114430euoutp0178e3456e49ab269aeeb76c642b9a9797~LqVa2cI6I3256132561euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1750679070;
 bh=7rc1fzF0QTmKxkyJFBOrevb3sgychXffT2onchk1Wxw=;
 h=From:Subject:Date:To:Cc:References:From;
 b=jB3SvszPClaE6yGDgxOb5xF+XHjVibiu+3rymf4nDAXUu44N8Sd2BdKaoFktZyvm6
 vneFX83MvIPkbjZhRUj+gpYU6Tsqp2GXlsXNVPJ58Y6PV4Jx8QyHciiIsr2Oo5QmDD
 bSupBZSv5eL66fPcQ7vNcX+04PadNf6r6KtQL9hY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a~LqVaD0D3O0450604506eucas1p1l;
 Mon, 23 Jun 2025 11:44:29 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
 [106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250623114428eusmtip1e82762bc55e1f3da0e06fca082af295d~LqVY_i1qQ1799017990eusmtip1h;
 Mon, 23 Jun 2025 11:44:28 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v6 0/8] Add TH1520 GPU support with power sequencing
Date: Mon, 23 Jun 2025 13:42:38 +0200
Message-Id: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK49WWgC/33OzW7DIAzA8VepOI+JL4fQ095jqiJmTMqhpIIt6
 lTl3Ud6aatlO/4t+WdfWaWSqLL97soKzammKbfoXnYMjz6PxFNozZRQIIw03J/LIM0QpzJUyiH
 lkcOHdtL20npE1hbPhWK63ND3Q+tjqp9T+b7dmNU6/ZebFRfcCgQflY+uw7fqT/Urj684ndgKz
 vqOgBabiG5IrwNYY4JzdgMxd6T74xOzIqSdAeylw/AbgUek30SgIcpS0Jo8YBefkWVZfgCXIGA
 KhQEAAA==
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
 dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a
X-EPHeader: CA
X-CMS-RootMailID: 20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com>
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

Link to v5 of this series - [3].

v6:
 - check return values from reset_control_assert() and propagate the
   first error, ensuring all teardown steps are still attempted
 - the driver now stores a reference to the consumer's device node to
   ensure it binds to a single, specific device
 - rename Kconfig option to POWER_SEQUENCING_TH1520_GPU
 - remove COMPILE_TEST

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
[3] - https://lore.kernel.org/all/20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com/

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
 drivers/power/sequencing/pwrseq-thead-gpu.c        | 247 +++++++++++++++++++++
 15 files changed, 503 insertions(+), 49 deletions(-)
---
base-commit: 4774cfe3543abb8ee98089f535e28ebfd45b975a
change-id: 20250414-apr_14_for_sending-5b3917817acc

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

