Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B7C6A28C3
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 11:10:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814DB10E125;
	Sat, 25 Feb 2023 10:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 765C810EBC6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 14:55:24 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:55278.2038881633
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 4A2FD10012C;
 Thu, 23 Feb 2023 22:55:07 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-jn5ln with ESMTP id
 5d1d3203c1d143109fcb888831e6969c for tzimmermann@suse.de; 
 Thu, 23 Feb 2023 22:55:21 CST
X-Transaction-ID: 5d1d3203c1d143109fcb888831e6969c
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Content-Type: multipart/alternative;
 boundary="------------umbYD8oi4h9dzQad4PFY3gji"
Message-ID: <57bff06d-8582-6126-3098-7f69906ef7bf@189.cn>
Date: Thu, 23 Feb 2023 22:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm: add kms driver for loongson display controller
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Sui jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230205161724.488421-1-15330273260@189.cn>
 <1b9df663-5dbc-d7f2-a1d6-41594983f1f0@suse.de>
 <423287b6-a25e-299a-bb35-783507dcbf16@loongson.cn>
 <8f9a31fb-edb6-db16-414b-63cc574ce19c@suse.de>
 <96c4eb5b-aa5c-94c7-25b5-e1ea5a2612df@189.cn>
 <2478426e-11fd-de23-2059-e7b7249943c2@suse.de>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <2478426e-11fd-de23-2059-e7b7249943c2@suse.de>
X-Mailman-Approved-At: Sat, 25 Feb 2023 10:10:08 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------umbYD8oi4h9dzQad4PFY3gji
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2023/2/23 20:49, Thomas Zimmermann wrote:
> Hi
>
> Am 18.02.23 um 16:30 schrieb Sui Jingfeng:
> [...]
>>>
>>> No problem. I think I mentioned that it wouldn't make sense to merge 
>>> the DRM driver before ACPI and/or DT are ready. So we have time to 
>>> get the driver into good shape.
>>>
>> Sigh,  :(
>>
>> Then can we drop the support for SoC chips temporary,  and provide DT 
>> support at latter time?
>
> Yes, of course DT can be provided later when it is ready.  If you have 
> something that is currently usable, you can submit it. But if your 
> patch depends on other kernel features, those features should be ready 
> first. And if your driver cannot be used at all without those 
> features, there's no point in merging the driver until the feature is 
> ready.
>
After you said "It's also ok to to read version information from a status register."

I'm thinking this all night, this  sentence strike me.

Suddenly I remember that our CPU has version and features register.

It is called cpucfg[1] registers, cpucfg is also a instruction on 
LoongArch, it is similar like x86-64's cpuid instruction.

All LoongArch cpu support cpucfg, besides provide basic version 
information,  It is also provided features the per cpu supported.

For example:

LS3A5000 support LSX(128-bit SIMD) and LASX(256-bit SIMD), it has a 
0x0014c000  as its PRID.

LS2K2000 support LSX(128-bit SIMD) only, it has a 0x0014b000  as its 
process id.

LS2K1000 LA264 version support LSX(128-bit SIMD) only, it has a 
0x0014a000  as its PRID.

Despite the least significant 8 bit is revision number which suffer from 
change,

but bits 15:8 of the PRID register is unique per CPU. This 8 bits can be 
used to

identify the processor solely.  In fact, this register is also been used 
by the kernel

side programmer to expose CPU features to userspace(say /proc/cpuinfo).

It is also been used by compiler writer to generate difference code for 
different CPU.


The PRID register is located at the CPU side, not the DC device itself, 
this is a concern.

But by the time the device driver get loaded, it(cpucfg) is guaranteed  
can be used.


We can use the value read from this register to differentiate whether 
the host CPU

is a SoC or not.  v4 of this patch series already use this method to 
differentiate the chips.

The implement code is at lsdc_probe.c. Mips cpus of loongson have the 
similar prid register.


[1] 
https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN#_cpucfg

>>
>> this patch is target to providing the generic part of device driver 
>> support for Loongson integrated graphics.
>>
>> I see the double mention :(, but still want to make sure if it is 
>> negotiable. Because for the DC in our bridge chip,
>>
>> this driver can be probed reliably. The code size of this patch and 
>> the technical description needed is actually
>>
>> large enough for me to carry on.   If this is not negotiable, then it 
>> is ok to provide DT support at the next version of
>>
>> this patch?  it(dt support patch) tend to incurring  more criticize. 
>> I'm scared and not want to face it.
>
> As I said above, if the driver can already be used with the bridge 
> chip, reduce it to the required code. The DT support can be submitted 
> later on.
>
> In fact, you should try to reduce your initial driver to the minimum 
> size that is useable. Try to remove any feature or functionality that 
> is not critical to get something on the screen.  The initial driver 
> submission is the hardest.  Once the driver has been merged, it is 
> much easier to add new features and get them merged quickly.
>
> First-time submitters often think they have to provide a 
> feature-complete driver. So they send huge patches that are hard to 
> understand review.  Those drivers then end up in an endless cycle of 
> reviews.
>
> It's better to start small and grow the driver over time.
>

Yes, I always want upload the most complete version in the past.

but only find it actually not necessary, maybe we should  keep the 
uncommon chip back.

They bring unnecessary concerns to reviewers, sorry about that.

Focus on the chips which is most used maybe better (in a sense that 
people would like to use most).


Emm..., I will respect you opinions.

Would the method(differentiate by the cpu version provide by cpucfg) is 
acceptable?

If so we will not remove the code toward our SoC chip support.

I'm encourage leave those code there, we are really happy to see our SoC 
can use upstream kernel.

Because SoC is low cost, A few students and hobbyist may choose them to 
study programming.

> Best regards
> Thomas
>
>>
>> We can leave the support for our SoC as internal, those SoC are 
>> really target for low end application.
>>
>> keep them back is actually ok.
>>
>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> and prepare next version.
>>>>
>>>>>> +
>>>>>> +    return pci_register_driver(&lsdc_pci_driver);
>>>>>> +}
>>>>>> +module_init(lsdc_module_init);
>>>>>> +
>>>>>> +static void __exit lsdc_module_exit(void)
>>>>>> +{
>>>>>> +    pci_unregister_driver(&lsdc_pci_driver);
>>>>>> +}
>>>>>> +module_exit(lsdc_module_exit);
>>>>>> +
>>>>>> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
>>>>>> +MODULE_AUTHOR(DRIVER_AUTHOR);
>>>>>> +MODULE_DESCRIPTION(DRIVER_DESC);
>>>>>> +MODULE_LICENSE("GPL");
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_drv.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..d67dae0414ca
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
>>>>>> @@ -0,0 +1,274 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +/*
>>>>>> + * KMS driver for Loongson display controller
>>>>>> + * Copyright (C) 2022 Loongson Corporation
>>>>>> + *
>>>>>> + * Authors:
>>>>>> + *      Li Yi <liyi@loongson.cn>
>>>>>> + *      Li Chenyang <lichenyang@loongson.cn>
>>>>>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>> + */
>>>>>> +
>>>>>> +#ifndef __LSDC_DRV_H__
>>>>>> +#define __LSDC_DRV_H__
>>>>>> +
>>>>>> +#include <linux/i2c.h>
>>>>>> +#include <linux/i2c-algo-bit.h>
>>>>>> +
>>>>>> +#include <drm/drm_print.h>
>>>>>> +#include <drm/drm_device.h>
>>>>>> +#include <drm/drm_crtc.h>
>>>>>> +#include <drm/drm_plane.h>
>>>>>> +#include <drm/drm_connector.h>
>>>>>> +#include <drm/drm_encoder.h>
>>>>>> +#include <drm/drm_drv.h>
>>>>>> +#include <drm/drm_atomic.h>
>>>>>> +
>>>>>> +#include "lsdc_regs.h"
>>>>>> +#include "lsdc_pll.h"
>>>>>> +
>>>>>> +#define LSDC_NUM_CRTC           2
>>>>>> +
>>>>>> +/*
>>>>>> + * The display controller in LS7A2000 integrate three loongson 
>>>>>> self-made
>>>>>> + * encoder. Display pipe 0 has a transparent VGA encoder and a 
>>>>>> HDMI phy,
>>>>>> + * they are parallel. Display pipe 1 has only one HDMI phy.
>>>>>> + *       ______________________ _____________
>>>>>> + *      |             +-----+  | |             |
>>>>>> + *      | CRTC0 -+--> | VGA |  ----> VGA Connector ---> | VGA 
>>>>>> Monitor |<---+
>>>>>> + *      |        |    +-----+  | |_____________|    |
>>>>>> + *      |        |             | ______________    |
>>>>>> + *      |        |    +------+ | |              |   |
>>>>>> + *      |        +--> | HDMI | ----> HDMI Connector --> | HDMI 
>>>>>> Monitor |<--+
>>>>>> + *      |             +------+ | |______________|   |
>>>>>> + *      |            +------+ 
>>>>>> |                                           |
>>>>>> + *      |            | i2c6 | 
>>>>>> <-------------------------------------------+
>>>>>> + *      |            +------+  |
>>>>>> + *      |                      |
>>>>>> + *      |    DC in LS7A2000    |
>>>>>> + *      |                      |
>>>>>> + *      |            +------+  |
>>>>>> + *      |            | i2c7 | <--------------------------------+
>>>>>> + *      |            +------+  | |
>>>>>> + *      |                      | ______|_______
>>>>>> + *      |            +------+  | |              |
>>>>>> + *      | CRTC1 ---> | HDMI |  ----> HDMI Connector ---> | HDMI 
>>>>>> Monitor |
>>>>>> + *      |            +------+  | |______________|
>>>>>> + *      |______________________|
>>>>>> + *
>>>>>> + *
>>>>>> + * The display controller in LS7A1000 integrate two-way DVO, 
>>>>>> external
>>>>>> + * encoder is required except use directly with dpi(rgb888) panel.
>>>>>> + * ___________________ _________
>>>>>> + *      |            -------| |         |
>>>>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> 
>>>>>> | Display |
>>>>>> + *      |  _   _     -------|        ^             ^ |_________|
>>>>>> + *      | | | | |    -------|        |             |
>>>>>> + *      | |_| |_|    | i2c6 <--------+-------------+
>>>>>> + *      |            -------|
>>>>>> + *      |  _   _     -------|
>>>>>> + *      | | | | |    | i2c7 <--------+-------------+
>>>>>> + *      | |_| |_|    -------|        | | _________
>>>>>> + *      |            -------|        |             | |         |
>>>>>> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> 
>>>>>> | Panel  |
>>>>>> + *      |            -------| |_________|
>>>>>> + *      |___________________|
>>>>>> + *
>>>>>> + *
>>>>>> + * The display controller in LS2K1000.
>>>>>> + * ___________________ _________
>>>>>> + *      |            -------| |         |
>>>>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> 
>>>>>> | Display |
>>>>>> + *      |  _   _     -------|        ^              ^ |_________|
>>>>>> + *      | | | | |           |        |              |
>>>>>> + *      | |_| |_|           |     +------+          |
>>>>>> + *      |                   <---->| i2c0 |<---------+
>>>>>> + *      |  DC in LS2K1000   |     +------+
>>>>>> + *      |  _   _            |     +------+
>>>>>> + *      | | | | |           <---->| i2c1 |----------+
>>>>>> + *      | |_| |_|           |     +------+ | _________
>>>>>> + *      |            -------|        |              | |         |
>>>>>> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> 
>>>>>> | Panel  |
>>>>>> + *      |            -------| |_________|
>>>>>> + *      |___________________|
>>>>>> + *
>>>>>> + *
>>>>>> + * The display controller in LS2K0500, LS2K0500 has a built-in 
>>>>>> transparent
>>>>>> + * VGA encoder which is connected to display pipe 1(CRTC1).
>>>>>> + * ___________________ _________
>>>>>> + *      |            -------| |         |
>>>>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> 
>>>>>> | Display |
>>>>>> + *      |  _   _     -------|        ^              ^ |_________|
>>>>>> + *      | | | | |           |        |              |
>>>>>> + *      | |_| |_|           |     +------+          |
>>>>>> + *      |                   <---->| i2c4 |<---------+
>>>>>> + *      |  DC in LS2K0500   |     +------+
>>>>>> + *      |  _   _            |     +------+
>>>>>> + *      | | | | |           <---->| i2c5 |-------------------+
>>>>>> + *      | |_| |_|           |     +------+ ______|______
>>>>>> + *      |           +-----+ | |             |
>>>>>> + *      | CRTC1 --> | VGA | ------------------------> | VGA 
>>>>>> Monitor |
>>>>>> + *      |           +-----+ | |_____________|
>>>>>> + *      |___________________|
>>>>>> + *
>>>>>> + * LS7A1000 and LS7A2000 are bridge chips, has dedicated Video RAM.
>>>>>> + * while LS2K2000/LS2K1000/LS2K0500 are SoC, they don't have 
>>>>>> dediacated
>>>>>> + * Video RAM. The dc in LS2K2000 is basicly same with the dc in 
>>>>>> LS7A1000
>>>>>> + * except that LS2K2000 don't have a video RAM and have only one 
>>>>>> built-in
>>>>>> + * hdmi encoder.
>>>>>> + *
>>>>>> + * There is only a 1:1 mapping of encoders and connectors for 
>>>>>> the DC,
>>>>>> + * each CRTC have two FB address registers.
>>>>>> + */
>>>>>> +
>>>>>> +enum loongson_chip_family {
>>>>>> +    CHIP_UNKNOWN = 0,
>>>>>> +    CHIP_LS7A1000 = 1,  /* North bridge of 
>>>>>> LS3A3000/LS3A4000/LS3A5000 */
>>>>>> +    CHIP_LS7A2000 = 2,  /* Update version of LS7A1000, with 
>>>>>> built-in HDMI encoder */
>>>>>> +    CHIP_LS2K0500 = 3,  /* Reduced version of LS2K1000, single 
>>>>>> core */
>>>>>> +    CHIP_LS2K1000 = 4,  /* 2-Core Mips64r2/LA264 SoC, 64-bit, 
>>>>>> 1.0 Ghz */
>>>>>> +    CHIP_LS2K2000 = 5,  /* 2-Core 64-bit LA364 SoC, 1.2 ~ 1.5 
>>>>>> Ghz */
>>>>>> +    CHIP_LAST,
>>>>>> +};
>>>>>> +
>>>>>> +struct lsdc_desc {
>>>>>> +    enum loongson_chip_family chip;
>>>>>> +    u32 num_of_crtc;
>>>>>> +    u32 max_pixel_clk;
>>>>>> +    u32 max_width;
>>>>>> +    u32 max_height;
>>>>>> +    u32 num_of_hw_cursor;
>>>>>> +    u32 hw_cursor_w;
>>>>>> +    u32 hw_cursor_h;
>>>>>> +    u32 pitch_align;  /* DMA alignment constraint */
>>>>>> +    u64 mc_bits;      /* physical address bus bit width */
>>>>>> +    bool has_vblank_counter;
>>>>>> +    bool has_builtin_i2c;
>>>>>> +    bool has_vram;
>>>>>> +    bool has_hpd_reg;
>>>>>> +    bool is_soc;
>>>>>> +};
>>>>>> +
>>>>>> +struct lsdc_i2c {
>>>>>> +    struct i2c_adapter adapter;
>>>>>> +    struct i2c_algo_bit_data bit;
>>>>>> +    struct drm_device *ddev;
>>>>>> +    void __iomem *reg_base;
>>>>>> +    void __iomem *dir_reg;
>>>>>> +    void __iomem *dat_reg;
>>>>>> +    /* pin bit mask */
>>>>>> +    u8 sda;
>>>>>> +    u8 scl;
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * struct lsdc_display_pipe - Abstraction of hardware display 
>>>>>> pipeline.
>>>>>> + * @crtc: CRTC control structure
>>>>>> + * @primary: framebuffer plane control structure
>>>>>> + * @cursor: cursor plane control structure
>>>>>> + * @output: output control structure of this display pipe bind
>>>>>> + * @pixpll: pixel pll control structure
>>>>>> + * @index: the index corresponding to the hardware display pipe
>>>>>> + */
>>>>>> +struct lsdc_display_pipe {
>>>>>> +    struct drm_crtc crtc;
>>>>>> +    struct drm_plane primary;
>>>>>> +    struct drm_plane cursor;
>>>>>> +    struct drm_encoder encoder;
>>>>>> +    struct drm_connector connector;
>>>>>> +    struct lsdc_pll pixpll;
>>>>>> +    struct lsdc_i2c *li2c;
>>>>>> +    int index;
>>>>>> +};
>>>>>> +
>>>>>> +static inline struct lsdc_display_pipe *
>>>>>> +crtc_to_display_pipe(struct drm_crtc *crtc)
>>>>>> +{
>>>>>> +    return container_of(crtc, struct lsdc_display_pipe, crtc);
>>>>>> +}
>>>>>> +
>>>>>> +static inline struct lsdc_display_pipe *
>>>>>> +cursor_to_display_pipe(struct drm_plane *cursor)
>>>>>> +{
>>>>>> +    return container_of(cursor, struct lsdc_display_pipe, cursor);
>>>>>> +}
>>>>>> +
>>>>>> +static inline struct lsdc_display_pipe *
>>>>>> +connector_to_display_pipe(struct drm_connector *conn)
>>>>>> +{
>>>>>> +    return container_of(conn, struct lsdc_display_pipe, connector);
>>>>>> +}
>>>>>> +
>>>>>> +static inline struct lsdc_display_pipe *
>>>>>> +encoder_to_display_pipe(struct drm_encoder *enc)
>>>>>> +{
>>>>>> +    return container_of(enc, struct lsdc_display_pipe, encoder);
>>>>>> +}
>>>>>> +
>>>>>> +struct lsdc_crtc_state {
>>>>>> +    struct drm_crtc_state base;
>>>>>> +    struct lsdc_pll_parms pparms;
>>>>>> +};
>>>>>> +
>>>>>> +struct lsdc_device {
>>>>>> +    struct drm_device base;
>>>>>> +
>>>>>> +    /* @reglock: protects concurrent register access */
>>>>>> +    spinlock_t reglock;
>>>>>> +    void __iomem *reg_base;
>>>>>> +    void __iomem *vram;
>>>>>> +    resource_size_t vram_base;
>>>>>> +    resource_size_t vram_size;
>>>>>> +    u64 mc_mask;
>>>>>> +
>>>>>> +    struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
>>>>>> +
>>>>>> +    /* @num_output: count the number of active display pipe */
>>>>>> +    unsigned int num_output;
>>>>>> +
>>>>>> +    /* @descp: features description of the DC variant */
>>>>>> +    const struct lsdc_desc *descp;
>>>>>> +
>>>>>> +    u32 irq_status;
>>>>>> +};
>>>>>> +
>>>>>> +static inline struct lsdc_device *
>>>>>> +to_lsdc(struct drm_device *ddev)
>>>>>> +{
>>>>>> +    return container_of(ddev, struct lsdc_device, base);
>>>>>> +}
>>>>>> +
>>>>>> +static inline struct lsdc_crtc_state *
>>>>>> +to_lsdc_crtc_state(struct drm_crtc_state *base)
>>>>>> +{
>>>>>> +    return container_of(base, struct lsdc_crtc_state, base);
>>>>>> +}
>>>>>> +
>>>>>> +void lsdc_debugfs_init(struct drm_minor *minor);
>>>>>> +
>>>>>> +int lsdc_crtc_init(struct drm_device *ddev,
>>>>>> +           struct drm_crtc *crtc,
>>>>>> +           unsigned int index,
>>>>>> +           struct drm_plane *primary,
>>>>>> +           struct drm_plane *cursor);
>>>>>> +
>>>>>> +int lsdc_plane_init(struct lsdc_device *ldev,
>>>>>> +            struct drm_plane *plane,
>>>>>> +            enum drm_plane_type type,
>>>>>> +            unsigned int index);
>>>>>> +
>>>>>> +int lsdc_create_output(struct lsdc_device *ldev, unsigned int 
>>>>>> index);
>>>>>> +
>>>>>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
>>>>>> +                      void *base,
>>>>>> +                      unsigned int index);
>>>>>> +
>>>>>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device 
>>>>>> *ldev, int index);
>>>>>> +
>>>>>> +irqreturn_t lsdc_irq_thread_handler(int irq, void *arg);
>>>>>> +irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev);
>>>>>> +
>>>>>> +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32 offset);
>>>>>> +void lsdc_wreg32(struct lsdc_device * const ldev, u32 offset, 
>>>>>> u32 val);
>>>>>> +
>>>>>> +#endif
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..b380098409ca
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>>>>>> @@ -0,0 +1,201 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include <linux/i2c.h>
>>>>>> +#include <drm/drm_managed.h>
>>>>>> +#include "lsdc_drv.h"
>>>>>> +#include "lsdc_regs.h"
>>>>>> +
>>>>>> +/*
>>>>>> + * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by 
>>>>>> mask
>>>>>> + * @mask: gpio pin mask
>>>>>> + * @state: "0" for low, "1" for high
>>>>>> + */
>>>>>> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int 
>>>>>> mask, int state)
>>>>>> +{
>>>>>> +    struct lsdc_device *ldev = to_lsdc(li2c->ddev);
>>>>>> +    unsigned long flags;
>>>>>> +    u8 val;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    if (state) {
>>>>>> +        /*
>>>>>> +         * Setting this pin as input directly, write 1 for Input.
>>>>>> +         * The external pull-up resistor will pull the level up
>>>>>> +         */
>>>>>> +        val = readb(li2c->dir_reg);
>>>>>> +        val |= mask;
>>>>>> +        writeb(val, li2c->dir_reg);
>>>>>> +    } else {
>>>>>> +        /* First set this pin as output, write 0 for Output */
>>>>>> +        val = readb(li2c->dir_reg);
>>>>>> +        val &= ~mask;
>>>>>> +        writeb(val, li2c->dir_reg);
>>>>>> +
>>>>>> +        /* Then, make this pin output 0 */
>>>>>> +        val = readb(li2c->dat_reg);
>>>>>> +        val &= ~mask;
>>>>>> +        writeb(val, li2c->dat_reg);
>>>>>> +    }
>>>>>> +
>>>>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * ls7a_gpio_i2c_get - read value back from the gpio pin 
>>>>>> indicated by mask
>>>>>> + * @mask: gpio pin mask
>>>>>> + * return "0" for low, "1" for high
>>>>>> + */
>>>>>> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const li2c, int 
>>>>>> mask)
>>>>>> +{
>>>>>> +    struct lsdc_device *ldev = to_lsdc(li2c->ddev);
>>>>>> +    unsigned long flags;
>>>>>> +    u8 val;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    /* First set this pin as input */
>>>>>> +    val = readb(li2c->dir_reg);
>>>>>> +    val |= mask;
>>>>>> +    writeb(val, li2c->dir_reg);
>>>>>> +
>>>>>> +    /* Then get level state from this pin */
>>>>>> +    val = readb(li2c->dat_reg);
>>>>>> +
>>>>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    return (val & mask) ? 1 : 0;
>>>>>> +}
>>>>>> +
>>>>>> +static void ls7a_i2c_set_sda(void *i2c, int state)
>>>>>> +{
>>>>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>>>>> +    /* set state on the li2c->sda pin */
>>>>>> +    return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
>>>>>> +}
>>>>>> +
>>>>>> +static void ls7a_i2c_set_scl(void *i2c, int state)
>>>>>> +{
>>>>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>>>>> +    /* set state on the li2c->scl pin */
>>>>>> +    return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
>>>>>> +}
>>>>>> +
>>>>>> +static int ls7a_i2c_get_sda(void *i2c)
>>>>>> +{
>>>>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>>>>> +    /* read value from the li2c->sda pin */
>>>>>> +    return ls7a_gpio_i2c_get(li2c, li2c->sda);
>>>>>> +}
>>>>>> +
>>>>>> +static int ls7a_i2c_get_scl(void *i2c)
>>>>>> +{
>>>>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>>>>> +    /* read the value from the li2c->scl pin */
>>>>>> +    return ls7a_gpio_i2c_get(li2c, li2c->scl);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
>>>>>> +{
>>>>>> +    struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
>>>>>> +
>>>>>> +    if (li2c) {
>>>>>> +        i2c_del_adapter(&li2c->adapter);
>>>>>> +        kfree(li2c);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * The DC in ls7a1000/ls7a2000 have builtin gpio hardware
>>>>>> + *
>>>>>> + * @base: gpio reg base
>>>>>> + * @index: output channel index, 0 for DVO0, 1 for DVO1
>>>>>> + */
>>>>>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
>>>>>> +                      void *base,
>>>>>> +                      unsigned int index)
>>>>>> +{
>>>>>> +    struct i2c_adapter *adapter;
>>>>>> +    struct lsdc_i2c *li2c;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
>>>>>> +    if (!li2c)
>>>>>> +        return ERR_PTR(-ENOMEM);
>>>>>> +
>>>>>> +    if (index == 0) {
>>>>>> +        li2c->sda = 0x01;  /* pin 0 */
>>>>>> +        li2c->scl = 0x02;  /* pin 1 */
>>>>>> +    } else if (index == 1) {
>>>>>> +        li2c->sda = 0x04;  /* pin 2 */
>>>>>> +        li2c->scl = 0x08;  /* pin 3 */
>>>>>> +    }
>>>>>> +
>>>>>> +    li2c->reg_base = base;
>>>>>> +    li2c->ddev = ddev;
>>>>>> +    li2c->dir_reg = li2c->reg_base + LS7A_DC_GPIO_DIR_REG;
>>>>>> +    li2c->dat_reg = li2c->reg_base + LS7A_DC_GPIO_DAT_REG;
>>>>>> +
>>>>>> +    li2c->bit.setsda = ls7a_i2c_set_sda;
>>>>>> +    li2c->bit.setscl = ls7a_i2c_set_scl;
>>>>>> +    li2c->bit.getsda = ls7a_i2c_get_sda;
>>>>>> +    li2c->bit.getscl = ls7a_i2c_get_scl;
>>>>>> +    li2c->bit.udelay = 5;
>>>>>> +    li2c->bit.timeout = usecs_to_jiffies(2200);
>>>>>> +    li2c->bit.data = li2c;
>>>>>> +
>>>>>> +    adapter = &li2c->adapter;
>>>>>> +    adapter->algo_data = &li2c->bit;
>>>>>> +    adapter->owner = THIS_MODULE;
>>>>>> +    adapter->class = I2C_CLASS_DDC;
>>>>>> +    adapter->dev.parent = ddev->dev;
>>>>>> +    adapter->nr = -1;
>>>>>> +
>>>>>> +    snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", 
>>>>>> index);
>>>>>> +
>>>>>> +    i2c_set_adapdata(adapter, li2c);
>>>>>> +
>>>>>> +    ret = i2c_bit_add_bus(adapter);
>>>>>> +    if (ret) {
>>>>>> +        kfree(li2c);
>>>>>> +        return ERR_PTR(ret);
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = drmm_add_action_or_reset(ddev, lsdc_destroy_i2c, li2c);
>>>>>> +    if (ret)
>>>>>> +        return NULL;
>>>>>> +
>>>>>> +    drm_info(ddev, "%s(sda=%u, scl=%u) created for connector-%u\n",
>>>>>> +         adapter->name, li2c->sda, li2c->scl, index);
>>>>>> +
>>>>>> +    return li2c;
>>>>>> +}
>>>>>> +
>>>>>> +static int lsdc_get_i2c_id(struct lsdc_device *ldev, int index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS2K1000)
>>>>>> +        return index;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS2K0500)
>>>>>> +        return index + 2;
>>>>>> +
>>>>>> +    return index;
>>>>>> +}
>>>>>> +
>>>>>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev,
>>>>>> +                     int index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +    struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
>>>>>> +
>>>>>> +    if (descp->has_builtin_i2c) {
>>>>>> +        struct lsdc_i2c *li2c = dispipe->li2c;
>>>>>> +
>>>>>> +        if (li2c)
>>>>>> +            return &li2c->adapter;
>>>>>> +    }
>>>>>> +
>>>>>> +    return i2c_get_adapter(lsdc_get_i2c_id(ldev, index));
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_irq.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..71c85f09bb6f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
>>>>>> @@ -0,0 +1,86 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include <drm/drm_vblank.h>
>>>>>> +#include "lsdc_drv.h"
>>>>>> +#include "lsdc_regs.h"
>>>>>> +
>>>>>> +/*
>>>>>> + * For the DC in ls7a2000, clearing interrupt status is achieved by
>>>>>> + * write "1" to LSDC_INT_REG, For the DC in ls7a1000, ls2k1000 and
>>>>>> + * ls2k0500, clearing interrupt status is achieved by write "0" to
>>>>>> + * LSDC_INT_REG. Two different hardware engineer of Loongson modify
>>>>>> + * it as their will.
>>>>>> + */
>>>>>> +
>>>>>> +/* For the DC in ls7a2000 */
>>>>>> +static irqreturn_t lsdc_irq_handler(int irq, void *arg)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = arg;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* Read the interrupt status */
>>>>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>>>>> +    if ((val & INT_STATUS_MASK) == 0) {
>>>>>> +        drm_warn(ddev, "no interrupt occurs\n");
>>>>>> +        return IRQ_NONE;
>>>>>> +    }
>>>>>> +
>>>>>> +    ldev->irq_status = val;
>>>>>> +
>>>>>> +    /* write "1" to clear the interrupt status */
>>>>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val);
>>>>>> +
>>>>>> +    return IRQ_WAKE_THREAD;
>>>>>> +}
>>>>>> +
>>>>>> +/* For the DC in ls7a1000, ls2k1000 and ls2k0500 */
>>>>>> +static irqreturn_t lsdc_irq_handler_legacy(int irq, void *arg)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = arg;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* Read the interrupt status */
>>>>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>>>>> +    if ((val & INT_STATUS_MASK) == 0) {
>>>>>> +        drm_warn(ddev, "no interrupt occurs\n");
>>>>>> +        return IRQ_NONE;
>>>>>> +    }
>>>>>> +
>>>>>> +    ldev->irq_status = val;
>>>>>> +
>>>>>> +    /* write "0" to clear the interrupt status */
>>>>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val & ~INT_STATUS_MASK);
>>>>>> +
>>>>>> +    return IRQ_WAKE_THREAD;
>>>>>> +}
>>>>>> +
>>>>>> +irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A2000)
>>>>>> +        return lsdc_irq_handler;
>>>>>> +
>>>>>> +    return lsdc_irq_handler_legacy;
>>>>>> +}
>>>>>> +
>>>>>> +irqreturn_t lsdc_irq_thread_handler(int irq, void *arg)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = arg;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct drm_crtc *crtc;
>>>>>> +
>>>>>> +    if (ldev->irq_status & INT_CRTC0_VSYNC) {
>>>>>> +        crtc = drm_crtc_from_index(ddev, 0);
>>>>>> +        drm_crtc_handle_vblank(crtc);
>>>>>> +    }
>>>>>> +
>>>>>> +    if (ldev->irq_status & INT_CRTC1_VSYNC) {
>>>>>> +        crtc = drm_crtc_from_index(ddev, 1);
>>>>>> +        drm_crtc_handle_vblank(crtc);
>>>>>> +    }
>>>>>> +
>>>>>> +    return IRQ_HANDLED;
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_output.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_output.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..d4bc7666d9ea
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_output.c
>>>>>> @@ -0,0 +1,452 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include <drm/drm_edid.h>
>>>>>> +#include <drm/drm_probe_helper.h>
>>>>>> +#include <drm/drm_atomic_helper.h>
>>>>>> +#include <drm/drm_connector.h>
>>>>>> +#include "lsdc_drv.h"
>>>>>> +
>>>>>> +static int lsdc_get_modes(struct drm_connector *connector)
>>>>>> +{
>>>>>> +    unsigned int num = 0;
>>>>>> +    struct edid *edid;
>>>>>> +
>>>>>> +    if (connector->ddc) {
>>>>>> +        edid = drm_get_edid(connector, connector->ddc);
>>>>>> +        if (edid) {
>>>>>> + drm_connector_update_edid_property(connector, edid);
>>>>>> +            num = drm_add_edid_modes(connector, edid);
>>>>>> +            kfree(edid);
>>>>>> +        }
>>>>>> +
>>>>>> +        return num;
>>>>>> +    }
>>>>>> +
>>>>>> +    num = drm_add_modes_noedid(connector, 1920, 1200);
>>>>>> +
>>>>>> +    drm_set_preferred_mode(connector, 1024, 768);
>>>>>> +
>>>>>> +    return num;
>>>>>> +}
>>>>>> +
>>>>>> +static enum drm_connector_status
>>>>>> +lsdc_unknown_connector_detect(struct drm_connector *connector, 
>>>>>> bool force)
>>>>>> +{
>>>>>> +    struct i2c_adapter *ddc = connector->ddc;
>>>>>> +
>>>>>> +    if (ddc) {
>>>>>> +        if (drm_probe_ddc(ddc))
>>>>>> +            return connector_status_connected;
>>>>>> +    } else {
>>>>>> +        if (connector->connector_type == DRM_MODE_CONNECTOR_DPI)
>>>>>> +            return connector_status_connected;
>>>>>> +
>>>>>> +        if (connector->connector_type == 
>>>>>> DRM_MODE_CONNECTOR_VIRTUAL)
>>>>>> +            return connector_status_connected;
>>>>>> +    }
>>>>>> +
>>>>>> +    return connector_status_unknown;
>>>>>> +}
>>>>>> +
>>>>>> +static enum drm_connector_status
>>>>>> +lsdc_hdmi_connector_detect(struct drm_connector *connector, bool 
>>>>>> force)
>>>>>> +{
>>>>>> +    struct lsdc_display_pipe *pipe = 
>>>>>> connector_to_display_pipe(connector);
>>>>>> +    struct lsdc_device *ldev = to_lsdc(connector->dev);
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
>>>>>> +
>>>>>> +    if (pipe->index == 0) {
>>>>>> +        if (val & HDMI0_HPD_FLAG)
>>>>>> +            return connector_status_connected;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (pipe->index == 1) {
>>>>>> +        if (val & HDMI1_HPD_FLAG)
>>>>>> +            return connector_status_connected;
>>>>>> +    }
>>>>>> +
>>>>>> +    return connector_status_disconnected;
>>>>>> +}
>>>>>> +
>>>>>> +static enum drm_connector_status
>>>>>> +lsdc_hdmi_vga_connector_detect(struct drm_connector *connector, 
>>>>>> bool force)
>>>>>> +{
>>>>>> +    struct lsdc_display_pipe *pipe = 
>>>>>> connector_to_display_pipe(connector);
>>>>>> +    struct drm_device *ddev = connector->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct i2c_adapter *ddc;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
>>>>>> +
>>>>>> +    if (pipe->index == 1) {
>>>>>> +        if (val & HDMI1_HPD_FLAG)
>>>>>> +            return connector_status_connected;
>>>>>> +
>>>>>> +        return connector_status_disconnected;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (pipe->index == 0) {
>>>>>> +        if (val & HDMI0_HPD_FLAG)
>>>>>> +            return connector_status_connected;
>>>>>> +
>>>>>> +        ddc = connector->ddc;
>>>>>> +        if (ddc) {
>>>>>> +            if (drm_probe_ddc(ddc))
>>>>>> +                return connector_status_connected;
>>>>>> +
>>>>>> +            return connector_status_disconnected;
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return connector_status_unknown;
>>>>>> +}
>>>>>> +
>>>>>> +static struct drm_encoder *
>>>>>> +lsdc_connector_get_best_encoder(struct drm_connector *connector,
>>>>>> +                struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct lsdc_display_pipe *pipe = 
>>>>>> connector_to_display_pipe(connector);
>>>>>> +
>>>>>> +    return &pipe->encoder;
>>>>>> +}
>>>>>> +
>>>>>> +static const struct drm_connector_helper_funcs 
>>>>>> lsdc_connector_helpers = {
>>>>>> +    .atomic_best_encoder = lsdc_connector_get_best_encoder,
>>>>>> +    .get_modes = lsdc_get_modes,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_connector_funcs 
>>>>>> lsdc_unknown_connector_funcs = {
>>>>>> +    .detect = lsdc_unknown_connector_detect,
>>>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>>>>> +    .destroy = drm_connector_cleanup,
>>>>>> +    .reset = drm_atomic_helper_connector_reset,
>>>>>> +    .atomic_duplicate_state = 
>>>>>> drm_atomic_helper_connector_duplicate_state,
>>>>>> +    .atomic_destroy_state = 
>>>>>> drm_atomic_helper_connector_destroy_state,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_connector_funcs 
>>>>>> lsdc_hdmi_vga_connector_funcs = {
>>>>>> +    .detect = lsdc_hdmi_vga_connector_detect,
>>>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>>>>> +    .destroy = drm_connector_cleanup,
>>>>>> +    .reset = drm_atomic_helper_connector_reset,
>>>>>> +    .atomic_duplicate_state = 
>>>>>> drm_atomic_helper_connector_duplicate_state,
>>>>>> +    .atomic_destroy_state = 
>>>>>> drm_atomic_helper_connector_destroy_state,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_connector_funcs 
>>>>>> lsdc_hdmi_connector_funcs = {
>>>>>> +    .detect = lsdc_hdmi_connector_detect,
>>>>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>>>>> +    .destroy = drm_connector_cleanup,
>>>>>> +    .reset = drm_atomic_helper_connector_reset,
>>>>>> +    .atomic_duplicate_state = 
>>>>>> drm_atomic_helper_connector_duplicate_state,
>>>>>> +    .atomic_destroy_state = 
>>>>>> drm_atomic_helper_connector_destroy_state,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_connector_funcs *
>>>>>> +lsdc_get_connector_func(struct lsdc_device *ldev, unsigned int 
>>>>>> index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A2000) {
>>>>>> +        if (index == 0)
>>>>>> +            return &lsdc_hdmi_vga_connector_funcs;
>>>>>> +
>>>>>> +        if (index == 1)
>>>>>> +            return &lsdc_hdmi_connector_funcs;
>>>>>> +    }
>>>>>> +
>>>>>> +    return &lsdc_unknown_connector_funcs;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * we provide a default support before DT/VBIOS is supported
>>>>>> + */
>>>>>> +static int lsdc_get_encoder_type(struct lsdc_device *ldev,
>>>>>> +                 unsigned int index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A2000) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_ENCODER_DAC;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_ENCODER_TMDS;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>>>>> CHIP_LS2K1000) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_ENCODER_DPI;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_ENCODER_DPI;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS2K0500) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_ENCODER_DPI;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_ENCODER_DAC;
>>>>>> +    }
>>>>>> +
>>>>>> +    return DRM_MODE_ENCODER_NONE;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * provide a default before DT/VBIOS support is upstreamed
>>>>>> + */
>>>>>> +static int lsdc_get_connector_type(struct lsdc_device *ldev,
>>>>>> +                   unsigned int index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A2000) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_CONNECTOR_VGA;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_CONNECTOR_HDMIA;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>>>>> CHIP_LS2K1000) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_CONNECTOR_DPI;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_CONNECTOR_DPI;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS2K0500) {
>>>>>> +        if (index == 0)
>>>>>> +            return DRM_MODE_CONNECTOR_DPI;
>>>>>> +        if (index == 1)
>>>>>> +            return DRM_MODE_CONNECTOR_VGA;
>>>>>> +    }
>>>>>> +
>>>>>> +    return DRM_MODE_CONNECTOR_Unknown;
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_hdmi_disable(struct drm_encoder *encoder)
>>>>>> +{
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> encoder_to_display_pipe(encoder);
>>>>>> +    struct drm_device *ddev = encoder->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    unsigned int index = dispipe->index;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    if (index == 0)
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG);
>>>>>> +    else if (index == 1)
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG);
>>>>>> +
>>>>>> +    val &= ~HDMI_PHY_EN;
>>>>>> +
>>>>>> +    if (index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
>>>>>> +    else if (index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "HDMI-%u disabled\n", index);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_hdmi_enable(struct drm_encoder *encoder)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = encoder->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> encoder_to_display_pipe(encoder);
>>>>>> +    unsigned int index = dispipe->index;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* we are using software gpio emulated i2c */
>>>>>> +    val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
>>>>>> +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
>>>>>> +
>>>>>> +    if (index == 0) {
>>>>>> +        /* Enable HDMI-0 */
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
>>>>>> +
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_ZONE_REG, 0x00400040);
>>>>>> +    } else if (index == 1) {
>>>>>> +        /* Enable HDMI-1 */
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
>>>>>> +
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_ZONE_REG, 0x00400040);
>>>>>> +    }
>>>>>> +
>>>>>> +    val = HDMI_PHY_TERM_STATUS |
>>>>>> +          HDMI_PHY_TERM_DET_EN |
>>>>>> +          HDMI_PHY_TERM_H_EN |
>>>>>> +          HDMI_PHY_TERM_L_EN |
>>>>>> +          HDMI_PHY_RESET_N |
>>>>>> +          HDMI_PHY_EN;
>>>>>> +
>>>>>> +    if (index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
>>>>>> +    else if (index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "HDMI-%u enabled\n", index);
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + *  Fout = M * Fin
>>>>>> + *
>>>>>> + *  M = (4 * LF) / (IDF * ODF)
>>>>>> + *
>>>>>> + *  Loongson HDMI require M = 10
>>>>>> + */
>>>>>> +static void lsdc_hdmi_phy_pll_config(struct lsdc_device *ldev,
>>>>>> +                     int index,
>>>>>> +                     int clock)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = &ldev->base;
>>>>>> +    int count = 0;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* disable phy pll */
>>>>>> +    if (index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, 0x0);
>>>>>> +    else if (index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, 0x0);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * 10 = (4 * 40) / (8 * 2)
>>>>>> +     */
>>>>>> +    val = (8 << HDMI_PLL_IDF_SHIFT) |
>>>>>> +          (40 << HDMI_PLL_LF_SHIFT) |
>>>>>> +          (1 << HDMI_PLL_ODF_SHIFT) |
>>>>>> +          HDMI_PLL_ENABLE;
>>>>>> +
>>>>>> +    drm_dbg(ddev, "HDMI-%u clock: %d\n", index, clock);
>>>>>> +
>>>>>> +    if (index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, val);
>>>>>> +    else if (index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, val);
>>>>>> +
>>>>>> +    /* wait hdmi phy pll lock */
>>>>>> +    do {
>>>>>> +        if (index == 0)
>>>>>> +            val = lsdc_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG);
>>>>>> +        else if (index == 1)
>>>>>> +            val = lsdc_rreg32(ldev, LSDC_HDMI1_PHY_PLL_REG);
>>>>>> +
>>>>>> +        ++count;
>>>>>> +
>>>>>> +        if (val & HDMI_PLL_LOCKED) {
>>>>>> +            drm_dbg(ddev, "Setting HDMI-%u PLL success(take %d 
>>>>>> cycles)\n",
>>>>>> +                index, count);
>>>>>> +            break;
>>>>>> +        }
>>>>>> +    } while (count < 1000);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_hdmi_atomic_mode_set(struct drm_encoder *encoder,
>>>>>> +                      struct drm_crtc_state *crtc_state,
>>>>>> +                      struct drm_connector_state *conn_state)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = encoder->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> encoder_to_display_pipe(encoder);
>>>>>> +    unsigned int index = dispipe->index;
>>>>>> +    struct drm_display_mode *mode = &crtc_state->mode;
>>>>>> +
>>>>>> +    lsdc_hdmi_phy_pll_config(ldev, index, mode->clock);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "HDMI-%u modeset\n", index);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct drm_encoder_helper_funcs 
>>>>>> lsdc_hdmi_helper_funcs = {
>>>>>> +    .disable = lsdc_hdmi_disable,
>>>>>> +    .enable = lsdc_hdmi_enable,
>>>>>> +    .atomic_mode_set = lsdc_hdmi_atomic_mode_set,
>>>>>> +};
>>>>>> +
>>>>>> +static void lsdc_hdmi_reset(struct drm_encoder *encoder)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = encoder->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> encoder_to_display_pipe(encoder);
>>>>>> +    unsigned int index = dispipe->index;
>>>>>> +    u32 val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
>>>>>> +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
>>>>>> +
>>>>>> +    lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
>>>>>> +    lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "HDMI-%u Reset\n", index);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct drm_encoder_funcs lsdc_encoder_funcs = {
>>>>>> +    .reset = lsdc_hdmi_reset,
>>>>>> +    .destroy = drm_encoder_cleanup,
>>>>>> +};
>>>>>> +
>>>>>> +int lsdc_create_output(struct lsdc_device *ldev, unsigned int 
>>>>>> index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +    struct drm_device *ddev = &ldev->base;
>>>>>> +    struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
>>>>>> +    struct drm_encoder *encoder = &dispipe->encoder;
>>>>>> +    struct drm_connector *connector = &dispipe->connector;
>>>>>> +    struct i2c_adapter *ddc = NULL;
>>>>>> +    struct lsdc_i2c *li2c;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = drm_encoder_init(ddev,
>>>>>> +                   encoder,
>>>>>> +                   &lsdc_encoder_funcs,
>>>>>> +                   lsdc_get_encoder_type(ldev, index),
>>>>>> +                   "encoder-%u",
>>>>>> +                   index);
>>>>>> +    if (ret) {
>>>>>> +        drm_err(ddev, "Failed to init encoder: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    encoder->possible_crtcs = BIT(index);
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A2000)
>>>>>> +        drm_encoder_helper_add(encoder, &lsdc_hdmi_helper_funcs);
>>>>>> +
>>>>>> +    if (descp->has_builtin_i2c) {
>>>>>> +        li2c = lsdc_create_i2c_chan(ddev, ldev->reg_base, index);
>>>>>> +        if (IS_ERR(li2c))
>>>>>> +            return PTR_ERR(li2c);
>>>>>> +
>>>>>> +        dispipe->li2c = li2c;
>>>>>> +
>>>>>> +        ddc = &li2c->adapter;
>>>>>> +    } else {
>>>>>> +        ddc = lsdc_get_i2c_adapter(ldev, index);
>>>>>> +        if (IS_ERR(ddc)) {
>>>>>> +            drm_err(ddev, "Error get ddc for output-%u\n", index);
>>>>>> +            return PTR_ERR(ddc);
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = drm_connector_init_with_ddc(ddev,
>>>>>> +                      connector,
>>>>>> +                      lsdc_get_connector_func(ldev, index),
>>>>>> +                      lsdc_get_connector_type(ldev, index),
>>>>>> +                      ddc);
>>>>>> +    if (ret) {
>>>>>> +        drm_err(ddev, "Init connector-%d failed\n", index);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    drm_connector_helper_add(connector, &lsdc_connector_helpers);
>>>>>> +
>>>>>> +    drm_connector_attach_encoder(connector, encoder);
>>>>>> +
>>>>>> +    connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>>>>>> +                DRM_CONNECTOR_POLL_DISCONNECT;
>>>>>> +
>>>>>> +    connector->interlace_allowed = 0;
>>>>>> +    connector->doublescan_allowed = 0;
>>>>>> +
>>>>>> +    ldev->num_output++;
>>>>>> +
>>>>>> +    drm_info(ddev, "output-%u initialized\n", index);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_plane.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..0f779c97d53b
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
>>>>>> @@ -0,0 +1,443 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include <drm/drm_atomic.h>
>>>>>> +#include <drm/drm_atomic_helper.h>
>>>>>> +#include <drm/drm_framebuffer.h>
>>>>>> +#include <drm/drm_plane_helper.h>
>>>>>> +#include <drm/drm_gem_vram_helper.h>
>>>>>> +#include "lsdc_drv.h"
>>>>>> +#include "lsdc_regs.h"
>>>>>> +#include "lsdc_pll.h"
>>>>>> +
>>>>>> +static const u32 lsdc_primary_formats[] = {
>>>>>> +    DRM_FORMAT_XRGB8888,
>>>>>> +    DRM_FORMAT_ARGB8888,
>>>>>> +};
>>>>>> +
>>>>>> +static const u32 lsdc_cursor_formats[] = {
>>>>>> +    DRM_FORMAT_ARGB8888,
>>>>>> +};
>>>>>> +
>>>>>> +static const u64 lsdc_fb_format_modifiers[] = {
>>>>>> +    DRM_FORMAT_MOD_LINEAR,
>>>>>> +    DRM_FORMAT_MOD_INVALID
>>>>>> +};
>>>>>> +
>>>>>> +static void lsdc_update_fb_format(struct lsdc_device *ldev,
>>>>>> +                  struct drm_crtc *crtc,
>>>>>> +                  const struct drm_format_info *fmt_info)
>>>>>> +{
>>>>>> +    unsigned int index = drm_crtc_index(crtc);
>>>>>> +    u32 val;
>>>>>> +    u32 fmt;
>>>>>> +
>>>>>> +    switch (fmt_info->format) {
>>>>>> +    case DRM_FORMAT_XRGB8888:
>>>>>> +        fmt = LSDC_PF_XRGB8888;
>>>>>> +        break;
>>>>>> +    case DRM_FORMAT_ARGB8888:
>>>>>> +        fmt = LSDC_PF_XRGB8888;
>>>>>> +        break;
>>>>>> +    default:
>>>>>> +        fmt = LSDC_PF_XRGB8888;
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (index == 0) {
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>>>>> +        val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>>>>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>>>>> +    } else if (index == 1) {
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>>>>> +        val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>>>>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
>>>>>> +                      struct drm_crtc *crtc,
>>>>>> +                      u64 paddr)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = &ldev->base;
>>>>>> +    unsigned int index = drm_crtc_index(crtc);
>>>>>> +    u32 lo_addr_reg;
>>>>>> +    u32 hi_addr_reg;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Find which framebuffer address register should update.
>>>>>> +     * if FB_ADDR0_REG is in using, we write the address to 
>>>>>> FB_ADDR0_REG,
>>>>>> +     * if FB_ADDR1_REG is in using, we write the address to 
>>>>>> FB_ADDR1_REG
>>>>>> +     * for each CRTC, the switch using one fb register to 
>>>>>> another is
>>>>>> +     * trigger by triggered by set CFG_PAGE_FLIP bit of 
>>>>>> LSDC_CRTCx_CFG_REG
>>>>>> +     */
>>>>>> +    if (index == 0) {
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>>>>> +        if (val & CFG_FB_IN_USING) {
>>>>>> +            lo_addr_reg = LSDC_CRTC0_FB1_LO_ADDR_REG;
>>>>>> +            hi_addr_reg = LSDC_CRTC0_FB1_HI_ADDR_REG;
>>>>>> +            drm_dbg(ddev, "Currently, FB1 is in using by 
>>>>>> CRTC-0\n");
>>>>>> +        } else {
>>>>>> +            lo_addr_reg = LSDC_CRTC0_FB0_LO_ADDR_REG;
>>>>>> +            hi_addr_reg = LSDC_CRTC0_FB0_HI_ADDR_REG;
>>>>>> +            drm_dbg(ddev, "Currently, FB0 is in using by 
>>>>>> CRTC-0\n");
>>>>>> +        }
>>>>>> +    } else if (index == 1) {
>>>>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>>>>> +        if (val & CFG_FB_IN_USING) {
>>>>>> +            lo_addr_reg = LSDC_CRTC1_FB1_LO_ADDR_REG;
>>>>>> +            hi_addr_reg = LSDC_CRTC1_FB1_HI_ADDR_REG;
>>>>>> +            drm_dbg(ddev, "Currently, FB1 is in using by 
>>>>>> CRTC-1\n");
>>>>>> +        } else {
>>>>>> +            lo_addr_reg = LSDC_CRTC1_FB0_LO_ADDR_REG;
>>>>>> +            hi_addr_reg = LSDC_CRTC1_FB0_HI_ADDR_REG;
>>>>>> +            drm_dbg(ddev, "Currently, FB0 is in using by 
>>>>>> CRTC-1\n");
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    /* 40-bit width physical address bus */
>>>>>> +    lsdc_wreg32(ldev, lo_addr_reg, paddr);
>>>>>> +    lsdc_wreg32(ldev, hi_addr_reg, (paddr >> 32) & 0xFF);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "CRTC-%u scantout from 0x%llx\n", index, paddr);
>>>>>> +}
>>>>>> +
>>>>>> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
>>>>>> +                       struct drm_plane_state *state,
>>>>>> +                       unsigned int plane)
>>>>>> +{
>>>>>> +    unsigned int offset = fb->offsets[plane];
>>>>>> +
>>>>>> +    offset += fb->format->cpp[plane] * (state->src_x >> 16);
>>>>>> +    offset += fb->pitches[plane] * (state->src_y >> 16);
>>>>>> +
>>>>>> +    return offset;
>>>>>> +}
>>>>>> +
>>>>>> +static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
>>>>>> +{
>>>>>> +    struct drm_gem_vram_object *gbo;
>>>>>> +    s64 gpu_addr;
>>>>>> +
>>>>>> +    gbo = drm_gem_vram_of_gem(fb->obj[0]);
>>>>>> +    gpu_addr = drm_gem_vram_offset(gbo);
>>>>>> +
>>>>>> +    return gpu_addr;
>>>>>> +}
>>>>>> +
>>>>>> +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
>>>>>> +                       struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_plane_state *plane_state = 
>>>>>> drm_atomic_get_new_plane_state(state, plane);
>>>>>> +    struct drm_crtc *crtc = plane_state->crtc;
>>>>>> +    struct drm_crtc_state *crtc_state = 
>>>>>> drm_atomic_get_new_crtc_state(state, crtc);
>>>>>> +
>>>>>> +    if (!crtc)
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    return drm_atomic_helper_check_plane_state(plane_state,
>>>>>> +                           crtc_state,
>>>>>> +                           DRM_PLANE_NO_SCALING,
>>>>>> +                           DRM_PLANE_NO_SCALING,
>>>>>> +                           false,
>>>>>> +                           true);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_update_fb_stride(struct lsdc_device *ldev,
>>>>>> +                  struct drm_crtc *crtc,
>>>>>> +                  unsigned int stride)
>>>>>> +{
>>>>>> +    unsigned int index = drm_crtc_index(crtc);
>>>>>> +
>>>>>> +    if (index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
>>>>>> +    else if (index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
>>>>>> +
>>>>>> +    drm_dbg(crtc->dev, "update stride to %u\n", stride);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_primary_plane_atomic_update(struct drm_plane 
>>>>>> *plane,
>>>>>> +                         struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct lsdc_device *ldev = to_lsdc(plane->dev);
>>>>>> +    struct drm_plane_state *new_plane_state = 
>>>>>> drm_atomic_get_new_plane_state(state, plane);
>>>>>> +    struct drm_crtc *crtc = new_plane_state->crtc;
>>>>>> +    struct drm_framebuffer *fb = new_plane_state->fb;
>>>>>> +    u32 fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
>>>>>> +    dma_addr_t fb_addr;
>>>>>> +    s64 gpu_addr;
>>>>>> +
>>>>>> +    gpu_addr = lsdc_get_vram_bo_offset(fb);
>>>>>> +    if (gpu_addr < 0)
>>>>>> +        return;
>>>>>> +
>>>>>> +    fb_addr = ldev->vram_base + gpu_addr + fb_offset;
>>>>>> +
>>>>>> +    lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
>>>>>> +
>>>>>> +    lsdc_update_fb_stride(ldev, crtc, fb->pitches[0]);
>>>>>> +
>>>>>> +    lsdc_update_fb_format(ldev, crtc, fb->format);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_primary_plane_atomic_disable(struct drm_plane 
>>>>>> *plane,
>>>>>> +                          struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    drm_dbg(plane->dev, "%s disabled\n", plane->name);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct drm_plane_helper_funcs 
>>>>>> lsdc_primary_plane_helpers = {
>>>>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>>>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>>>>> +    .atomic_check = lsdc_primary_plane_atomic_check,
>>>>>> +    .atomic_update = lsdc_primary_plane_atomic_update,
>>>>>> +    .atomic_disable = lsdc_primary_plane_atomic_disable,
>>>>>> +};
>>>>>> +
>>>>>> +static int lsdc_cursor_atomic_check(struct drm_plane *plane,
>>>>>> +                    struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_plane_state *new_plane_state = 
>>>>>> drm_atomic_get_new_plane_state(state, plane);
>>>>>> +    struct drm_framebuffer *fb = new_plane_state->fb;
>>>>>> +    struct drm_crtc *crtc = new_plane_state->crtc;
>>>>>> +    struct drm_crtc_state *crtc_state;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    /* no need for further checks if the plane is being disabled */
>>>>>> +    if (!crtc || !fb)
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    if (!new_plane_state->visible)
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    crtc_state = drm_atomic_get_new_crtc_state(state,
>>>>>> +                           new_plane_state->crtc);
>>>>>> +
>>>>>> +    ret = drm_atomic_helper_check_plane_state(new_plane_state,
>>>>>> +                          crtc_state,
>>>>>> +                          DRM_PLANE_NO_SCALING,
>>>>>> +                          DRM_PLANE_NO_SCALING,
>>>>>> +                          true,
>>>>>> +                          true);
>>>>>> +
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * There is only one hardware cursor in ls7a1000, ls2k1000 and 
>>>>>> ls2k0500.
>>>>>> + * we made it shared by the two CRTC, which can satisfy peoples 
>>>>>> who use
>>>>>> + * double screen extend mode only. On clone screen usage case, 
>>>>>> the cursor
>>>>>> + * on display pipe 1 will not be able to display.
>>>>>> + *
>>>>>> + * Update location of the cursor, attach it to CRTC0 or CRTC1 on 
>>>>>> the runtime.
>>>>>> + */
>>>>>> +static void lsdc_cursor_update_location_quirks(struct 
>>>>>> lsdc_device *ldev,
>>>>>> +                           struct drm_crtc *crtc)
>>>>>> +{
>>>>>> +    u32 val = CURSOR_FORMAT_ARGB8888;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * If bit 4 of LSDC_CURSOR0_CFG_REG is 1, then the cursor 
>>>>>> will be
>>>>>> +     * locate at CRTC-1, if bit 4 of LSDC_CURSOR0_CFG_REG is 0, 
>>>>>> then
>>>>>> +     * the cursor will be locate at CRTC-0. The cursor is alway 
>>>>>> on the
>>>>>> +     * top of the primary. Compositing the primary plane and cursor
>>>>>> +     * plane is automatically done by hardware.
>>>>>> +     */
>>>>>> +    if (drm_crtc_index(crtc))
>>>>>> +        val |= CURSOR_LOCATION;
>>>>>> +
>>>>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, val);
>>>>>> +}
>>>>>> +
>>>>>> +/* update the position of the cursor */
>>>>>> +static void lsdc_cursor_update_position_quirks(struct 
>>>>>> lsdc_device *ldev,
>>>>>> +                           int x,
>>>>>> +                           int y)
>>>>>> +{
>>>>>> +    if (x < 0)
>>>>>> +        x = 0;
>>>>>> +
>>>>>> +    if (y < 0)
>>>>>> +        y = 0;
>>>>>> +
>>>>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_cursor_atomic_update_quirks(struct drm_plane 
>>>>>> *plane,
>>>>>> +                         struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = plane->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct drm_plane_state *new_plane_state = 
>>>>>> drm_atomic_get_new_plane_state(state, plane);
>>>>>> +    struct drm_plane_state *old_plane_state = 
>>>>>> drm_atomic_get_old_plane_state(state, plane);
>>>>>> +    struct drm_framebuffer *new_fb = new_plane_state->fb;
>>>>>> +    struct drm_framebuffer *old_fb = old_plane_state->fb;
>>>>>> +
>>>>>> +    if (new_fb != old_fb) {
>>>>>> +        s64 offset = lsdc_get_vram_bo_offset(new_fb);
>>>>>> +        u64 cursor_addr = ldev->vram_base + offset;
>>>>>> +
>>>>>> +        drm_dbg_kms(ddev, "%s offset: %llx\n", plane->name, 
>>>>>> offset);
>>>>>> +
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, cursor_addr);
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (cursor_addr 
>>>>>> >> 32) & 0xFF);
>>>>>> +    }
>>>>>> +
>>>>>> +    lsdc_cursor_update_position_quirks(ldev, 
>>>>>> new_plane_state->crtc_x, new_plane_state->crtc_y);
>>>>>> +
>>>>>> +    lsdc_cursor_update_location_quirks(ldev, 
>>>>>> new_plane_state->crtc);
>>>>>> +}
>>>>>> +
>>>>>> +/* update the format, size and location of the cursor */
>>>>>> +static void lsdc_cursor_atomic_update(struct drm_plane *plane,
>>>>>> +                      struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = plane->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> cursor_to_display_pipe(plane);
>>>>>> +    struct drm_plane_state *new_plane_state = 
>>>>>> drm_atomic_get_new_plane_state(state, plane);
>>>>>> +    struct drm_framebuffer *new_fb = new_plane_state->fb;
>>>>>> +    int x = new_plane_state->crtc_x;
>>>>>> +    int y = new_plane_state->crtc_y;
>>>>>> +    u32 conf = CURSOR_FORMAT_ARGB8888 | CURSOR_SIZE_64X64;
>>>>>> +    u64 cursor_addr = ldev->vram_base + 
>>>>>> lsdc_get_vram_bo_offset(new_fb);
>>>>>> +
>>>>>> +    if (x < 0)
>>>>>> +        x = 0;
>>>>>> +
>>>>>> +    if (y < 0)
>>>>>> +        y = 0;
>>>>>> +
>>>>>> +    if (dispipe->index == 0) {
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (cursor_addr 
>>>>>> >> 32) & 0xFF);
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, cursor_addr);
>>>>>> +        /* Attach Cursor-0 to CRTC-0 */
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, conf & 
>>>>>> ~CURSOR_LOCATION);
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | 
>>>>>> x);
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (dispipe->index == 1) {
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG, (cursor_addr 
>>>>>> >> 32) & 0xFF);
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG, cursor_addr);
>>>>>> +        /* Attach Cursor-1 to CRTC-1 */
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, conf | 
>>>>>> CURSOR_LOCATION);
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y << 16) | 
>>>>>> x);
>>>>>> +        return;
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_cursor_atomic_disable_quirks(struct drm_plane 
>>>>>> *plane,
>>>>>> +                          struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = plane->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +
>>>>>> +    /* Set the format to 0 actually display the cursor */
>>>>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "%s disabled\n", plane->name);
>>>>>> +}
>>>>>> +
>>>>>> +static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
>>>>>> +                       struct drm_atomic_state *state)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = plane->dev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    struct lsdc_display_pipe *dispipe = 
>>>>>> cursor_to_display_pipe(plane);
>>>>>> +
>>>>>> +    if (dispipe->index == 0)
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
>>>>>> +    else if (dispipe->index == 1)
>>>>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, 0);
>>>>>> +
>>>>>> +    drm_dbg(ddev, "%s disabled\n", plane->name);
>>>>>> +}
>>>>>> +
>>>>>> +static const struct drm_plane_helper_funcs 
>>>>>> lsdc_cursor_helpers_quirk = {
>>>>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>>>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>>>>> +    .atomic_check = lsdc_cursor_atomic_check,
>>>>>> +    .atomic_update = lsdc_cursor_atomic_update_quirks,
>>>>>> +    .atomic_disable = lsdc_cursor_atomic_disable_quirks,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_plane_helper_funcs 
>>>>>> lsdc_cursor_plane_helpers = {
>>>>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>>>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>>>>> +    .atomic_check = lsdc_cursor_atomic_check,
>>>>>> +    .atomic_update = lsdc_cursor_atomic_update,
>>>>>> +    .atomic_disable = lsdc_cursor_atomic_disable,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_plane_funcs lsdc_plane_funcs = {
>>>>>> +    .update_plane = drm_atomic_helper_update_plane,
>>>>>> +    .disable_plane = drm_atomic_helper_disable_plane,
>>>>>> +    .destroy = drm_plane_cleanup,
>>>>>> +    .reset = drm_atomic_helper_plane_reset,
>>>>>> +    .atomic_duplicate_state = 
>>>>>> drm_atomic_helper_plane_duplicate_state,
>>>>>> +    .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct drm_plane_helper_funcs *
>>>>>> +lsdc_get_cursor_helper_funcs(const struct lsdc_desc *descp)
>>>>>> +{
>>>>>> +    if (descp->chip == CHIP_LS7A2000)
>>>>>> +        return &lsdc_cursor_plane_helpers;
>>>>>> +
>>>>>> +    return &lsdc_cursor_helpers_quirk;
>>>>>> +}
>>>>>> +
>>>>>> +int lsdc_plane_init(struct lsdc_device *ldev,
>>>>>> +            struct drm_plane *plane,
>>>>>> +            enum drm_plane_type type,
>>>>>> +            unsigned int index)
>>>>>> +{
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +    struct drm_device *ddev = &ldev->base;
>>>>>> +    unsigned int format_count;
>>>>>> +    const u32 *formats;
>>>>>> +    const char *name;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    switch (type) {
>>>>>> +    case DRM_PLANE_TYPE_PRIMARY:
>>>>>> +        formats = lsdc_primary_formats;
>>>>>> +        format_count = ARRAY_SIZE(lsdc_primary_formats);
>>>>>> +        name = "primary-%u";
>>>>>> +        break;
>>>>>> +    case DRM_PLANE_TYPE_CURSOR:
>>>>>> +        formats = lsdc_cursor_formats;
>>>>>> +        format_count = ARRAY_SIZE(lsdc_cursor_formats);
>>>>>> +        name = "cursor-%u";
>>>>>> +        break;
>>>>>> +    case DRM_PLANE_TYPE_OVERLAY:
>>>>>> +        drm_err(ddev, "overlay plane is not supported\n");
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = drm_universal_plane_init(ddev, plane, 1 << index,
>>>>>> +                       &lsdc_plane_funcs,
>>>>>> +                       formats, format_count,
>>>>>> +                       lsdc_fb_format_modifiers,
>>>>>> +                       type, name, index);
>>>>>> +    if (ret) {
>>>>>> +        drm_err(ddev, "%s failed: %d\n", __func__, ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    switch (type) {
>>>>>> +    case DRM_PLANE_TYPE_PRIMARY:
>>>>>> +        drm_plane_helper_add(plane, &lsdc_primary_plane_helpers);
>>>>>> +        break;
>>>>>> +    case DRM_PLANE_TYPE_CURSOR:
>>>>>> +        drm_plane_helper_add(plane, 
>>>>>> lsdc_get_cursor_helper_funcs(descp));
>>>>>> +        break;
>>>>>> +    case DRM_PLANE_TYPE_OVERLAY:
>>>>>> +        drm_err(ddev, "overlay plane is not supported\n");
>>>>>> +        break;
>>>>>> +    }
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_pll.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..6ed74989a6f5
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
>>>>>> @@ -0,0 +1,569 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include "lsdc_drv.h"
>>>>>> +#include "lsdc_regs.h"
>>>>>> +#include "lsdc_pll.h"
>>>>>> +
>>>>>> +/*
>>>>>> + * The structure of the pixel PLL register is evolved with times.
>>>>>> + * All loongson's cpu is little endian.
>>>>>> + */
>>>>>> +
>>>>>> +/* u64 */
>>>>>> +struct ls7a1000_pixpll_bitmap {
>>>>>> +    /* Byte 0 ~ Byte 3 */
>>>>>> +    unsigned div_out      : 7;   /*  0 : 6     output clock 
>>>>>> divider  */
>>>>>> +    unsigned __1          : 14;  /*  7 : 
>>>>>> 20                          */
>>>>>> +    unsigned loopc        : 9;   /* 21 : 29    clock 
>>>>>> multiplier      */
>>>>>> +    unsigned __2          : 2;   /* 30 : 
>>>>>> 31                          */
>>>>>> +
>>>>>> +    /* Byte 4 ~ Byte 7 */
>>>>>> +    unsigned div_ref      : 7;   /*  0 : 6     input clock 
>>>>>> divider   */
>>>>>> +    unsigned locked       : 1;   /*  7         PLL locked 
>>>>>> status     */
>>>>>> +    unsigned sel_out      : 1;   /*  8         output clk 
>>>>>> selector   */
>>>>>> +    unsigned __3          : 2;   /*  9 : 10 
>>>>>> reserved              */
>>>>>> +    unsigned set_param    : 1;   /*  11        trigger the 
>>>>>> update    */
>>>>>> +    unsigned bypass       : 1;   /* 
>>>>>> 12                              */
>>>>>> +    unsigned powerdown    : 1;   /* 
>>>>>> 13                              */
>>>>>> +    unsigned __4          : 18;  /*  14 : 
>>>>>> 31                         */
>>>>>> +};
>>>>>> +
>>>>>> +/* u128 */
>>>>>> +struct ls2k1000_pixpll_bitmap {
>>>>>> +    /* Byte 0 ~ Byte 3 */
>>>>>> +    unsigned sel_out      :  1;  /*  0      select this 
>>>>>> PLL          */
>>>>>> +    unsigned __1          :  1;  /* 
>>>>>> 1                               */
>>>>>> +    unsigned sw_adj_en    :  1;  /*  2      allow software 
>>>>>> adjust    */
>>>>>> +    unsigned bypass       :  1;  /*  3      bypass L1 
>>>>>> PLL            */
>>>>>> +    unsigned __2          :  3;  /* 
>>>>>> 4:6                             */
>>>>>> +    unsigned lock_en      :  1;  /*  7      enable lock L1 
>>>>>> PLL       */
>>>>>> +    unsigned __3          :  2;  /* 
>>>>>> 8:9                             */
>>>>>> +    unsigned lock_check   :  2;  /* 10:11   precision 
>>>>>> check          */
>>>>>> +    unsigned __4          :  4;  /* 
>>>>>> 12:15                            */
>>>>>> +
>>>>>> +    unsigned locked       :  1;  /* 16      PLL locked flag 
>>>>>> bit      */
>>>>>> +    unsigned __5          :  2;  /* 
>>>>>> 17:18                            */
>>>>>> +    unsigned powerdown    :  1;  /* 19      powerdown the pll if 
>>>>>> set */
>>>>>> +    unsigned __6          :  6;  /* 
>>>>>> 20:25                            */
>>>>>> +    unsigned div_ref      :  6;  /* 26:31   L1 
>>>>>> Prescaler             */
>>>>>> +
>>>>>> +    /* Byte 4 ~ Byte 7 */
>>>>>> +    unsigned loopc        : 10;  /* 32:41   Clock 
>>>>>> Multiplier         */
>>>>>> +    unsigned l1_div       :  6;  /* 42:47   not 
>>>>>> used                 */
>>>>>> +    unsigned __7          : 16;  /* 
>>>>>> 48:63                            */
>>>>>> +
>>>>>> +    /* Byte 8 ~ Byte 15 */
>>>>>> +    unsigned div_out      :  6;  /* 0 : 5   output clock 
>>>>>> divider     */
>>>>>> +    unsigned __8          : 26;  /* 6 : 
>>>>>> 31                           */
>>>>>> +    unsigned __9          : 32;  /* 70: 
>>>>>> 127                          */
>>>>>> +};
>>>>>> +
>>>>>> +/* u32 */
>>>>>> +struct ls2k0500_pixpll_bitmap {
>>>>>> +    /* Byte 0 ~ Byte 1 */
>>>>>> +    unsigned sel_out      : 1;
>>>>>> +    unsigned __1          : 2;
>>>>>> +    unsigned sw_adj_en    : 1;   /* allow software 
>>>>>> adjust              */
>>>>>> +    unsigned bypass       : 1;   /* bypass L1 
>>>>>> PLL                      */
>>>>>> +    unsigned powerdown    : 1;   /* write 1 to powerdown the 
>>>>>> PLL       */
>>>>>> +    unsigned __2          : 1;
>>>>>> +    unsigned locked       : 1;   /*  7     Is L1 PLL locked, 
>>>>>> read only */
>>>>>> +    unsigned div_ref      : 6;   /*  8:13  ref clock 
>>>>>> divider           */
>>>>>> +    unsigned __3          : 2;   /* 
>>>>>> 14:15                              */
>>>>>> +    /* Byte 2 ~ Byte 3 */
>>>>>> +    unsigned loopc        : 8;   /* 16:23   Clock 
>>>>>> Multiplier           */
>>>>>> +    unsigned div_out      : 6;   /* 24:29   output clock 
>>>>>> divider       */
>>>>>> +    unsigned __4          : 2;   /* 
>>>>>> 30:31                              */
>>>>>> +};
>>>>>> +
>>>>>> +union lsdc_pixpll_bitmap {
>>>>>> +    struct ls7a1000_pixpll_bitmap ls7a1000;
>>>>>> +    struct ls2k1000_pixpll_bitmap ls2k1000;
>>>>>> +    struct ls2k0500_pixpll_bitmap ls2k0500;
>>>>>> +
>>>>>> +    u32 dword[4];
>>>>>> +};
>>>>>> +
>>>>>> +struct pixclk_to_pll_parm {
>>>>>> +    /* kHz */
>>>>>> +    unsigned int clock;
>>>>>> +
>>>>>> +    unsigned short width;
>>>>>> +    unsigned short height;
>>>>>> +    unsigned short vrefresh;
>>>>>> +
>>>>>> +    /* Stores parameters for programming the Hardware PLLs */
>>>>>> +    unsigned short div_out;
>>>>>> +    unsigned short loopc;
>>>>>> +    unsigned short div_ref;
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * Pixel clock to PLL parameters translation table.
>>>>>> + * Small static cached value to speed up PLL parameters 
>>>>>> calculation.
>>>>>> + */
>>>>>> +static const struct pixclk_to_pll_parm pll_param_table[] = {
>>>>>> +    {148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
>>>>>> +                        /* 1920x1080@50Hz */
>>>>>> +    {174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
>>>>>> +    {181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
>>>>>> +    {146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
>>>>>> +    {135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
>>>>>> +
>>>>>> +    {108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz */
>>>>>> +                        /* 1280x1024@60Hz */
>>>>>> +                        /* 1280x960@60Hz */
>>>>>> +                        /* 1152x864@75Hz */
>>>>>> +
>>>>>> +    {106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
>>>>>> +    {88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
>>>>>> +    {83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
>>>>>> +    {71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
>>>>>> +
>>>>>> +    {74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
>>>>>> +                        /* 1280x720@50Hz */
>>>>>> +
>>>>>> +    {78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
>>>>>> +    {75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
>>>>>> +    {65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
>>>>>> +
>>>>>> +    {51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
>>>>>> +
>>>>>> +    {57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
>>>>>> +    {49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
>>>>>> +    {50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
>>>>>> +    {40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
>>>>>> +    {36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
>>>>>> +    {31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
>>>>>> +                        /* 640x480@73Hz */
>>>>>> +
>>>>>> +    {30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
>>>>>> +    {27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
>>>>>> +    {25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
>>>>>> +    {25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
>>>>>> +                        /* 720x480@60Hz */
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * lsdc_pixpll_setup - ioremap the device dependent PLL registers
>>>>>> + *
>>>>>> + * @this: point to the object where this function is called from
>>>>>> + */
>>>>>> +static int lsdc_pixpll_setup(struct lsdc_pll * const this)
>>>>>> +{
>>>>>> +    this->mmio = ioremap(this->reg_base, this->reg_size);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Find a set of pll parameters (to generate pixel clock) from a 
>>>>>> static
>>>>>> + * local table, which avoid to compute the pll parameter eachtime a
>>>>>> + * modeset is triggered.
>>>>>> + *
>>>>>> + * @this: point to the object which this function is called from
>>>>>> + * @clock: the desired output pixel clock, the unit is kHz
>>>>>> + * @pout: point to where the parameters to store if found
>>>>>> + *
>>>>>> + *  Return true if hit, otherwise return false.
>>>>>> + */
>>>>>> +static bool lsdc_pixpll_find(struct lsdc_pll * const this,
>>>>>> +                 unsigned int clock,
>>>>>> +                 struct lsdc_pll_parms * const pout)
>>>>>> +{
>>>>>> +    unsigned int num = ARRAY_SIZE(pll_param_table);
>>>>>> +    unsigned int i;
>>>>>> +
>>>>>> +    for (i = 0; i < num; i++) {
>>>>>> +        if (clock != pll_param_table[i].clock)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        pout->div_ref = pll_param_table[i].div_ref;
>>>>>> +        pout->loopc   = pll_param_table[i].loopc;
>>>>>> +        pout->div_out = pll_param_table[i].div_out;
>>>>>> +
>>>>>> +        return true;
>>>>>> +    }
>>>>>> +
>>>>>> +    drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
>>>>>> +
>>>>>> +    return false;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Find a set of pll parameters which have minimal difference 
>>>>>> with the desired
>>>>>> + * pixel clock frequency. It does that by computing all of the 
>>>>>> possible
>>>>>> + * combination. Compute the diff and find the combination with 
>>>>>> minimal diff.
>>>>>> + *
>>>>>> + *  clock_out = refclk / div_ref * loopc / div_out
>>>>>> + *
>>>>>> + *  refclk is determined by the oscillator mounted board(Here is 
>>>>>> 100MHz in
>>>>>> + *  almost all case)
>>>>>> + *
>>>>>> + * @this: point to the object from which this function is called
>>>>>> + * @clock_khz: the desired output pixel clock, the unit is kHz
>>>>>> + * @pout: point to the out struct of lsdc_pll_parms
>>>>>> + *
>>>>>> + *  Return true if a parameter is found, otherwise return false
>>>>>> + */
>>>>>> +static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
>>>>>> +                unsigned int clock_khz,
>>>>>> +                struct lsdc_pll_parms *pout)
>>>>>> +{
>>>>>> +    unsigned int refclk = this->ref_clock;
>>>>>> +    const unsigned int tolerance = 1000;
>>>>>> +    unsigned int min = tolerance;
>>>>>> +    unsigned int div_out, loopc, div_ref;
>>>>>> +    unsigned int computed;
>>>>>> +
>>>>>> +    if (lsdc_pixpll_find(this, clock_khz, pout))
>>>>>> +        return true;
>>>>>> +
>>>>>> +    for (div_out = 6; div_out < 64; div_out++) {
>>>>>> +        for (div_ref = 3; div_ref < 6; div_ref++) {
>>>>>> +            for (loopc = 6; loopc < 161; loopc++) {
>>>>>> +                int diff;
>>>>>> +
>>>>>> +                if (loopc < 12 * div_ref)
>>>>>> +                    continue;
>>>>>> +                if (loopc > 32 * div_ref)
>>>>>> +                    continue;
>>>>>> +
>>>>>> +                computed = refclk * loopc / div_ref / div_out;
>>>>>> +
>>>>>> +                if (clock_khz > computed)
>>>>>> +                    diff = clock_khz - computed;
>>>>>> +                else if (clock_khz < computed)
>>>>>> +                    diff = computed - clock_khz;
>>>>>> +
>>>>>> +                if (diff < min) {
>>>>>> +                    min = diff;
>>>>>> +                    pout->div_ref = div_ref;
>>>>>> +                    pout->div_out = div_out;
>>>>>> +                    pout->loopc = loopc;
>>>>>> +
>>>>>> +                    if (diff == 0)
>>>>>> +                        return true;
>>>>>> +                }
>>>>>> +            }
>>>>>> +        }
>>>>>> +    }
>>>>>> +
>>>>>> +    return min < tolerance;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Update the pll parameters to hardware, target to the pixpll 
>>>>>> in ls7a1000
>>>>>> + *
>>>>>> + * @this: point to the object from which this function is called
>>>>>> + * @pin: point to the struct of lsdc_pll_parms passed in
>>>>>> + *
>>>>>> + * return 0 if successful.
>>>>>> + */
>>>>>> +static int ls7a1000_pixpll_param_update(struct lsdc_pll * const 
>>>>>> this,
>>>>>> +                    struct lsdc_pll_parms const *pin)
>>>>>> +{
>>>>>> +    void __iomem *reg = this->mmio;
>>>>>> +    unsigned int counter = 0;
>>>>>> +    bool locked;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* Bypass the software configured PLL, using refclk directly */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val &= ~(1 << 8);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    /* Powerdown the PLL */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val |= (1 << 13);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    /* Clear the pll parameters */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val &= ~(1 << 11);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    /* clear old value & config new value */
>>>>>> +    val = readl(reg + 0x04);
>>>>>> +    val &= ~0x7F;
>>>>>> +    val |= pin->div_ref;        /* div_ref */
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    val = readl(reg);
>>>>>> +    val &= ~0x7f;
>>>>>> +    val |= pin->div_out;        /* div_out */
>>>>>> +
>>>>>> +    val &= ~(0x1ff << 21);
>>>>>> +    val |= pin->loopc << 21;    /* loopc */
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Set the pll the parameters */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val |= (1 << 11);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    /* Powerup the PLL */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val &= ~(1 << 13);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    /* Wait the PLL lock */
>>>>>> +    do {
>>>>>> +        val = readl(reg + 0x4);
>>>>>> +        locked = val & 0x80;
>>>>>> +        counter++;
>>>>>> +    } while (!locked && (counter < 2000));
>>>>>> +
>>>>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>>>>> +
>>>>>> +    /* Switch to the software configured pll */
>>>>>> +    val = readl(reg + 0x4);
>>>>>> +    val |= (1UL << 8);
>>>>>> +    writel(val, reg + 0x4);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Update the pll parameters to hardware, target to the pixpll 
>>>>>> in ls2k1000
>>>>>> + *
>>>>>> + * @this: point to the object from which this function is called
>>>>>> + * @pin: point to the struct of lsdc_pll_parms passed in
>>>>>> + *
>>>>>> + * return 0 if successful.
>>>>>> + */
>>>>>> +static int ls2k1000_pixpll_param_update(struct lsdc_pll * const 
>>>>>> this,
>>>>>> +                    struct lsdc_pll_parms const *pin)
>>>>>> +{
>>>>>> +    void __iomem *reg = this->mmio;
>>>>>> +    unsigned int counter = 0;
>>>>>> +    bool locked = false;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    val = readl(reg);
>>>>>> +    /* Bypass the software configured PLL, using refclk directly */
>>>>>> +    val &= ~(1 << 0);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Powerdown the PLL */
>>>>>> +    val |= (1 << 19);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Allow the software configuration */
>>>>>> +    val &= ~(1 << 2);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* allow L1 PLL lock */
>>>>>> +    val = (1L << 7) | (3L << 10);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* clear div_ref bit field */
>>>>>> +    val &= ~(0x3f << 26);
>>>>>> +    /* set div_ref bit field */
>>>>>> +    val |= pin->div_ref << 26;
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    val = readl(reg + 4);
>>>>>> +    /* clear loopc bit field */
>>>>>> +    val &= ~0x0fff;
>>>>>> +    /* set loopc bit field */
>>>>>> +    val |= pin->loopc;
>>>>>> +    writel(val, reg + 4);
>>>>>> +
>>>>>> +    /* set div_out */
>>>>>> +    writel(pin->div_out, reg + 8);
>>>>>> +
>>>>>> +    val = readl(reg);
>>>>>> +    /* use this parms configured just now */
>>>>>> +    val |= (1 << 2);
>>>>>> +    /* powerup the PLL */
>>>>>> +    val &= ~(1 << 19);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* wait pll setup and locked */
>>>>>> +    do {
>>>>>> +        val = readl(reg);
>>>>>> +        locked = val & 0x10000;
>>>>>> +        counter++;
>>>>>> +    } while (!locked && (counter < 2000));
>>>>>> +
>>>>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>>>>> +
>>>>>> +    /* Switch to software configured PLL instead of refclk */
>>>>>> +    val |= 1;
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/*
>>>>>> + * Update the pll parameters to hardware, target to the pixpll 
>>>>>> in ls2k0500
>>>>>> + *
>>>>>> + * @this: point to the object which calling this function
>>>>>> + * @param: pointer to where the parameters passed in
>>>>>> + *
>>>>>> + * return 0 if successful.
>>>>>> + */
>>>>>> +static int ls2k0500_pixpll_param_update(struct lsdc_pll * const 
>>>>>> this,
>>>>>> +                    struct lsdc_pll_parms const *param)
>>>>>> +{
>>>>>> +    void __iomem *reg = this->mmio;
>>>>>> +    unsigned int counter = 0;
>>>>>> +    bool locked = false;
>>>>>> +    u32 val;
>>>>>> +
>>>>>> +    /* Bypass the software configured PLL, using refclk directly */
>>>>>> +    val = readl(reg);
>>>>>> +    val &= ~(1 << 0);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Powerdown the PLL */
>>>>>> +    val = readl(reg);
>>>>>> +    val |= (1 << 5);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Allow the software configuration */
>>>>>> +    val |= (1 << 3);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Update the pll params */
>>>>>> +    val = (param->div_out << 24) |
>>>>>> +          (param->loopc << 16) |
>>>>>> +          (param->div_ref << 8);
>>>>>> +
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* Powerup the PLL */
>>>>>> +    val = readl(reg);
>>>>>> +    val &= ~(1 << 5);
>>>>>> +    writel(val, reg);
>>>>>> +
>>>>>> +    /* wait pll setup and locked */
>>>>>> +    do {
>>>>>> +        val = readl(reg);
>>>>>> +        locked = val & 0x80;
>>>>>> +        counter++;
>>>>>> +    } while (!locked && (counter < 10000));
>>>>>> +
>>>>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>>>>> +
>>>>>> +    /* Switch to software configured PLL instead of refclk */
>>>>>> +    writel((val | 1), reg);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static unsigned int lsdc_get_clock_rate(struct lsdc_pll * const 
>>>>>> this,
>>>>>> +                    struct lsdc_pll_parms *pout)
>>>>>> +{
>>>>>> +    struct drm_device *ddev = this->ddev;
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    const struct lsdc_desc * const descp = ldev->descp;
>>>>>> +    unsigned int out;
>>>>>> +    union lsdc_pixpll_bitmap parms;
>>>>>> +
>>>>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>>>>> CHIP_LS7A2000) {
>>>>>> +        struct ls7a1000_pixpll_bitmap *obj = &parms.ls7a1000;
>>>>>> +
>>>>>> +        parms.dword[0] = readl(this->mmio);
>>>>>> +        parms.dword[1] = readl(this->mmio + 4);
>>>>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>>>>> obj->div_out;
>>>>>> +        if (pout) {
>>>>>> +            pout->div_ref = obj->div_ref;
>>>>>> +            pout->loopc = obj->loopc;
>>>>>> +            pout->div_out = obj->div_out;
>>>>>> +        }
>>>>>> +    } else if (descp->chip == CHIP_LS2K1000) {
>>>>>> +        struct ls2k1000_pixpll_bitmap *obj = &parms.ls2k1000;
>>>>>> +
>>>>>> +        parms.dword[0] = readl(this->mmio);
>>>>>> +        parms.dword[1] = readl(this->mmio + 4);
>>>>>> +        parms.dword[2] = readl(this->mmio + 8);
>>>>>> +        parms.dword[3] = readl(this->mmio + 12);
>>>>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>>>>> obj->div_out;
>>>>>> +        if (pout) {
>>>>>> +            pout->div_ref = obj->div_ref;
>>>>>> +            pout->loopc = obj->loopc;
>>>>>> +            pout->div_out = obj->div_out;
>>>>>> +        }
>>>>>> +    } else if (descp->chip == CHIP_LS2K0500) {
>>>>>> +        struct ls2k0500_pixpll_bitmap *obj = &parms.ls2k0500;
>>>>>> +
>>>>>> +        parms.dword[0] = readl(this->mmio);
>>>>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>>>>> obj->div_out;
>>>>>> +        if (pout) {
>>>>>> +            pout->div_ref = obj->div_ref;
>>>>>> +            pout->loopc = obj->loopc;
>>>>>> +            pout->div_out = obj->div_out;
>>>>>> +        }
>>>>>> +    } else {
>>>>>> +        drm_err(ddev, "unknown chip, the driver need update\n");
>>>>>> +        return 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    return out;
>>>>>> +}
>>>>>> +
>>>>>> +static const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
>>>>>> +    .setup = lsdc_pixpll_setup,
>>>>>> +    .compute = lsdc_pixpll_compute,
>>>>>> +    .update = ls7a1000_pixpll_param_update,
>>>>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs = {
>>>>>> +    .setup = lsdc_pixpll_setup,
>>>>>> +    .compute = lsdc_pixpll_compute,
>>>>>> +    .update = ls2k1000_pixpll_param_update,
>>>>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>>>>> +};
>>>>>> +
>>>>>> +static const struct lsdc_pixpll_funcs ls2k0500_pixpll_funcs = {
>>>>>> +    .setup = lsdc_pixpll_setup,
>>>>>> +    .compute = lsdc_pixpll_compute,
>>>>>> +    .update = ls2k0500_pixpll_param_update,
>>>>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>>>>> +};
>>>>>> +
>>>>>> +int lsdc_pixpll_init(struct lsdc_pll * const this,
>>>>>> +             struct drm_device *ddev,
>>>>>> +             unsigned int index)
>>>>>> +{
>>>>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>>>>> +    const struct lsdc_desc *descp = ldev->descp;
>>>>>> +
>>>>>> +    this->ddev = ddev;
>>>>>> +    this->index = index;
>>>>>> +    this->ref_clock = LSDC_PLL_REF_CLK;
>>>>>> +
>>>>>> +    /* LS7A1000 and LS7A2000's pixpll setting registers is same */
>>>>>> +    if (descp->chip == CHIP_LS7A2000 || descp->chip == 
>>>>>> CHIP_LS7A1000) {
>>>>>> +        if (index == 0)
>>>>>> +            this->reg_base = LS7A1000_CFG_REG_BASE + 
>>>>>> LS7A1000_PIX_PLL0_REG;
>>>>>> +        else if (index == 1)
>>>>>> +            this->reg_base = LS7A1000_CFG_REG_BASE + 
>>>>>> LS7A1000_PIX_PLL1_REG;
>>>>>> +        this->reg_size = 8;
>>>>>> +        this->funcs = &ls7a1000_pixpll_funcs;
>>>>>> +    } else if (descp->chip == CHIP_LS2K1000) {
>>>>>> +        if (index == 0)
>>>>>> +            this->reg_base = LS2K1000_CFG_REG_BASE + 
>>>>>> LS2K1000_PIX_PLL0_REG;
>>>>>> +        else if (index == 1)
>>>>>> +            this->reg_base = LS2K1000_CFG_REG_BASE + 
>>>>>> LS2K1000_PIX_PLL1_REG;
>>>>>> +
>>>>>> +        this->reg_size = 16;
>>>>>> +        this->funcs = &ls2k1000_pixpll_funcs;
>>>>>> +    } else if (descp->chip == CHIP_LS2K0500) {
>>>>>> +        if (index == 0)
>>>>>> +            this->reg_base = LS2K0500_CFG_REG_BASE + 
>>>>>> LS2K0500_PIX_PLL0_REG;
>>>>>> +        else if (index == 1)
>>>>>> +            this->reg_base = LS2K0500_CFG_REG_BASE + 
>>>>>> LS2K0500_PIX_PLL1_REG;
>>>>>> +
>>>>>> +        this->reg_size = 4;
>>>>>> +        this->funcs = &ls2k0500_pixpll_funcs;
>>>>>> +    } else {
>>>>>> +        drm_err(this->ddev, "unknown chip, the driver need 
>>>>>> update\n");
>>>>>> +        return -ENOENT;
>>>>>> +    }
>>>>>> +
>>>>>> +    return this->funcs->setup(this);
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.h 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_pll.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..538739f461f2
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.h
>>>>>> @@ -0,0 +1,78 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +
>>>>>> +#ifndef __LSDC_PLL_H__
>>>>>> +#define __LSDC_PLL_H__
>>>>>> +
>>>>>> +#include <drm/drm_device.h>
>>>>>> +
>>>>>> +/*
>>>>>> + * Loongson Pixel PLL hardware structure
>>>>>> + *
>>>>>> + * refclk: reference frequency, 100 MHz from external oscillator
>>>>>> + * outclk: output frequency desired.
>>>>>> + *
>>>>>> + *
>>>>>> + *               L1       Fref Fvco     L2
>>>>>> + * refclk   +-----------+      +------------------+ +---------+ 
>>>>>> outclk
>>>>>> + * ---+---> | Prescaler | ---> | Clock Multiplier | ---> | 
>>>>>> divider | -------->
>>>>>> + *    |     +-----------+      +------------------+ 
>>>>>> +---------+     ^
>>>>>> + *    |           ^                      ^ ^          |
>>>>>> + *    |           |                      | |          |
>>>>>> + *    |           |                      | |          |
>>>>>> + *    |        div_ref                 loopc div_out |
>>>>>> + * | |
>>>>>> + *    +--- sel_out (bypass above software configurable clock if 
>>>>>> set) ----+
>>>>>> + *
>>>>>> + *  sel_out: PLL clock output selector (for debug purpose only).
>>>>>> + *
>>>>>> + *  If sel_out == 1, it will take refclk as output directly,
>>>>>> + *  the L1 Prescaler and the out divider will be bypassed.
>>>>>> + *
>>>>>> + *  If sel_out == 0, then outclk = refclk / div_ref * loopc / 
>>>>>> div_out;
>>>>>> + *
>>>>>> + * PLL working requirements:
>>>>>> + *
>>>>>> + *  1) 20 MHz <= refclk / div_ref <= 40Mhz
>>>>>> + *  2) 1.2 GHz <= refclk /div_out * loopc <= 3.2 Ghz
>>>>>> + */
>>>>>> +
>>>>>> +struct lsdc_pll_parms {
>>>>>> +    unsigned int div_ref;
>>>>>> +    unsigned int loopc;
>>>>>> +    unsigned int div_out;
>>>>>> +};
>>>>>> +
>>>>>> +struct lsdc_pll;
>>>>>> +
>>>>>> +struct lsdc_pixpll_funcs {
>>>>>> +    int (*setup)(struct lsdc_pll * const this);
>>>>>> +    bool (*compute)(struct lsdc_pll * const this,
>>>>>> +            unsigned int clock,
>>>>>> +            struct lsdc_pll_parms *pout);
>>>>>> +    int (*update)(struct lsdc_pll * const this,
>>>>>> +              struct lsdc_pll_parms const *pin);
>>>>>> +    unsigned int (*get_clock_rate)(struct lsdc_pll * const this,
>>>>>> +                       struct lsdc_pll_parms *pout);
>>>>>> +};
>>>>>> +
>>>>>> +struct lsdc_pll {
>>>>>> +    const struct lsdc_pixpll_funcs *funcs;
>>>>>> +    struct drm_device *ddev;
>>>>>> +    void __iomem *mmio;
>>>>>> +
>>>>>> +    /* PLL register offset */
>>>>>> +    u32 reg_base;
>>>>>> +    /* PLL register size in bytes */
>>>>>> +    u32 reg_size;
>>>>>> +
>>>>>> +    /* 100000kHz, fixed on all board found */
>>>>>> +    unsigned int ref_clock;
>>>>>> +
>>>>>> +    unsigned int index;
>>>>>> +};
>>>>>> +
>>>>>> +int lsdc_pixpll_init(struct lsdc_pll * const this,
>>>>>> +             struct drm_device *ddev,
>>>>>> +             unsigned int index);
>>>>>> +
>>>>>> +#endif
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.c 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_regs.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..c7950c43968f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_regs.c
>>>>>> @@ -0,0 +1,29 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +
>>>>>> +#include "lsdc_drv.h"
>>>>>> +#include "lsdc_regs.h"
>>>>>> +
>>>>>> +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32 offset)
>>>>>> +{
>>>>>> +    unsigned long flags;
>>>>>> +    u32 ret;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    ret = readl(ldev->reg_base + offset);
>>>>>> +
>>>>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    return ret;
>>>>>> +}
>>>>>> +
>>>>>> +void lsdc_wreg32(struct lsdc_device * const ldev, u32 offset, 
>>>>>> u32 val)
>>>>>> +{
>>>>>> +    unsigned long flags;
>>>>>> +
>>>>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>>>>> +
>>>>>> +    writel(val, ldev->reg_base + offset);
>>>>>> +
>>>>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>>>>> +}
>>>>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.h 
>>>>>> b/drivers/gpu/drm/lsdc/lsdc_regs.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..828956633137
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/lsdc/lsdc_regs.h
>>>>>> @@ -0,0 +1,296 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>>> +
>>>>>> +#ifndef __LSDC_REGS_H__
>>>>>> +#define __LSDC_REGS_H__
>>>>>> +
>>>>>> +#include <linux/bitops.h>
>>>>>> +#include <linux/types.h>
>>>>>> +
>>>>>> +/*
>>>>>> + * PIXEL PLL Reference clock
>>>>>> + */
>>>>>> +#define LSDC_PLL_REF_CLK 100000           /* kHz */
>>>>>> +
>>>>>> +/*
>>>>>> + * Those PLL registers are not located at DC reg bar space,
>>>>>> + * there are relative to LSXXXXX_CFG_REG_BASE.
>>>>>> + * XXXXX = 7A1000, 2K1000, 2K0500
>>>>>> + */
>>>>>> +
>>>>>> +/* LS2K1000 */
>>>>>> +#define LS2K1000_PIX_PLL0_REG           0x04B0
>>>>>> +#define LS2K1000_PIX_PLL1_REG           0x04C0
>>>>>> +#define LS2K1000_CFG_REG_BASE           0x1fe10000
>>>>>> +
>>>>>> +/* LS7A1000 and LS2K2000 */
>>>>>> +#define LS7A1000_PIX_PLL0_REG           0x04B0
>>>>>> +#define LS7A1000_PIX_PLL1_REG           0x04C0
>>>>>> +#define LS7A1000_CFG_REG_BASE           0x10010000
>>>>>> +
>>>>>> +/* LS2K0500 */
>>>>>> +#define LS2K0500_PIX_PLL0_REG           0x0418
>>>>>> +#define LS2K0500_PIX_PLL1_REG           0x0420
>>>>>> +#define LS2K0500_CFG_REG_BASE           0x1fe10000
>>>>>> +
>>>>>> +/*
>>>>>> + *  CRTC CFG REG
>>>>>> + */
>>>>>> +#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
>>>>>> +
>>>>>> +enum lsdc_pixel_format {
>>>>>> +    LSDC_PF_NONE = 0,
>>>>>> +    LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4 bits each 
>>>>>> [16 bits] */
>>>>>> +    LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits [16 bits] */
>>>>>> +    LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
>>>>>> +    LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
>>>>>> +    LSDC_PF_RGBA8888 = 5,  /* ARGB [32 bits] */
>>>>>> +};
>>>>>> +
>>>>>> +/*
>>>>>> + * Each crtc has two set fb address registers usable, 
>>>>>> CFG_FB_IN_USING of
>>>>>> + * LSDC_CRTCx_CFG_REG specify which fb address register is 
>>>>>> currently
>>>>>> + * in using by the CRTC. CFG_PAGE_FLIP of LSDC_CRTCx_CFG_REG is 
>>>>>> used to
>>>>>> + * trigger the switch which will be finished at the very vblank. 
>>>>>> If you
>>>>>> + * want it switch to another again, you must set CFG_PAGE_FLIP 
>>>>>> again.
>>>>>> + */
>>>>>> +#define CFG_PAGE_FLIP                   BIT(7)
>>>>>> +#define CFG_OUTPUT_EN                   BIT(8)
>>>>>> +/* CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using 
>>>>>> hardware logic */
>>>>>> +#define CFG_PANEL_SWITCH                BIT(9)
>>>>>> +/* Indicate witch fb addr reg is in using, currently */
>>>>>> +#define CFG_FB_IN_USING                 BIT(11)
>>>>>> +#define CFG_GAMMA_EN                    BIT(12)
>>>>>> +
>>>>>> +/* CRTC get soft reset if voltage level change from 1 -> 0 */
>>>>>> +#define CFG_RESET_N                     BIT(20)
>>>>>> +
>>>>>> +#define CFG_HSYNC_EN                    BIT(30)
>>>>>> +#define CFG_HSYNC_INV                   BIT(31)
>>>>>> +#define CFG_VSYNC_EN                    BIT(30)
>>>>>> +#define CFG_VSYNC_INV                   BIT(31)
>>>>>> +
>>>>>> +/* THE DMA step of the DC in LS7A2000 is configurable */
>>>>>> +#define LSDC_DMA_STEP_MASK              GENMASK(17, 16)
>>>>>> +enum lsdc_dma_steps_supported {
>>>>>> +    LSDC_DMA_STEP_256_BYTES = 0,
>>>>>> +    LSDC_DMA_STEP_128_BYTES = 1,
>>>>>> +    LSDC_DMA_STEP_64_BYTES = 2,
>>>>>> +    LSDC_DMA_STEP_32_BYTES = 3,
>>>>>> +};
>>>>>> +
>>>>>> +/******** CRTC0 & DVO0 ********/
>>>>>> +#define LSDC_CRTC0_CFG_REG              0x1240
>>>>>> +#define LSDC_CRTC0_FB0_LO_ADDR_REG      0x1260
>>>>>> +#define LSDC_CRTC0_FB0_HI_ADDR_REG      0x15A0
>>>>>> +#define LSDC_CRTC0_FB1_LO_ADDR_REG      0x1580
>>>>>> +#define LSDC_CRTC0_FB1_HI_ADDR_REG      0x15C0
>>>>>> +#define LSDC_CRTC0_STRIDE_REG           0x1280
>>>>>> +#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
>>>>>> +#define LSDC_CRTC0_HDISPLAY_REG         0x1400
>>>>>> +#define LSDC_CRTC0_HSYNC_REG            0x1420
>>>>>> +#define LSDC_CRTC0_VDISPLAY_REG         0x1480
>>>>>> +#define LSDC_CRTC0_VSYNC_REG            0x14A0
>>>>>> +#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
>>>>>> +#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
>>>>>> +
>>>>>> +/******** CTRC1 & DVO1 ********/
>>>>>> +#define LSDC_CRTC1_CFG_REG              0x1250
>>>>>> +#define LSDC_CRTC1_FB0_LO_ADDR_REG      0x1270
>>>>>> +#define LSDC_CRTC1_FB0_HI_ADDR_REG      0x15B0
>>>>>> +#define LSDC_CRTC1_FB1_LO_ADDR_REG      0x1590
>>>>>> +#define LSDC_CRTC1_FB1_HI_ADDR_REG      0x15D0
>>>>>> +#define LSDC_CRTC1_STRIDE_REG           0x1290
>>>>>> +#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
>>>>>> +#define LSDC_CRTC1_HDISPLAY_REG         0x1410
>>>>>> +#define LSDC_CRTC1_HSYNC_REG            0x1430
>>>>>> +#define LSDC_CRTC1_VDISPLAY_REG         0x1490
>>>>>> +#define LSDC_CRTC1_VSYNC_REG            0x14B0
>>>>>> +#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
>>>>>> +#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
>>>>>> +
>>>>>> +/*
>>>>>> + * LS7A2000 has the hardware which record the scan position of 
>>>>>> the CRTC
>>>>>> + * [31:16] : current X position, [15:0] : current Y position
>>>>>> + */
>>>>>> +#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
>>>>>> +#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
>>>>>> +
>>>>>> +/*
>>>>>> + * LS7A2000 has the hardware which count the number of vblank 
>>>>>> generated
>>>>>> + */
>>>>>> +#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
>>>>>> +#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
>>>>>> +
>>>>>> +/* In all, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG = 0x10 */
>>>>>> +
>>>>>> +/*
>>>>>> + * There is only one hardware cursor unit in ls7a1000, ls2k1000 
>>>>>> and ls2k0500.
>>>>>> + * well, ls7a2000 has two hardware cursor unit.
>>>>>> + */
>>>>>> +#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
>>>>>> +enum lsdc_cursor_format {
>>>>>> +    CURSOR_FORMAT_DISABLE = 0,
>>>>>> +    CURSOR_FORMAT_MONOCHROME = 1,
>>>>>> +    CURSOR_FORMAT_ARGB8888 = 2,
>>>>>> +};
>>>>>> +
>>>>>> +#define CURSOR_SIZE_64X64               BIT(2)
>>>>>> +#define CURSOR_LOCATION                 BIT(4)
>>>>>> +
>>>>>> +#define LSDC_CURSOR0_CFG_REG            0x1520
>>>>>> +#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
>>>>>> +#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
>>>>>> +#define LSDC_CURSOR0_POSITION_REG       0x1540
>>>>>> +#define LSDC_CURSOR0_BG_COLOR_REG       0x1550  /* background 
>>>>>> color */
>>>>>> +#define LSDC_CURSOR0_FG_COLOR_REG       0x1560  /* foreground 
>>>>>> color */
>>>>>> +
>>>>>> +#define LSDC_CURSOR1_CFG_REG            0x1670
>>>>>> +#define LSDC_CURSOR1_ADDR_LO_REG        0x1680
>>>>>> +#define LSDC_CURSOR1_ADDR_HI_REG        0x16e0
>>>>>> +#define LSDC_CURSOR1_POSITION_REG       0x1690  /* [31:16] Y, 
>>>>>> [15:0] X */
>>>>>> +#define LSDC_CURSOR1_BG_COLOR_REG       0x16A0  /* background 
>>>>>> color */
>>>>>> +#define LSDC_CURSOR1_FG_COLOR_REG       0x16B0  /* foreground 
>>>>>> color */
>>>>>> +
>>>>>> +/*
>>>>>> + * DC Interrupt Control Register, 32bit, Address Offset: 1570
>>>>>> + *
>>>>>> + * Bits 15:0 inidicate the interrupt status
>>>>>> + * Bits 31:16 control enable interrupts corresponding to bit 
>>>>>> 15:0 or not
>>>>>> + * Write 1 to enable, write 0 to disable
>>>>>> + *
>>>>>> + * RF: Read Finished
>>>>>> + * IDBU: Internal Data Buffer Underflow
>>>>>> + * IDBFU: Internal Data Buffer Fatal Underflow
>>>>>> + * CBRF: Cursor Buffer Read Finished Flag, no use.
>>>>>> + *
>>>>>> + * 
>>>>>> +-------+--------------------------+-------+--------+--------+-------+ 
>>>>>>
>>>>>> + * | 31:27 |         26:16            | 15:11 |   10 | 9 |   8   |
>>>>>> + * 
>>>>>> +-------+--------------------------+-------+--------+--------+-------+ 
>>>>>>
>>>>>> + * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0 | IDBFU1 
>>>>>> | IDBU0 |
>>>>>> + * 
>>>>>> +-------+--------------------------+-------+--------+--------+-------+ 
>>>>>>
>>>>>> + *
>>>>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>>>>> + * |   7   |  6  |  5  |  4   |   3    |   2    | 1    | 0    |
>>>>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>>>>> + * | IDBU1 | RF0 | RF1 | CRRF | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
>>>>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>>>>> + */
>>>>>> +
>>>>>> +#define LSDC_INT_REG                    0x1570
>>>>>> +
>>>>>> +#define INT_CRTC0_VSYNC                 BIT(2)
>>>>>> +#define INT_CRTC0_HSYNC                 BIT(3)
>>>>>> +#define INT_CRTC0_RF                    BIT(6)
>>>>>> +#define INT_CRTC0_IDBU                  BIT(8)
>>>>>> +#define INT_CRTC0_IDBFU                 BIT(10)
>>>>>> +
>>>>>> +#define INT_CRTC1_VSYNC                 BIT(0)
>>>>>> +#define INT_CRTC1_HSYNC                 BIT(1)
>>>>>> +#define INT_CRTC1_RF                    BIT(5)
>>>>>> +#define INT_CRTC1_IDBU                  BIT(7)
>>>>>> +#define INT_CRTC1_IDBFU                 BIT(9)
>>>>>> +
>>>>>> +#define INT_CRTC0_VS_EN                 BIT(18)
>>>>>> +#define INT_CRTC0_HS_EN                 BIT(19)
>>>>>> +#define INT_CRTC0_RF_EN                 BIT(22)
>>>>>> +#define INT_CRTC0_IDBU_EN               BIT(24)
>>>>>> +#define INT_CRTC0_IDBFU_EN              BIT(26)
>>>>>> +
>>>>>> +#define INT_CRTC1_VS_EN                 BIT(16)
>>>>>> +#define INT_CRTC1_HS_EN                 BIT(17)
>>>>>> +#define INT_CRTC1_RF_EN                 BIT(21)
>>>>>> +#define INT_CRTC1_IDBU_EN               BIT(23)
>>>>>> +#define INT_CRTC1_IDBFU_EN              BIT(25)
>>>>>> +
>>>>>> +#define INT_STATUS_MASK                 GENMASK(15, 0)
>>>>>> +
>>>>>> +/*
>>>>>> + * LS7A1000/LS7A2000 have 4 gpios which are used to emulated I2C.
>>>>>> + * They are under control of the LS7A_DC_GPIO_DAT_REG and 
>>>>>> LS7A_DC_GPIO_DIR_REG
>>>>>> + * register, Those GPIOs has no relationship whth the GPIO 
>>>>>> hardware on the
>>>>>> + * bridge chip itself. Those offsets are relative to DC register 
>>>>>> base address
>>>>>> + *
>>>>>> + * LS2k1000 and LS2K0500 don't have those registers, they use 
>>>>>> hardware i2c
>>>>>> + * or general GPIO emulated i2c from linux i2c subsystem.
>>>>>> + *
>>>>>> + * GPIO data register, address offset: 0x1650
>>>>>> + *   +---------------+-----------+-----------+
>>>>>> + *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
>>>>>> + *   +---------------+-----------+-----------+
>>>>>> + *   |               |    DVO1   |    DVO0   |
>>>>>> + *   +      N/A      +-----------+-----------+
>>>>>> + *   |               | SCL | SDA | SCL | SDA |
>>>>>> + *   +---------------+-----------+-----------+
>>>>>> + */
>>>>>> +#define LS7A_DC_GPIO_DAT_REG            0x1650
>>>>>> +
>>>>>> +/*
>>>>>> + *  GPIO Input/Output direction control register, address 
>>>>>> offset: 0x1660
>>>>>> + */
>>>>>> +#define LS7A_DC_GPIO_DIR_REG            0x1660
>>>>>> +
>>>>>> +/*
>>>>>> + *  LS7A2000 has two built-in HDMI Encoder and one VGA encoder
>>>>>> + */
>>>>>> +
>>>>>> +/*
>>>>>> + * Number of continuous packets may be present
>>>>>> + * in HDMI hblank and vblank zone, should >= 48
>>>>>> + */
>>>>>> +#define LSDC_HDMI0_ZONE_REG             0x1700
>>>>>> +#define LSDC_HDMI1_ZONE_REG             0x1710
>>>>>> +
>>>>>> +#define HDMI_INTERFACE_EN               BIT(0)
>>>>>> +#define HDMI_PACKET_EN                  BIT(1)
>>>>>> +#define HDMI_AUDIO_EN                   BIT(2)
>>>>>> +#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
>>>>>> +#define HDMI_HW_I2C_EN                  BIT(8)
>>>>>> +#define HDMI_CTL_PERIOD_MODE            BIT(9)
>>>>>> +#define LSDC_HDMI0_CTRL_REG             0x1720
>>>>>> +#define LSDC_HDMI1_CTRL_REG             0x1730
>>>>>> +
>>>>>> +#define HDMI_PHY_EN                     BIT(0)
>>>>>> +#define HDMI_PHY_RESET_N                BIT(1)
>>>>>> +#define HDMI_PHY_TERM_L_EN              BIT(8)
>>>>>> +#define HDMI_PHY_TERM_H_EN              BIT(9)
>>>>>> +#define HDMI_PHY_TERM_DET_EN            BIT(10)
>>>>>> +#define HDMI_PHY_TERM_STATUS            BIT(11)
>>>>>> +#define LSDC_HDMI0_PHY_CTRL_REG         0x1800
>>>>>> +#define LSDC_HDMI1_PHY_CTRL_REG         0x1810
>>>>>> +
>>>>>> +/*
>>>>>> + *  IDF: Input Division Factor
>>>>>> + *  ODF: Output Division Factor
>>>>>> + *   LF: Loop Factor
>>>>>> + *    M: Required Mult
>>>>>> + *
>>>>>> + * +--------------------------------------------------------+
>>>>>> + *  |     Fin (kHZ)     | M  | IDF | LF | ODF | Fout(Mhz)  |
>>>>>> + * |-------------------+----+-----+----+-----+--------------|
>>>>>> + *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~ 3400  |
>>>>>> + *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~ 1700  |
>>>>>> + *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~ 850   |
>>>>>> + *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~ 425  |
>>>>>> + *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~ 212.5 |
>>>>>> + * +--------------------------------------------------------+
>>>>>> + */
>>>>>> +#define LSDC_HDMI0_PHY_PLL_REG    ��     0x1820
>>>>>> +#define LSDC_HDMI1_PHY_PLL_REG          0x1830
>>>>>> +
>>>>>> +#define HDMI_PLL_ENABLE                 BIT(0)
>>>>>> +#define HDMI_PLL_LOCKED                 BIT(16)
>>>>>> +#define HDMI_PLL_BYPASS                 BIT(17)
>>>>>> +
>>>>>> +#define HDMI_PLL_IDF_SHIFT              1
>>>>>> +#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
>>>>>> +#define HDMI_PLL_LF_SHIFT               6
>>>>>> +#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
>>>>>> +#define HDMI_PLL_ODF_SHIFT              13
>>>>>> +#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
>>>>>> +
>>>>>> +/* LS7A2000 have hpd support */
>>>>>> +#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
>>>>>> +#define HDMI0_HPD_FLAG                  BIT(0)
>>>>>> +#define HDMI1_HPD_FLAG                  BIT(1)
>>>>>> +
>>>>>> +#endif
>>>>>
>>>>
>>>
>
--------------umbYD8oi4h9dzQad4PFY3gji
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023/2/23 20:49, Thomas Zimmermann
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2478426e-11fd-de23-2059-e7b7249943c2@suse.de">Hi
      <br>
      <br>
      Am 18.02.23 um 16:30 schrieb Sui Jingfeng:
      <br>
      [...]
      <br>
      <blockquote type="cite">
        <blockquote type="cite">
          <br>
          No problem. I think I mentioned that it wouldn't make sense to
          merge the DRM driver before ACPI and/or DT are ready. So we
          have time to get the driver into good shape.
          <br>
          <br>
        </blockquote>
        Sigh,  :(
        <br>
        <br>
        Then can we drop the support for SoC chips temporary,  and
        provide DT support at latter time?
        <br>
      </blockquote>
      <br>
      Yes, of course DT can be provided later when it is ready.  If you
      have something that is currently usable, you can submit it. But if
      your patch depends on other kernel features, those features should
      be ready first. And if your driver cannot be used at all without
      those features, there's no point in merging the driver until the
      feature is ready.
      <br>
      <br>
    </blockquote>
    <pre class="content">After you said "It's also ok to to read version information from a status register."
</pre>
    <p></p>
    <p>I'm thinking this all night, this  sentence strike me. <br>
    </p>
    <p>Suddenly I remember that our CPU has version and features
      register.</p>
    <p>It is called cpucfg[1] registers, cpucfg is also a instruction on
      LoongArch, it is similar like x86-64's cpuid instruction.</p>
    <p>All LoongArch cpu support cpucfg, besides provide basic version
      information,  It is also provided features the per cpu supported.</p>
    <p>For example: <br>
    </p>
    <p>LS3A5000 support LSX(128-bit SIMD) and LASX(256-bit SIMD), it has
      a  <span class="p_add">0x0014c000  as its PRID.<br>
      </span></p>
    <p>LS2K2000 support LSX(128-bit SIMD) only, it has a  <span
        class="p_add">0x0014b000  as its process id.</span></p>
    <p>LS2K1000 LA264 version support LSX(128-bit SIMD) only, it has a 
      <span class="p_add">0x0014a000  as its PRID.</span></p>
    <p><span class="p_add">Despite the least significant 8 bit is 
        revision number which suffer from change,</span></p>
    <p><span class="p_add">but </span><span class="p_add"> bits 15:8 of
        the PRID register is unique per CPU. This 8 bits can be used to</span></p>
    <p><span class="p_add">identify the processor solely.  In fact, this
        register is also been used by the kernel</span></p>
    <p><span class="p_add">side programmer to expose CPU features to
        userspace(say /proc/cpuinfo).<br>
      </span></p>
    <p><span class="p_add">It is also been used by compiler writer to
        generate difference code for different CPU.<br>
      </span></p>
    <p><span class="p_add"><br>
      </span></p>
    <p><span class="p_add">The PRID register is located at the CPU side,
        not the DC device itself, this is a concern.<br>
      </span></p>
    <p><span class="p_add"></span></p>
    <p><span class="p_add">But by the time the device driver get loaded,
        it(cpucfg) is guaranteed  can be used.<br>
      </span></p>
    <p><span class="p_add"><br>
      </span></p>
    <p><span class="p_add">We can use the value read from this register
        to differentiate whether the host CPU</span></p>
    <p><span class="p_add">is a SoC or not.  v4 of this patch series
        already use this method to </span><span class="p_add">differentiate
        the chips.</span><span class="p_header"><br>
      </span></p>
    <span class="p_header">The implement code is at lsdc_probe.c. Mips
      cpus of loongson have the similar prid register. </span>
    <p></p>
    <p><br>
    </p>
    <p>[1]
<a class="moz-txt-link-freetext" href="https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN#_cpucfg">https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN#_cpucfg</a><br>
      <br>
    </p>
    <blockquote type="cite"
      cite="mid:2478426e-11fd-de23-2059-e7b7249943c2@suse.de">
      <blockquote type="cite">
        <br>
        this patch is target to providing the generic part of device
        driver support for Loongson integrated graphics.
        <br>
        <br>
        I see the double mention :(, but still want to make sure if it
        is negotiable. Because for the DC in our bridge chip,
        <br>
        <br>
        this driver can be probed reliably. The code size of this patch
        and the technical description needed is actually
        <br>
        <br>
        large enough for me to carry on.   If this is not negotiable,
        then it is ok to provide DT support at the next version of
        <br>
        <br>
        this patch?  it(dt support patch) tend to incurring  more
        criticize. I'm scared and not want to face it.
        <br>
      </blockquote>
      <br>
      As I said above, if the driver can already be used with the bridge
      chip, reduce it to the required code. The DT support can be
      submitted later on.
      <br>
      <br>
      In fact, you should try to reduce your initial driver to the
      minimum size that is useable. Try to remove any feature or
      functionality that is not critical to get something on the
      screen.  The initial driver submission is the hardest.  Once the
      driver has been merged, it is much easier to add new features and
      get them merged quickly.
      <br>
      <br>
      First-time submitters often think they have to provide a
      feature-complete driver. So they send huge patches that are hard
      to understand review.  Those drivers then end up in an endless
      cycle of reviews.
      <br>
      <br>
      It's better to start small and grow the driver over time.
      <br>
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, I always want upload the most complete version in the past. 
    </p>
    <p>but only find it actually not necessary, maybe we should  keep
      the uncommon chip back. <br>
    </p>
    <p>They bring unnecessary concerns to reviewers, sorry about that. <br>
    </p>
    Focus on the chips which is most used maybe better (in a sense that
    people would like to use most). <br>
    <p><br>
    </p>
    <p>Emm..., I will respect you opinions.</p>
    <p>Would the method(<span class="p_add"> differentiate by</span> the
      cpu version provide by cpucfg) is acceptable? <br>
    </p>
    <p>If so we will not remove the code toward our SoC chip support.<br>
    </p>
    <p>I'm encourage leave those code there, we are really happy to see
      our SoC can use upstream kernel.</p>
    <p>Because SoC is low cost, A few students and hobbyist may choose
      them to study programming.</p>
    <blockquote type="cite"
      cite="mid:2478426e-11fd-de23-2059-e7b7249943c2@suse.de">Best
      regards
      <br>
      Thomas
      <br>
      <br>
      <blockquote type="cite">
        <br>
        We can leave the support for our SoC as internal, those SoC are
        really target for low end application.
        <br>
        <br>
        keep them back is actually ok.
        <br>
        <br>
        <br>
        <blockquote type="cite">Best regards
          <br>
          Thomas
          <br>
          <br>
          <blockquote type="cite">
            <br>
            and prepare next version.
            <br>
            <br>
            <blockquote type="cite">
              <blockquote type="cite">+
                <br>
                +    return pci_register_driver(&amp;lsdc_pci_driver);
                <br>
                +}
                <br>
                +module_init(lsdc_module_init);
                <br>
                +
                <br>
                +static void __exit lsdc_module_exit(void)
                <br>
                +{
                <br>
                +    pci_unregister_driver(&amp;lsdc_pci_driver);
                <br>
                +}
                <br>
                +module_exit(lsdc_module_exit);
                <br>
                +
                <br>
                +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
                <br>
                +MODULE_AUTHOR(DRIVER_AUTHOR);
                <br>
                +MODULE_DESCRIPTION(DRIVER_DESC);
                <br>
                +MODULE_LICENSE("GPL");
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h
                b/drivers/gpu/drm/lsdc/lsdc_drv.h
                <br>
                new file mode 100644
                <br>
                index 000000000000..d67dae0414ca
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
                <br>
                @@ -0,0 +1,274 @@
                <br>
                +/* SPDX-License-Identifier: GPL-2.0 */
                <br>
                +/*
                <br>
                + * KMS driver for Loongson display controller
                <br>
                + * Copyright (C) 2022 Loongson Corporation
                <br>
                + *
                <br>
                + * Authors:
                <br>
                + *      Li Yi <a class="moz-txt-link-rfc2396E" href="mailto:liyi@loongson.cn">&lt;liyi@loongson.cn&gt;</a>
                <br>
                + *      Li Chenyang <a class="moz-txt-link-rfc2396E" href="mailto:lichenyang@loongson.cn">&lt;lichenyang@loongson.cn&gt;</a>
                <br>
                + *      Sui Jingfeng <a class="moz-txt-link-rfc2396E" href="mailto:suijingfeng@loongson.cn">&lt;suijingfeng@loongson.cn&gt;</a>
                <br>
                + */
                <br>
                +
                <br>
                +#ifndef __LSDC_DRV_H__
                <br>
                +#define __LSDC_DRV_H__
                <br>
                +
                <br>
                +#include &lt;linux/i2c.h&gt;
                <br>
                +#include &lt;linux/i2c-algo-bit.h&gt;
                <br>
                +
                <br>
                +#include &lt;drm/drm_print.h&gt;
                <br>
                +#include &lt;drm/drm_device.h&gt;
                <br>
                +#include &lt;drm/drm_crtc.h&gt;
                <br>
                +#include &lt;drm/drm_plane.h&gt;
                <br>
                +#include &lt;drm/drm_connector.h&gt;
                <br>
                +#include &lt;drm/drm_encoder.h&gt;
                <br>
                +#include &lt;drm/drm_drv.h&gt;
                <br>
                +#include &lt;drm/drm_atomic.h&gt;
                <br>
                +
                <br>
                +#include "lsdc_regs.h"
                <br>
                +#include "lsdc_pll.h"
                <br>
                +
                <br>
                +#define LSDC_NUM_CRTC           2
                <br>
                +
                <br>
                +/*
                <br>
                + * The display controller in LS7A2000 integrate three
                loongson self-made
                <br>
                + * encoder. Display pipe 0 has a transparent VGA
                encoder and a HDMI phy,
                <br>
                + * they are parallel. Display pipe 1 has only one HDMI
                phy.
                <br>
                + *       ______________________ _____________
                <br>
                + *      |             +-----+  | |             |
                <br>
                + *      | CRTC0 -+--&gt; | VGA |  ----&gt; VGA
                Connector ---&gt; | VGA Monitor |&lt;---+
                <br>
                + *      |        |    +-----+  | |_____________|    |
                <br>
                + *      |        |             | ______________    |
                <br>
                + *      |        |    +------+ | |              |   |
                <br>
                + *      |        +--&gt; | HDMI | ----&gt; HDMI
                Connector --&gt; | HDMI Monitor |&lt;--+
                <br>
                + *      |             +------+ | |______________|   |
                <br>
                + *      |            +------+
                |                                           |
                <br>
                + *      |            | i2c6 |
                &lt;-------------------------------------------+
                <br>
                + *      |            +------+  |
                <br>
                + *      |                      |
                <br>
                + *      |    DC in LS7A2000    |
                <br>
                + *      |                      |
                <br>
                + *      |            +------+  |
                <br>
                + *      |            | i2c7 |
                &lt;--------------------------------+
                <br>
                + *      |            +------+  | |
                <br>
                + *      |                      | ______|_______
                <br>
                + *      |            +------+  | |              |
                <br>
                + *      | CRTC1 ---&gt; | HDMI |  ----&gt; HDMI
                Connector ---&gt; | HDMI Monitor |
                <br>
                + *      |            +------+  | |______________|
                <br>
                + *      |______________________|
                <br>
                + *
                <br>
                + *
                <br>
                + * The display controller in LS7A1000 integrate two-way
                DVO, external
                <br>
                + * encoder is required except use directly with
                dpi(rgb888) panel.
                <br>
                + * ___________________ _________
                <br>
                + *      |            -------| |         |
                <br>
                + *      |  CRTC0 --&gt; | DVO0 ----&gt; Encoder0
                ---&gt; Connector0 ---&gt; | Display |
                <br>
                + *      |  _   _     -------|        ^             ^
                |_________|
                <br>
                + *      | | | | |    -------|        |             |
                <br>
                + *      | |_| |_|    | i2c6 &lt;--------+-------------+
                <br>
                + *      |            -------|
                <br>
                + *      |  _   _     -------|
                <br>
                + *      | | | | |    | i2c7 &lt;--------+-------------+
                <br>
                + *      | |_| |_|    -------|        | | _________
                <br>
                + *      |            -------|        |             |
                |         |
                <br>
                + *      |  CRTC1 --&gt; | DVO1 ----&gt; Encoder1
                ---&gt; Connector1 ---&gt; | Panel  |
                <br>
                + *      |            -------| |_________|
                <br>
                + *      |___________________|
                <br>
                + *
                <br>
                + *
                <br>
                + * The display controller in LS2K1000.
                <br>
                + * ___________________ _________
                <br>
                + *      |            -------| |         |
                <br>
                + *      |  CRTC0 --&gt; | DVO0 ----&gt; Encoder0
                ---&gt; Connector0 ---&gt; | Display |
                <br>
                + *      |  _   _     -------|        ^              ^
                |_________|
                <br>
                + *      | | | | |           |        |              |
                <br>
                + *      | |_| |_|           |     +------+          |
                <br>
                + *      |                   &lt;----&gt;| i2c0
                |&lt;---------+
                <br>
                + *      |  DC in LS2K1000   |     +------+
                <br>
                + *      |  _   _            |     +------+
                <br>
                + *      | | | | |           &lt;----&gt;| i2c1
                |----------+
                <br>
                + *      | |_| |_|           |     +------+ | _________
                <br>
                + *      |            -------|        |              |
                |         |
                <br>
                + *      |  CRTC1 --&gt; | DVO1 ----&gt; Encoder1
                ---&gt; Connector1 ---&gt; | Panel  |
                <br>
                + *      |            -------| |_________|
                <br>
                + *      |___________________|
                <br>
                + *
                <br>
                + *
                <br>
                + * The display controller in LS2K0500, LS2K0500 has a
                built-in transparent
                <br>
                + * VGA encoder which is connected to display pipe
                1(CRTC1).
                <br>
                + * ___________________ _________
                <br>
                + *      |            -------| |         |
                <br>
                + *      |  CRTC0 --&gt; | DVO0 ----&gt; Encoder0
                ---&gt; Connector0 ---&gt; | Display |
                <br>
                + *      |  _   _     -------|        ^              ^
                |_________|
                <br>
                + *      | | | | |           |        |              |
                <br>
                + *      | |_| |_|           |     +------+          |
                <br>
                + *      |                   &lt;----&gt;| i2c4
                |&lt;---------+
                <br>
                + *      |  DC in LS2K0500   |     +------+
                <br>
                + *      |  _   _            |     +------+
                <br>
                + *      | | | | |           &lt;----&gt;| i2c5
                |-------------------+
                <br>
                + *      | |_| |_|           |     +------+
                ______|______
                <br>
                + *      |           +-----+ | |             |
                <br>
                + *      | CRTC1 --&gt; | VGA |
                ------------------------&gt; | VGA Monitor |
                <br>
                + *      |           +-----+ | |_____________|
                <br>
                + *      |___________________|
                <br>
                + *
                <br>
                + * LS7A1000 and LS7A2000 are bridge chips, has
                dedicated Video RAM.
                <br>
                + * while LS2K2000/LS2K1000/LS2K0500 are SoC, they don't
                have dediacated
                <br>
                + * Video RAM. The dc in LS2K2000 is basicly same with
                the dc in LS7A1000
                <br>
                + * except that LS2K2000 don't have a video RAM and have
                only one built-in
                <br>
                + * hdmi encoder.
                <br>
                + *
                <br>
                + * There is only a 1:1 mapping of encoders and
                connectors for the DC,
                <br>
                + * each CRTC have two FB address registers.
                <br>
                + */
                <br>
                +
                <br>
                +enum loongson_chip_family {
                <br>
                +    CHIP_UNKNOWN = 0,
                <br>
                +    CHIP_LS7A1000 = 1,  /* North bridge of
                LS3A3000/LS3A4000/LS3A5000 */
                <br>
                +    CHIP_LS7A2000 = 2,  /* Update version of LS7A1000,
                with built-in HDMI encoder */
                <br>
                +    CHIP_LS2K0500 = 3,  /* Reduced version of LS2K1000,
                single core */
                <br>
                +    CHIP_LS2K1000 = 4,  /* 2-Core Mips64r2/LA264 SoC,
                64-bit, 1.0 Ghz */
                <br>
                +    CHIP_LS2K2000 = 5,  /* 2-Core 64-bit LA364 SoC, 1.2
                ~ 1.5 Ghz */
                <br>
                +    CHIP_LAST,
                <br>
                +};
                <br>
                +
                <br>
                +struct lsdc_desc {
                <br>
                +    enum loongson_chip_family chip;
                <br>
                +    u32 num_of_crtc;
                <br>
                +    u32 max_pixel_clk;
                <br>
                +    u32 max_width;
                <br>
                +    u32 max_height;
                <br>
                +    u32 num_of_hw_cursor;
                <br>
                +    u32 hw_cursor_w;
                <br>
                +    u32 hw_cursor_h;
                <br>
                +    u32 pitch_align;  /* DMA alignment constraint */
                <br>
                +    u64 mc_bits;      /* physical address bus bit width
                */
                <br>
                +    bool has_vblank_counter;
                <br>
                +    bool has_builtin_i2c;
                <br>
                +    bool has_vram;
                <br>
                +    bool has_hpd_reg;
                <br>
                +    bool is_soc;
                <br>
                +};
                <br>
                +
                <br>
                +struct lsdc_i2c {
                <br>
                +    struct i2c_adapter adapter;
                <br>
                +    struct i2c_algo_bit_data bit;
                <br>
                +    struct drm_device *ddev;
                <br>
                +    void __iomem *reg_base;
                <br>
                +    void __iomem *dir_reg;
                <br>
                +    void __iomem *dat_reg;
                <br>
                +    /* pin bit mask */
                <br>
                +    u8 sda;
                <br>
                +    u8 scl;
                <br>
                +};
                <br>
                +
                <br>
                +/*
                <br>
                + * struct lsdc_display_pipe - Abstraction of hardware
                display pipeline.
                <br>
                + * @crtc: CRTC control structure
                <br>
                + * @primary: framebuffer plane control structure
                <br>
                + * @cursor: cursor plane control structure
                <br>
                + * @output: output control structure of this display
                pipe bind
                <br>
                + * @pixpll: pixel pll control structure
                <br>
                + * @index: the index corresponding to the hardware
                display pipe
                <br>
                + */
                <br>
                +struct lsdc_display_pipe {
                <br>
                +    struct drm_crtc crtc;
                <br>
                +    struct drm_plane primary;
                <br>
                +    struct drm_plane cursor;
                <br>
                +    struct drm_encoder encoder;
                <br>
                +    struct drm_connector connector;
                <br>
                +    struct lsdc_pll pixpll;
                <br>
                +    struct lsdc_i2c *li2c;
                <br>
                +    int index;
                <br>
                +};
                <br>
                +
                <br>
                +static inline struct lsdc_display_pipe *
                <br>
                +crtc_to_display_pipe(struct drm_crtc *crtc)
                <br>
                +{
                <br>
                +    return container_of(crtc, struct lsdc_display_pipe,
                crtc);
                <br>
                +}
                <br>
                +
                <br>
                +static inline struct lsdc_display_pipe *
                <br>
                +cursor_to_display_pipe(struct drm_plane *cursor)
                <br>
                +{
                <br>
                +    return container_of(cursor, struct
                lsdc_display_pipe, cursor);
                <br>
                +}
                <br>
                +
                <br>
                +static inline struct lsdc_display_pipe *
                <br>
                +connector_to_display_pipe(struct drm_connector *conn)
                <br>
                +{
                <br>
                +    return container_of(conn, struct lsdc_display_pipe,
                connector);
                <br>
                +}
                <br>
                +
                <br>
                +static inline struct lsdc_display_pipe *
                <br>
                +encoder_to_display_pipe(struct drm_encoder *enc)
                <br>
                +{
                <br>
                +    return container_of(enc, struct lsdc_display_pipe,
                encoder);
                <br>
                +}
                <br>
                +
                <br>
                +struct lsdc_crtc_state {
                <br>
                +    struct drm_crtc_state base;
                <br>
                +    struct lsdc_pll_parms pparms;
                <br>
                +};
                <br>
                +
                <br>
                +struct lsdc_device {
                <br>
                +    struct drm_device base;
                <br>
                +
                <br>
                +    /* @reglock: protects concurrent register access */
                <br>
                +    spinlock_t reglock;
                <br>
                +    void __iomem *reg_base;
                <br>
                +    void __iomem *vram;
                <br>
                +    resource_size_t vram_base;
                <br>
                +    resource_size_t vram_size;
                <br>
                +    u64 mc_mask;
                <br>
                +
                <br>
                +    struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
                <br>
                +
                <br>
                +    /* @num_output: count the number of active display
                pipe */
                <br>
                +    unsigned int num_output;
                <br>
                +
                <br>
                +    /* @descp: features description of the DC variant
                */
                <br>
                +    const struct lsdc_desc *descp;
                <br>
                +
                <br>
                +    u32 irq_status;
                <br>
                +};
                <br>
                +
                <br>
                +static inline struct lsdc_device *
                <br>
                +to_lsdc(struct drm_device *ddev)
                <br>
                +{
                <br>
                +    return container_of(ddev, struct lsdc_device,
                base);
                <br>
                +}
                <br>
                +
                <br>
                +static inline struct lsdc_crtc_state *
                <br>
                +to_lsdc_crtc_state(struct drm_crtc_state *base)
                <br>
                +{
                <br>
                +    return container_of(base, struct lsdc_crtc_state,
                base);
                <br>
                +}
                <br>
                +
                <br>
                +void lsdc_debugfs_init(struct drm_minor *minor);
                <br>
                +
                <br>
                +int lsdc_crtc_init(struct drm_device *ddev,
                <br>
                +           struct drm_crtc *crtc,
                <br>
                +           unsigned int index,
                <br>
                +           struct drm_plane *primary,
                <br>
                +           struct drm_plane *cursor);
                <br>
                +
                <br>
                +int lsdc_plane_init(struct lsdc_device *ldev,
                <br>
                +            struct drm_plane *plane,
                <br>
                +            enum drm_plane_type type,
                <br>
                +            unsigned int index);
                <br>
                +
                <br>
                +int lsdc_create_output(struct lsdc_device *ldev,
                unsigned int index);
                <br>
                +
                <br>
                +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device
                *ddev,
                <br>
                +                      void *base,
                <br>
                +                      unsigned int index);
                <br>
                +
                <br>
                +struct i2c_adapter *lsdc_get_i2c_adapter(struct
                lsdc_device *ldev, int index);
                <br>
                +
                <br>
                +irqreturn_t lsdc_irq_thread_handler(int irq, void
                *arg);
                <br>
                +irq_handler_t lsdc_get_irq_handler(struct lsdc_device
                *ldev);
                <br>
                +
                <br>
                +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32
                offset);
                <br>
                +void lsdc_wreg32(struct lsdc_device * const ldev, u32
                offset, u32 val);
                <br>
                +
                <br>
                +#endif
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c
                b/drivers/gpu/drm/lsdc/lsdc_i2c.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..b380098409ca
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
                <br>
                @@ -0,0 +1,201 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include &lt;linux/i2c.h&gt;
                <br>
                +#include &lt;drm/drm_managed.h&gt;
                <br>
                +#include "lsdc_drv.h"
                <br>
                +#include "lsdc_regs.h"
                <br>
                +
                <br>
                +/*
                <br>
                + * ls7a_gpio_i2c_set - set the state of a gpio pin
                indicated by mask
                <br>
                + * @mask: gpio pin mask
                <br>
                + * @state: "0" for low, "1" for high
                <br>
                + */
                <br>
                +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const
                li2c, int mask, int state)
                <br>
                +{
                <br>
                +    struct lsdc_device *ldev = to_lsdc(li2c-&gt;ddev);
                <br>
                +    unsigned long flags;
                <br>
                +    u8 val;
                <br>
                +
                <br>
                +    spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
                <br>
                +
                <br>
                +    if (state) {
                <br>
                +        /*
                <br>
                +         * Setting this pin as input directly, write 1
                for Input.
                <br>
                +         * The external pull-up resistor will pull the
                level up
                <br>
                +         */
                <br>
                +        val = readb(li2c-&gt;dir_reg);
                <br>
                +        val |= mask;
                <br>
                +        writeb(val, li2c-&gt;dir_reg);
                <br>
                +    } else {
                <br>
                +        /* First set this pin as output, write 0 for
                Output */
                <br>
                +        val = readb(li2c-&gt;dir_reg);
                <br>
                +        val &amp;= ~mask;
                <br>
                +        writeb(val, li2c-&gt;dir_reg);
                <br>
                +
                <br>
                +        /* Then, make this pin output 0 */
                <br>
                +        val = readb(li2c-&gt;dat_reg);
                <br>
                +        val &amp;= ~mask;
                <br>
                +        writeb(val, li2c-&gt;dat_reg);
                <br>
                +    }
                <br>
                +
                <br>
                +    spin_unlock_irqrestore(&amp;ldev-&gt;reglock,
                flags);
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * ls7a_gpio_i2c_get - read value back from the gpio
                pin indicated by mask
                <br>
                + * @mask: gpio pin mask
                <br>
                + * return "0" for low, "1" for high
                <br>
                + */
                <br>
                +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const
                li2c, int mask)
                <br>
                +{
                <br>
                +    struct lsdc_device *ldev = to_lsdc(li2c-&gt;ddev);
                <br>
                +    unsigned long flags;
                <br>
                +    u8 val;
                <br>
                +
                <br>
                +    spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
                <br>
                +
                <br>
                +    /* First set this pin as input */
                <br>
                +    val = readb(li2c-&gt;dir_reg);
                <br>
                +    val |= mask;
                <br>
                +    writeb(val, li2c-&gt;dir_reg);
                <br>
                +
                <br>
                +    /* Then get level state from this pin */
                <br>
                +    val = readb(li2c-&gt;dat_reg);
                <br>
                +
                <br>
                +    spin_unlock_irqrestore(&amp;ldev-&gt;reglock,
                flags);
                <br>
                +
                <br>
                +    return (val &amp; mask) ? 1 : 0;
                <br>
                +}
                <br>
                +
                <br>
                +static void ls7a_i2c_set_sda(void *i2c, int state)
                <br>
                +{
                <br>
                +    struct lsdc_i2c * const li2c = (struct lsdc_i2c
                *)i2c;
                <br>
                +    /* set state on the li2c-&gt;sda pin */
                <br>
                +    return ls7a_gpio_i2c_set(li2c, li2c-&gt;sda,
                state);
                <br>
                +}
                <br>
                +
                <br>
                +static void ls7a_i2c_set_scl(void *i2c, int state)
                <br>
                +{
                <br>
                +    struct lsdc_i2c * const li2c = (struct lsdc_i2c
                *)i2c;
                <br>
                +    /* set state on the li2c-&gt;scl pin */
                <br>
                +    return ls7a_gpio_i2c_set(li2c, li2c-&gt;scl,
                state);
                <br>
                +}
                <br>
                +
                <br>
                +static int ls7a_i2c_get_sda(void *i2c)
                <br>
                +{
                <br>
                +    struct lsdc_i2c * const li2c = (struct lsdc_i2c
                *)i2c;
                <br>
                +    /* read value from the li2c-&gt;sda pin */
                <br>
                +    return ls7a_gpio_i2c_get(li2c, li2c-&gt;sda);
                <br>
                +}
                <br>
                +
                <br>
                +static int ls7a_i2c_get_scl(void *i2c)
                <br>
                +{
                <br>
                +    struct lsdc_i2c * const li2c = (struct lsdc_i2c
                *)i2c;
                <br>
                +    /* read the value from the li2c-&gt;scl pin */
                <br>
                +    return ls7a_gpio_i2c_get(li2c, li2c-&gt;scl);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_destroy_i2c(struct drm_device *ddev,
                void *data)
                <br>
                +{
                <br>
                +    struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
                <br>
                +
                <br>
                +    if (li2c) {
                <br>
                +        i2c_del_adapter(&amp;li2c-&gt;adapter);
                <br>
                +        kfree(li2c);
                <br>
                +    }
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * The DC in ls7a1000/ls7a2000 have builtin gpio
                hardware
                <br>
                + *
                <br>
                + * @base: gpio reg base
                <br>
                + * @index: output channel index, 0 for DVO0, 1 for DVO1
                <br>
                + */
                <br>
                +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device
                *ddev,
                <br>
                +                      void *base,
                <br>
                +                      unsigned int index)
                <br>
                +{
                <br>
                +    struct i2c_adapter *adapter;
                <br>
                +    struct lsdc_i2c *li2c;
                <br>
                +    int ret;
                <br>
                +
                <br>
                +    li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
                <br>
                +    if (!li2c)
                <br>
                +        return ERR_PTR(-ENOMEM);
                <br>
                +
                <br>
                +    if (index == 0) {
                <br>
                +        li2c-&gt;sda = 0x01;  /* pin 0 */
                <br>
                +        li2c-&gt;scl = 0x02;  /* pin 1 */
                <br>
                +    } else if (index == 1) {
                <br>
                +        li2c-&gt;sda = 0x04;  /* pin 2 */
                <br>
                +        li2c-&gt;scl = 0x08;  /* pin 3 */
                <br>
                +    }
                <br>
                +
                <br>
                +    li2c-&gt;reg_base = base;
                <br>
                +    li2c-&gt;ddev = ddev;
                <br>
                +    li2c-&gt;dir_reg = li2c-&gt;reg_base +
                LS7A_DC_GPIO_DIR_REG;
                <br>
                +    li2c-&gt;dat_reg = li2c-&gt;reg_base +
                LS7A_DC_GPIO_DAT_REG;
                <br>
                +
                <br>
                +    li2c-&gt;bit.setsda = ls7a_i2c_set_sda;
                <br>
                +    li2c-&gt;bit.setscl = ls7a_i2c_set_scl;
                <br>
                +    li2c-&gt;bit.getsda = ls7a_i2c_get_sda;
                <br>
                +    li2c-&gt;bit.getscl = ls7a_i2c_get_scl;
                <br>
                +    li2c-&gt;bit.udelay = 5;
                <br>
                +    li2c-&gt;bit.timeout = usecs_to_jiffies(2200);
                <br>
                +    li2c-&gt;bit.data = li2c;
                <br>
                +
                <br>
                +    adapter = &amp;li2c-&gt;adapter;
                <br>
                +    adapter-&gt;algo_data = &amp;li2c-&gt;bit;
                <br>
                +    adapter-&gt;owner = THIS_MODULE;
                <br>
                +    adapter-&gt;class = I2C_CLASS_DDC;
                <br>
                +    adapter-&gt;dev.parent = ddev-&gt;dev;
                <br>
                +    adapter-&gt;nr = -1;
                <br>
                +
                <br>
                +    snprintf(adapter-&gt;name,
                sizeof(adapter-&gt;name), "lsdc-i2c%u", index);
                <br>
                +
                <br>
                +    i2c_set_adapdata(adapter, li2c);
                <br>
                +
                <br>
                +    ret = i2c_bit_add_bus(adapter);
                <br>
                +    if (ret) {
                <br>
                +        kfree(li2c);
                <br>
                +        return ERR_PTR(ret);
                <br>
                +    }
                <br>
                +
                <br>
                +    ret = drmm_add_action_or_reset(ddev,
                lsdc_destroy_i2c, li2c);
                <br>
                +    if (ret)
                <br>
                +        return NULL;
                <br>
                +
                <br>
                +    drm_info(ddev, "%s(sda=%u, scl=%u) created for
                connector-%u\n",
                <br>
                +         adapter-&gt;name, li2c-&gt;sda, li2c-&gt;scl,
                index);
                <br>
                +
                <br>
                +    return li2c;
                <br>
                +}
                <br>
                +
                <br>
                +static int lsdc_get_i2c_id(struct lsdc_device *ldev,
                int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS2K1000)
                <br>
                +        return index;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS2K0500)
                <br>
                +        return index + 2;
                <br>
                +
                <br>
                +    return index;
                <br>
                +}
                <br>
                +
                <br>
                +struct i2c_adapter *lsdc_get_i2c_adapter(struct
                lsdc_device *ldev,
                <br>
                +                     int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +    struct lsdc_display_pipe *dispipe =
                &amp;ldev-&gt;dispipe[index];
                <br>
                +
                <br>
                +    if (descp-&gt;has_builtin_i2c) {
                <br>
                +        struct lsdc_i2c *li2c = dispipe-&gt;li2c;
                <br>
                +
                <br>
                +        if (li2c)
                <br>
                +            return &amp;li2c-&gt;adapter;
                <br>
                +    }
                <br>
                +
                <br>
                +    return i2c_get_adapter(lsdc_get_i2c_id(ldev,
                index));
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c
                b/drivers/gpu/drm/lsdc/lsdc_irq.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..71c85f09bb6f
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
                <br>
                @@ -0,0 +1,86 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include &lt;drm/drm_vblank.h&gt;
                <br>
                +#include "lsdc_drv.h"
                <br>
                +#include "lsdc_regs.h"
                <br>
                +
                <br>
                +/*
                <br>
                + * For the DC in ls7a2000, clearing interrupt status is
                achieved by
                <br>
                + * write "1" to LSDC_INT_REG, For the DC in ls7a1000,
                ls2k1000 and
                <br>
                + * ls2k0500, clearing interrupt status is achieved by
                write "0" to
                <br>
                + * LSDC_INT_REG. Two different hardware engineer of
                Loongson modify
                <br>
                + * it as their will.
                <br>
                + */
                <br>
                +
                <br>
                +/* For the DC in ls7a2000 */
                <br>
                +static irqreturn_t lsdc_irq_handler(int irq, void *arg)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = arg;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* Read the interrupt status */
                <br>
                +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
                <br>
                +    if ((val &amp; INT_STATUS_MASK) == 0) {
                <br>
                +        drm_warn(ddev, "no interrupt occurs\n");
                <br>
                +        return IRQ_NONE;
                <br>
                +    }
                <br>
                +
                <br>
                +    ldev-&gt;irq_status = val;
                <br>
                +
                <br>
                +    /* write "1" to clear the interrupt status */
                <br>
                +    lsdc_wreg32(ldev, LSDC_INT_REG, val);
                <br>
                +
                <br>
                +    return IRQ_WAKE_THREAD;
                <br>
                +}
                <br>
                +
                <br>
                +/* For the DC in ls7a1000, ls2k1000 and ls2k0500 */
                <br>
                +static irqreturn_t lsdc_irq_handler_legacy(int irq,
                void *arg)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = arg;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* Read the interrupt status */
                <br>
                +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
                <br>
                +    if ((val &amp; INT_STATUS_MASK) == 0) {
                <br>
                +        drm_warn(ddev, "no interrupt occurs\n");
                <br>
                +        return IRQ_NONE;
                <br>
                +    }
                <br>
                +
                <br>
                +    ldev-&gt;irq_status = val;
                <br>
                +
                <br>
                +    /* write "0" to clear the interrupt status */
                <br>
                +    lsdc_wreg32(ldev, LSDC_INT_REG, val &amp;
                ~INT_STATUS_MASK);
                <br>
                +
                <br>
                +    return IRQ_WAKE_THREAD;
                <br>
                +}
                <br>
                +
                <br>
                +irq_handler_t lsdc_get_irq_handler(struct lsdc_device
                *ldev)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000)
                <br>
                +        return lsdc_irq_handler;
                <br>
                +
                <br>
                +    return lsdc_irq_handler_legacy;
                <br>
                +}
                <br>
                +
                <br>
                +irqreturn_t lsdc_irq_thread_handler(int irq, void *arg)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = arg;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct drm_crtc *crtc;
                <br>
                +
                <br>
                +    if (ldev-&gt;irq_status &amp; INT_CRTC0_VSYNC) {
                <br>
                +        crtc = drm_crtc_from_index(ddev, 0);
                <br>
                +        drm_crtc_handle_vblank(crtc);
                <br>
                +    }
                <br>
                +
                <br>
                +    if (ldev-&gt;irq_status &amp; INT_CRTC1_VSYNC) {
                <br>
                +        crtc = drm_crtc_from_index(ddev, 1);
                <br>
                +        drm_crtc_handle_vblank(crtc);
                <br>
                +    }
                <br>
                +
                <br>
                +    return IRQ_HANDLED;
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_output.c
                b/drivers/gpu/drm/lsdc/lsdc_output.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..d4bc7666d9ea
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_output.c
                <br>
                @@ -0,0 +1,452 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include &lt;drm/drm_edid.h&gt;
                <br>
                +#include &lt;drm/drm_probe_helper.h&gt;
                <br>
                +#include &lt;drm/drm_atomic_helper.h&gt;
                <br>
                +#include &lt;drm/drm_connector.h&gt;
                <br>
                +#include "lsdc_drv.h"
                <br>
                +
                <br>
                +static int lsdc_get_modes(struct drm_connector
                *connector)
                <br>
                +{
                <br>
                +    unsigned int num = 0;
                <br>
                +    struct edid *edid;
                <br>
                +
                <br>
                +    if (connector-&gt;ddc) {
                <br>
                +        edid = drm_get_edid(connector,
                connector-&gt;ddc);
                <br>
                +        if (edid) {
                <br>
                +           
                drm_connector_update_edid_property(connector, edid);
                <br>
                +            num = drm_add_edid_modes(connector, edid);
                <br>
                +            kfree(edid);
                <br>
                +        }
                <br>
                +
                <br>
                +        return num;
                <br>
                +    }
                <br>
                +
                <br>
                +    num = drm_add_modes_noedid(connector, 1920, 1200);
                <br>
                +
                <br>
                +    drm_set_preferred_mode(connector, 1024, 768);
                <br>
                +
                <br>
                +    return num;
                <br>
                +}
                <br>
                +
                <br>
                +static enum drm_connector_status
                <br>
                +lsdc_unknown_connector_detect(struct drm_connector
                *connector, bool force)
                <br>
                +{
                <br>
                +    struct i2c_adapter *ddc = connector-&gt;ddc;
                <br>
                +
                <br>
                +    if (ddc) {
                <br>
                +        if (drm_probe_ddc(ddc))
                <br>
                +            return connector_status_connected;
                <br>
                +    } else {
                <br>
                +        if (connector-&gt;connector_type ==
                DRM_MODE_CONNECTOR_DPI)
                <br>
                +            return connector_status_connected;
                <br>
                +
                <br>
                +        if (connector-&gt;connector_type ==
                DRM_MODE_CONNECTOR_VIRTUAL)
                <br>
                +            return connector_status_connected;
                <br>
                +    }
                <br>
                +
                <br>
                +    return connector_status_unknown;
                <br>
                +}
                <br>
                +
                <br>
                +static enum drm_connector_status
                <br>
                +lsdc_hdmi_connector_detect(struct drm_connector
                *connector, bool force)
                <br>
                +{
                <br>
                +    struct lsdc_display_pipe *pipe =
                connector_to_display_pipe(connector);
                <br>
                +    struct lsdc_device *ldev =
                to_lsdc(connector-&gt;dev);
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
                <br>
                +
                <br>
                +    if (pipe-&gt;index == 0) {
                <br>
                +        if (val &amp; HDMI0_HPD_FLAG)
                <br>
                +            return connector_status_connected;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (pipe-&gt;index == 1) {
                <br>
                +        if (val &amp; HDMI1_HPD_FLAG)
                <br>
                +            return connector_status_connected;
                <br>
                +    }
                <br>
                +
                <br>
                +    return connector_status_disconnected;
                <br>
                +}
                <br>
                +
                <br>
                +static enum drm_connector_status
                <br>
                +lsdc_hdmi_vga_connector_detect(struct drm_connector
                *connector, bool force)
                <br>
                +{
                <br>
                +    struct lsdc_display_pipe *pipe =
                connector_to_display_pipe(connector);
                <br>
                +    struct drm_device *ddev = connector-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct i2c_adapter *ddc;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
                <br>
                +
                <br>
                +    if (pipe-&gt;index == 1) {
                <br>
                +        if (val &amp; HDMI1_HPD_FLAG)
                <br>
                +            return connector_status_connected;
                <br>
                +
                <br>
                +        return connector_status_disconnected;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (pipe-&gt;index == 0) {
                <br>
                +        if (val &amp; HDMI0_HPD_FLAG)
                <br>
                +            return connector_status_connected;
                <br>
                +
                <br>
                +        ddc = connector-&gt;ddc;
                <br>
                +        if (ddc) {
                <br>
                +            if (drm_probe_ddc(ddc))
                <br>
                +                return connector_status_connected;
                <br>
                +
                <br>
                +            return connector_status_disconnected;
                <br>
                +        }
                <br>
                +    }
                <br>
                +
                <br>
                +    return connector_status_unknown;
                <br>
                +}
                <br>
                +
                <br>
                +static struct drm_encoder *
                <br>
                +lsdc_connector_get_best_encoder(struct drm_connector
                *connector,
                <br>
                +                struct drm_atomic_state *state)
                <br>
                +{
                <br>
                +    struct lsdc_display_pipe *pipe =
                connector_to_display_pipe(connector);
                <br>
                +
                <br>
                +    return &amp;pipe-&gt;encoder;
                <br>
                +}
                <br>
                +
                <br>
                +static const struct drm_connector_helper_funcs
                lsdc_connector_helpers = {
                <br>
                +    .atomic_best_encoder =
                lsdc_connector_get_best_encoder,
                <br>
                +    .get_modes = lsdc_get_modes,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_connector_funcs
                lsdc_unknown_connector_funcs = {
                <br>
                +    .detect = lsdc_unknown_connector_detect,
                <br>
                +    .fill_modes =
                drm_helper_probe_single_connector_modes,
                <br>
                +    .destroy = drm_connector_cleanup,
                <br>
                +    .reset = drm_atomic_helper_connector_reset,
                <br>
                +    .atomic_duplicate_state =
                drm_atomic_helper_connector_duplicate_state,
                <br>
                +    .atomic_destroy_state =
                drm_atomic_helper_connector_destroy_state,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_connector_funcs
                lsdc_hdmi_vga_connector_funcs = {
                <br>
                +    .detect = lsdc_hdmi_vga_connector_detect,
                <br>
                +    .fill_modes =
                drm_helper_probe_single_connector_modes,
                <br>
                +    .destroy = drm_connector_cleanup,
                <br>
                +    .reset = drm_atomic_helper_connector_reset,
                <br>
                +    .atomic_duplicate_state =
                drm_atomic_helper_connector_duplicate_state,
                <br>
                +    .atomic_destroy_state =
                drm_atomic_helper_connector_destroy_state,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_connector_funcs
                lsdc_hdmi_connector_funcs = {
                <br>
                +    .detect = lsdc_hdmi_connector_detect,
                <br>
                +    .fill_modes =
                drm_helper_probe_single_connector_modes,
                <br>
                +    .destroy = drm_connector_cleanup,
                <br>
                +    .reset = drm_atomic_helper_connector_reset,
                <br>
                +    .atomic_duplicate_state =
                drm_atomic_helper_connector_duplicate_state,
                <br>
                +    .atomic_destroy_state =
                drm_atomic_helper_connector_destroy_state,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_connector_funcs *
                <br>
                +lsdc_get_connector_func(struct lsdc_device *ldev,
                unsigned int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000) {
                <br>
                +        if (index == 0)
                <br>
                +            return &amp;lsdc_hdmi_vga_connector_funcs;
                <br>
                +
                <br>
                +        if (index == 1)
                <br>
                +            return &amp;lsdc_hdmi_connector_funcs;
                <br>
                +    }
                <br>
                +
                <br>
                +    return &amp;lsdc_unknown_connector_funcs;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * we provide a default support before DT/VBIOS is
                supported
                <br>
                + */
                <br>
                +static int lsdc_get_encoder_type(struct lsdc_device
                *ldev,
                <br>
                +                 unsigned int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_ENCODER_DAC;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_ENCODER_TMDS;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A1000 ||
                descp-&gt;chip == CHIP_LS2K1000) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_ENCODER_DPI;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_ENCODER_DPI;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS2K0500) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_ENCODER_DPI;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_ENCODER_DAC;
                <br>
                +    }
                <br>
                +
                <br>
                +    return DRM_MODE_ENCODER_NONE;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * provide a default before DT/VBIOS support is
                upstreamed
                <br>
                + */
                <br>
                +static int lsdc_get_connector_type(struct lsdc_device
                *ldev,
                <br>
                +                   unsigned int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_CONNECTOR_VGA;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_CONNECTOR_HDMIA;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A1000 ||
                descp-&gt;chip == CHIP_LS2K1000) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_CONNECTOR_DPI;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_CONNECTOR_DPI;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS2K0500) {
                <br>
                +        if (index == 0)
                <br>
                +            return DRM_MODE_CONNECTOR_DPI;
                <br>
                +        if (index == 1)
                <br>
                +            return DRM_MODE_CONNECTOR_VGA;
                <br>
                +    }
                <br>
                +
                <br>
                +    return DRM_MODE_CONNECTOR_Unknown;
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_hdmi_disable(struct drm_encoder
                *encoder)
                <br>
                +{
                <br>
                +    struct lsdc_display_pipe *dispipe =
                encoder_to_display_pipe(encoder);
                <br>
                +    struct drm_device *ddev = encoder-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    unsigned int index = dispipe-&gt;index;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    if (index == 0)
                <br>
                +        val = lsdc_rreg32(ldev,
                LSDC_HDMI0_PHY_CTRL_REG);
                <br>
                +    else if (index == 1)
                <br>
                +        val = lsdc_rreg32(ldev,
                LSDC_HDMI1_PHY_CTRL_REG);
                <br>
                +
                <br>
                +    val &amp;= ~HDMI_PHY_EN;
                <br>
                +
                <br>
                +    if (index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG,
                val);
                <br>
                +    else if (index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG,
                val);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "HDMI-%u disabled\n", index);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_hdmi_enable(struct drm_encoder
                *encoder)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = encoder-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct lsdc_display_pipe *dispipe =
                encoder_to_display_pipe(encoder);
                <br>
                +    unsigned int index = dispipe-&gt;index;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* we are using software gpio emulated i2c */
                <br>
                +    val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
                <br>
                +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
                <br>
                +
                <br>
                +    if (index == 0) {
                <br>
                +        /* Enable HDMI-0 */
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
                <br>
                +
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_ZONE_REG,
                0x00400040);
                <br>
                +    } else if (index == 1) {
                <br>
                +        /* Enable HDMI-1 */
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
                <br>
                +
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_ZONE_REG,
                0x00400040);
                <br>
                +    }
                <br>
                +
                <br>
                +    val = HDMI_PHY_TERM_STATUS |
                <br>
                +          HDMI_PHY_TERM_DET_EN |
                <br>
                +          HDMI_PHY_TERM_H_EN |
                <br>
                +          HDMI_PHY_TERM_L_EN |
                <br>
                +          HDMI_PHY_RESET_N |
                <br>
                +          HDMI_PHY_EN;
                <br>
                +
                <br>
                +    if (index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG,
                val);
                <br>
                +    else if (index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG,
                val);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "HDMI-%u enabled\n", index);
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + *  Fout = M * Fin
                <br>
                + *
                <br>
                + *  M = (4 * LF) / (IDF * ODF)
                <br>
                + *
                <br>
                + *  Loongson HDMI require M = 10
                <br>
                + */
                <br>
                +static void lsdc_hdmi_phy_pll_config(struct lsdc_device
                *ldev,
                <br>
                +                     int index,
                <br>
                +                     int clock)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = &amp;ldev-&gt;base;
                <br>
                +    int count = 0;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* disable phy pll */
                <br>
                +    if (index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, 0x0);
                <br>
                +    else if (index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, 0x0);
                <br>
                +
                <br>
                +    /*
                <br>
                +     * 10 = (4 * 40) / (8 * 2)
                <br>
                +     */
                <br>
                +    val = (8 &lt;&lt; HDMI_PLL_IDF_SHIFT) |
                <br>
                +          (40 &lt;&lt; HDMI_PLL_LF_SHIFT) |
                <br>
                +          (1 &lt;&lt; HDMI_PLL_ODF_SHIFT) |
                <br>
                +          HDMI_PLL_ENABLE;
                <br>
                +
                <br>
                +    drm_dbg(ddev, "HDMI-%u clock: %d\n", index, clock);
                <br>
                +
                <br>
                +    if (index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, val);
                <br>
                +    else if (index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, val);
                <br>
                +
                <br>
                +    /* wait hdmi phy pll lock */
                <br>
                +    do {
                <br>
                +        if (index == 0)
                <br>
                +            val = lsdc_rreg32(ldev,
                LSDC_HDMI0_PHY_PLL_REG);
                <br>
                +        else if (index == 1)
                <br>
                +            val = lsdc_rreg32(ldev,
                LSDC_HDMI1_PHY_PLL_REG);
                <br>
                +
                <br>
                +        ++count;
                <br>
                +
                <br>
                +        if (val &amp; HDMI_PLL_LOCKED) {
                <br>
                +            drm_dbg(ddev, "Setting HDMI-%u PLL
                success(take %d cycles)\n",
                <br>
                +                index, count);
                <br>
                +            break;
                <br>
                +        }
                <br>
                +    } while (count &lt; 1000);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_hdmi_atomic_mode_set(struct
                drm_encoder *encoder,
                <br>
                +                      struct drm_crtc_state
                *crtc_state,
                <br>
                +                      struct drm_connector_state
                *conn_state)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = encoder-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct lsdc_display_pipe *dispipe =
                encoder_to_display_pipe(encoder);
                <br>
                +    unsigned int index = dispipe-&gt;index;
                <br>
                +    struct drm_display_mode *mode =
                &amp;crtc_state-&gt;mode;
                <br>
                +
                <br>
                +    lsdc_hdmi_phy_pll_config(ldev, index,
                mode-&gt;clock);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "HDMI-%u modeset\n", index);
                <br>
                +}
                <br>
                +
                <br>
                +static const struct drm_encoder_helper_funcs
                lsdc_hdmi_helper_funcs = {
                <br>
                +    .disable = lsdc_hdmi_disable,
                <br>
                +    .enable = lsdc_hdmi_enable,
                <br>
                +    .atomic_mode_set = lsdc_hdmi_atomic_mode_set,
                <br>
                +};
                <br>
                +
                <br>
                +static void lsdc_hdmi_reset(struct drm_encoder
                *encoder)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = encoder-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct lsdc_display_pipe *dispipe =
                encoder_to_display_pipe(encoder);
                <br>
                +    unsigned int index = dispipe-&gt;index;
                <br>
                +    u32 val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
                <br>
                +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
                <br>
                +
                <br>
                +    lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
                <br>
                +    lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "HDMI-%u Reset\n", index);
                <br>
                +}
                <br>
                +
                <br>
                +static const struct drm_encoder_funcs
                lsdc_encoder_funcs = {
                <br>
                +    .reset = lsdc_hdmi_reset,
                <br>
                +    .destroy = drm_encoder_cleanup,
                <br>
                +};
                <br>
                +
                <br>
                +int lsdc_create_output(struct lsdc_device *ldev,
                unsigned int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +    struct drm_device *ddev = &amp;ldev-&gt;base;
                <br>
                +    struct lsdc_display_pipe *dispipe =
                &amp;ldev-&gt;dispipe[index];
                <br>
                +    struct drm_encoder *encoder =
                &amp;dispipe-&gt;encoder;
                <br>
                +    struct drm_connector *connector =
                &amp;dispipe-&gt;connector;
                <br>
                +    struct i2c_adapter *ddc = NULL;
                <br>
                +    struct lsdc_i2c *li2c;
                <br>
                +    int ret;
                <br>
                +
                <br>
                +    ret = drm_encoder_init(ddev,
                <br>
                +                   encoder,
                <br>
                +                   &amp;lsdc_encoder_funcs,
                <br>
                +                   lsdc_get_encoder_type(ldev, index),
                <br>
                +                   "encoder-%u",
                <br>
                +                   index);
                <br>
                +    if (ret) {
                <br>
                +        drm_err(ddev, "Failed to init encoder: %d\n",
                ret);
                <br>
                +        return ret;
                <br>
                +    }
                <br>
                +
                <br>
                +    encoder-&gt;possible_crtcs = BIT(index);
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000)
                <br>
                +        drm_encoder_helper_add(encoder,
                &amp;lsdc_hdmi_helper_funcs);
                <br>
                +
                <br>
                +    if (descp-&gt;has_builtin_i2c) {
                <br>
                +        li2c = lsdc_create_i2c_chan(ddev,
                ldev-&gt;reg_base, index);
                <br>
                +        if (IS_ERR(li2c))
                <br>
                +            return PTR_ERR(li2c);
                <br>
                +
                <br>
                +        dispipe-&gt;li2c = li2c;
                <br>
                +
                <br>
                +        ddc = &amp;li2c-&gt;adapter;
                <br>
                +    } else {
                <br>
                +        ddc = lsdc_get_i2c_adapter(ldev, index);
                <br>
                +        if (IS_ERR(ddc)) {
                <br>
                +            drm_err(ddev, "Error get ddc for
                output-%u\n", index);
                <br>
                +            return PTR_ERR(ddc);
                <br>
                +        }
                <br>
                +    }
                <br>
                +
                <br>
                +    ret = drm_connector_init_with_ddc(ddev,
                <br>
                +                      connector,
                <br>
                +                      lsdc_get_connector_func(ldev,
                index),
                <br>
                +                      lsdc_get_connector_type(ldev,
                index),
                <br>
                +                      ddc);
                <br>
                +    if (ret) {
                <br>
                +        drm_err(ddev, "Init connector-%d failed\n",
                index);
                <br>
                +        return ret;
                <br>
                +    }
                <br>
                +
                <br>
                +    drm_connector_helper_add(connector,
                &amp;lsdc_connector_helpers);
                <br>
                +
                <br>
                +    drm_connector_attach_encoder(connector, encoder);
                <br>
                +
                <br>
                +    connector-&gt;polled = DRM_CONNECTOR_POLL_CONNECT |
                <br>
                +                DRM_CONNECTOR_POLL_DISCONNECT;
                <br>
                +
                <br>
                +    connector-&gt;interlace_allowed = 0;
                <br>
                +    connector-&gt;doublescan_allowed = 0;
                <br>
                +
                <br>
                +    ldev-&gt;num_output++;
                <br>
                +
                <br>
                +    drm_info(ddev, "output-%u initialized\n", index);
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c
                b/drivers/gpu/drm/lsdc/lsdc_plane.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..0f779c97d53b
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
                <br>
                @@ -0,0 +1,443 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include &lt;drm/drm_atomic.h&gt;
                <br>
                +#include &lt;drm/drm_atomic_helper.h&gt;
                <br>
                +#include &lt;drm/drm_framebuffer.h&gt;
                <br>
                +#include &lt;drm/drm_plane_helper.h&gt;
                <br>
                +#include &lt;drm/drm_gem_vram_helper.h&gt;
                <br>
                +#include "lsdc_drv.h"
                <br>
                +#include "lsdc_regs.h"
                <br>
                +#include "lsdc_pll.h"
                <br>
                +
                <br>
                +static const u32 lsdc_primary_formats[] = {
                <br>
                +    DRM_FORMAT_XRGB8888,
                <br>
                +    DRM_FORMAT_ARGB8888,
                <br>
                +};
                <br>
                +
                <br>
                +static const u32 lsdc_cursor_formats[] = {
                <br>
                +    DRM_FORMAT_ARGB8888,
                <br>
                +};
                <br>
                +
                <br>
                +static const u64 lsdc_fb_format_modifiers[] = {
                <br>
                +    DRM_FORMAT_MOD_LINEAR,
                <br>
                +    DRM_FORMAT_MOD_INVALID
                <br>
                +};
                <br>
                +
                <br>
                +static void lsdc_update_fb_format(struct lsdc_device
                *ldev,
                <br>
                +                  struct drm_crtc *crtc,
                <br>
                +                  const struct drm_format_info
                *fmt_info)
                <br>
                +{
                <br>
                +    unsigned int index = drm_crtc_index(crtc);
                <br>
                +    u32 val;
                <br>
                +    u32 fmt;
                <br>
                +
                <br>
                +    switch (fmt_info-&gt;format) {
                <br>
                +    case DRM_FORMAT_XRGB8888:
                <br>
                +        fmt = LSDC_PF_XRGB8888;
                <br>
                +        break;
                <br>
                +    case DRM_FORMAT_ARGB8888:
                <br>
                +        fmt = LSDC_PF_XRGB8888;
                <br>
                +        break;
                <br>
                +    default:
                <br>
                +        fmt = LSDC_PF_XRGB8888;
                <br>
                +        break;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (index == 0) {
                <br>
                +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
                <br>
                +        val = (val &amp; ~CFG_PIX_FMT_MASK) | fmt;
                <br>
                +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
                <br>
                +    } else if (index == 1) {
                <br>
                +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
                <br>
                +        val = (val &amp; ~CFG_PIX_FMT_MASK) | fmt;
                <br>
                +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
                <br>
                +    }
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_update_fb_start_addr(struct
                lsdc_device *ldev,
                <br>
                +                      struct drm_crtc *crtc,
                <br>
                +                      u64 paddr)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = &amp;ldev-&gt;base;
                <br>
                +    unsigned int index = drm_crtc_index(crtc);
                <br>
                +    u32 lo_addr_reg;
                <br>
                +    u32 hi_addr_reg;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /*
                <br>
                +     * Find which framebuffer address register should
                update.
                <br>
                +     * if FB_ADDR0_REG is in using, we write the
                address to FB_ADDR0_REG,
                <br>
                +     * if FB_ADDR1_REG is in using, we write the
                address to FB_ADDR1_REG
                <br>
                +     * for each CRTC, the switch using one fb register
                to another is
                <br>
                +     * trigger by triggered by set CFG_PAGE_FLIP bit of
                LSDC_CRTCx_CFG_REG
                <br>
                +     */
                <br>
                +    if (index == 0) {
                <br>
                +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
                <br>
                +        if (val &amp; CFG_FB_IN_USING) {
                <br>
                +            lo_addr_reg = LSDC_CRTC0_FB1_LO_ADDR_REG;
                <br>
                +            hi_addr_reg = LSDC_CRTC0_FB1_HI_ADDR_REG;
                <br>
                +            drm_dbg(ddev, "Currently, FB1 is in using
                by CRTC-0\n");
                <br>
                +        } else {
                <br>
                +            lo_addr_reg = LSDC_CRTC0_FB0_LO_ADDR_REG;
                <br>
                +            hi_addr_reg = LSDC_CRTC0_FB0_HI_ADDR_REG;
                <br>
                +            drm_dbg(ddev, "Currently, FB0 is in using
                by CRTC-0\n");
                <br>
                +        }
                <br>
                +    } else if (index == 1) {
                <br>
                +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
                <br>
                +        if (val &amp; CFG_FB_IN_USING) {
                <br>
                +            lo_addr_reg = LSDC_CRTC1_FB1_LO_ADDR_REG;
                <br>
                +            hi_addr_reg = LSDC_CRTC1_FB1_HI_ADDR_REG;
                <br>
                +            drm_dbg(ddev, "Currently, FB1 is in using
                by CRTC-1\n");
                <br>
                +        } else {
                <br>
                +            lo_addr_reg = LSDC_CRTC1_FB0_LO_ADDR_REG;
                <br>
                +            hi_addr_reg = LSDC_CRTC1_FB0_HI_ADDR_REG;
                <br>
                +            drm_dbg(ddev, "Currently, FB0 is in using
                by CRTC-1\n");
                <br>
                +        }
                <br>
                +    }
                <br>
                +
                <br>
                +    /* 40-bit width physical address bus */
                <br>
                +    lsdc_wreg32(ldev, lo_addr_reg, paddr);
                <br>
                +    lsdc_wreg32(ldev, hi_addr_reg, (paddr &gt;&gt; 32)
                &amp; 0xFF);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "CRTC-%u scantout from 0x%llx\n",
                index, paddr);
                <br>
                +}
                <br>
                +
                <br>
                +static unsigned int lsdc_get_fb_offset(struct
                drm_framebuffer *fb,
                <br>
                +                       struct drm_plane_state *state,
                <br>
                +                       unsigned int plane)
                <br>
                +{
                <br>
                +    unsigned int offset = fb-&gt;offsets[plane];
                <br>
                +
                <br>
                +    offset += fb-&gt;format-&gt;cpp[plane] *
                (state-&gt;src_x &gt;&gt; 16);
                <br>
                +    offset += fb-&gt;pitches[plane] * (state-&gt;src_y
                &gt;&gt; 16);
                <br>
                +
                <br>
                +    return offset;
                <br>
                +}
                <br>
                +
                <br>
                +static s64 lsdc_get_vram_bo_offset(struct
                drm_framebuffer *fb)
                <br>
                +{
                <br>
                +    struct drm_gem_vram_object *gbo;
                <br>
                +    s64 gpu_addr;
                <br>
                +
                <br>
                +    gbo = drm_gem_vram_of_gem(fb-&gt;obj[0]);
                <br>
                +    gpu_addr = drm_gem_vram_offset(gbo);
                <br>
                +
                <br>
                +    return gpu_addr;
                <br>
                +}
                <br>
                +
                <br>
                +static int lsdc_primary_plane_atomic_check(struct
                drm_plane *plane,
                <br>
                +                       struct drm_atomic_state *state)
                <br>
                +{
                <br>
                +    struct drm_plane_state *plane_state =
                drm_atomic_get_new_plane_state(state, plane);
                <br>
                +    struct drm_crtc *crtc = plane_state-&gt;crtc;
                <br>
                +    struct drm_crtc_state *crtc_state =
                drm_atomic_get_new_crtc_state(state, crtc);
                <br>
                +
                <br>
                +    if (!crtc)
                <br>
                +        return 0;
                <br>
                +
                <br>
                +    return
                drm_atomic_helper_check_plane_state(plane_state,
                <br>
                +                           crtc_state,
                <br>
                +                           DRM_PLANE_NO_SCALING,
                <br>
                +                           DRM_PLANE_NO_SCALING,
                <br>
                +                           false,
                <br>
                +                           true);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_update_fb_stride(struct lsdc_device
                *ldev,
                <br>
                +                  struct drm_crtc *crtc,
                <br>
                +                  unsigned int stride)
                <br>
                +{
                <br>
                +    unsigned int index = drm_crtc_index(crtc);
                <br>
                +
                <br>
                +    if (index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG,
                stride);
                <br>
                +    else if (index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_CRTC1_STRIDE_REG,
                stride);
                <br>
                +
                <br>
                +    drm_dbg(crtc-&gt;dev, "update stride to %u\n",
                stride);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_primary_plane_atomic_update(struct
                drm_plane *plane,
                <br>
                +                         struct drm_atomic_state
                *state)
                <br>
                +{
                <br>
                +    struct lsdc_device *ldev = to_lsdc(plane-&gt;dev);
                <br>
                +    struct drm_plane_state *new_plane_state =
                drm_atomic_get_new_plane_state(state, plane);
                <br>
                +    struct drm_crtc *crtc = new_plane_state-&gt;crtc;
                <br>
                +    struct drm_framebuffer *fb =
                new_plane_state-&gt;fb;
                <br>
                +    u32 fb_offset = lsdc_get_fb_offset(fb,
                new_plane_state, 0);
                <br>
                +    dma_addr_t fb_addr;
                <br>
                +    s64 gpu_addr;
                <br>
                +
                <br>
                +    gpu_addr = lsdc_get_vram_bo_offset(fb);
                <br>
                +    if (gpu_addr &lt; 0)
                <br>
                +        return;
                <br>
                +
                <br>
                +    fb_addr = ldev-&gt;vram_base + gpu_addr +
                fb_offset;
                <br>
                +
                <br>
                +    lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
                <br>
                +
                <br>
                +    lsdc_update_fb_stride(ldev, crtc,
                fb-&gt;pitches[0]);
                <br>
                +
                <br>
                +    lsdc_update_fb_format(ldev, crtc, fb-&gt;format);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_primary_plane_atomic_disable(struct
                drm_plane *plane,
                <br>
                +                          struct drm_atomic_state
                *state)
                <br>
                +{
                <br>
                +    drm_dbg(plane-&gt;dev, "%s disabled\n",
                plane-&gt;name);
                <br>
                +}
                <br>
                +
                <br>
                +static const struct drm_plane_helper_funcs
                lsdc_primary_plane_helpers = {
                <br>
                +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
                <br>
                +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
                <br>
                +    .atomic_check = lsdc_primary_plane_atomic_check,
                <br>
                +    .atomic_update = lsdc_primary_plane_atomic_update,
                <br>
                +    .atomic_disable =
                lsdc_primary_plane_atomic_disable,
                <br>
                +};
                <br>
                +
                <br>
                +static int lsdc_cursor_atomic_check(struct drm_plane
                *plane,
                <br>
                +                    struct drm_atomic_state *state)
                <br>
                +{
                <br>
                +    struct drm_plane_state *new_plane_state =
                drm_atomic_get_new_plane_state(state, plane);
                <br>
                +    struct drm_framebuffer *fb =
                new_plane_state-&gt;fb;
                <br>
                +    struct drm_crtc *crtc = new_plane_state-&gt;crtc;
                <br>
                +    struct drm_crtc_state *crtc_state;
                <br>
                +    int ret;
                <br>
                +
                <br>
                +    /* no need for further checks if the plane is being
                disabled */
                <br>
                +    if (!crtc || !fb)
                <br>
                +        return 0;
                <br>
                +
                <br>
                +    if (!new_plane_state-&gt;visible)
                <br>
                +        return 0;
                <br>
                +
                <br>
                +    crtc_state = drm_atomic_get_new_crtc_state(state,
                <br>
                +                           new_plane_state-&gt;crtc);
                <br>
                +
                <br>
                +    ret =
                drm_atomic_helper_check_plane_state(new_plane_state,
                <br>
                +                          crtc_state,
                <br>
                +                          DRM_PLANE_NO_SCALING,
                <br>
                +                          DRM_PLANE_NO_SCALING,
                <br>
                +                          true,
                <br>
                +                          true);
                <br>
                +
                <br>
                +    return ret;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * There is only one hardware cursor in ls7a1000,
                ls2k1000 and ls2k0500.
                <br>
                + * we made it shared by the two CRTC, which can satisfy
                peoples who use
                <br>
                + * double screen extend mode only. On clone screen
                usage case, the cursor
                <br>
                + * on display pipe 1 will not be able to display.
                <br>
                + *
                <br>
                + * Update location of the cursor, attach it to CRTC0 or
                CRTC1 on the runtime.
                <br>
                + */
                <br>
                +static void lsdc_cursor_update_location_quirks(struct
                lsdc_device *ldev,
                <br>
                +                           struct drm_crtc *crtc)
                <br>
                +{
                <br>
                +    u32 val = CURSOR_FORMAT_ARGB8888;
                <br>
                +
                <br>
                +    /*
                <br>
                +     * If bit 4 of LSDC_CURSOR0_CFG_REG is 1, then the
                cursor will be
                <br>
                +     * locate at CRTC-1, if bit 4 of
                LSDC_CURSOR0_CFG_REG is 0, then
                <br>
                +     * the cursor will be locate at CRTC-0. The cursor
                is alway on the
                <br>
                +     * top of the primary. Compositing the primary
                plane and cursor
                <br>
                +     * plane is automatically done by hardware.
                <br>
                +     */
                <br>
                +    if (drm_crtc_index(crtc))
                <br>
                +        val |= CURSOR_LOCATION;
                <br>
                +
                <br>
                +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, val);
                <br>
                +}
                <br>
                +
                <br>
                +/* update the position of the cursor */
                <br>
                +static void lsdc_cursor_update_position_quirks(struct
                lsdc_device *ldev,
                <br>
                +                           int x,
                <br>
                +                           int y)
                <br>
                +{
                <br>
                +    if (x &lt; 0)
                <br>
                +        x = 0;
                <br>
                +
                <br>
                +    if (y &lt; 0)
                <br>
                +        y = 0;
                <br>
                +
                <br>
                +    lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y
                &lt;&lt; 16) | x);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_cursor_atomic_update_quirks(struct
                drm_plane *plane,
                <br>
                +                         struct drm_atomic_state
                *state)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = plane-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct drm_plane_state *new_plane_state =
                drm_atomic_get_new_plane_state(state, plane);
                <br>
                +    struct drm_plane_state *old_plane_state =
                drm_atomic_get_old_plane_state(state, plane);
                <br>
                +    struct drm_framebuffer *new_fb =
                new_plane_state-&gt;fb;
                <br>
                +    struct drm_framebuffer *old_fb =
                old_plane_state-&gt;fb;
                <br>
                +
                <br>
                +    if (new_fb != old_fb) {
                <br>
                +        s64 offset = lsdc_get_vram_bo_offset(new_fb);
                <br>
                +        u64 cursor_addr = ldev-&gt;vram_base + offset;
                <br>
                +
                <br>
                +        drm_dbg_kms(ddev, "%s offset: %llx\n",
                plane-&gt;name, offset);
                <br>
                +
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG,
                cursor_addr);
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG,
                (cursor_addr &gt;&gt; 32) &amp; 0xFF);
                <br>
                +    }
                <br>
                +
                <br>
                +    lsdc_cursor_update_position_quirks(ldev,
                new_plane_state-&gt;crtc_x, new_plane_state-&gt;crtc_y);
                <br>
                +
                <br>
                +    lsdc_cursor_update_location_quirks(ldev,
                new_plane_state-&gt;crtc);
                <br>
                +}
                <br>
                +
                <br>
                +/* update the format, size and location of the cursor
                */
                <br>
                +static void lsdc_cursor_atomic_update(struct drm_plane
                *plane,
                <br>
                +                      struct drm_atomic_state *state)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = plane-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct lsdc_display_pipe *dispipe =
                cursor_to_display_pipe(plane);
                <br>
                +    struct drm_plane_state *new_plane_state =
                drm_atomic_get_new_plane_state(state, plane);
                <br>
                +    struct drm_framebuffer *new_fb =
                new_plane_state-&gt;fb;
                <br>
                +    int x = new_plane_state-&gt;crtc_x;
                <br>
                +    int y = new_plane_state-&gt;crtc_y;
                <br>
                +    u32 conf = CURSOR_FORMAT_ARGB8888 |
                CURSOR_SIZE_64X64;
                <br>
                +    u64 cursor_addr = ldev-&gt;vram_base +
                lsdc_get_vram_bo_offset(new_fb);
                <br>
                +
                <br>
                +    if (x &lt; 0)
                <br>
                +        x = 0;
                <br>
                +
                <br>
                +    if (y &lt; 0)
                <br>
                +        y = 0;
                <br>
                +
                <br>
                +    if (dispipe-&gt;index == 0) {
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG,
                (cursor_addr &gt;&gt; 32) &amp; 0xFF);
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG,
                cursor_addr);
                <br>
                +        /* Attach Cursor-0 to CRTC-0 */
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, conf
                &amp; ~CURSOR_LOCATION);
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y
                &lt;&lt; 16) | x);
                <br>
                +        return;
                <br>
                +    }
                <br>
                +
                <br>
                +    if (dispipe-&gt;index == 1) {
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG,
                (cursor_addr &gt;&gt; 32) &amp; 0xFF);
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG,
                cursor_addr);
                <br>
                +        /* Attach Cursor-1 to CRTC-1 */
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, conf |
                CURSOR_LOCATION);
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y
                &lt;&lt; 16) | x);
                <br>
                +        return;
                <br>
                +    }
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_cursor_atomic_disable_quirks(struct
                drm_plane *plane,
                <br>
                +                          struct drm_atomic_state
                *state)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = plane-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +
                <br>
                +    /* Set the format to 0 actually display the cursor
                */
                <br>
                +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "%s disabled\n", plane-&gt;name);
                <br>
                +}
                <br>
                +
                <br>
                +static void lsdc_cursor_atomic_disable(struct drm_plane
                *plane,
                <br>
                +                       struct drm_atomic_state *state)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = plane-&gt;dev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    struct lsdc_display_pipe *dispipe =
                cursor_to_display_pipe(plane);
                <br>
                +
                <br>
                +    if (dispipe-&gt;index == 0)
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
                <br>
                +    else if (dispipe-&gt;index == 1)
                <br>
                +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, 0);
                <br>
                +
                <br>
                +    drm_dbg(ddev, "%s disabled\n", plane-&gt;name);
                <br>
                +}
                <br>
                +
                <br>
                +static const struct drm_plane_helper_funcs
                lsdc_cursor_helpers_quirk = {
                <br>
                +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
                <br>
                +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
                <br>
                +    .atomic_check = lsdc_cursor_atomic_check,
                <br>
                +    .atomic_update = lsdc_cursor_atomic_update_quirks,
                <br>
                +    .atomic_disable =
                lsdc_cursor_atomic_disable_quirks,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_plane_helper_funcs
                lsdc_cursor_plane_helpers = {
                <br>
                +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
                <br>
                +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
                <br>
                +    .atomic_check = lsdc_cursor_atomic_check,
                <br>
                +    .atomic_update = lsdc_cursor_atomic_update,
                <br>
                +    .atomic_disable = lsdc_cursor_atomic_disable,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_plane_funcs lsdc_plane_funcs =
                {
                <br>
                +    .update_plane = drm_atomic_helper_update_plane,
                <br>
                +    .disable_plane = drm_atomic_helper_disable_plane,
                <br>
                +    .destroy = drm_plane_cleanup,
                <br>
                +    .reset = drm_atomic_helper_plane_reset,
                <br>
                +    .atomic_duplicate_state =
                drm_atomic_helper_plane_duplicate_state,
                <br>
                +    .atomic_destroy_state =
                drm_atomic_helper_plane_destroy_state,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct drm_plane_helper_funcs *
                <br>
                +lsdc_get_cursor_helper_funcs(const struct lsdc_desc
                *descp)
                <br>
                +{
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000)
                <br>
                +        return &amp;lsdc_cursor_plane_helpers;
                <br>
                +
                <br>
                +    return &amp;lsdc_cursor_helpers_quirk;
                <br>
                +}
                <br>
                +
                <br>
                +int lsdc_plane_init(struct lsdc_device *ldev,
                <br>
                +            struct drm_plane *plane,
                <br>
                +            enum drm_plane_type type,
                <br>
                +            unsigned int index)
                <br>
                +{
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +    struct drm_device *ddev = &amp;ldev-&gt;base;
                <br>
                +    unsigned int format_count;
                <br>
                +    const u32 *formats;
                <br>
                +    const char *name;
                <br>
                +    int ret;
                <br>
                +
                <br>
                +    switch (type) {
                <br>
                +    case DRM_PLANE_TYPE_PRIMARY:
                <br>
                +        formats = lsdc_primary_formats;
                <br>
                +        format_count =
                ARRAY_SIZE(lsdc_primary_formats);
                <br>
                +        name = "primary-%u";
                <br>
                +        break;
                <br>
                +    case DRM_PLANE_TYPE_CURSOR:
                <br>
                +        formats = lsdc_cursor_formats;
                <br>
                +        format_count = ARRAY_SIZE(lsdc_cursor_formats);
                <br>
                +        name = "cursor-%u";
                <br>
                +        break;
                <br>
                +    case DRM_PLANE_TYPE_OVERLAY:
                <br>
                +        drm_err(ddev, "overlay plane is not
                supported\n");
                <br>
                +        break;
                <br>
                +    }
                <br>
                +
                <br>
                +    ret = drm_universal_plane_init(ddev, plane, 1
                &lt;&lt; index,
                <br>
                +                       &amp;lsdc_plane_funcs,
                <br>
                +                       formats, format_count,
                <br>
                +                       lsdc_fb_format_modifiers,
                <br>
                +                       type, name, index);
                <br>
                +    if (ret) {
                <br>
                +        drm_err(ddev, "%s failed: %d\n", __func__,
                ret);
                <br>
                +        return ret;
                <br>
                +    }
                <br>
                +
                <br>
                +    switch (type) {
                <br>
                +    case DRM_PLANE_TYPE_PRIMARY:
                <br>
                +        drm_plane_helper_add(plane,
                &amp;lsdc_primary_plane_helpers);
                <br>
                +        break;
                <br>
                +    case DRM_PLANE_TYPE_CURSOR:
                <br>
                +        drm_plane_helper_add(plane,
                lsdc_get_cursor_helper_funcs(descp));
                <br>
                +        break;
                <br>
                +    case DRM_PLANE_TYPE_OVERLAY:
                <br>
                +        drm_err(ddev, "overlay plane is not
                supported\n");
                <br>
                +        break;
                <br>
                +    }
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c
                b/drivers/gpu/drm/lsdc/lsdc_pll.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..6ed74989a6f5
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
                <br>
                @@ -0,0 +1,569 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include "lsdc_drv.h"
                <br>
                +#include "lsdc_regs.h"
                <br>
                +#include "lsdc_pll.h"
                <br>
                +
                <br>
                +/*
                <br>
                + * The structure of the pixel PLL register is evolved
                with times.
                <br>
                + * All loongson's cpu is little endian.
                <br>
                + */
                <br>
                +
                <br>
                +/* u64 */
                <br>
                +struct ls7a1000_pixpll_bitmap {
                <br>
                +    /* Byte 0 ~ Byte 3 */
                <br>
                +    unsigned div_out      : 7;   /*  0 : 6     output
                clock divider  */
                <br>
                +    unsigned __1          : 14;  /*  7 :
                20                          */
                <br>
                +    unsigned loopc        : 9;   /* 21 : 29    clock
                multiplier      */
                <br>
                +    unsigned __2          : 2;   /* 30 :
                31                          */
                <br>
                +
                <br>
                +    /* Byte 4 ~ Byte 7 */
                <br>
                +    unsigned div_ref      : 7;   /*  0 : 6     input
                clock divider   */
                <br>
                +    unsigned locked       : 1;   /*  7         PLL
                locked status     */
                <br>
                +    unsigned sel_out      : 1;   /*  8         output
                clk selector   */
                <br>
                +    unsigned __3          : 2;   /*  9 : 10
                reserved              */
                <br>
                +    unsigned set_param    : 1;   /*  11        trigger
                the update    */
                <br>
                +    unsigned bypass       : 1;   /*
                12                              */
                <br>
                +    unsigned powerdown    : 1;   /*
                13                              */
                <br>
                +    unsigned __4          : 18;  /*  14 :
                31                         */
                <br>
                +};
                <br>
                +
                <br>
                +/* u128 */
                <br>
                +struct ls2k1000_pixpll_bitmap {
                <br>
                +    /* Byte 0 ~ Byte 3 */
                <br>
                +    unsigned sel_out      :  1;  /*  0      select this
                PLL          */
                <br>
                +    unsigned __1          :  1;  /*
                1                               */
                <br>
                +    unsigned sw_adj_en    :  1;  /*  2      allow
                software adjust    */
                <br>
                +    unsigned bypass       :  1;  /*  3      bypass L1
                PLL            */
                <br>
                +    unsigned __2          :  3;  /*
                4:6                             */
                <br>
                +    unsigned lock_en      :  1;  /*  7      enable lock
                L1 PLL       */
                <br>
                +    unsigned __3          :  2;  /*
                8:9                             */
                <br>
                +    unsigned lock_check   :  2;  /* 10:11   precision
                check          */
                <br>
                +    unsigned __4          :  4;  /*
                12:15                            */
                <br>
                +
                <br>
                +    unsigned locked       :  1;  /* 16      PLL locked
                flag bit      */
                <br>
                +    unsigned __5          :  2;  /*
                17:18                            */
                <br>
                +    unsigned powerdown    :  1;  /* 19      powerdown
                the pll if set */
                <br>
                +    unsigned __6          :  6;  /*
                20:25                            */
                <br>
                +    unsigned div_ref      :  6;  /* 26:31   L1
                Prescaler             */
                <br>
                +
                <br>
                +    /* Byte 4 ~ Byte 7 */
                <br>
                +    unsigned loopc        : 10;  /* 32:41   Clock
                Multiplier         */
                <br>
                +    unsigned l1_div       :  6;  /* 42:47   not
                used                 */
                <br>
                +    unsigned __7          : 16;  /*
                48:63                            */
                <br>
                +
                <br>
                +    /* Byte 8 ~ Byte 15 */
                <br>
                +    unsigned div_out      :  6;  /* 0 : 5   output
                clock divider     */
                <br>
                +    unsigned __8          : 26;  /* 6 :
                31                           */
                <br>
                +    unsigned __9          : 32;  /* 70:
                127                          */
                <br>
                +};
                <br>
                +
                <br>
                +/* u32 */
                <br>
                +struct ls2k0500_pixpll_bitmap {
                <br>
                +    /* Byte 0 ~ Byte 1 */
                <br>
                +    unsigned sel_out      : 1;
                <br>
                +    unsigned __1          : 2;
                <br>
                +    unsigned sw_adj_en    : 1;   /* allow software
                adjust              */
                <br>
                +    unsigned bypass       : 1;   /* bypass L1
                PLL                      */
                <br>
                +    unsigned powerdown    : 1;   /* write 1 to
                powerdown the PLL       */
                <br>
                +    unsigned __2          : 1;
                <br>
                +    unsigned locked       : 1;   /*  7     Is L1 PLL
                locked, read only */
                <br>
                +    unsigned div_ref      : 6;   /*  8:13  ref clock
                divider           */
                <br>
                +    unsigned __3          : 2;   /*
                14:15                              */
                <br>
                +    /* Byte 2 ~ Byte 3 */
                <br>
                +    unsigned loopc        : 8;   /* 16:23   Clock
                Multiplier           */
                <br>
                +    unsigned div_out      : 6;   /* 24:29   output
                clock divider       */
                <br>
                +    unsigned __4          : 2;   /*
                30:31                              */
                <br>
                +};
                <br>
                +
                <br>
                +union lsdc_pixpll_bitmap {
                <br>
                +    struct ls7a1000_pixpll_bitmap ls7a1000;
                <br>
                +    struct ls2k1000_pixpll_bitmap ls2k1000;
                <br>
                +    struct ls2k0500_pixpll_bitmap ls2k0500;
                <br>
                +
                <br>
                +    u32 dword[4];
                <br>
                +};
                <br>
                +
                <br>
                +struct pixclk_to_pll_parm {
                <br>
                +    /* kHz */
                <br>
                +    unsigned int clock;
                <br>
                +
                <br>
                +    unsigned short width;
                <br>
                +    unsigned short height;
                <br>
                +    unsigned short vrefresh;
                <br>
                +
                <br>
                +    /* Stores parameters for programming the Hardware
                PLLs */
                <br>
                +    unsigned short div_out;
                <br>
                +    unsigned short loopc;
                <br>
                +    unsigned short div_ref;
                <br>
                +};
                <br>
                +
                <br>
                +/*
                <br>
                + * Pixel clock to PLL parameters translation table.
                <br>
                + * Small static cached value to speed up PLL parameters
                calculation.
                <br>
                + */
                <br>
                +static const struct pixclk_to_pll_parm
                pll_param_table[] = {
                <br>
                +    {148500, 1920, 1080, 60, 11, 49,  3},   /*
                1920x1080@60Hz */
                <br>
                +                        /* 1920x1080@50Hz */
                <br>
                +    {174500, 1920, 1080, 75, 17, 89,  3},   /*
                1920x1080@75Hz */
                <br>
                +    {181250, 2560, 1080, 75,  8, 58,  4},   /*
                2560x1080@75Hz */
                <br>
                +    {146250, 1680, 1050, 60, 16, 117, 5},   /*
                1680x1050@60Hz */
                <br>
                +    {135000, 1280, 1024, 75, 10, 54,  4},   /*
                1280x1024@75Hz */
                <br>
                +
                <br>
                +    {108000, 1600, 900,  60, 15, 81,  5},   /*
                1600x900@60Hz */
                <br>
                +                        /* 1280x1024@60Hz */
                <br>
                +                        /* 1280x960@60Hz */
                <br>
                +                        /* 1152x864@75Hz */
                <br>
                +
                <br>
                +    {106500, 1440, 900,  60, 19, 81,  4},   /*
                1440x900@60Hz */
                <br>
                +    {88750,  1440, 900,  60, 16, 71,  5},   /*
                1440x900@60Hz */
                <br>
                +    {83500,  1280, 800,  60, 17, 71,  5},   /*
                1280x800@60Hz */
                <br>
                +    {71000,  1280, 800,  60, 20, 71,  5},   /*
                1280x800@60Hz */
                <br>
                +
                <br>
                +    {74250,  1280, 720,  60, 22, 49,  3},   /*
                1280x720@60Hz */
                <br>
                +                        /* 1280x720@50Hz */
                <br>
                +
                <br>
                +    {78750,  1024, 768,  75, 16, 63,  5},   /*
                1024x768@75Hz */
                <br>
                +    {75000,  1024, 768,  70, 29, 87,  4},   /*
                1024x768@70Hz */
                <br>
                +    {65000,  1024, 768,  60, 20, 39,  3},   /*
                1024x768@60Hz */
                <br>
                +
                <br>
                +    {51200,  1024, 600,  60, 25, 64,  5},   /*
                1024x600@60Hz */
                <br>
                +
                <br>
                +    {57284,  832,  624,  75, 24, 55,  4},   /*
                832x624@75Hz */
                <br>
                +    {49500,  800,  600,  75, 40, 99,  5},   /*
                800x600@75Hz */
                <br>
                +    {50000,  800,  600,  72, 44, 88,  4},   /*
                800x600@72Hz */
                <br>
                +    {40000,  800,  600,  60, 30, 36,  3},   /*
                800x600@60Hz */
                <br>
                +    {36000,  800,  600,  56, 50, 72,  4},   /*
                800x600@56Hz */
                <br>
                +    {31500,  640,  480,  75, 40, 63,  5},   /*
                640x480@75Hz */
                <br>
                +                        /* 640x480@73Hz */
                <br>
                +
                <br>
                +    {30240,  640,  480,  67, 62, 75,  4},   /*
                640x480@67Hz */
                <br>
                +    {27000,  720,  576,  50, 50, 54,  4},   /*
                720x576@60Hz */
                <br>
                +    {25175,  640,  480,  60, 85, 107, 5},   /*
                640x480@60Hz */
                <br>
                +    {25200,  640,  480,  60, 50, 63,  5},   /*
                640x480@60Hz */
                <br>
                +                        /* 720x480@60Hz */
                <br>
                +};
                <br>
                +
                <br>
                +/*
                <br>
                + * lsdc_pixpll_setup - ioremap the device dependent PLL
                registers
                <br>
                + *
                <br>
                + * @this: point to the object where this function is
                called from
                <br>
                + */
                <br>
                +static int lsdc_pixpll_setup(struct lsdc_pll * const
                this)
                <br>
                +{
                <br>
                +    this-&gt;mmio = ioremap(this-&gt;reg_base,
                this-&gt;reg_size);
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * Find a set of pll parameters (to generate pixel
                clock) from a static
                <br>
                + * local table, which avoid to compute the pll
                parameter eachtime a
                <br>
                + * modeset is triggered.
                <br>
                + *
                <br>
                + * @this: point to the object which this function is
                called from
                <br>
                + * @clock: the desired output pixel clock, the unit is
                kHz
                <br>
                + * @pout: point to where the parameters to store if
                found
                <br>
                + *
                <br>
                + *  Return true if hit, otherwise return false.
                <br>
                + */
                <br>
                +static bool lsdc_pixpll_find(struct lsdc_pll * const
                this,
                <br>
                +                 unsigned int clock,
                <br>
                +                 struct lsdc_pll_parms * const pout)
                <br>
                +{
                <br>
                +    unsigned int num = ARRAY_SIZE(pll_param_table);
                <br>
                +    unsigned int i;
                <br>
                +
                <br>
                +    for (i = 0; i &lt; num; i++) {
                <br>
                +        if (clock != pll_param_table[i].clock)
                <br>
                +            continue;
                <br>
                +
                <br>
                +        pout-&gt;div_ref = pll_param_table[i].div_ref;
                <br>
                +        pout-&gt;loopc   = pll_param_table[i].loopc;
                <br>
                +        pout-&gt;div_out = pll_param_table[i].div_out;
                <br>
                +
                <br>
                +        return true;
                <br>
                +    }
                <br>
                +
                <br>
                +    drm_dbg(this-&gt;ddev, "pixel clock %u: miss\n",
                clock);
                <br>
                +
                <br>
                +    return false;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * Find a set of pll parameters which have minimal
                difference with the desired
                <br>
                + * pixel clock frequency. It does that by computing all
                of the possible
                <br>
                + * combination. Compute the diff and find the
                combination with minimal diff.
                <br>
                + *
                <br>
                + *  clock_out = refclk / div_ref * loopc / div_out
                <br>
                + *
                <br>
                + *  refclk is determined by the oscillator mounted
                board(Here is 100MHz in
                <br>
                + *  almost all case)
                <br>
                + *
                <br>
                + * @this: point to the object from which this function
                is called
                <br>
                + * @clock_khz: the desired output pixel clock, the unit
                is kHz
                <br>
                + * @pout: point to the out struct of lsdc_pll_parms
                <br>
                + *
                <br>
                + *  Return true if a parameter is found, otherwise
                return false
                <br>
                + */
                <br>
                +static bool lsdc_pixpll_compute(struct lsdc_pll * const
                this,
                <br>
                +                unsigned int clock_khz,
                <br>
                +                struct lsdc_pll_parms *pout)
                <br>
                +{
                <br>
                +    unsigned int refclk = this-&gt;ref_clock;
                <br>
                +    const unsigned int tolerance = 1000;
                <br>
                +    unsigned int min = tolerance;
                <br>
                +    unsigned int div_out, loopc, div_ref;
                <br>
                +    unsigned int computed;
                <br>
                +
                <br>
                +    if (lsdc_pixpll_find(this, clock_khz, pout))
                <br>
                +        return true;
                <br>
                +
                <br>
                +    for (div_out = 6; div_out &lt; 64; div_out++) {
                <br>
                +        for (div_ref = 3; div_ref &lt; 6; div_ref++) {
                <br>
                +            for (loopc = 6; loopc &lt; 161; loopc++) {
                <br>
                +                int diff;
                <br>
                +
                <br>
                +                if (loopc &lt; 12 * div_ref)
                <br>
                +                    continue;
                <br>
                +                if (loopc &gt; 32 * div_ref)
                <br>
                +                    continue;
                <br>
                +
                <br>
                +                computed = refclk * loopc / div_ref /
                div_out;
                <br>
                +
                <br>
                +                if (clock_khz &gt; computed)
                <br>
                +                    diff = clock_khz - computed;
                <br>
                +                else if (clock_khz &lt; computed)
                <br>
                +                    diff = computed - clock_khz;
                <br>
                +
                <br>
                +                if (diff &lt; min) {
                <br>
                +                    min = diff;
                <br>
                +                    pout-&gt;div_ref = div_ref;
                <br>
                +                    pout-&gt;div_out = div_out;
                <br>
                +                    pout-&gt;loopc = loopc;
                <br>
                +
                <br>
                +                    if (diff == 0)
                <br>
                +                        return true;
                <br>
                +                }
                <br>
                +            }
                <br>
                +        }
                <br>
                +    }
                <br>
                +
                <br>
                +    return min &lt; tolerance;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * Update the pll parameters to hardware, target to the
                pixpll in ls7a1000
                <br>
                + *
                <br>
                + * @this: point to the object from which this function
                is called
                <br>
                + * @pin: point to the struct of lsdc_pll_parms passed
                in
                <br>
                + *
                <br>
                + * return 0 if successful.
                <br>
                + */
                <br>
                +static int ls7a1000_pixpll_param_update(struct lsdc_pll
                * const this,
                <br>
                +                    struct lsdc_pll_parms const *pin)
                <br>
                +{
                <br>
                +    void __iomem *reg = this-&gt;mmio;
                <br>
                +    unsigned int counter = 0;
                <br>
                +    bool locked;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* Bypass the software configured PLL, using refclk
                directly */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val &amp;= ~(1 &lt;&lt; 8);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    /* Powerdown the PLL */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val |= (1 &lt;&lt; 13);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    /* Clear the pll parameters */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val &amp;= ~(1 &lt;&lt; 11);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    /* clear old value &amp; config new value */
                <br>
                +    val = readl(reg + 0x04);
                <br>
                +    val &amp;= ~0x7F;
                <br>
                +    val |= pin-&gt;div_ref;        /* div_ref */
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    val = readl(reg);
                <br>
                +    val &amp;= ~0x7f;
                <br>
                +    val |= pin-&gt;div_out;        /* div_out */
                <br>
                +
                <br>
                +    val &amp;= ~(0x1ff &lt;&lt; 21);
                <br>
                +    val |= pin-&gt;loopc &lt;&lt; 21;    /* loopc */
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Set the pll the parameters */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val |= (1 &lt;&lt; 11);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    /* Powerup the PLL */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val &amp;= ~(1 &lt;&lt; 13);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    /* Wait the PLL lock */
                <br>
                +    do {
                <br>
                +        val = readl(reg + 0x4);
                <br>
                +        locked = val &amp; 0x80;
                <br>
                +        counter++;
                <br>
                +    } while (!locked &amp;&amp; (counter &lt; 2000));
                <br>
                +
                <br>
                +    drm_dbg(this-&gt;ddev, "%u loop waited\n",
                counter);
                <br>
                +
                <br>
                +    /* Switch to the software configured pll */
                <br>
                +    val = readl(reg + 0x4);
                <br>
                +    val |= (1UL &lt;&lt; 8);
                <br>
                +    writel(val, reg + 0x4);
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * Update the pll parameters to hardware, target to the
                pixpll in ls2k1000
                <br>
                + *
                <br>
                + * @this: point to the object from which this function
                is called
                <br>
                + * @pin: point to the struct of lsdc_pll_parms passed
                in
                <br>
                + *
                <br>
                + * return 0 if successful.
                <br>
                + */
                <br>
                +static int ls2k1000_pixpll_param_update(struct lsdc_pll
                * const this,
                <br>
                +                    struct lsdc_pll_parms const *pin)
                <br>
                +{
                <br>
                +    void __iomem *reg = this-&gt;mmio;
                <br>
                +    unsigned int counter = 0;
                <br>
                +    bool locked = false;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    val = readl(reg);
                <br>
                +    /* Bypass the software configured PLL, using refclk
                directly */
                <br>
                +    val &amp;= ~(1 &lt;&lt; 0);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Powerdown the PLL */
                <br>
                +    val |= (1 &lt;&lt; 19);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Allow the software configuration */
                <br>
                +    val &amp;= ~(1 &lt;&lt; 2);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* allow L1 PLL lock */
                <br>
                +    val = (1L &lt;&lt; 7) | (3L &lt;&lt; 10);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* clear div_ref bit field */
                <br>
                +    val &amp;= ~(0x3f &lt;&lt; 26);
                <br>
                +    /* set div_ref bit field */
                <br>
                +    val |= pin-&gt;div_ref &lt;&lt; 26;
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    val = readl(reg + 4);
                <br>
                +    /* clear loopc bit field */
                <br>
                +    val &amp;= ~0x0fff;
                <br>
                +    /* set loopc bit field */
                <br>
                +    val |= pin-&gt;loopc;
                <br>
                +    writel(val, reg + 4);
                <br>
                +
                <br>
                +    /* set div_out */
                <br>
                +    writel(pin-&gt;div_out, reg + 8);
                <br>
                +
                <br>
                +    val = readl(reg);
                <br>
                +    /* use this parms configured just now */
                <br>
                +    val |= (1 &lt;&lt; 2);
                <br>
                +    /* powerup the PLL */
                <br>
                +    val &amp;= ~(1 &lt;&lt; 19);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* wait pll setup and locked */
                <br>
                +    do {
                <br>
                +        val = readl(reg);
                <br>
                +        locked = val &amp; 0x10000;
                <br>
                +        counter++;
                <br>
                +    } while (!locked &amp;&amp; (counter &lt; 2000));
                <br>
                +
                <br>
                +    drm_dbg(this-&gt;ddev, "%u loop waited\n",
                counter);
                <br>
                +
                <br>
                +    /* Switch to software configured PLL instead of
                refclk */
                <br>
                +    val |= 1;
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                +
                <br>
                +/*
                <br>
                + * Update the pll parameters to hardware, target to the
                pixpll in ls2k0500
                <br>
                + *
                <br>
                + * @this: point to the object which calling this
                function
                <br>
                + * @param: pointer to where the parameters passed in
                <br>
                + *
                <br>
                + * return 0 if successful.
                <br>
                + */
                <br>
                +static int ls2k0500_pixpll_param_update(struct lsdc_pll
                * const this,
                <br>
                +                    struct lsdc_pll_parms const *param)
                <br>
                +{
                <br>
                +    void __iomem *reg = this-&gt;mmio;
                <br>
                +    unsigned int counter = 0;
                <br>
                +    bool locked = false;
                <br>
                +    u32 val;
                <br>
                +
                <br>
                +    /* Bypass the software configured PLL, using refclk
                directly */
                <br>
                +    val = readl(reg);
                <br>
                +    val &amp;= ~(1 &lt;&lt; 0);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Powerdown the PLL */
                <br>
                +    val = readl(reg);
                <br>
                +    val |= (1 &lt;&lt; 5);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Allow the software configuration */
                <br>
                +    val |= (1 &lt;&lt; 3);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Update the pll params */
                <br>
                +    val = (param-&gt;div_out &lt;&lt; 24) |
                <br>
                +          (param-&gt;loopc &lt;&lt; 16) |
                <br>
                +          (param-&gt;div_ref &lt;&lt; 8);
                <br>
                +
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* Powerup the PLL */
                <br>
                +    val = readl(reg);
                <br>
                +    val &amp;= ~(1 &lt;&lt; 5);
                <br>
                +    writel(val, reg);
                <br>
                +
                <br>
                +    /* wait pll setup and locked */
                <br>
                +    do {
                <br>
                +        val = readl(reg);
                <br>
                +        locked = val &amp; 0x80;
                <br>
                +        counter++;
                <br>
                +    } while (!locked &amp;&amp; (counter &lt; 10000));
                <br>
                +
                <br>
                +    drm_dbg(this-&gt;ddev, "%u loop waited\n",
                counter);
                <br>
                +
                <br>
                +    /* Switch to software configured PLL instead of
                refclk */
                <br>
                +    writel((val | 1), reg);
                <br>
                +
                <br>
                +    return 0;
                <br>
                +}
                <br>
                +
                <br>
                +static unsigned int lsdc_get_clock_rate(struct lsdc_pll
                * const this,
                <br>
                +                    struct lsdc_pll_parms *pout)
                <br>
                +{
                <br>
                +    struct drm_device *ddev = this-&gt;ddev;
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    const struct lsdc_desc * const descp =
                ldev-&gt;descp;
                <br>
                +    unsigned int out;
                <br>
                +    union lsdc_pixpll_bitmap parms;
                <br>
                +
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A1000 ||
                descp-&gt;chip == CHIP_LS7A2000) {
                <br>
                +        struct ls7a1000_pixpll_bitmap *obj =
                &amp;parms.ls7a1000;
                <br>
                +
                <br>
                +        parms.dword[0] = readl(this-&gt;mmio);
                <br>
                +        parms.dword[1] = readl(this-&gt;mmio + 4);
                <br>
                +        out = this-&gt;ref_clock / obj-&gt;div_ref *
                obj-&gt;loopc / obj-&gt;div_out;
                <br>
                +        if (pout) {
                <br>
                +            pout-&gt;div_ref = obj-&gt;div_ref;
                <br>
                +            pout-&gt;loopc = obj-&gt;loopc;
                <br>
                +            pout-&gt;div_out = obj-&gt;div_out;
                <br>
                +        }
                <br>
                +    } else if (descp-&gt;chip == CHIP_LS2K1000) {
                <br>
                +        struct ls2k1000_pixpll_bitmap *obj =
                &amp;parms.ls2k1000;
                <br>
                +
                <br>
                +        parms.dword[0] = readl(this-&gt;mmio);
                <br>
                +        parms.dword[1] = readl(this-&gt;mmio + 4);
                <br>
                +        parms.dword[2] = readl(this-&gt;mmio + 8);
                <br>
                +        parms.dword[3] = readl(this-&gt;mmio + 12);
                <br>
                +        out = this-&gt;ref_clock / obj-&gt;div_ref *
                obj-&gt;loopc / obj-&gt;div_out;
                <br>
                +        if (pout) {
                <br>
                +            pout-&gt;div_ref = obj-&gt;div_ref;
                <br>
                +            pout-&gt;loopc = obj-&gt;loopc;
                <br>
                +            pout-&gt;div_out = obj-&gt;div_out;
                <br>
                +        }
                <br>
                +    } else if (descp-&gt;chip == CHIP_LS2K0500) {
                <br>
                +        struct ls2k0500_pixpll_bitmap *obj =
                &amp;parms.ls2k0500;
                <br>
                +
                <br>
                +        parms.dword[0] = readl(this-&gt;mmio);
                <br>
                +        out = this-&gt;ref_clock / obj-&gt;div_ref *
                obj-&gt;loopc / obj-&gt;div_out;
                <br>
                +        if (pout) {
                <br>
                +            pout-&gt;div_ref = obj-&gt;div_ref;
                <br>
                +            pout-&gt;loopc = obj-&gt;loopc;
                <br>
                +            pout-&gt;div_out = obj-&gt;div_out;
                <br>
                +        }
                <br>
                +    } else {
                <br>
                +        drm_err(ddev, "unknown chip, the driver need
                update\n");
                <br>
                +        return 0;
                <br>
                +    }
                <br>
                +
                <br>
                +    return out;
                <br>
                +}
                <br>
                +
                <br>
                +static const struct lsdc_pixpll_funcs
                ls7a1000_pixpll_funcs = {
                <br>
                +    .setup = lsdc_pixpll_setup,
                <br>
                +    .compute = lsdc_pixpll_compute,
                <br>
                +    .update = ls7a1000_pixpll_param_update,
                <br>
                +    .get_clock_rate = lsdc_get_clock_rate,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct lsdc_pixpll_funcs
                ls2k1000_pixpll_funcs = {
                <br>
                +    .setup = lsdc_pixpll_setup,
                <br>
                +    .compute = lsdc_pixpll_compute,
                <br>
                +    .update = ls2k1000_pixpll_param_update,
                <br>
                +    .get_clock_rate = lsdc_get_clock_rate,
                <br>
                +};
                <br>
                +
                <br>
                +static const struct lsdc_pixpll_funcs
                ls2k0500_pixpll_funcs = {
                <br>
                +    .setup = lsdc_pixpll_setup,
                <br>
                +    .compute = lsdc_pixpll_compute,
                <br>
                +    .update = ls2k0500_pixpll_param_update,
                <br>
                +    .get_clock_rate = lsdc_get_clock_rate,
                <br>
                +};
                <br>
                +
                <br>
                +int lsdc_pixpll_init(struct lsdc_pll * const this,
                <br>
                +             struct drm_device *ddev,
                <br>
                +             unsigned int index)
                <br>
                +{
                <br>
                +    struct lsdc_device *ldev = to_lsdc(ddev);
                <br>
                +    const struct lsdc_desc *descp = ldev-&gt;descp;
                <br>
                +
                <br>
                +    this-&gt;ddev = ddev;
                <br>
                +    this-&gt;index = index;
                <br>
                +    this-&gt;ref_clock = LSDC_PLL_REF_CLK;
                <br>
                +
                <br>
                +    /* LS7A1000 and LS7A2000's pixpll setting registers
                is same */
                <br>
                +    if (descp-&gt;chip == CHIP_LS7A2000 ||
                descp-&gt;chip == CHIP_LS7A1000) {
                <br>
                +        if (index == 0)
                <br>
                +            this-&gt;reg_base = LS7A1000_CFG_REG_BASE +
                LS7A1000_PIX_PLL0_REG;
                <br>
                +        else if (index == 1)
                <br>
                +            this-&gt;reg_base = LS7A1000_CFG_REG_BASE +
                LS7A1000_PIX_PLL1_REG;
                <br>
                +        this-&gt;reg_size = 8;
                <br>
                +        this-&gt;funcs = &amp;ls7a1000_pixpll_funcs;
                <br>
                +    } else if (descp-&gt;chip == CHIP_LS2K1000) {
                <br>
                +        if (index == 0)
                <br>
                +            this-&gt;reg_base = LS2K1000_CFG_REG_BASE +
                LS2K1000_PIX_PLL0_REG;
                <br>
                +        else if (index == 1)
                <br>
                +            this-&gt;reg_base = LS2K1000_CFG_REG_BASE +
                LS2K1000_PIX_PLL1_REG;
                <br>
                +
                <br>
                +        this-&gt;reg_size = 16;
                <br>
                +        this-&gt;funcs = &amp;ls2k1000_pixpll_funcs;
                <br>
                +    } else if (descp-&gt;chip == CHIP_LS2K0500) {
                <br>
                +        if (index == 0)
                <br>
                +            this-&gt;reg_base = LS2K0500_CFG_REG_BASE +
                LS2K0500_PIX_PLL0_REG;
                <br>
                +        else if (index == 1)
                <br>
                +            this-&gt;reg_base = LS2K0500_CFG_REG_BASE +
                LS2K0500_PIX_PLL1_REG;
                <br>
                +
                <br>
                +        this-&gt;reg_size = 4;
                <br>
                +        this-&gt;funcs = &amp;ls2k0500_pixpll_funcs;
                <br>
                +    } else {
                <br>
                +        drm_err(this-&gt;ddev, "unknown chip, the
                driver need update\n");
                <br>
                +        return -ENOENT;
                <br>
                +    }
                <br>
                +
                <br>
                +    return this-&gt;funcs-&gt;setup(this);
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.h
                b/drivers/gpu/drm/lsdc/lsdc_pll.h
                <br>
                new file mode 100644
                <br>
                index 000000000000..538739f461f2
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_pll.h
                <br>
                @@ -0,0 +1,78 @@
                <br>
                +/* SPDX-License-Identifier: GPL-2.0 */
                <br>
                +
                <br>
                +#ifndef __LSDC_PLL_H__
                <br>
                +#define __LSDC_PLL_H__
                <br>
                +
                <br>
                +#include &lt;drm/drm_device.h&gt;
                <br>
                +
                <br>
                +/*
                <br>
                + * Loongson Pixel PLL hardware structure
                <br>
                + *
                <br>
                + * refclk: reference frequency, 100 MHz from external
                oscillator
                <br>
                + * outclk: output frequency desired.
                <br>
                + *
                <br>
                + *
                <br>
                + *               L1       Fref Fvco     L2
                <br>
                + * refclk   +-----------+      +------------------+
                +---------+ outclk
                <br>
                + * ---+---&gt; | Prescaler | ---&gt; | Clock Multiplier
                | ---&gt; | divider | --------&gt;
                <br>
                + *    |     +-----------+      +------------------+
                +---------+     ^
                <br>
                + *    |           ^                      ^ ^          |
                <br>
                + *    |           |                      | |          |
                <br>
                + *    |           |                      | |          |
                <br>
                + *    |        div_ref                 loopc div_out |
                <br>
                + * | |
                <br>
                + *    +--- sel_out (bypass above software configurable
                clock if set) ----+
                <br>
                + *
                <br>
                + *  sel_out: PLL clock output selector (for debug
                purpose only).
                <br>
                + *
                <br>
                + *  If sel_out == 1, it will take refclk as output
                directly,
                <br>
                + *  the L1 Prescaler and the out divider will be
                bypassed.
                <br>
                + *
                <br>
                + *  If sel_out == 0, then outclk = refclk / div_ref *
                loopc / div_out;
                <br>
                + *
                <br>
                + * PLL working requirements:
                <br>
                + *
                <br>
                + *  1) 20 MHz &lt;= refclk / div_ref &lt;= 40Mhz
                <br>
                + *  2) 1.2 GHz &lt;= refclk /div_out * loopc &lt;= 3.2
                Ghz
                <br>
                + */
                <br>
                +
                <br>
                +struct lsdc_pll_parms {
                <br>
                +    unsigned int div_ref;
                <br>
                +    unsigned int loopc;
                <br>
                +    unsigned int div_out;
                <br>
                +};
                <br>
                +
                <br>
                +struct lsdc_pll;
                <br>
                +
                <br>
                +struct lsdc_pixpll_funcs {
                <br>
                +    int (*setup)(struct lsdc_pll * const this);
                <br>
                +    bool (*compute)(struct lsdc_pll * const this,
                <br>
                +            unsigned int clock,
                <br>
                +            struct lsdc_pll_parms *pout);
                <br>
                +    int (*update)(struct lsdc_pll * const this,
                <br>
                +              struct lsdc_pll_parms const *pin);
                <br>
                +    unsigned int (*get_clock_rate)(struct lsdc_pll *
                const this,
                <br>
                +                       struct lsdc_pll_parms *pout);
                <br>
                +};
                <br>
                +
                <br>
                +struct lsdc_pll {
                <br>
                +    const struct lsdc_pixpll_funcs *funcs;
                <br>
                +    struct drm_device *ddev;
                <br>
                +    void __iomem *mmio;
                <br>
                +
                <br>
                +    /* PLL register offset */
                <br>
                +    u32 reg_base;
                <br>
                +    /* PLL register size in bytes */
                <br>
                +    u32 reg_size;
                <br>
                +
                <br>
                +    /* 100000kHz, fixed on all board found */
                <br>
                +    unsigned int ref_clock;
                <br>
                +
                <br>
                +    unsigned int index;
                <br>
                +};
                <br>
                +
                <br>
                +int lsdc_pixpll_init(struct lsdc_pll * const this,
                <br>
                +             struct drm_device *ddev,
                <br>
                +             unsigned int index);
                <br>
                +
                <br>
                +#endif
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.c
                b/drivers/gpu/drm/lsdc/lsdc_regs.c
                <br>
                new file mode 100644
                <br>
                index 000000000000..c7950c43968f
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_regs.c
                <br>
                @@ -0,0 +1,29 @@
                <br>
                +// SPDX-License-Identifier: GPL-2.0
                <br>
                +
                <br>
                +#include "lsdc_drv.h"
                <br>
                +#include "lsdc_regs.h"
                <br>
                +
                <br>
                +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32
                offset)
                <br>
                +{
                <br>
                +    unsigned long flags;
                <br>
                +    u32 ret;
                <br>
                +
                <br>
                +    spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
                <br>
                +
                <br>
                +    ret = readl(ldev-&gt;reg_base + offset);
                <br>
                +
                <br>
                +    spin_unlock_irqrestore(&amp;ldev-&gt;reglock,
                flags);
                <br>
                +
                <br>
                +    return ret;
                <br>
                +}
                <br>
                +
                <br>
                +void lsdc_wreg32(struct lsdc_device * const ldev, u32
                offset, u32 val)
                <br>
                +{
                <br>
                +    unsigned long flags;
                <br>
                +
                <br>
                +    spin_lock_irqsave(&amp;ldev-&gt;reglock, flags);
                <br>
                +
                <br>
                +    writel(val, ldev-&gt;reg_base + offset);
                <br>
                +
                <br>
                +    spin_unlock_irqrestore(&amp;ldev-&gt;reglock,
                flags);
                <br>
                +}
                <br>
                diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.h
                b/drivers/gpu/drm/lsdc/lsdc_regs.h
                <br>
                new file mode 100644
                <br>
                index 000000000000..828956633137
                <br>
                --- /dev/null
                <br>
                +++ b/drivers/gpu/drm/lsdc/lsdc_regs.h
                <br>
                @@ -0,0 +1,296 @@
                <br>
                +/* SPDX-License-Identifier: GPL-2.0 */
                <br>
                +
                <br>
                +#ifndef __LSDC_REGS_H__
                <br>
                +#define __LSDC_REGS_H__
                <br>
                +
                <br>
                +#include &lt;linux/bitops.h&gt;
                <br>
                +#include &lt;linux/types.h&gt;
                <br>
                +
                <br>
                +/*
                <br>
                + * PIXEL PLL Reference clock
                <br>
                + */
                <br>
                +#define LSDC_PLL_REF_CLK               
                100000           /* kHz */
                <br>
                +
                <br>
                +/*
                <br>
                + * Those PLL registers are not located at DC reg bar
                space,
                <br>
                + * there are relative to LSXXXXX_CFG_REG_BASE.
                <br>
                + * XXXXX = 7A1000, 2K1000, 2K0500
                <br>
                + */
                <br>
                +
                <br>
                +/* LS2K1000 */
                <br>
                +#define LS2K1000_PIX_PLL0_REG           0x04B0
                <br>
                +#define LS2K1000_PIX_PLL1_REG           0x04C0
                <br>
                +#define LS2K1000_CFG_REG_BASE           0x1fe10000
                <br>
                +
                <br>
                +/* LS7A1000 and LS2K2000 */
                <br>
                +#define LS7A1000_PIX_PLL0_REG           0x04B0
                <br>
                +#define LS7A1000_PIX_PLL1_REG           0x04C0
                <br>
                +#define LS7A1000_CFG_REG_BASE           0x10010000
                <br>
                +
                <br>
                +/* LS2K0500 */
                <br>
                +#define LS2K0500_PIX_PLL0_REG           0x0418
                <br>
                +#define LS2K0500_PIX_PLL1_REG           0x0420
                <br>
                +#define LS2K0500_CFG_REG_BASE           0x1fe10000
                <br>
                +
                <br>
                +/*
                <br>
                + *  CRTC CFG REG
                <br>
                + */
                <br>
                +#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
                <br>
                +
                <br>
                +enum lsdc_pixel_format {
                <br>
                +    LSDC_PF_NONE = 0,
                <br>
                +    LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4
                bits each [16 bits] */
                <br>
                +    LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits
                [16 bits] */
                <br>
                +    LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
                <br>
                +    LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
                <br>
                +    LSDC_PF_RGBA8888 = 5,  /* ARGB [32 bits] */
                <br>
                +};
                <br>
                +
                <br>
                +/*
                <br>
                + * Each crtc has two set fb address registers usable,
                CFG_FB_IN_USING of
                <br>
                + * LSDC_CRTCx_CFG_REG specify which fb address register
                is currently
                <br>
                + * in using by the CRTC. CFG_PAGE_FLIP of
                LSDC_CRTCx_CFG_REG is used to
                <br>
                + * trigger the switch which will be finished at the
                very vblank. If you
                <br>
                + * want it switch to another again, you must set
                CFG_PAGE_FLIP again.
                <br>
                + */
                <br>
                +#define CFG_PAGE_FLIP                   BIT(7)
                <br>
                +#define CFG_OUTPUT_EN                   BIT(8)
                <br>
                +/* CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0
                using hardware logic */
                <br>
                +#define CFG_PANEL_SWITCH                BIT(9)
                <br>
                +/* Indicate witch fb addr reg is in using, currently */
                <br>
                +#define CFG_FB_IN_USING                 BIT(11)
                <br>
                +#define CFG_GAMMA_EN                    BIT(12)
                <br>
                +
                <br>
                +/* CRTC get soft reset if voltage level change from 1
                -&gt; 0 */
                <br>
                +#define CFG_RESET_N                     BIT(20)
                <br>
                +
                <br>
                +#define CFG_HSYNC_EN                    BIT(30)
                <br>
                +#define CFG_HSYNC_INV                   BIT(31)
                <br>
                +#define CFG_VSYNC_EN                    BIT(30)
                <br>
                +#define CFG_VSYNC_INV                   BIT(31)
                <br>
                +
                <br>
                +/* THE DMA step of the DC in LS7A2000 is configurable
                */
                <br>
                +#define LSDC_DMA_STEP_MASK              GENMASK(17, 16)
                <br>
                +enum lsdc_dma_steps_supported {
                <br>
                +    LSDC_DMA_STEP_256_BYTES = 0,
                <br>
                +    LSDC_DMA_STEP_128_BYTES = 1,
                <br>
                +    LSDC_DMA_STEP_64_BYTES = 2,
                <br>
                +    LSDC_DMA_STEP_32_BYTES = 3,
                <br>
                +};
                <br>
                +
                <br>
                +/******** CRTC0 &amp; DVO0 ********/
                <br>
                +#define LSDC_CRTC0_CFG_REG              0x1240
                <br>
                +#define LSDC_CRTC0_FB0_LO_ADDR_REG      0x1260
                <br>
                +#define LSDC_CRTC0_FB0_HI_ADDR_REG      0x15A0
                <br>
                +#define LSDC_CRTC0_FB1_LO_ADDR_REG      0x1580
                <br>
                +#define LSDC_CRTC0_FB1_HI_ADDR_REG      0x15C0
                <br>
                +#define LSDC_CRTC0_STRIDE_REG           0x1280
                <br>
                +#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
                <br>
                +#define LSDC_CRTC0_HDISPLAY_REG         0x1400
                <br>
                +#define LSDC_CRTC0_HSYNC_REG            0x1420
                <br>
                +#define LSDC_CRTC0_VDISPLAY_REG         0x1480
                <br>
                +#define LSDC_CRTC0_VSYNC_REG            0x14A0
                <br>
                +#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
                <br>
                +#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
                <br>
                +
                <br>
                +/******** CTRC1 &amp; DVO1 ********/
                <br>
                +#define LSDC_CRTC1_CFG_REG              0x1250
                <br>
                +#define LSDC_CRTC1_FB0_LO_ADDR_REG      0x1270
                <br>
                +#define LSDC_CRTC1_FB0_HI_ADDR_REG      0x15B0
                <br>
                +#define LSDC_CRTC1_FB1_LO_ADDR_REG      0x1590
                <br>
                +#define LSDC_CRTC1_FB1_HI_ADDR_REG      0x15D0
                <br>
                +#define LSDC_CRTC1_STRIDE_REG           0x1290
                <br>
                +#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
                <br>
                +#define LSDC_CRTC1_HDISPLAY_REG         0x1410
                <br>
                +#define LSDC_CRTC1_HSYNC_REG            0x1430
                <br>
                +#define LSDC_CRTC1_VDISPLAY_REG         0x1490
                <br>
                +#define LSDC_CRTC1_VSYNC_REG            0x14B0
                <br>
                +#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
                <br>
                +#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
                <br>
                +
                <br>
                +/*
                <br>
                + * LS7A2000 has the hardware which record the scan
                position of the CRTC
                <br>
                + * [31:16] : current X position, [15:0] : current Y
                position
                <br>
                + */
                <br>
                +#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
                <br>
                +#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
                <br>
                +
                <br>
                +/*
                <br>
                + * LS7A2000 has the hardware which count the number of
                vblank generated
                <br>
                + */
                <br>
                +#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
                <br>
                +#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
                <br>
                +
                <br>
                +/* In all, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG =
                0x10 */
                <br>
                +
                <br>
                +/*
                <br>
                + * There is only one hardware cursor unit in ls7a1000,
                ls2k1000 and ls2k0500.
                <br>
                + * well, ls7a2000 has two hardware cursor unit.
                <br>
                + */
                <br>
                +#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
                <br>
                +enum lsdc_cursor_format {
                <br>
                +    CURSOR_FORMAT_DISABLE = 0,
                <br>
                +    CURSOR_FORMAT_MONOCHROME = 1,
                <br>
                +    CURSOR_FORMAT_ARGB8888 = 2,
                <br>
                +};
                <br>
                +
                <br>
                +#define CURSOR_SIZE_64X64               BIT(2)
                <br>
                +#define CURSOR_LOCATION                 BIT(4)
                <br>
                +
                <br>
                +#define LSDC_CURSOR0_CFG_REG            0x1520
                <br>
                +#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
                <br>
                +#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
                <br>
                +#define LSDC_CURSOR0_POSITION_REG       0x1540
                <br>
                +#define LSDC_CURSOR0_BG_COLOR_REG       0x1550  /*
                background color */
                <br>
                +#define LSDC_CURSOR0_FG_COLOR_REG       0x1560  /*
                foreground color */
                <br>
                +
                <br>
                +#define LSDC_CURSOR1_CFG_REG            0x1670
                <br>
                +#define LSDC_CURSOR1_ADDR_LO_REG        0x1680
                <br>
                +#define LSDC_CURSOR1_ADDR_HI_REG        0x16e0
                <br>
                +#define LSDC_CURSOR1_POSITION_REG       0x1690  /*
                [31:16] Y, [15:0] X */
                <br>
                +#define LSDC_CURSOR1_BG_COLOR_REG       0x16A0  /*
                background color */
                <br>
                +#define LSDC_CURSOR1_FG_COLOR_REG       0x16B0  /*
                foreground color */
                <br>
                +
                <br>
                +/*
                <br>
                + * DC Interrupt Control Register, 32bit, Address
                Offset: 1570
                <br>
                + *
                <br>
                + * Bits 15:0 inidicate the interrupt status
                <br>
                + * Bits 31:16 control enable interrupts corresponding
                to bit 15:0 or not
                <br>
                + * Write 1 to enable, write 0 to disable
                <br>
                + *
                <br>
                + * RF: Read Finished
                <br>
                + * IDBU: Internal Data Buffer Underflow
                <br>
                + * IDBFU: Internal Data Buffer Fatal Underflow
                <br>
                + * CBRF: Cursor Buffer Read Finished Flag, no use.
                <br>
                + *
                <br>
                + *
                +-------+--------------------------+-------+--------+--------+-------+
                <br>
                + * | 31:27 |         26:16            | 15:11 |   10  
                | 9 |   8   |
                <br>
                + *
                +-------+--------------------------+-------+--------+--------+-------+
                <br>
                + * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0
                | IDBFU1 | IDBU0 |
                <br>
                + *
                +-------+--------------------------+-------+--------+--------+-------+
                <br>
                + *
                <br>
                + *
                +-------+-----+-----+------+--------+--------+--------+--------+
                <br>
                + * |   7   |  6  |  5  |  4   |   3    |   2    |  
                1    | 0    |
                <br>
                + *
                +-------+-----+-----+------+--------+--------+--------+--------+
                <br>
                + * | IDBU1 | RF0 | RF1 | CRRF | HSYNC0 | VSYNC0 |
                HSYNC1 | VSYNC1 |
                <br>
                + *
                +-------+-----+-----+------+--------+--------+--------+--------+
                <br>
                + */
                <br>
                +
                <br>
                +#define LSDC_INT_REG                    0x1570
                <br>
                +
                <br>
                +#define INT_CRTC0_VSYNC                 BIT(2)
                <br>
                +#define INT_CRTC0_HSYNC                 BIT(3)
                <br>
                +#define INT_CRTC0_RF                    BIT(6)
                <br>
                +#define INT_CRTC0_IDBU                  BIT(8)
                <br>
                +#define INT_CRTC0_IDBFU                 BIT(10)
                <br>
                +
                <br>
                +#define INT_CRTC1_VSYNC                 BIT(0)
                <br>
                +#define INT_CRTC1_HSYNC                 BIT(1)
                <br>
                +#define INT_CRTC1_RF                    BIT(5)
                <br>
                +#define INT_CRTC1_IDBU                  BIT(7)
                <br>
                +#define INT_CRTC1_IDBFU                 BIT(9)
                <br>
                +
                <br>
                +#define INT_CRTC0_VS_EN                 BIT(18)
                <br>
                +#define INT_CRTC0_HS_EN                 BIT(19)
                <br>
                +#define INT_CRTC0_RF_EN                 BIT(22)
                <br>
                +#define INT_CRTC0_IDBU_EN               BIT(24)
                <br>
                +#define INT_CRTC0_IDBFU_EN              BIT(26)
                <br>
                +
                <br>
                +#define INT_CRTC1_VS_EN                 BIT(16)
                <br>
                +#define INT_CRTC1_HS_EN                 BIT(17)
                <br>
                +#define INT_CRTC1_RF_EN                 BIT(21)
                <br>
                +#define INT_CRTC1_IDBU_EN               BIT(23)
                <br>
                +#define INT_CRTC1_IDBFU_EN              BIT(25)
                <br>
                +
                <br>
                +#define INT_STATUS_MASK                 GENMASK(15, 0)
                <br>
                +
                <br>
                +/*
                <br>
                + * LS7A1000/LS7A2000 have 4 gpios which are used to
                emulated I2C.
                <br>
                + * They are under control of the LS7A_DC_GPIO_DAT_REG
                and LS7A_DC_GPIO_DIR_REG
                <br>
                + * register, Those GPIOs has no relationship whth the
                GPIO hardware on the
                <br>
                + * bridge chip itself. Those offsets are relative to DC
                register base address
                <br>
                + *
                <br>
                + * LS2k1000 and LS2K0500 don't have those registers,
                they use hardware i2c
                <br>
                + * or general GPIO emulated i2c from linux i2c
                subsystem.
                <br>
                + *
                <br>
                + * GPIO data register, address offset: 0x1650
                <br>
                + *   +---------------+-----------+-----------+
                <br>
                + *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
                <br>
                + *   +---------------+-----------+-----------+
                <br>
                + *   |               |    DVO1   |    DVO0   |
                <br>
                + *   +      N/A      +-----------+-----------+
                <br>
                + *   |               | SCL | SDA | SCL | SDA |
                <br>
                + *   +---------------+-----------+-----------+
                <br>
                + */
                <br>
                +#define LS7A_DC_GPIO_DAT_REG            0x1650
                <br>
                +
                <br>
                +/*
                <br>
                + *  GPIO Input/Output direction control register,
                address offset: 0x1660
                <br>
                + */
                <br>
                +#define LS7A_DC_GPIO_DIR_REG            0x1660
                <br>
                +
                <br>
                +/*
                <br>
                + *  LS7A2000 has two built-in HDMI Encoder and one VGA
                encoder
                <br>
                + */
                <br>
                +
                <br>
                +/*
                <br>
                + * Number of continuous packets may be present
                <br>
                + * in HDMI hblank and vblank zone, should &gt;= 48
                <br>
                + */
                <br>
                +#define LSDC_HDMI0_ZONE_REG             0x1700
                <br>
                +#define LSDC_HDMI1_ZONE_REG             0x1710
                <br>
                +
                <br>
                +#define HDMI_INTERFACE_EN               BIT(0)
                <br>
                +#define HDMI_PACKET_EN                  BIT(1)
                <br>
                +#define HDMI_AUDIO_EN                   BIT(2)
                <br>
                +#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
                <br>
                +#define HDMI_HW_I2C_EN                  BIT(8)
                <br>
                +#define HDMI_CTL_PERIOD_MODE            BIT(9)
                <br>
                +#define LSDC_HDMI0_CTRL_REG             0x1720
                <br>
                +#define LSDC_HDMI1_CTRL_REG             0x1730
                <br>
                +
                <br>
                +#define HDMI_PHY_EN                     BIT(0)
                <br>
                +#define HDMI_PHY_RESET_N                BIT(1)
                <br>
                +#define HDMI_PHY_TERM_L_EN              BIT(8)
                <br>
                +#define HDMI_PHY_TERM_H_EN              BIT(9)
                <br>
                +#define HDMI_PHY_TERM_DET_EN            BIT(10)
                <br>
                +#define HDMI_PHY_TERM_STATUS            BIT(11)
                <br>
                +#define LSDC_HDMI0_PHY_CTRL_REG         0x1800
                <br>
                +#define LSDC_HDMI1_PHY_CTRL_REG         0x1810
                <br>
                +
                <br>
                +/*
                <br>
                + *  IDF: Input Division Factor
                <br>
                + *  ODF: Output Division Factor
                <br>
                + *   LF: Loop Factor
                <br>
                + *    M: Required Mult
                <br>
                + *
                <br>
                + *
                +--------------------------------------------------------+
                <br>
                + *  |     Fin (kHZ)     | M  | IDF | LF | ODF |
                Fout(Mhz)  |
                <br>
                + *
                |-------------------+----+-----+----+-----+--------------|
                <br>
                + *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~
                3400  |
                <br>
                + *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~
                1700  |
                <br>
                + *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~
                850   |
                <br>
                + *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~
                425  |
                <br>
                + *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~
                212.5 |
                <br>
                + *
                +--------------------------------------------------------+
                <br>
                + */
                <br>
                +#define LSDC_HDMI0_PHY_PLL_REG    ��     0x1820
                <br>
                +#define LSDC_HDMI1_PHY_PLL_REG          0x1830
                <br>
                +
                <br>
                +#define HDMI_PLL_ENABLE                 BIT(0)
                <br>
                +#define HDMI_PLL_LOCKED                 BIT(16)
                <br>
                +#define HDMI_PLL_BYPASS                 BIT(17)
                <br>
                +
                <br>
                +#define HDMI_PLL_IDF_SHIFT              1
                <br>
                +#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
                <br>
                +#define HDMI_PLL_LF_SHIFT               6
                <br>
                +#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
                <br>
                +#define HDMI_PLL_ODF_SHIFT              13
                <br>
                +#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
                <br>
                +
                <br>
                +/* LS7A2000 have hpd support */
                <br>
                +#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
                <br>
                +#define HDMI0_HPD_FLAG                  BIT(0)
                <br>
                +#define HDMI1_HPD_FLAG                  BIT(1)
                <br>
                +
                <br>
                +#endif
                <br>
              </blockquote>
              <br>
            </blockquote>
            <br>
          </blockquote>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------umbYD8oi4h9dzQad4PFY3gji--
