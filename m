Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9B4A3C104
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 15:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8E210E313;
	Wed, 19 Feb 2025 14:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="hlzKPCzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EC510E308
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250219140250euoutp029c846476781a18e6c4a1cfa78e3f2810~loO0CklyZ0148801488euoutp02V
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 14:02:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250219140250euoutp029c846476781a18e6c4a1cfa78e3f2810~loO0CklyZ0148801488euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1739973770;
 bh=PLvnEvoQpqhUh81ve8c4YHx2FKz3xDw/WrUD55AjbmA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hlzKPCzk/NwcQMfOqsBpyvw2CLVdog7Ad+wBQ5Yd8eJc1iIiLF5IPuBa0OXq5eZXH
 XOQdsYfsiAvpguPKaxAPEos1sG9NE1YvGBn0tPeSbsxcqx3RnKs3/rlK7FNkRpHpBE
 6KVuWTf8YCpym8VCPCNBaa2Ca4PTIkXeKbVU8Vfo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250219140250eucas1p1ef22fa513b22ec35d6cc552e75f32c68~loOzYwrD92958229582eucas1p1i;
 Wed, 19 Feb 2025 14:02:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 35.72.20397.984E5B76; Wed, 19
 Feb 2025 14:02:50 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5~loOy1oRIZ2960029600eucas1p1Z;
 Wed, 19 Feb 2025 14:02:49 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20250219140249eusmtrp12262569e6963b9330353eda84cd1d46c~loOy0jiPZ2415024150eusmtrp1K;
 Wed, 19 Feb 2025 14:02:49 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-b0-67b5e4897f22
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E3.42.19654.984E5B76; Wed, 19
 Feb 2025 14:02:49 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250219140248eusmtip2ecc4f090c189cf0ad976b7a2df4476ba~loOxY-QOv0084500845eusmtip2h;
 Wed, 19 Feb 2025 14:02:47 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Date: Wed, 19 Feb 2025 15:02:18 +0100
Message-Id: <20250219140239.1378758-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVRTZRzHz3Pv3b1jneFleOIRTDo7ZQmHF7XsiaDyFHopS+2NTicOLrkM
 FBhnA0utkBgL5lR8QWO8CYcTgxPSYFtsgQtYjDcpcAJ2ZA6FZEoiIB6lg8S4Wf73eb6/7+/5
 /n7Pefi4qJH05yenZbDyNEmKmBQQpo4Hv4Wox4zS8HtFOOocqsSQ8W8thX5o6cNQua2Ph5wD
 Bgw55qZIdG78dwpNtGQTaFBXSqGcjnoSubVOEk1rnDx00VJCotkjNoBMs0oS1dlGKFQ/V46h
 imkjgaqaLACp8r/nof7uaDTi7CSQ+6IGRyrtCrTY3EShh4N6AhXftlLIMHmch+x1sUhpPUW8
 voaZGs6lmEm3m2Da8+5STMu9swRj1o5QjMbcC5iG2nySuTLYTDJlXTuZq4ftGNNYlcUo6zow
 5thCODN1/hLJHDXUAmYgZ4jaIfpEEJnApiTvY+Vhr+4SJJ3u90tflHwxn91OHQIL29XAiw/p
 F+AN8wTuYRGtA7B7ZrcaCJb4LoCFrQaMO8wCeL9kBjzqUA3ZKa5QDWDBHwME1z4JYGtzhIdJ
 egN0VZfzPKaVdC4Bc3/NBp4DTt8A0DRWQnpcvvT7sL9rfjmcoJ+Fk0fvL5n4fCH9Gqz6NpBL
 C4TW1gvLFiHtA7uKxpbD8CU9x1iMe+6EdI0AHrbm87iGN+GP7mySY194026gOF4Ne05qCI5l
 0GWcwTn+Epo19n/5FXilb570zIDT62C9JYyTN0PHscJlGdLecPgvH24Eb3jCdAbnZCHMU4k4
 91pYqDnyX2ifzoRxFgaO9IZwLxUH1fpRogA8rX1sL+1je2n/H+EswGuBH5upSJWyio1p7Oeh
 CkmqIjNNGrpbltoAlv51z0P7XBPQ3ZwObQMYH7QByMfFK4WqLINUJEyQ7D/AymXx8swUVtEG
 AviE2E9Yac2VimipJIPdy7LprPxRFeN7+R/Cftqz473Niu+KtfUfb8qQ0W+vilh3zpx4NTLx
 56incrz3N3z0YHgs4Fr6L+9WPH8wKWpLoqYmRh02rYx/o/TAp3dCuklX1LbY7ed1sg+nHF4S
 sW287ERS4Z6twddS0iLWrnLlra5xQp/oTVuupx7vCK4wOhZZrX7+QqNX8+X1Qa7IvRl6f1NP
 Z0ywUlWU36i+NfFOdRdDBLax03HW0esNob4vPVmZ/I2AL/e6VCB+5lY8sAWVWksTwvc99+IT
 0QdP+WVZuj4LyQusvR379Vt1ESvy1TEB2zLLdl6O0xkku9Y49Rt801+eWPizfOPwnV7LVEXl
 VyVxPu0nx6v8B0Z7dY4PqpnYBTGhSJKsD8LlCsk/5Cp260YEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7qdT7amG2zYJGZx4voiJoutv2ex
 W6zZe47JYv6Rc6wW9y5tYbK48vU9m8W6pxfYLV7sbWSxuLZiLrtF87H1bBYvZ91js/jYc4/V
 4vKuOWwWn3uPMFps+9zCZrH2yF12i/Vf5zNZLPy4lcViyY5djBZtnctYLS6ecrW4e+8Ei8XL
 yz3MFm2z+C3+79nBbvHv2kYWi9nv9rNbbHkzkdXi+Npwi5b9U1gc5Dze32hl93jz8iWLx+GO
 L+wee78tYPHYOesuu0fPzjOMHptWdbJ53Lm2h81j3slAj/vdx5k8Ni+p92hZe4zJo/+vgcf7
 fVfZPPq2rGL0uNR8nT1AKErPpii/tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/O
 JiU1J7MstUjfLkEvY9pF8YL/iRW/Gg+zNzD+9e9i5OSQEDCRaLt+nL2LkYtDSGApo8S2h9fY
 IRIyEte6X7JA2MISf651sUEUvWKUaFg7mQkkwSZgJPFg+XxWEFtEYDGLxN59lSBFzAJvGSWu
 z9wI1i0sECixc+MZsCIWAVWJN30/GLsYOTh4BewllrTLQyyQl9h/8CwziM0rIChxcuYTFpAS
 ZgF1ifXzhEDCzEAlzVtnM09g5J+FpGoWQtUsJFULGJlXMYqklhbnpucWG+kVJ+YWl+al6yXn
 525iBCaWbcd+btnBuPLVR71DjEwcjIcYJTiYlUR42+q3pAvxpiRWVqUW5ccXleakFh9iNAU6
 eiKzlGhyPjC15ZXEG5oZmBqamFkamFqaGSuJ87JdOZ8mJJCeWJKanZpakFoE08fEwSnVwOSY
 0mo/veHmXq9nU6a8+529aMXhnpImhQd+hhtl4j9rbsxT9djuHLf6a2Qrd5p/dj/LhBWG4XVJ
 014ujWQMC/MyDmFXibpq0dSWyMKtxcEa/GdzVZbdyr/H6/NefT6x90mPTfUqk7qwuNzmC25i
 gWv7WHW0mr79Ua9brPuh4r79XBnR3W/nJIgIv25kPffnFqPj5ddCE+vEvvf1yTmvfxN88c5r
 iTJ2O42qPYq59y3Vl7zd8jJRMn1e9//92k9n23196COWMOtj0dnpnuf2cr1UOvdktrD8T5t0
 /+avhcG3pf5bZvdm3Dl+pOMAx4LbNcxXH1kYP9c7p8zCvfcsz+kVPLOdIr54n8nhWf74vBJL
 cUaioRZzUXEiACGDP6C1AwAA
X-CMS-MailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140249eucas1p1291eb86c932373c847a3314ae54789d5
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
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

The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
downstream driver [1]. Recently, efforts have been made to upstream support for
the Rogue family GPUs, which the BXM-4-64 is part of [2].

While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
have introduced support for the BXS-4-64 GPU [3]. The modern upstream
drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
this support is being developed, it's crucial to upstream the necessary glue
code including clock and power-domain drivers so they're ready for integration
with the drm/imagination driver.

Recent Progress:

Firmware Improvements:
Since August, the vendor has provided updated firmware
[6][7] that correctly initiates the firmware for the BXM-4-64.

Mesa Driver Testing:
The vendor-supplied Mesa driver [8] partially works with Vulkan examples, such
as rendering a triangle using Sascha Willems' Vulkan samples [9]. Although the
triangle isn't rendered correctly (only the blue background appears), shader
job submissions function properly, and IOCTL calls are correctly invoked.  For
testing, we used the following resources:

Kernel Source: Custom kernel with necessary modifications [10].
Mesa Driver: Vendor-provided Mesa implementation [11].

Dependencies:
Testing required a functional Display Processing Unit (DPU) and HDMI driver,
which are currently not upstreamed. Efforts are underway to upstream the DPU
DC8200 driver used in StarFive boards [12], which is the same DPU used on the
LicheePi 4A. Once the DPU and HDMI drivers are upstreamed, GPU support can be
fully upstream.

Testing Status:
This series has been tested by performing a probe-only operation, confirming
that the firmware begins execution. The probe function initiates firmware
execution and waits for the firmware to flip a specific status bit.

[   12.637880] powervr ffef400000.gpu: [drm] loaded firmware powervr/rogue_36.52.104.182_v1.fw
[   12.648979] powervr ffef400000.gpu: [drm] FW version v1.0 (build 6645434 OS)
[   12.678906] [drm] Initialized powervr 1.0.0 for ffef400000.gpu on minor 0

Power Management:
Full power management capabilities require implementing the T-HEAD SoC AON
protocol messaging via the hardware mailbox. Support for the mailbox was merged
in kernel 6.13 [13], and the AON protocol implementation is part of this
series, since v2. Therefore this series support full power management
capabilities for the GPU driver.

Thanks everyone for taking the time to review the last revision ! Your
guidance and the direction was very helpful.

v5:

Reset Changes:
- Moved the reset de-assertion from the reset driver to the clock driver. The
  reset is now only de-asserted once the sys and core clocks have been enabled
- Added and exported the GPU_CLKGEN reset, allowing the clock driver to reset
  the GPU clock circuit

Clock Changes:
- Introduced a new macro CCU_GATE_CLK_OPS, which allows providing custom clk_ops.
  In the case of the 'MEM' clock, it provides empty clk_nops. Later, this clock
  is provided to the GPU node, thereby avoiding any ABI breakage
- Used the CCU_GATE_CLK_OPS macro to implement a workaround for de-asserting
  the clkgen reset only after both core and sys clocks are enabled. This
  sequence is required to properly initialize the GPU

Power-domain/Firmware Changes:
- Changed the AON driver to be a set of library functions rather than a
  standalone driver

Imagination Driver Changes:
- Moved the recommended 1 microsecond delay after de-asserting GPU reset to the
  Imagination driver itself
- Included the mem clock to preserve the ABI, acknowledging that this clock
  exists but is not configurable from the SoC
- A few remaining conflicts will be resolved after the dt-binding changes
  mentioned in the review are merged

v4:

Device Tree Changes:
- restructured power device tree bindings by abstracting power-domain IDs from
  firmware IDs, with the mappings now defined in a dedicated header file
- retained existing clock-names in img,powervr-rogue.yaml to maintain ABI
  compatibility, despite having only one downstream user
- enhanced documentation for new Video Output (VO) clock inputs in device tree
  bindings

Reset Driver Changes:
- reverted reset-cells configuration to single cell as in v2
- maintained reset definitions in device tree bindings while deferring
  implementation of watchdog timer (WDT) reset functionality
- addressed implementation issues in the DRM/Imagination reset driver

Power Domain Changes:
- added workaround to disable AUDIO power domain to prevent firmware crashes

v3:

Device Tree Changes:
 - consolidated device tree representation by merging aon and power-domain nodes
   while maintaining separate drivers internally
 - power-domain driver is now instantiated from within the aon driver
 - updated img,powervr-rogue.yaml to use allOf and oneOf for better schema
   organization

AP Clock Driver Improvements:
 - reworked driver to support multiple clock controllers through .compatible
   and .data instead of using multiple address spaces in dt-binding. This change
   allows to re-use the driver code for multiple clock controllers

Code Quality and Documentation:
 - fixed optional module dependencies in Kconfig
 - added kernel-doc comments for all exported functions
 - implemented th1520_aon_remove() to properly clean up mailbox channel
   resources
 - removed unnecessary of.h header in multiple drivers
 - refactored reset driver to use zero cells

v2:

Removed AP_SUBSYS clock refactoring commits (1-6):
 - instead of refactoring, I opted to extend the current driver and its
   associated device tree node to include support for a second address space.

Expanded patchset scope to fully support power management capabilities:
 - introduced a new firmware driver to manage power-related operations.
 - rewrote the power-domain driver to function alongside the firmware driver.
   These nodes in the device tree lack direct address spaces, despite
   representing HW blocks. Control is achieved via firmware protocol messages
   transmitted through a mailbox to the E902 core.

Implemented a reset controller for the TH1520 SoC:
 - developed a reset controller driver for the TH1520 to manage reset
   sequences.
 - updated the drm/imagination driver to act as a reset controller consumer.
   While this patchset is focused on the LPI4A board, the reset controller is
   designed to be useful for other boards, such as the BPI-3F, which also require
   a reset sequence after power-up.

Updated dt-bindings:
 - added new dt-bindings for power, reset, and firmware nodes.
 - updated the powervr dt-binding to include reset support and new compatibles.
 - ran dtbs_check and dt_binding_check to ensure compliance.

Addressed code quality:
 - resolved all checkpatch issues using --strict, except for the call to
   devm_clk_hw_register_gate_parent_data().  The current implementation remains
   preferable in this context, and clang-format aligns with this choice.

References:

[1] Downstream Driver Source:
    https://gitlab.freedesktop.org/frankbinns/powervr/-/blob/cb1929932095649a24f051b9cfdd2cd2ceab35cb/drivers/gpu/drm/img-rogue/Kconfig

[2] Initial Upstream Driver Series:
    https://lore.kernel.org/all/cover.1700668843.git.donald.robson@imgtec.com/

[3] BXS-4-64 GPU Support Patches:
    https://lore.kernel.org/all/20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com/

[4] Firmware Issue Discussion 1:
    https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/1

[5] Firmware Issue Discussion 2:
    https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/2

[6] Firmware Update Commit 1:
    https://gitlab.freedesktop.org/imagination/linux-firmware/-/commit/6ac2247e9a1d1837af495fb6d0fbd6f35547c2d1

[7] Firmware Update Commit 2:
    https://gitlab.freedesktop.org/imagination/linux-firmware/-/commit/efbebc90f25adb2b2e1499e3cc24ea3f3c3e4f4c

[8] Vendor-Provided Mesa Driver:
    https://gitlab.freedesktop.org/imagination/mesa/-/tree/dev/devinfo

[9] Sascha Willems' Vulkan Samples:     https://github.com/SaschaWillems/Vulkan

[10] Test Kernel Source:
    https://github.com/mwilczy/linux/tree/2_December_reference_linux_kernel_imagination

[11] Test Mesa Driver:
    https://github.com/mwilczy/mesa-reference

[12] DPU DC8200 Driver Upstream Attempt:
    https://lore.kernel.org/all/20241120061848.196754-1-keith.zhao@starfivetech.com/

[13] Pull request kernel 6.13 for mailbox
    https://lore.kernel.org/all/CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7wED9DXrYAyLKg@mail.gmail.com/

Michal Wilczynski (21):
  dt-bindings: clock: thead: Add TH1520 VO clock controller
  clk: thead: Add clock support for VO subsystem in T-Head TH1520 SoC
  dt-bindings: firmware: thead,th1520: Add support for firmware node
  firmware: thead: Add AON firmware protocol driver
  dt-bindings: power: Add TH1520 SoC power domains
  pmdomain: thead: Add power-domain driver for TH1520
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
  clk: thead: Add support for custom ops in CCU_GATE_CLK_OPS macro
  dt-bindings: clock: thead: Add GPU clkgen reset property
  clk: thead: Add GPU clock gate control with CLKGEN reset support
  dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
  reset: thead: Add TH1520 reset controller driver
  drm/imagination: Add reset controller support for GPU initialization
  dt-bindings: gpu: Add 'resets' property for GPU initialization
  dt-bindings: gpu: Add support for T-HEAD TH1520 GPU
  drm/imagination: Add support for IMG BXM-4-64 GPU
  drm/imagination: Enable PowerVR driver for RISC-V
  riscv: dts: thead: Add device tree VO clock controller
  riscv: dts: thead: Introduce power domain nodes with aon firmware
  riscv: dts: thead: Introduce reset controller node
  riscv: dts: thead: Add GPU node to TH1520 device tree

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  33 +-
 .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
 .../bindings/gpu/img,powervr-rogue.yaml       |  42 ++-
 .../bindings/reset/thead,th1520-reset.yaml    |  44 +++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  36 +++
 drivers/clk/thead/clk-th1520-ap.c             | 298 ++++++++++++++++--
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 247 +++++++++++++++
 drivers/gpu/drm/imagination/Kconfig           |   2 +-
 drivers/gpu/drm/imagination/pvr_device.c      |  21 ++
 drivers/gpu/drm/imagination/pvr_device.h      |   9 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   2 +
 drivers/gpu/drm/imagination/pvr_power.c       |  22 +-
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 +
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 209 ++++++++++++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-th1520.c                  | 141 +++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  34 ++
 .../dt-bindings/power/thead,th1520-power.h    |  19 ++
 .../dt-bindings/reset/thead,th1520-reset.h    |  16 +
 .../linux/firmware/thead/thead,th1520-aon.h   | 200 ++++++++++++
 28 files changed, 1437 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
 create mode 100644 drivers/reset/reset-th1520.c
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h
 create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

-- 
2.34.1

