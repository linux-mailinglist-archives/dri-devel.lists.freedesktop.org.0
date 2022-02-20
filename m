Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376ED4BCF1F
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 15:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9084E1124B5;
	Sun, 20 Feb 2022 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DA341124A8
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 14:56:06 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:45934.2136022094
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id EB34A100294;
 Sun, 20 Feb 2022 22:55:55 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 a74a3e6ba36d472c8c6f76fc73a8ac17 for mripard@kernel.org; 
 Sun, 20 Feb 2022 22:55:59 CST
X-Transaction-ID: a74a3e6ba36d472c8c6f76fc73a8ac17
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
Subject: [PATCH v10 0/4] drm/lsdc: add drm driver for loongson display
 controller
Date: Sun, 20 Feb 2022 22:55:50 +0800
Message-Id: <20220220145554.117854-1-15330273260@189.cn>
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
is intend to be used. While LS2K1000 is a SoC, only system memory is
available. Therefore CMA helper based driver is intend to be used. It is
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
sil9022 ite66121 and lt8618 etc.

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
   3) Fix typos.

v6:
   1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty uppdate implement based
      on CMA helper.
   4) Code clean up

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
   2) Fix typos
   3) Fix warnings reported by kernel test robot

suijingfeng (4):
  MIPS: Loongson64: dts: update the display controller device node
  Documentation/dt: Add descriptions for loongson display controller
  drm/lsdc: add drm driver for loongson display controller
  MAINTAINERS: add maintainers for DRM LSDC driver

 .../loongson/loongson,display-controller.yaml | 122 ++++
 MAINTAINERS                                   |   9 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   8 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +-
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/lsdc/Kconfig                  |  21 +
 drivers/gpu/drm/lsdc/Makefile                 |  13 +
 drivers/gpu/drm/lsdc/lsdc_connector.c         | 331 +++++++++
 drivers/gpu/drm/lsdc/lsdc_connector.h         |  35 +
 drivers/gpu/drm/lsdc/lsdc_crtc.c              | 338 +++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c               | 672 ++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h               | 205 ++++++
 drivers/gpu/drm/lsdc/lsdc_encoder.c           |  51 ++
 drivers/gpu/drm/lsdc/lsdc_i2c.c               | 195 +++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h               |  37 +
 drivers/gpu/drm/lsdc/lsdc_irq.c               |  57 ++
 drivers/gpu/drm/lsdc/lsdc_irq.h               |  17 +
 drivers/gpu/drm/lsdc/lsdc_plane.c             | 517 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c               | 573 +++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h               |  87 +++
 drivers/gpu/drm/lsdc/lsdc_regs.h              | 199 ++++++
 22 files changed, 3492 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
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

