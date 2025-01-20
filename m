Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1CA1713B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 18:21:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D3610E452;
	Mon, 20 Jan 2025 17:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="E5iybvAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD9910E452
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:23 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250120172121euoutp02c76326a21ea18f88a3b857671c9c3d88~cdlk4aLac1665616656euoutp02h
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 17:21:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250120172121euoutp02c76326a21ea18f88a3b857671c9c3d88~cdlk4aLac1665616656euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1737393681;
 bh=Gu0ryus9vacA2pmkAa3obmDZ851U5NSNS0NtIwrsbLc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=E5iybvACkBvBialI4zwVvlq2pw2QNQVQ1xpJGAnNwCm8QC00c+z0c0cBdLmCQ6qLY
 sNCEMX/eDrM754floOERSXYKSy+aSwm6wVgmIhvLB5U86rJlMAvRTIJjAKC6RWCALb
 DkGge4M/dpDhPheVpMl6NERvLj/AJnu5I1aOwlq4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250120172120eucas1p1d54044b1448bb62b0c471ec5105c2061~cdljpKmHh0933109331eucas1p1T;
 Mon, 20 Jan 2025 17:21:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8B.66.20409.0168E876; Mon, 20
 Jan 2025 17:21:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172119eucas1p135434171194546bc2df259bfd21458e1~cdliiL3Yz0726407264eucas1p14;
 Mon, 20 Jan 2025 17:21:19 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250120172119eusmtrp2f503c9eb5ec1b72007f092dece1c70b1~cdlifRrjW0490804908eusmtrp2W;
 Mon, 20 Jan 2025 17:21:19 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-b7-678e8610a188
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id C1.95.19654.F068E876; Mon, 20
 Jan 2025 17:21:19 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250120172117eusmtip10b15c9741da2f0da703f2030601a9b3d~cdlhFFrLC1308113081eusmtip1X;
 Mon, 20 Jan 2025 17:21:17 +0000 (GMT)
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
Subject: [RFC v3 00/18] Enable drm/imagination BXM-4-64 Support for LicheePi 4A
Date: Mon, 20 Jan 2025 18:20:53 +0100
Message-Id: <20250120172111.3492708-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved937/u6E3odcDyYREeSp3cgkkdPYUJnde8f3Rn/WFeXMvR1
 Wmzo5si47kC3gcyBBJY0iAFHMElAJhuDmBABAy1UZoO7ZIBRyI/40QYFnCPYi+V/3+/n+/l8
 P5/vcw+NixrIrfRJ2RlOLhOnhJNCwtK9dCeSycqTRF/MDkY9AxUYMq/oKXTN1ochQ2efALn6
 GzF0f2GWRHW/36XQI9s5AjmN31BI1V1Pogm9i0TzOpcAOVpKSOTO7QTI4laTqLZziEL1CwYM
 lc+bCVRpbQEoK6dKgO7degsNuXoINOHQ4ShL/yxabbVSyOtsIFDxTBuFGqe/ECB77XtI3XaZ
 SHienR3UUOz0xATB/njBQ7G2xTKCbdYPUayu+SfAmmpySPaBs5VkS3sT2eGLdoy9UZnBqmu7
 MfbS42h29uYvJJvXWAPYftUA9a7oA+G+Y1zKyTROvnt/kvDE44LkU97EszPzxzPB+QNasImG
 zF6oVRcItEBIixgjgN9lN200HgCXa/uJdZaIcQM4VJH+ROFZXSJ5UjWAmSsGkidNA9iZ6xOQ
 TAwcqTb4NgUyGgJqus6B9QZnxgG0jJWsKWg6gEmES9XSdQHBRMA/6oZ9Yj8mHk7NOAW8Wxhs
 ++FnnMe3wN6vx3wcfA1XmYtxnlMuhN/qBOsrIfMmbKkP5eEAOGlvpPh6G1xtNmB8nQpHzH9t
 SD+HzTr7Rh0HH/Qt+5LhzE5Y37Kbh9+Ao9fyAb/dHw7+uYUP4A8LLFdwHvaDF7JEPPsl+KUu
 9z/TPqNlw5SFiwOTAv6hPoJdiw48H7ygf+os/VNn6f/PUAbwGhDMKRVSCaeIkXGfRinEUoVS
 Jok6mio1gbVffdtr91hB9eR8VAfAaNABII2HB/oFzekkIr9j4s/SOXnqEbkyhVN0gOdoIjzY
 r6JNIxExEvEZ7hOOO8XJn0wxetPWTCw0ed+uzdseJhRlVrSnt0/nub2EIyQ11njElO+1BWzP
 OGBS3ShnCU34/sLkud6/P3xV9tuYtqkzOunFmQVNWpo25uyl9tOKe8nNX4UtvBbR1F1YGDne
 FZcmKb7zUBFXGXpdhQ6tOMtG5iI9d3uydYEZlPpW0FVp5dtZr1gbokvNtvNB77ur0n4VlRQ+
 8zq2WbZjuW5v3zuyuhDPcES+1kNMXb/aj39883BBIZeTF6s+yOwMPK5UmoxgdBS21ugHI5K8
 3y876aSV+8P/aA6HpZRc0cf7W0JS5NrL5aMuR+mOl3NtRaFs7B6l0FpUdfDoo6l8lnDHuhIz
 E5Txp293jYcTihPiPbtwuUL8LwHHMmhEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xu7r8bX3pBt+/slicuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DL+DspqeBfYMW7j2kNjE3OXYycHBICJhJf/v9k62Lk4hASWMoosfzzJ1aI
 hIzEte6XLBC2sMSfa11QRa8YJbbu2AFWxCZgJPFg+XwwW0RgMYvE3n2VIEXMAm8ZJa7P3AjW
 LSzgL9GxrZcRxGYRUJV4tu4+WJxXwF7i9btrUNvkJfYfPMsMEReUODnzCVANB9AgdYn184RA
 wsxAJc1bZzNPYOSfhaRqFkLVLCRVCxiZVzGKpJYW56bnFhvpFSfmFpfmpesl5+duYgQmlm3H
 fm7Zwbjy1Ue9Q4xMHIyHGCU4mJVEeEU/9KQL8aYkVlalFuXHF5XmpBYfYjQFunois5Rocj4w
 teWVxBuaGZgamphZGphamhkrifOyXTmfJiSQnliSmp2aWpBaBNPHxMEp1cAUEps3z/rrnKkP
 D89uO3vt/6+NNfxMOu/FJOue8TG3rN3oqrCD+S4Xo/sy3Rd1x3exMWu/nVAvbtIt6yLhendH
 d9OBEwei5mk7CpdXJV+ILw1ffUyi/eGW6/2iIlPa2yeuur9macr2nv1nNQTEj56KsvtZMVW/
 7t4LO/bM2etbGRbIr12l9r7wx5/7Z0UFVnNZHmSY4nruxcWI15ceuH3o/cxsf7irokTVe18W
 f9e3m5Us/isUTJft/39EcKHCjw2ZE/6WrzutVbjG//3RX0Vx3zJSQ8ofvFqd3WFVd+Ly3jUf
 BCpX5suaKyb26hhfDGBcsSPvjnhkrZpBtm2ut7Fz+ekYheD+h7dmaEd1zv6rxFKckWioxVxU
 nAgAC5gIxbUDAAA=
X-CMS-MailID: 20250120172119eucas1p135434171194546bc2df259bfd21458e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250120172119eucas1p135434171194546bc2df259bfd21458e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250120172119eucas1p135434171194546bc2df259bfd21458e1
References: <CGME20250120172119eucas1p135434171194546bc2df259bfd21458e1@eucas1p1.samsung.com>
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

Thanks Krzysztof and Stephen for taking the time to review the last revision !
Your guidance and the direction was very helpful.

Since the merge window just started I'm going to keep the RFC prefix for the
v3 revision.

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
   allows to re-use the driver code for multiple clock controllers.

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

Also included the mailbox device tree commit, already queued for 6.14 [14] for
completeness.

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

[14] Mailbox commit queued for 6.14
    https://lore.kernel.org/all/20241104100734.1276116-4-m.wilczynski@samsung.com/

Michal Wilczynski (18):
  dt-bindings: clock: Add VO subsystem clock controller support
  clk: thead: Add clock support for VO subsystem in T-Head TH1520 SoC
  dt-bindings: firmware: thead,th1520: Add support for firmware node
  firmware: thead: Add AON firmware protocol driver
  pmdomain: thead: Add power-domain driver for TH1520
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
  dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
  reset: thead: Add TH1520 reset controller driver
  drm/imagination: Add reset controller support for GPU initialization
  dt-bindings: gpu: Add 'resets' property for GPU initialization
  dt-bindings: gpu: Add compatibles for T-HEAD TH1520 GPU
  drm/imagination: Add support for IMG BXM-4-64 GPU
  drm/imagination: Enable PowerVR driver for RISC-V
  riscv: dts: thead: Add device tree VO clock controller
  riscv: dts: thead: Add mailbox node
  riscv: dts: thead: Introduce power domain nodes with aon firmware
  riscv: dts: thead: Introduce reset controller node
  riscv: dts: thead: Add GPU node to TH1520 device tree

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  16 +-
 .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
 .../bindings/gpu/img,powervr-rogue.yaml       |  58 +++-
 .../bindings/reset/thead,th1520-reset.yaml    |  44 +++
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  49 ++++
 drivers/clk/thead/clk-th1520-ap.c             | 197 +++++++++++--
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 271 ++++++++++++++++++
 drivers/gpu/drm/imagination/Kconfig           |   2 +-
 drivers/gpu/drm/imagination/pvr_device.c      |  21 ++
 drivers/gpu/drm/imagination/pvr_device.h      |   9 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
 drivers/gpu/drm/imagination/pvr_power.c       |  15 +-
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 +
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 174 +++++++++++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-th1520.c                  | 144 ++++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  33 +++
 .../dt-bindings/firmware/thead,th1520-aon.h   |  18 ++
 .../linux/firmware/thead/thead,th1520-aon.h   | 186 ++++++++++++
 27 files changed, 1293 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
 create mode 100644 drivers/firmware/thead,th1520-aon.c
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
 create mode 100644 drivers/reset/reset-th1520.c
 create mode 100644 include/dt-bindings/firmware/thead,th1520-aon.h
 create mode 100644 include/linux/firmware/thead/thead,th1520-aon.h

-- 
2.34.1

