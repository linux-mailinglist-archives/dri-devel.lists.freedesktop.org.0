Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E74EF7C5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 18:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE04110E0F1;
	Fri,  1 Apr 2022 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E32310E0F1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 16:23:10 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38814.38631177
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A3891100207;
 Sat,  2 Apr 2022 00:22:53 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 643e5b21678247c69198971f03a9a550 for mripard@kernel.org; 
 Sat, 02 Apr 2022 00:23:07 CST
X-Transaction-ID: 643e5b21678247c69198971f03a9a550
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
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
Subject: [PATCH v14 0/6] drm/loongson: add drm driver for loongson display
 controller
Date: Sat,  2 Apr 2022 00:22:45 +0800
Message-Id: <20220401162251.1665081-1-15330273260@189.cn>
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
bridge chip, the display controller is a PCI device. It have two display
pipes but with only one hardware cursor. Each way has a DVO interface
which provide RGB888 signals, vertical & horizontal synchronisations,
data enable and the pixel clock.

Each CRTC is able to drive a 1920x1080@60Hz monitor, the maxmium
resolution is 2048x2048. Loongson display controllers are simple which
require scanout buffers to be physically contiguous.

For LS7A1000 bridge chip, the DC is equipped with a dedicated video RAM
which is typically 64MB or more. In this case, VRAM helper based driver
is intended to be used even through the DC can scanout form system memory.

While LS2K1000 is a SoC which is a typically UMA device, only system
memory is available. Therefore CMA helper based driver is intended to be
used. It is possible to use VRAM helper based driver on LS2K1000 by
carving out part of system memory as VRAM though.

For LS7A1000, there are 4 dedicated GPIOs whose control registers is
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
this is the most distinct feature from other Mips cpu.

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
[3] https://ee-paper.com/loongson-3a4000-3b4000-motherboard-products-are-compatible-with-uos-system/
[4] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
[5] https://github.com/loongson-community/pmon

Sui Jingfeng (6):
  MIPS: Loongson64: dts: update the display controller device node
  MIPS: Loongson64: introduce board specific dts and add model property
  dt-bindings: display: Add Loongson display controller
  MIPS: Loongson64: defconfig: enable display bridge drivers
  drm/loongson: add drm driver for loongson display controller
  MAINTAINERS: add maintainers for DRM LOONGSON driver

 .../loongson/loongson,display-controller.yaml | 295 +++++++++
 MAINTAINERS                                   |   9 +
 arch/mips/boot/dts/loongson/Makefile          |   4 +
 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  96 +++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 +
 .../boot/dts/loongson/ls2k1000_pai_udb.dts    | 107 ++++
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts | 138 +++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  22 +-
 arch/mips/configs/loongson2k_defconfig        |   5 +
 arch/mips/configs/loongson3_defconfig         |   5 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/loongson/Kconfig              |  25 +
 drivers/gpu/drm/loongson/Makefile             |  16 +
 drivers/gpu/drm/loongson/lsdc_crtc.c          | 400 ++++++++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.c       | 176 ++++++
 drivers/gpu/drm/loongson/lsdc_debugfs.h       |  17 +
 drivers/gpu/drm/loongson/lsdc_drv.c           | 413 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_drv.h           | 186 ++++++
 drivers/gpu/drm/loongson/lsdc_i2c.c           | 268 ++++++++
 drivers/gpu/drm/loongson/lsdc_i2c.h           |  38 ++
 drivers/gpu/drm/loongson/lsdc_irq.c           |  57 ++
 drivers/gpu/drm/loongson/lsdc_irq.h           |  17 +
 drivers/gpu/drm/loongson/lsdc_output.c        | 261 ++++++++
 drivers/gpu/drm/loongson/lsdc_output.h        |  21 +
 drivers/gpu/drm/loongson/lsdc_pci_drv.c       | 342 +++++++++++
 drivers/gpu/drm/loongson/lsdc_plane.c         | 436 +++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.c           | 573 ++++++++++++++++++
 drivers/gpu/drm/loongson/lsdc_pll.h           |  87 +++
 drivers/gpu/drm/loongson/lsdc_regs.h          | 219 +++++++
 30 files changed, 4239 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls2k1000_pai_udb.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
 create mode 100644 drivers/gpu/drm/loongson/Kconfig
 create mode 100644 drivers/gpu/drm/loongson/Makefile
 create mode 100644 drivers/gpu/drm/loongson/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_debugfs.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_output.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pci_drv.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/loongson/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/loongson/lsdc_regs.h

-- 
2.25.1

