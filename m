Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6994A8045
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 09:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0D410E6FE;
	Thu,  3 Feb 2022 08:25:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 025CF10E6FE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 08:25:52 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55068.1434336740
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id E05AB1001CB;
 Thu,  3 Feb 2022 16:25:49 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 780822ac88464bbbba6e583d96b43c4a for dan.carpenter@oracle.com; 
 Thu, 03 Feb 2022 16:25:50 CST
X-Transaction-ID: 780822ac88464bbbba6e583d96b43c4a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Roland Scheidegger <sroland@vmware.com>, Zack Rusin <zackr@vmware.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Sam Ravnborg <sam@ravnborg.org>, suijingfeng <suijingfeng@loongson.cn>
Subject: [PATCH v6 0/3] drm/lsdc: add drm driver for loongson display
 controller
Date: Thu,  3 Feb 2022 16:25:43 +0800
Message-Id: <20220203082546.3099-1-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a display controller in loongson's LS2K1000 SoC and LS7A1000
bridge, and the DC in those chip is a PCI device. This patch provide
a minimal support for this display controller which is mainly for
graphic environment bring up.

This display controller has two display pipes but with only one hardware
cursor. Each way has a DVO output interface and the CRTC is able to scanout
from 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048@60hz.

LS2K1000 is a SoC, only system memory is available. Therefore scanout from
system memory is the only choice. We prefer the CMA helper base solution
because the gc1000 gpu can use etnaviv driver, in this case etnaviv and
lsdc could made a compatible pair. Even through it is possible to use VRAM
helper base solution on ls2k1000 by carving out part of system memory as
VRAM.

For LS7A1000, there are 4 gpios whos control register is located at the dc
register space which is not the geneal purpose GPIO. The 4 gpios can emulate
two way i2c. One for DVO0, another for DVO1. This is the reason the why we
are not using the drm bridge framework.

LS2K1000 and LS2K0500 SoC don't have such hardware, they use general purpose
GPIO emulated i2c or hardware i2c adapter from other module to serve this
purpose. Drm bridge and drm panel is suitable for those SoC, we have already
implement it on our own downstream kernel. But due to the upstream kernel
don't have gpio, pwm and i2c driver support for LS2K1000. We just can not
upstream our support for the drm bridge subsystem.

The DC in LS7A1000 can scanout from both the system memory and the dedicate
VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
VRAM is proved to be a reliable solution for massive product. Scanout from
the system memory suffer from some hardware deficiency which cause the
screen flickering under RAM pressure. This is the reason why we integrate
two distict helpers into one piece of device driver. But CMA base helper is
still usable on ls7a1000 for normal usage, expecially on ls7a1000+ bridge
chip. We have also implemented demage update on top of CMA helper which
copy the demaged shadow framebuffer region from system RAM to the real
framebuffer in VRAM manually. Using "lsdc.dirty_update=1" in the commmand
line will enable this driver mode.

LS7A1000 have a 32x32 harware cursor, we just let the two CRTC share it
simply with the help of universe plane. LS7A2000 have two 64x64 harware
cursor. Surport for LS7A2000 is on the way.

In short, we have built-in gpio emulated i2c support, we also have hardware
cursor support. The kind of tiny drivers in drm/tiny is not suitable for us,
we are not "tiny".

    +------+  HyperTransport 3.0
    | DDR4 |       |
    +------+       |     +------------------------------------+
       || MC0      |     |   LS7A1000            +------------|
  +----------+     |     |                       |    DDR3    |   +------+
  | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
  |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
  +----------+           | +--------+  +-+---+-+ +------------|
       || MC1            +---------------|---|----------------+
    +------+                             |   |
    | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
    +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
                      +-------+                       +------+

The above picture give a simple usage of LS7A1000, note that the encoder
is not necessary adv7125 or tfp410, it is a choice of the downstream board
manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
etc. Therefore, we need device tree to provide board specific information.
Besides, the dc in both ls2k1000 and ls7k1000 have the vendor:device id of
0x0014:0x7a06, the reverison id is also same. We can't tell it apart simply
(this is the firmware engineer's mistake). But firmware already flushed to
the board and borad already sold out, we choose to resolve those issues by
introduing device tree with board specific device support.

For lsdc, there is only a 1:1 mapping of encoders and connectors.

     +-------------------+                                      _________
     |                   |                                     |         |
     |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monitor |
     |                   |           ^            ^            |_________|
     |                   |           |            |
     |                <----- i2c0 ----------------+
     |   LSDC IP CORE    |
     |                <----- i2c1 ----------------+
     |                   |           |            |             _________
     |                   |           |            |            |         |
     |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
     |                   |                                     |_________|
     +-------------------+

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

Nearly all mordern loongson CPU's cache coherency is maintained by hardware,
except for early version of ls2k1000. So we using cached coherent memory by
default, not writecombine.

v2: fixup warnings reported by kernel test robot

v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
    more details about lsdc.

v4:
   1) Add dts required and explain why device tree is required.
   2) Give more description about lsdc and vram helper base driver.
   3) Fix warnings reported by kernel test robot.
   4) Introduce stride_alignment member into struct lsdc_chip_desc, the
      stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500 SoC.
      But ls7a2000 improve it to 32 bytes, We are prepare for extend the
      support for the on coming device.

v5:
   1) using writel and readl replace writeq and readq, to fix kernel test
      robot report build error on other archtecture
   2) set default fb format to XRGB8888 at crtc reset time.
   3) fix typos.

v6:
   1) Explain why we are not switch to drm dridge subsystem.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty uppdate implement based
      on CMA helper.
   4) code clean up.

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
[3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot
Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>

suijingfeng (3):
  drm/lsdc: add drm driver for loongson display controller
  dt-bindings: ls2k1000: add the display controller device node
  dt-bindings: mips: loongson: introduce board specific dts

 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  64 ++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  11 +
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts |  68 ++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   2 +-
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/lsdc/Kconfig                  |  38 +
 drivers/gpu/drm/lsdc/Makefile                 |  15 +
 drivers/gpu/drm/lsdc/lsdc_connector.c         | 443 +++++++++
 drivers/gpu/drm/lsdc/lsdc_connector.h         |  60 ++
 drivers/gpu/drm/lsdc/lsdc_crtc.c              | 440 +++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c               | 846 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h               | 216 +++++
 drivers/gpu/drm/lsdc/lsdc_encoder.c           |  79 ++
 drivers/gpu/drm/lsdc/lsdc_i2c.c               | 220 +++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h               |  61 ++
 drivers/gpu/drm/lsdc/lsdc_irq.c               |  77 ++
 drivers/gpu/drm/lsdc/lsdc_irq.h               |  37 +
 drivers/gpu/drm/lsdc/lsdc_plane.c             | 681 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c               | 657 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h               | 109 +++
 drivers/gpu/drm/lsdc/lsdc_regs.h              | 246 +++++
 22 files changed, 4372 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/lemote_a1901.dts
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
2.20.1

