Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3794E5CDA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 02:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3A189D8A;
	Thu, 24 Mar 2022 01:40:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA76189D8A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 01:40:19 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:43856.1204276788
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id E23441001B4;
 Thu, 24 Mar 2022 09:39:55 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-bwdqx with ESMTP id
 0032566250bd47c5a250168a1430eb1a for robh@kernel.org; 
 Thu, 24 Mar 2022 09:40:16 CST
X-Transaction-ID: 0032566250bd47c5a250168a1430eb1a
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <33766d08-bd88-2234-0f85-5926e4256dfb@189.cn>
Date: Thu, 24 Mar 2022 09:39:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 7/7] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-8-15330273260@189.cn>
 <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/23 04:49, Rob Herring wrote:
> On Tue, Mar 22, 2022 at 12:29:16AM +0800, Sui Jingfeng wrote:
>> From: suijingfeng <suijingfeng@loongson.cn>
>>
>> There is a display controller in loongson's LS2K1000 SoC and LS7A1000
>> bridge chip, the display controller is a PCI device in those chips. It
>> has two display pipes but with only one hardware cursor. Each way has
>> a DVO interface which provide RGB888 signals, vertical & horizontal
>> synchronisations, data enable and the pixel clock. Each CRTC is able to
>> scanout from 1920x1080 resolution at 60Hz, the maxmium resolution is
>> 2048x2048 according to the hardware spec. Loongson display controllers
>> are simple which require scanout buffers to be physically contiguous.
>>
>> For LS7A1000 bridge chip, the DC is equipped with a dedicated video RAM
>> which is typically 64MB or more. In this case, VRAM helper based driver
>> is intend to be used. While LS2K1000 is a SoC, only system memory is
>> available. Therefore CMA helper based driver is intend to be used. It is
>> possible to use VRAM helper based solution by carving out part of system
>> memory as VRAM though.
>>
>> For LS7A1000, there are 4 dedicated GPIOs whose control register is
>> located at the DC register space, They are used to emulate two way i2c.
>> One for DVO0, another for DVO1. LS2K1000 and LS2K0500 SoC don't have such
>> GPIO hardwared, they grab i2c adapter from other module, either general
>> purpose GPIO emulated i2c or hardware i2c adapter.
>>
>>      +------+            +-----------------------------------+
>>      | DDR4 |            |  +-------------------+            |
>>      +------+            |  | PCIe Root complex |   LS7A1000 |
>>         || MC0           |  +--++---------++----+            |
>>    +----------+  HT 3.0  |     ||         ||                 |
>>    | LS3A4000 |<-------->| +---++---+  +--++--+    +---------+   +------+
>>    |   CPU    |<-------->| | GC1000 |  | LSDC |<-->| DDR3 MC |<->| VRAM |
>>    +----------+          | +--------+  +-+--+-+    +---------+   +------+
>>         || MC1           +---------------|--|----------------+
>>      +------+                            |  |
>>      | DDR4 |          +-------+   DVO0  |  |  DVO1   +------+
>>      +------+   VGA <--|ADV7125|<--------+  +-------->|TFP410|--> DVI/HDMI
>>                        +-------+                      +------+
>>
>> The above picture give a simple usage of LS7A1000, note that the encoder
>> is not necessary adv7125 or tfp410, other candicates can be ch7034b,
>> sil9022, ite66121 and lt8618 etc.
>>
>> v2: Fixup warnings reported by kernel test robot
>>
>> v3: Fix more grammar mistakes in Kconfig reported by Randy Dunlap and give
>>      more details about lsdc.
>>
>> v4:
>>     1) Add dts required and explain why device tree is required.
>>     2) Give more description about lsdc and VRAM helper based driver.
>>     3) Fix warnings reported by kernel test robot.
>>     4) Introduce stride_alignment member into struct lsdc_chip_desc, the
>>        stride alignment is 256 bytes for ls7a1000, ls2k1000 and ls2k0500.
>>
>> v5:
>>     1) Using writel and readl replace writeq and readq, to fix kernel test
>>        robot report build error on other archtecture.
>>     2) Set default fb format to XRGB8888 at crtc reset time.
>>
>> v6:
>>     1) Explain why we are not switch to drm dridge subsystem on ls2k1000.
>>     2) Explain why tiny drm driver is not suitable for us.
>>     3) Give a short description of the trival dirty uppdate implement based
>>        on CMA helper.
>>
>> v7:
>>     1) Remove select I2C_GPIO and I2C_LS2X in Kconfig, it is not ready now
>>     2) Licensing issues are fixed suggested by Krzysztof Kozlowski.
>>     3) Remove lsdc_pixpll_print(), part of it move to debugfs.
>>     4) Set prefer_shadow to true if vram based driver is in using.
>>     5) Replace double blank lines with single line in all files.
>>     6) Verbose cmd line parameter is replaced with drm_dbg()
>>     7) All warnnings reported by ./scripts/checkpatch.pl --strict are fixed
>>     8) Get edid from dtb support is removed as suggested by Maxime Ripard
>>     9) Fix typos and various improvement
>>
>> v8:
>>     1) Drop damage update implement and its command line.
>>     2) Drop DRM_LSDC_VRAM_DRIVER config option as suggested by Maxime.
>>     3) Deduce DC's identification from its compatible property.
>>     4) Drop the board specific dts patch.
>>     5) Add documention about the display controller device node.
>>
>> v9:
>>     1) Fix the warnings reported by checkpatch script and fix typos
>>
>> v10:
>>     1) Pass `make dt_binding_check` validation
>>     2) Fix warnings reported by kernel test robot
>>
>> v11:
>>     1) Convert the driver to use drm bridge and of graph framework.
>>     2) Dump register value support through debugfs.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>> ---
>>   drivers/gpu/drm/Kconfig             |   2 +
>>   drivers/gpu/drm/Makefile            |   1 +
>>   drivers/gpu/drm/lsdc/Kconfig        |  23 ++
>>   drivers/gpu/drm/lsdc/Makefile       |  13 +
>>   drivers/gpu/drm/lsdc/lsdc_crtc.c    | 396 +++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_drv.c     | 547 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_drv.h     | 197 ++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_i2c.c     | 235 ++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_i2c.h     |  42 ++
>>   drivers/gpu/drm/lsdc/lsdc_irq.c     |  58 +++
>>   drivers/gpu/drm/lsdc/lsdc_irq.h     |  18 +
>>   drivers/gpu/drm/lsdc/lsdc_output.c  | 262 +++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_output.h  |  24 ++
>>   drivers/gpu/drm/lsdc/lsdc_pci_drv.c | 328 ++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_plane.c   | 470 +++++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_pll.c     | 574 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/lsdc/lsdc_pll.h     |  88 +++++
>>   drivers/gpu/drm/lsdc/lsdc_regs.h    | 220 +++++++++++
>>   18 files changed, 3498 insertions(+)
>>   create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>>   create mode 100644 drivers/gpu/drm/lsdc/Makefile
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pci_drv.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
> [...]
>
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>> new file mode 100644
>> index 000000000000..55beed9266fa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>> @@ -0,0 +1,235 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * KMS driver for Loongson display controller
> Not really a useful comment since every file has the same one.
>
>> + * Copyright (C) 2022 Loongson Corporation
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/pci.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_regs.h"
>> +#include "lsdc_i2c.h"
>> +
>> +/*
>> + * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by mask
>> + * @mask: gpio pin mask
>> + */
>> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
>> +{
>> +	unsigned long flags;
>> +	u8 val;
>> +
>> +	spin_lock_irqsave(&li2c->reglock, flags);
> What are you protecting? Doesn't the caller serialize calls to these
> functions?
>
>> +
>> +	if (state) {
>> +		val = readb(li2c->dir_reg);
>> +		val |= mask;
>> +		writeb(val, li2c->dir_reg);
>> +	} else {
>> +		val = readb(li2c->dir_reg);
>> +		val &= ~mask;
>> +		writeb(val, li2c->dir_reg);
>> +
>> +		val = readb(li2c->dat_reg);
>> +		if (state)
> This condition is never true. We're in the 'else' because !state.
>
>> +			val |= mask;
>> +		else
>> +			val &= ~mask;
>> +		writeb(val, li2c->dat_reg);
> Shouldn't you set the data register low first and then change the
> direction? Otherwise, you may be driving high for a moment. However, if
> high is always done by setting the direction as input, why write the
> data register each time? I'm assuming whatever is written to the dat_reg
> is maintained regardless of pin state.
>
When the pin is input, i am not sure value written to it will be preserved.

I'm worry about it get flushed by the external input value.

Because the output data register is same with the input data register( 
offset is  0x1650).

The hardware designer do not provided a  separation.

>> +	}
>> +
>> +	spin_unlock_irqrestore(&li2c->reglock, flags);
>> +}
>> +
>> +/*
>> + * ls7a_gpio_i2c_get - read value back from gpio pin
>> + * @mask: gpio pin mask
>> + */
>> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
>> +{
>> +	unsigned long flags;
>> +	u8 val;
>> +
>> +	spin_lock_irqsave(&li2c->reglock, flags);
>> +
>> +	/* first set this pin as input */
>> +	val = readb(li2c->dir_reg);
>> +	val |= mask;
>> +	writeb(val, li2c->dir_reg);
>> +
>> +	/* then get level state from this pin */
>> +	val = readb(li2c->dat_reg);
>> +
>> +	spin_unlock_irqrestore(&li2c->reglock, flags);
>> +
>> +	return (val & mask) ? 1 : 0;
>> +}
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
>> + * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
>> + *
>> + * @index : output channel index, 0 for DVO0, 1 for DVO1
>> + */
>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct device *dev, void *base, unsigned int index)
>> +{
>> +	char compat[32] = {0};
>> +	unsigned int udelay = 5;
>> +	unsigned int timeout = 2200;
>> +	int nr = -1;
>> +	struct i2c_adapter *adapter;
>> +	struct lsdc_i2c *li2c;
>> +	struct device_node *i2c_np;
>> +	int ret;
>> +
>> +	li2c = devm_kzalloc(dev, sizeof(*li2c), GFP_KERNEL);
>> +	if (!li2c)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	li2c->index = index;
>> +	li2c->dev = dev;
>> +
>> +	if (index == 0) {
>> +		li2c->sda = 0x01;
>> +		li2c->scl = 0x02;
>> +	} else if (index == 1) {
>> +		li2c->sda = 0x04;
>> +		li2c->scl = 0x08;
> Just require this to be in DT rather than having some default.
>
>> +	}
>> +
>> +	spin_lock_init(&li2c->reglock);
>> +
>> +	snprintf(compat, sizeof(compat), "lsdc,i2c-gpio-%d", index);
> compatible values shouldn't have an index and you shouldn't need a
> index in DT. You need to iterate over child nodes with matching
> compatible.
>
>> +	i2c_np = of_find_compatible_node(dev->of_node, NULL, compat);
>> +	if (i2c_np) {
>> +		u32 sda, scl;
>> +
>> +		dev_dbg(dev, "Has %s property in the DT", compat);
>> +
>> +		/*  */
>> +		ret = of_property_read_u32(i2c_np, "sda", &sda);
> Custom properties need a vendor prefix.
>
>> +		if (ret == 0)
>> +			li2c->sda = 1 << sda;
>> +
>> +		ret = of_property_read_u32(i2c_np, "scl", &scl);
>> +		if (ret == 0)
>> +			li2c->scl = 1 << scl;
>> +
>> +		/* Optional properties which made the driver more flexible */
>> +		of_property_read_u32(i2c_np, "udelay", &udelay);
>> +		of_property_read_u32(i2c_np, "timeout", &timeout);
> These aren't documented. Do you really need them in DT?

Yes, in very rare case:

When debugging, sometimes one way I2C works, another way I2C not on 
specific board.

and you want to see what will happen if you change it from 5 to 2.

modify device tree is enough, have to recompile the kernel and driver 
modules every time.

It is optional through.

Please do not ask me to document such a easy thing,
DT itself is a documention, human readable,  it already speak for itself.
>> +		of_property_read_u32(i2c_np, "reg", &nr);
>> +	}
>> +
>> +	dev_dbg(dev, "%s: sda=%u, scl=%u, nr=%d, udelay=%u, timeout=%u\n",
>> +		compat, li2c->sda, li2c->scl, nr, udelay, timeout);
>> +
>> +	li2c->reg_base = base;
>> +
>> +	li2c->dir_reg = li2c->reg_base + LS7A_DC_GPIO_DIR_REG;
>> +	li2c->dat_reg = li2c->reg_base + LS7A_DC_GPIO_DAT_REG;
>> +
>> +	li2c->bit.setsda = ls7a_i2c_set_sda;
>> +	li2c->bit.setscl = ls7a_i2c_set_scl;
>> +	li2c->bit.getsda = ls7a_i2c_get_sda;
>> +	li2c->bit.getscl = ls7a_i2c_get_scl;
>> +	li2c->bit.udelay = udelay;
>> +	li2c->bit.timeout = usecs_to_jiffies(timeout);
>> +	li2c->bit.data = li2c;
>> +
>> +	adapter = &li2c->adapter;
>> +	adapter->algo_data = &li2c->bit;
>> +	adapter->owner = THIS_MODULE;
>> +	adapter->class = I2C_CLASS_DDC;
>> +	adapter->dev.parent = dev;
>> +	adapter->nr = nr;
>> +	if (i2c_np) {
>> +		adapter->dev.of_node = i2c_np;
>> +		of_node_put(i2c_np);
>> +	}
>> +
>> +	strscpy(adapter->name, &compat[5], sizeof(adapter->name));
>> +
>> +	i2c_set_adapdata(adapter, li2c);
>> +
>> +	ret = i2c_bit_add_numbered_bus(adapter);
> Why do you care what the bus number is? You shouldn't need to.
>
>> +	if (ret) {
>> +		if (i2c_np)
>> +			of_node_put(i2c_np);
>> +
>> +		devm_kfree(dev, li2c);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return li2c;
>> +}
>> +
>> +void lsdc_destroy_i2c(struct drm_device *ddev, struct lsdc_i2c *li2c)
>> +{
>> +	struct i2c_adapter *adapter;
>> +
>> +	if (li2c) {
>> +		adapter = &li2c->adapter;
>> +
>> +		if (adapter && adapter->dev.of_node)
>> +			of_node_put(adapter->dev.of_node);
>> +
>> +		devm_kfree(ddev->dev, li2c);
>> +	}
>> +}
>> +
>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev,
>> +					 unsigned int index)
>> +{
>> +	const struct lsdc_chip_desc * const descp = ldev->desc;
>> +	struct lsdc_i2c *li2c;
>> +
>> +	if (index >= descp->num_of_crtc) {
>> +		drm_err(ldev->ddev, "I2c adapter is no more than %u, %u\n",
>> +			descp->num_of_crtc, index);
>> +		return NULL;
>> +	}
>> +
>> +	li2c = ldev->li2c[index];
>> +	if (li2c)
>> +		return &li2c->adapter;
>> +
>> +	return NULL;
>> +}
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.h b/drivers/gpu/drm/lsdc/lsdc_i2c.h
>> new file mode 100644
>> index 000000000000..4ab825143eb4
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.h
>> @@ -0,0 +1,42 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * KMS driver for Loongson display controller
>> + * Copyright (C) 2022 Loongson Corporation
>> + */
>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>> + */
>> +
>> +#ifndef __LSDC_I2C__
>> +#define __LSDC_I2C__
>> +
>> +#include <linux/i2c.h>
>> +#include <linux/i2c-algo-bit.h>
>> +#include <linux/pci.h>
>> +
>> +struct lsdc_i2c {
>> +	struct device *dev;
>> +	struct i2c_adapter adapter;
>> +	struct i2c_algo_bit_data bit;
>> +	/* @reglock: protects concurrent register access */
>> +	spinlock_t reglock;
>> +	void __iomem *reg_base;
>> +	void __iomem *dir_reg;
>> +	void __iomem *dat_reg;
>> +	int index;
>> +	/* pin bit mask */
>> +	u8 sda;
>> +	u8 scl;
>> +};
>> +
>> +void lsdc_destroy_i2c(struct drm_device *ddev, struct lsdc_i2c *li2c);
>> +
>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct device *dev,
>> +				      void *base,
>> +				      unsigned int index);
>> +
>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev,
>> +					 unsigned int index);
>> +#endif
