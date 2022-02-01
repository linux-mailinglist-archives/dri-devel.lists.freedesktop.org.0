Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C74A6077
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 16:48:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A391010E639;
	Tue,  1 Feb 2022 15:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0104F10E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 15:48:30 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:39240.932732977
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 60BD31002A0;
 Tue,  1 Feb 2022 23:48:26 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 2bb72a98004f4164aa4ffa68e1b66efd for dan.carpenter@oracle.com; 
 Tue, 01 Feb 2022 23:48:28 CST
X-Transaction-ID: 2bb72a98004f4164aa4ffa68e1b66efd
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Dan Carpenter <dan.carpenter@oracle.com>, Sam <Ravnborgsam@ravnborg.org>,
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
Subject: [PATCH v4 0/3] drm/lsdc: add drm driver for loongson display
 controller
Date: Tue,  1 Feb 2022 23:48:18 +0800
Message-Id: <20220201154821.3058-1-15330273260@189.cn>
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
Cc: linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v4: add dts required and explain why device tree is required.
    give more description about the code.
    fix warnings reported by kernel test robot.
    introduce stride_alignment member into struct lsdc_chip_desc,
    the stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500
    SoC. But ls7a2000 improve it to 32 bytes.

v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
    more details about lsdc.

v2: fixup warnings reported by kernel test robot

There is a display controller in loongson's LS2K1000 SoC and LS7A1000
bridge, and the DC in those chip is a PCI device. This display controller
have two display pipes but with only one hardware cursor. Each way has a
DVO output interface and the CRTC is able to scanout from 1920x1080
resolution at 60Hz. LS2K1000 is a SoC, only system memory is available.
Therefore scanout form system memory is the only choice and we prefer the
cma helper base solution even through it is possible to use VRAM helper
base solution on ls2k1000 by carving out part of system memory as VRAM.

The dc in ls7a1000 can scanout from both the system memory and the dedicate
VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
VRAM is proved to be a reliable solution for massive product. Scanout from
the system memory suffer from some hardware deficiency which cause the
screen flickering under RAM pressure. This is the reason why we integrate
two distict helpers into one piece of device driver.

    +------+
    | DDR4 |
    +------+
       || MC0            +-----------------------+------------+
  +----------+   Hyper   |         LS7A1000      |    DDR3    |   +------+
  | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
  |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
  +----------+ Transport | +--------+  +-+---+-+ +------------|
       || MC1            +---------------|---|----------------+
    +------+                             |   |
    | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
    +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
                      +-------+                       +------+

The above picture give a simple usage of LS7A1000, note that the encoder is
not necessary adv7125 or tfp410, it is a choice of the downstream board
manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
etc. This is the reason why we still need device tree to provide board
specific information. Beside, the dc in both ls2k1000 and ls7k1000 have
the vendor:device id of 0x0014:0x7a06. even the reverison id is also same.
We can't tell it apart simply(this is the firmware engineer's mistake).
But firmware already flushed to the board and sold out, so we resolve those
issues by using the device tree which already have certain support.

Nevertheless, this patch try to provided a minimal support for this display
controller which is mainly for graphic environment bring up. Hope that the
code can speak for itself.

For ls7a1000, there are 4 gpios who register is located at dc register
space which is used to emulation i2c. LS2K1000 and LS2K0500 SoC don't
have those hardware, they use general purpose gpio or hardware i2c to
serve this purpose. For ladc, there is only a 1:1 mapping of encoders
and connectors.

     +-------------------+                                      _________
     |                   |                                     |         |
     |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monotor |
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
to RS780E or something like that. More details can be read from its user
manual[2].

This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
LS3A5000 is 4 core 2.5gHz loongarch cpu[3].

[1] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
[3] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>

suijingfeng (3):
  drm/lsdc: add drm driver for loongson display controller
  dt-bingdings: ls2k1000: add the display controller device node
  dt-bingdings: mips: loongson: introduce board specific dts

 arch/mips/boot/dts/loongson/lemote_a1901.dts  |  64 ++
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  11 +
 .../boot/dts/loongson/ls3a4000_7a1000_evb.dts |  69 ++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   2 +-
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/lsdc/Kconfig                  |  38 +
 drivers/gpu/drm/lsdc/Makefile                 |  15 +
 drivers/gpu/drm/lsdc/lsdc_connector.c         | 439 +++++++++
 drivers/gpu/drm/lsdc/lsdc_connector.h         |  60 ++
 drivers/gpu/drm/lsdc/lsdc_crtc.c              | 441 +++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c               | 838 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h               | 211 +++++
 drivers/gpu/drm/lsdc/lsdc_encoder.c           |  79 ++
 drivers/gpu/drm/lsdc/lsdc_i2c.c               | 220 +++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h               |  61 ++
 drivers/gpu/drm/lsdc/lsdc_irq.c               |  77 ++
 drivers/gpu/drm/lsdc/lsdc_irq.h               |  37 +
 drivers/gpu/drm/lsdc/lsdc_plane.c             | 688 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c               | 613 +++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h               | 109 +++
 drivers/gpu/drm/lsdc/lsdc_regs.h              | 246 +++++
 22 files changed, 4320 insertions(+), 1 deletion(-)
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

