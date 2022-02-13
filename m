Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDB74B3BAE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 15:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5160310E309;
	Sun, 13 Feb 2022 14:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id AEEFE10E309
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 14:16:55 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:34274.536114013
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id A882C100139;
 Sun, 13 Feb 2022 22:16:51 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 ebba22aeed614101910b8b306142232d for mripard@kernel.org; 
 Sun, 13 Feb 2022 22:16:52 CST
X-Transaction-ID: ebba22aeed614101910b8b306142232d
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
 Li Yi <liyi@loongson.cn>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v7 0/7] drm/lsdc: add drm driver for loongson display
 controller
Date: Sun, 13 Feb 2022 22:16:42 +0800
Message-Id: <20220213141649.1115987-1-15330273260@189.cn>
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
bridge chip, the DC is a PCI device in those chips. It has two display
pipes but with only one hardware cursor. Each way has a DVO interface
which provide RGB888 signals, vertical & horizontal synchronisations,
data enable and the pixel clock. Each CRTC is able to scanout from
1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048
according to the hardware spec.

Loongson display controllers are simple which require scanout buffers
to be physically contiguous. LS2K1000 is a SOC, Only system memory is
available. Therefore CMA helper based driver is intended to be use,
although it is possible to use VRAM helper based solution by carving
out part of system memory as VRAM.

On LS7A1000/LS7A2000 bridge chip, the DC is equipped with a dedicated
video memory which is typically 64MB or more. In this case, VRAM helper
based solution which scanout from local VRAM is reconmended to use.
It is reliable to use for massive production, but CMA based helper
solution is still usable on ls7a1000 and ls7a2000, at the price of
the CRTC must access the FB in RAM through the PCIe bus and HT3.0 bus.
This causes continuous traffic on the bus regardless of whether the FB
image is updating or not. Sadly, it suffer from screen flickering under
RAM pressure on LS7A1000. Luckily, It show extremely good condition on
LS7A2000 even under stressapptest, Maybe the hardware engineer resolve
this issue. Integrating two distict helpers based driver into one piece
allow code sharing.

We have also implemented demage update on top of CMA helper which copy
the demaged region from the shadow framebuffer in system RAM to the real
framebuffer in VRAM manually. This is intend to overcome the screen
flicking issue on LS7A1000, but the performance is not good.
Using "lsdc.dirty_update=1" in the kernel commmand line if you would like
to have a try.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space, They are used to emulate two way i2c.
One for DVO0, another for DVO1. This is the reason why this driver is
not switch to drm bridge framework yet. LS2K1000 and LS2K0500 SoC don't
have such GPIO hardwared, they grab i2c adapter from other module,
either general purpose GPIO emulated i2c or hardware i2c adapter.
Drm bridge and drm panel driver for the external encoder is suitable for
those SoC. We have already implemented this on our downstream 4.19.190
kernel. But due to the GPIO, PWM and I2C device driver support for
LS2K1000 is not upstreamed yet, this driver still can be use to bring
the graphic environment up by providing display timings or similar things
in the device tree.

The DC in LS7A1000 has only one hardware cursor, we simply let the two
CRTC share it. The DC in LS7A2000 have two cursor, two built-in hdmi
encoder and one transparent vga encoder and more, surport for LS7A2000
is on the way. In short, we have built-in gpio emulated i2c support,
we also have hardware cursor support. LS7A2000 The kind of tiny drivers
in drm/tiny is not suitable for us.

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
is not necessary adv7125 or tfp410, it is a choice of the downstream board
manufacturer. Other candicate encoders can be ch7034b, sil9022 and ite66121
lt8618 etc. Besides, the DC in both ls2k1000 and ls7k1000 has the same of
PCI vendor id and pci device id. Both is 0x0014:0x7a06, the reverison id
is also same. This is the firmware engineer's mistake, but such firmware
and various boards ship with such firmware already released. We choose to
deduce the chip's identification from information provided by device tree.
For lsdc, there is only a 1:1 mapping of encoders and connectors.

Below is a brief introduction of loongson's CPU, bridge chip and SoC.
LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
a bridge chip made by Loongson corporation which act as north and/or south
bridge of loongson's desktop and server level processor. It is equivalent
to AMD RS780E+SB710 or something like that. More details can be read from
its user manual[2].

This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
LS3A5000 is 4 core 2.5gHz loongarch cpu[3].

Nearly all loongson cpu has the hardware maintain the cache coherency,
except for early version of ls2k1000 or ls3a2000. This is the most distinct
feature from other mips cpu.

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
[3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html

suijingfeng (7):
  drm/lsdc: add drm driver for loongson display controller
  MIPS: Loongson: ls7a-pch.dtsi: add has_dedicated_vram property
  MIPS: Loongson: introduce dts for ls3A4000 evaluation board
  MIPS: Loongson: introduce dts for lemote A1901 3a4000 motherboard
  MIPS: Loongson: ls2k1000: add the display controller device node
  MIPS: Loongson: Add dts for ls2k1000 pai evaluation board
  MAINTAINERS: add maintainers for DRM LSDC driver

 MAINTAINERS                                   |   9 +
 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  59 ++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  11 +
 arch/mips/boot/dts/loongson/ls2k1000_pai.dts  |  69 ++
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts |  61 ++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   3 +-
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/lsdc/Kconfig                  |  39 +
 drivers/gpu/drm/lsdc/Makefile                 |  13 +
 drivers/gpu/drm/lsdc/lsdc_connector.c         | 334 ++++++++
 drivers/gpu/drm/lsdc/lsdc_connector.h         |  38 +
 drivers/gpu/drm/lsdc/lsdc_crtc.c              | 341 ++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c               | 776 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h               | 217 +++++
 drivers/gpu/drm/lsdc/lsdc_encoder.c           |  54 ++
 drivers/gpu/drm/lsdc/lsdc_i2c.c               | 198 +++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h               |  40 +
 drivers/gpu/drm/lsdc/lsdc_irq.c               |  60 ++
 drivers/gpu/drm/lsdc/lsdc_irq.h               |  20 +
 drivers/gpu/drm/lsdc/lsdc_plane.c             | 572 +++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c               | 580 +++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h               |  90 ++
 drivers/gpu/drm/lsdc/lsdc_regs.h              | 202 +++++
 24 files changed, 3788 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls2k1000_pai.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a4000_7a1000_evb.dts
 create mode 100644 drivers/gpu/drm/lsdc/Kconfig
 create mode 100644 drivers/gpu/drm/lsdc/Makefile
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_encoder.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
 create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h

-- 
2.25.1

