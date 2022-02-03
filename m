Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F4E4A94D3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 09:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E0910F28F;
	Fri,  4 Feb 2022 08:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 294A610FA5C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:14:44 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:59398.688799494
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id A6AA2100181;
 Thu,  3 Feb 2022 22:14:39 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 2134fc66d6564a16af17821a7a32b675 for maxime@cerno.tech; 
 Thu, 03 Feb 2022 22:14:41 CST
X-Transaction-ID: 2134fc66d6564a16af17821a7a32b675
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Content-Type: multipart/alternative;
 boundary="------------0TAO3GCQXnoVqOnX0h0dN0s0"
Message-ID: <ced757ac-373f-b415-ad80-9026098531fd@189.cn>
Date: Thu, 3 Feb 2022 22:14:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220203085851.yqstkfgt4dz7rcnw@houat>
X-Mailman-Approved-At: Fri, 04 Feb 2022 08:01:55 +0000
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------0TAO3GCQXnoVqOnX0h0dN0s0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2022/2/3 16:58, Maxime Ripard wrote:
> Hi,
>
> On Thu, Feb 03, 2022 at 04:25:44PM +0800, Sui Jingfeng wrote:
>> From: suijingfeng<suijingfeng@loongson.cn>
>>
>> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
>> bridge, and the DC in those chip is a PCI device. This patch provide
>> a minimal support for this display controller which is mainly for
>> graphic environment bring up.
>>
>> This display controller has two display pipes but with only one hardware
>> cursor. Each way has a DVO output interface and the CRTC is able to scanout
>> from 1920x1080 resolution at 60Hz. The maxmium resolution is 2048x2048@60hz.
>>
>> LS2K1000 is a SoC, only system memory is available. Therefore scanout from
>> system memory is the only choice. We prefer the CMA helper base solution
>> because the gc1000 gpu can use etnaviv driver, in this case etnaviv and
>> lsdc could made a compatible pair. Even through it is possible to use VRAM
>> helper base solution on ls2k1000 by carving out part of system memory as
>> VRAM.
>>
>> For LS7A1000, there are 4 gpios whos control register is located at the dc
>> register space which is not the geneal purpose GPIO. The 4 gpios can emulate
>> two way i2c. One for DVO0, another for DVO1. This is the reason the why we
>> are not using the drm bridge framework.
>>
>> LS2K1000 and LS2K0500 SoC don't have such hardware, they use general purpose
>> GPIO emulated i2c or hardware i2c adapter from other module to serve this
>> purpose. Drm bridge and drm panel is suitable for those SoC, we have already
>> implement it on our own downstream kernel. But due to the upstream kernel
>> don't have gpio, pwm and i2c driver support for LS2K1000. We just can not
>> upstream our support for the drm bridge subsystem.
>>
>> The DC in LS7A1000 can scanout from both the system memory and the dedicate
>> VRAM attached to the ddr3 memory controller. Sadly, only scanout from the
>> VRAM is proved to be a reliable solution for massive product. Scanout from
>> the system memory suffer from some hardware deficiency which cause the
>> screen flickering under RAM pressure. This is the reason why we integrate
>> two distict helpers into one piece of device driver. But CMA base helper is
>> still usable on ls7a1000 for normal usage, expecially on ls7a1000+ bridge
>> chip. We have also implemented demage update on top of CMA helper which
>> copy the demaged shadow framebuffer region from system RAM to the real
>> framebuffer in VRAM manually. Using "lsdc.dirty_update=1" in the commmand
>> line will enable this driver mode.
>>
>> LS7A1000 have a 32x32 harware cursor, we just let the two CRTC share it
>> simply with the help of universe plane. LS7A2000 have two 64x64 harware
>> cursor. Surport for LS7A2000 is on the way.
>>
>> In short, we have built-in gpio emulated i2c support, we also have hardware
>> cursor support. The kind of tiny drivers in drm/tiny is not suitable for us,
>> we are not "tiny".
>>
>>      +------+  HyperTransport 3.0
>>      | DDR4 |       |
>>      +------+       |     +------------------------------------+
>>         || MC0      |     |   LS7A1000            +------------|
>>    +----------+     |     |                       |    DDR3    |   +------+
>>    | LS3A4000 |<--------->| +--------+  +-------+ |   memory   |<->| VRAM |
>>    |   CPU    |<--------->| | GC1000 |  |  LSDC | | controller |   +------+
>>    +----------+           | +--------+  +-+---+-+ +------------|
>>         || MC1            +---------------|---|----------------+
>>      +------+                             |   |
>>      | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
>>      +------+   VGA <--|ADV7125|<---------+   +------->|TFP410|--> DVI/HDMI
>>                        +-------+                       +------+
>>
>> The above picture give a simple usage of LS7A1000, note that the encoder
>> is not necessary adv7125 or tfp410, it is a choice of the downstream board
>> manufacturer. Other candicate encoder can be ch7034b, sil9022 and ite66121
>> etc. Therefore, we need device tree to provide board specific information.
>> Besides, the dc in both ls2k1000 and ls7k1000 have the vendor:device id of
>> 0x0014:0x7a06, the reverison id is also same. We can't tell it apart simply
>> (this is the firmware engineer's mistake). But firmware already flushed to
>> the board and borad already sold out, we choose to resolve those issues by
>> introduing device tree with board specific device support.
>>
>> For lsdc, there is only a 1:1 mapping of encoders and connectors.
>>
>>       +-------------------+                                      _________
>>       |                   |                                     |         |
>>       |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monitor |
>>       |                   |           ^            ^            |_________|
>>       |                   |           |            |
>>       |                <----- i2c0 ----------------+
>>       |   LSDC IP CORE    |
>>       |                <----- i2c1 ----------------+
>>       |                   |           |            |             _________
>>       |                   |           |            |            |         |
>>       |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
>>       |                   |                                     |_________|
>>       +-------------------+
>>
>> Below is a brief introduction of loongson's CPU, bridge chip and SoC.
>> LS2K1000 is a double core 1.0Ghz mips64r2 compatible SoC[1]. LS7A1000 is
>> a bridge chip made by Loongson corporation which act as north and/or south
>> bridge of loongson's desktop and server level processor. It is equivalent
>> to AMD RS780E+SB710 or something like that. More details can be read from
>> its user manual[2].
>>
>> This bridge chip is typically use with LS3A3000, LS3A4000 and LS3A5000 cpu.
>> LS3A3000 is 4 core 1.45gHz mips64r2 compatible cpu.
>> LS3A4000 is 4 core 1.8gHz mips64r5 compatible cpu.
>> LS3A5000 is 4 core 2.5gHz loongarch cpu[3].
>>
>> Nearly all mordern loongson CPU's cache coherency is maintained by hardware,
>> except for early version of ls2k1000. So we using cached coherent memory by
>> default, not writecombine.
>>
>> v2: fixup warnings reported by kernel test robot
>>
>> v3: fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>>      more details about lsdc.
>>
>> v4:
>>     1) Add dts required and explain why device tree is required.
>>     2) Give more description about lsdc and vram helper base driver.
>>     3) Fix warnings reported by kernel test robot.
>>     4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>>        stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500 SoC.
>>        But ls7a2000 improve it to 32 bytes, We are prepare for extend the
>>        support for the on coming device.
>>
>> v5:
>>     1) using writel and readl replace writeq and readq, to fix kernel test
>>        robot report build error on other archtecture
>>     2) set default fb format to XRGB8888 at crtc reset time.
>>     3) fix typos.
>>
>> v6:
>>     1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
>>     2) Explain why tiny drm driver is not suitable for us.
>>     3) Give a short description of the trival dirty uppdate implement based
>>        on CMA helper.
>>     4) code clean up
>>
>> [1]https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
>> [2]https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
>> [3]https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
>>
>> Reported-by: Randy Dunlap<rdunlap@infradead.org>
>> Reported-by: kernel test robot
>> Signed-off-by: suijingfeng<suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng<15330273260@189.cn>
>> ---
>>   drivers/gpu/drm/Kconfig               |   2 +
>>   drivers/gpu/drm/Makefile              |   1 +
>>   drivers/gpu/drm/lsdc/Kconfig          |  38 ++
>>   drivers/gpu/drm/lsdc/Makefile         |  15 +
>>   drivers/gpu/drm/lsdc/lsdc_connector.c | 443 ++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_connector.h |  60 ++
>>   drivers/gpu/drm/lsdc/lsdc_crtc.c      | 440 ++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_drv.c       | 846 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_drv.h       | 216 +++++++
>>   drivers/gpu/drm/lsdc/lsdc_encoder.c   |  79 +++
>>   drivers/gpu/drm/lsdc/lsdc_i2c.c       | 220 +++++++
>>   drivers/gpu/drm/lsdc/lsdc_i2c.h       |  61 ++
>>   drivers/gpu/drm/lsdc/lsdc_irq.c       |  77 +++
>>   drivers/gpu/drm/lsdc/lsdc_irq.h       |  37 ++
>>   drivers/gpu/drm/lsdc/lsdc_plane.c     | 681 +++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_pll.c       | 657 ++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_pll.h       | 109 ++++
>>   drivers/gpu/drm/lsdc/lsdc_regs.h      | 246 ++++++++
>>   18 files changed, 4228 insertions(+)
>>   create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>>   create mode 100644 drivers/gpu/drm/lsdc/Makefile
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_connector.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_encoder.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index dfdd3ec5f793..18de1485e2ed 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -405,6 +405,8 @@ source "drivers/gpu/drm/gud/Kconfig"
>>   
>>   source "drivers/gpu/drm/sprd/Kconfig"
>>   
>> +source "drivers/gpu/drm/lsdc/Kconfig"
>> +
>>   config DRM_HYPERV
>>   	tristate "DRM Support for Hyper-V synthetic video device"
>>   	depends on DRM && PCI && MMU && HYPERV
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 8675c2af7ae1..2c5a76ced323 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -133,3 +133,4 @@ obj-y			+= xlnx/
>>   obj-y			+= gud/
>>   obj-$(CONFIG_DRM_HYPERV) += hyperv/
>>   obj-$(CONFIG_DRM_SPRD) += sprd/
>> +obj-$(CONFIG_DRM_LSDC) += lsdc/
>> diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
>> new file mode 100644
>> index 000000000000..7ed1b0fdbe1b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/Kconfig
>> @@ -0,0 +1,38 @@
>> +config DRM_LSDC
>> +	tristate "DRM Support for loongson's display controller"
>> +	depends on DRM && PCI
>> +	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
>> +	select OF
>> +	select CMA if HAVE_DMA_CONTIGUOUS
>> +	select DMA_CMA if HAVE_DMA_CONTIGUOUS
>> +	select DRM_KMS_HELPER
>> +	select DRM_KMS_FB_HELPER
>> +	select DRM_GEM_CMA_HELPER
>> +	select VIDEOMODE_HELPERS
>> +	select BACKLIGHT_PWM if CPU_LOONGSON2K
>> +	select I2C_GPIO if CPU_LOONGSON2K
>> +	select I2C_LS2X if CPU_LOONGSON2K
>> +	default m
>> +	help
>> +	  This is a KMS driver for the display controller in the LS7A1000
>> +	  bridge chip and LS2K1000 SoC. The display controller has two
>> +	  display pipes and it is a PCI device.
>> +	  When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
>> +	  is located at system memory.
>> +	  If "M" is selected, the module will be called lsdc.
>> +
>> +	  If in doubt, say "Y".
>> +
>> +config DRM_LSDC_VRAM_DRIVER
>> +	bool "vram helper based device driver support"
>> +	depends on DRM_LSDC
>> +	select DRM_VRAM_HELPER
>> +	default y
>> +	help
>> +	  When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
>> +	  platform, the LS7A1000 bridge chip has dedicated video RAM. Using
>> +	  "lsdc.use_vram_helper=1" in the kernel command line will enable
>> +	  this driver mode and then the framebuffer will be located at the
>> +	  VRAM at the price of losing PRIME support.
>> +
>> +	  If in doubt, say "Y".
> This doesn't sound right. The driver should make the proper decision
> depending on the platform, not the user or the distribution.

The LS7A1000 north bridge chip has dedicated video RAM, but the DC in LS7A1000
can also scan directly from the system memory out to encoders, like a display
controller in a SoC does. In fact, this display controller is ported from SoC
of early product of Loongson, say Loongson 2H SoC. In fact, this driver still
works if the downstream PC board manufacturer doesn't solder a video RAM.

The lsdc_should_vram_helper_based() function in lsdc_drv.c will examine
if the DC device node have a use_vram_helper property at driver load time.
If there is no use_vram_helper property, CMA helper base DRM driver will be used.
But it allow the user using "lsdc.use_vram_helper=0" override the default
behavior even through there is a use_vram_helper property in the DTS.
In short, It is intend to let the command line passed from kernel has the higher
property. Otherwise the end user can not switch different driver mode once
we put a "use_vram_helper;" in the DTS.

This driver's author already make the decision by the time when the patch is send
out, even through this *may* not proper.

>> diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
>> new file mode 100644
>> index 000000000000..342990654478
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/Makefile
>> @@ -0,0 +1,15 @@
>> +#
>> +# Makefile for the lsdc drm device driver.
>> +#
>> +
>> +lsdc-y := \
>> +	lsdc_drv.o \
>> +	lsdc_crtc.o \
>> +	lsdc_irq.o \
>> +	lsdc_plane.o \
>> +	lsdc_pll.o \
>> +	lsdc_i2c.o \
>> +	lsdc_encoder.o \
>> +	lsdc_connector.o
>> +
>> +obj-$(CONFIG_DRM_LSDC) += lsdc.o
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
>> new file mode 100644
>> index 000000000000..ae5fc0c90961
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
>> @@ -0,0 +1,443 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
> That's the MIT license, yet you claim the driver to be licensed under
> the GPLv2 or later?

  I just copy then paste it blindly, sorry about that. I do not know the 
difference,

we want open the source anyway, I will correct it in next version, thanks.

>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_connector.h>
>> +
>> +#include <video/videomode.h>
>> +#include <video/of_display_timing.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_i2c.h"
>> +#include "lsdc_connector.h"
>> +
>> +
>> +static int lsdc_get_modes_from_edid(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	struct edid *edid_p = (struct edid *)lconn->edid_data;
>> +	int num = drm_add_edid_modes(connector, edid_p);
>> +
>> +	if (num)
>> +		drm_connector_update_edid_property(connector, edid_p);
>> +
>> +	drm_dbg_kms(ddev, "%d modes added\n", num);
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes_from_timings(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	struct display_timings *disp_tim = lconn->disp_tim;
>> +	unsigned int num = 0;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < disp_tim->num_timings; i++) {
>> +		const struct display_timing *dt = disp_tim->timings[i];
>> +		struct drm_display_mode *mode;
>> +		struct videomode vm;
>> +
>> +		videomode_from_timing(dt, &vm);
>> +		mode = drm_mode_create(ddev);
>> +		if (!mode) {
>> +			drm_err(ddev, "failed to add mode %ux%u\n",
>> +					dt->hactive.typ, dt->vactive.typ);
>> +			continue;
>> +		}
>> +
>> +		drm_display_mode_from_videomode(&vm, mode);
>> +
>> +		mode->type |= DRM_MODE_TYPE_DRIVER;
>> +
>> +		if (i == disp_tim->native_mode)
>> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
>> +
>> +		drm_mode_probed_add(connector, mode);
>> +		num++;
>> +	}
>> +
>> +	drm_dbg_kms(ddev, "%d modes added\n", num);
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes_from_ddc(struct drm_connector *connector,
>> +				   struct i2c_adapter *ddc)
>> +{
>> +	unsigned int num = 0;
>> +	struct edid *edid;
>> +
>> +	edid = drm_get_edid(connector, ddc);
>> +	if (edid) {
>> +		drm_connector_update_edid_property(connector, edid);
>> +		num = drm_add_edid_modes(connector, edid);
>> +		kfree(edid);
>> +	}
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes(struct drm_connector *connector)
>> +{
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	unsigned int num = 0;
>> +
>> +	if (lconn->has_edid)
>> +		return lsdc_get_modes_from_edid(connector);
>> +
>> +	if (lconn->has_disp_tim)
>> +		return lsdc_get_modes_from_timings(connector);
>> +
>> +	if (IS_ERR_OR_NULL(lconn->ddc) == false)
>> +		return lsdc_get_modes_from_ddc(connector, lconn->ddc);
>> +
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL) {
>> +		num = drm_add_modes_noedid(connector,
>> +				     connector->dev->mode_config.max_width,
>> +				     connector->dev->mode_config.max_height);
>> +
>> +		drm_set_preferred_mode(connector, 1024, 768);
>> +
>> +		return num;
>> +	}
>> +
>> +
>> +	/*
>> +	 * In case we cannot retrieve the EDIDs (broken or missing i2c
>> +	 * bus), fallback on the XGA standards, because we are for board
>> +	 * bringup.
>> +	 */
>> +	num = drm_add_modes_noedid(connector, 1920, 1200);
>> +
>> +	/* And prefer a mode pretty much anyone can handle */
>> +	drm_set_preferred_mode(connector, 1024, 768);
>> +
>> +	return num;
>> +
>> +}
>> +
>> +
>> +static enum drm_connector_status
>> +lsdc_connector_detect(struct drm_connector *connector, bool force)
>> +{
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +
>> +	if (lconn->has_edid == true)
>> +		return connector_status_connected;
>> +
>> +	if (lconn->has_disp_tim == true)
>> +		return connector_status_connected;
>> +
>> +	if (IS_ERR_OR_NULL(lconn->ddc) == false)
>> +		return drm_probe_ddc(lconn->ddc);
>> +
>> +	if (lconn->ddc && drm_probe_ddc(lconn->ddc))
>> +		return connector_status_connected;
>> +
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
>> +		return connector_status_connected;
>> +
>> +	if ((connector->connector_type == DRM_MODE_CONNECTOR_DVIA) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_DVID) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_DVII))
>> +		return connector_status_disconnected;
>> +
>> +	if ((connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
>> +		return connector_status_disconnected;
>> +
>> +	return connector_status_unknown;
>> +}
>> +
>> +
>> +/*
>> + * @connector: point to the drm_connector structure
>> + *
>> + * Clean up connector resources
>> + */
>> +static void lsdc_connector_destroy(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +
>> +	if (lconn) {
>> +		if (lconn->ddc)
>> +			lsdc_destroy_i2c(connector->dev, lconn->ddc);
>> +
>> +		drm_info(ddev, "destroying connector%u\n", lconn->index);
>> +
>> +		devm_kfree(ddev->dev, lconn);
>> +	}
>> +
>> +	drm_connector_cleanup(connector);
>> +}
>> +
>> +
>> +static const struct drm_connector_helper_funcs lsdc_connector_helpers = {
>> +	.get_modes = lsdc_get_modes,
>> +};
>> +
>> +/*
>> + * These provide the minimum set of functions required to handle a connector
>> + *
>> + * Control connectors on a given device.
>> + *
>> + * Each CRTC may have one or more connectors attached to it.
>> + * The functions below allow the core DRM code to control
>> + * connectors, enumerate available modes, etc.
>> + */
>> +static const struct drm_connector_funcs lsdc_connector_funcs = {
>> +	.dpms = drm_helper_connector_dpms,
>> +	.detect = lsdc_connector_detect,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.destroy = lsdc_connector_destroy,
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +
>> +/* Get the simple EDID data from the device tree
>> + * the length must be EDID_LENGTH, since it is simple.
>> + *
>> + * @np: device node contain edid data
>> + * @edid_data: where the edid data to store to
>> + */
>> +static bool lsdc_get_edid_from_dtb(struct device_node *np,
>> +				   unsigned char *edid_data)
>> +{
>> +	int length;
>> +	const void *prop;
>> +
>> +	if (np == NULL)
>> +		return false;
>> +
>> +	prop = of_get_property(np, "edid", &length);
>> +	if (prop && (length == EDID_LENGTH)) {
>> +		memcpy(edid_data, prop, EDID_LENGTH);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
> You don't have a device tree binding for that driver, this is something
> that is required. And it's not clear to me why you'd want EDID in the
> DTB?

1) That is for the display controller in ls2k1000 SoC.

Currently, the upstream kernel still don't have GPIO, PWM and I2C driver 
support for LS2K1000 SoC.

How dose you read EDID from the monitor without a I2C driver? without a 
EDID the screen just black,

the lsdc driver just stall.  With reading EDID from device tree support 
we do not need  a i2c driver to

make  lsdc drm driver work on various ls2k1000 development board.

I have many local private dts with the bindings,  can not upstream at 
this time, below is an example.


&lsdc {
     output-ports = <&dvo0 &dvo1>;

     #address-cells = <1>;
     #size-cells = <0>;

     dvo0: dvo@0 {
         reg = <0>;

         connector = "dpi-connector";
         encoder = "none";
         status = "ok";

         display-timings {
             native-mode = <&mode_0_1024x600_60>;

             mode_0_1024x600_60: panel-timing@0 {
                 clock-frequency = <51200000>;
                 hactive = <1024>;
                 vactive = <600>;
                 hsync-len = <4>;
                 hfront-porch = <160>;
                 hback-porch = <156>;
                 vfront-porch = <11>;
                 vback-porch = <23>;
                 vsync-len = <1>;
             };

             mode_1_800x480_60: panel-timing@1 {
                 clock-frequency = <30066000>;
                 hactive = <800>;
                 vactive = <480>;
                 hfront-porch = <50>;
                 hback-porch = <70>;
                 hsync-len = <50>;
                 vback-porch = <0>;
                 vfront-porch = <0>;
                 vsync-len = <50>;
             };
         };
     };

     dvo1: dvo@1 {
         reg = <1>;

         connector = "hdmi-connector";
         type = "a";
         encoder = "sil9022";

         edid = [ 00 ff ff ff ff ff ff 00 1e 6d 54 5b 0b cc 04 00
              02 1c 01 03 6c 30 1b 78 ea 31 35 a5 55 4e a1 26
              0c 50 54 a5 4b 00 71 4f 81 80 95 00 b3 00 a9 c0
              81 00 81 c0 90 40 02 3a 80 18 71 38 2d 40 58 2c
              45 00 e0 0e 11 00 00 1e 00 00 00 fd 00 38 4b 1e
              53 0f 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
              47 20 46 55 4c 4c 20 48 44 0a 20 20 00 00 00 ff
              00 38 30 32 4e 54 43 5a 39 38 33 37 39 0a 00 35 ];

         status = "ok";
     };
};

2) It is left to the user the this driver.

The downstream motherboard maker may use a dpi(XRGB888) or lvds screen 
which don't have

DDC support either, doing this way allow them put a EDID in the device 
tree. Then the entire system works.

>> +
>> +/* Get display timings from the device tree
>> + *
>> + * @np: device node contain the display timings
>> + * @pptim: point to where the pointer of struct display_timings store to
>> + */
>> +static void lsdc_get_display_timings_from_dtb(struct device_node *np,
>> +					      struct display_timings **pptim)
>> +{
>> +	struct display_timings *timings;
>> +
>> +	if (np == NULL)
>> +		return;
>> +
>> +	timings = of_get_display_timings(np);
>> +	if (timings)
>> +		*pptim = timings;
>> +}
>> +
>> +
>> +static int lsdc_get_connector_type(struct drm_device *ddev,
>> +				   struct device_node *output,
>> +				   unsigned int index)
>> +{
>> +	const char *name;
>> +	int ret;
>> +
>> +	ret = of_property_read_string(output, "connector", &name);
>> +	if (ret < 0)
>> +		return DRM_MODE_CONNECTOR_Unknown;
>> +
>> +	if (strncmp(name, "vga-connector", 13) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_VGA;
>> +		drm_info(ddev, "connector%d is VGA\n", index);
>> +	} else if (strncmp(name, "dvi-connector", 13) == 0) {
>> +		bool analog, digital;
>> +
>> +		analog = of_property_read_bool(output, "analog");
>> +		digital = of_property_read_bool(output, "digital");
>> +
>> +		if (analog && !digital)
>> +			ret = DRM_MODE_CONNECTOR_DVIA;
>> +		else if (analog && digital)
>> +			ret = DRM_MODE_CONNECTOR_DVII;
>> +		else
>> +			ret = DRM_MODE_CONNECTOR_DVID;
>> +
>> +		drm_info(ddev, "connector%d is DVI\n", index);
>> +	} else if (strncmp(name, "virtual-connector", 17) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_VIRTUAL;
>> +		drm_info(ddev, "connector%d is virtual\n", index);
>> +	} else if (strncmp(name, "dpi-connector", 13) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_DPI;
>> +		drm_info(ddev, "connector%d is DPI\n", index);
>> +	} else if (strncmp(name, "hdmi-connector", 14) == 0) {
>> +		int res;
>> +		const char *hdmi_type;
>> +
>> +		res = of_property_read_string(output, "type", &hdmi_type);
>> +		if (res == 0) {
>> +			if (!strcmp(hdmi_type, "b"))
>> +				ret = DRM_MODE_CONNECTOR_HDMIB;
>> +			else
>> +				ret = DRM_MODE_CONNECTOR_HDMIA;
>> +		} else
>> +			ret = DRM_MODE_CONNECTOR_HDMIA;
>> +
>> +		drm_info(ddev, "connector%d is HDMI, type is %s\n",
>> +			index, hdmi_type);
>> +	} else {
>> +		ret = DRM_MODE_CONNECTOR_Unknown;
>> +		drm_info(ddev, "The type of connector%d is unknown\n", index);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
>> +					   unsigned int index)
>> +{
>> +	struct drm_device *ddev = &ldev->drm;
>> +	struct device_node *np = ddev->dev->of_node;
>> +	struct device_node *output = NULL;
>> +	struct lsdc_connector *lconn;
>> +	struct drm_connector *connector;
>> +	bool available = false;
>> +	unsigned int connector_type;
>> +	int ret;
>> +
>> +	lconn = devm_kzalloc(ddev->dev, sizeof(*lconn), GFP_KERNEL);
>> +	if (lconn == NULL)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	lconn->index = index;
>> +
>> +	output = of_parse_phandle(np, "output-ports", index);
>> +	if (output) {
>> +		struct device_node *disp_tims_np;
>> +
>> +		available = of_device_is_available(output);
>> +
>> +		if (available == false) {
>> +			drm_info(ddev, "connector%d is not available\n", index);
>> +			of_node_put(output);
>> +			return NULL;
>> +		}
>> +
>> +		lconn->has_edid = of_property_read_bool(output, "edid");
>> +		disp_tims_np = of_get_child_by_name(output, "display-timings");
>> +		if (disp_tims_np) {
>> +			of_node_put(disp_tims_np);
>> +			lconn->has_disp_tim = true;
>> +		} else
>> +			lconn->has_disp_tim = false;
>> +	} else
>> +		drm_warn(ddev, "no output-ports property, please update dtb\n");
>> +
>> +	/*
>> +	 * Providing a blindly support even through there is
>> +	 * no output-ports property in the dtb.
>> +	 */
>> +	if (lconn->has_edid) {
>> +		lsdc_get_edid_from_dtb(output, lconn->edid_data);
>> +		drm_info(ddev, "connector%d provide edid\n", index);
>> +	}
>> +
>> +	if (lconn->has_disp_tim) {
>> +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
>> +		drm_info(ddev, "connector%d provide display timings\n", index);
>> +	}
>> +
>> +	connector_type = lsdc_get_connector_type(ddev, output, index);
>> +
>> +	if (output)
>> +		of_node_put(output);
>> +
>> +	connector = &lconn->base;
>> +
>> +	if (connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
>> +		goto SKIPED_CREATE_DDC;
>> +
>> +	/* bypass the ddc creation if the edid or display timing is provided */
>> +	if ((lconn->has_edid == false) &&
>> +	    (lconn->has_disp_tim == false)) {
>> +		const struct lsdc_chip_desc * const dc = ldev->desc;
>> +
>> +		if (dc->have_builtin_i2c)
>> +			lconn->ddc = lsdc_create_i2c_chan(ddev, index);
>> +		else
>> +			lconn->ddc = lsdc_get_i2c_adapter(ddev, index);
>> +
>> +		if (lconn->ddc && (IS_ERR(lconn->ddc) == false)) {
>> +			drm_info(ddev, "i2c%d for connector%d created\n",
>> +					i2c_adapter_id(lconn->ddc), index);
>> +
>> +		} else
>> +			drm_warn(ddev, "Get i2c adapter failed: %ld\n",
>> +					PTR_ERR(lconn->ddc));
>> +	}
>> +
>> +	/* only pull if the connector have a ddc */
>> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>> +			    DRM_CONNECTOR_POLL_DISCONNECT;
>> +
>> +SKIPED_CREATE_DDC:
>> +	ret = drm_connector_init_with_ddc(ddev,
>> +					  connector,
>> +					  &lsdc_connector_funcs,
>> +					  connector_type,
>> +					  lconn->ddc);
>> +	if (ret) {
>> +		drm_err(ddev, "init connector%d failed\n", index);
>> +		goto err_i2c_destroy;
>> +	}
>> +
>> +	drm_connector_helper_add(connector, &lsdc_connector_helpers);
>> +
>> +	return lconn;
>> +
>> +err_i2c_destroy:
>> +	lsdc_destroy_i2c(ddev, lconn->ddc);
>> +	return NULL;
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.h b/drivers/gpu/drm/lsdc/lsdc_connector.h
>> new file mode 100644
>> index 000000000000..e9f94a969f74
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.h
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +
>> +#ifndef __LSDC_CONNECTOR_H__
>> +#define __LSDC_CONNECTOR_H__
>> +
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_connector.h>
>> +
>> +struct lsdc_connector {
>> +	struct drm_connector base;
>> +
>> +	struct i2c_adapter *ddc;
>> +
>> +	/* pass EDID from dtb support */
>> +	unsigned char edid_data[EDID_LENGTH];
>> +	bool has_edid;
>> +
>> +	/* pass display timmings from dtb support */
>> +	struct display_timings *disp_tim;
>> +	bool has_disp_tim;
>> +
>> +	int index;
>> +};
>> +
>> +#define to_lsdc_connector(x)        \
>> +		container_of(x, struct lsdc_connector, base)
>> +
>> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
>> +					   unsigned int index);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c b/drivers/gpu/drm/lsdc/lsdc_crtc.c
>> new file mode 100644
>> index 000000000000..7531389f4896
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
>> @@ -0,0 +1,440 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_drv.h>
>> +
>> +
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_pll.h"
>> +
>> +
>> +static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(crtc->dev);
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	struct drm_crtc_state *state = crtc->state;
>> +	u32 val;
>> +
>> +	if (state->enable) {
>> +		val = lsdc_reg_read32(ldev, LSDC_INT_REG);
>> +
>> +		if (index == 0)
>> +			val |= INT_CRTC0_VS_EN;
>> +		else if (index == 1)
>> +			val |= INT_CRTC1_VS_EN;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_INT_REG, val);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(crtc->dev);
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	u32 val;
>> +
>> +	val = lsdc_reg_read32(ldev, LSDC_INT_REG);
>> +
>> +	if (index == 0)
>> +		val &= ~INT_CRTC0_VS_EN;
>> +	else if (index == 1)
>> +		val &= ~INT_CRTC1_VS_EN;
>> +
>> +	lsdc_reg_write32(ldev, LSDC_INT_REG, val);
>> +}
>> +
>> +
>> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	struct lsdc_crtc_state *priv_crtc_state;
>> +	u32 val;
>> +
>> +	/* The crtc get soft reset if bit 20 of CRTC*_CFG_REG
>> +	 * is write with falling edge.
>> +	 *
>> +	 * Doing this to switch from soft reset state to working state
>> +	 */
>> +	if (index == 0) {
>> +		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +	} else if (index == 1) {
>> +		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +	}
>> +
>> +
>> +	if (crtc->state) {
>> +		priv_crtc_state = to_lsdc_crtc_state(crtc->state);
>> +		__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
>> +		kfree(priv_crtc_state);
>> +	}
>> +
>> +	priv_crtc_state = kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
>> +	if (!priv_crtc_state)
>> +		return;
>> +
>> +	priv_crtc_state->pix_fmt = val & CFG_PIX_FMT_MASK;
>> +
>> +	__drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->base);
>> +
>> +	drm_info(ddev, "crtc%u reset\n", index);
>> +}
>> +
>> +
>> +static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>> +				    struct drm_crtc_state *state)
>> +{
>> +	struct lsdc_crtc_state *priv_crtc_state = to_lsdc_crtc_state(state);
>> +
>> +	__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
>> +
>> +	kfree(priv_crtc_state);
>> +}
>> +
>> +
>> +static struct drm_crtc_state *lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>> +{
>> +	struct lsdc_crtc_state *new_priv_state;
>> +	struct lsdc_crtc_state *old_priv_state;
>> +	struct drm_device *ddev = crtc->dev;
>> +
>> +	if (drm_WARN_ON(ddev, !crtc->state))
>> +		return NULL;
>> +
>> +	new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
>> +	if (!new_priv_state)
>> +		return NULL;
>> +
>> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->base);
>> +
>> +	old_priv_state = to_lsdc_crtc_state(crtc->state);
>> +
>> +	memcpy(&new_priv_state->pparams, &old_priv_state->pparams,
>> +		sizeof(new_priv_state->pparams));
>> +
>> +	new_priv_state->pix_fmt = old_priv_state->pix_fmt;
>> +
>> +	return &new_priv_state->base;
>> +}
>> +
>> +
>> +static const struct drm_crtc_funcs lsdc_crtc_funcs = {
>> +	.reset = lsdc_crtc_reset,
>> +	.destroy = drm_crtc_cleanup,
>> +	.set_config = drm_atomic_helper_set_config,
>> +	.page_flip = drm_atomic_helper_page_flip,
>> +	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,
>> +	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,
>> +	.enable_vblank = lsdc_crtc_enable_vblank,
>> +	.disable_vblank = lsdc_crtc_disable_vblank,
>> +};
>> +
>> +
>> +static enum drm_mode_status
>> +lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
>> +			    const struct drm_display_mode *mode)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	const struct lsdc_chip_desc *desc = ldev->desc;
>> +
>> +	if (mode->hdisplay > desc->max_width)
>> +		return MODE_BAD_HVALUE;
>> +	if (mode->vdisplay > desc->max_height)
>> +		return MODE_BAD_VVALUE;
>> +
>> +	if (mode->clock > desc->max_pixel_clk) {
>> +		drm_dbg_kms(ddev, "mode %dx%d, pixel clock=%d is too high\n",
>> +				mode->hdisplay, mode->vdisplay, mode->clock);
>> +		return MODE_CLOCK_HIGH;
>> +	}
>> +
>> +	/* the crtc hardware dma take 256 bytes once a time
>> +	 * TODO: check RGB565 support
>> +	 */
>> +	if ((mode->hdisplay * 4) % desc->stride_alignment) {
>> +		drm_dbg_kms(ddev, "stride is not %u bytes aligned\n",
>> +				desc->stride_alignment);
>> +		return MODE_BAD;
>> +	}
>> +
>> +	return MODE_OK;
>> +}
> mode_valid will only prevent the mode from being advertised to the
> userspace, but you need atomic_check if you want to prevent those modes
> to be used by anybody.

Yes,   I used to change mode with mate-display-properties tools, what I 
though is if

the end user can't see it,  they can't set it.  I will add atomic_check 
support at next version, thanks.

>> +
>> +static void lsdc_update_pixclk(struct drm_crtc *crtc, unsigned int pixclk, bool verbose)
>> +{
>> +	struct lsdc_display_pipe *dispipe;
>> +	struct lsdc_pll *pixpll;
>> +	const struct lsdc_pixpll_funcs *clkfun;
>> +	struct lsdc_crtc_state *priv_crtc_state;
>> +
>> +	priv_crtc_state = to_lsdc_crtc_state(crtc->state);
>> +
>> +	dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
>> +	pixpll = &dispipe->pixpll;
>> +	clkfun = pixpll->funcs;
>> +
>> +	/* config the pixel pll */
>> +	clkfun->update(pixpll, &priv_crtc_state->pparams);
>> +
>> +	if (verbose)
>> +		clkfun->print(pixpll, pixclk);
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	unsigned int hr = mode->hdisplay;
>> +	unsigned int hss = mode->hsync_start;
>> +	unsigned int hse = mode->hsync_end;
>> +	unsigned int hfl = mode->htotal;
>> +	unsigned int vr = mode->vdisplay;
>> +	unsigned int vss = mode->vsync_start;
>> +	unsigned int vse = mode->vsync_end;
>> +	unsigned int vfl = mode->vtotal;
>> +	unsigned int pixclock = mode->clock;
>> +	unsigned int index = drm_crtc_index(crtc);
>> +
>> +
>> +	if (index == 0) {
>> +		/* CRTC 0 */
>> +		u32 hsync, vsync;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_FB_ORIGIN_REG, 0);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HDISPLAY_REG,
>> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VDISPLAY_REG,
>> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
>> +
>> +		/* 26:16 hsync end, 10:0 hsync start */
>> +		hsync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +			hsync |= INV_HSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HSYNC_REG, EN_HSYNC_BIT | hsync);
>> +
>> +		/* 26:16 vsync end, 10:0 vsync start */
>> +		vsync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +			vsync |= INV_VSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VSYNC_REG, EN_VSYNC_BIT | vsync);
>> +
>> +	} else if (index == 1) {
>> +		/* CRTC 1 */
>> +		u32 hsync, vsync;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_FB_ORIGIN_REG, 0);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HDISPLAY_REG,
>> +			(mode->crtc_htotal << 16) | mode->crtc_hdisplay);
>> +
>> +		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VDISPLAY_REG,
>> +			(mode->crtc_vtotal << 16) | mode->crtc_vdisplay);
>> +
>> +		/* 26:16 hsync end, 10:0 hsync start */
>> +		hsync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>> +			hsync |= INV_HSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HSYNC_REG, EN_HSYNC_BIT | hsync);
>> +
>> +		/* 26:16 vsync end, 10:0 vsync start */
>> +		vsync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start;
>> +
>> +		if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>> +			vsync |= INV_VSYNC_BIT;
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VSYNC_REG, EN_VSYNC_BIT | vsync);
>> +	}
>> +
>> +	drm_dbg_kms(ddev, "hdisplay=%d, hsync_start=%d, hsync_end=%d, htotal=%d\n",
>> +			hr, hss, hse, hfl);
>> +
>> +	drm_dbg_kms(ddev, "vdisplay=%d, vsync_start=%d, vsync_end=%d, vtotal=%d\n",
>> +			vr, vss, vse, vfl);
>> +
>> +	drm_dbg_kms(ddev, "%s modeset: %ux%u\n", crtc->name, hr, vr);
>> +
>> +	lsdc_update_pixclk(crtc, pixclock, ldev->verbose);
>> +}
>> +
>> +
>> +static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int index)
>> +{
>> +	u32 val;
>> +
>> +	if (index == 0) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +		val |= CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +	} else if (index == 1) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +		val |= CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +	}
>> +}
>> +
>> +
>> +static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int index)
>> +{
>> +	u32 val;
>> +
>> +	if (index == 0) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +		val &= ~CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +	} else if (index == 1) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +		val &= ~CFG_OUTPUT_EN_BIT;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +	}
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	drm_crtc_vblank_on(crtc);
>> +
>> +	lsdc_enable_display(ldev, drm_crtc_index(crtc));
>> +
>> +	drm_dbg_kms(ddev, "%s: enabled\n", crtc->name);
>> +}
>> +
>> +
>> +static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = crtc->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	drm_crtc_vblank_off(crtc);
>> +
>> +	lsdc_disable_display(ldev, drm_crtc_index(crtc));
>> +
>> +	drm_dbg_kms(ddev, "%s: disabled\n", crtc->name);
>> +}
>> +
>> +
>> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
>> +				   struct drm_atomic_state *state)
>> +{
>> +	struct drm_pending_vblank_event *event = crtc->state->event;
>> +
>> +	if (event) {
>> +		crtc->state->event = NULL;
>> +
>> +		spin_lock_irq(&crtc->dev->event_lock);
>> +		if (drm_crtc_vblank_get(crtc) == 0)
>> +			drm_crtc_arm_vblank_event(crtc, event);
>> +		else
>> +			drm_crtc_send_vblank_event(crtc, event);
>> +		spin_unlock_irq(&crtc->dev->event_lock);
>> +	}
>> +}
>> +
>> +
>> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
>> +	.mode_valid = lsdc_crtc_helper_mode_valid,
>> +	.mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
>> +	.atomic_enable = lsdc_crtc_helper_atomic_enable,
>> +	.atomic_disable = lsdc_crtc_helper_atomic_disable,
>> +	.atomic_flush = lsdc_crtc_atomic_flush,
>> +};
>> +
>> +
>> +
>> +/**
>> + * lsdc_crtc_init
>> + *
>> + * @ddev: point to the drm_device structure
>> + * @index: hardware crtc index
>> + *
>> + * Init CRTC
>> + */
>> +int lsdc_crtc_init(struct drm_device *ddev,
>> +		   struct drm_crtc *crtc,
>> +		   unsigned int index,
>> +		   struct drm_plane *primary,
>> +		   struct drm_plane *cursor)
>> +{
>> +	int ret;
>> +
>> +	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
>> +
>> +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
>> +	if (ret)
>> +		drm_warn(ddev, "set the gamma table size failed\n");
>> +
>> +	return drm_crtc_init_with_planes(ddev,
>> +					 crtc,
>> +					 primary,
>> +					 cursor,
>> +					 &lsdc_crtc_funcs,
>> +					 "crtc%d",
>> +					 index);
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_drv.c
>> new file mode 100644
>> index 000000000000..aac8901c3431
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
>> @@ -0,0 +1,846 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/string.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/of_reserved_mem.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_aperture.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_fb_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_irq.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_connector.h"
>> +#include "lsdc_pll.h"
>> +
>> +
>> +#define DRIVER_AUTHOR		"Sui Jingfeng<suijingfeng@loongson.cn>"
>> +#define DRIVER_NAME		"lsdc"
>> +#define DRIVER_DESC		"drm driver for loongson's display controller"
>> +#define DRIVER_DATE		"20200701"
>> +#define DRIVER_MAJOR		1
>> +#define DRIVER_MINOR		0
>> +#define DRIVER_PATCHLEVEL	0
>> +
>> +static int lsdc_modeset = 1;
>> +MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 = enabled(default), 0 = disabled)");
>> +module_param_named(modeset, lsdc_modeset, int, 0644);
>> +
>> +static int lsdc_cached_coherent = 1;
>> +MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 = enabled(default), 0 = disabled)");
>> +module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
>> +
>> +static int lsdc_dirty_update = -1;
>> +MODULE_PARM_DESC(dirty_update, "enable dirty update(1 = enabled, 0 = disabled(default))");
>> +module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
>> +
>> +static int lsdc_use_vram_helper = -1;
>> +MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 = enabled, 0 = disabled(default))");
>> +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
>> +
>> +static int lsdc_verbose = -1;
>> +MODULE_PARM_DESC(verbose, "Enable/disable print some key information");
>> +module_param_named(verbose, lsdc_verbose, int, 0644);
> It's not really clear to me why you need any of those parameters. Why
> would a user want to use a non coherent mapping for example?

Because we are Mips architecture. Paul Cercueil already explained it
in his mmap GEM buffers cachedpatch  <https://lkml.kernel.org/lkml/20200822164233.71583-1-paul@crapouillou.net/T/>. I drag part of it to here for
convenient to reading:

/Traditionally, GEM buffers are mapped write-combine. Writes to the 
buffer are accelerated, and reads are slow. Application doing lots////of alpha-blending paint inside shadow buffers, which is then memcpy'd////into the final GEM buffer.///
"non coherent mapping" is actually cached and it is for CMA helpers
base driver not for VRAM helper based driver. For Loongson CPU/SoCs.
The cache coherency is maintained by hardware, therefore there no
need to worry about coherency problems. This is true at least for
ls3a3000, ls3a4000 and ls3a5000.

But "non coherent" or "coherent" is not important here, the key point
is that the backing memory of the framebuffer is cached with non coherent mapping,
you don't need a shadow buffer layer when using X server's modesetting driver,
read and write to the framebuffer in system memory is much faster than
read and write to the framebuffer in the VRAM.

Why CMA helper based solution is faster than VRAM based solution on our
mips platform?

Partly because of the CPU have L1, L2 and L3 cache, especially L3 cache
is as large as 8MB, read and write from the cache is fast.
Another reason is as Paul Cercueil said, read from VRAM with write-combine
cache mode is slow. Please note that we don't have a GPU here, we are just
a display controller.

For the VRAM helper based driver case, the backing memory of the framebuffer
is located at VRAM, When using X server's modesetting driver, we have to enable
the ShadowFB option, otherwise the performance of graphic application is just slow.
Uncache acceleration should also be enabled.

Beside write-combine cache mode have bugs on our platform, a kernel side developer
have disabled it. Writecombine cache mode just boil down to uncached now.
See [1] and [2]

[1]https://lkml.org/lkml/2020/8/10/255
[2]https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn/T/


This is the reason why we prefer CMA helper base solution with non coherent mapping,
simply because it is fast.

As far as I know, Loongson's CPU don't have the concept of write-combine,
it only have uncached, cached and uncache acceleration three main caching mode.
write-combine is implemented with uncache acceleration on Mips.

>> +
>> +static const struct lsdc_chip_desc dc_in_ls2k1000 = {
>> +	.chip = LSDC_CHIP_2K1000,
>> +	.num_of_crtc = LSDC_MAX_CRTC,
>> +	/* ls2k1000 user manual say the max pixel clock can be about 200MHz */
>> +	.max_pixel_clk = 200000,
>> +	.max_width = 2560,
>> +	.max_height = 2048,
>> +	.num_of_hw_cursor = 1,
>> +	.hw_cursor_w = 32,
>> +	.hw_cursor_h = 32,
>> +	.have_builtin_i2c = false,
>> +	.stride_alignment = 256,
>> +};
>> +
>> +static const struct lsdc_chip_desc dc_in_ls2k0500 = {
>> +	.chip = LSDC_CHIP_2K0500,
>> +	.num_of_crtc = LSDC_MAX_CRTC,
>> +	.max_pixel_clk = 200000,
>> +	.max_width = 2048,
>> +	.max_height = 2048,
>> +	.num_of_hw_cursor = 1,
>> +	.hw_cursor_w = 32,
>> +	.hw_cursor_h = 32,
>> +	.have_builtin_i2c = false,
>> +	.stride_alignment = 256,
>> +};
>> +
>> +static const struct lsdc_chip_desc dc_in_ls7a1000 = {
>> +	.chip = LSDC_CHIP_7A1000,
>> +	.num_of_crtc = LSDC_MAX_CRTC,
>> +	.max_pixel_clk = 200000,
>> +	.max_width = 2048,
>> +	.max_height = 2048,
>> +	.num_of_hw_cursor = 1,
>> +	.hw_cursor_w = 32,
>> +	.hw_cursor_h = 32,
>> +	.have_builtin_i2c = true,
>> +	.stride_alignment = 256,
>> +};
>> +
>> +/*
>> + * We need the device tree provided additional information to tell the DC
>> + * in different chip apart.
>> + */
>> +static const struct of_device_id lsdc_drm_of_match[] = {
>> +	{ .compatible = "loongson,loongson64c-4core-ls7a", .data = &dc_in_ls7a1000 },
>> +	{ .compatible = "loongson,loongson64g-4core-ls7a", .data = &dc_in_ls7a1000 },
>> +	{ .compatible = "loongson,loongson64-2core-2k1000", .data = &dc_in_ls2k1000 },
>> +	{ .compatible = "loongson,loongson2k1000", .data = &dc_in_ls2k1000 },
>> +	{ .compatible = "loongson,ls2k1000", .data = &dc_in_ls2k1000 },
>> +	{ .compatible = "loongson,display-subsystem", .data = &dc_in_ls2k1000 },
>> +	{ .compatible = "loongson,ls-fb", .data = &dc_in_ls2k1000 },
>> +	{ .compatible = "loongson,loongson2k0500", .data = &dc_in_ls2k0500 },
>> +	{ /* sentinel */ },
>> +};
>> +
>> +
>> +static struct drm_framebuffer *
>> +lsdc_drm_gem_fb_create(struct drm_device *ddev, struct drm_file *file,
>> +			  const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	if (ldev->dirty_update)
>> +		return drm_gem_fb_create_with_dirty(ddev, file, mode_cmd);
>> +
>> +	return drm_gem_fb_create(ddev, file, mode_cmd);
>> +}
>> +
>> +
>> +static enum drm_mode_status lsdc_device_mode_valid(struct drm_device *ddev,
>> +					const struct drm_display_mode *mode)
>> +{
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	if (ldev->use_vram_helper == true)
>> +		return drm_vram_helper_mode_valid(ddev, mode);
>> +#endif
>> +
>> +	return MODE_OK;
>> +}
>> +
>> +
>> +static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
>> +	.fb_create = lsdc_drm_gem_fb_create,
>> +	.output_poll_changed = drm_fb_helper_output_poll_changed,
>> +	.atomic_check = drm_atomic_helper_check,
>> +	.atomic_commit = drm_atomic_helper_commit,
>> +	.mode_valid = lsdc_device_mode_valid,
>> +};
>> +
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +static int lsdc_show_pxlclock(struct seq_file *m, void *arg)
>> +{
>> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
>> +	struct drm_device *ddev = node->minor->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_crtc *crtc;
>> +
>> +	drm_for_each_crtc(crtc, ddev) {
>> +		struct drm_crtc_state *state = crtc->state;
>> +		int index = drm_crtc_index(crtc);
>> +		struct lsdc_display_pipe *pipe = &ldev->disp_pipe[index];
>> +		struct lsdc_pll *pixpll = &pipe->pixpll;
>> +		const struct lsdc_pixpll_funcs *clkfun = pixpll->funcs;
>> +		unsigned int clkrate = clkfun->get_clock_rate(pixpll);
>> +		unsigned int mode_clock = crtc->mode.crtc_clock;
>> +
>> +		seq_printf(m, "\n");
>> +		seq_printf(m, "CRTC%u, %s, %s\n", index,
>> +				state->active ? "active" : "non-active",
>> +				state->enable ? "enabled" : "disabled");
>> +		seq_printf(m, "hw clock: %u kHz\n", clkrate);
>> +		seq_printf(m, "mode: %u kHz\n", mode_clock);
>> +
>> +		seq_printf(m, "div_out=%u, loopc=%u, div_ref=%u\n",
>> +				pixpll->core_params.div_out,
>> +				pixpll->core_params.loopc,
>> +				pixpll->core_params.div_ref);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static int lsdc_mm_show(struct seq_file *m, void *arg)
>> +{
>> +	struct drm_info_node *node = (struct drm_info_node *) m->private;
>> +	struct drm_device *ddev = node->minor->dev;
>> +	struct drm_printer p = drm_seq_file_printer(m);
>> +
>> +	drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
>> +	return 0;
>> +}
>> +
>> +static struct drm_info_list lsdc_debugfs_list[] = {
>> +	{ "clocks", lsdc_show_pxlclock, 0 },
>> +	{ "mm",     lsdc_mm_show,   0, NULL },
>> +};
>> +
>> +static void lsdc_debugfs_init(struct drm_minor *minor)
>> +{
>> +	drm_debugfs_create_files(lsdc_debugfs_list,
>> +				 ARRAY_SIZE(lsdc_debugfs_list),
>> +				 minor->debugfs_root,
>> +				 minor);
>> +}
>> +#endif
>> +
>> +
>> +static struct drm_gem_object *
>> +lsdc_drm_gem_create_object(struct drm_device *ddev, size_t size)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_gem_cma_object *obj = kzalloc(sizeof(*obj), GFP_KERNEL);
>> +
>> +	if (!obj)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	if (ldev->cached_coherent)
>> +		obj->map_noncoherent = true;
>> +
>> +	return &obj->base;
>> +}
>> +
>> +
>> +static int lsdc_gem_cma_dumb_create(struct drm_file *file,
>> +				    struct drm_device *ddev,
>> +				    struct drm_mode_create_dumb *args)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	const struct lsdc_chip_desc *desc = ldev->desc;
>> +	unsigned int bytes_per_pixel = (args->bpp + 7) / 8;
>> +	unsigned int pitch = bytes_per_pixel * args->width;
>> +
>> +	/*
>> +	 * The dc in ls7a1000/ls2k1000/ls2k0500 require the stride be a
>> +	 * multiple of 256 bytes, which is for sake of optimize dma data
>> +	 * transfer.
>> +	 */
>> +	args->pitch = roundup(pitch, desc->stride_alignment);
>> +
>> +	return drm_gem_cma_dumb_create_internal(file, ddev, args);
>> +}
>> +
>> +
>> +DEFINE_DRM_GEM_CMA_FOPS(lsdc_drv_fops);
>> +
>> +
>> +static const struct drm_driver lsdc_drm_driver_cma_stub = {
>> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>> +
>> +	.lastclose = drm_fb_helper_lastclose,
>> +	.fops = &lsdc_drv_fops,
>> +	.gem_create_object = lsdc_drm_gem_create_object,
>> +
>> +	.name = DRIVER_NAME,
>> +	.desc = DRIVER_DESC,
>> +	.date = DRIVER_DATE,
>> +	.major = DRIVER_MAJOR,
>> +	.minor = DRIVER_MINOR,
>> +	.patchlevel = DRIVER_PATCHLEVEL,
>> +
>> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(lsdc_gem_cma_dumb_create),
>> +
>> +#ifdef CONFIG_DEBUG_FS
>> +	.debugfs_init = lsdc_debugfs_init,
>> +#endif
>> +};
>> +
>> +
>> +DEFINE_DRM_GEM_FOPS(lsdc_fops);
>> +
>> +
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +static const struct drm_driver lsdc_vram_driver_stub = {
>> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>> +	.fops = &lsdc_fops,
>> +
>> +	.name = DRIVER_NAME,
>> +	.desc = DRIVER_DESC,
>> +	.date = DRIVER_DATE,
>> +	.major = DRIVER_MAJOR,
>> +	.minor = DRIVER_MINOR,
>> +	.patchlevel = DRIVER_PATCHLEVEL,
>> +
>> +	DRM_GEM_VRAM_DRIVER,
>> +};
>> +#endif
>> +
>> +
>> +static int lsdc_modeset_init(struct lsdc_device *ldev, const uint32_t num_crtc)
>> +{
>> +	struct drm_device *ddev = &ldev->drm;
>> +	struct lsdc_display_pipe *dispipe;
>> +	struct lsdc_connector *lconn;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	/* first find all of connector available */
>> +	for (i = 0; i < num_crtc; i++) {
>> +		lconn = lsdc_connector_init(ldev, i);
>> +		dispipe = &ldev->disp_pipe[i];
>> +
>> +		if (IS_ERR(lconn))
>> +			return PTR_ERR(lconn);
>> +		else if (lconn == NULL) {
>> +			dispipe->lconn = NULL;
>> +			dispipe->available = false;
>> +			continue;
>> +		}
>> +
>> +		/* take a record */
>> +		dispipe->available = true;
>> +		dispipe->lconn = lconn;
>> +		ldev->num_output++;
>> +	}
>> +
>> +	drm_info(ddev, "number of outputs: %u\n", ldev->num_output);
>> +
>> +	for (i = 0; i < num_crtc; i++) {
>> +		struct lsdc_display_pipe * const dispipe = &ldev->disp_pipe[i];
>> +		struct drm_plane * const primary = &dispipe->primary;
>> +		struct drm_plane * const cursor = &dispipe->cursor;
>> +		struct drm_encoder * const encoder = &dispipe->encoder;
>> +		struct drm_crtc * const crtc = &dispipe->crtc;
>> +		struct lsdc_pll * const pixpll = &dispipe->pixpll;
>> +
>> +		dispipe->index = i;
>> +
>> +		ret = lsdc_pixpll_init(pixpll, ddev, i);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = lsdc_plane_init(ldev, primary, DRM_PLANE_TYPE_PRIMARY, i);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/*
>> +		 * Initial all of the CRTC available, in this way the crtc
>> +		 * index is equal to the hardware crtc index. That is:
>> +		 * display pipe 0 = crtc0 + dvo0 + encoder0
>> +		 * display pipe 1 = crtc1 + dvo1 + encoder1
>> +		 */
>> +		ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (dispipe->available) {
>> +			ret = lsdc_encoder_init(encoder,
>> +						&dispipe->lconn->base,
>> +						ddev,
>> +						i,
>> +						ldev->num_output);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +
>> +		drm_info(ddev, "display pipe %u initialized\n", i);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static int lsdc_mode_config_init(struct lsdc_device *ldev)
>> +{
>> +	const struct lsdc_chip_desc * const descp = ldev->desc;
>> +	struct drm_device *ddev = &ldev->drm;
>> +	int ret;
>> +
>> +	spin_lock_init(&ldev->reglock);
>> +
>> +	drm_mode_config_init(ddev);
>> +
>> +	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
>> +	ddev->mode_config.min_width = 1;
>> +	ddev->mode_config.min_height = 1;
>> +	ddev->mode_config.preferred_depth = 24;
>> +	ddev->mode_config.prefer_shadow = 0;
>> +
>> +	ddev->mode_config.max_width = 4096;
>> +	ddev->mode_config.max_height = 4096;
>> +
>> +	ddev->mode_config.cursor_width = descp->hw_cursor_h;
>> +	ddev->mode_config.cursor_height = descp->hw_cursor_h;
>> +
>> +	if (ldev->vram_base)
>> +		ddev->mode_config.fb_base = ldev->vram_base;
>> +
>> +	ret = lsdc_modeset_init(ldev, descp->num_of_crtc);
>> +	if (ret)
>> +		goto out_mode_config;
>> +
>> +	drm_mode_config_reset(ddev);
>> +
>> +	return 0;
>> +
>> +out_mode_config:
>> +	drm_mode_config_cleanup(ddev);
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static void lsdc_mode_config_fini(struct drm_device *ddev)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	/* disable output polling */
>> +	drm_kms_helper_poll_fini(ddev);
>> +
>> +	drm_dev_unregister(ddev);
>> +
>> +	devm_free_irq(ddev->dev, ldev->irq, ddev);
>> +
>> +	/* shutdown all CRTC, for driver unloading */
>> +	drm_atomic_helper_shutdown(ddev);
>> +
>> +	drm_mode_config_cleanup(ddev);
>> +}
>> +
>> +/*
>> + * We need a function to tell different chips apart.
>> + * Because there are difference between the dc in ls7a1000 and the dc in
>> + * ls2k1000, ls7a1000 have two gpio emulated i2c built-in, but ls2k1000
>> + * don't have such hardware feature. ls2k1000 grab i2c adapter from other
>> + * module, eithor hardware i2c or external gpio-emulated i2c.
>> + *
>> + * Beside, the hardware pixel pll unit is also different.
>> + */
>> +static int lsdc_determine_chip(struct lsdc_device *ldev)
>> +{
>> +	struct device_node *np;
>> +	const char *model;
>> +	const char *compat;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(lsdc_drm_of_match); ++i) {
>> +		compat = lsdc_drm_of_match[i].compatible;
>> +
>> +		np = of_find_compatible_node(NULL, NULL, compat);
>> +		if (np) {
>> +
>> +			/* get additional information */
>> +			of_property_read_string(np, "model", &model);
>> +
>> +			of_node_put(np);
>> +
>> +			ldev->desc = lsdc_drm_of_match[i].data;
>> +
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (ldev->desc == NULL) {
>> +		drm_err(&ldev->drm, "unknown dc ip core, abort\n");
>> +		return -ENOENT;
>> +	}
>> +
>> +	drm_info(&ldev->drm, "%s found, model: %s\n", compat, model);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static int lsdc_drm_suspend(struct device *dev)
>> +{
>> +	struct drm_device *ddev = dev_get_drvdata(dev);
>> +
>> +	return drm_mode_config_helper_suspend(ddev);
>> +}
>> +
>> +
>> +static int lsdc_drm_resume(struct device *dev)
>> +{
>> +	struct drm_device *ddev = dev_get_drvdata(dev);
>> +
>> +	return drm_mode_config_helper_resume(ddev);
>> +}
>> +
>> +
>> +static int lsdc_pm_freeze(struct device *dev)
>> +{
>> +	return lsdc_drm_suspend(dev);
>> +}
>> +
>> +
>> +static int lsdc_pm_thaw(struct device *dev)
>> +{
>> +	return lsdc_drm_resume(dev);
>> +}
>> +
>> +
>> +static int lsdc_pm_suspend(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	int error;
>> +
>> +	error = lsdc_pm_freeze(dev);
>> +	if (error)
>> +		return error;
>> +
>> +	pci_save_state(pdev);
>> +	/* Shut down the device */
>> +	pci_disable_device(pdev);
>> +	pci_set_power_state(pdev, PCI_D3hot);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static int lsdc_pm_resume(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +
>> +	if (pcim_enable_device(pdev))
>> +		return -EIO;
>> +
>> +	pci_set_power_state(pdev, PCI_D0);
>> +
>> +	pci_restore_state(pdev);
>> +
>> +	return lsdc_pm_thaw(dev);
>> +}
>> +
>> +
>> +static const struct dev_pm_ops lsdc_pm_ops = {
>> +	.suspend = lsdc_pm_suspend,
>> +	.resume = lsdc_pm_resume,
>> +	.freeze = lsdc_pm_freeze,
>> +	.thaw = lsdc_pm_thaw,
>> +	.poweroff = lsdc_pm_freeze,
>> +	.restore = lsdc_pm_resume,
>> +};
>> +
>> +
>> +static int lsdc_remove_conflicting_framebuffers(const struct drm_driver *drv)
>> +{
>> +	/* lsdc is a pci device, but it don't have a dedicate vram bar because
>> +	 * of historic reason(The display controller is ported from SoC product
>> +	 * of Loongson, Loongson 2H series which date back to 2012)
>> +	 * And simplefb node may have been located anywhere in memory.
>> +	 */
>> +	return drm_aperture_remove_conflicting_framebuffers(0, ~0, false, drv);
>> +}
>> +
>> +
>> +static int lsdc_vram_init(struct lsdc_device *ldev)
>> +{
>> +	struct drm_device *ddev = &ldev->drm;
>> +	struct pci_dev *gpu;
>> +	resource_size_t base, size;
>> +	int ret;
>> +
>> +	/* BAR 2 of LS7A1000's GPU contain VRAM, It's GC1000 */
>> +	gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7a15, NULL);
>> +	base = pci_resource_start(gpu, 2);
>> +	size =  pci_resource_len(gpu, 2);
>> +
>> +	drm_info(ddev, "vram start: 0x%llx, size: %uMB\n",
>> +			base, (unsigned int)(size >> 20));
>> +
>> +	if (!request_mem_region(base, size, "lsdc_vram")) {
>> +		drm_err(ddev, "can't reserve VRAM memory region\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	if (ldev->use_vram_helper) {
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +		ret = drmm_vram_helper_init(ddev, base, size);
>> +		if (ret) {
>> +			drm_err(ddev, "can't init vram helper\n");
>> +			return ret;
>> +		}
>> +#endif
>> +	} else if (ldev->dirty_update) {
>> +		ldev->vram = devm_ioremap_wc(ddev->dev, base, size);
>> +		if (ldev->vram == NULL)
>> +			return -ENOMEM;
>> +
>> +		drm_info(ddev, "vram virtual addr: 0x%llx\n", (u64)ldev->vram);
>> +	}
>> +
>> +	ldev->vram_base = base;
>> +	ldev->vram_size = size;
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * For the dc in ls7a1000, it is more reliable scanout from the VRAM.
>> + * scanout from the system memory suffer from some hardware deficiency
>> + * which cause the screen flickering under RAM pressure.
>> + */
>> +static bool lsdc_should_vram_helper_based(void)
>> +{
>> +	static const char * const dc_compat[] = { "pci0014,7a06.0",
>> +						  "pci0014,7a06" };
>> +	bool ret = false;
>> +	struct device_node *np;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(dc_compat); ++i) {
>> +		np = of_find_compatible_node(NULL, NULL, dc_compat[i]);
>> +		if (!np)
>> +			continue;
>> +
>> +		ret = of_property_read_bool(np, "use_vram_helper");
>> +		of_node_put(np);
>> +		break;
>> +	}
>> +
>> +	if (ret)
>> +		DRM_INFO("using vram base solution dictated by device tree\n");
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static int lsdc_pci_probe(struct pci_dev *pdev,
>> +			  const struct pci_device_id * const ent)
>> +{
>> +	const struct drm_driver *driver = &lsdc_drm_driver_cma_stub;
>> +	struct lsdc_device *ldev;
>> +	struct drm_device *ddev;
>> +	int ret;
>> +
>> +	lsdc_remove_conflicting_framebuffers(driver);
>> +
>> +	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Set DMA Mask failed\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = pcim_enable_device(pdev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Enable pci devive failed\n");
>> +		return ret;
>> +	}
>> +
>> +	pci_set_master(pdev);
>> +
>> +	/* Get the optional framebuffer memory resource */
>> +	ret = of_reserved_mem_device_init(&pdev->dev);
>> +	if (ret && ret != -ENODEV)
>> +		return ret;
>> +
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +	if (lsdc_use_vram_helper && lsdc_should_vram_helper_based()) {
>> +		driver = &lsdc_vram_driver_stub;
>> +		lsdc_use_vram_helper = 1;
>> +		DRM_INFO("using vram helper based solution\n");
>> +	}
>> +#endif
>> +
>> +	ldev = devm_drm_dev_alloc(&pdev->dev,
>> +				  driver,
>> +				  struct lsdc_device,
>> +				  drm);
>> +	if (IS_ERR(ldev))
>> +		return PTR_ERR(ldev);
>> +
>> +	ddev = &ldev->drm;
>> +
>> +	pci_set_drvdata(pdev, ddev);
>> +
>> +	if (lsdc_use_vram_helper > 0)
>> +		ldev->use_vram_helper = true;
>> +	else {
>> +		if (lsdc_cached_coherent > 0) {
>> +			ldev->cached_coherent = true;
>> +			drm_info(ddev, "cache coherency is maintained by hardware\n");
>> +		}
>> +
>> +		if (lsdc_dirty_update > 0) {
>> +			ldev->dirty_update = true;
>> +			drm_info(ddev, "dirty update enabled\n");
>> +		}
>> +	}
>> +
>> +	if (lsdc_verbose > 0)
>> +		ldev->verbose = true;
>> +
>> +	ret = lsdc_determine_chip(ldev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* BAR 0 contains registers */
>> +	ldev->reg_base = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
>> +	if (IS_ERR(ldev->reg_base))
>> +		return PTR_ERR(ldev->reg_base);
>> +
>> +	/* LS2K1000/LS2K0500 is SoC, don't have a VRAM */
>> +	if ((ldev->desc->chip == LSDC_CHIP_7A1000) &&
>> +	    (ldev->use_vram_helper || ldev->dirty_update))
>> +		lsdc_vram_init(ldev);
>> +
>> +	ret = lsdc_mode_config_init(ldev);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +
>> +	ldev->irq = pdev->irq;
>> +
>> +	dev_info(&pdev->dev, "irq = %d\n", ldev->irq);
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev,
>> +					pdev->irq,
>> +					lsdc_irq_handler_cb,
>> +					lsdc_irq_thread_cb,
>> +					IRQF_ONESHOT,
>> +					dev_name(&pdev->dev),
>> +					ddev);
>> +
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "Failed to register lsdc interrupt\n");
>> +		goto err_out;
>> +	}
>> +
>> +	ret = drm_vblank_init(ddev, LSDC_MAX_CRTC);
>> +	if (ret) {
>> +		dev_err(&pdev->dev,
>> +				"Fatal error during vblank init: %d\n", ret);
>> +		goto err_out;
>> +	}
>> +
>> +	/* Initialize and enable output polling */
>> +	drm_kms_helper_poll_init(ddev);
>> +
>> +	ret = drm_dev_register(ddev, 0);
>> +	if (ret)
>> +		goto err_out;
>> +
>> +	drm_fbdev_generic_setup(ddev, 32);
>> +
>> +	return 0;
>> +
>> +err_out:
>> +	drm_dev_put(ddev);
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static void lsdc_pci_remove(struct pci_dev *pdev)
>> +{
>> +	struct drm_device *ddev = pci_get_drvdata(pdev);
>> +
>> +	lsdc_mode_config_fini(ddev);
>> +
>> +	drm_dev_put(ddev);
>> +
>> +	pci_clear_master(pdev);
>> +
>> +	pci_release_regions(pdev);
>> +}
>> +
>> +
>> +static const struct pci_device_id lsdc_pciid_list[] = {
>> +	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
>> +	{0, 0, 0, 0, 0, 0, 0}
>> +};
>> +
>> +
>> +static struct pci_driver lsdc_pci_driver = {
>> +	.name = DRIVER_NAME,
>> +	.id_table = lsdc_pciid_list,
>> +	.probe = lsdc_pci_probe,
>> +	.remove = lsdc_pci_remove,
>> +	.driver.pm = &lsdc_pm_ops,
>> +};
>> +
>> +
>> +static int __init lsdc_drm_init(void)
>> +{
>> +	struct pci_dev *pdev = NULL;
>> +
>> +	if (drm_firmware_drivers_only())
>> +		return -EINVAL;
>> +
>> +	if (lsdc_modeset == 0)
>> +		return -ENOENT;
>> +
>> +	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
>> +		/*
>> +		 * Multiple video card workaround
>> +		 *
>> +		 * This integrated video driver will always be selected as
>> +		 * default boot device by vgaarb system.
>> +		 */
>> +		if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
>> +			DRM_INFO("Discrete graphic card detected, abort\n");
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	return pci_register_driver(&lsdc_pci_driver);
>> +}
>> +module_init(lsdc_drm_init);
>> +
>> +static void __exit lsdc_drm_exit(void)
>> +{
>> +	pci_unregister_driver(&lsdc_pci_driver);
>> +}
>> +module_exit(lsdc_drm_exit);
>> +
>> +
>> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
>> +MODULE_AUTHOR(DRIVER_AUTHOR);
>> +MODULE_DESCRIPTION(DRIVER_DESC);
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h b/drivers/gpu/drm/lsdc/lsdc_drv.h
>> new file mode 100644
>> index 000000000000..89cf15248c3a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
>> @@ -0,0 +1,216 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#ifndef __LSDC_DRV_H__
>> +#define __LSDC_DRV_H__
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_encoder.h>
>> +
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +#include <drm/drm_gem_vram_helper.h>
>> +#endif
>> +
>> +#include "lsdc_regs.h"
>> +#include "lsdc_pll.h"
>> +
>> +#define LSDC_MAX_CRTC           2
>> +
>> +/* There is only a 1:1 mapping of encoders and connectors for lsdc */
>> +/*
>> + *      +-------------------+                                      _________
>> + *      |                   |                                     |         |
>> + *      |  CRTC0 --> DVO0 ---------> Encoder0 --> Connector0 ---> | Monotor |
>> + *      |                   |           ^            ^            |_________|
>> + *      |                   |           |            |
>> + *      |                <----- i2c0 ----------------+
>> + *      |   LSDC IP CORE    |
>> + *      |                <----- i2c1 ----------------+
>> + *      |                   |           |            |             _________
>> + *      |                   |           |            |            |         |
>> + *      |  CRTC1 --> DVO1 ---------> Encoder1 --> Connector1 ---> |  Panel  |
>> + *      |                   |                                     |_________|
>> + *      +-------------------+
>> + */
>> +
>> +enum loongson_dc_family {
>> +	LSDC_CHIP_UNKNOWN = 0,
>> +	LSDC_CHIP_2K1000 = 1, /* 2-Core SoC, 64-bit */
>> +	LSDC_CHIP_7A1000 = 2, /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
>> +	LSDC_CHIP_2K0500 = 3, /* Reduced version of LS2K1000, single core */
>> +	LSDC_CHIP_7A2000 = 4, /* Enhancement version of 7A1000 */
>> +	LSDC_CHIP_LAST,
>> +};
>> +
>> +enum lsdc_pixel_format {
>> +	LSDC_PF_NONE = 0,
>> +	LSDC_PF_ARGB4444 = 1,    /* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
>> +	LSDC_PF_ARGB1555 = 2,    /* ARGB A:1 bit RGB:15 bits [16 bits] */
>> +	LSDC_PF_RGB565 = 3,      /* RGB [16 bits] */
>> +	LSDC_PF_XRGB8888 = 4,    /* XRGB [32 bits] */
>> +};
>> +
>> +struct lsdc_chip_desc {
>> +	enum loongson_dc_family chip;
>> +	uint32_t num_of_crtc;
>> +
>> +	uint32_t max_pixel_clk;
>> +
>> +	uint32_t max_width;
>> +	uint32_t max_height;
>> +
>> +	uint32_t num_of_hw_cursor;
>> +	uint32_t hw_cursor_w;
>> +	uint32_t hw_cursor_h;
>> +	bool have_builtin_i2c;
>> +	uint32_t stride_alignment;
>> +};
>> +
>> +
>> +/**
>> + * struct lsdc_display_pipe - simple display pipeline
>> + * @crtc: CRTC control structure
>> + * @plane: Plane control structure
>> + * @encoder: Encoder control structure
>> + * @pixpll: Pll control structure
>> + * @connector: point to connector control structure
>> + *
>> + * display pipeline with plane, crtc, encoder, pll collapsed into one
>> + * entity. It should be initialized by calling drm_simple_display_pipe_init().
>> + */
>> +struct lsdc_display_pipe {
>> +	struct drm_crtc crtc;
>> +	struct drm_plane primary;
>> +	struct drm_plane cursor;
>> +	struct drm_encoder encoder;
>> +	struct lsdc_pll pixpll;
>> +	struct lsdc_connector *lconn;
>> +
>> +	int index;
>> +	bool available;
>> +};
>> +
>> +
>> +struct lsdc_crtc_state {
>> +	struct drm_crtc_state base;
>> +	struct lsdc_pll_core_values pparams;
>> +	unsigned int pix_fmt;
>> +};
>> +
>> +
>> +struct lsdc_device {
>> +	struct drm_device drm;
>> +
>> +	void __iomem *reg_base;
>> +	void __iomem *vram;
>> +	resource_size_t vram_base;
>> +	resource_size_t vram_size;
>> +
>> +	struct lsdc_display_pipe disp_pipe[LSDC_MAX_CRTC];
>> +
>> +	unsigned int num_output;
>> +
>> +	/* platform specific data */
>> +	const struct lsdc_chip_desc *desc;
>> +
>> +	/* @reglock: protects concurrent register access */
>> +	spinlock_t reglock;
>> +
>> +	/*
>> +	 * @dirty_update: true if manual dirty update is wantted
>> +	 */
>> +	bool dirty_update;
>> +	/*
>> +	 * @cached_coherent: true if the host platform is hardware maintained
>> +	 * cached coherent.
>> +	 */
>> +	bool cached_coherent;
>> +	/*
>> +	 * @use_vram_helper: using vram helper instead of cma helper base
>> +	 * solution. As ls7a1000 has a dediacted video ram, the dc scanout
>> +	 * from the vram is more reliable.
>> +	 */
>> +	bool use_vram_helper;
>> +
>> +	/*
>> +	 * @verbose: set it to true if print useful information is wantted
>> +	 */
>> +	bool verbose;
>> +
>> +	int irq;
>> +	u32 irq_status;
>> +};
>> +
>> +#define to_lsdc(x) container_of(x, struct lsdc_device, drm)
>> +
>> +static inline struct lsdc_crtc_state *
>> +to_lsdc_crtc_state(struct drm_crtc_state *base)
>> +{
>> +	return container_of(base, struct lsdc_crtc_state, base);
>> +}
>> +
>> +static inline u32 lsdc_reg_read32(struct lsdc_device * const ldev, u32 offset)
>> +{
>> +	u32 val;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ldev->reglock, flags);
>> +	val = readl(ldev->reg_base + offset);
>> +	spin_unlock_irqrestore(&ldev->reglock, flags);
>> +
>> +	return val;
>> +}
>> +
>> +static inline void lsdc_reg_write32(struct lsdc_device * const ldev, u32 offset, u32 val)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ldev->reglock, flags);
>> +	writel(val, ldev->reg_base + offset);
>> +	spin_unlock_irqrestore(&ldev->reglock, flags);
>> +}
>> +
>> +int lsdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc,
>> +		   unsigned int index, struct drm_plane *primary,
>> +		   struct drm_plane *cursor);
>> +
>> +int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
>> +		    enum drm_plane_type type, unsigned int index);
>> +
>> +int lsdc_encoder_init(struct drm_encoder * const encoder,
>> +		      struct drm_connector *connector,
>> +		      struct drm_device *ddev,
>> +		      unsigned int index,
>> +		      unsigned int total);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_encoder.c b/drivers/gpu/drm/lsdc/lsdc_encoder.c
>> new file mode 100644
>> index 000000000000..0cdd95f5bc37
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_encoder.c
>> @@ -0,0 +1,79 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *	Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_crtc_helper.h>
>> +
>> +#include "lsdc_drv.h"
>> +
>> +static const struct drm_encoder_funcs lsdc_encoder_funcs = {
>> +	.destroy = drm_encoder_cleanup,
>> +};
>> +
>> +
>> +int lsdc_encoder_init(struct drm_encoder * const encoder,
>> +		      struct drm_connector *connector,
>> +		      struct drm_device *ddev,
>> +		      unsigned int index,
>> +		      unsigned int total)
>> +{
>> +	int ret;
>> +	int type;
>> +
>> +	encoder->possible_crtcs = BIT(index);
>> +
>> +	if (total == 2)
>> +		encoder->possible_clones = BIT(1) | BIT(0);
>> +	else if (total < 2)
>> +		encoder->possible_clones = 0;
>> +
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VGA)
>> +		type = DRM_MODE_ENCODER_DAC;
>> +	else if ((connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
>> +		 (connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) ||
>> +		 (connector->connector_type == DRM_MODE_CONNECTOR_DVID))
>> +		type = DRM_MODE_ENCODER_TMDS;
>> +	else if (connector->connector_type == DRM_MODE_CONNECTOR_DPI)
>> +		type = DRM_MODE_ENCODER_DPI;
>> +	else if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
>> +		type = DRM_MODE_ENCODER_VIRTUAL;
>> +	else
>> +		type = DRM_MODE_ENCODER_NONE;
>> +
>> +	ret = drm_encoder_init(ddev,
>> +				encoder,
>> +				&lsdc_encoder_funcs,
>> +				type,
>> +				"encoder%d",
>> +				index);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return drm_connector_attach_encoder(connector, encoder);
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>> new file mode 100644
>> index 000000000000..895e94ae6827
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>> @@ -0,0 +1,220 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <linux/string.h>
>> +#include <linux/i2c.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_i2c.h"
>> +
>> +/*
>> + * set the state of a gpio pin indicated by mask
>> + * @mask: gpio pin mask
>> + */
>> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const i2c, int mask, int state)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(i2c->ddev);
>> +	u8 val;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ldev->reglock, flags);
>> +
>> +	if (state) {
>> +		val = readb(i2c->dir_reg);
>> +		val |= mask;
>> +		writeb(val, i2c->dir_reg);
>> +	} else {
>> +		val = readb(i2c->dir_reg);
>> +		val &= ~mask;
>> +		writeb(val, i2c->dir_reg);
>> +
>> +		val = readb(i2c->dat_reg);
>> +		if (state)
>> +			val |= mask;
>> +		else
>> +			val &= ~mask;
>> +		writeb(val, i2c->dat_reg);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&ldev->reglock, flags);
>> +}
>> +
>> +/*
>> + * read value back from gpio pin
>> + * @mask: gpio pin mask
>> + */
>> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const i2c, int mask)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(i2c->ddev);
>> +	u8 val;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ldev->reglock, flags);
>> +
>> +	/* first set this pin as input */
>> +	val = readb(i2c->dir_reg);
>> +	val |= mask;
>> +	writeb(val, i2c->dir_reg);
>> +
>> +	/* then get level state from this pin */
>> +	val = readb(i2c->dat_reg);
>> +
>> +	spin_unlock_irqrestore(&ldev->reglock, flags);
>> +
>> +	return (val & mask) ? 1 : 0;
>> +}
>> +
>> +
>> +/* set the state on the i2c->sda pin */
>> +static void ls7a_i2c_set_sda(void *i2c, int state)
>> +{
>> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>> +
>> +	return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
>> +}
>> +
>> +/* set the state on the i2c->scl pin */
>> +static void ls7a_i2c_set_scl(void *i2c, int state)
>> +{
>> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>> +
>> +	return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
>> +}
>> +
>> +/* read the value from the i2c->sda pin */
>> +static int ls7a_i2c_get_sda(void *i2c)
>> +{
>> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>> +
>> +	return ls7a_gpio_i2c_get(li2c, li2c->sda);
>> +}
>> +
>> +/* read the value from the i2c->scl pin */
>> +static int ls7a_i2c_get_scl(void *i2c)
>> +{
>> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>> +
>> +	return ls7a_gpio_i2c_get(li2c, li2c->scl);
>> +}
>> +
>> +/*
>> + * Get i2c id from connector id
>> + *
>> + * TODO: get it from dtb
>> + */
>> +static int lsdc_get_i2c_id(struct drm_device *ddev, unsigned int index)
>> +{
>> +	return index;
>> +}
>> +
>> +/*
>> + * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
>> + *
>> + * @index : output channel index, 0 for DVO0, 1 for DVO1
>> + */
>> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
>> +					 unsigned int index)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct i2c_adapter *adapter;
>> +	struct lsdc_i2c *li2c;
>> +	int ret;
>> +
>> +	li2c = devm_kzalloc(ddev->dev, sizeof(*li2c), GFP_KERNEL);
>> +	if (li2c == NULL)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	li2c->ddev = ddev;
>> +
>> +	if (index == 0) {
>> +		li2c->sda = 0x01;
>> +		li2c->scl = 0x02;
>> +	} else if (index == 1) {
>> +		li2c->sda = 0x04;
>> +		li2c->scl = 0x08;
>> +	}
>> +
>> +	li2c->dir_reg = ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
>> +	li2c->dat_reg = ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
>> +
>> +	li2c->bit.setsda = ls7a_i2c_set_sda;
>> +	li2c->bit.setscl = ls7a_i2c_set_scl;
>> +	li2c->bit.getsda = ls7a_i2c_get_sda;
>> +	li2c->bit.getscl = ls7a_i2c_get_scl;
>> +	li2c->bit.udelay = 5;
>> +	li2c->bit.timeout = usecs_to_jiffies(2200); /* from VESA */
>> +	li2c->bit.data = li2c;
>> +
>> +	adapter = &li2c->adapter;
>> +
>> +	adapter->algo_data = &li2c->bit;
>> +	adapter->owner = THIS_MODULE;
>> +	adapter->class = I2C_CLASS_DDC;
>> +	adapter->dev.parent = ddev->dev;
>> +	adapter->nr = -1;
>> +
>> +	snprintf(adapter->name, sizeof(adapter->name),
>> +		"%s-%d", "lsdc_gpio_i2c", index);
>> +
>> +	i2c_set_adapdata(adapter, li2c);
>> +
>> +	ret = i2c_bit_add_numbered_bus(adapter);
>> +	if (ret) {
>> +		devm_kfree(ddev->dev, li2c);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return adapter;
>> +}
>> +
>> +
>> +/*
>> + * Mainly for dc in ls2k1000, ls2k0500 SoC which should get a i2c adapter
>> + * from i2c susystem.
>> + *
>> + * @index : output channel index, 0 for DVO0, 1 for DVO1
>> + */
>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
>> +					 unsigned int index)
>> +{
>> +	unsigned int i2c_id;
>> +
>> +	/* find mapping between i2c id and connector id */
>> +	i2c_id = lsdc_get_i2c_id(ddev, index);
>> +
>> +	return i2c_get_adapter(i2c_id);
>> +}
>> +
>> +
>> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *adapter)
>> +{
>> +	i2c_put_adapter(adapter);
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.h b/drivers/gpu/drm/lsdc/lsdc_i2c.h
>> new file mode 100644
>> index 000000000000..f4560db3694a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +
>> +#ifndef __LSDC_I2C__
>> +#define __LSDC_I2C__
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/i2c-algo-bit.h>
>> +
>> +
>> +struct lsdc_i2c {
>> +	struct drm_device *ddev;
>> +	struct i2c_adapter adapter;
>> +	struct i2c_algo_bit_data bit;
>> +	/* pin bit mask */
>> +	u8 sda;
>> +	u8 scl;
>> +
>> +	void __iomem *dir_reg;
>> +	void __iomem *dat_reg;
>> +};
>> +
>> +
>> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *i2c);
>> +
>> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
>> +					 unsigned int con_id);
>> +
>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
>> +					 unsigned int con_id);
>> +
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c b/drivers/gpu/drm/lsdc/lsdc_irq.c
>> new file mode 100644
>> index 000000000000..7620de54aae4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +#include <drm/drm_vblank.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_irq.h"
>> +
>> +/* Function to be called in a threaded interrupt context. */
>> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg)
>> +{
>> +	struct drm_device *ddev = arg;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_crtc *crtc;
>> +
>> +	/* trigger the vblank event */
>> +	if (ldev->irq_status & INT_CRTC0_VS) {
>> +		crtc = drm_crtc_from_index(ddev, 0);
>> +		drm_crtc_handle_vblank(crtc);
>> +	}
>> +
>> +	if (ldev->irq_status & INT_CRTC1_VS) {
>> +		crtc = drm_crtc_from_index(ddev, 1);
>> +		drm_crtc_handle_vblank(crtc);
>> +	}
>> +
>> +	lsdc_reg_write32(ldev, LSDC_INT_REG, INT_CRTC0_VS_EN | INT_CRTC1_VS_EN);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +
>> +/* Function to be called when the IRQ occurs */
>> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg)
>> +{
>> +	struct drm_device *ddev = arg;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	/* Read & Clear the interrupt status */
>> +	ldev->irq_status = lsdc_reg_read32(ldev, LSDC_INT_REG);
>> +	if ((ldev->irq_status & INT_STATUS_MASK) == 0) {
>> +		drm_warn(ddev, "no interrupt occurs\n");
>> +		return IRQ_NONE;
>> +	}
>> +
>> +	/* clear all interrupt */
>> +	lsdc_reg_write32(ldev, LSDC_INT_REG, ldev->irq_status);
>> +
>> +	return IRQ_WAKE_THREAD;
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.h b/drivers/gpu/drm/lsdc/lsdc_irq.h
>> new file mode 100644
>> index 000000000000..ac187538d746
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#ifndef __LSDC_IRQ_H__
>> +#define __LSDC_IRQ_H__
>> +
>> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg);
>> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c b/drivers/gpu/drm/lsdc/lsdc_plane.c
>> new file mode 100644
>> index 000000000000..62801e100a13
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
>> @@ -0,0 +1,681 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_plane.h>
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_vblank.h>
>> +#include <drm/drm_drv.h>
>> +
>> +#include <drm/drm_format_helper.h>
>> +#include <drm/drm_plane_helper.h>
>> +#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_gem_atomic_helper.h>
>> +#include <drm/drm_damage_helper.h>
>> +
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_pll.h"
>> +
>> +
>> +static const uint32_t lsdc_primary_formats[] = {
>> +	DRM_FORMAT_RGB565,
>> +	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_ARGB8888,
>> +};
>> +
>> +static const uint32_t lsdc_cursor_formats[] = {
>> +	DRM_FORMAT_ARGB8888,
>> +};
>> +
>> +static const u64 lsdc_fb_format_modifiers[] = {
>> +	DRM_FORMAT_MOD_LINEAR,
>> +	DRM_FORMAT_MOD_INVALID
>> +};
>> +
>> +
>> +static u32 lsdc_pixfmt_to_drm_pixfmt(enum lsdc_pixel_format pf)
>> +{
>> +	switch (pf) {
>> +	case LSDC_PF_XRGB8888:
>> +		return DRM_FORMAT_XRGB8888;
>> +	case LSDC_PF_RGB565:
>> +		return DRM_FORMAT_RGB565;
>> +	case LSDC_PF_ARGB1555:
>> +		return DRM_FORMAT_ARGB1555;
>> +	case LSDC_PF_ARGB4444:
>> +		return DRM_FORMAT_ARGB4444;
>> +	case LSDC_PF_NONE:
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static const char *lsdc_pixfmt_to_string(u32 reg)
>> +{
>> +	switch (reg & CFG_PIX_FMT_MASK) {
>> +	case LSDC_PF_XRGB8888:
>> +		return "XRGB8888";
>> +	case LSDC_PF_RGB565:
>> +		return "RGB565";
>> +	case LSDC_PF_ARGB1555:
>> +		return "ARGB1555";
>> +	case LSDC_PF_ARGB4444:
>> +		return "ARGB4444";
>> +	case LSDC_PF_NONE:
>> +		return "NONE";
>> +	default:
>> +		return "unknown";
>> +	}
>> +}
>> +
>> +
>> +
>> +static void lsdc_update_fb_format(struct lsdc_device *ldev,
>> +				  struct drm_crtc *crtc,
>> +				  const struct drm_format_info *fmt_info)
>> +{
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	u32 val = 0;
>> +	u32 fmt;
>> +
>> +	switch (fmt_info->format) {
>> +	case DRM_FORMAT_RGB565:
>> +		fmt = LSDC_PF_RGB565;
>> +		break;
>> +	case DRM_FORMAT_XRGB8888:
>> +		fmt = LSDC_PF_XRGB8888;
>> +		break;
>> +	case DRM_FORMAT_ARGB8888:
>> +		fmt = LSDC_PF_XRGB8888;
>> +		break;
>> +	default:
>> +		fmt = LSDC_PF_XRGB8888;
>> +		break;
>> +	}
>> +
>> +	if (ldev->verbose)
>> +		drm_info(&ldev->drm, "fmt wanted is %s\n",
>> +				lsdc_pixfmt_to_string(fmt));
>> +
>> +	if (index == 0) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +	} else if (index == 1) {
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +	}
>> +
>> +	if (ldev->verbose)
>> +		drm_info(&ldev->drm, "after update fb%d format is %s\n",
>> +				index, lsdc_pixfmt_to_string(val));
>> +}
>> +
>> +
>> +static u32 lsdc_primary_get_default_format(struct drm_crtc *crtc)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(crtc->dev);
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	u32 val;
>> +
>> +	if (index == 0)
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +	else if (index == 1)
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +
>> +	return val & CFG_PIX_FMT_MASK;
>> +}
>> +
>> +
>> +static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
>> +				      struct drm_crtc *crtc,
>> +				      u64 paddr)
>> +{
>> +	unsigned int index = drm_crtc_index(crtc);
>> +	u32 addr_reg;
>> +	u32 cfg_reg;
>> +	u32 val;
>> +
>> +	/*
>> +	 * Find which framebuffer address register should update.
>> +	 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
>> +	 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
>> +	 */
>> +	if (index == 0) {
>> +		/* CRTC0 */
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
>> +
>> +		cfg_reg = LSDC_CRTC0_CFG_REG;
>> +
>> +		if (val & CFG_FB_IDX_BIT) {
>> +			addr_reg = LSDC_CRTC0_FB_ADDR0_REG;
>> +			drm_dbg_kms(&ldev->drm, "CRTC0 FB0 will be use\n");
>> +		} else {
>> +			addr_reg = LSDC_CRTC0_FB_ADDR1_REG;
>> +			drm_dbg_kms(&ldev->drm, "CRTC0 FBq will be use\n");
>> +		}
>> +	} else if (index == 1) {
>> +		/* CRTC1 */
>> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
>> +
>> +		cfg_reg = LSDC_CRTC1_CFG_REG;
>> +
>> +		if (val & CFG_FB_IDX_BIT) {
>> +			addr_reg = LSDC_CRTC1_FB_ADDR0_REG;
>> +			drm_dbg_kms(&ldev->drm, "CRTC1 FB0 will be use\n");
>> +		} else {
>> +			addr_reg = LSDC_CRTC1_FB_ADDR1_REG;
>> +			drm_dbg_kms(&ldev->drm, "CRTC1 FBq will be use\n");
>> +		}
>> +	}
>> +
>> +	lsdc_reg_write32(ldev, addr_reg, paddr);
>> +
>> +	/*
>> +	 * Then, we triger the fb switch, the switch of the framebuffer
>> +	 * to be scanout will complete at the next vblank.
>> +	 */
>> +	lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
>> +
>> +	drm_dbg_kms(&ldev->drm, "crtc%u scantout from 0x%llx\n", index, paddr);
>> +}
>> +
>> +
>> +static void lsdc_handle_damage(struct lsdc_device *ldev,
>> +			       struct drm_framebuffer *fb,
>> +			       struct drm_rect *clip,
>> +			       void *src)
>> +{
>> +	unsigned int offset;
>> +	void __iomem *dst;
>> +
>> +	offset = drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
>> +	dst = ldev->vram + offset;
>> +	drm_fb_memcpy_toio(dst, fb->pitches[0], src, fb, clip);
>> +}
>> +
>> +
>> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
>> +				       struct drm_plane_state *state,
>> +				       unsigned int plane)
>> +{
>> +	unsigned int offset;
>> +
>> +	offset = fb->offsets[plane];
>> +	offset += fb->format->cpp[plane] * (state->src_x >> 16);
>> +	offset += fb->pitches[plane] * (state->src_y >> 16);
>> +
>> +	return offset;
>> +}
>> +
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
>> +{
>> +	struct drm_gem_vram_object *gbo;
>> +	s64 gpu_addr;
>> +
>> +	gbo = drm_gem_vram_of_gem(fb->obj[0]);
>> +	gpu_addr = drm_gem_vram_offset(gbo);
>> +
>> +	return gpu_addr;
>> +}
>> +#endif
>> +
>> +
>> +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
>> +					   struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = plane->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>> +	struct drm_framebuffer *old_fb = old_plane_state->fb;
>> +	struct drm_crtc *crtc = new_plane_state->crtc;
>> +	u32 new_format = new_fb->format->format;
>> +	struct drm_crtc_state *new_crtc_state;
>> +	struct lsdc_crtc_state *priv_crtc_state;
>> +	int ret;
>> +
>> +	if (!crtc)
>> +		return 0;
>> +
>> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	if (WARN_ON(!new_crtc_state))
>> +		return -EINVAL;
>> +
>> +	priv_crtc_state = to_lsdc_crtc_state(new_crtc_state);
>> +
>> +	ret = drm_atomic_helper_check_plane_state(new_plane_state,
>> +						  new_crtc_state,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  false,
>> +						  true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Require full modeset if enabling or disabling a plane,
>> +	 * or changing its position, size, depth or format.
>> +	 */
>> +	if ((!new_fb || !old_fb ||
>> +	     old_plane_state->crtc_x != new_plane_state->crtc_x ||
>> +	     old_plane_state->crtc_y != new_plane_state->crtc_y ||
>> +	     old_plane_state->crtc_w != new_plane_state->crtc_w ||
>> +	     old_plane_state->crtc_h != new_plane_state->crtc_h ||
>> +	     old_fb->format->format != new_format))
>> +		new_crtc_state->mode_changed = true;
>> +
>> +
>> +	priv_crtc_state->pix_fmt = lsdc_primary_get_default_format(crtc);
> Storing the pixel format in the CRTC state is weird? What would happen
> if you have a primary plane and a cursor in different formats?
>
> Also, reading the default format from a register doesn't look right.
> atomic_check can occur at any time, including before a previous commit,
> or while the hardware is disabled. You should rely on either a constant
> or the previous state here.

Currently, private CRTC state(priv_crtc_state) is not get used by the cursor's
atomic_check() and atomic_update(). I means this is only for the primary plane.

And both and the primary and the cursor using  XRGB8888 format, what I 
really want  here is

let the atomic_update to update the framebuffer's format, because the 
firmware (pmon) of some

board set the framebuffer's format as RGB565.  If the hardware's format 
is same with the plane

state, then there is no need to update the FB's format register, save a 
function call, right?

When the plane is disabled the drm core will call the atomic_disable() 
function, right?

I will reconsider this, thank your advice.

>> +	if (lsdc_pixfmt_to_drm_pixfmt(priv_crtc_state->pix_fmt) != new_format) {
>> +		drm_info(&ldev->drm, "mode changed\n");
>> +		new_crtc_state->mode_changed = true;
>> +	}
>> +
>> +	if (new_crtc_state->mode_changed) {
>> +		struct lsdc_display_pipe *dispipe = container_of(plane, struct lsdc_display_pipe, primary);
>> +		struct lsdc_pll *pixpll = &dispipe->pixpll;
>> +		const struct lsdc_pixpll_funcs *pfuncs = pixpll->funcs;
>> +
>> +		ret = pfuncs->compute(pixpll,
>> +				      new_crtc_state->mode.clock,
>> +				      true,
>> +				      &priv_crtc_state->pparams);
>> +		if (ret == false) {
>> +			drm_warn(plane->dev,
>> +				"failed find a set of pll param for mode %u\n",
>> +				new_crtc_state->mode.clock);
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (ldev->dirty_update)
>> +		drm_atomic_helper_check_plane_damage(state, new_plane_state);
>> +
>> +	return 0;
>> +}
>> +
>> +static void lsdc_update_stride(struct lsdc_device *ldev,
>> +			       struct drm_crtc *crtc,
>> +			       unsigned int stride)
>> +{
>> +	unsigned int index = drm_crtc_index(crtc);
>> +
>> +	if (index == 0)
>> +		lsdc_reg_write32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
>> +	else if (index == 1)
>> +		lsdc_reg_write32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
>> +
>> +	drm_dbg_kms(&ldev->drm, "update stride to %u\n", stride);
>> +}
>> +
>> +
>> +
>> +static void lsdc_primary_plane_atomic_update(struct drm_plane *plane,
>> +					     struct drm_atomic_state *state)
>> +{
>> +	struct lsdc_device *ldev = to_lsdc(plane->dev);
>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_crtc *crtc = new_plane_state->crtc;
>> +	struct drm_framebuffer *fb = new_plane_state->fb;
>> +	u32 fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
>> +	struct drm_gem_cma_object *obj;
>> +	dma_addr_t fb_addr;
>> +
>> +	if (ldev->use_vram_helper) {
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +		s64 gpu_addr;
>> +
>> +		gpu_addr = lsdc_get_vram_bo_offset(fb);
>> +		if (gpu_addr < 0)
>> +			return;
>> +
>> +		fb_addr = ldev->vram_base + gpu_addr + fb_offset;
>> +#endif
>> +	} else {
>> +		obj = drm_fb_cma_get_gem_obj(fb, 0);
>> +
>> +		if (ldev->dirty_update)
>> +			fb_addr = ldev->vram_base + fb_offset;
>> +		else
>> +			fb_addr = obj->paddr + fb_offset;
>> +	}
>> +
>> +	lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
>> +
>> +	lsdc_update_stride(ldev, crtc, fb->pitches[0]);
>> +
>> +	if (drm_atomic_crtc_needs_modeset(crtc->state))
>> +		lsdc_update_fb_format(ldev, crtc, fb->format);
>> +
>> +	if (ldev->dirty_update) {
>> +		struct drm_plane_state *old_plane_state;
>> +		struct drm_rect damage;
>> +		bool valid;
>> +
>> +		old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +
>> +		valid = drm_atomic_helper_damage_merged(old_plane_state,
>> +							new_plane_state,
>> +							&damage);
>> +		if (valid)
>> +			lsdc_handle_damage(ldev, fb, &damage, obj->vaddr);
>> +	}
>> +}
>> +
>> +
>> +static void lsdc_primary_plane_atomic_disable(struct drm_plane *plane,
>> +					struct drm_atomic_state *state)
>> +{
>> +	drm_dbg_kms(plane->dev, "%s disabled\n", plane->name);
>> +}
>> +
>> +
>> +static int lsdc_plane_prepare_fb(struct drm_plane *plane,
>> +				   struct drm_plane_state *new_state)
>> +{
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +	struct lsdc_device *ldev = to_lsdc(plane->dev);
>> +
>> +	if (ldev->use_vram_helper)
>> +		return drm_gem_vram_plane_helper_prepare_fb(plane, new_state);
>> +#endif
>> +	return drm_gem_plane_helper_prepare_fb(plane, new_state);
>> +}
>> +
>> +
>> +static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
>> +				    struct drm_plane_state *old_state)
>> +{
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +	struct drm_device *ddev = plane->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +
>> +	if (ldev->use_vram_helper)
>> +		return drm_gem_vram_plane_helper_cleanup_fb(plane, old_state);
>> +#endif
>> +}
>> +
>> +static const struct drm_plane_helper_funcs lsdc_primary_plane_helpers = {
>> +	.prepare_fb = lsdc_plane_prepare_fb,
>> +	.cleanup_fb = lsdc_plane_cleanup_fb,
>> +	.atomic_check = lsdc_primary_plane_atomic_check,
>> +	.atomic_update = lsdc_primary_plane_atomic_update,
>> +	.atomic_disable = lsdc_primary_plane_atomic_disable,
>> +};
>> +
>> +
>> +
> Don't use multiple blank lines. Generally speaking, there's a lot of
> checkpatch warnings to fix. Make sure to run checkpatch.pl --strict and
> fix whatever comes up.

Okay, I will fix it.


>> +static int lsdc_cursor_atomic_check(struct drm_plane *plane,
>> +				    struct drm_atomic_state *state)
>> +{
>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_crtc *crtc = new_plane_state->crtc;
>> +	struct drm_framebuffer *fb = new_plane_state->fb;
>> +	struct drm_crtc_state *crtc_state;
>> +	int ret;
>> +
>> +	/* no need for further checks if the plane is being disabled */
>> +	if (!crtc || !fb)
>> +		return 0;
>> +
>> +	if (!new_plane_state->visible)
>> +		return 0;
>> +
>> +	crtc_state = drm_atomic_get_new_crtc_state(state,
>> +						   new_plane_state->crtc);
>> +
>> +	ret = drm_atomic_helper_check_plane_state(new_plane_state,
>> +						  crtc_state,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  DRM_PLANE_HELPER_NO_SCALING,
>> +						  true,
>> +						  true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if ((fb->width < LSDC_CURS_MIN_SIZE) ||
>> +	    (fb->height < LSDC_CURS_MIN_SIZE) ||
>> +	    (fb->width > LSDC_CURS_MAX_SIZE) ||
>> +	    (fb->height > LSDC_CURS_MAX_SIZE)) {
>> +		drm_err(plane->dev, "Invalid cursor size: %dx%d\n",
>> +				fb->width, fb->height);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +/* Update the location of the cursor */
>> +static void lsdc_cursor_update_location(struct lsdc_device *ldev,
>> +					struct drm_crtc *crtc)
>> +{
>> +	u32 val;
>> +
>> +	val = lsdc_reg_read32(ldev, LSDC_CURSOR_CFG_REG);
>> +
>> +	if ((val & CURSOR_FORMAT_MASK) == 0)
>> +		val |= CURSOR_FORMAT_ARGB8888;
>> +
>> +	/* Update the location of the cursor */
>> +	if (drm_crtc_index(crtc))
>> +		val |= CURSOR_LOCATION_BIT;
>> +
>> +	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, val);
>> +}
>> +
>> +/* update the position of the cursor */
>> +static void lsdc_cursor_update_position(struct lsdc_device *ldev, int x, int y)
>> +{
>> +	if (x < 0)
>> +		x = 0;
>> +
>> +	if (y < 0)
>> +		y = 0;
>> +
>> +	lsdc_reg_write32(ldev, LSDC_CURSOR_POSITION_REG, (y << 16) | x);
>> +}
>> +
>> +
>> +static void lsdc_cursor_atomic_update(struct drm_plane *plane,
>> +				      struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = plane->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>> +	struct drm_framebuffer *old_fb = old_plane_state->fb;
>> +
>> +	if (new_fb != old_fb) {
>> +		u64 cursor_addr;
>> +
>> +		if (ldev->use_vram_helper) {
>> +#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
>> +			s64 offset;
>> +
>> +			offset = lsdc_get_vram_bo_offset(new_fb);
>> +			cursor_addr = ldev->vram_base + offset;
>> +
>> +			drm_dbg_kms(ddev, "%s offset: %llx\n",
>> +					plane->name, offset);
>> +#endif
>> +		} else {
>> +			struct drm_gem_cma_object *cursor_obj;
>> +
>> +			cursor_obj = drm_fb_cma_get_gem_obj(new_fb, 0);
>> +			if (!cursor_obj)
>> +				return;
>> +
>> +			cursor_addr = cursor_obj->paddr;
>> +		}
>> +
>> +		lsdc_reg_write32(ldev, LSDC_CURSOR_ADDR_REG, cursor_addr);
>> +	}
>> +
>> +	lsdc_cursor_update_position(ldev, new_plane_state->crtc_x,
>> +					  new_plane_state->crtc_y);
>> +
>> +	lsdc_cursor_update_location(ldev, new_plane_state->crtc);
>> +}
>> +
>> +
>> +static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
>> +				       struct drm_atomic_state *state)
>> +{
>> +	struct drm_device *ddev = plane->dev;
>> +	struct lsdc_device *ldev = to_lsdc(ddev);
>> +	struct drm_plane_state *old_plane_state;
>> +	struct drm_crtc *crtc;
>> +
>> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
>> +
>> +	if (old_plane_state)
>> +		crtc = old_plane_state->crtc;
>> +
>> +	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, 0);
>> +
>> +	drm_dbg_kms(ddev, "%s disable\n", plane->name);
>> +}
>> +
>> +
>> +static const struct drm_plane_helper_funcs lsdc_cursor_plane_helpers = {
>> +	.prepare_fb = lsdc_plane_prepare_fb,
>> +	.cleanup_fb = lsdc_plane_cleanup_fb,
>> +	.atomic_check = lsdc_cursor_atomic_check,
>> +	.atomic_update = lsdc_cursor_atomic_update,
>> +	.atomic_disable = lsdc_cursor_atomic_disable,
>> +};
>> +
>> +
>> +static int lsdc_plane_get_default_zpos(enum drm_plane_type type)
>> +{
>> +	switch (type) {
>> +	case DRM_PLANE_TYPE_PRIMARY:
>> +		return 0;
>> +	case DRM_PLANE_TYPE_OVERLAY:
>> +		return 1;
>> +	case DRM_PLANE_TYPE_CURSOR:
>> +		return 7;
>> +	}
>> +	return 0;
>> +}
>> +
>> +
>> +static void lsdc_plane_reset(struct drm_plane *plane)
>> +{
>> +	drm_atomic_helper_plane_reset(plane);
>> +
>> +	plane->state->zpos = lsdc_plane_get_default_zpos(plane->type);
>> +
>> +	drm_dbg_kms(plane->dev, "%s reset\n", plane->name);
>> +}
>> +
>> +
>> +static const struct drm_plane_funcs lsdc_plane_funcs = {
>> +	.update_plane = drm_atomic_helper_update_plane,
>> +	.disable_plane = drm_atomic_helper_disable_plane,
>> +	.destroy = drm_plane_cleanup,
>> +	.reset = lsdc_plane_reset,
>> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>> +};
>> +
>> +
>> +int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
>> +		    enum drm_plane_type type, unsigned int index)
>> +{
>> +	struct drm_device *ddev = &ldev->drm;
>> +	int zpos = lsdc_plane_get_default_zpos(type);
>> +	unsigned int format_count;
>> +	const uint32_t *formats;
>> +	const char *name;
>> +	int ret;
>> +
>> +	switch (type) {
>> +	case DRM_PLANE_TYPE_PRIMARY:
>> +		formats = lsdc_primary_formats;
>> +		format_count = ARRAY_SIZE(lsdc_primary_formats);
>> +		name = "primary-%u";
>> +		break;
>> +	case DRM_PLANE_TYPE_CURSOR:
>> +		formats = lsdc_cursor_formats;
>> +		format_count = ARRAY_SIZE(lsdc_cursor_formats);
>> +		name = "cursor-%u";
>> +		break;
>> +	case DRM_PLANE_TYPE_OVERLAY:
>> +		drm_err(ddev, "overlay plane is not supported\n");
>> +		break;
>> +	}
>> +
>> +	ret = drm_universal_plane_init(ddev, plane, 1 << index,
>> +				       &lsdc_plane_funcs,
>> +				       formats, format_count,
>> +				       lsdc_fb_format_modifiers,
>> +				       type, name, index);
>> +	if (ret) {
>> +		drm_err(ddev, "%s failed: %d\n", __func__, ret);
>> +		return ret;
>> +	}
>> +
>> +	switch (type) {
>> +	case DRM_PLANE_TYPE_PRIMARY:
>> +		drm_plane_helper_add(plane, &lsdc_primary_plane_helpers);
>> +		drm_plane_create_zpos_property(plane, zpos, 0, 6);
>> +		if (ldev->dirty_update)
>> +			drm_plane_enable_fb_damage_clips(plane);
>> +		break;
>> +	case DRM_PLANE_TYPE_CURSOR:
>> +		drm_plane_helper_add(plane, &lsdc_cursor_plane_helpers);
>> +		drm_plane_create_zpos_immutable_property(plane, zpos);
>> +		break;
>> +	case DRM_PLANE_TYPE_OVERLAY:
>> +		drm_err(ddev, "overlay plane is not supported\n");
>> +		break;
>> +	}
>> +
>> +	drm_plane_create_alpha_property(plane);
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c b/drivers/gpu/drm/lsdc/lsdc_pll.c
>> new file mode 100644
>> index 000000000000..fcf3728a9067
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
>> @@ -0,0 +1,657 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng<suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_pll.h"
>> +
>> +/* device dependent pixpll regs */
>> +
>> +/* u64 */
>> +struct ls7a1000_pixpll_bitmap {
>> +	/* Byte 0 ~ Byte 3 */
>> +	unsigned div_out      : 7;   /*  0 : 6     output clock divider  */
>> +	unsigned reserved_1   : 14;  /*  7 : 20                          */
>> +	unsigned loopc        : 9;   /* 21 : 29                          */
>> +	unsigned reserved_2   : 2;   /* 30 : 31                          */
>> +
>> +	/* Byte 4 ~ Byte 7 */
>> +	unsigned div_ref      : 7;   /*  0 : 6     input clock divider   */
>> +	unsigned locked       : 1;   /*  7         PLL locked flag       */
>> +	unsigned sel_out      : 1;   /*  8         output clk selector   */
>> +	unsigned reserved_3   : 2;   /*  9 : 10    reserved              */
>> +	unsigned set_param    : 1;   /*  11        set pll param         */
>> +	unsigned bypass       : 1;   /*  12                              */
>> +	unsigned powerdown    : 1;   /*  13                              */
>> +	unsigned reserved_4   : 18;  /*  14 : 31                         */
>> +};
>> +
>> +
>> +/* u128 */
>> +struct ls2k1000_pixpll_bitmap {
>> +	/* Byte 0 ~ Byte 3 */
>> +	unsigned sel_out      :  1;  /*  0      select this PLL          */
>> +	unsigned reserved_1   :  1;  /*  1                               */
>> +	unsigned sw_adj_en    :  1;  /*  2      allow software adjust    */
>> +	unsigned bypass       :  1;  /*  3      bypass L1 PLL            */
>> +	unsigned reserved_2   :  3;  /*  4:6                             */
>> +	unsigned lock_en      :  1;  /*  7      enable lock L1 PLL       */
>> +	unsigned reserved_3   :  2;  /*  8:9                             */
>> +	unsigned lock_check   :  2;  /* 10:11   precision check          */
>> +	unsigned reserved_4   :  4;  /* 12:15                            */
>> +
>> +	unsigned locked       :  1;  /* 16      PLL locked flag bit      */
>> +	unsigned reserved_5   :  2;  /* 17:18                            */
>> +	unsigned powerdown    :  1;  /* 19      powerdown the pll if set */
>> +	unsigned reserved_6   :  6;  /* 20:25                            */
>> +	unsigned div_ref      :  6;  /* 26:31   L1 Prescaler             */
>> +
>> +	/* Byte 4 ~ Byte 7 */
>> +	unsigned loopc        : 10;  /* 32:41   Clock Multiplier         */
>> +	unsigned l1_div       :  6;  /* 42:47   not used                 */
>> +	unsigned reserved_7   : 16;  /* 48:63                            */
>> +
>> +	/* Byte 8 ~ Byte 15 */
>> +	unsigned div_out      :  6;  /* 0 : 5   output clock divider     */
>> +	unsigned reserved_8   : 26;  /* 6 : 31                           */
>> +	unsigned reserved_9   : 32;  /* 70: 127                          */
>> +};
>> +
>> +
>> +/* u32 */
>> +struct ls2k0500_pixpll_bitmap {
>> +	/* Byte 0 ~ Byte 1 */
>> +	unsigned sel_out      : 1;
>> +	unsigned reserved_1   : 2;
>> +	unsigned sw_adj_en    : 1;   /* allow software adjust              */
>> +	unsigned bypass       : 1;   /* bypass L1 PLL                      */
>> +	unsigned powerdown    : 1;   /* write 1 to powerdown the PLL       */
>> +	unsigned reserved_2   : 1;
>> +	unsigned locked       : 1;   /*  7     Is L1 PLL locked, read only */
>> +	unsigned div_ref      : 6;   /*  8:13  ref clock divider           */
>> +	unsigned reserved_3   : 2;   /* 14:15                              */
>> +	/* Byte 2 ~ Byte 3 */
>> +	unsigned loopc        : 8;   /* 16:23   Clock Multiplier           */
>> +	unsigned div_out      : 6;   /* 24:29   output clock divider       */
>> +	unsigned reserved_4   : 2;   /* 30:31                              */
>> +};
>> +
>> +
>> +/*
>> + * NOTE: All loongson's cpu is little endian.
>> + */
>> +union lsdc_pix_pll_param {
>> +	struct ls7a1000_pixpll_bitmap ls7a1000;
>> +	struct ls2k1000_pixpll_bitmap ls2k1000;
>> +	struct ls2k0500_pixpll_bitmap ls2k0500;
>> +
>> +	u32 dword[4];
>> +};
>> +
>> +/*
>> + * pixel clock to pll parameters translation table
>> + */
>> +struct pixclk_to_pll_parm {
>> +	/* kHz */
>> +	unsigned int clock;
>> +
>> +	/* unrelated information */
>> +	unsigned short width;
>> +	unsigned short height;
>> +	unsigned short vrefresh;
>> +
>> +	/* Stores parameters for programming the Hardware PLLs */
>> +	unsigned short div_out;
>> +	unsigned short loopc;
>> +	unsigned short div_ref;
>> +};
>> +
>> +
>> +/*
>> + * Small cached value to speed up pll parameter calculation
>> + */
>> +static const struct pixclk_to_pll_parm pll_param_table[] = {
>> +	{148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
>> +						/* 1920x1080@50Hz */
>> +	{174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
>> +	{181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
>> +	{146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
>> +	{135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
>> +
>> +	{108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz  */
>> +						/* 1280x1024@60Hz */
>> +						/* 1280x960@60Hz */
>> +						/* 1152x864@75Hz */
>> +
>> +	{106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
>> +	{88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
>> +	{83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
>> +	{71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
>> +
>> +	{74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
>> +						/* 1280x720@50Hz */
>> +
>> +	{78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
>> +	{75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
>> +	{65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
>> +
>> +	{51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
>> +
>> +	{57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
>> +	{49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
>> +	{50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
>> +	{40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
>> +	{36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
>> +	{31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
>> +						/* 640x480@73Hz */
>> +
>> +	{30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
>> +	{27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
>> +	{25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
>> +	{25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
>> +						/* 720x480@60Hz */
>> +};
>> +
>> +/**
>> + * lsdc_pixpll_setup
>> + *
>> + * @this: point to the object which calling this function
>> + *
>> + * ioremap the device dependent register before using it
>> + */
>> +static int lsdc_pixpll_setup(struct lsdc_pll * const this)
>> +{
>> +	this->mmio = ioremap(this->reg_base, this->reg_size);
>> +
>> +	drm_info(this->ddev, "PIXPLL%u REG[%x, %u] map to %llx\n",
>> +		this->index, this->reg_base, this->reg_size, (u64)this->mmio);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +
>> +/*
>> + * Find a set of pll parameters (to generate pixel clock) from a static
>> + * local table, which avoid to compute the pll parameter everytime a
>> + * modeset is triggered.
>> + *
>> + * @this: point to the object which calling this function
>> + * @clock: the desired pixel clock wanted to generate, the unit is kHz
>> + * @pout: pointer to where hardware pll parameters(if found) to save
>> + *
>> + *  Return true if a parameter is found, otherwise return false.
>> + */
>> +static bool lsdc_pixpll_find(struct lsdc_pll * const this,
>> +			     unsigned int clock,
>> +			     struct lsdc_pll_core_values * const pout)
>> +{
>> +	unsigned int num = ARRAY_SIZE(pll_param_table);
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < num; i++) {
>> +		if (clock != pll_param_table[i].clock)
>> +			continue;
>> +
>> +		pout->div_ref = pll_param_table[i].div_ref;
>> +		pout->loopc   = pll_param_table[i].loopc;
>> +		pout->div_out = pll_param_table[i].div_out;
>> +
>> +		return true;
>> +	}
>> +
>> +	drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
>> +
>> +	return false;
>> +}
>> +
>> +/*
>> + * Find a set of pll parameters which have minimal difference with desired
>> + * clock frequency. It does that by computing the all of pll parameters
>> + * combines possible and compare the diff and find the minimal.
>> + *
>> + *  clock_out = refclk / div_ref * loopc / div_out
>> + *
>> + *  refclk is fixed as 100MHz in ls7a1000, ls2k1000 and ls2k0500
>> + *
>> + * @this: point to the object which calling this function
>> + * @clk: the desired pixel clock wanted to generate, the unit is kHz
>> + * @verbose: print the pll parameter and the actual pixel clock.
>> + * @pout: pointer to where hardware pll parameters(if found) to save
>> + *
>> + *  Return true if a parameter is found, otherwise return false.
>> + */
>> +static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
>> +				unsigned int clk,
>> +				bool verbose,
>> +				struct lsdc_pll_core_values * const pout)
>> +{
>> +	unsigned int refclk = this->ref_clock;
>> +	const unsigned int tolerance = 1000;
>> +	unsigned int min = tolerance;
>> +	unsigned int div_out, loopc, div_ref;
>> +
>> +	if (lsdc_pixpll_find(this, clk, pout))
>> +		return true;
>> +
>> +	for (div_out = 6; div_out < 64; div_out++) {
>> +		for (div_ref = 3; div_ref < 6; div_ref++) {
>> +			for (loopc = 6; loopc < 161; loopc++) {
>> +				int diff;
>> +
>> +				if (loopc < 12 * div_ref)
>> +					continue;
>> +				if (loopc > 32 * div_ref)
>> +					continue;
>> +
>> +				diff = clk * div_out - refclk * loopc / div_ref;
>> +
>> +				if (diff < 0)
>> +					diff = -diff;
>> +
>> +				if (diff < min) {
>> +					min = diff;
>> +					pout->div_ref = div_ref;
>> +					pout->div_out = div_out;
>> +					pout->loopc = loopc;
>> +
>> +					if (diff == 0)
>> +						return true;
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	if (verbose) {
>> +		unsigned int clk_out;
>> +
>> +		clk_out = refclk / pout->div_ref * pout->loopc / pout->div_out;
>> +
>> +		drm_info(this->ddev, "pixpll%u\n", this->index);
>> +
>> +		drm_info(this->ddev, "div_ref=%u, loopc=%u, div_out=%u\n",
>> +				pout->div_ref, pout->loopc, pout->div_out);
>> +
>> +		drm_info(this->ddev, "desired clk=%u, actual out=%u, diff=%d\n",
>> +				clk, clk_out, clk_out - clk);
>> +	}
>> +
>> +	return min < tolerance;
>> +}
>> +
>> +/*
>> + * Update the pll parameters to hardware, target to the pixpll in ls7a1000
>> + *
>> + * @this: point to the object which calling this function
>> + * @param: pointer to where the parameters passed in
>> + *
>> + *  Return true if a parameter is found, otherwise return false.
>> + */
>> +static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
>> +			const struct lsdc_pll_core_values * const param)
>> +{
>> +	u32 val;
>> +	unsigned int counter = 0;
>> +	void __iomem *reg = this->mmio;
>> +	bool locked;
>> +
>> +
>> +	/* clear sel_pll_out0 */
>> +	val = readl(reg + 0x4);
>> +	val &= ~(1 << 8);
>> +	writel(val, reg + 0x4);
>> +
>> +	/* set pll_pd */
>> +	val = readl(reg + 0x4);
>> +	val |= (1 << 13);
>> +	writel(val, reg + 0x4);
>> +
>> +	/* clear set_pll_param */
>> +	val = readl(reg + 0x4);
>> +	val &= ~(1 << 11);
>> +	writel(val, reg + 0x4);
>> +
>> +	/* clear old value & config new value */
>> +	val = readl(reg + 0x04);
>> +	val &= ~0x7F;
>> +
>> +	val |= param->div_ref;        /* div_ref */
>> +	writel(val, reg + 0x4);
>> +
>> +	val = readl(reg);
>> +	val &= ~(0x7f << 0);
>> +	val |= param->div_out;        /* div_out */
>> +	val &= ~(0x1ffUL << 21);
>> +	val |= param->loopc << 21;    /* loopc */
>> +	writel(val, reg);
>> +
>> +	/* set set_pll_param */
>> +	val = readl(reg + 0x4);
>> +	val |= (1 << 11);
>> +	writel(val, reg + 0x4);
>> +
>> +	/* clear pll_pd */
>> +	val = readl(reg + 0x4);
>> +	val &= ~(1 << 13);
>> +	writel(val, reg + 0x4);
>> +
>> +	/* wait pll lock */
>> +	do {
>> +		val = readl(reg + 0x4);
>> +		locked = val & 0x80;
>> +		counter++;
>> +	} while (locked == false);
>> +
>> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
>> +
>> +	/* set sel_pll_out0 */
>> +	val = readl(reg + 0x4);
>> +	val |= (1UL << 8);
>> +	writel(val, reg + 0x4);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +/*
>> + * Update the pll parameters to hardware, target to the pixpll in ls2k1000
>> + *
>> + * @this: point to the object which calling this function
>> + * @param: pointer to where the parameters passed in
>> + *
>> + *  Return true if a parameter is found, otherwise return false.
>> + */
>> +static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
>> +			const struct lsdc_pll_core_values * const param)
>> +{
>> +	void __iomem *reg = this->mmio;
>> +	unsigned int counter = 0;
>> +	bool locked = false;
>> +	u32 val;
>> +
>> +	val = readl(reg);
>> +	/* Bypass the software configured PLL, using refclk directly */
>> +	val &= ~(1 << 0);
>> +	writel(val, reg);
>> +
>> +	/* powerdown the PLL */
>> +	val |= (1 << 19);
>> +	writel(val, reg);
>> +
>> +	/* Allow the software configuration */
>> +	val &= ~(1 << 2);
>> +	writel(val, reg);
>> +
>> +	/* allow L1 PLL lock */
>> +	val = (1L << 7) | (3L << 10);
>> +	writel(val, reg);
>> +
>> +	/* clear div_ref bit field */
>> +	val &= ~(0x3f << 26);
>> +	/* set div_ref bit field */
>> +	val = val | (param->div_ref << 26);
>> +	writel(val, reg);
>> +
>> +	val = readl(reg + 4);
>> +	/* clear loopc bit field */
>> +	val &= ~0x0fff;
>> +	/* set loopc bit field */
>> +	val |= param->loopc;
>> +	writel(val, reg + 4);
>> +
>> +	/* set div_out */
>> +	writel(param->div_out, reg + 8);
>> +
>> +	val = readl(reg);
>> +	/* use the software configure param */
>> +	val |= (1 << 2);
>> +	/* powerup the PLL */
>> +	val &= ~(1 << 19);
>> +	writel(val, reg);
>> +
>> +	/* wait pll setup and locked */
>> +	do {
>> +		val = readl(reg);
>> +		locked = val & 0x10000;
>> +		counter++;
>> +	} while (locked == false);
>> +
>> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
>> +
>> +	/* Switch to the above software configured PLL instead of refclk */
>> +	val |= 1;
>> +	writel(val, reg);
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Update the pll parameters to hardware, target to the pixpll in ls2k0500
>> + *
>> + * @this: point to the object which calling this function
>> + * @param: pointer to where the parameters passed in
>> + *
>> + *  Return true if a parameter is found, otherwise return false.
>> + */
>> +
>> +static int ls2k0500_pixpll_param_update(struct lsdc_pll * const this,
>> +			const struct lsdc_pll_core_values * const param)
>> +{
>> +	void __iomem *reg = this->mmio;
>> +	unsigned int counter = 0;
>> +	bool locked = false;
>> +	u32 val;
>> +
>> +	/* Bypass the software configured PLL, using refclk directly */
>> +	val = readl(reg);
>> +	val &= ~(1 << 0);
>> +	writel(val, reg);
>> +
>> +	/* Powerdown the PLL */
>> +	val = readl(reg);
>> +	val |= (1 << 5);
>> +	writel(val, reg);
>> +
>> +	/* Allow the software configuration */
>> +	val |= (1 << 3);
>> +	writel(val, reg);
>> +
>> +	/* Update the pll params */
>> +	val = (param->div_out << 24) |
>> +	      (param->loopc << 16) |
>> +	      (param->div_ref << 8);
>> +
>> +	writel(val, reg);
>> +
>> +	/* Powerup the PLL */
>> +	val = readl(reg);
>> +	val &= ~(1 << 5);
>> +	writel(val, reg);
>> +
>> +	/* wait pll setup and locked */
>> +	do {
>> +		val = readl(reg);
>> +		locked = val & 0x80;
>> +		counter++;
>> +	} while (locked == false);
>> +
>> +	drm_dbg_kms(this->ddev, "%u loop waited\n", counter);
>> +
>> +	/* Switch to the above software configured PLL instead of refclk */
>> +	writel((val | 1), reg);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +#define LSDC_PIXPLL_BITMAP(type,var,parms) \
>> +		struct type ## _pixpll_bitmap *var = &parms.type
>> +
>> +#define LSDC_PIXPLL_PRINT_CODE_BLOCK(ddev,var,index,refclk)                \
>> +{                                                                          \
>> +	out_clk = refclk / var->div_ref * var->loopc / var->div_out;       \
>> +	drm_info(ddev, "div_ref=%u, loopc=%u, div_out=%u\n",               \
>> +			var->div_ref, var->loopc, var->div_out);           \
>> +	drm_info(ddev, "locked: %s\n", var->locked ? "Yes" : "No");        \
>> +	drm_info(ddev, "bypass: %s\n", var->bypass ? "Yes" : "No");        \
>> +	drm_info(ddev, "powerdown: %s\n", var->powerdown ? "Yes" : "No");  \
>> +	drm_info(ddev, "set_out: %s\n", var->sel_out ? "Yes" : "No");      \
>> +	drm_info(ddev, "pixpll%u generate %ukHz\n", index, out_clk);       \
>> +	drm_info(ddev, "\n");                                              \
>> +}
>>
>> This should be a debug-level trace
>>
>> Maxime

It will only get printed if you using lsdc.verbose=1 on the kernel cmd 
line, by default lsdc.verbose=0,

and it will not get printed. I want only those debug information get 
printed, if turn it to debug-level trace,

it will overwhelming , because debug message is too large, sometime 
cause the system lag.

Anyway great thanks for advice, i will reconsider it.

--------------0TAO3GCQXnoVqOnX0h0dN0s0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022/2/3 16:58, Maxime Ripard wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <pre class="moz-quote-pre" wrap="">Hi,

On Thu, Feb 03, 2022 at 04:25:44PM +0800, Sui Jingfeng wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: suijingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>

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
  | LS3A4000 |&lt;---------&gt;| +--------+  +-------+ |   memory   |&lt;-&gt;| VRAM |
  |   CPU    |&lt;---------&gt;| | GC1000 |  |  LSDC | | controller |   +------+
  +----------+           | +--------+  +-+---+-+ +------------|
       || MC1            +---------------|---|----------------+
    +------+                             |   |
    | DDR4 |          +-------+    DVO0  |   |  DVO1  +------+
    +------+   VGA &lt;--|ADV7125|&lt;---------+   +-------&gt;|TFP410|--&gt; DVI/HDMI
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
     |  CRTC0 --&gt; DVO0 ---------&gt; Encoder0 --&gt; Connector0 ---&gt; | Monitor |
     |                   |           ^            ^            |_________|
     |                   |           |            |
     |                &lt;----- i2c0 ----------------+
     |   LSDC IP CORE    |
     |                &lt;----- i2c1 ----------------+
     |                   |           |            |             _________
     |                   |           |            |            |         |
     |  CRTC1 --&gt; DVO1 ---------&gt; Encoder1 --&gt; Connector1 ---&gt; |  Panel  |
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
   1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
   2) Explain why tiny drm driver is not suitable for us.
   3) Give a short description of the trival dirty uppdate implement based
      on CMA helper.
   4) code clean up

[1] <a class="moz-txt-link-freetext" href="https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000">https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000</a>
[2] <a class="moz-txt-link-freetext" href="https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html">https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html</a>
[3] <a class="moz-txt-link-freetext" href="https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html">https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html</a>

Reported-by: Randy Dunlap <a class="moz-txt-link-rfc2396E" href="mailto:rdunlap@infradead.org">&lt;rdunlap@infradead.org&gt;</a>
Reported-by: kernel test robot
Signed-off-by: suijingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
Signed-off-by: Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:15330273260@189.cn">&lt;15330273260@189.cn&gt;</a>
---
 drivers/gpu/drm/Kconfig               |   2 +
 drivers/gpu/drm/Makefile              |   1 +
 drivers/gpu/drm/lsdc/Kconfig          |  38 ++
 drivers/gpu/drm/lsdc/Makefile         |  15 +
 drivers/gpu/drm/lsdc/lsdc_connector.c | 443 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_connector.h |  60 ++
 drivers/gpu/drm/lsdc/lsdc_crtc.c      | 440 ++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.c       | 846 ++++++++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_drv.h       | 216 +++++++
 drivers/gpu/drm/lsdc/lsdc_encoder.c   |  79 +++
 drivers/gpu/drm/lsdc/lsdc_i2c.c       | 220 +++++++
 drivers/gpu/drm/lsdc/lsdc_i2c.h       |  61 ++
 drivers/gpu/drm/lsdc/lsdc_irq.c       |  77 +++
 drivers/gpu/drm/lsdc/lsdc_irq.h       |  37 ++
 drivers/gpu/drm/lsdc/lsdc_plane.c     | 681 +++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.c       | 657 ++++++++++++++++++++
 drivers/gpu/drm/lsdc/lsdc_pll.h       | 109 ++++
 drivers/gpu/drm/lsdc/lsdc_regs.h      | 246 ++++++++
 18 files changed, 4228 insertions(+)
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

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index dfdd3ec5f793..18de1485e2ed 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -405,6 +405,8 @@ source "drivers/gpu/drm/gud/Kconfig"
 
 source "drivers/gpu/drm/sprd/Kconfig"
 
+source "drivers/gpu/drm/lsdc/Kconfig"
+
 config DRM_HYPERV
 	tristate "DRM Support for Hyper-V synthetic video device"
 	depends on DRM &amp;&amp; PCI &amp;&amp; MMU &amp;&amp; HYPERV
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8675c2af7ae1..2c5a76ced323 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -133,3 +133,4 @@ obj-y			+= xlnx/
 obj-y			+= gud/
 obj-$(CONFIG_DRM_HYPERV) += hyperv/
 obj-$(CONFIG_DRM_SPRD) += sprd/
+obj-$(CONFIG_DRM_LSDC) += lsdc/
diff --git a/drivers/gpu/drm/lsdc/Kconfig b/drivers/gpu/drm/lsdc/Kconfig
new file mode 100644
index 000000000000..7ed1b0fdbe1b
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/Kconfig
@@ -0,0 +1,38 @@
+config DRM_LSDC
+	tristate "DRM Support for loongson's display controller"
+	depends on DRM &amp;&amp; PCI
+	depends on MACH_LOONGSON64 || LOONGARCH || MIPS || COMPILE_TEST
+	select OF
+	select CMA if HAVE_DMA_CONTIGUOUS
+	select DMA_CMA if HAVE_DMA_CONTIGUOUS
+	select DRM_KMS_HELPER
+	select DRM_KMS_FB_HELPER
+	select DRM_GEM_CMA_HELPER
+	select VIDEOMODE_HELPERS
+	select BACKLIGHT_PWM if CPU_LOONGSON2K
+	select I2C_GPIO if CPU_LOONGSON2K
+	select I2C_LS2X if CPU_LOONGSON2K
+	default m
+	help
+	  This is a KMS driver for the display controller in the LS7A1000
+	  bridge chip and LS2K1000 SoC. The display controller has two
+	  display pipes and it is a PCI device.
+	  When using this driver on LS2K1000/LS2K0500 SoC, its framebuffer
+	  is located at system memory.
+	  If "M" is selected, the module will be called lsdc.
+
+	  If in doubt, say "Y".
+
+config DRM_LSDC_VRAM_DRIVER
+	bool "vram helper based device driver support"
+	depends on DRM_LSDC
+	select DRM_VRAM_HELPER
+	default y
+	help
+	  When using this driver on LS7A1000 + LS3A3000/LS3A4000/LS3A5000
+	  platform, the LS7A1000 bridge chip has dedicated video RAM. Using
+	  "lsdc.use_vram_helper=1" in the kernel command line will enable
+	  this driver mode and then the framebuffer will be located at the
+	  VRAM at the price of losing PRIME support.
+
+	  If in doubt, say "Y".
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This doesn't sound right. The driver should make the proper decision
depending on the platform, not the user or the distribution.
</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">The LS7A1000 north bridge chip has dedicated video RAM, but the DC in LS7A1000
can also scan directly from the system memory out to encoders, like a display
controller in a SoC does. In fact, this display controller is ported from SoC
of early product of Loongson, say Loongson 2H SoC. In fact, this driver still
works if the downstream PC board manufacturer doesn't solder a video RAM.

The lsdc_should_vram_helper_based() function in lsdc_drv.c will examine
if the DC device node have a use_vram_helper property at driver load time.
If there is no use_vram_helper property, CMA helper base DRM driver will be used.
But it allow the user using "lsdc.use_vram_helper=0" override the default
behavior even through there is a use_vram_helper property in the DTS.
In short, It is intend to let the command line passed from kernel has the higher
property. Otherwise the end user can not switch different driver mode once
we put a "use_vram_helper;" in the DTS.

This driver's author already make the decision by the time when the patch is send
out, even through this *may* not proper.      
</pre>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
new file mode 100644
index 000000000000..342990654478
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/Makefile
@@ -0,0 +1,15 @@
+#
+# Makefile for the lsdc drm device driver.
+#
+
+lsdc-y := \
+	lsdc_drv.o \
+	lsdc_crtc.o \
+	lsdc_irq.o \
+	lsdc_plane.o \
+	lsdc_pll.o \
+	lsdc_i2c.o \
+	lsdc_encoder.o \
+	lsdc_connector.o
+
+obj-$(CONFIG_DRM_LSDC) += lsdc.o
diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
new file mode 100644
index 000000000000..ae5fc0c90961
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That's the MIT license, yet you claim the driver to be licensed under
the GPLv2 or later?</pre>
    </blockquote>
    <p> I just copy then paste it blindly, sorry about that. I do not
      know the difference, <br>
    </p>
    <p>we want open the source anyway, I will correct it in next
      version, thanks. <br>
    </p>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_edid.h&gt;
+#include &lt;drm/drm_probe_helper.h&gt;
+#include &lt;drm/drm_atomic_helper.h&gt;
+#include &lt;drm/drm_crtc_helper.h&gt;
+#include &lt;drm/drm_connector.h&gt;
+
+#include &lt;video/videomode.h&gt;
+#include &lt;video/of_display_timing.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_i2c.h"
+#include "lsdc_connector.h"
+
+
+static int lsdc_get_modes_from_edid(struct drm_connector *connector)
+{
+	struct drm_device *ddev = connector-&gt;dev;
+	struct lsdc_connector *lconn = to_lsdc_connector(connector);
+	struct edid *edid_p = (struct edid *)lconn-&gt;edid_data;
+	int num = drm_add_edid_modes(connector, edid_p);
+
+	if (num)
+		drm_connector_update_edid_property(connector, edid_p);
+
+	drm_dbg_kms(ddev, "%d modes added\n", num);
+
+	return num;
+}
+
+
+static int lsdc_get_modes_from_timings(struct drm_connector *connector)
+{
+	struct drm_device *ddev = connector-&gt;dev;
+	struct lsdc_connector *lconn = to_lsdc_connector(connector);
+	struct display_timings *disp_tim = lconn-&gt;disp_tim;
+	unsigned int num = 0;
+	unsigned int i;
+
+	for (i = 0; i &lt; disp_tim-&gt;num_timings; i++) {
+		const struct display_timing *dt = disp_tim-&gt;timings[i];
+		struct drm_display_mode *mode;
+		struct videomode vm;
+
+		videomode_from_timing(dt, &amp;vm);
+		mode = drm_mode_create(ddev);
+		if (!mode) {
+			drm_err(ddev, "failed to add mode %ux%u\n",
+					dt-&gt;hactive.typ, dt-&gt;vactive.typ);
+			continue;
+		}
+
+		drm_display_mode_from_videomode(&amp;vm, mode);
+
+		mode-&gt;type |= DRM_MODE_TYPE_DRIVER;
+
+		if (i == disp_tim-&gt;native_mode)
+			mode-&gt;type |= DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_probed_add(connector, mode);
+		num++;
+	}
+
+	drm_dbg_kms(ddev, "%d modes added\n", num);
+
+	return num;
+}
+
+
+static int lsdc_get_modes_from_ddc(struct drm_connector *connector,
+				   struct i2c_adapter *ddc)
+{
+	unsigned int num = 0;
+	struct edid *edid;
+
+	edid = drm_get_edid(connector, ddc);
+	if (edid) {
+		drm_connector_update_edid_property(connector, edid);
+		num = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	}
+
+	return num;
+}
+
+
+static int lsdc_get_modes(struct drm_connector *connector)
+{
+	struct lsdc_connector *lconn = to_lsdc_connector(connector);
+	unsigned int num = 0;
+
+	if (lconn-&gt;has_edid)
+		return lsdc_get_modes_from_edid(connector);
+
+	if (lconn-&gt;has_disp_tim)
+		return lsdc_get_modes_from_timings(connector);
+
+	if (IS_ERR_OR_NULL(lconn-&gt;ddc) == false)
+		return lsdc_get_modes_from_ddc(connector, lconn-&gt;ddc);
+
+	if (connector-&gt;connector_type == DRM_MODE_CONNECTOR_VIRTUAL) {
+		num = drm_add_modes_noedid(connector,
+				     connector-&gt;dev-&gt;mode_config.max_width,
+				     connector-&gt;dev-&gt;mode_config.max_height);
+
+		drm_set_preferred_mode(connector, 1024, 768);
+
+		return num;
+	}
+
+
+	/*
+	 * In case we cannot retrieve the EDIDs (broken or missing i2c
+	 * bus), fallback on the XGA standards, because we are for board
+	 * bringup.
+	 */
+	num = drm_add_modes_noedid(connector, 1920, 1200);
+
+	/* And prefer a mode pretty much anyone can handle */
+	drm_set_preferred_mode(connector, 1024, 768);
+
+	return num;
+
+}
+
+
+static enum drm_connector_status
+lsdc_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct lsdc_connector *lconn = to_lsdc_connector(connector);
+
+	if (lconn-&gt;has_edid == true)
+		return connector_status_connected;
+
+	if (lconn-&gt;has_disp_tim == true)
+		return connector_status_connected;
+
+	if (IS_ERR_OR_NULL(lconn-&gt;ddc) == false)
+		return drm_probe_ddc(lconn-&gt;ddc);
+
+	if (lconn-&gt;ddc &amp;&amp; drm_probe_ddc(lconn-&gt;ddc))
+		return connector_status_connected;
+
+	if (connector-&gt;connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+		return connector_status_connected;
+
+	if ((connector-&gt;connector_type == DRM_MODE_CONNECTOR_DVIA) ||
+	    (connector-&gt;connector_type == DRM_MODE_CONNECTOR_DVID) ||
+	    (connector-&gt;connector_type == DRM_MODE_CONNECTOR_DVII))
+		return connector_status_disconnected;
+
+	if ((connector-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
+	    (connector-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIB))
+		return connector_status_disconnected;
+
+	return connector_status_unknown;
+}
+
+
+/*
+ * @connector: point to the drm_connector structure
+ *
+ * Clean up connector resources
+ */
+static void lsdc_connector_destroy(struct drm_connector *connector)
+{
+	struct drm_device *ddev = connector-&gt;dev;
+	struct lsdc_connector *lconn = to_lsdc_connector(connector);
+
+	if (lconn) {
+		if (lconn-&gt;ddc)
+			lsdc_destroy_i2c(connector-&gt;dev, lconn-&gt;ddc);
+
+		drm_info(ddev, "destroying connector%u\n", lconn-&gt;index);
+
+		devm_kfree(ddev-&gt;dev, lconn);
+	}
+
+	drm_connector_cleanup(connector);
+}
+
+
+static const struct drm_connector_helper_funcs lsdc_connector_helpers = {
+	.get_modes = lsdc_get_modes,
+};
+
+/*
+ * These provide the minimum set of functions required to handle a connector
+ *
+ * Control connectors on a given device.
+ *
+ * Each CRTC may have one or more connectors attached to it.
+ * The functions below allow the core DRM code to control
+ * connectors, enumerate available modes, etc.
+ */
+static const struct drm_connector_funcs lsdc_connector_funcs = {
+	.dpms = drm_helper_connector_dpms,
+	.detect = lsdc_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = lsdc_connector_destroy,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+
+/* Get the simple EDID data from the device tree
+ * the length must be EDID_LENGTH, since it is simple.
+ *
+ * @np: device node contain edid data
+ * @edid_data: where the edid data to store to
+ */
+static bool lsdc_get_edid_from_dtb(struct device_node *np,
+				   unsigned char *edid_data)
+{
+	int length;
+	const void *prop;
+
+	if (np == NULL)
+		return false;
+
+	prop = of_get_property(np, "edid", &amp;length);
+	if (prop &amp;&amp; (length == EDID_LENGTH)) {
+		memcpy(edid_data, prop, EDID_LENGTH);
+		return true;
+	}
+
+	return false;
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You don't have a device tree binding for that driver, this is something
that is required. And it's not clear to me why you'd want EDID in the
DTB?</pre>
    </blockquote>
    <p>1) That is for the display controller in ls2k1000 SoC.</p>
    <p>Currently, the upstream kernel still don't have GPIO, PWM and I2C
      driver support for LS2K1000 SoC. <br>
    </p>
    <p>How dose you read EDID from the monitor without a I2C driver?
      without a EDID the screen just black,</p>
    <p>the lsdc driver just stall.  With reading EDID from device tree
      support we do not need  a i2c driver to</p>
    <p>make  lsdc drm driver work on various ls2k1000 development board.
      <br>
    </p>
    <p>I have many local private dts with the bindings,  can not
      upstream at this time, below is an example.<br>
    </p>
    <p><br>
      &amp;lsdc {<br>
          output-ports = &lt;&amp;dvo0 &amp;dvo1&gt;;<br>
      <br>
          #address-cells = &lt;1&gt;;<br>
          #size-cells = &lt;0&gt;;<br>
      <br>
          dvo0: dvo@0 {<br>
              reg = &lt;0&gt;;<br>
      <br>
              connector = "dpi-connector";<br>
              encoder = "none";<br>
              status = "ok";<br>
      <br>
              display-timings {<br>
                  native-mode = &lt;&amp;mode_0_1024x600_60&gt;;<br>
      <br>
                  mode_0_1024x600_60: panel-timing@0 {<br>
                      clock-frequency = &lt;51200000&gt;;<br>
                      hactive = &lt;1024&gt;;<br>
                      vactive = &lt;600&gt;;<br>
                      hsync-len = &lt;4&gt;;<br>
                      hfront-porch = &lt;160&gt;;<br>
                      hback-porch = &lt;156&gt;;<br>
                      vfront-porch = &lt;11&gt;;<br>
                      vback-porch = &lt;23&gt;;<br>
                      vsync-len = &lt;1&gt;;<br>
                  };<br>
      <br>
                  mode_1_800x480_60: panel-timing@1 {<br>
                      clock-frequency = &lt;30066000&gt;;<br>
                      hactive = &lt;800&gt;;<br>
                      vactive = &lt;480&gt;;<br>
                      hfront-porch = &lt;50&gt;;<br>
                      hback-porch = &lt;70&gt;;<br>
                      hsync-len = &lt;50&gt;;<br>
                      vback-porch = &lt;0&gt;;<br>
                      vfront-porch = &lt;0&gt;;<br>
                      vsync-len = &lt;50&gt;;<br>
                  };<br>
              };<br>
          };<br>
      <br>
          dvo1: dvo@1 {<br>
              reg = &lt;1&gt;;<br>
      <br>
              connector = "hdmi-connector";<br>
              type = "a";<br>
              encoder = "sil9022";<br>
      <br>
              edid = [ 00 ff ff ff ff ff ff 00 1e 6d 54 5b 0b cc 04 00<br>
                   02 1c 01 03 6c 30 1b 78 ea 31 35 a5 55 4e a1 26<br>
                   0c 50 54 a5 4b 00 71 4f 81 80 95 00 b3 00 a9 c0<br>
                   81 00 81 c0 90 40 02 3a 80 18 71 38 2d 40 58 2c<br>
                   45 00 e0 0e 11 00 00 1e 00 00 00 fd 00 38 4b 1e<br>
                   53 0f 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c<br>
                   47 20 46 55 4c 4c 20 48 44 0a 20 20 00 00 00 ff<br>
                   00 38 30 32 4e 54 43 5a 39 38 33 37 39 0a 00 35 ];<br>
      <br>
              status = "ok";<br>
          };<br>
      };</p>
    <p>2) It is left to the user the this driver.<br>
    </p>
    <p>The downstream motherboard maker may use a dpi(XRGB888) or lvds
      screen which don't have</p>
    <p>DDC support either, doing this way allow them put a EDID in the
      device tree. Then the entire system works.
    </p>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+/* Get display timings from the device tree
+ *
+ * @np: device node contain the display timings
+ * @pptim: point to where the pointer of struct display_timings store to
+ */
+static void lsdc_get_display_timings_from_dtb(struct device_node *np,
+					      struct display_timings **pptim)
+{
+	struct display_timings *timings;
+
+	if (np == NULL)
+		return;
+
+	timings = of_get_display_timings(np);
+	if (timings)
+		*pptim = timings;
+}
+
+
+static int lsdc_get_connector_type(struct drm_device *ddev,
+				   struct device_node *output,
+				   unsigned int index)
+{
+	const char *name;
+	int ret;
+
+	ret = of_property_read_string(output, "connector", &amp;name);
+	if (ret &lt; 0)
+		return DRM_MODE_CONNECTOR_Unknown;
+
+	if (strncmp(name, "vga-connector", 13) == 0) {
+		ret = DRM_MODE_CONNECTOR_VGA;
+		drm_info(ddev, "connector%d is VGA\n", index);
+	} else if (strncmp(name, "dvi-connector", 13) == 0) {
+		bool analog, digital;
+
+		analog = of_property_read_bool(output, "analog");
+		digital = of_property_read_bool(output, "digital");
+
+		if (analog &amp;&amp; !digital)
+			ret = DRM_MODE_CONNECTOR_DVIA;
+		else if (analog &amp;&amp; digital)
+			ret = DRM_MODE_CONNECTOR_DVII;
+		else
+			ret = DRM_MODE_CONNECTOR_DVID;
+
+		drm_info(ddev, "connector%d is DVI\n", index);
+	} else if (strncmp(name, "virtual-connector", 17) == 0) {
+		ret = DRM_MODE_CONNECTOR_VIRTUAL;
+		drm_info(ddev, "connector%d is virtual\n", index);
+	} else if (strncmp(name, "dpi-connector", 13) == 0) {
+		ret = DRM_MODE_CONNECTOR_DPI;
+		drm_info(ddev, "connector%d is DPI\n", index);
+	} else if (strncmp(name, "hdmi-connector", 14) == 0) {
+		int res;
+		const char *hdmi_type;
+
+		res = of_property_read_string(output, "type", &amp;hdmi_type);
+		if (res == 0) {
+			if (!strcmp(hdmi_type, "b"))
+				ret = DRM_MODE_CONNECTOR_HDMIB;
+			else
+				ret = DRM_MODE_CONNECTOR_HDMIA;
+		} else
+			ret = DRM_MODE_CONNECTOR_HDMIA;
+
+		drm_info(ddev, "connector%d is HDMI, type is %s\n",
+			index, hdmi_type);
+	} else {
+		ret = DRM_MODE_CONNECTOR_Unknown;
+		drm_info(ddev, "The type of connector%d is unknown\n", index);
+	}
+
+	return ret;
+}
+
+
+struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
+					   unsigned int index)
+{
+	struct drm_device *ddev = &amp;ldev-&gt;drm;
+	struct device_node *np = ddev-&gt;dev-&gt;of_node;
+	struct device_node *output = NULL;
+	struct lsdc_connector *lconn;
+	struct drm_connector *connector;
+	bool available = false;
+	unsigned int connector_type;
+	int ret;
+
+	lconn = devm_kzalloc(ddev-&gt;dev, sizeof(*lconn), GFP_KERNEL);
+	if (lconn == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	lconn-&gt;index = index;
+
+	output = of_parse_phandle(np, "output-ports", index);
+	if (output) {
+		struct device_node *disp_tims_np;
+
+		available = of_device_is_available(output);
+
+		if (available == false) {
+			drm_info(ddev, "connector%d is not available\n", index);
+			of_node_put(output);
+			return NULL;
+		}
+
+		lconn-&gt;has_edid = of_property_read_bool(output, "edid");
+		disp_tims_np = of_get_child_by_name(output, "display-timings");
+		if (disp_tims_np) {
+			of_node_put(disp_tims_np);
+			lconn-&gt;has_disp_tim = true;
+		} else
+			lconn-&gt;has_disp_tim = false;
+	} else
+		drm_warn(ddev, "no output-ports property, please update dtb\n");
+
+	/*
+	 * Providing a blindly support even through there is
+	 * no output-ports property in the dtb.
+	 */
+	if (lconn-&gt;has_edid) {
+		lsdc_get_edid_from_dtb(output, lconn-&gt;edid_data);
+		drm_info(ddev, "connector%d provide edid\n", index);
+	}
+
+	if (lconn-&gt;has_disp_tim) {
+		lsdc_get_display_timings_from_dtb(output, &amp;lconn-&gt;disp_tim);
+		drm_info(ddev, "connector%d provide display timings\n", index);
+	}
+
+	connector_type = lsdc_get_connector_type(ddev, output, index);
+
+	if (output)
+		of_node_put(output);
+
+	connector = &amp;lconn-&gt;base;
+
+	if (connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+		goto SKIPED_CREATE_DDC;
+
+	/* bypass the ddc creation if the edid or display timing is provided */
+	if ((lconn-&gt;has_edid == false) &amp;&amp;
+	    (lconn-&gt;has_disp_tim == false)) {
+		const struct lsdc_chip_desc * const dc = ldev-&gt;desc;
+
+		if (dc-&gt;have_builtin_i2c)
+			lconn-&gt;ddc = lsdc_create_i2c_chan(ddev, index);
+		else
+			lconn-&gt;ddc = lsdc_get_i2c_adapter(ddev, index);
+
+		if (lconn-&gt;ddc &amp;&amp; (IS_ERR(lconn-&gt;ddc) == false)) {
+			drm_info(ddev, "i2c%d for connector%d created\n",
+					i2c_adapter_id(lconn-&gt;ddc), index);
+
+		} else
+			drm_warn(ddev, "Get i2c adapter failed: %ld\n",
+					PTR_ERR(lconn-&gt;ddc));
+	}
+
+	/* only pull if the connector have a ddc */
+	connector-&gt;polled = DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
+
+SKIPED_CREATE_DDC:
+	ret = drm_connector_init_with_ddc(ddev,
+					  connector,
+					  &amp;lsdc_connector_funcs,
+					  connector_type,
+					  lconn-&gt;ddc);
+	if (ret) {
+		drm_err(ddev, "init connector%d failed\n", index);
+		goto err_i2c_destroy;
+	}
+
+	drm_connector_helper_add(connector, &amp;lsdc_connector_helpers);
+
+	return lconn;
+
+err_i2c_destroy:
+	lsdc_destroy_i2c(ddev, lconn-&gt;ddc);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.h b/drivers/gpu/drm/lsdc/lsdc_connector.h
new file mode 100644
index 000000000000..e9f94a969f74
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_connector.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+
+#ifndef __LSDC_CONNECTOR_H__
+#define __LSDC_CONNECTOR_H__
+
+#include &lt;drm/drm_device.h&gt;
+#include &lt;drm/drm_connector.h&gt;
+
+struct lsdc_connector {
+	struct drm_connector base;
+
+	struct i2c_adapter *ddc;
+
+	/* pass EDID from dtb support */
+	unsigned char edid_data[EDID_LENGTH];
+	bool has_edid;
+
+	/* pass display timmings from dtb support */
+	struct display_timings *disp_tim;
+	bool has_disp_tim;
+
+	int index;
+};
+
+#define to_lsdc_connector(x)        \
+		container_of(x, struct lsdc_connector, base)
+
+struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
+					   unsigned int index);
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c b/drivers/gpu/drm/lsdc/lsdc_crtc.c
new file mode 100644
index 000000000000..7531389f4896
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
@@ -0,0 +1,440 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_device.h&gt;
+#include &lt;drm/drm_crtc.h&gt;
+#include &lt;drm/drm_plane.h&gt;
+#include &lt;drm/drm_atomic.h&gt;
+#include &lt;drm/drm_vblank.h&gt;
+#include &lt;drm/drm_drv.h&gt;
+
+
+#include &lt;drm/drm_fb_cma_helper.h&gt;
+#include &lt;drm/drm_gem_cma_helper.h&gt;
+#include &lt;drm/drm_atomic_helper.h&gt;
+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;
+#include &lt;drm/drm_gem_atomic_helper.h&gt;
+#include &lt;drm/drm_damage_helper.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+
+static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc-&gt;dev);
+	unsigned int index = drm_crtc_index(crtc);
+	struct drm_crtc_state *state = crtc-&gt;state;
+	u32 val;
+
+	if (state-&gt;enable) {
+		val = lsdc_reg_read32(ldev, LSDC_INT_REG);
+
+		if (index == 0)
+			val |= INT_CRTC0_VS_EN;
+		else if (index == 1)
+			val |= INT_CRTC1_VS_EN;
+
+		lsdc_reg_write32(ldev, LSDC_INT_REG, val);
+	}
+
+	return 0;
+}
+
+
+static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc-&gt;dev);
+	unsigned int index = drm_crtc_index(crtc);
+	u32 val;
+
+	val = lsdc_reg_read32(ldev, LSDC_INT_REG);
+
+	if (index == 0)
+		val &amp;= ~INT_CRTC0_VS_EN;
+	else if (index == 1)
+		val &amp;= ~INT_CRTC1_VS_EN;
+
+	lsdc_reg_write32(ldev, LSDC_INT_REG, val);
+}
+
+
+static void lsdc_crtc_reset(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	unsigned int index = drm_crtc_index(crtc);
+	struct lsdc_crtc_state *priv_crtc_state;
+	u32 val;
+
+	/* The crtc get soft reset if bit 20 of CRTC*_CFG_REG
+	 * is write with falling edge.
+	 *
+	 * Doing this to switch from soft reset state to working state
+	 */
+	if (index == 0) {
+		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
+		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
+	} else if (index == 1) {
+		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
+		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
+	}
+
+
+	if (crtc-&gt;state) {
+		priv_crtc_state = to_lsdc_crtc_state(crtc-&gt;state);
+		__drm_atomic_helper_crtc_destroy_state(&amp;priv_crtc_state-&gt;base);
+		kfree(priv_crtc_state);
+	}
+
+	priv_crtc_state = kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
+	if (!priv_crtc_state)
+		return;
+
+	priv_crtc_state-&gt;pix_fmt = val &amp; CFG_PIX_FMT_MASK;
+
+	__drm_atomic_helper_crtc_reset(crtc, &amp;priv_crtc_state-&gt;base);
+
+	drm_info(ddev, "crtc%u reset\n", index);
+}
+
+
+static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+				    struct drm_crtc_state *state)
+{
+	struct lsdc_crtc_state *priv_crtc_state = to_lsdc_crtc_state(state);
+
+	__drm_atomic_helper_crtc_destroy_state(&amp;priv_crtc_state-&gt;base);
+
+	kfree(priv_crtc_state);
+}
+
+
+static struct drm_crtc_state *lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lsdc_crtc_state *new_priv_state;
+	struct lsdc_crtc_state *old_priv_state;
+	struct drm_device *ddev = crtc-&gt;dev;
+
+	if (drm_WARN_ON(ddev, !crtc-&gt;state))
+		return NULL;
+
+	new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
+	if (!new_priv_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &amp;new_priv_state-&gt;base);
+
+	old_priv_state = to_lsdc_crtc_state(crtc-&gt;state);
+
+	memcpy(&amp;new_priv_state-&gt;pparams, &amp;old_priv_state-&gt;pparams,
+		sizeof(new_priv_state-&gt;pparams));
+
+	new_priv_state-&gt;pix_fmt = old_priv_state-&gt;pix_fmt;
+
+	return &amp;new_priv_state-&gt;base;
+}
+
+
+static const struct drm_crtc_funcs lsdc_crtc_funcs = {
+	.reset = lsdc_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,
+	.enable_vblank = lsdc_crtc_enable_vblank,
+	.disable_vblank = lsdc_crtc_disable_vblank,
+};
+
+
+static enum drm_mode_status
+lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
+			    const struct drm_display_mode *mode)
+{
+	struct drm_device *ddev = crtc-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc *desc = ldev-&gt;desc;
+
+	if (mode-&gt;hdisplay &gt; desc-&gt;max_width)
+		return MODE_BAD_HVALUE;
+	if (mode-&gt;vdisplay &gt; desc-&gt;max_height)
+		return MODE_BAD_VVALUE;
+
+	if (mode-&gt;clock &gt; desc-&gt;max_pixel_clk) {
+		drm_dbg_kms(ddev, "mode %dx%d, pixel clock=%d is too high\n",
+				mode-&gt;hdisplay, mode-&gt;vdisplay, mode-&gt;clock);
+		return MODE_CLOCK_HIGH;
+	}
+
+	/* the crtc hardware dma take 256 bytes once a time
+	 * TODO: check RGB565 support
+	 */
+	if ((mode-&gt;hdisplay * 4) % desc-&gt;stride_alignment) {
+		drm_dbg_kms(ddev, "stride is not %u bytes aligned\n",
+				desc-&gt;stride_alignment);
+		return MODE_BAD;
+	}
+
+	return MODE_OK;
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
mode_valid will only prevent the mode from being advertised to the
userspace, but you need atomic_check if you want to prevent those modes
to be used by anybody.
</pre>
    </blockquote>
    <p>Yes,   I used to change mode with mate-display-properties tools,
      what I though is if<br>
    </p>
    <p>the end user can't see it,  they can't set it.  I will add
      atomic_check support at next version, thanks.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+static void lsdc_update_pixclk(struct drm_crtc *crtc, unsigned int pixclk, bool verbose)
+{
+	struct lsdc_display_pipe *dispipe;
+	struct lsdc_pll *pixpll;
+	const struct lsdc_pixpll_funcs *clkfun;
+	struct lsdc_crtc_state *priv_crtc_state;
+
+	priv_crtc_state = to_lsdc_crtc_state(crtc-&gt;state);
+
+	dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
+	pixpll = &amp;dispipe-&gt;pixpll;
+	clkfun = pixpll-&gt;funcs;
+
+	/* config the pixel pll */
+	clkfun-&gt;update(pixpll, &amp;priv_crtc_state-&gt;pparams);
+
+	if (verbose)
+		clkfun-&gt;print(pixpll, pixclk);
+}
+
+
+static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *ddev = crtc-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_display_mode *mode = &amp;crtc-&gt;state-&gt;adjusted_mode;
+	unsigned int hr = mode-&gt;hdisplay;
+	unsigned int hss = mode-&gt;hsync_start;
+	unsigned int hse = mode-&gt;hsync_end;
+	unsigned int hfl = mode-&gt;htotal;
+	unsigned int vr = mode-&gt;vdisplay;
+	unsigned int vss = mode-&gt;vsync_start;
+	unsigned int vse = mode-&gt;vsync_end;
+	unsigned int vfl = mode-&gt;vtotal;
+	unsigned int pixclock = mode-&gt;clock;
+	unsigned int index = drm_crtc_index(crtc);
+
+
+	if (index == 0) {
+		/* CRTC 0 */
+		u32 hsync, vsync;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC0_FB_ORIGIN_REG, 0);
+
+		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
+		lsdc_reg_write32(ldev, LSDC_CRTC0_HDISPLAY_REG,
+			(mode-&gt;crtc_htotal &lt;&lt; 16) | mode-&gt;crtc_hdisplay);
+
+		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
+		lsdc_reg_write32(ldev, LSDC_CRTC0_VDISPLAY_REG,
+			(mode-&gt;crtc_vtotal &lt;&lt; 16) | mode-&gt;crtc_vdisplay);
+
+		/* 26:16 hsync end, 10:0 hsync start */
+		hsync = (mode-&gt;crtc_hsync_end &lt;&lt; 16) | mode-&gt;crtc_hsync_start;
+
+		if (mode-&gt;flags &amp; DRM_MODE_FLAG_NHSYNC)
+			hsync |= INV_HSYNC_BIT;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC0_HSYNC_REG, EN_HSYNC_BIT | hsync);
+
+		/* 26:16 vsync end, 10:0 vsync start */
+		vsync = (mode-&gt;crtc_vsync_end &lt;&lt; 16) | mode-&gt;crtc_vsync_start;
+
+		if (mode-&gt;flags &amp; DRM_MODE_FLAG_NVSYNC)
+			vsync |= INV_VSYNC_BIT;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC0_VSYNC_REG, EN_VSYNC_BIT | vsync);
+
+	} else if (index == 1) {
+		/* CRTC 1 */
+		u32 hsync, vsync;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC1_FB_ORIGIN_REG, 0);
+
+		/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
+		lsdc_reg_write32(ldev, LSDC_CRTC1_HDISPLAY_REG,
+			(mode-&gt;crtc_htotal &lt;&lt; 16) | mode-&gt;crtc_hdisplay);
+
+		/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
+		lsdc_reg_write32(ldev, LSDC_CRTC1_VDISPLAY_REG,
+			(mode-&gt;crtc_vtotal &lt;&lt; 16) | mode-&gt;crtc_vdisplay);
+
+		/* 26:16 hsync end, 10:0 hsync start */
+		hsync = (mode-&gt;crtc_hsync_end &lt;&lt; 16) | mode-&gt;crtc_hsync_start;
+
+		if (mode-&gt;flags &amp; DRM_MODE_FLAG_NHSYNC)
+			hsync |= INV_HSYNC_BIT;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC1_HSYNC_REG, EN_HSYNC_BIT | hsync);
+
+		/* 26:16 vsync end, 10:0 vsync start */
+		vsync = (mode-&gt;crtc_vsync_end &lt;&lt; 16) | mode-&gt;crtc_vsync_start;
+
+		if (mode-&gt;flags &amp; DRM_MODE_FLAG_NVSYNC)
+			vsync |= INV_VSYNC_BIT;
+
+		lsdc_reg_write32(ldev, LSDC_CRTC1_VSYNC_REG, EN_VSYNC_BIT | vsync);
+	}
+
+	drm_dbg_kms(ddev, "hdisplay=%d, hsync_start=%d, hsync_end=%d, htotal=%d\n",
+			hr, hss, hse, hfl);
+
+	drm_dbg_kms(ddev, "vdisplay=%d, vsync_start=%d, vsync_end=%d, vtotal=%d\n",
+			vr, vss, vse, vfl);
+
+	drm_dbg_kms(ddev, "%s modeset: %ux%u\n", crtc-&gt;name, hr, vr);
+
+	lsdc_update_pixclk(crtc, pixclock, ldev-&gt;verbose);
+}
+
+
+static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int index)
+{
+	u32 val;
+
+	if (index == 0) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+		val |= CFG_OUTPUT_EN_BIT;
+		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
+	} else if (index == 1) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+		val |= CFG_OUTPUT_EN_BIT;
+		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
+	}
+}
+
+
+static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int index)
+{
+	u32 val;
+
+	if (index == 0) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+		val &amp;= ~CFG_OUTPUT_EN_BIT;
+		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
+	} else if (index == 1) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+		val &amp;= ~CFG_OUTPUT_EN_BIT;
+		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
+	}
+}
+
+
+static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	drm_crtc_vblank_on(crtc);
+
+	lsdc_enable_display(ldev, drm_crtc_index(crtc));
+
+	drm_dbg_kms(ddev, "%s: enabled\n", crtc-&gt;name);
+}
+
+
+static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = crtc-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	drm_crtc_vblank_off(crtc);
+
+	lsdc_disable_display(ldev, drm_crtc_index(crtc));
+
+	drm_dbg_kms(ddev, "%s: disabled\n", crtc-&gt;name);
+}
+
+
+static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
+				   struct drm_atomic_state *state)
+{
+	struct drm_pending_vblank_event *event = crtc-&gt;state-&gt;event;
+
+	if (event) {
+		crtc-&gt;state-&gt;event = NULL;
+
+		spin_lock_irq(&amp;crtc-&gt;dev-&gt;event_lock);
+		if (drm_crtc_vblank_get(crtc) == 0)
+			drm_crtc_arm_vblank_event(crtc, event);
+		else
+			drm_crtc_send_vblank_event(crtc, event);
+		spin_unlock_irq(&amp;crtc-&gt;dev-&gt;event_lock);
+	}
+}
+
+
+static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
+	.mode_valid = lsdc_crtc_helper_mode_valid,
+	.mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
+	.atomic_enable = lsdc_crtc_helper_atomic_enable,
+	.atomic_disable = lsdc_crtc_helper_atomic_disable,
+	.atomic_flush = lsdc_crtc_atomic_flush,
+};
+
+
+
+/**
+ * lsdc_crtc_init
+ *
+ * @ddev: point to the drm_device structure
+ * @index: hardware crtc index
+ *
+ * Init CRTC
+ */
+int lsdc_crtc_init(struct drm_device *ddev,
+		   struct drm_crtc *crtc,
+		   unsigned int index,
+		   struct drm_plane *primary,
+		   struct drm_plane *cursor)
+{
+	int ret;
+
+	drm_crtc_helper_add(crtc, &amp;lsdc_crtc_helper_funcs);
+
+	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret)
+		drm_warn(ddev, "set the gamma table size failed\n");
+
+	return drm_crtc_init_with_planes(ddev,
+					 crtc,
+					 primary,
+					 cursor,
+					 &amp;lsdc_crtc_funcs,
+					 "crtc%d",
+					 index);
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_drv.c
new file mode 100644
index 000000000000..aac8901c3431
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
@@ -0,0 +1,846 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;linux/errno.h&gt;
+#include &lt;linux/string.h&gt;
+#include &lt;linux/module.h&gt;
+#include &lt;linux/pci.h&gt;
+#include &lt;linux/of_reserved_mem.h&gt;
+
+#include &lt;drm/drm_drv.h&gt;
+#include &lt;drm/drm_aperture.h&gt;
+#include &lt;drm/drm_of.h&gt;
+#include &lt;drm/drm_plane.h&gt;
+#include &lt;drm/drm_vblank.h&gt;
+#include &lt;drm/drm_debugfs.h&gt;
+#include &lt;drm/drm_fb_helper.h&gt;
+#include &lt;drm/drm_crtc_helper.h&gt;
+#include &lt;drm/drm_gem_cma_helper.h&gt;
+#include &lt;drm/drm_fb_cma_helper.h&gt;
+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;
+#include &lt;drm/drm_atomic_helper.h&gt;
+#include &lt;drm/drm_damage_helper.h&gt;
+#include &lt;drm/drm_probe_helper.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_irq.h"
+#include "lsdc_regs.h"
+#include "lsdc_connector.h"
+#include "lsdc_pll.h"
+
+
+#define DRIVER_AUTHOR		"Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>"
+#define DRIVER_NAME		"lsdc"
+#define DRIVER_DESC		"drm driver for loongson's display controller"
+#define DRIVER_DATE		"20200701"
+#define DRIVER_MAJOR		1
+#define DRIVER_MINOR		0
+#define DRIVER_PATCHLEVEL	0
+
+static int lsdc_modeset = 1;
+MODULE_PARM_DESC(modeset, "Enable/disable CMA-based KMS(1 = enabled(default), 0 = disabled)");
+module_param_named(modeset, lsdc_modeset, int, 0644);
+
+static int lsdc_cached_coherent = 1;
+MODULE_PARM_DESC(cached_coherent, "uss cached coherent mapping(1 = enabled(default), 0 = disabled)");
+module_param_named(cached_coherent, lsdc_cached_coherent, int, 0644);
+
+static int lsdc_dirty_update = -1;
+MODULE_PARM_DESC(dirty_update, "enable dirty update(1 = enabled, 0 = disabled(default))");
+module_param_named(dirty_update, lsdc_dirty_update, int, 0644);
+
+static int lsdc_use_vram_helper = -1;
+MODULE_PARM_DESC(use_vram_helper, "use vram helper based solution(1 = enabled, 0 = disabled(default))");
+module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);
+
+static int lsdc_verbose = -1;
+MODULE_PARM_DESC(verbose, "Enable/disable print some key information");
+module_param_named(verbose, lsdc_verbose, int, 0644);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's not really clear to me why you need any of those parameters. Why
would a user want to use a non coherent mapping for example?</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Because we are Mips architecture. Paul Cercueil already explained it
in his mmap GEM buffers cached <a moz-do-not-send="true" href="https://lkml.kernel.org/lkml/20200822164233.71583-1-paul@crapouillou.net/T/">patch</a>. I drag part of it to here for
convenient to reading: 

<i>Traditionally, GEM buffers are mapped write-combine. Writes to the
buffer are accelerated, and reads are slow. Application doing lots</i><i>
</i><i>of alpha-blending paint inside shadow buffers, which is then memcpy'd</i><i>
</i><i>into the final GEM buffer.</i><i>
</i>
"non coherent mapping" is actually cached and it is for CMA helpers
base driver not for VRAM helper based driver. For Loongson CPU/SoCs. 
The cache coherency is maintained by hardware, therefore there no
need to worry about coherency problems. This is true at least for 
ls3a3000, ls3a4000 and ls3a5000. 

But "non coherent" or "coherent" is not important here, the key point
is that the backing memory of the framebuffer is cached with non coherent mapping,
you don't need a shadow buffer layer when using X server's modesetting driver,
read and write to the framebuffer in system memory is much faster than
read and write to the framebuffer in the VRAM. 

Why CMA helper based solution is faster than VRAM based solution on our
mips platform? 

Partly because of the CPU have L1, L2 and L3 cache, especially L3 cache
is as large as 8MB, read and write from the cache is fast. 
Another reason is as Paul Cercueil said, read from VRAM with write-combine
cache mode is slow. Please note that we don't have a GPU here, we are just
a display controller.

For the VRAM helper based driver case, the backing memory of the framebuffer
is located at VRAM, When using X server's modesetting driver, we have to enable
the ShadowFB option, otherwise the performance of graphic application is just slow.
Uncache acceleration should also be enabled. 

Beside write-combine cache mode have bugs on our platform, a kernel side developer
have disabled it. Writecombine cache mode just boil down to uncached now. 
See [1] and [2]

[1] <a class="moz-txt-link-freetext" href="https://lkml.org/lkml/2020/8/10/255">https://lkml.org/lkml/2020/8/10/255</a>
[2] <a class="moz-txt-link-freetext" href="https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn/T/">https://lkml.kernel.org/lkml/1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn/T/</a>


This is the reason why we prefer CMA helper base solution with non coherent mapping,
simply because it is fast. 

As far as I know, Loongson's CPU don't have the concept of write-combine,
it only have uncached, cached and uncache acceleration three main caching mode. 
write-combine is implemented with uncache acceleration on Mips.

</pre>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+static const struct lsdc_chip_desc dc_in_ls2k1000 = {
+	.chip = LSDC_CHIP_2K1000,
+	.num_of_crtc = LSDC_MAX_CRTC,
+	/* ls2k1000 user manual say the max pixel clock can be about 200MHz */
+	.max_pixel_clk = 200000,
+	.max_width = 2560,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.have_builtin_i2c = false,
+	.stride_alignment = 256,
+};
+
+static const struct lsdc_chip_desc dc_in_ls2k0500 = {
+	.chip = LSDC_CHIP_2K0500,
+	.num_of_crtc = LSDC_MAX_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.have_builtin_i2c = false,
+	.stride_alignment = 256,
+};
+
+static const struct lsdc_chip_desc dc_in_ls7a1000 = {
+	.chip = LSDC_CHIP_7A1000,
+	.num_of_crtc = LSDC_MAX_CRTC,
+	.max_pixel_clk = 200000,
+	.max_width = 2048,
+	.max_height = 2048,
+	.num_of_hw_cursor = 1,
+	.hw_cursor_w = 32,
+	.hw_cursor_h = 32,
+	.have_builtin_i2c = true,
+	.stride_alignment = 256,
+};
+
+/*
+ * We need the device tree provided additional information to tell the DC
+ * in different chip apart.
+ */
+static const struct of_device_id lsdc_drm_of_match[] = {
+	{ .compatible = "loongson,loongson64c-4core-ls7a", .data = &amp;dc_in_ls7a1000 },
+	{ .compatible = "loongson,loongson64g-4core-ls7a", .data = &amp;dc_in_ls7a1000 },
+	{ .compatible = "loongson,loongson64-2core-2k1000", .data = &amp;dc_in_ls2k1000 },
+	{ .compatible = "loongson,loongson2k1000", .data = &amp;dc_in_ls2k1000 },
+	{ .compatible = "loongson,ls2k1000", .data = &amp;dc_in_ls2k1000 },
+	{ .compatible = "loongson,display-subsystem", .data = &amp;dc_in_ls2k1000 },
+	{ .compatible = "loongson,ls-fb", .data = &amp;dc_in_ls2k1000 },
+	{ .compatible = "loongson,loongson2k0500", .data = &amp;dc_in_ls2k0500 },
+	{ /* sentinel */ },
+};
+
+
+static struct drm_framebuffer *
+lsdc_drm_gem_fb_create(struct drm_device *ddev, struct drm_file *file,
+			  const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	if (ldev-&gt;dirty_update)
+		return drm_gem_fb_create_with_dirty(ddev, file, mode_cmd);
+
+	return drm_gem_fb_create(ddev, file, mode_cmd);
+}
+
+
+static enum drm_mode_status lsdc_device_mode_valid(struct drm_device *ddev,
+					const struct drm_display_mode *mode)
+{
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	if (ldev-&gt;use_vram_helper == true)
+		return drm_vram_helper_mode_valid(ddev, mode);
+#endif
+
+	return MODE_OK;
+}
+
+
+static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
+	.fb_create = lsdc_drm_gem_fb_create,
+	.output_poll_changed = drm_fb_helper_output_poll_changed,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+	.mode_valid = lsdc_device_mode_valid,
+};
+
+
+#ifdef CONFIG_DEBUG_FS
+static int lsdc_show_pxlclock(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *)m-&gt;private;
+	struct drm_device *ddev = node-&gt;minor-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, ddev) {
+		struct drm_crtc_state *state = crtc-&gt;state;
+		int index = drm_crtc_index(crtc);
+		struct lsdc_display_pipe *pipe = &amp;ldev-&gt;disp_pipe[index];
+		struct lsdc_pll *pixpll = &amp;pipe-&gt;pixpll;
+		const struct lsdc_pixpll_funcs *clkfun = pixpll-&gt;funcs;
+		unsigned int clkrate = clkfun-&gt;get_clock_rate(pixpll);
+		unsigned int mode_clock = crtc-&gt;mode.crtc_clock;
+
+		seq_printf(m, "\n");
+		seq_printf(m, "CRTC%u, %s, %s\n", index,
+				state-&gt;active ? "active" : "non-active",
+				state-&gt;enable ? "enabled" : "disabled");
+		seq_printf(m, "hw clock: %u kHz\n", clkrate);
+		seq_printf(m, "mode: %u kHz\n", mode_clock);
+
+		seq_printf(m, "div_out=%u, loopc=%u, div_ref=%u\n",
+				pixpll-&gt;core_params.div_out,
+				pixpll-&gt;core_params.loopc,
+				pixpll-&gt;core_params.div_ref);
+	}
+
+	return 0;
+}
+
+
+static int lsdc_mm_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = (struct drm_info_node *) m-&gt;private;
+	struct drm_device *ddev = node-&gt;minor-&gt;dev;
+	struct drm_printer p = drm_seq_file_printer(m);
+
+	drm_mm_print(&amp;ddev-&gt;vma_offset_manager-&gt;vm_addr_space_mm, &amp;p);
+	return 0;
+}
+
+static struct drm_info_list lsdc_debugfs_list[] = {
+	{ "clocks", lsdc_show_pxlclock, 0 },
+	{ "mm",     lsdc_mm_show,   0, NULL },
+};
+
+static void lsdc_debugfs_init(struct drm_minor *minor)
+{
+	drm_debugfs_create_files(lsdc_debugfs_list,
+				 ARRAY_SIZE(lsdc_debugfs_list),
+				 minor-&gt;debugfs_root,
+				 minor);
+}
+#endif
+
+
+static struct drm_gem_object *
+lsdc_drm_gem_create_object(struct drm_device *ddev, size_t size)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_gem_cma_object *obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	if (ldev-&gt;cached_coherent)
+		obj-&gt;map_noncoherent = true;
+
+	return &amp;obj-&gt;base;
+}
+
+
+static int lsdc_gem_cma_dumb_create(struct drm_file *file,
+				    struct drm_device *ddev,
+				    struct drm_mode_create_dumb *args)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	const struct lsdc_chip_desc *desc = ldev-&gt;desc;
+	unsigned int bytes_per_pixel = (args-&gt;bpp + 7) / 8;
+	unsigned int pitch = bytes_per_pixel * args-&gt;width;
+
+	/*
+	 * The dc in ls7a1000/ls2k1000/ls2k0500 require the stride be a
+	 * multiple of 256 bytes, which is for sake of optimize dma data
+	 * transfer.
+	 */
+	args-&gt;pitch = roundup(pitch, desc-&gt;stride_alignment);
+
+	return drm_gem_cma_dumb_create_internal(file, ddev, args);
+}
+
+
+DEFINE_DRM_GEM_CMA_FOPS(lsdc_drv_fops);
+
+
+static const struct drm_driver lsdc_drm_driver_cma_stub = {
+	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+
+	.lastclose = drm_fb_helper_lastclose,
+	.fops = &amp;lsdc_drv_fops,
+	.gem_create_object = lsdc_drm_gem_create_object,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(lsdc_gem_cma_dumb_create),
+
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init = lsdc_debugfs_init,
+#endif
+};
+
+
+DEFINE_DRM_GEM_FOPS(lsdc_fops);
+
+
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+static const struct drm_driver lsdc_vram_driver_stub = {
+	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops = &amp;lsdc_fops,
+
+	.name = DRIVER_NAME,
+	.desc = DRIVER_DESC,
+	.date = DRIVER_DATE,
+	.major = DRIVER_MAJOR,
+	.minor = DRIVER_MINOR,
+	.patchlevel = DRIVER_PATCHLEVEL,
+
+	DRM_GEM_VRAM_DRIVER,
+};
+#endif
+
+
+static int lsdc_modeset_init(struct lsdc_device *ldev, const uint32_t num_crtc)
+{
+	struct drm_device *ddev = &amp;ldev-&gt;drm;
+	struct lsdc_display_pipe *dispipe;
+	struct lsdc_connector *lconn;
+	unsigned int i;
+	int ret;
+
+	/* first find all of connector available */
+	for (i = 0; i &lt; num_crtc; i++) {
+		lconn = lsdc_connector_init(ldev, i);
+		dispipe = &amp;ldev-&gt;disp_pipe[i];
+
+		if (IS_ERR(lconn))
+			return PTR_ERR(lconn);
+		else if (lconn == NULL) {
+			dispipe-&gt;lconn = NULL;
+			dispipe-&gt;available = false;
+			continue;
+		}
+
+		/* take a record */
+		dispipe-&gt;available = true;
+		dispipe-&gt;lconn = lconn;
+		ldev-&gt;num_output++;
+	}
+
+	drm_info(ddev, "number of outputs: %u\n", ldev-&gt;num_output);
+
+	for (i = 0; i &lt; num_crtc; i++) {
+		struct lsdc_display_pipe * const dispipe = &amp;ldev-&gt;disp_pipe[i];
+		struct drm_plane * const primary = &amp;dispipe-&gt;primary;
+		struct drm_plane * const cursor = &amp;dispipe-&gt;cursor;
+		struct drm_encoder * const encoder = &amp;dispipe-&gt;encoder;
+		struct drm_crtc * const crtc = &amp;dispipe-&gt;crtc;
+		struct lsdc_pll * const pixpll = &amp;dispipe-&gt;pixpll;
+
+		dispipe-&gt;index = i;
+
+		ret = lsdc_pixpll_init(pixpll, ddev, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_plane_init(ldev, primary, DRM_PLANE_TYPE_PRIMARY, i);
+		if (ret)
+			return ret;
+
+		ret = lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
+		if (ret)
+			return ret;
+
+		/*
+		 * Initial all of the CRTC available, in this way the crtc
+		 * index is equal to the hardware crtc index. That is:
+		 * display pipe 0 = crtc0 + dvo0 + encoder0
+		 * display pipe 1 = crtc1 + dvo1 + encoder1
+		 */
+		ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
+		if (ret)
+			return ret;
+
+		if (dispipe-&gt;available) {
+			ret = lsdc_encoder_init(encoder,
+						&amp;dispipe-&gt;lconn-&gt;base,
+						ddev,
+						i,
+						ldev-&gt;num_output);
+			if (ret)
+				return ret;
+		}
+
+		drm_info(ddev, "display pipe %u initialized\n", i);
+	}
+
+	return 0;
+}
+
+
+static int lsdc_mode_config_init(struct lsdc_device *ldev)
+{
+	const struct lsdc_chip_desc * const descp = ldev-&gt;desc;
+	struct drm_device *ddev = &amp;ldev-&gt;drm;
+	int ret;
+
+	spin_lock_init(&amp;ldev-&gt;reglock);
+
+	drm_mode_config_init(ddev);
+
+	ddev-&gt;mode_config.funcs = &amp;lsdc_mode_config_funcs;
+	ddev-&gt;mode_config.min_width = 1;
+	ddev-&gt;mode_config.min_height = 1;
+	ddev-&gt;mode_config.preferred_depth = 24;
+	ddev-&gt;mode_config.prefer_shadow = 0;
+
+	ddev-&gt;mode_config.max_width = 4096;
+	ddev-&gt;mode_config.max_height = 4096;
+
+	ddev-&gt;mode_config.cursor_width = descp-&gt;hw_cursor_h;
+	ddev-&gt;mode_config.cursor_height = descp-&gt;hw_cursor_h;
+
+	if (ldev-&gt;vram_base)
+		ddev-&gt;mode_config.fb_base = ldev-&gt;vram_base;
+
+	ret = lsdc_modeset_init(ldev, descp-&gt;num_of_crtc);
+	if (ret)
+		goto out_mode_config;
+
+	drm_mode_config_reset(ddev);
+
+	return 0;
+
+out_mode_config:
+	drm_mode_config_cleanup(ddev);
+
+	return ret;
+}
+
+
+static void lsdc_mode_config_fini(struct drm_device *ddev)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	/* disable output polling */
+	drm_kms_helper_poll_fini(ddev);
+
+	drm_dev_unregister(ddev);
+
+	devm_free_irq(ddev-&gt;dev, ldev-&gt;irq, ddev);
+
+	/* shutdown all CRTC, for driver unloading */
+	drm_atomic_helper_shutdown(ddev);
+
+	drm_mode_config_cleanup(ddev);
+}
+
+/*
+ * We need a function to tell different chips apart.
+ * Because there are difference between the dc in ls7a1000 and the dc in
+ * ls2k1000, ls7a1000 have two gpio emulated i2c built-in, but ls2k1000
+ * don't have such hardware feature. ls2k1000 grab i2c adapter from other
+ * module, eithor hardware i2c or external gpio-emulated i2c.
+ *
+ * Beside, the hardware pixel pll unit is also different.
+ */
+static int lsdc_determine_chip(struct lsdc_device *ldev)
+{
+	struct device_node *np;
+	const char *model;
+	const char *compat;
+	unsigned int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(lsdc_drm_of_match); ++i) {
+		compat = lsdc_drm_of_match[i].compatible;
+
+		np = of_find_compatible_node(NULL, NULL, compat);
+		if (np) {
+
+			/* get additional information */
+			of_property_read_string(np, "model", &amp;model);
+
+			of_node_put(np);
+
+			ldev-&gt;desc = lsdc_drm_of_match[i].data;
+
+			break;
+		}
+	}
+
+	if (ldev-&gt;desc == NULL) {
+		drm_err(&amp;ldev-&gt;drm, "unknown dc ip core, abort\n");
+		return -ENOENT;
+	}
+
+	drm_info(&amp;ldev-&gt;drm, "%s found, model: %s\n", compat, model);
+
+	return 0;
+}
+
+
+static int lsdc_drm_suspend(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(ddev);
+}
+
+
+static int lsdc_drm_resume(struct device *dev)
+{
+	struct drm_device *ddev = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(ddev);
+}
+
+
+static int lsdc_pm_freeze(struct device *dev)
+{
+	return lsdc_drm_suspend(dev);
+}
+
+
+static int lsdc_pm_thaw(struct device *dev)
+{
+	return lsdc_drm_resume(dev);
+}
+
+
+static int lsdc_pm_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int error;
+
+	error = lsdc_pm_freeze(dev);
+	if (error)
+		return error;
+
+	pci_save_state(pdev);
+	/* Shut down the device */
+	pci_disable_device(pdev);
+	pci_set_power_state(pdev, PCI_D3hot);
+
+	return 0;
+}
+
+
+static int lsdc_pm_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	if (pcim_enable_device(pdev))
+		return -EIO;
+
+	pci_set_power_state(pdev, PCI_D0);
+
+	pci_restore_state(pdev);
+
+	return lsdc_pm_thaw(dev);
+}
+
+
+static const struct dev_pm_ops lsdc_pm_ops = {
+	.suspend = lsdc_pm_suspend,
+	.resume = lsdc_pm_resume,
+	.freeze = lsdc_pm_freeze,
+	.thaw = lsdc_pm_thaw,
+	.poweroff = lsdc_pm_freeze,
+	.restore = lsdc_pm_resume,
+};
+
+
+static int lsdc_remove_conflicting_framebuffers(const struct drm_driver *drv)
+{
+	/* lsdc is a pci device, but it don't have a dedicate vram bar because
+	 * of historic reason(The display controller is ported from SoC product
+	 * of Loongson, Loongson 2H series which date back to 2012)
+	 * And simplefb node may have been located anywhere in memory.
+	 */
+	return drm_aperture_remove_conflicting_framebuffers(0, ~0, false, drv);
+}
+
+
+static int lsdc_vram_init(struct lsdc_device *ldev)
+{
+	struct drm_device *ddev = &amp;ldev-&gt;drm;
+	struct pci_dev *gpu;
+	resource_size_t base, size;
+	int ret;
+
+	/* BAR 2 of LS7A1000's GPU contain VRAM, It's GC1000 */
+	gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7a15, NULL);
+	base = pci_resource_start(gpu, 2);
+	size =  pci_resource_len(gpu, 2);
+
+	drm_info(ddev, "vram start: 0x%llx, size: %uMB\n",
+			base, (unsigned int)(size &gt;&gt; 20));
+
+	if (!request_mem_region(base, size, "lsdc_vram")) {
+		drm_err(ddev, "can't reserve VRAM memory region\n");
+		return -ENXIO;
+	}
+
+	if (ldev-&gt;use_vram_helper) {
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+		ret = drmm_vram_helper_init(ddev, base, size);
+		if (ret) {
+			drm_err(ddev, "can't init vram helper\n");
+			return ret;
+		}
+#endif
+	} else if (ldev-&gt;dirty_update) {
+		ldev-&gt;vram = devm_ioremap_wc(ddev-&gt;dev, base, size);
+		if (ldev-&gt;vram == NULL)
+			return -ENOMEM;
+
+		drm_info(ddev, "vram virtual addr: 0x%llx\n", (u64)ldev-&gt;vram);
+	}
+
+	ldev-&gt;vram_base = base;
+	ldev-&gt;vram_size = size;
+
+	return 0;
+}
+
+/*
+ * For the dc in ls7a1000, it is more reliable scanout from the VRAM.
+ * scanout from the system memory suffer from some hardware deficiency
+ * which cause the screen flickering under RAM pressure.
+ */
+static bool lsdc_should_vram_helper_based(void)
+{
+	static const char * const dc_compat[] = { "pci0014,7a06.0",
+						  "pci0014,7a06" };
+	bool ret = false;
+	struct device_node *np;
+	unsigned int i;
+
+	for (i = 0; i &lt; ARRAY_SIZE(dc_compat); ++i) {
+		np = of_find_compatible_node(NULL, NULL, dc_compat[i]);
+		if (!np)
+			continue;
+
+		ret = of_property_read_bool(np, "use_vram_helper");
+		of_node_put(np);
+		break;
+	}
+
+	if (ret)
+		DRM_INFO("using vram base solution dictated by device tree\n");
+
+	return ret;
+}
+
+
+static int lsdc_pci_probe(struct pci_dev *pdev,
+			  const struct pci_device_id * const ent)
+{
+	const struct drm_driver *driver = &amp;lsdc_drm_driver_cma_stub;
+	struct lsdc_device *ldev;
+	struct drm_device *ddev;
+	int ret;
+
+	lsdc_remove_conflicting_framebuffers(driver);
+
+	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (ret) {
+		dev_err(&amp;pdev-&gt;dev, "Set DMA Mask failed\n");
+		return ret;
+	}
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&amp;pdev-&gt;dev, "Enable pci devive failed\n");
+		return ret;
+	}
+
+	pci_set_master(pdev);
+
+	/* Get the optional framebuffer memory resource */
+	ret = of_reserved_mem_device_init(&amp;pdev-&gt;dev);
+	if (ret &amp;&amp; ret != -ENODEV)
+		return ret;
+
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+	if (lsdc_use_vram_helper &amp;&amp; lsdc_should_vram_helper_based()) {
+		driver = &amp;lsdc_vram_driver_stub;
+		lsdc_use_vram_helper = 1;
+		DRM_INFO("using vram helper based solution\n");
+	}
+#endif
+
+	ldev = devm_drm_dev_alloc(&amp;pdev-&gt;dev,
+				  driver,
+				  struct lsdc_device,
+				  drm);
+	if (IS_ERR(ldev))
+		return PTR_ERR(ldev);
+
+	ddev = &amp;ldev-&gt;drm;
+
+	pci_set_drvdata(pdev, ddev);
+
+	if (lsdc_use_vram_helper &gt; 0)
+		ldev-&gt;use_vram_helper = true;
+	else {
+		if (lsdc_cached_coherent &gt; 0) {
+			ldev-&gt;cached_coherent = true;
+			drm_info(ddev, "cache coherency is maintained by hardware\n");
+		}
+
+		if (lsdc_dirty_update &gt; 0) {
+			ldev-&gt;dirty_update = true;
+			drm_info(ddev, "dirty update enabled\n");
+		}
+	}
+
+	if (lsdc_verbose &gt; 0)
+		ldev-&gt;verbose = true;
+
+	ret = lsdc_determine_chip(ldev);
+	if (ret)
+		return ret;
+
+	/* BAR 0 contains registers */
+	ldev-&gt;reg_base = devm_ioremap_resource(&amp;pdev-&gt;dev, &amp;pdev-&gt;resource[0]);
+	if (IS_ERR(ldev-&gt;reg_base))
+		return PTR_ERR(ldev-&gt;reg_base);
+
+	/* LS2K1000/LS2K0500 is SoC, don't have a VRAM */
+	if ((ldev-&gt;desc-&gt;chip == LSDC_CHIP_7A1000) &amp;&amp;
+	    (ldev-&gt;use_vram_helper || ldev-&gt;dirty_update))
+		lsdc_vram_init(ldev);
+
+	ret = lsdc_mode_config_init(ldev);
+	if (ret)
+		goto err_out;
+
+
+	ldev-&gt;irq = pdev-&gt;irq;
+
+	dev_info(&amp;pdev-&gt;dev, "irq = %d\n", ldev-&gt;irq);
+
+	ret = devm_request_threaded_irq(&amp;pdev-&gt;dev,
+					pdev-&gt;irq,
+					lsdc_irq_handler_cb,
+					lsdc_irq_thread_cb,
+					IRQF_ONESHOT,
+					dev_name(&amp;pdev-&gt;dev),
+					ddev);
+
+	if (ret) {
+		dev_err(&amp;pdev-&gt;dev, "Failed to register lsdc interrupt\n");
+		goto err_out;
+	}
+
+	ret = drm_vblank_init(ddev, LSDC_MAX_CRTC);
+	if (ret) {
+		dev_err(&amp;pdev-&gt;dev,
+				"Fatal error during vblank init: %d\n", ret);
+		goto err_out;
+	}
+
+	/* Initialize and enable output polling */
+	drm_kms_helper_poll_init(ddev);
+
+	ret = drm_dev_register(ddev, 0);
+	if (ret)
+		goto err_out;
+
+	drm_fbdev_generic_setup(ddev, 32);
+
+	return 0;
+
+err_out:
+	drm_dev_put(ddev);
+
+	return ret;
+}
+
+
+static void lsdc_pci_remove(struct pci_dev *pdev)
+{
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+
+	lsdc_mode_config_fini(ddev);
+
+	drm_dev_put(ddev);
+
+	pci_clear_master(pdev);
+
+	pci_release_regions(pdev);
+}
+
+
+static const struct pci_device_id lsdc_pciid_list[] = {
+	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
+	{0, 0, 0, 0, 0, 0, 0}
+};
+
+
+static struct pci_driver lsdc_pci_driver = {
+	.name = DRIVER_NAME,
+	.id_table = lsdc_pciid_list,
+	.probe = lsdc_pci_probe,
+	.remove = lsdc_pci_remove,
+	.driver.pm = &amp;lsdc_pm_ops,
+};
+
+
+static int __init lsdc_drm_init(void)
+{
+	struct pci_dev *pdev = NULL;
+
+	if (drm_firmware_drivers_only())
+		return -EINVAL;
+
+	if (lsdc_modeset == 0)
+		return -ENOENT;
+
+	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA &lt;&lt; 8, pdev))) {
+		/*
+		 * Multiple video card workaround
+		 *
+		 * This integrated video driver will always be selected as
+		 * default boot device by vgaarb system.
+		 */
+		if (pdev-&gt;vendor != PCI_VENDOR_ID_LOONGSON) {
+			DRM_INFO("Discrete graphic card detected, abort\n");
+			return 0;
+		}
+	}
+
+	return pci_register_driver(&amp;lsdc_pci_driver);
+}
+module_init(lsdc_drm_init);
+
+static void __exit lsdc_drm_exit(void)
+{
+	pci_unregister_driver(&amp;lsdc_pci_driver);
+}
+module_exit(lsdc_drm_exit);
+
+
+MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
+MODULE_AUTHOR(DRIVER_AUTHOR);
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h b/drivers/gpu/drm/lsdc/lsdc_drv.h
new file mode 100644
index 000000000000..89cf15248c3a
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
@@ -0,0 +1,216 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#ifndef __LSDC_DRV_H__
+#define __LSDC_DRV_H__
+
+#include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_device.h&gt;
+#include &lt;drm/drm_crtc.h&gt;
+#include &lt;drm/drm_plane.h&gt;
+#include &lt;drm/drm_encoder.h&gt;
+
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+#include &lt;drm/drm_gem_vram_helper.h&gt;
+#endif
+
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+#define LSDC_MAX_CRTC           2
+
+/* There is only a 1:1 mapping of encoders and connectors for lsdc */
+/*
+ *      +-------------------+                                      _________
+ *      |                   |                                     |         |
+ *      |  CRTC0 --&gt; DVO0 ---------&gt; Encoder0 --&gt; Connector0 ---&gt; | Monotor |
+ *      |                   |           ^            ^            |_________|
+ *      |                   |           |            |
+ *      |                &lt;----- i2c0 ----------------+
+ *      |   LSDC IP CORE    |
+ *      |                &lt;----- i2c1 ----------------+
+ *      |                   |           |            |             _________
+ *      |                   |           |            |            |         |
+ *      |  CRTC1 --&gt; DVO1 ---------&gt; Encoder1 --&gt; Connector1 ---&gt; |  Panel  |
+ *      |                   |                                     |_________|
+ *      +-------------------+
+ */
+
+enum loongson_dc_family {
+	LSDC_CHIP_UNKNOWN = 0,
+	LSDC_CHIP_2K1000 = 1, /* 2-Core SoC, 64-bit */
+	LSDC_CHIP_7A1000 = 2, /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
+	LSDC_CHIP_2K0500 = 3, /* Reduced version of LS2K1000, single core */
+	LSDC_CHIP_7A2000 = 4, /* Enhancement version of 7A1000 */
+	LSDC_CHIP_LAST,
+};
+
+enum lsdc_pixel_format {
+	LSDC_PF_NONE = 0,
+	LSDC_PF_ARGB4444 = 1,    /* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
+	LSDC_PF_ARGB1555 = 2,    /* ARGB A:1 bit RGB:15 bits [16 bits] */
+	LSDC_PF_RGB565 = 3,      /* RGB [16 bits] */
+	LSDC_PF_XRGB8888 = 4,    /* XRGB [32 bits] */
+};
+
+struct lsdc_chip_desc {
+	enum loongson_dc_family chip;
+	uint32_t num_of_crtc;
+
+	uint32_t max_pixel_clk;
+
+	uint32_t max_width;
+	uint32_t max_height;
+
+	uint32_t num_of_hw_cursor;
+	uint32_t hw_cursor_w;
+	uint32_t hw_cursor_h;
+	bool have_builtin_i2c;
+	uint32_t stride_alignment;
+};
+
+
+/**
+ * struct lsdc_display_pipe - simple display pipeline
+ * @crtc: CRTC control structure
+ * @plane: Plane control structure
+ * @encoder: Encoder control structure
+ * @pixpll: Pll control structure
+ * @connector: point to connector control structure
+ *
+ * display pipeline with plane, crtc, encoder, pll collapsed into one
+ * entity. It should be initialized by calling drm_simple_display_pipe_init().
+ */
+struct lsdc_display_pipe {
+	struct drm_crtc crtc;
+	struct drm_plane primary;
+	struct drm_plane cursor;
+	struct drm_encoder encoder;
+	struct lsdc_pll pixpll;
+	struct lsdc_connector *lconn;
+
+	int index;
+	bool available;
+};
+
+
+struct lsdc_crtc_state {
+	struct drm_crtc_state base;
+	struct lsdc_pll_core_values pparams;
+	unsigned int pix_fmt;
+};
+
+
+struct lsdc_device {
+	struct drm_device drm;
+
+	void __iomem *reg_base;
+	void __iomem *vram;
+	resource_size_t vram_base;
+	resource_size_t vram_size;
+
+	struct lsdc_display_pipe disp_pipe[LSDC_MAX_CRTC];
+
+	unsigned int num_output;
+
+	/* platform specific data */
+	const struct lsdc_chip_desc *desc;
+
+	/* @reglock: protects concurrent register access */
+	spinlock_t reglock;
+
+	/*
+	 * @dirty_update: true if manual dirty update is wantted
+	 */
+	bool dirty_update;
+	/*
+	 * @cached_coherent: true if the host platform is hardware maintained
+	 * cached coherent.
+	 */
+	bool cached_coherent;
+	/*
+	 * @use_vram_helper: using vram helper instead of cma helper base
+	 * solution. As ls7a1000 has a dediacted video ram, the dc scanout
+	 * from the vram is more reliable.
+	 */
+	bool use_vram_helper;
+
+	/*
+	 * @verbose: set it to true if print useful information is wantted
+	 */
+	bool verbose;
+
+	int irq;
+	u32 irq_status;
+};
+
+#define to_lsdc(x) container_of(x, struct lsdc_device, drm)
+
+static inline struct lsdc_crtc_state *
+to_lsdc_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct lsdc_crtc_state, base);
+}
+
+static inline u32 lsdc_reg_read32(struct lsdc_device * const ldev, u32 offset)
+{
+	u32 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
+	val = readl(ldev-&gt;reg_base + offset);
+	spin_unlock_irqrestore(&amp;ldev-&gt;reglock, flags);
+
+	return val;
+}
+
+static inline void lsdc_reg_write32(struct lsdc_device * const ldev, u32 offset, u32 val)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
+	writel(val, ldev-&gt;reg_base + offset);
+	spin_unlock_irqrestore(&amp;ldev-&gt;reglock, flags);
+}
+
+int lsdc_crtc_init(struct drm_device *ddev, struct drm_crtc *crtc,
+		   unsigned int index, struct drm_plane *primary,
+		   struct drm_plane *cursor);
+
+int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
+		    enum drm_plane_type type, unsigned int index);
+
+int lsdc_encoder_init(struct drm_encoder * const encoder,
+		      struct drm_connector *connector,
+		      struct drm_device *ddev,
+		      unsigned int index,
+		      unsigned int total);
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_encoder.c b/drivers/gpu/drm/lsdc/lsdc_encoder.c
new file mode 100644
index 000000000000..0cdd95f5bc37
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_encoder.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *	Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+#include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_crtc_helper.h&gt;
+
+#include "lsdc_drv.h"
+
+static const struct drm_encoder_funcs lsdc_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
+
+int lsdc_encoder_init(struct drm_encoder * const encoder,
+		      struct drm_connector *connector,
+		      struct drm_device *ddev,
+		      unsigned int index,
+		      unsigned int total)
+{
+	int ret;
+	int type;
+
+	encoder-&gt;possible_crtcs = BIT(index);
+
+	if (total == 2)
+		encoder-&gt;possible_clones = BIT(1) | BIT(0);
+	else if (total &lt; 2)
+		encoder-&gt;possible_clones = 0;
+
+	if (connector-&gt;connector_type == DRM_MODE_CONNECTOR_VGA)
+		type = DRM_MODE_ENCODER_DAC;
+	else if ((connector-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
+		 (connector-&gt;connector_type == DRM_MODE_CONNECTOR_HDMIB) ||
+		 (connector-&gt;connector_type == DRM_MODE_CONNECTOR_DVID))
+		type = DRM_MODE_ENCODER_TMDS;
+	else if (connector-&gt;connector_type == DRM_MODE_CONNECTOR_DPI)
+		type = DRM_MODE_ENCODER_DPI;
+	else if (connector-&gt;connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
+		type = DRM_MODE_ENCODER_VIRTUAL;
+	else
+		type = DRM_MODE_ENCODER_NONE;
+
+	ret = drm_encoder_init(ddev,
+				encoder,
+				&amp;lsdc_encoder_funcs,
+				type,
+				"encoder%d",
+				index);
+	if (ret)
+		return ret;
+
+	return drm_connector_attach_encoder(connector, encoder);
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_i2c.c
new file mode 100644
index 000000000000..895e94ae6827
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
@@ -0,0 +1,220 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;linux/string.h&gt;
+#include &lt;linux/i2c.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_i2c.h"
+
+/*
+ * set the state of a gpio pin indicated by mask
+ * @mask: gpio pin mask
+ */
+static void ls7a_gpio_i2c_set(struct lsdc_i2c * const i2c, int mask, int state)
+{
+	struct lsdc_device *ldev = to_lsdc(i2c-&gt;ddev);
+	u8 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
+
+	if (state) {
+		val = readb(i2c-&gt;dir_reg);
+		val |= mask;
+		writeb(val, i2c-&gt;dir_reg);
+	} else {
+		val = readb(i2c-&gt;dir_reg);
+		val &amp;= ~mask;
+		writeb(val, i2c-&gt;dir_reg);
+
+		val = readb(i2c-&gt;dat_reg);
+		if (state)
+			val |= mask;
+		else
+			val &amp;= ~mask;
+		writeb(val, i2c-&gt;dat_reg);
+	}
+
+	spin_unlock_irqrestore(&amp;ldev-&gt;reglock, flags);
+}
+
+/*
+ * read value back from gpio pin
+ * @mask: gpio pin mask
+ */
+static int ls7a_gpio_i2c_get(struct lsdc_i2c * const i2c, int mask)
+{
+	struct lsdc_device *ldev = to_lsdc(i2c-&gt;ddev);
+	u8 val;
+	unsigned long flags;
+
+	spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
+
+	/* first set this pin as input */
+	val = readb(i2c-&gt;dir_reg);
+	val |= mask;
+	writeb(val, i2c-&gt;dir_reg);
+
+	/* then get level state from this pin */
+	val = readb(i2c-&gt;dat_reg);
+
+	spin_unlock_irqrestore(&amp;ldev-&gt;reglock, flags);
+
+	return (val &amp; mask) ? 1 : 0;
+}
+
+
+/* set the state on the i2c-&gt;sda pin */
+static void ls7a_i2c_set_sda(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_set(li2c, li2c-&gt;sda, state);
+}
+
+/* set the state on the i2c-&gt;scl pin */
+static void ls7a_i2c_set_scl(void *i2c, int state)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_set(li2c, li2c-&gt;scl, state);
+}
+
+/* read the value from the i2c-&gt;sda pin */
+static int ls7a_i2c_get_sda(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_get(li2c, li2c-&gt;sda);
+}
+
+/* read the value from the i2c-&gt;scl pin */
+static int ls7a_i2c_get_scl(void *i2c)
+{
+	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
+
+	return ls7a_gpio_i2c_get(li2c, li2c-&gt;scl);
+}
+
+/*
+ * Get i2c id from connector id
+ *
+ * TODO: get it from dtb
+ */
+static int lsdc_get_i2c_id(struct drm_device *ddev, unsigned int index)
+{
+	return index;
+}
+
+/*
+ * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
+ *
+ * @index : output channel index, 0 for DVO0, 1 for DVO1
+ */
+struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
+					 unsigned int index)
+{
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct i2c_adapter *adapter;
+	struct lsdc_i2c *li2c;
+	int ret;
+
+	li2c = devm_kzalloc(ddev-&gt;dev, sizeof(*li2c), GFP_KERNEL);
+	if (li2c == NULL)
+		return ERR_PTR(-ENOMEM);
+
+	li2c-&gt;ddev = ddev;
+
+	if (index == 0) {
+		li2c-&gt;sda = 0x01;
+		li2c-&gt;scl = 0x02;
+	} else if (index == 1) {
+		li2c-&gt;sda = 0x04;
+		li2c-&gt;scl = 0x08;
+	}
+
+	li2c-&gt;dir_reg = ldev-&gt;reg_base + LS7A_DC_GPIO_DIR_REG;
+	li2c-&gt;dat_reg = ldev-&gt;reg_base + LS7A_DC_GPIO_DAT_REG;
+
+	li2c-&gt;bit.setsda = ls7a_i2c_set_sda;
+	li2c-&gt;bit.setscl = ls7a_i2c_set_scl;
+	li2c-&gt;bit.getsda = ls7a_i2c_get_sda;
+	li2c-&gt;bit.getscl = ls7a_i2c_get_scl;
+	li2c-&gt;bit.udelay = 5;
+	li2c-&gt;bit.timeout = usecs_to_jiffies(2200); /* from VESA */
+	li2c-&gt;bit.data = li2c;
+
+	adapter = &amp;li2c-&gt;adapter;
+
+	adapter-&gt;algo_data = &amp;li2c-&gt;bit;
+	adapter-&gt;owner = THIS_MODULE;
+	adapter-&gt;class = I2C_CLASS_DDC;
+	adapter-&gt;dev.parent = ddev-&gt;dev;
+	adapter-&gt;nr = -1;
+
+	snprintf(adapter-&gt;name, sizeof(adapter-&gt;name),
+		"%s-%d", "lsdc_gpio_i2c", index);
+
+	i2c_set_adapdata(adapter, li2c);
+
+	ret = i2c_bit_add_numbered_bus(adapter);
+	if (ret) {
+		devm_kfree(ddev-&gt;dev, li2c);
+		return ERR_PTR(ret);
+	}
+
+	return adapter;
+}
+
+
+/*
+ * Mainly for dc in ls2k1000, ls2k0500 SoC which should get a i2c adapter
+ * from i2c susystem.
+ *
+ * @index : output channel index, 0 for DVO0, 1 for DVO1
+ */
+struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
+					 unsigned int index)
+{
+	unsigned int i2c_id;
+
+	/* find mapping between i2c id and connector id */
+	i2c_id = lsdc_get_i2c_id(ddev, index);
+
+	return i2c_get_adapter(i2c_id);
+}
+
+
+void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *adapter)
+{
+	i2c_put_adapter(adapter);
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.h b/drivers/gpu/drm/lsdc/lsdc_i2c.h
new file mode 100644
index 000000000000..f4560db3694a
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_i2c.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+
+#ifndef __LSDC_I2C__
+#define __LSDC_I2C__
+
+#include &lt;linux/i2c.h&gt;
+#include &lt;linux/i2c-algo-bit.h&gt;
+
+
+struct lsdc_i2c {
+	struct drm_device *ddev;
+	struct i2c_adapter adapter;
+	struct i2c_algo_bit_data bit;
+	/* pin bit mask */
+	u8 sda;
+	u8 scl;
+
+	void __iomem *dir_reg;
+	void __iomem *dat_reg;
+};
+
+
+void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *i2c);
+
+struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
+					 unsigned int con_id);
+
+struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
+					 unsigned int con_id);
+
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c b/drivers/gpu/drm/lsdc/lsdc_irq.c
new file mode 100644
index 000000000000..7620de54aae4
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+#include &lt;drm/drm_vblank.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_irq.h"
+
+/* Function to be called in a threaded interrupt context. */
+irqreturn_t lsdc_irq_thread_cb(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_crtc *crtc;
+
+	/* trigger the vblank event */
+	if (ldev-&gt;irq_status &amp; INT_CRTC0_VS) {
+		crtc = drm_crtc_from_index(ddev, 0);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	if (ldev-&gt;irq_status &amp; INT_CRTC1_VS) {
+		crtc = drm_crtc_from_index(ddev, 1);
+		drm_crtc_handle_vblank(crtc);
+	}
+
+	lsdc_reg_write32(ldev, LSDC_INT_REG, INT_CRTC0_VS_EN | INT_CRTC1_VS_EN);
+
+	return IRQ_HANDLED;
+}
+
+
+/* Function to be called when the IRQ occurs */
+irqreturn_t lsdc_irq_handler_cb(int irq, void *arg)
+{
+	struct drm_device *ddev = arg;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	/* Read &amp; Clear the interrupt status */
+	ldev-&gt;irq_status = lsdc_reg_read32(ldev, LSDC_INT_REG);
+	if ((ldev-&gt;irq_status &amp; INT_STATUS_MASK) == 0) {
+		drm_warn(ddev, "no interrupt occurs\n");
+		return IRQ_NONE;
+	}
+
+	/* clear all interrupt */
+	lsdc_reg_write32(ldev, LSDC_INT_REG, ldev-&gt;irq_status);
+
+	return IRQ_WAKE_THREAD;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.h b/drivers/gpu/drm/lsdc/lsdc_irq.h
new file mode 100644
index 000000000000..ac187538d746
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_irq.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#ifndef __LSDC_IRQ_H__
+#define __LSDC_IRQ_H__
+
+irqreturn_t lsdc_irq_thread_cb(int irq, void *arg);
+irqreturn_t lsdc_irq_handler_cb(int irq, void *arg);
+
+#endif
diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c b/drivers/gpu/drm/lsdc/lsdc_plane.c
new file mode 100644
index 000000000000..62801e100a13
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
@@ -0,0 +1,681 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;drm/drm_print.h&gt;
+#include &lt;drm/drm_device.h&gt;
+#include &lt;drm/drm_crtc.h&gt;
+#include &lt;drm/drm_plane.h&gt;
+#include &lt;drm/drm_atomic.h&gt;
+#include &lt;drm/drm_vblank.h&gt;
+#include &lt;drm/drm_drv.h&gt;
+
+#include &lt;drm/drm_format_helper.h&gt;
+#include &lt;drm/drm_plane_helper.h&gt;
+#include &lt;drm/drm_fb_cma_helper.h&gt;
+#include &lt;drm/drm_gem_cma_helper.h&gt;
+#include &lt;drm/drm_atomic_helper.h&gt;
+#include &lt;drm/drm_gem_framebuffer_helper.h&gt;
+#include &lt;drm/drm_gem_atomic_helper.h&gt;
+#include &lt;drm/drm_damage_helper.h&gt;
+
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+
+static const uint32_t lsdc_primary_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static const uint32_t lsdc_cursor_formats[] = {
+	DRM_FORMAT_ARGB8888,
+};
+
+static const u64 lsdc_fb_format_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
+
+static u32 lsdc_pixfmt_to_drm_pixfmt(enum lsdc_pixel_format pf)
+{
+	switch (pf) {
+	case LSDC_PF_XRGB8888:
+		return DRM_FORMAT_XRGB8888;
+	case LSDC_PF_RGB565:
+		return DRM_FORMAT_RGB565;
+	case LSDC_PF_ARGB1555:
+		return DRM_FORMAT_ARGB1555;
+	case LSDC_PF_ARGB4444:
+		return DRM_FORMAT_ARGB4444;
+	case LSDC_PF_NONE:
+	default:
+		return 0;
+	}
+}
+
+static const char *lsdc_pixfmt_to_string(u32 reg)
+{
+	switch (reg &amp; CFG_PIX_FMT_MASK) {
+	case LSDC_PF_XRGB8888:
+		return "XRGB8888";
+	case LSDC_PF_RGB565:
+		return "RGB565";
+	case LSDC_PF_ARGB1555:
+		return "ARGB1555";
+	case LSDC_PF_ARGB4444:
+		return "ARGB4444";
+	case LSDC_PF_NONE:
+		return "NONE";
+	default:
+		return "unknown";
+	}
+}
+
+
+
+static void lsdc_update_fb_format(struct lsdc_device *ldev,
+				  struct drm_crtc *crtc,
+				  const struct drm_format_info *fmt_info)
+{
+	unsigned int index = drm_crtc_index(crtc);
+	u32 val = 0;
+	u32 fmt;
+
+	switch (fmt_info-&gt;format) {
+	case DRM_FORMAT_RGB565:
+		fmt = LSDC_PF_RGB565;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	default:
+		fmt = LSDC_PF_XRGB8888;
+		break;
+	}
+
+	if (ldev-&gt;verbose)
+		drm_info(&amp;ldev-&gt;drm, "fmt wanted is %s\n",
+				lsdc_pixfmt_to_string(fmt));
+
+	if (index == 0) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+		val = (val &amp; ~CFG_PIX_FMT_MASK) | fmt;
+		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+	} else if (index == 1) {
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+		val = (val &amp; ~CFG_PIX_FMT_MASK) | fmt;
+		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+	}
+
+	if (ldev-&gt;verbose)
+		drm_info(&amp;ldev-&gt;drm, "after update fb%d format is %s\n",
+				index, lsdc_pixfmt_to_string(val));
+}
+
+
+static u32 lsdc_primary_get_default_format(struct drm_crtc *crtc)
+{
+	struct lsdc_device *ldev = to_lsdc(crtc-&gt;dev);
+	unsigned int index = drm_crtc_index(crtc);
+	u32 val;
+
+	if (index == 0)
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+	else if (index == 1)
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+
+	return val &amp; CFG_PIX_FMT_MASK;
+}
+
+
+static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
+				      struct drm_crtc *crtc,
+				      u64 paddr)
+{
+	unsigned int index = drm_crtc_index(crtc);
+	u32 addr_reg;
+	u32 cfg_reg;
+	u32 val;
+
+	/*
+	 * Find which framebuffer address register should update.
+	 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
+	 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
+	 */
+	if (index == 0) {
+		/* CRTC0 */
+		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
+
+		cfg_reg = LSDC_CRTC0_CFG_REG;
+
+		if (val &amp; CFG_FB_IDX_BIT) {
+			addr_reg = LSDC_CRTC0_FB_ADDR0_REG;
+			drm_dbg_kms(&amp;ldev-&gt;drm, "CRTC0 FB0 will be use\n");
+		} else {
+			addr_reg = LSDC_CRTC0_FB_ADDR1_REG;
+			drm_dbg_kms(&amp;ldev-&gt;drm, "CRTC0 FBq will be use\n");
+		}
+	} else if (index == 1) {
+		/* CRTC1 */
+		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
+
+		cfg_reg = LSDC_CRTC1_CFG_REG;
+
+		if (val &amp; CFG_FB_IDX_BIT) {
+			addr_reg = LSDC_CRTC1_FB_ADDR0_REG;
+			drm_dbg_kms(&amp;ldev-&gt;drm, "CRTC1 FB0 will be use\n");
+		} else {
+			addr_reg = LSDC_CRTC1_FB_ADDR1_REG;
+			drm_dbg_kms(&amp;ldev-&gt;drm, "CRTC1 FBq will be use\n");
+		}
+	}
+
+	lsdc_reg_write32(ldev, addr_reg, paddr);
+
+	/*
+	 * Then, we triger the fb switch, the switch of the framebuffer
+	 * to be scanout will complete at the next vblank.
+	 */
+	lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
+
+	drm_dbg_kms(&amp;ldev-&gt;drm, "crtc%u scantout from 0x%llx\n", index, paddr);
+}
+
+
+static void lsdc_handle_damage(struct lsdc_device *ldev,
+			       struct drm_framebuffer *fb,
+			       struct drm_rect *clip,
+			       void *src)
+{
+	unsigned int offset;
+	void __iomem *dst;
+
+	offset = drm_fb_clip_offset(fb-&gt;pitches[0], fb-&gt;format, clip);
+	dst = ldev-&gt;vram + offset;
+	drm_fb_memcpy_toio(dst, fb-&gt;pitches[0], src, fb, clip);
+}
+
+
+static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
+				       struct drm_plane_state *state,
+				       unsigned int plane)
+{
+	unsigned int offset;
+
+	offset = fb-&gt;offsets[plane];
+	offset += fb-&gt;format-&gt;cpp[plane] * (state-&gt;src_x &gt;&gt; 16);
+	offset += fb-&gt;pitches[plane] * (state-&gt;src_y &gt;&gt; 16);
+
+	return offset;
+}
+
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
+{
+	struct drm_gem_vram_object *gbo;
+	s64 gpu_addr;
+
+	gbo = drm_gem_vram_of_gem(fb-&gt;obj[0]);
+	gpu_addr = drm_gem_vram_offset(gbo);
+
+	return gpu_addr;
+}
+#endif
+
+
+static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state-&gt;fb;
+	struct drm_framebuffer *old_fb = old_plane_state-&gt;fb;
+	struct drm_crtc *crtc = new_plane_state-&gt;crtc;
+	u32 new_format = new_fb-&gt;format-&gt;format;
+	struct drm_crtc_state *new_crtc_state;
+	struct lsdc_crtc_state *priv_crtc_state;
+	int ret;
+
+	if (!crtc)
+		return 0;
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (WARN_ON(!new_crtc_state))
+		return -EINVAL;
+
+	priv_crtc_state = to_lsdc_crtc_state(new_crtc_state);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  new_crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  false,
+						  true);
+	if (ret)
+		return ret;
+
+	/*
+	 * Require full modeset if enabling or disabling a plane,
+	 * or changing its position, size, depth or format.
+	 */
+	if ((!new_fb || !old_fb ||
+	     old_plane_state-&gt;crtc_x != new_plane_state-&gt;crtc_x ||
+	     old_plane_state-&gt;crtc_y != new_plane_state-&gt;crtc_y ||
+	     old_plane_state-&gt;crtc_w != new_plane_state-&gt;crtc_w ||
+	     old_plane_state-&gt;crtc_h != new_plane_state-&gt;crtc_h ||
+	     old_fb-&gt;format-&gt;format != new_format))
+		new_crtc_state-&gt;mode_changed = true;
+
+
+	priv_crtc_state-&gt;pix_fmt = lsdc_primary_get_default_format(crtc);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Storing the pixel format in the CRTC state is weird? What would happen
if you have a primary plane and a cursor in different formats?

Also, reading the default format from a register doesn't look right.
atomic_check can occur at any time, including before a previous commit,
or while the hardware is disabled. You should rely on either a constant
or the previous state here.</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap="">Currently, private CRTC state(priv_crtc_state) is not get used by the cursor's
atomic_check() and atomic_update(). I means this is only for the primary plane.
</pre>
    <p>And both and the primary and the cursor using  XRGB8888 format,
      what I really want  here is</p>
    <p>let the atomic_update to update the framebuffer's format, because
      the firmware (pmon) of some <br>
    </p>
    <p>board set the framebuffer's format as RGB565.  If the hardware's
      format is same with the plane</p>
    <p>state, then there is no need to update the FB's format register,
      save a function call, right?    <br>
    </p>
    <p>When the plane is disabled the drm core will call the
      atomic_disable() function, right? <br>
    </p>
    <p> I will reconsider this, thank your advice.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	if (lsdc_pixfmt_to_drm_pixfmt(priv_crtc_state-&gt;pix_fmt) != new_format) {
+		drm_info(&amp;ldev-&gt;drm, "mode changed\n");
+		new_crtc_state-&gt;mode_changed = true;
+	}
+
+	if (new_crtc_state-&gt;mode_changed) {
+		struct lsdc_display_pipe *dispipe = container_of(plane, struct lsdc_display_pipe, primary);
+		struct lsdc_pll *pixpll = &amp;dispipe-&gt;pixpll;
+		const struct lsdc_pixpll_funcs *pfuncs = pixpll-&gt;funcs;
+
+		ret = pfuncs-&gt;compute(pixpll,
+				      new_crtc_state-&gt;mode.clock,
+				      true,
+				      &amp;priv_crtc_state-&gt;pparams);
+		if (ret == false) {
+			drm_warn(plane-&gt;dev,
+				"failed find a set of pll param for mode %u\n",
+				new_crtc_state-&gt;mode.clock);
+			return -EINVAL;
+		}
+	}
+
+	if (ldev-&gt;dirty_update)
+		drm_atomic_helper_check_plane_damage(state, new_plane_state);
+
+	return 0;
+}
+
+static void lsdc_update_stride(struct lsdc_device *ldev,
+			       struct drm_crtc *crtc,
+			       unsigned int stride)
+{
+	unsigned int index = drm_crtc_index(crtc);
+
+	if (index == 0)
+		lsdc_reg_write32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
+	else if (index == 1)
+		lsdc_reg_write32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
+
+	drm_dbg_kms(&amp;ldev-&gt;drm, "update stride to %u\n", stride);
+}
+
+
+
+static void lsdc_primary_plane_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+	struct lsdc_device *ldev = to_lsdc(plane-&gt;dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state-&gt;crtc;
+	struct drm_framebuffer *fb = new_plane_state-&gt;fb;
+	u32 fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
+	struct drm_gem_cma_object *obj;
+	dma_addr_t fb_addr;
+
+	if (ldev-&gt;use_vram_helper) {
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+		s64 gpu_addr;
+
+		gpu_addr = lsdc_get_vram_bo_offset(fb);
+		if (gpu_addr &lt; 0)
+			return;
+
+		fb_addr = ldev-&gt;vram_base + gpu_addr + fb_offset;
+#endif
+	} else {
+		obj = drm_fb_cma_get_gem_obj(fb, 0);
+
+		if (ldev-&gt;dirty_update)
+			fb_addr = ldev-&gt;vram_base + fb_offset;
+		else
+			fb_addr = obj-&gt;paddr + fb_offset;
+	}
+
+	lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
+
+	lsdc_update_stride(ldev, crtc, fb-&gt;pitches[0]);
+
+	if (drm_atomic_crtc_needs_modeset(crtc-&gt;state))
+		lsdc_update_fb_format(ldev, crtc, fb-&gt;format);
+
+	if (ldev-&gt;dirty_update) {
+		struct drm_plane_state *old_plane_state;
+		struct drm_rect damage;
+		bool valid;
+
+		old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+
+		valid = drm_atomic_helper_damage_merged(old_plane_state,
+							new_plane_state,
+							&amp;damage);
+		if (valid)
+			lsdc_handle_damage(ldev, fb, &amp;damage, obj-&gt;vaddr);
+	}
+}
+
+
+static void lsdc_primary_plane_atomic_disable(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	drm_dbg_kms(plane-&gt;dev, "%s disabled\n", plane-&gt;name);
+}
+
+
+static int lsdc_plane_prepare_fb(struct drm_plane *plane,
+				   struct drm_plane_state *new_state)
+{
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+	struct lsdc_device *ldev = to_lsdc(plane-&gt;dev);
+
+	if (ldev-&gt;use_vram_helper)
+		return drm_gem_vram_plane_helper_prepare_fb(plane, new_state);
+#endif
+	return drm_gem_plane_helper_prepare_fb(plane, new_state);
+}
+
+
+static void lsdc_plane_cleanup_fb(struct drm_plane *plane,
+				    struct drm_plane_state *old_state)
+{
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+	struct drm_device *ddev = plane-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	if (ldev-&gt;use_vram_helper)
+		return drm_gem_vram_plane_helper_cleanup_fb(plane, old_state);
+#endif
+}
+
+static const struct drm_plane_helper_funcs lsdc_primary_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_primary_plane_atomic_check,
+	.atomic_update = lsdc_primary_plane_atomic_update,
+	.atomic_disable = lsdc_primary_plane_atomic_disable,
+};
+
+
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Don't use multiple blank lines. Generally speaking, there's a lot of
checkpatch warnings to fix. Make sure to run checkpatch.pl --strict and
fix whatever comes up.
</pre>
    </blockquote>
    <p>Okay, I will fix it. <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20220203085851.yqstkfgt4dz7rcnw@houat">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+static int lsdc_cursor_atomic_check(struct drm_plane *plane,
+				    struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc = new_plane_state-&gt;crtc;
+	struct drm_framebuffer *fb = new_plane_state-&gt;fb;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	/* no need for further checks if the plane is being disabled */
+	if (!crtc || !fb)
+		return 0;
+
+	if (!new_plane_state-&gt;visible)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state-&gt;crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state,
+						  crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true,
+						  true);
+	if (ret)
+		return ret;
+
+	if ((fb-&gt;width &lt; LSDC_CURS_MIN_SIZE) ||
+	    (fb-&gt;height &lt; LSDC_CURS_MIN_SIZE) ||
+	    (fb-&gt;width &gt; LSDC_CURS_MAX_SIZE) ||
+	    (fb-&gt;height &gt; LSDC_CURS_MAX_SIZE)) {
+		drm_err(plane-&gt;dev, "Invalid cursor size: %dx%d\n",
+				fb-&gt;width, fb-&gt;height);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
+/* Update the location of the cursor */
+static void lsdc_cursor_update_location(struct lsdc_device *ldev,
+					struct drm_crtc *crtc)
+{
+	u32 val;
+
+	val = lsdc_reg_read32(ldev, LSDC_CURSOR_CFG_REG);
+
+	if ((val &amp; CURSOR_FORMAT_MASK) == 0)
+		val |= CURSOR_FORMAT_ARGB8888;
+
+	/* Update the location of the cursor */
+	if (drm_crtc_index(crtc))
+		val |= CURSOR_LOCATION_BIT;
+
+	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, val);
+}
+
+/* update the position of the cursor */
+static void lsdc_cursor_update_position(struct lsdc_device *ldev, int x, int y)
+{
+	if (x &lt; 0)
+		x = 0;
+
+	if (y &lt; 0)
+		y = 0;
+
+	lsdc_reg_write32(ldev, LSDC_CURSOR_POSITION_REG, (y &lt;&lt; 16) | x);
+}
+
+
+static void lsdc_cursor_atomic_update(struct drm_plane *plane,
+				      struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state-&gt;fb;
+	struct drm_framebuffer *old_fb = old_plane_state-&gt;fb;
+
+	if (new_fb != old_fb) {
+		u64 cursor_addr;
+
+		if (ldev-&gt;use_vram_helper) {
+#ifdef CONFIG_DRM_LSDC_VRAM_DRIVER
+			s64 offset;
+
+			offset = lsdc_get_vram_bo_offset(new_fb);
+			cursor_addr = ldev-&gt;vram_base + offset;
+
+			drm_dbg_kms(ddev, "%s offset: %llx\n",
+					plane-&gt;name, offset);
+#endif
+		} else {
+			struct drm_gem_cma_object *cursor_obj;
+
+			cursor_obj = drm_fb_cma_get_gem_obj(new_fb, 0);
+			if (!cursor_obj)
+				return;
+
+			cursor_addr = cursor_obj-&gt;paddr;
+		}
+
+		lsdc_reg_write32(ldev, LSDC_CURSOR_ADDR_REG, cursor_addr);
+	}
+
+	lsdc_cursor_update_position(ldev, new_plane_state-&gt;crtc_x,
+					  new_plane_state-&gt;crtc_y);
+
+	lsdc_cursor_update_location(ldev, new_plane_state-&gt;crtc);
+}
+
+
+static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
+				       struct drm_atomic_state *state)
+{
+	struct drm_device *ddev = plane-&gt;dev;
+	struct lsdc_device *ldev = to_lsdc(ddev);
+	struct drm_plane_state *old_plane_state;
+	struct drm_crtc *crtc;
+
+	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+
+	if (old_plane_state)
+		crtc = old_plane_state-&gt;crtc;
+
+	lsdc_reg_write32(ldev, LSDC_CURSOR_CFG_REG, 0);
+
+	drm_dbg_kms(ddev, "%s disable\n", plane-&gt;name);
+}
+
+
+static const struct drm_plane_helper_funcs lsdc_cursor_plane_helpers = {
+	.prepare_fb = lsdc_plane_prepare_fb,
+	.cleanup_fb = lsdc_plane_cleanup_fb,
+	.atomic_check = lsdc_cursor_atomic_check,
+	.atomic_update = lsdc_cursor_atomic_update,
+	.atomic_disable = lsdc_cursor_atomic_disable,
+};
+
+
+static int lsdc_plane_get_default_zpos(enum drm_plane_type type)
+{
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		return 0;
+	case DRM_PLANE_TYPE_OVERLAY:
+		return 1;
+	case DRM_PLANE_TYPE_CURSOR:
+		return 7;
+	}
+	return 0;
+}
+
+
+static void lsdc_plane_reset(struct drm_plane *plane)
+{
+	drm_atomic_helper_plane_reset(plane);
+
+	plane-&gt;state-&gt;zpos = lsdc_plane_get_default_zpos(plane-&gt;type);
+
+	drm_dbg_kms(plane-&gt;dev, "%s reset\n", plane-&gt;name);
+}
+
+
+static const struct drm_plane_funcs lsdc_plane_funcs = {
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	.reset = lsdc_plane_reset,
+	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+};
+
+
+int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
+		    enum drm_plane_type type, unsigned int index)
+{
+	struct drm_device *ddev = &amp;ldev-&gt;drm;
+	int zpos = lsdc_plane_get_default_zpos(type);
+	unsigned int format_count;
+	const uint32_t *formats;
+	const char *name;
+	int ret;
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		formats = lsdc_primary_formats;
+		format_count = ARRAY_SIZE(lsdc_primary_formats);
+		name = "primary-%u";
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		formats = lsdc_cursor_formats;
+		format_count = ARRAY_SIZE(lsdc_cursor_formats);
+		name = "cursor-%u";
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_err(ddev, "overlay plane is not supported\n");
+		break;
+	}
+
+	ret = drm_universal_plane_init(ddev, plane, 1 &lt;&lt; index,
+				       &amp;lsdc_plane_funcs,
+				       formats, format_count,
+				       lsdc_fb_format_modifiers,
+				       type, name, index);
+	if (ret) {
+		drm_err(ddev, "%s failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		drm_plane_helper_add(plane, &amp;lsdc_primary_plane_helpers);
+		drm_plane_create_zpos_property(plane, zpos, 0, 6);
+		if (ldev-&gt;dirty_update)
+			drm_plane_enable_fb_damage_clips(plane);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		drm_plane_helper_add(plane, &amp;lsdc_cursor_plane_helpers);
+		drm_plane_create_zpos_immutable_property(plane, zpos);
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_err(ddev, "overlay plane is not supported\n");
+		break;
+	}
+
+	drm_plane_create_alpha_property(plane);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c b/drivers/gpu/drm/lsdc/lsdc_pll.c
new file mode 100644
index 000000000000..fcf3728a9067
--- /dev/null
+++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2020 Loongson Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the
+ * "Software"), to deal in the Software without restriction, including
+ * without limitation the rights to use, copy, modify, merge, publish,
+ * distribute, sub license, and/or sell copies of the Software, and to
+ * permit persons to whom the Software is furnished to do so, subject to
+ * the following conditions:
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
+ * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+ * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ * USE OR OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portions
+ * of the Software.
+ */
+
+/*
+ * Authors:
+ *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
+ */
+
+#include &lt;drm/drm_print.h&gt;
+
+#include "lsdc_drv.h"
+#include "lsdc_regs.h"
+#include "lsdc_pll.h"
+
+/* device dependent pixpll regs */
+
+/* u64 */
+struct ls7a1000_pixpll_bitmap {
+	/* Byte 0 ~ Byte 3 */
+	unsigned div_out      : 7;   /*  0 : 6     output clock divider  */
+	unsigned reserved_1   : 14;  /*  7 : 20                          */
+	unsigned loopc        : 9;   /* 21 : 29                          */
+	unsigned reserved_2   : 2;   /* 30 : 31                          */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned div_ref      : 7;   /*  0 : 6     input clock divider   */
+	unsigned locked       : 1;   /*  7         PLL locked flag       */
+	unsigned sel_out      : 1;   /*  8         output clk selector   */
+	unsigned reserved_3   : 2;   /*  9 : 10    reserved              */
+	unsigned set_param    : 1;   /*  11        set pll param         */
+	unsigned bypass       : 1;   /*  12                              */
+	unsigned powerdown    : 1;   /*  13                              */
+	unsigned reserved_4   : 18;  /*  14 : 31                         */
+};
+
+
+/* u128 */
+struct ls2k1000_pixpll_bitmap {
+	/* Byte 0 ~ Byte 3 */
+	unsigned sel_out      :  1;  /*  0      select this PLL          */
+	unsigned reserved_1   :  1;  /*  1                               */
+	unsigned sw_adj_en    :  1;  /*  2      allow software adjust    */
+	unsigned bypass       :  1;  /*  3      bypass L1 PLL            */
+	unsigned reserved_2   :  3;  /*  4:6                             */
+	unsigned lock_en      :  1;  /*  7      enable lock L1 PLL       */
+	unsigned reserved_3   :  2;  /*  8:9                             */
+	unsigned lock_check   :  2;  /* 10:11   precision check          */
+	unsigned reserved_4   :  4;  /* 12:15                            */
+
+	unsigned locked       :  1;  /* 16      PLL locked flag bit      */
+	unsigned reserved_5   :  2;  /* 17:18                            */
+	unsigned powerdown    :  1;  /* 19      powerdown the pll if set */
+	unsigned reserved_6   :  6;  /* 20:25                            */
+	unsigned div_ref      :  6;  /* 26:31   L1 Prescaler             */
+
+	/* Byte 4 ~ Byte 7 */
+	unsigned loopc        : 10;  /* 32:41   Clock Multiplier         */
+	unsigned l1_div       :  6;  /* 42:47   not used                 */
+	unsigned reserved_7   : 16;  /* 48:63                            */
+
+	/* Byte 8 ~ Byte 15 */
+	unsigned div_out      :  6;  /* 0 : 5   output clock divider     */
+	unsigned reserved_8   : 26;  /* 6 : 31                           */
+	unsigned reserved_9   : 32;  /* 70: 127                          */
+};
+
+
+/* u32 */
+struct ls2k0500_pixpll_bitmap {
+	/* Byte 0 ~ Byte 1 */
+	unsigned sel_out      : 1;
+	unsigned reserved_1   : 2;
+	unsigned sw_adj_en    : 1;   /* allow software adjust              */
+	unsigned bypass       : 1;   /* bypass L1 PLL                      */
+	unsigned powerdown    : 1;   /* write 1 to powerdown the PLL       */
+	unsigned reserved_2   : 1;
+	unsigned locked       : 1;   /*  7     Is L1 PLL locked, read only */
+	unsigned div_ref      : 6;   /*  8:13  ref clock divider           */
+	unsigned reserved_3   : 2;   /* 14:15                              */
+	/* Byte 2 ~ Byte 3 */
+	unsigned loopc        : 8;   /* 16:23   Clock Multiplier           */
+	unsigned div_out      : 6;   /* 24:29   output clock divider       */
+	unsigned reserved_4   : 2;   /* 30:31                              */
+};
+
+
+/*
+ * NOTE: All loongson's cpu is little endian.
+ */
+union lsdc_pix_pll_param {
+	struct ls7a1000_pixpll_bitmap ls7a1000;
+	struct ls2k1000_pixpll_bitmap ls2k1000;
+	struct ls2k0500_pixpll_bitmap ls2k0500;
+
+	u32 dword[4];
+};
+
+/*
+ * pixel clock to pll parameters translation table
+ */
+struct pixclk_to_pll_parm {
+	/* kHz */
+	unsigned int clock;
+
+	/* unrelated information */
+	unsigned short width;
+	unsigned short height;
+	unsigned short vrefresh;
+
+	/* Stores parameters for programming the Hardware PLLs */
+	unsigned short div_out;
+	unsigned short loopc;
+	unsigned short div_ref;
+};
+
+
+/*
+ * Small cached value to speed up pll parameter calculation
+ */
+static const struct pixclk_to_pll_parm pll_param_table[] = {
+	{148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
+						/* 1920x1080@50Hz */
+	{174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
+	{181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
+	{146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
+	{135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
+
+	{108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz  */
+						/* 1280x1024@60Hz */
+						/* 1280x960@60Hz */
+						/* 1152x864@75Hz */
+
+	{106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
+	{88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
+	{83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
+	{71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
+
+	{74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
+						/* 1280x720@50Hz */
+
+	{78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
+	{75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
+	{65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
+
+	{51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
+
+	{57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
+	{49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
+	{50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
+	{40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
+	{36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
+	{31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
+						/* 640x480@73Hz */
+
+	{30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
+	{27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
+	{25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
+	{25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
+						/* 720x480@60Hz */
+};
+
+/**
+ * lsdc_pixpll_setup
+ *
+ * @this: point to the object which calling this function
+ *
+ * ioremap the device dependent register before using it
+ */
+static int lsdc_pixpll_setup(struct lsdc_pll * const this)
+{
+	this-&gt;mmio = ioremap(this-&gt;reg_base, this-&gt;reg_size);
+
+	drm_info(this-&gt;ddev, "PIXPLL%u REG[%x, %u] map to %llx\n",
+		this-&gt;index, this-&gt;reg_base, this-&gt;reg_size, (u64)this-&gt;mmio);
+
+	return 0;
+}
+
+
+
+/*
+ * Find a set of pll parameters (to generate pixel clock) from a static
+ * local table, which avoid to compute the pll parameter everytime a
+ * modeset is triggered.
+ *
+ * @this: point to the object which calling this function
+ * @clock: the desired pixel clock wanted to generate, the unit is kHz
+ * @pout: pointer to where hardware pll parameters(if found) to save
+ *
+ *  Return true if a parameter is found, otherwise return false.
+ */
+static bool lsdc_pixpll_find(struct lsdc_pll * const this,
+			     unsigned int clock,
+			     struct lsdc_pll_core_values * const pout)
+{
+	unsigned int num = ARRAY_SIZE(pll_param_table);
+	unsigned int i;
+
+	for (i = 0; i &lt; num; i++) {
+		if (clock != pll_param_table[i].clock)
+			continue;
+
+		pout-&gt;div_ref = pll_param_table[i].div_ref;
+		pout-&gt;loopc   = pll_param_table[i].loopc;
+		pout-&gt;div_out = pll_param_table[i].div_out;
+
+		return true;
+	}
+
+	drm_dbg(this-&gt;ddev, "pixel clock %u: miss\n", clock);
+
+	return false;
+}
+
+/*
+ * Find a set of pll parameters which have minimal difference with desired
+ * clock frequency. It does that by computing the all of pll parameters
+ * combines possible and compare the diff and find the minimal.
+ *
+ *  clock_out = refclk / div_ref * loopc / div_out
+ *
+ *  refclk is fixed as 100MHz in ls7a1000, ls2k1000 and ls2k0500
+ *
+ * @this: point to the object which calling this function
+ * @clk: the desired pixel clock wanted to generate, the unit is kHz
+ * @verbose: print the pll parameter and the actual pixel clock.
+ * @pout: pointer to where hardware pll parameters(if found) to save
+ *
+ *  Return true if a parameter is found, otherwise return false.
+ */
+static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
+				unsigned int clk,
+				bool verbose,
+				struct lsdc_pll_core_values * const pout)
+{
+	unsigned int refclk = this-&gt;ref_clock;
+	const unsigned int tolerance = 1000;
+	unsigned int min = tolerance;
+	unsigned int div_out, loopc, div_ref;
+
+	if (lsdc_pixpll_find(this, clk, pout))
+		return true;
+
+	for (div_out = 6; div_out &lt; 64; div_out++) {
+		for (div_ref = 3; div_ref &lt; 6; div_ref++) {
+			for (loopc = 6; loopc &lt; 161; loopc++) {
+				int diff;
+
+				if (loopc &lt; 12 * div_ref)
+					continue;
+				if (loopc &gt; 32 * div_ref)
+					continue;
+
+				diff = clk * div_out - refclk * loopc / div_ref;
+
+				if (diff &lt; 0)
+					diff = -diff;
+
+				if (diff &lt; min) {
+					min = diff;
+					pout-&gt;div_ref = div_ref;
+					pout-&gt;div_out = div_out;
+					pout-&gt;loopc = loopc;
+
+					if (diff == 0)
+						return true;
+				}
+			}
+		}
+	}
+
+	if (verbose) {
+		unsigned int clk_out;
+
+		clk_out = refclk / pout-&gt;div_ref * pout-&gt;loopc / pout-&gt;div_out;
+
+		drm_info(this-&gt;ddev, "pixpll%u\n", this-&gt;index);
+
+		drm_info(this-&gt;ddev, "div_ref=%u, loopc=%u, div_out=%u\n",
+				pout-&gt;div_ref, pout-&gt;loopc, pout-&gt;div_out);
+
+		drm_info(this-&gt;ddev, "desired clk=%u, actual out=%u, diff=%d\n",
+				clk, clk_out, clk_out - clk);
+	}
+
+	return min &lt; tolerance;
+}
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls7a1000
+ *
+ * @this: point to the object which calling this function
+ * @param: pointer to where the parameters passed in
+ *
+ *  Return true if a parameter is found, otherwise return false.
+ */
+static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
+			const struct lsdc_pll_core_values * const param)
+{
+	u32 val;
+	unsigned int counter = 0;
+	void __iomem *reg = this-&gt;mmio;
+	bool locked;
+
+
+	/* clear sel_pll_out0 */
+	val = readl(reg + 0x4);
+	val &amp;= ~(1 &lt;&lt; 8);
+	writel(val, reg + 0x4);
+
+	/* set pll_pd */
+	val = readl(reg + 0x4);
+	val |= (1 &lt;&lt; 13);
+	writel(val, reg + 0x4);
+
+	/* clear set_pll_param */
+	val = readl(reg + 0x4);
+	val &amp;= ~(1 &lt;&lt; 11);
+	writel(val, reg + 0x4);
+
+	/* clear old value &amp; config new value */
+	val = readl(reg + 0x04);
+	val &amp;= ~0x7F;
+
+	val |= param-&gt;div_ref;        /* div_ref */
+	writel(val, reg + 0x4);
+
+	val = readl(reg);
+	val &amp;= ~(0x7f &lt;&lt; 0);
+	val |= param-&gt;div_out;        /* div_out */
+	val &amp;= ~(0x1ffUL &lt;&lt; 21);
+	val |= param-&gt;loopc &lt;&lt; 21;    /* loopc */
+	writel(val, reg);
+
+	/* set set_pll_param */
+	val = readl(reg + 0x4);
+	val |= (1 &lt;&lt; 11);
+	writel(val, reg + 0x4);
+
+	/* clear pll_pd */
+	val = readl(reg + 0x4);
+	val &amp;= ~(1 &lt;&lt; 13);
+	writel(val, reg + 0x4);
+
+	/* wait pll lock */
+	do {
+		val = readl(reg + 0x4);
+		locked = val &amp; 0x80;
+		counter++;
+	} while (locked == false);
+
+	drm_dbg_kms(this-&gt;ddev, "%u loop waited\n", counter);
+
+	/* set sel_pll_out0 */
+	val = readl(reg + 0x4);
+	val |= (1UL &lt;&lt; 8);
+	writel(val, reg + 0x4);
+
+	return 0;
+}
+
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls2k1000
+ *
+ * @this: point to the object which calling this function
+ * @param: pointer to where the parameters passed in
+ *
+ *  Return true if a parameter is found, otherwise return false.
+ */
+static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
+			const struct lsdc_pll_core_values * const param)
+{
+	void __iomem *reg = this-&gt;mmio;
+	unsigned int counter = 0;
+	bool locked = false;
+	u32 val;
+
+	val = readl(reg);
+	/* Bypass the software configured PLL, using refclk directly */
+	val &amp;= ~(1 &lt;&lt; 0);
+	writel(val, reg);
+
+	/* powerdown the PLL */
+	val |= (1 &lt;&lt; 19);
+	writel(val, reg);
+
+	/* Allow the software configuration */
+	val &amp;= ~(1 &lt;&lt; 2);
+	writel(val, reg);
+
+	/* allow L1 PLL lock */
+	val = (1L &lt;&lt; 7) | (3L &lt;&lt; 10);
+	writel(val, reg);
+
+	/* clear div_ref bit field */
+	val &amp;= ~(0x3f &lt;&lt; 26);
+	/* set div_ref bit field */
+	val = val | (param-&gt;div_ref &lt;&lt; 26);
+	writel(val, reg);
+
+	val = readl(reg + 4);
+	/* clear loopc bit field */
+	val &amp;= ~0x0fff;
+	/* set loopc bit field */
+	val |= param-&gt;loopc;
+	writel(val, reg + 4);
+
+	/* set div_out */
+	writel(param-&gt;div_out, reg + 8);
+
+	val = readl(reg);
+	/* use the software configure param */
+	val |= (1 &lt;&lt; 2);
+	/* powerup the PLL */
+	val &amp;= ~(1 &lt;&lt; 19);
+	writel(val, reg);
+
+	/* wait pll setup and locked */
+	do {
+		val = readl(reg);
+		locked = val &amp; 0x10000;
+		counter++;
+	} while (locked == false);
+
+	drm_dbg_kms(this-&gt;ddev, "%u loop waited\n", counter);
+
+	/* Switch to the above software configured PLL instead of refclk */
+	val |= 1;
+	writel(val, reg);
+
+	return 0;
+}
+
+/*
+ * Update the pll parameters to hardware, target to the pixpll in ls2k0500
+ *
+ * @this: point to the object which calling this function
+ * @param: pointer to where the parameters passed in
+ *
+ *  Return true if a parameter is found, otherwise return false.
+ */
+
+static int ls2k0500_pixpll_param_update(struct lsdc_pll * const this,
+			const struct lsdc_pll_core_values * const param)
+{
+	void __iomem *reg = this-&gt;mmio;
+	unsigned int counter = 0;
+	bool locked = false;
+	u32 val;
+
+	/* Bypass the software configured PLL, using refclk directly */
+	val = readl(reg);
+	val &amp;= ~(1 &lt;&lt; 0);
+	writel(val, reg);
+
+	/* Powerdown the PLL */
+	val = readl(reg);
+	val |= (1 &lt;&lt; 5);
+	writel(val, reg);
+
+	/* Allow the software configuration */
+	val |= (1 &lt;&lt; 3);
+	writel(val, reg);
+
+	/* Update the pll params */
+	val = (param-&gt;div_out &lt;&lt; 24) |
+	      (param-&gt;loopc &lt;&lt; 16) |
+	      (param-&gt;div_ref &lt;&lt; 8);
+
+	writel(val, reg);
+
+	/* Powerup the PLL */
+	val = readl(reg);
+	val &amp;= ~(1 &lt;&lt; 5);
+	writel(val, reg);
+
+	/* wait pll setup and locked */
+	do {
+		val = readl(reg);
+		locked = val &amp; 0x80;
+		counter++;
+	} while (locked == false);
+
+	drm_dbg_kms(this-&gt;ddev, "%u loop waited\n", counter);
+
+	/* Switch to the above software configured PLL instead of refclk */
+	writel((val | 1), reg);
+
+	return 0;
+}
+
+
+#define LSDC_PIXPLL_BITMAP(type,var,parms) \
+		struct type ## _pixpll_bitmap *var = &amp;parms.type
+
+#define LSDC_PIXPLL_PRINT_CODE_BLOCK(ddev,var,index,refclk)                \
+{                                                                          \
+	out_clk = refclk / var-&gt;div_ref * var-&gt;loopc / var-&gt;div_out;       \
+	drm_info(ddev, "div_ref=%u, loopc=%u, div_out=%u\n",               \
+			var-&gt;div_ref, var-&gt;loopc, var-&gt;div_out);           \
+	drm_info(ddev, "locked: %s\n", var-&gt;locked ? "Yes" : "No");        \
+	drm_info(ddev, "bypass: %s\n", var-&gt;bypass ? "Yes" : "No");        \
+	drm_info(ddev, "powerdown: %s\n", var-&gt;powerdown ? "Yes" : "No");  \
+	drm_info(ddev, "set_out: %s\n", var-&gt;sel_out ? "Yes" : "No");      \
+	drm_info(ddev, "pixpll%u generate %ukHz\n", index, out_clk);       \
+	drm_info(ddev, "\n");                                              \
+}

This should be a debug-level trace

Maxime
</pre>
      </blockquote>
    </blockquote>
    <p>It will only get printed if you using lsdc.verbose=1 on the
      kernel cmd line, by default lsdc.verbose=0,</p>
    <p>and it will not get printed. I want only those debug information
      get printed, if turn it to debug-level trace,</p>
    <p>it will overwhelming , because debug message is too large,
      sometime cause the system lag. <br>
    </p>
    <p>Anyway great thanks for advice, i will reconsider it.<br>
    </p>
  </body>
</html>

--------------0TAO3GCQXnoVqOnX0h0dN0s0--
