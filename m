Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D434A2125F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 20:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9408110E22A;
	Tue, 28 Jan 2025 19:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="LT4fN1iv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF49210E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:28 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20250128194826euoutp023d20d6662d3c8ff2db969270b782c875~e8wRoVQ200278302783euoutp02d
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 19:48:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20250128194826euoutp023d20d6662d3c8ff2db969270b782c875~e8wRoVQ200278302783euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1738093706;
 bh=s/hyfsEwpR29IPjuiFCyTz5t3HRX/rxTk0xz9W711jk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=LT4fN1ivovINeh9u7I22ZxtIHqoa6JOibGx1wn43pQXIAWVoOuc3bviaCtIbbHo4o
 tAEFT2loVPIqJR5lrX1ex5M3Pke7ZlDDo0ljnihvIsYMrUruSiDGHGGnJakAK8qHeb
 X6QI+jSSczclr6XiyV3bHqb7iaupKFU5df9IHQV0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250128194825eucas1p119cdd8e992c752e8f845f5f7bc07aed2~e8wRBT5yF1601016010eucas1p1p;
 Tue, 28 Jan 2025 19:48:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 12.A2.20397.98439976; Tue, 28
 Jan 2025 19:48:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585~e8wQTzaUd1601016010eucas1p1o;
 Tue, 28 Jan 2025 19:48:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250128194825eusmtrp2296fffeca071a7830da2a0579f3f404e~e8wQSJcPh3008430084eusmtrp2S;
 Tue, 28 Jan 2025 19:48:25 +0000 (GMT)
X-AuditID: cbfec7f5-ed1d670000004fad-c5-679934896cfd
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DD.D0.19920.88439976; Tue, 28
 Jan 2025 19:48:24 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250128194823eusmtip13617432e5af4c1ed0ace393230a7687b~e8wO8qR6a0291602916eusmtip1X;
 Tue, 28 Jan 2025 19:48:23 +0000 (GMT)
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
Subject: [PATCH v4 00/18] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Date: Tue, 28 Jan 2025 20:47:58 +0100
Message-Id: <20250128194816.2185326-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfVBUZRTGe++9e+/dnaDLosMrUQQTNEgCKTO+TYxGplxrnGz6MAOqFW+L
 Eyy0K0kFKrGQfKeJyCogtrIrum7B7gaMKx8By+dCmEABC1NCgSBuyzZTDJDsxfK/33nOOe9z
 npmXxsVG0ps+JDvMyWWSBH9SRJja/+7blBNeKg0rNj2DOoYuYsi4qKLQVbMVQxWtVgGyDRgw
 9JNznkTXJvsp9Ic5g0CD2jIKZbbrSTStspHInm8ToJsN50nkKGgFyORQkkjXOkYhvbMCQ5V2
 I4HUdQ0AZedUCdCPXTvRmK2DQNM383GUrXoMrVyvo9Dy4HcEOne3kUKG2ZMCZNHtQ8rG08SL
 T7Lzw1kUOzs9TbA/nFigWPNfFwi2XjVGsfn1PYCtqc4h2dHB6yRb3vk6O55nwdha9TFWqWvH
 2KKlMHb+xi2SLTRUA3Ygc4jaK35XFHGQSzj0CScP3faBKH6q92si2bIv1ZLJHge9UbmApiET
 DjsdHrlARIsZLYDXBq4AvlgA8FdtD8YXDgDb6i6TDzbyTLt5XQNgvX0U54tZAJfUt6hcIKRJ
 ZjOc0FQIVhvrmCwCZrVluN7Fmd8BNN0+T65OeTJvwL5RM1hlggmAha15rm03ZjvM1RlcOmR8
 YWNzL87rHrCz9Daxyvh9PdN4zmUNmcsieG+mYG3hZejsaSZ49oQzFgPFsw9cqa/AeE6CE8Y/
 cZ7TYH2+ZY1fgKPWf1w5cSYI6htCeTkSftneRPDx3eHwnAd/gjs8ZSrBedkNnsgW89OBsDi/
 4D9Tq9a0ZsrCOfu8y0jMxMKCphLqK/CU6qFgqoeCqf6/4QLAq4EXl6JIlHKKLTLuSIhCkqhI
 kUlD4pISa8D9n929bHHWAe2MPaQFYDRoAZDG/de5xVrPSsVuByWffsbJk96XpyRwihbwOE34
 e7ldbMySihmp5DD3Ecclc/IHXYwWeh/HgoLMVbFxvmU7Bg5I0sdeezs4dP8Vv/j1NyK2Lp4u
 PCpsS93i8XE8Y1woO2Lk+oa0vy2InNGygN3iwcCSqLCpDUNgobk7em5EWdzVJLTHbfIUBuvf
 +tC2U7+UPnqpv0cdHXl3z8/0ftl2d08/tdde3yL9898LOkQyR0TZsV0rGzSb78RoLq2fdESF
 xHS/V9SzIrtztTY5+J0JYLUovglcVKWdKuk6+u0uTYDX019sOyN/qe1ZXaWmPIaZelT8SPlJ
 ZXJGrtGcPs6Ko2uW3zSMhKfe65+q9NH7HPB7pdMz9AmtJs+jdrh4fA77pcqWVqolRyInlRvV
 mLff2Vd3fC4UbJWl+hOKeMlzG3G5QvIvskh0z0gEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xu7odJjPTDZq2W1icuL6IyWLr71ns
 Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
 uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
 cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
 C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
 31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
 SUnNySxLLdK3S9DLeHZ2MkvB8fCK480eDYxn3bsYOTgkBEwkurd5djFycQgJLGWUaJj/mbGL
 kRMoLiNxrfslC4QtLPHnWhcbRNErRomn3ftYQRJsAkYSD5bPB7NFBBazSOzdVwlSxCzwllHi
 +syNYN3CAoESt+f2sIPYLAKqEn1HusFsXgF7ia61W6C2yUvsP3iWGSIuKHFy5hMWkOuYBdQl
 1s8TAgkzA5U0b53NPIGRfxaSqlkIVbOQVC1gZF7FKJJaWpybnltsqFecmFtcmpeul5yfu4kR
 mFi2Hfu5eQfjvFcf9Q4xMnEwHmKU4GBWEuGNPTcjXYg3JbGyKrUoP76oNCe1+BCjKdDVE5ml
 RJPzgaktryTe0MzA1NDEzNLA1NLMWEmc1+3y+TQhgfTEktTs1NSC1CKYPiYOTqkGpo3WN2ac
 e8g1fU1CeTeDm8fsvek82yJWLD7wS9A5pJShdPYxNukZwozfjt+tbGty/frQ+a9n0/XQkj8P
 +Vad/NTlWfFx3+072etqvaJZJ4TuDWn9v/b2ufPH/HZ5PDzbzrKA8XeM2j1FQS4rjj1Pf23a
 ue1rm5fql6K1Ua8sA0vk9i0T4lzZpRG+9lrOpOga9v1Lmnbx/DrxxkimVCRkev1Uj0sX5mz5
 LML2wMfMWTIz0G9ic8DnKG2Z+9PNfnJsybBQy5m82vLhkpDs7X7bJ+ZPr3K6PfHOlAlXXIVD
 9821uGsjIv9z0Z8pnt9OeRo/aXlt3rH439l+keeKql1/zswJSEoPVUyYqbhHX651zk4lluKM
 REMt5qLiRAAZmCYCtQMAAA==
X-CMS-MailID: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585
References: <CGME20250128194825eucas1p14e2cb0a85c397dea297e9c4177cf1585@eucas1p1.samsung.com>
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

Since this patchset is slowly getting closer to being ready I'm dropping the
RFC prefix with the v4.

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

Michal Wilczynski (18):
  dt-bindings: clock: thead: Add TH1520 VO clock controller
  clk: thead: Add clock support for VO subsystem in T-Head TH1520 SoC
  dt-bindings: firmware: thead,th1520: Add support for firmware node
  firmware: thead: Add AON firmware protocol driver
  dt-bindings: power: Add TH1520 SoC power domains
  pmdomain: thead: Add power-domain driver for TH1520
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
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

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  17 +-
 .../bindings/firmware/thead,th1520-aon.yaml   |  53 ++++
 .../bindings/gpu/img,powervr-rogue.yaml       |  42 ++-
 .../bindings/reset/thead,th1520-reset.yaml    |  44 +++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  34 +++
 drivers/clk/thead/clk-th1520-ap.c             | 197 +++++++++++--
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 268 ++++++++++++++++++
 drivers/gpu/drm/imagination/Kconfig           |   2 +-
 drivers/gpu/drm/imagination/pvr_device.c      |  21 ++
 drivers/gpu/drm/imagination/pvr_device.h      |   9 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
 drivers/gpu/drm/imagination/pvr_power.c       |  12 +-
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 +
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 193 +++++++++++++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-th1520.c                  | 178 ++++++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  33 +++
 .../dt-bindings/power/thead,th1520-power.h    |  19 ++
 .../dt-bindings/reset/thead,th1520-reset.h    |  15 +
 .../linux/firmware/thead/thead,th1520-aon.h   | 197 +++++++++++++
 28 files changed, 1344 insertions(+), 37 deletions(-)
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

