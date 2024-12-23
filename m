Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E559FB14B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 17:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99F10E449;
	Mon, 23 Dec 2024 16:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="Imq8Fepx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6E10E155
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241223125601euoutp0188aa951be16c7367f543109a6b347b3a~Tz56pqgmq3222032220euoutp01i
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241223125601euoutp0188aa951be16c7367f543109a6b347b3a~Tz56pqgmq3222032220euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1734958561;
 bh=UhPbBshaH9K2wFltoCcg30MyK99ker1KdL3KSY1jdcc=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Imq8FepxE3Yaf/kVjQDr+0wEiYyk8tNRrFmL21zJ4yDs8HUZxvVaddH/XnZJOJj7p
 ZwgXoK1JhgyrDru0Au2zdwD5P8QDP6MMOHm5S83EJHMdDsMvm0lguSOPgg/5skllyO
 nhRK6HAxW2yazjwQmMjWSVjvbNKgiR6RRy6jK+Dc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241223125601eucas1p2a3df702c4852e92e10c819c4d3bd81ea~Tz56HUSS82931129311eucas1p22;
 Mon, 23 Dec 2024 12:56:01 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B3.B6.20821.1ED59676; Mon, 23
 Dec 2024 12:56:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125600eucas1p22d9257e92c798e9f4346a76d1d0fc73d~Tz55iDd9c2931129311eucas1p21;
 Mon, 23 Dec 2024 12:56:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20241223125600eusmtrp1ebc5062f3bd82552da4056bfa96ac831~Tz55hAbLV2051220512eusmtrp1E;
 Mon, 23 Dec 2024 12:56:00 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-5c-67695de1efca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CE.63.19654.0ED59676; Mon, 23
 Dec 2024 12:56:00 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241223125559eusmtip27305bd8634eacf7d0c51fb5c97de798f~Tz54Gg5hk3248532485eusmtip2Z;
 Mon, 23 Dec 2024 12:55:59 +0000 (GMT)
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
Subject: [RFC PATCH v2 00/19] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Date: Mon, 23 Dec 2024 13:55:34 +0100
Message-Id: <20241223125553.3527812-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf1CTdRzH+T7Ps+cZuxs+TtIvRJo75PwBE7rqvkmilNWD4hlnxVV6NeU5
 4Bo/boMsjYRjG0iDZQnixg8xGhw/JOc2gQNhOAElJ4MEM1moCGIQ8UtNhGI8WP73+rw/vz/3
 4eMiC+nNj41PYuXxUpmYFBCW1r/tAbf2xkYH3jaSqL33FIbMMzoKVTXaMVRss/OQs8uEoV+m
 x0h0+m4nhe41phGop7yQQumtNSQa1jlJNK5x8lB3fQGJJrNtAFkmlSSqtvVRqGa6GEMl42YC
 ldbWA6Q+YuAhx+W3UJ+znUDD3RocqXVL0D8NtRSa6zlDIP2fTRQyjRzlobbqSKRsOkZsXcmM
 XVdRzMjwMMFcyJyimMYHJwmmTtdHMZq6nwFjrDhCMjd7Gkim6FIE8/s3bRhztvQwo6xuxRjt
 bCAzdv4ayeSYKgDTld5LvSv6SPB6FCuL/ZyVbwz5VBDjaL4LEtN3fqGvslKpIHdLFnDnQ/pl
 OJRzBbhYRJcDaLj9AcdTAFZmbM8CgnmeBHAuMxV7mqDSVlKcowxAZfEAxhkjANqqyheiSPol
 2F9WzHM5PGkVAVUX04DLwOkhAC0DBaQrahkdCQ1nrAtM0Gvg1NDIAgvpLTBt9BHB9VsFm6xX
 cE5fCi+dGFjQ8Xk93azHXUUh/aMA6vKcgEvYBruuKkmOl8H7bSaKYx/Y8b1msWgC7DdP4Bx/
 Bes0bYscDG/aH8/n8ucbrIM19Rs5ORQ2PXhEuWRIe8Dro0u5ETzgd5bjOCcLYaZaxEX7wVxN
 9n9N7eWWxcsxcODyBMmddy8sGhzHvwUv6p5ZTPfMYrr/ZzgJ8Aqwgk1WxEWziqB49oBEIY1T
 JMdHS/YnxBnB/Gt3zLVN1ILC++OSFoDxQQuAfFzsKWwRxUaLhFHSLw+y8oRP5MkyVtECnucT
 4hXCNVGrWBEdLU1iP2PZRFb+1Ivx3b1Tsf2Gd6z+P+zLiLkwt952tkCzdubro4eKHC1i06+F
 rX6msYgNAa9tXZc3uC13R3tgf7g2p6sqSf9+fXz/HzAmZXeQ32Z9ipf11VPOkPzcss789sFQ
 rT+9KePxNV9fT599T5Icbm67Eq46SkJ2DO90zp77eDKMbr7xsBmqwr3CUw6WTrs37OatzlI+
 t5mfYfnrjsHjEAzrO6+4dbE3snOSeEWF//beTxUJwQceRoZ4Bx8eK4zYMxe0/O03nqhlG96s
 9IHabuu5QK9NbkbLjZSY2Y7sF/YYJaMBHaf9Q02Vy+/11/jnrAwrQSUy3yXHpvJz76y2CGe0
 SolOlbf9Q3PiWrX6hHRUTChipEHrcblC+i+16caASQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7oPYjPTDabdlbY4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
 5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
 F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
 vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CXcfHAU8aCZt+K2WsOsjcwTrXvYuTkkBAwkWjtX83excjFISSwlFHi/MR5
 LBAJGYlr3S+hbGGJP9e62CCKXjFKzO3awgiSYBMwkniwfD4riC0isJhFYu++SpAiZoG3jBLX
 Z24E6xYWCJV4v20vG4jNIqAq8eX5GzCbV8BeovHtD6gN8hL7D55lhogLSpyc+QQozgE0SF1i
 /TwhkDAzUEnz1tnMExj5ZyGpmoVQNQtJ1QJG5lWMIqmlxbnpucVGesWJucWleel6yfm5mxiB
 yWXbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd5DQpnpQrwpiZVVqUX58UWlOanFhxhNga6eyCwl
 mpwPTG95JfGGZgamhiZmlgamlmbGSuK8bFfOpwkJpCeWpGanphakFsH0MXFwSjUwqdSrTppk
 /jdnZcjLKZo84nM1O/o5NlyUnpUodl/kxKmtF3mdy7+d/bjljWlpkUOE6cnsRKa2GYkWM7YJ
 T3BPPyJde6s0uSJgravCHMkI++vSeS+c7tXpx1evnMOq+dw1tvbyI63mS7uLr6bduTTn6Zqm
 vmOZc3Wu9k2PFxF/V975oeNAV01ZfE0d+zzxWM3VZ3W/c3rWlXtxvdYD+qX3WcLey3MfsIru
 WfaiNq2B03Ci2w2hlpWGSqpx+/SqJCeXFn/K/rBU9vxJc+v8xqTvL56eqZme9+0M56wNURrq
 RoKVc57Y1ORVrHm1+lr8qctXfzzd7hxvM+2OTyfXc/7T83/qPNBfdeCiRIr7CWElluKMREMt
 5qLiRAB+Otw7twMAAA==
X-CMS-MailID: 20241223125600eucas1p22d9257e92c798e9f4346a76d1d0fc73d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125600eucas1p22d9257e92c798e9f4346a76d1d0fc73d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125600eucas1p22d9257e92c798e9f4346a76d1d0fc73d
References: <CGME20241223125600eucas1p22d9257e92c798e9f4346a76d1d0fc73d@eucas1p2.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2024 16:04:53 +0000
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

Michal Wilczynski (19):
  dt-bindings: clock: Add VO subsystem clocks and update address
    requirements
  clk: thead: Add clock support for VO subsystem in T-Head TH1520 SoC
  dt-bindings: power: thead,th1520: Add support for power domains
  dt-bindings: firmware: thead,th1520: Add support for firmware node
  firmware: thead: Add AON firmware protocol driver
  soc: thead: power-domain: Add power-domain driver for TH1520
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
  dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
  reset: thead: Add TH1520 reset controller driver
  drm/imagination: Add reset controller support for GPU initialization
  dt-bindings: gpu: Add 'resets' property for GPU initialization
  dt-bindings: gpu: Add compatibles for T-HEAD TH1520 GPU
  drm/imagination: Add support for IMG BXM-4-64 GPU
  drm/imagination: Enable PowerVR driver for RISC-V
  riscv: dts: thead: Extend device tree clk with VO reg
  riscv: dts: thead: Add mailbox node
  riscv: dts: thead: Introduce power domain nodes with aon firmware
  riscv: dts: thead: Introduce reset controller node
  riscv: dts: thead: Add GPU node to TH1520 device tree

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  15 +-
 .../bindings/firmware/thead,th1520-aon.yaml   |  59 +++++
 .../bindings/gpu/img,powervr-rogue.yaml       |  38 +++-
 .../bindings/power/thead,th1520-power.yaml    |  42 ++++
 .../bindings/reset/thead,th1520-reset.yaml    |  45 ++++
 MAINTAINERS                                   |   8 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  54 ++++-
 drivers/clk/thead/clk-th1520-ap.c             | 160 ++++++++++++--
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/thead,th1520-aon.c           | 203 ++++++++++++++++++
 drivers/gpu/drm/imagination/Kconfig           |   2 +-
 drivers/gpu/drm/imagination/pvr_device.c      |  21 ++
 drivers/gpu/drm/imagination/pvr_device.h      |   9 +
 drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
 drivers/gpu/drm/imagination/pvr_power.c       |  15 +-
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 ++
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 181 ++++++++++++++++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-th1520.c                  | 151 +++++++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  33 +++
 .../dt-bindings/power/thead,th1520-power.h    |  18 ++
 .../dt-bindings/reset/thead,th1520-reset.h    |  13 ++
 .../linux/firmware/thead/thead,th1520-aon.h   | 186 ++++++++++++++++
 29 files changed, 1266 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
 create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
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

