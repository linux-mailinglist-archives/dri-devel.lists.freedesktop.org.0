Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B44E2DEA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 17:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE5410E239;
	Mon, 21 Mar 2022 16:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2243210E239
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 16:29:42 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:55736.678671471
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 33F3C100220;
 Tue, 22 Mar 2022 00:29:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 0c35af51f0864157835f1b318a6682de for mripard@kernel.org; 
 Tue, 22 Mar 2022 00:29:39 CST
X-Transaction-ID: 0c35af51f0864157835f1b318a6682de
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, "David S . Miller" <davem@davemloft.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ilia Mirkin <imirkin@alum.mit.edu>, Qing Zhang <zhangqing@loongson.cn>,
 suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v11 0/7] drm/lsdc: add drm driver for loongson display
 controller
Date: Tue, 22 Mar 2022 00:29:09 +0800
Message-Id: <20220321162916.1116541-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a display controller in loongson's LS2K1000 SoC and LS7A1000
bridge chip, the display controller is a PCI device in those chips. It
has two display pipes but with only one hardware cursor. Each way has
a DVO interface which provide RGB888 signals, vertical & horizontal
synchronisations, data enable and the pixel clock. Each CRTC is able to
scanout from 1920x1080 resolution at 60Hz, the maxmium resolution is
2048x2048 according to the hardware spec. Loongson display controllers
are simple which require scanout buffers to be physically contiguous.

For LS7A1000 bridge chip, the DC is equipped with a dedicated video RAM
which is typically 64MB or more. In this case, VRAM helper based driver
is suppose to be used. While LS2K1000 is a SoC, only system memory is
available, therefore CMA helper based driver is intend to be used. It is
possible to use VRAM helper based solution by carving out part of system
memory as VRAM though.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space, They are used to emulate two way i2c.
One for DVO0, another for DVO1. LS2K1000 and LS2K0500 SoC don't have such
GPIO hardwared, they grab i2c adapter from other module, either general
purpose GPIO emulated i2c or hardware i2c adapter.

    +------+            +-----------------------------------+
    | DDR4 |            |  +-------------------+            |
    +------+            |  | PCIe Root complex |   LS7A1000 |
       || MC0           |  +--++---------++----+            |
  +----------+  HT 3.0  |     ||         ||                 |
  | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
  |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
  +----------+          | +--------+  +-+--+-+    +---------+   +------+
       || MC1           +---------------|--|----------------+
    +------+                            |  |
    | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
    +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
                      +-------+                      +------+

The above picture give a simple usage of LS7A1000, note that the encoder
is not necessary adv7125 or tfp410, other candicates can be ch7034b,
sil9022, ite66121 and lt8618 etc.

v2: Fixup warnings reported by kernel test robot

v3: Fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
    more details about lsdc.

v4:
   1) Add dts required and explain why device tree is required.
   2) Give more description about lsdc and VRAM helper based driver.
   3) Fix warnings reported by kernel test robot.
   4) Introduce stride_alignment member into struct lsdc_chip_desc, the
      stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500.

v5:
   1) Using writel and readl replace writeq and readq, to fix kernel test
      robot report build error on other archtecture.
   2) Set default fb format to XRGB8888 at crtc reset time.

v6:
   1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty uppdate implement based
      on CMA helper.

v7:
   1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not ready now
   2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
   3) Remove lsdc_pixpll_print(), part of it move to debugfs.
   4) Set prefer_shadow to true if vram based driver is in using.
   5) Replace double blank lines with single line in all files.
   6) Verbose cmd line parameter is replaced with drm_dbg()
   7) All warnnings reported by ./scripts/checkpatch.pl --strict are fixed
   8) Get edid from dtb support is removed as suggested by Maxime Ripard
   9) Fix typos and various improvement

v8:
   1) Drop damage update implement and its command line.
   2) Drop DRM_LSDC_VRAM_DRIVER config option as suggested by Maxime.
   3) Deduce DC's identification from its compatible property.
   4) Drop the board specific dts patch.
   5) Add documention about the display controller device node.

v9:
   1) Fix the warnings reported by checkpatch script and fix typos

v10:
   1) Pass `make dt_binding_check` validation
   2) Fix warnings reported by kernel test robot

v11:
   1) Convert the driver to use drm bridge and of graph framework.
   2) Dump register value support through debugfs.

Below is a brief introduction of loongson's CPU, bridge chip and SoC.
LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
a bridge chip made by Loongson corporation which act as north and/or south
bridge of loongson's desktop and server level processor. It is equivalent
to AMD RS780E+SB710 or something like that. More details can be read from
its user manual[2].

This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu[3].
LS3A5000 is 4 core 2.5gHz loongarch cpu[4].

Nearly all loongson cpu has the hardware maintain the cache coherency,
except for early version of ls2k1000 or ls3a2000. This is the most distinct
feature from other Mips cpu.

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
[3] https://ee-paper.com/loongson-3a4000-3b4000-motherboard-products-are-compatible-with-uos-system/
[4] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
[5] https://github.com/loongson-community/pmon

suijingfeng (7):
  MIPS: Loongson64: dts: update the display controller device node
  MIPS: Loongson64: dts: introduce ls3A4000 evaluation board
  MIPS: Loongson64: dts: introduce lemote A1901 motherboard
  MIPS: Loongson64: dts: introduce ls2k1000 pai evaluation board
  dt-bindings: display: Add Loongson display controller
  MIPS: Loongson64: defconfig: enable display bridge drivers on Loongson64
  drm/lsdc: add drm driver for loongson display controller

 .../loongson/loongson,display-controller.yaml | 230 +++++++
 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  92 +++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  24 +
 arch/mips/boot/dts/loongson/ls2k1000_pai.dts  | 102 ++++
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 136 +++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  36 +-
 arch/mips/configs/loongson2k_defconfig        |   5 +
 arch/mips/configs/loongson3_defconfig         |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/lsdc/Kconfig                  |  23 +
 drivers/gpu/drm/lsdc/Makefile                 |  13 +
 drivers/gpu/drm/lsdc/lsdc_crtc.c              | 396 ++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c               | 547 +++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h               | 197 ++++++
 drivers/gpu/drm/lsdc/lsdc_i2c.c               | 235 +++++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h               |  42 ++
 drivers/gpu/drm/lsdc/lsdc_irq.c               |  58 ++
 drivers/gpu/drm/lsdc/lsdc_irq.h               |  18 +
 drivers/gpu/drm/lsdc/lsdc_output.c            | 262 ++++++++
 drivers/gpu/drm/lsdc/lsdc_output.h            |  24 +
 drivers/gpu/drm/lsdc/lsdc_pci_drv.c           | 328 ++++++++++
 drivers/gpu/drm/lsdc/lsdc_plane.c             | 470 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c               | 574 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h               |  88 +++
 drivers/gpu/drm/lsdc/lsdc_regs.h              | 220 +++++++
 26 files changed, 4123 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls2k1000_pai.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
 create mode 100644 drivers/gpu/drm/lsdc/Kconfig
 create mode 100644 drivers/gpu/drm/lsdc/Makefile
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pci_drv.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h

-- 
2.25.1

