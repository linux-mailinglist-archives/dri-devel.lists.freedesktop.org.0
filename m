Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7804F9E2B1F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 19:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F3910EB0F;
	Tue,  3 Dec 2024 18:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="SbbsQnMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8DB10E470
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:49:17 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20241203134150euoutp010288a5cebe93814e779a47836dfa1e79~NroM1gzRu2539825398euoutp01P
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:41:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20241203134150euoutp010288a5cebe93814e779a47836dfa1e79~NroM1gzRu2539825398euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1733233310;
 bh=1/RUSqy8z7qqY1BjiCEiLnyHhx+pcleNn7qHqtrgwrU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SbbsQnMOtN/1EwGrDqpn/TiB2n/j0/7nTinqkLmZzeokcAkjdwMpqviNj8s/G6syy
 Jc0wuufDZU3263B5BhTpzkhLicP6UbvS4RpoIrkIEqM67Lg+KWbauMZy8lfuGWj0iV
 BNcH9loIVN+cKH6LrGlfFiwsgH/eO6DDVW5riazk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20241203134149eucas1p26d4e37c6ebea696d2083970234bc1b49~NroMV1e_i1693616936eucas1p2R;
 Tue,  3 Dec 2024 13:41:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 8E.BA.20821.D9A0F476; Tue,  3
 Dec 2024 13:41:49 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20241203134148eucas1p1dd37e9cac92aada509d87f5178e337e8~NroLkLIBS1743017430eucas1p1V;
 Tue,  3 Dec 2024 13:41:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20241203134148eusmtrp2e69bbb8091fed34d7595f5f864e76e5c~NroLjQb3U3035030350eusmtrp2r;
 Tue,  3 Dec 2024 13:41:48 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-5a-674f0a9d697a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 35.C8.19920.C9A0F476; Tue,  3
 Dec 2024 13:41:48 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20241203134146eusmtip26b29909df8dbdb5a3135b5a036b07585~NroJfvIDp3010130101eusmtip2S;
 Tue,  3 Dec 2024 13:41:46 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
 <m.wilczynski@samsung.com>
Subject: [RFC PATCH v1 00/14] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Date: Tue,  3 Dec 2024 14:41:23 +0100
Message-Id: <20241203134137.2114847-1-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1RTZRjuu/fu3rnT4DIxv6gOuHPMsgT0UH6ZJ4LynGtWYh4Op6xoyW1T
 x7BNpJITJLDDjyHJEcLNNbDlOEN+CZsbAUNAhkizJJH4sUDp2IgkfoZ6wDYulv897/O87/s8
 73c+Pi6qJYP4+xSHWKVCIheTAsLacce1QS/YKQ3/oSUEdV4/jSHLPS2Fzja5MGRod/GQ+2o9
 hn6ZnSBR1e8/UeiPpq8I1Fuup1BGRzWJPFo3iSY1bh7qaThFoun8doCs05kkqmwfolD1rAFD
 ZZMWAhltDQCpc87w0M9d25CnR4MjtdYf3W+0UWixt5ZAutsOCtWPH+chZ2UcynScIF59ipno
 y6KYcY+HYNqyZyimaa6UYOzaIYrR2LsBc86cQzKDvY0k8+2lXcxveU6MqTOmMZmVHRgz0XyN
 ZI7VmwFzNeM6xdRdPhIT8J5gawIr33eYVYa98pFAtlCoIw+60WfHR0qIdDAXmgtW8CEdAQ36
 vykfFtHlAM7kruHwDIBF7rhcIPDiaQDNhVnUg4Hs/EaCE0wAloy08bhiHMDuUiPm6yLpTXDY
 ZFgSAuk/cdg3+yvpK3D6FoDW0VOkr2slHQe7a+aX9hL0WugwLS7xQjoS9nw/h3F+wdBx4Uec
 4wPgpZOjhA/jXj7DosN9SyFdJoAV6gHADbwO8xfu8Di8Eo4565eDPwnv2w3LS5PgsGUK53Aq
 tGucy/hlOOi66w3B9xo8C6sbwjg6Cvaf11M+GtJ+sO+vAC6CHyy0foNztBBmq0Vc99OwSJP/
 n6mr3LpsysCL6fcI7nk/gNkLA8TXIET70GHahw7T/p+hFOBmsJpNViVKWdVGBZsSqpIkqpIV
 0tC9SYnngPdXX150TtmAfmwytBVgfNAKIB8XBwpN1TukImGC5PMvWGVSvDJZzqpawRN8Qrxa
 uDYhmBXRUskh9gDLHmSVD1SMvyIoHSuoad1wcfeW/hSN+EBswbqYFy7MLMi2fqw9HW8cDGyJ
 HfNEN5odbzBT24vRW9/FJj1+TTetPXz2uYIXc/YEdPuNRlJhJZtSbEdXuU3oZqSn7ZniSUGz
 6EOZQarZfGv/sfYd70vPy+VDMGv3kT5HXFZG0JXcmP4TJSfjTX7hR7u2sXdTH+k4Q4ilabIy
 cW9LV8V6V1WnZT5xeHPKp0X734zS8zvVN952zecqVbvcz+dVvWS8ES8ayNvib/GPumlDiXF7
 JjMjdlZE4++E1Mr+6W9+zD4YoagZuJKxd2QRwwLSw3XqcfPMow39r1neNUbfXvVJTWpxsKJA
 sq6qRPfl9jqHOk1MqGSSjetxpUryL03qZglEBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsVy+t/xe7pzuPzTDW4e1bQ4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVq8vNzDbNE2
 i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
 AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPN7vu8rm0bdlFaPH
 pebr7B6bT1cHCEbp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSW
 pRbp2yXoZfydNJut4J5FxcSHM1gaGL/pdTFyckgImEh09O5h6WLk4hASWMooce7tHRaIhIzE
 te6XULawxJ9rXWwQRa8YJdZfaGMHSbAJGEk8WD6fFSQhItDJIvF281pGEIdZ4C2jxPWZG8Ha
 hQVCJeYdPQjWwSKgKrF/+T82EJtXwF7i8tJvTBAr5CX2HzzLDBEXlDg58wlQLwfQIHWJ9fOE
 QMLMQCXNW2czT2Dkn4WkahZC1SwkVQsYmVcxiqSWFuem5xYb6hUn5haX5qXrJefnbmIEJpVt
 x35u3sE479VHvUOMTByMhxglOJiVRHiXr/dOF+JNSaysSi3Kjy8qzUktPsRoCnT1RGYp0eR8
 YFrLK4k3NDMwNTQxszQwtTQzVhLndbt8Pk1IID2xJDU7NbUgtQimj4mDU6qBqUjhxq2nU9Rv
 9126t0i1avUSV9vZUU4Lz/zbqFlhNu0+h4lMMbN0vdx0oVsPv3WVCn51YjTzYLtxPddtb8cu
 cQGvSzPvpmRp3F3eyi/wJjHp9oWq+isWoWfcJwS+9uQUMbz5lq+5452HS8EN5lMswb4fdaWT
 rFYkCcnyt7a8U8hf/it1++HTqrvydU/bf0vq5/YzfLFWpq5avVm+zmBuQKGO+TuO6gnciyb0
 r9z/JN9zxje25ZxHPi07Ys5okcn0PdW/5qDFc6nDcw7/a0tbI7EgI9Xp/Xb2O5riDIdOvGHv
 //XYb4GQ5P/6fQUvHVpkfUUqb1cY79qikfkqKFuC0fpCmI1tw4Kpq3UFz1YpsRRnJBpqMRcV
 JwIAiV7idrMDAAA=
X-CMS-MailID: 20241203134148eucas1p1dd37e9cac92aada509d87f5178e337e8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241203134148eucas1p1dd37e9cac92aada509d87f5178e337e8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134148eucas1p1dd37e9cac92aada509d87f5178e337e8
References: <CGME20241203134148eucas1p1dd37e9cac92aada509d87f5178e337e8@eucas1p1.samsung.com>
X-Mailman-Approved-At: Tue, 03 Dec 2024 18:40:35 +0000
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
protocol messaging via the hardware mailbox. While support for the mailbox was
merged in kernel 6.13 [13], the AON protocol implementation is still in development.
Therefore, this series focuses on preparing the groundwork without full power
management support at this time.

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

Michal Wilczynski (14):
  clk: thead: Refactor TH1520 clock driver to share common code
  dt-bindings: clock: thead,th1520: Rename header file
  clk: thead: Enable clock gates with regmaps
  clk: thead: Add clock driver for TH1520 Video Output subsystem
  dt-bindings: clock: thead,th1520: Add support for Video Output
    subsystem
  dt-bindings: clock: thead,th1520: Rename YAML schema file
  soc: thead: power-domain: Add skeleton power-domain driver for TH1520
  dt-bindings: power: thead,th1520: Add support for power domains
  riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
  drm/imagination: Add support for IMG BXM-4-64 GPU
  drm/imagination: Enable PowerVR driver for RISC-V
  riscv: dts: Add Video Output clock and syscon regmap nodes
  riscv: dts: Introduce power domain node with simple-bus compatible
  riscv: dts: Add GPU node to TH1520 device tree

 .../bindings/clock/thead,th1520-clk-ap.yaml   |  53 ---
 .../bindings/clock/thead,th1520-clk.yaml      |  72 +++++
 .../bindings/mailbox/thead,th1520-mbox.yaml   |   2 +-
 .../bindings/power/thead,th1520-power.yaml    |  52 +++
 MAINTAINERS                                   |   9 +-
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  37 ++-
 drivers/clk/thead/Kconfig                     |  11 +
 drivers/clk/thead/Makefile                    |   3 +-
 drivers/clk/thead/clk-th1520-ap.c             | 301 +-----------------
 drivers/clk/thead/clk-th1520-vo.c             | 168 ++++++++++
 drivers/clk/thead/clk-th1520.c                | 194 +++++++++++
 drivers/clk/thead/clk-th1520.h                | 149 +++++++++
 drivers/gpu/drm/imagination/Kconfig           |   2 +-
 drivers/gpu/drm/imagination/pvr_drv.c         |   1 +
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/thead/Kconfig                |  12 +
 drivers/pmdomain/thead/Makefile               |   2 +
 drivers/pmdomain/thead/th1520-pm-domains.c    | 195 ++++++++++++
 ...ead,th1520-clk-ap.h => thead,th1520-clk.h} |  34 ++
 .../dt-bindings/power/thead,th1520-power.h    |  19 ++
 22 files changed, 960 insertions(+), 359 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/thead,th1520-clk.yaml
 create mode 100644 Documentation/devicetree/bindings/power/thead,th1520-power.yaml
 create mode 100644 drivers/clk/thead/clk-th1520-vo.c
 create mode 100644 drivers/clk/thead/clk-th1520.c
 create mode 100644 drivers/clk/thead/clk-th1520.h
 create mode 100644 drivers/pmdomain/thead/Kconfig
 create mode 100644 drivers/pmdomain/thead/Makefile
 create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
 rename include/dt-bindings/clock/{thead,th1520-clk-ap.h => thead,th1520-clk.h} (71%)
 create mode 100644 include/dt-bindings/power/thead,th1520-power.h

-- 
2.34.1

