Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D914E693FB9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 09:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921D10E4CC;
	Mon, 13 Feb 2023 08:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B2D910E4CC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 08:36:11 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:41142.49377022
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 5D7F8100295;
 Mon, 13 Feb 2023 16:36:00 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-698c9d7bb7-c7zbh with ESMTP id
 8a49fb3a32a5482ba85ed2090c1c2b99 for suijingfeng@loongson.cn; 
 Mon, 13 Feb 2023 16:36:07 CST
X-Transaction-ID: 8a49fb3a32a5482ba85ed2090c1c2b99
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <8996f54e-2bfc-112a-a810-91d904d19541@189.cn>
Date: Mon, 13 Feb 2023 16:35:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm: add kms driver for loongson display controller
Content-Language: en-US
To: Sui jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230205161724.488421-1-15330273260@189.cn>
 <1b9df663-5dbc-d7f2-a1d6-41594983f1f0@suse.de>
 <423287b6-a25e-299a-bb35-783507dcbf16@loongson.cn>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <423287b6-a25e-299a-bb35-783507dcbf16@loongson.cn>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/2/13 12:24, Sui jingfeng wrote:
>
> On 2023/2/10 23:04, Thomas Zimmermann wrote:
>> Hi
>>
> Hello,
>> Am 05.02.23 um 17:17 schrieb suijingfeng:
>>> From: suijingfeng <suijingfeng@loongson.cn>
>>>
>>> Loongson display controller IP has been integrated in both Loongson
>>> North Bridge chipset(ls7a1000 and ls7a2000) and Loongson SoCs(ls2k1000
>>> and ls2k2000 etc), it even been included in Loongson BMC products.
>>>
>>> The display controller is a PCI device, it has two display pipe.
>>> For the DC in LS7A1000 and LS2K1000 each way has a DVO output interface
>>> which provide RGB888 signals, vertical & horizontal synchronisations,
>>> and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
>>> the maximum resolution is 2048x2048 according to the hardware spec.
>>>
>>> For the DC in LS7A2000, each display pipe is connected with a built-in
>>> HDMI encoder which support 3840x2160@30Hz. the first display pipe is
>>> also equipped with a transparent vga encoder which is parallel with
>>> the hdmi encoder. The DC in LS7A2000 is more complete, besides above
>>> feature, it has two hardware cursors, two hardware vblank counter and
>>> two scanout position recoders. It also support hdmi audio and tiled
>>> format etc.
>>>
>>>   v2:
>>>    1) Use hpd status reg when polling for ls7a2000
>>>    2) Fix all warnings emerged when compile with W=1
>>>
>>> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
>>> Signed-off-by: suijingfeng <15330273260@189.cn>
>>> ---
>>>   drivers/gpu/drm/Kconfig             |   2 +
>>>   drivers/gpu/drm/Makefile            |   1 +
>>>   drivers/gpu/drm/lsdc/Kconfig        |  17 +
>>>   drivers/gpu/drm/lsdc/Makefile       |  14 +
>>>   drivers/gpu/drm/lsdc/lsdc_crtc.c    | 421 ++++++++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_debugfs.c | 191 +++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_drv.c     | 635 
>>> ++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_drv.h     | 274 ++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_i2c.c     | 201 +++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_irq.c     |  86 ++++
>>>   drivers/gpu/drm/lsdc/lsdc_output.c  | 452 ++++++++++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_plane.c   | 443 +++++++++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_pll.c     | 569 +++++++++++++++++++++++++
>>>   drivers/gpu/drm/lsdc/lsdc_pll.h     |  78 ++++
>>>   drivers/gpu/drm/lsdc/lsdc_regs.c    |  29 ++
>>>   drivers/gpu/drm/lsdc/lsdc_regs.h    | 296 +++++++++++++
>>>   16 files changed, 3709 insertions(+)
>>>   create mode 100644 drivers/gpu/drm/lsdc/Kconfig
>>>   create mode 100644 drivers/gpu/drm/lsdc/Makefile
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_crtc.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_debugfs.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_drv.h
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_i2c.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_irq.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_output.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_plane.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_pll.h
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.c
>>>   create mode 100644 drivers/gpu/drm/lsdc/lsdc_regs.h
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index dc0f94f02a82..3baecd48930b 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -367,6 +367,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
>>>     source "drivers/gpu/drm/sprd/Kconfig"
>>>   +source "drivers/gpu/drm/lsdc/Kconfig"
>>> +
>>>   config DRM_HYPERV
>>>       tristate "DRM Support for Hyper-V synthetic video device"
>>>       depends on DRM && PCI && MMU && HYPERV
>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>> index ab4460fcd63f..5a8e2fc8dd5d 100644
>>> --- a/drivers/gpu/drm/Makefile
>>> +++ b/drivers/gpu/drm/Makefile
>>> @@ -190,3 +190,4 @@ obj-y            += gud/
>>>   obj-$(CONFIG_DRM_HYPERV) += hyperv/
>>>   obj-y            += solomon/
>>>   obj-$(CONFIG_DRM_SPRD) += sprd/
>>> +obj-$(CONFIG_DRM_LSDC) += lsdc/
>>> diff --git a/drivers/gpu/drm/lsdc/Kconfig 
>>> b/drivers/gpu/drm/lsdc/Kconfig
>>> new file mode 100644
>>> index 000000000000..8b9bb6996877
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/Kconfig
>>> @@ -0,0 +1,17 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +config DRM_LSDC
>>> +    tristate "DRM support for loongson display controller"
>>> +    depends on DRM && PCI && (MACH_LOONGSON64 || LOONGARCH || MIPS)
>>
>> If possible, I'd add a single 'depends on' statement for each AND 
>> condition. Like this
>>
>>   depends on DRM
>>   depends on PCI
>>   depends on (MACH_LOONGSON64 || LOONGARCH || MIPS)
>>
>> Does it build on other architectures if you add COMPILE_TEST to that 
>> list of architectures? If so, it would simplify testing a lot.
>>
Hi, Should I add COMPILE_TEST to the list of architectures on next version?
>>> +    select OF
>>
>> I don't think that it is allowed to select OF. Rather use
>>
>>   depends on OF
>>
>> I think that general rule is that it is not allowed to auto-select 
>> options that are selectable by users. That's the case for OF.
>>
>>
> Ok, depends on OF is acceptable.
>
>>> +    select DRM_KMS_HELPER
>>> +    select DRM_TTM
>>> +    select DRM_TTM_HELPER
>>> +    select DRM_VRAM_HELPER
>>> +    default m
>>
>> No default, especially not 'm'. Everything should be off by default.
>>
>>> +    help
>>> +      This is a KMS driver for loongson display controller in the
>>> +      LS7A1000/LS7A2000 bridge chip and LS2K1000/LS2K0500 SoC.
>>> +      If "M" is selected, the module will be called lsdc.
>>> +
>>> +      If in doubt, say "Y".
>>
>> Always say "N" by default. There are a few exceptions where "yes" is 
>> advised, but regular drivers are not one of them.
>>
>>> diff --git a/drivers/gpu/drm/lsdc/Makefile 
>>> b/drivers/gpu/drm/lsdc/Makefile
>>> new file mode 100644
>>> index 000000000000..d4b901ec09cf
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/Makefile
>>> @@ -0,0 +1,14 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +lsdc-y := \
>>> +    lsdc_drv.o \
>>> +    lsdc_crtc.o \
>>> +    lsdc_irq.o \
>>> +    lsdc_plane.o \
>>> +    lsdc_pll.o \
>>> +    lsdc_i2c.o \
>>> +    lsdc_output.o \
>>> +    lsdc_regs.o \
>>> +    lsdc_debugfs.o
>>
>> Please always sort such lists alphabetically.
>>
>>> +
>>> +obj-$(CONFIG_DRM_LSDC) += lsdc.o
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_crtc.c
>>> new file mode 100644
>>> index 000000000000..e23e6085f418
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
>>> @@ -0,0 +1,421 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <drm/drm_vblank.h>
>>> +#include <drm/drm_atomic.h>
>>> +#include <drm/drm_atomic_helper.h>
>>
>> Same here, alphabetical sorting.
>>
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +#include "lsdc_pll.h"
>>
>> Sorting.
>>
> All of problem mentioned above will be solved at next version, thinks.
>>> +
>>> +static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(crtc->dev);
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>> +
>>> +    if (index == 0)
>>> +        val |= INT_CRTC0_VS_EN;
>>> +    else if (index == 1)
>>> +        val |= INT_CRTC1_VS_EN;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(crtc->dev);
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>> +
>>> +    if (index == 0)
>>> +        val &= ~INT_CRTC0_VS_EN;
>>> +    else if (index == 1)
>>> +        val &= ~INT_CRTC1_VS_EN;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val);
>>> +}
>>> +
>>> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    struct lsdc_crtc_state *priv_crtc_state;
>>> +    u32 val = CFG_RESET_N | LSDC_PF_XRGB8888;
>>> +
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +
>>> +    if (crtc->state) {
>>> +        priv_crtc_state = to_lsdc_crtc_state(crtc->state);
>>> + __drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
>>> +        kfree(priv_crtc_state);
>>> +    }
>>> +
>>> +    priv_crtc_state = kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
>>> +    if (!priv_crtc_state)
>>> +        return;
>>> +
>>> +    __drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->base);
>>> +
>>> +    drm_info(ddev, "CRTC-%u reset\n", index);
>>
>> No drm_info() here. You could use drm_dbg() if you really want to 
>> print something. I'd advise to simply remove that line.
>>
>>> +}
>>> +
>>> +static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc,
>>> +                       struct drm_crtc_state *state)
>>> +{
>>> +    struct lsdc_crtc_state *priv_crtc_state = 
>>> to_lsdc_crtc_state(state);
>>> +
>>> + __drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
>>> +
>>> +    kfree(priv_crtc_state);
>>> +}
>>> +
>>> +static struct drm_crtc_state *
>>> +lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
>>> +{
>>> +    struct lsdc_crtc_state *new_priv_state;
>>> +    struct lsdc_crtc_state *old_priv_state;
>>> +
>>> +    new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
>>> +    if (!new_priv_state)
>>> +        return NULL;
>>> +
>>> +    __drm_atomic_helper_crtc_duplicate_state(crtc, 
>>> &new_priv_state->base);
>>> +
>>> +    old_priv_state = to_lsdc_crtc_state(crtc->state);
>>> +
>>> +    memcpy(&new_priv_state->pparms, &old_priv_state->pparms,
>>> +           sizeof(new_priv_state->pparms));
>>> +
>>> +    return &new_priv_state->base;
>>> +}
>>> +
>>> +static u32 lsdc_get_vblank_counter(struct drm_crtc *crtc)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +    struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
>>> +    unsigned int index = dispipe->index;
>>> +
>>> +    /* fallback to software emulated VBLANK counter */
>>> +    if (!descp->has_vblank_counter)
>>> +        goto fallback;
>>> +
>>> +    if (index == 0)
>>> +        return lsdc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG);
>>> +
>>> +    if (index == 1)
>>> +        return lsdc_rreg32(ldev, LSDC_CRTC1_VSYNC_COUNTER_REG);
>>> +
>>> +fallback:
>>> +    return (u32)drm_crtc_vblank_count(crtc);
>>> +}
>>> +
>>> +static const struct drm_crtc_funcs lsdc_crtc_funcs = {
>>
>> My advise for the design is to untangle the different cases into 
>> smaller helpers as much as possible.
>>
>> You have several chips with multiple pipelines. I would advise to 
>> provide a funcs array for each possible case. For example:
>>
>>   u32 lsdc_crtc0_get_vblank_counter(struct drm_crtc *crtc)
>>   {
>>     // return LSDC_CRTC0_VSYNC_COUNTER_REG
>>   }
>>
>>   u32 lsdc_crtc1_get_vblank_counter(struct drm_crtc *crtc)
>>   {
>>     // return LSDC_CRTC1_VSYNC_COUNTER_REG
>>   }
>>
>> and use a different funcs instance for each pipeline
>>
>>   struct lsdc_crtc0_funcs_ls2k2000 = {
>>     .get_vblank_counter = lsdc_crtc0_get_vblank_counter,
>>   };
>>
>>   struct lsdc_crtc1_funcs_ls2k2000 = {
>>     .get_vblank_counter = lsdc_crtc1_get_vblank_counter,
>>   };
>>
>> For hardware without vblank counter, use another instance
>>
>>   struct lsdc_crtc0_funcs_ls2k0500 = {
>>     // no
>>   };
>>
>> At first, this looks like a lot of code. But in the long term, this 
>> pays of, because it's so much more maintainable. If you have 
>> functions that work with any CRTC, you can still share the 
>> implementation.
> I am agree.
>>
>> All this goes for other components as well.
>>
>> You may want to study mgag200. It supports ~10 chips. Handling this 
>> in single functions was unmaintainable. So we split everything into 
>> smaller helpers that each handle a single case. And then we build a 
>> dedicated modesetting pipeline for each chip from various helpers. 
>> Common code is shared among the chips.
>>
> I guess you may want divide and conquer them, mgag200 driver's 
> structure is basic same with ast.
>
> they have only one display pipe and they are both standard pci 
> device.  I'm already absorb many merits from mgag200 and ast.
>
> And i buy two mga video card, sadly they can boot on loongson 
> platform,  x86emu will let them pass, loongson uefi/pmon firmware
>
> need adapting. I can only study it by reading the code.
>
Sorry, there have typos here:

i buy two MGA video cards, sadly they can't boot on loongson platform, 
x86emu in firmware will block them

from working.  Study it on x86 platform is still possible i think.

I will focus on its decision seriously, and improve device driver design 
skill. But i found it is so different

from the display controller in ls7a1000/ls7a2000, the display controller 
in ls7a1000/ls7a2000 seem come from

embedded world and walking toward pc, and it don't support  vga address 
hole and don't compatible

with IBM vga standard.  mgag200 seems come from standard old pc vga card.

>> Here's where we select the chip:
>>
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_drv.c#L227 
>>
>>
>> There's a source file for each chip and the common source code is in
>>
> I will follow this method at next version, but our hardware and bios 
> engineers is ugly, they often made the chip indistinguishable.
>
> ls7a1000 and ls2k1000 have the same pci device  id, ls7a2000 and 
> ls2k2000 have the same pci device id,
>
> even the revision id is same. I have no choice but to rely on DT or 
> kernel cmd passing parameters.
>
> many reviewers and maintainer seem not happy about this.
>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mgag200/mgag200_mode.c 
>>
>>
>>
>>> +    .reset = lsdc_crtc_reset,
>>> +    .destroy = drm_crtc_cleanup,
>>> +    .set_config = drm_atomic_helper_set_config,
>>> +    .page_flip = drm_atomic_helper_page_flip,
>>> +    .atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,
>>> +    .atomic_destroy_state = lsdc_crtc_atomic_destroy_state,
>>> +    .get_vblank_counter = lsdc_get_vblank_counter,
>>> +    .enable_vblank = lsdc_crtc_enable_vblank,
>>> +    .disable_vblank = lsdc_crtc_disable_vblank,
>>> +    .get_vblank_timestamp = 
>>> drm_crtc_vblank_helper_get_vblank_timestamp,
>>> +};
>>> +
>>> +static enum drm_mode_status
>>> +lsdc_crtc_mode_valid(struct drm_crtc *crtc,
>>> +             const struct drm_display_mode *mode)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (mode->hdisplay > descp->max_width)
>>> +        return MODE_BAD_HVALUE;
>>> +    if (mode->vdisplay > descp->max_height)
>>> +        return MODE_BAD_VVALUE;
>>> +
>>> +    if (mode->clock > descp->max_pixel_clk) {
>>> +        drm_dbg(ddev, "mode %dx%d, pixel clock=%d is too high\n",
>>> +            mode->hdisplay, mode->vdisplay, mode->clock);
>>> +        return MODE_CLOCK_HIGH;
>>> +    }
>>> +
>>> +    if ((mode->hdisplay * 4) % descp->pitch_align) {
>>> +        drm_dbg(ddev, "stride is require to not %u bytes aligned\n",
>>> +            descp->pitch_align);
>>> +        return MODE_BAD;
>>> +    }
>>> +
>>> +    return MODE_OK;
>>> +}
>>> +
>>> +static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
>>> +                    struct drm_crtc_state *state)
>>> +{
>>> +    struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
>>> +    struct lsdc_pll *pixpll = &dispipe->pixpll;
>>> +    const struct lsdc_pixpll_funcs *pfuncs = pixpll->funcs;
>>> +    struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(state);
>>> +    bool ret;
>>> +
>>> +    ret = pfuncs->compute(pixpll, state->mode.clock, 
>>> &priv_state->pparms);
>>> +    if (ret)
>>> +        return 0;
>>> +
>>> +    drm_warn(crtc->dev, "failed find PLL parameters for %u\n", 
>>> state->mode.clock);
>>> +
>>> +    return -EINVAL;
>>> +}
>>> +
>>> +static int lsdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
>>> +                     struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_crtc_state *crtc_state = 
>>> drm_atomic_get_new_crtc_state(state, crtc);
>>> +
>>> +    if (!crtc_state->enable)
>>> +        return 0; /* no mode checks if CRTC is being disabled */
>>> +
>>> +    return lsdc_pixpll_atomic_check(crtc, crtc_state);
>>> +}
>>> +
>>> +static void lsdc_update_pixclk(struct lsdc_display_pipe *dispipe,
>>> +                   struct lsdc_crtc_state *priv_state)
>>> +{
>>> +    struct lsdc_pll *pixpll = &dispipe->pixpll;
>>> +    const struct lsdc_pixpll_funcs *clkfunc = pixpll->funcs;
>>> +
>>> +    clkfunc->update(pixpll, &priv_state->pparms);
>>> +}
>>> +
>>> +static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct drm_display_mode *mode = &crtc->state->mode;
>>> +    struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
>>> +    struct lsdc_crtc_state *priv_state = 
>>> to_lsdc_crtc_state(crtc->state);
>>> +    unsigned int index = dispipe->index;
>>> +    u32 h_sync, v_sync, h_val, v_val;
>>> +    u32 val;
>>> +
>>> +    /* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
>>> +    h_val = (mode->crtc_htotal << 16) | mode->crtc_hdisplay;
>>> +
>>> +    /* 26:16 total pixels, 10:0 visiable pixels, in vertical */
>>> +    v_val = (mode->crtc_vtotal << 16) | mode->crtc_vdisplay;
>>> +    /* 26:16 hsync end, 10:0 hsync start, bit 30 is hsync enable */
>>> +    h_sync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start 
>>> | CFG_HSYNC_EN;
>>> +    if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>>> +        h_sync |= CFG_HSYNC_INV;
>>> +
>>> +    /* 26:16 vsync end, 10:0 vsync start, bit 30 is vsync enable */
>>> +    v_sync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start 
>>> | CFG_VSYNC_EN;
>>> +    if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>>> +        v_sync |= CFG_VSYNC_INV;
>>> +
>>> +    if (index == 0) {
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_HDISPLAY_REG, h_val);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_VDISPLAY_REG, v_val);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_HSYNC_REG, h_sync);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_VSYNC_REG, v_sync);
>>> +
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +        val = (val & ~LSDC_DMA_STEP_MASK) | LSDC_DMA_STEP_256_BYTES;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +    } else if (index == 1) {
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_HDISPLAY_REG, h_val);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_VDISPLAY_REG, v_val);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_HSYNC_REG, h_sync);
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_VSYNC_REG, v_sync);
>>> +
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +        val = (val & ~LSDC_DMA_STEP_MASK) | LSDC_DMA_STEP_256_BYTES;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +    }
>>
>> Same here as with vblank: have one helper for each index and use 
>> different _funcs structures for each pipeline.
>>
> Well, I will revise lsdc driver with this idea in mind.
>>> +
>>> +    drm_dbg(ddev, "%s modeset: %ux%u\n",
>>> +        crtc->name, mode->hdisplay, mode->vdisplay);
>>> +
>>> +    lsdc_update_pixclk(dispipe, priv_state);
>>> +}
>>> +
>>> +static void lsdc_enable_display(struct lsdc_device *ldev, unsigned 
>>> int index)
>>> +{
>>> +    u32 val;
>>> +
>>> +    if (index == 0) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +        val |= CFG_OUTPUT_EN;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +        return;
>>> +    }
>>> +
>>> +    if (index == 1) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +        val |= CFG_OUTPUT_EN;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +        return;
>>> +    }
>>> +}
>>> +
>>> +static void lsdc_disable_display(struct lsdc_device *ldev, unsigned 
>>> int index)
>>> +{
>>> +    u32 val;
>>> +
>>> +    if (index == 0) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +        val &= ~CFG_OUTPUT_EN;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +        return;
>>> +    }
>>> +
>>> +    if (index == 1) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +        val &= ~CFG_OUTPUT_EN;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +        return;
>>> +    }
>>> +}
>>> +
>>> +static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>> +                       struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +
>>> +    drm_crtc_vblank_on(crtc);
>>> +
>>> +    lsdc_enable_display(ldev, drm_crtc_index(crtc));
>>> +
>>> +    drm_dbg(ddev, "%s: enabled\n", crtc->name);
>>> +}
>>> +
>>> +static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>>> +                        struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +
>>> +    lsdc_disable_display(ldev, drm_crtc_index(crtc));
>>> +
>>> +    drm_crtc_wait_one_vblank(crtc);
>>> +
>>> +    drm_crtc_vblank_off(crtc);
>>> +
>>> +    drm_dbg(ddev, "%s: disabled\n", crtc->name);
>>> +}
>>> +
>>> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
>>> +                   struct drm_atomic_state *state)
>>> +{
>>> +    spin_lock_irq(&crtc->dev->event_lock);
>>> +    if (crtc->state->event) {
>>> +        if (drm_crtc_vblank_get(crtc) == 0)
>>> +            drm_crtc_arm_vblank_event(crtc, crtc->state->event);
>>> +        else
>>> +            drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>> +        crtc->state->event = NULL;
>>> +    }
>>> +    spin_unlock_irq(&crtc->dev->event_lock);
>>> +}
>>> +
>>> +static bool lsdc_crtc_get_scanout_position(struct drm_crtc *crtc,
>>> +                       bool in_vblank_irq,
>>> +                       int *vpos,
>>> +                       int *hpos,
>>> +                       ktime_t *stime,
>>> +                       ktime_t *etime,
>>> +                       const struct drm_display_mode *mode)
>>> +{
>>> +    struct drm_device *ddev = crtc->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    int line, vsw, vbp, vactive_start, vactive_end, vfp_end;
>>> +    u32 val = 0;
>>> +
>>> +    vsw = mode->crtc_vsync_end - mode->crtc_vsync_start;
>>> +    vbp = mode->crtc_vtotal - mode->crtc_vsync_end;
>>> +
>>> +    vactive_start = vsw + vbp + 1;
>>> +
>>> +    vactive_end = vactive_start + mode->crtc_vdisplay;
>>> +
>>> +    /* last scan line before VSYNC */
>>> +    vfp_end = mode->crtc_vtotal;
>>> +
>>> +    if (stime)
>>> +        *stime = ktime_get();
>>> +
>>> +    if (index == 0)
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG);
>>> +    else if (index == 1)
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_SCAN_POS_REG);
>>> +
>>> +    line = (val & 0xffff);
>>> +
>>> +    if (line < vactive_start)
>>> +        line -= vactive_start;
>>> +    else if (line > vactive_end)
>>> +        line = line - vfp_end - vactive_start;
>>> +    else
>>> +        line -= vactive_start;
>>> +
>>> +    *vpos = line;
>>> +    *hpos = val >> 16;
>>> +
>>> +    if (etime)
>>> +        *etime = ktime_get();
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
>>> +    .mode_valid = lsdc_crtc_mode_valid,
>>> +    .mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
>>> +    .atomic_enable = lsdc_crtc_helper_atomic_enable,
>>> +    .atomic_disable = lsdc_crtc_helper_atomic_disable,
>>> +    .atomic_check = lsdc_crtc_helper_atomic_check,
>>> +    .atomic_flush = lsdc_crtc_atomic_flush,
>>> +    .get_scanout_position = lsdc_crtc_get_scanout_position,
>>> +};
>>> +
>>> +int lsdc_crtc_init(struct drm_device *ddev,
>>> +           struct drm_crtc *crtc,
>>> +           unsigned int index,
>>> +           struct drm_plane *primary,
>>> +           struct drm_plane *cursor)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = drm_crtc_init_with_planes(ddev, crtc, primary, cursor,
>>> +                    &lsdc_crtc_funcs,
>>> +                    "CRTC-%d", index);
>>> +
>>> +    if (ret) {
>>> +        drm_err(ddev, "crtc init with planes failed: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
>>> +
>>> +    ret = drm_mode_crtc_set_gamma_size(crtc, 256);
>>> +    if (ret)
>>> +        drm_warn(ddev, "set the gamma table size failed\n");
>>> +
>>> +    drm_crtc_enable_color_mgmt(crtc, 0, false, 256);
>>
>> Maybe leave this out for now. You need to handle the property in your 
>> driver. I don't see code for that.
>>
>> Color management should probably go into a separate patch.
>>
> Ok, I'm agree to leave gamma support to a separate patch
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_debugfs.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_debugfs.c
>>> new file mode 100644
>>> index 000000000000..176ae4e11d1c
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_debugfs.c
>>> @@ -0,0 +1,191 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +
>>> +#include <drm/drm_debugfs.h>
>>> +#include <drm/drm_managed.h>
>>> +#include <drm/drm_gem_vram_helper.h>
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +#include "lsdc_pll.h"
>>> +
>>> +#ifdef CONFIG_DEBUG_FS
>>> +static int lsdc_show_clock(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct drm_crtc *crtc;
>>> +
>>> +    drm_for_each_crtc(crtc, ddev) {
>>> +        struct lsdc_display_pipe *pipe = crtc_to_display_pipe(crtc);
>>> +        struct lsdc_pll *pixpll = &pipe->pixpll;
>>> +        const struct lsdc_pixpll_funcs *funcs = pixpll->funcs;
>>> +        struct drm_display_mode *adj = &crtc->state->mode;
>>> +        struct lsdc_pll_parms parms;
>>> +        unsigned int out_khz;
>>> +
>>> +        out_khz = funcs->get_clock_rate(pixpll, &parms);
>>> +
>>> +        seq_printf(m, "Display pipe %u: %dx%d\n",
>>> +               pipe->index, adj->hdisplay, adj->vdisplay);
>>> +
>>> +        seq_printf(m, "Frequency actually output: %u kHz\n", out_khz);
>>> +        seq_printf(m, "Pixel clock required: %d kHz\n", adj->clock);
>>> +        seq_printf(m, "diff: %d kHz\n", adj->clock);
>>> +
>>> +        seq_printf(m, "div_ref=%u, loopc=%u, div_out=%u\n",
>>> +               parms.div_ref, parms.loopc, parms.div_out);
>>> +
>>> +        seq_printf(m, "hsync_start=%d, hsync_end=%d, htotal=%d\n",
>>> +               adj->hsync_start, adj->hsync_end, adj->htotal);
>>> +        seq_printf(m, "vsync_start=%d, vsync_end=%d, vtotal=%d\n\n",
>>> +               adj->vsync_start, adj->vsync_end, adj->vtotal);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_show_mm(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct drm_printer p = drm_seq_file_printer(m);
>>> +
>>> + drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +#define REGDEF(reg) { __stringify_1(LSDC_##reg##_REG), 
>>> LSDC_##reg##_REG }
>>> +static const struct {
>>> +    const char *name;
>>> +    u32 reg_offset;
>>> +} lsdc_regs_array[] = {
>>> +    REGDEF(CURSOR0_CFG),
>>> +    REGDEF(CURSOR0_ADDR_LO),
>>> +    REGDEF(CURSOR0_ADDR_HI),
>>> +    REGDEF(CURSOR0_POSITION),
>>> +    REGDEF(CURSOR0_BG_COLOR),
>>> +    REGDEF(CURSOR0_FG_COLOR),
>>> +    REGDEF(INT),
>>> +    REGDEF(CRTC0_CFG),
>>> +    REGDEF(CRTC0_STRIDE),
>>> +    REGDEF(CRTC0_FB_ORIGIN),
>>> +    REGDEF(CRTC0_HDISPLAY),
>>> +    REGDEF(CRTC0_HSYNC),
>>> +    REGDEF(CRTC0_VDISPLAY),
>>> +    REGDEF(CRTC0_VSYNC),
>>> +    REGDEF(CRTC0_GAMMA_INDEX),
>>> +    REGDEF(CRTC0_GAMMA_DATA),
>>> +    REGDEF(CRTC1_CFG),
>>> +    REGDEF(CRTC1_STRIDE),
>>> +    REGDEF(CRTC1_FB_ORIGIN),
>>> +    REGDEF(CRTC1_HDISPLAY),
>>> +    REGDEF(CRTC1_HSYNC),
>>> +    REGDEF(CRTC1_VDISPLAY),
>>> +    REGDEF(CRTC1_VSYNC),
>>> +    REGDEF(CRTC1_GAMMA_INDEX),
>>> +    REGDEF(CRTC1_GAMMA_DATA),
>>> +};
>>> +
>>> +static int lsdc_show_regs(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    int i;
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(lsdc_regs_array); i++) {
>>> +        u32 offset = lsdc_regs_array[i].reg_offset;
>>> +        const char *name = lsdc_regs_array[i].name;
>>> +
>>> +        seq_printf(m, "%s (0x%04x): 0x%08x\n",
>>> +               name, offset, lsdc_rreg32(ldev, offset));
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_show_vblank_counter(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +
>>> +    seq_printf(m, "CRTC-0 vblank counter: %08u\n",
>>> +           lsdc_rreg32(ldev, LSDC_CRTC0_VSYNC_COUNTER_REG));
>>> +
>>> +    seq_printf(m, "CRTC-1 vblank counter: %08u\n",
>>> +           lsdc_rreg32(ldev, LSDC_CRTC1_VSYNC_COUNTER_REG));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_show_scan_position(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    u32 val0 = lsdc_rreg32(ldev, LSDC_CRTC0_SCAN_POS_REG);
>>> +    u32 val1 = lsdc_rreg32(ldev, LSDC_CRTC1_SCAN_POS_REG);
>>> +
>>> +    seq_printf(m, "CRTC-0: x: %08u, y: %08u\n",
>>> +           val0 >> 16, val0 & 0xFFFF);
>>> +
>>> +    seq_printf(m, "CRTC-1: x: %08u, y: %08u\n",
>>> +           val1 >> 16, val1 & 0xFFFF);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_show_fb_addr(struct seq_file *m, void *arg)
>>> +{
>>> +    struct drm_info_node *node = (struct drm_info_node *)m->private;
>>> +    struct drm_device *ddev = node->minor->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    u32 lo, hi;
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +    if (val & CFG_FB_IN_USING) {
>>> +        lo = lsdc_rreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG);
>>> +        hi = lsdc_rreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG);
>>> +        seq_printf(m, "CRTC-0 using fb1: 0x%x:%x\n", hi, lo);
>>> +    } else {
>>> +        lo = lsdc_rreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG);
>>> +        hi = lsdc_rreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG);
>>> +        seq_printf(m, "CRTC-0 using fb0: 0x%x:%x\n", hi, lo);
>>> +    }
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +    if (val & CFG_FB_IN_USING) {
>>> +        lo = lsdc_rreg32(ldev, LSDC_CRTC1_FB1_LO_ADDR_REG);
>>> +        hi = lsdc_rreg32(ldev, LSDC_CRTC1_FB1_HI_ADDR_REG);
>>> +        seq_printf(m, "CRTC-1 using fb1: 0x%x:%x\n", hi, lo);
>>> +    } else {
>>> +        lo = lsdc_rreg32(ldev, LSDC_CRTC1_FB0_LO_ADDR_REG);
>>> +        hi = lsdc_rreg32(ldev, LSDC_CRTC1_FB0_HI_ADDR_REG);
>>> +        seq_printf(m, "CRTC-1 using fb0: 0x%x:%x\n", hi, lo);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static struct drm_info_list lsdc_debugfs_list[] = {
>>> +    { "clocks",   lsdc_show_clock, 0 },
>>> +    { "mm",       lsdc_show_mm, 0, NULL },
>>> +    { "regs",     lsdc_show_regs, 0 },
>>> +    { "vblanks",  lsdc_show_vblank_counter, 0, NULL },
>>> +    { "scan_pos", lsdc_show_scan_position, 0, NULL },
>>> +    { "fb_addr",  lsdc_show_fb_addr, 0, NULL },
>>> +};
>>> +
>>> +#endif
>>> +
>>> +void lsdc_debugfs_init(struct drm_minor *minor)
>>> +{
>>> +#ifdef CONFIG_DEBUG_FS
>>> +    drm_debugfs_create_files(lsdc_debugfs_list,
>>> +                 ARRAY_SIZE(lsdc_debugfs_list),
>>> +                 minor->debugfs_root,
>>> +                 minor);
>>> +#endif
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_drv.c
>>> new file mode 100644
>>> index 000000000000..3bd457e6e980
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
>>> @@ -0,0 +1,635 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * KMS driver for Loongson display controller
>>> + * Copyright (C) 2022 Loongson Corporation
>>> + *
>>> + * Authors:
>>> + *      Li Yi <liyi@loongson.cn>
>>> + *      Li Chenyang <lichenyang@loongson.cn>
>>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/pci.h>
>>> +#include <linux/of_address.h>
>>> +#include <drm/drm_aperture.h>
>>> +#include <drm/drm_vblank.h>
>>> +#include <drm/drm_fb_helper.h>
>>> +#include <drm/drm_gem_vram_helper.h>
>>> +#include <drm/drm_gem_framebuffer_helper.h>
>>> +#include <drm/drm_modeset_helper.h>
>>> +#include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_probe_helper.h>
>>> +#include <drm/drm_fbdev_generic.h>
>>> +#include "lsdc_drv.h"
>>
>> Alphebetical order.
> I will fix this problem at next version
>>
>>> +
>>> +static int lsdc_chip = -1;
>>> +MODULE_PARM_DESC(chip, "override chip id (-1 = probed by driver");
>>> +module_param_named(chip, lsdc_chip, int, 0644);
>>
>> That's a development option. Better not add it to the published driver.
>
> Without this,  compile with W=1 generate warnings.  and removing chip 
> descriptions for Loongson SoC
>
> is not wanted either.  this  option can be removed  if DT support is 
> upstream in the future.
>
> It allow us to developing driver before DT or ACPI support is ready. 
> Otherwise we have no way developing
>
> drivers for loongson SoC beforehand.
>
>>> +
>>> +/*
>>> + * ls7a1000 and ls7a2000 is not only used with loongson desktop 
>>> class CPU
>>> + * but also loongson server class CPUs (LS3C5000@2.2GHz 16 core). 
>>> Loongson
>>> + * server products generally don't has a dedicated vram mounted for 
>>> cost
>>> + * reason, it will use aspeed bmc as its display on its final and 
>>> formal
>>> + * product. lsdc.has_vram=0 is mainly be use in developing phase of 
>>> the
>>> + * product. When a board don't has a dedicated vram mounted, we can 
>>> put
>>> + * the framebuffer on system RAM.
>>> + */
>>> +static int lsdc_has_vram = -1;
>>> +MODULE_PARM_DESC(has_vram, "has on-board gpu memory in reality (0 = 
>>> no, -1 = default");
>>> +module_param_named(has_vram, lsdc_has_vram, int, 0644);
>>
>> Same here. That's for development.
>
> Err, we truly very need this feature,
>
> 1) ASPEED BMC card is removable, it can be unplug from the mother 
> board of Loongson Server.
>
> leaving this option there, we still have change enter X server graphic 
> environment.
>
>
> 2) We need developing drivers for loongson SoC on loongson PC 
> platform, we may deliberately don't
>
> use on-board vram. there a need to let TTM manage cached reserved RAM, 
> because such device don't
>
> have vram. We have achieve this goal on ls2k2000 SoC.
>
> Otherwise we have to write two piece of driver, one is DMA helper 
> base, the other is TTM based,
>
> we doing so at downstream kernel.
>
>>
>>> +
>>> +#define DRIVER_AUTHOR        "Sui Jingfeng <suijingfeng@loongson.cn>"
>>> +#define DRIVER_NAME        "lsdc"
>>> +#define DRIVER_DESC        "drm driver for loongson's display 
>>> controller"
>>> +#define DRIVER_DATE        "20220701"
>>> +#define DRIVER_MAJOR        1
>>> +#define DRIVER_MINOR        0
>>> +#define DRIVER_PATCHLEVEL    0
>>> +
>>> +static const struct lsdc_desc dc_in_ls2k0500 = {
>>
>> Those description structs are a two-edged sword IMHO.
>>
>>> +    .chip = CHIP_LS2K0500,
>>> +    .num_of_crtc = LSDC_NUM_CRTC,
>>> +    .max_pixel_clk = 200000,
>>> +    .max_width = 2048,
>>> +    .max_height = 2048,
>>> +    .hw_cursor_w = 32,
>>> +    .hw_cursor_h = 32,
>>> +    .pitch_align = 256,
>>> +    .mc_bits = 40,
>>
>> These are device constants are probably fine.
>>
>>> +    .num_of_hw_cursor = 1,
>>> +    .has_vblank_counter = false,
>>> +    .has_builtin_i2c = false,
>>> +    .has_vram = false,
>>> +    .has_hpd_reg = false,
>>> +    .is_soc = true,
>>
>> But from a quick look through the code, these settings affect control 
>> flow and/or modesetting pipelines. They are often better implemented 
>> by dedicated helpers as outlined in my comments about vblank and 
>> mgag200.
>
> Ok, mgag200 is for server mainly, its variant are not so different as 
> loongson does,
>
> at least they all have vram,  we have to put more attention to turn 
> drm memory manager.
>
> I will following your advice by introducing more helpers at next version.
>
>>
>>
>>> +};
>>> +
>>> +static const struct lsdc_desc dc_in_ls2k1000 = {
>>> +    .chip = CHIP_LS2K1000,
>>> +    .num_of_crtc = LSDC_NUM_CRTC,
>>> +    .max_pixel_clk = 200000,
>>> +    .max_width = 2048,
>>> +    .max_height = 2048,
>>> +    .num_of_hw_cursor = 1,
>>> +    .hw_cursor_w = 32,
>>> +    .hw_cursor_h = 32,
>>> +    .pitch_align = 256,
>>> +    .mc_bits = 40,
>>> +    .has_vblank_counter = false,
>>> +    .has_builtin_i2c = false,
>>> +    .has_vram = false,
>>> +    .has_hpd_reg = false,
>>> +    .is_soc = true,
>>> +};
>>> +
>>> +static const struct lsdc_desc dc_in_ls2k2000 = {
>>> +    .chip = CHIP_LS2K2000,
>>> +    .num_of_crtc = LSDC_NUM_CRTC,
>>> +    .max_pixel_clk = 350000,
>>> +    .max_width = 4096,
>>> +    .max_height = 4096,
>>> +    .num_of_hw_cursor = 2,
>>> +    .hw_cursor_w = 64,
>>> +    .hw_cursor_h = 64,
>>> +    .pitch_align = 256,
>>> +    .mc_bits = 40,
>>> +    .has_vblank_counter = true,
>>> +    .has_builtin_i2c = true,
>>> +    .has_vram = false,
>>> +    .has_hpd_reg = true,
>>> +    .is_soc = true,
>>> +};
>>> +
>>> +static const struct lsdc_desc dc_in_ls7a1000 = {
>>> +    .chip = CHIP_LS7A1000,
>>> +    .num_of_crtc = LSDC_NUM_CRTC,
>>> +    .max_pixel_clk = 200000,
>>> +    .max_width = 2048,
>>> +    .max_height = 2048,
>>> +    .num_of_hw_cursor = 1,
>>> +    .hw_cursor_w = 32,
>>> +    .hw_cursor_h = 32,
>>> +    .pitch_align = 256,
>>> +    .mc_bits = 40,
>>> +    .has_vblank_counter = false,
>>> +    .has_builtin_i2c = true,
>>> +    .has_vram = true,
>>> +    .has_hpd_reg = false,
>>> +    .is_soc = false,
>>> +};
>>> +
>>> +static const struct lsdc_desc dc_in_ls7a2000 = {
>>> +    .chip = CHIP_LS7A2000,
>>> +    .num_of_crtc = LSDC_NUM_CRTC,
>>> +    .max_pixel_clk = 350000,
>>> +    .max_width = 4096,
>>> +    .max_height = 4096,
>>> +    .num_of_hw_cursor = 2,
>>> +    .hw_cursor_w = 64,
>>> +    .hw_cursor_h = 64,
>>> +    .pitch_align = 256,
>>> +    .mc_bits = 40, /* support 48, but use 40 for backward 
>>> compatibility */
>>> +    .has_vblank_counter = true,
>>> +    .has_builtin_i2c = true,
>>> +    .has_vram = true,
>>> +    .has_hpd_reg = true,
>>> +    .is_soc = false,
>>> +};
>>> +
>>> +static int lsdc_gem_dumb_create(struct drm_file *file,
>>> +                struct drm_device *ddev,
>>> +                struct drm_mode_create_dumb *args)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    return drm_gem_vram_fill_create_dumb(file, ddev, 0, 
>>> descp->pitch_align, args);
>>> +}
>>> +
>>> +DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
>>> +
>>> +static const struct drm_driver lsdc_drm_driver = {
>>> +    .driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>>> +    .fops = &lsdc_gem_fops,
>>> +
>>> +    .name = DRIVER_NAME,
>>> +    .desc = DRIVER_DESC,
>>> +    .date = DRIVER_DATE,
>>> +    .major = DRIVER_MAJOR,
>>> +    .minor = DRIVER_MINOR,
>>> +    .patchlevel = DRIVER_PATCHLEVEL,
>>> +
>>> +    .debugfs_init = lsdc_debugfs_init,
>>> +    .dumb_create = lsdc_gem_dumb_create,
>>> +    .dumb_map_offset = drm_gem_ttm_dumb_map_offset,
>>> +    .gem_prime_mmap = drm_gem_prime_mmap,
>>> +};
>>> +
>>> +static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
>>> +    .fb_create = drm_gem_fb_create,
>>> +    .output_poll_changed = drm_fb_helper_output_poll_changed,
>>> +    .atomic_check = drm_atomic_helper_check,
>>> +    .atomic_commit = drm_atomic_helper_commit,
>>> +    .mode_valid = drm_vram_helper_mode_valid,
>>> +};
>>> +
>>> +static int lsdc_modeset_init(struct lsdc_device *ldev,
>>> +                 const struct lsdc_desc *descp)
>>> +{
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    unsigned int num_crtc = descp->num_of_crtc;
>>> +    unsigned int i;
>>> +    int ret;
>>> +
>>> +    for (i = 0; i < num_crtc; i++) {
>>> +        ret = lsdc_create_output(ldev, i);
>>> +        if (ret)
>>> +            return ret;
>>> +    }
>>> +
>>> +    for (i = 0; i < num_crtc; i++) {
>>> +        struct lsdc_display_pipe *dispipe = &ldev->dispipe[i];
>>> +        struct lsdc_pll *pixpll = &dispipe->pixpll;
>>> +        struct drm_plane *primary = &dispipe->primary;
>>> +        struct drm_plane *cursor = &dispipe->cursor;
>>> +        struct drm_crtc *crtc = &dispipe->crtc;
>>> +
>>> +        dispipe->index = i;
>>> +
>>> +        ret = lsdc_pixpll_init(pixpll, ddev, i);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        ret = lsdc_plane_init(ldev, primary, 
>>> DRM_PLANE_TYPE_PRIMARY, i);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        ret = lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        /*
>>> +         * Initial all of the CRTC available, in this way the logical
>>> +         * crtc index is equal to the hardware crtc index.
>>> +         *
>>> +         * display pipe 0 = crtc0 + dvo0 + encoder0 + connector0
>>> +         * display pipe 1 = crtc1 + dvo1 + encoder1 + connector1
>>> +         */
>>> +        ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        drm_info(ddev, "display pipe %u initialized\n", i);
>>> +    }
>>> +
>>> +    drm_mode_config_reset(ddev);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_mode_config_init(struct drm_device *ddev,
>>> +                 const struct lsdc_desc *descp)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = drmm_mode_config_init(ddev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ddev->mode_config.funcs = &lsdc_mode_config_funcs;
>>> +    ddev->mode_config.min_width = 1;
>>> +    ddev->mode_config.min_height = 1;
>>> +    ddev->mode_config.max_width = descp->max_width * LSDC_NUM_CRTC;
>>> +    ddev->mode_config.max_height = descp->max_height * LSDC_NUM_CRTC;
>>> +    ddev->mode_config.preferred_depth = 24;
>>> +    ddev->mode_config.prefer_shadow = descp->has_vram;
>>> +
>>> +    ddev->mode_config.cursor_width = descp->hw_cursor_h;
>>> +    ddev->mode_config.cursor_height = descp->hw_cursor_h;
>>> +
>>> +    /* max_vblank_count is set on each CRTC */
>>> +    ddev->max_vblank_count = 0xffffffff;
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * lsdc_detect_chip - a function to tell lsdc variant apart.
>>> + */
>>> +static const struct lsdc_desc *
>>> +lsdc_detect_chip(struct pci_dev *pdev, const struct pci_device_id 
>>> *ent)
>>> +{
>>> +    /*
>>> +     * Provide a way to false the driver running on new model
>>> +     * before we have a proper way to tell them apart
>>> +     */
>>> +    if (lsdc_chip == CHIP_LS2K2000) {
>>> +        dev_info(&pdev->dev, "Override as LS2K2000\n");
>>> +        return &dc_in_ls2k2000;
>>> +    }
>>> +
>>> +    if (lsdc_chip == CHIP_LS2K1000) {
>>> +        dev_info(&pdev->dev, "Override as LS2K1000\n");
>>> +        return &dc_in_ls2k1000;
>>> +    }
>>> +
>>> +    if (lsdc_chip == CHIP_LS2K0500) {
>>> +        dev_info(&pdev->dev, "Override as LS2K0500\n");
>>> +        return &dc_in_ls2k0500;
>>> +    }
>>> +
>>> +    if (ent) {
>>> +        struct lsdc_desc *dc_descp;
>>> +
>>> +        dc_descp = (struct lsdc_desc *)ent->driver_data;
>>
>> Is that legal? driver_data is of kernel_ulong_t. Maybe store the 
>> CHIP_ constant here and then lookup the lsdc_desc.
>>
> It works in practice but it seems dangerous doing so,  I will using 
> CHIP_ LS7AXXXX and CHIP_LS2KXXXX at new version.
>
> i don't notice it before, thank you.
>
>>
>> https://elixir.bootlin.com/linux/latest/source/include/linux/mod_devicetable.h#L36 
>>
>>
>>> +        if (dc_descp->chip == CHIP_LS7A1000)
>>> +            dev_info(&pdev->dev, "LS7A1000 Found revision: %u\n", 
>>> pdev->revision);
>>> +        else if (dc_descp->chip == CHIP_LS7A2000)
>>> +            dev_info(&pdev->dev, "LS7A2000 Found revison: %u\n", 
>>> pdev->revision);
>>> +
>>> +        return dc_descp;
>>> +    }
>>> +
>>> +    dev_err(&pdev->dev, "Not known device\n");
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +static int lsdc_get_dedicated_vram(struct lsdc_device *ldev,
>>> +                   const struct lsdc_desc *descp)
>>> +{
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    struct pci_dev *gpu;
>>> +    resource_size_t base, size;
>>> +
>>> +    /*
>>> +     * The GPU and display controller in LS7A1000/LS7A2000 are 
>>> separated
>>> +     * PCIE devices, they are two devices not one. The DC is a pci 
>>> device,
>>> +     * but it don't have a dedicate VRAM bar, the BIOS engineer 
>>> choose to
>>> +     * assign the VRAM to the gpu device. Sadly, after years 
>>> application,
>>> +     * this decision form as a convention for loongson integrate 
>>> graphics.
>>> +     * For LS7A1000 and LS7A2000, bar 2 of GPU device contain the 
>>> VRAM,
>>> +     * both the GPU and the DC can make use of the VRAM depend on 
>>> how DRM
>>> +     * device driver is written. Therefore, we have to do some 
>>> tricks here.
>>> +     */
>>> +    if (descp->chip == CHIP_LS7A1000)
>>> +        gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A15, NULL);
>>> +    else if (descp->chip == CHIP_LS7A2000)
>>> +        gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7A25, NULL);
>>> +
>>> +    if (!gpu) {
>>> +        drm_warn(ddev, "No GPU device found\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    base = pci_resource_start(gpu, 2);
>>> +    size = pci_resource_len(gpu, 2);
>>> +
>>> +    ldev->vram_base = base;
>>> +    ldev->vram_size = size;
>>> +
>>> +    drm_info(ddev, "dedicated vram start: 0x%llx, size: %uMB\n",
>>> +         (u64)base, (u32)(size >> 20));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Loongson display controller is not equipped with IOMMU.
>>> + * In order to make this driver work with Loongson SoC,
>>> + * you need to either carveout part RAM as VRAM or reserve
>>> + * part system ram as vram. Pass the start address and size
>>> + * via DT or ACPI.
>>> + */
>>> +static int lsdc_of_get_reserved_ram(struct lsdc_device *ldev)
>>> +{
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    unsigned long size = 0;
>>> +    struct device_node *node;
>>> +    struct resource r;
>>> +    int ret;
>>> +
>>> +    node = of_parse_phandle(ddev->dev->of_node, "memory-region", 0);
>>> +    if (!node) {
>>> +        drm_err(ddev, "No memory-region property or no DT, abort\n");
>>> +        return -ENOENT;
>>> +    }
>>> +
>>> +    ret = of_address_to_resource(node, 0, &r);
>>> +    of_node_put(node);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    size = r.end - r.start + 1;
>>> +
>>> +    ldev->vram_base = r.start;
>>> +    ldev->vram_size = size;
>>> +
>>> +    drm_info(ddev, "using VRAM carveout: %lx@%pa\n", size, &r.start);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int
>>> +lsdc_remove_conflicting_framebuffers(const struct drm_driver *pdriver,
>>> +                     resource_size_t base,
>>> +                     resource_size_t size)
>>> +{
>>> +    return drm_aperture_remove_conflicting_framebuffers(base,
>>> +                                size,
>>> +                                false,
>>> +                                pdriver);
>>> +}
>>
>> No need to wrap this single function.
>
> Ok, Loongson upstream kernel support efifb and it backing memory is 
> located at this range.
>
> we must properly remove it, otherwise they will have two fb 
> node(/dev/fb0 and /dev/fb1)
>
>>
>>> +
>>> +static struct lsdc_device *
>>> +lsdc_create_device(struct pci_dev *pdev,
>>> +           const struct pci_device_id *ent,
>>> +           const struct drm_driver *drv)
>>> +{
>>> +    struct lsdc_device *ldev;
>>> +    struct drm_device *ddev;
>>> +    const struct lsdc_desc *descp;
>>> +    int ret;
>>> +
>>> +    ldev = devm_drm_dev_alloc(&pdev->dev, drv, struct lsdc_device, 
>>> base);
>>> +    if (IS_ERR(ldev))
>>> +        return ldev;
>>> +
>>> +    ddev = &ldev->base;
>>> +
>>> +    pci_set_drvdata(pdev, ddev);
>>> +
>>> +    descp = lsdc_detect_chip(pdev, ent);
>>> +    if (!descp)
>>> +        return NULL;
>>> +
>>> +    ldev->descp = descp;
>>> +
>>> +    spin_lock_init(&ldev->reglock);
>>> +
>>> +    /* BAR 0 the DC device contains registers */
>>> +    ldev->reg_base = pcim_iomap(pdev, 0, 0);
>>> +    if (!ldev->reg_base)
>>> +        return ERR_PTR(-EIO);
>>> +
>>> +    if (descp->has_vram && lsdc_has_vram)
>>> +        ret = lsdc_get_dedicated_vram(ldev, descp);
>>> +    else
>>> +        ret = lsdc_of_get_reserved_ram(ldev);
>>> +
>>> +    if (ret) {
>>> +        drm_err(ddev, "Init VRAM failed: %d\n", ret);
>>> +        return ERR_PTR(ret);
>>> +    }
>>> +
>>> +    ret = lsdc_remove_conflicting_framebuffers(drv,
>>> +                           ldev->vram_base,
>>> +                           ldev->vram_size);
>>> +    if (ret) {
>>> +        drm_err(ddev, "remove firmware framebuffers failed: %d\n", 
>>> ret);
>>> +        return ERR_PTR(ret);
>>> +    }
>>> +
>>> +    ret = drmm_vram_helper_init(ddev, ldev->vram_base, 
>>> ldev->vram_size);
>>
>> Using GEM VRAM helpers could become a problem and I'd advise against 
>> them.
>>
> Err, I'm not want to agree this...
>> First of all, how much video memory is there? VRAM helpers need at 
>> least 3 times the maximum consumption to be reliable.So if you have a 
>> FullHD display that consumes ~8 Mib, you'd need 24 MiB of VRAM. 
>> Hardware cursors can further interfere.
>
> Part of ls3a5000/ls3a4000+ls7a1000 machine have 64MB, another part of 
> ls3a5000/ls3a4000+ls7a1000 have 128 MB.
>
> For ls7a1000(1080p) the maximum  usage actually is two 
> framebuffer(1920x1080x4x2)  + two cursor (64x64x4x 2) + one fbcon 
> (1920x1080x4) and LS7A2000 board has at lease 256MB VRAM.
>
> Therefore I can guarantee that we have at least 64MB VRAM,enough for 
> double screen(1920x1080) + double cursor.
>
> I guess you means that there are some device(aspeed bmc) with limited 
> VRAM size, but it is more a problem
>
> of the device itself(It is not vram helper's fault).  Early version of 
> ast driver would evict fbcon to system RAM
>
> to save VRAM usage, would this idea be a solution for the device with 
> limited vram capacity today?
>
>
>> VRAM helpers also don't support buffer sharing with other devices. 
>> That's a problem for some compositors.
>>
>> For those reasons, VRAM helpers are deprecated. I'd rather remove 
>> them entirely. 
>
> Its not that bad, VRAM helpers is good enough for our case as a first 
> step.  Our colleague and customers mainly
>
> using MATE and XFCE  under X server graphic environment,  they need 
> basic 2D graphics environment most.
>
> We have tested our driver against macro and xfwm4, it actually works 
> very well. Individual compositor may
>
> have a few problems, but it isn't a thing for our case currently. Can 
> we solve those problem by other means?
>
> We could give up cross device buffer sharing support for chasing 2D 
> graphic performance , we intend to
>
> introducing buffer sharing with the help of the GPU with another patch 
> in the future. We possibly could
>
> switch to ttm-based KMS driver under your guiding then. For ls7a1000,  
> I imagine to merge lsdc with evnaviv
>
> into a single drm driver.May I suggest to postpone the decision of 
> removing VRAM helpers, its performance
>
> is better than shmem helper and have better support for double screen.
>
>
>> As a better alternative for the DC, you could use GEM SHMEM helpers. 
>> See mgag200 or ast for how to do that.
>
> We have two display pipe thus support double screen, therefore we have 
> two framebuffer BO and  two cursor BO,
>
> we  need to take clone screen, extend screen and rotate and resize 
> case into consideration, on clone screen case
>
> the two CRTC should scanout from the same address, while on extend 
> screen case, the frame buffer itself is grant
>
> one buffer if using modesetting driver, but we have two primary plane 
> thus two fb offset. Arrange VRAM bo offset
>
> for 4 different drm BO object manually is little bit hack and 
> cumbersome.  I have already finish the developing
>
> work of shmem helper support, see: 
> https://github.com/loongson-gfx/drm-tip/compare/drm-tip...shmem
>
> But it is NOT as good as VRAM helper in the perspective of 
> performance.  I think copy from the shadow to the
>
> front frame buffer should be done at user space, this can save the 
> overhead of reporting damage rectangle whenever
>
> have a damage.
>
>
>>
>> The comments mention that there's also a GPU. Does the GPU use VRAM? 
>> Or do GPU and DC share memory ranges?
>>
> LS7A2000 integrate Loongson self-made GPU, driver is developed by my 
> colleagues, it already works but my mature
>
> to upstream yet.  LS7A1000 have a VIVANTE GC1000 v5037 (20120617 etc), 
> a ten years ago render-only GPU.
>
> the VRAM is connected with the ls7a1000 bridge chip, the memory 
> controller is also in ls7a1000 bridge chip itself.
>
> ATI call this type vram as sideport,  my company call it as GMEM, I 
> think they are similar.
>
> etnaviv don't use VRAM currently, all BOs of etnaviv is in system ram.
>
> I think  merge etnaviv and lsdc into a single drm driver would be a 
> solution, what do you think?
>
>
> On downstream environment, we hacking make ttm-based lsdc work with 
> etnaviv, by copying(sw resolve)
>
> the rendered buffer to vram backed framebuffer, glmark2 get 220 point, 
> quake3 arena can play,  haha :)
>
> It is achieved by developing xf86-video-loongson which using etnaviv 
> to share buffer between xserver and glmark2,
>
> lsdc(or downstream loongson-drm) is only need to implement a 
> self-sharing for userspace process .
>
> see https://github.com/loongson-gfx/xf86-video-loongson. The shared 
> rendering buffer is copy
>
> to front buffer with loongson LSX and LASX(256-bit) SIMD 
> optimization.  Report dirty to kernel space is not need.
>
> we can even let suppertiled buffer rendered by etnaviv get exported, 
> xf86-video-loongson get the fd and prime
>
> it to handle, then we are using CPU to do the resolve work which 
> directly resolve to the front framebuffer.  No damage
>
> rectangle reporting is need.
>
>
> Hence, the 2D performance of graphics is the more important.  GEM 
> SHMEM helpers is not better than vram helpers
>
> in the perspective of performance.
>
>>> +    if (ret) {
>>> +        drm_err(ddev, "vram helper init failed: %d\n", ret);
>>> +        goto err;
>>> +    }
>>> +
>>> +    ret = lsdc_mode_config_init(ddev, descp);
>>> +    if (ret) {
>>> +        drm_dbg(ddev, "%s: %d\n", __func__, ret);
>>> +        goto err;
>>> +    }
>>> +
>>> +    ret = lsdc_modeset_init(ldev, descp);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    ret = drm_vblank_init(ddev, descp->num_of_crtc);
>>> +    if (ret)
>>> +        goto err;
>>> +
>>> +    ret = request_threaded_irq(pdev->irq,
>>> +                   lsdc_get_irq_handler(ldev),
>>> +                   lsdc_irq_thread_handler,
>>> +                   IRQF_ONESHOT,
>>> +                   dev_name(ddev->dev),
>>> +                   ddev);
>>> +    if (ret) {
>>> +        drm_err(ddev, "Failed to register lsdc interrupt\n");
>>> +        goto err;
>>> +    }
>>> +
>>> +    drm_kms_helper_poll_init(ddev);
>>> +
>>> +    return ldev;
>>> +
>>> +err:
>>> +    return ERR_PTR(ret);
>>> +}
>>> +
>>> +static int lsdc_pci_probe(struct pci_dev *pdev,
>>> +              const struct pci_device_id *ent)
>>> +{
>>> +    struct drm_device *ddev;
>>> +    struct lsdc_device *ldev;
>>> +    int ret;
>>> +
>>> +    ret = pcim_enable_device(pdev);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    pci_set_master(pdev);
>>> +
>>> +    ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    ldev = lsdc_create_device(pdev, ent, &lsdc_drm_driver);
>>> +    if (IS_ERR(ldev))
>>> +        return PTR_ERR(ldev);
>>> +
>>> +    ddev = &ldev->base;
>>> +
>>> +    ret = drm_dev_register(ddev, 0);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    drm_fbdev_generic_setup(ddev, 32);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void lsdc_pci_remove(struct pci_dev *pdev)
>>> +{
>>> +    struct drm_device *ddev = pci_get_drvdata(pdev);
>>> +
>>> +    drm_dev_unregister(ddev);
>>> +    drm_atomic_helper_shutdown(ddev);
>>> +}
>>> +
>>> +static int lsdc_drm_freeze(struct drm_device *ddev)
>>> +{
>>> +    int error;
>>> +
>>> +    error = drm_mode_config_helper_suspend(ddev);
>>> +    if (error)
>>> +        return error;
>>> +
>>> +    pci_save_state(to_pci_dev(ddev->dev));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_drm_resume(struct device *dev)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +    struct drm_device *ddev = pci_get_drvdata(pdev);
>>> +
>>> +    return drm_mode_config_helper_resume(ddev);
>>> +}
>>> +
>>> +static int lsdc_pm_freeze(struct device *dev)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +    struct drm_device *ddev = pci_get_drvdata(pdev);
>>> +
>>> +    return lsdc_drm_freeze(ddev);
>>> +}
>>> +
>>> +static int lsdc_pm_thaw(struct device *dev)
>>> +{
>>> +    return lsdc_drm_resume(dev);
>>> +}
>>> +
>>> +static int lsdc_pm_suspend(struct device *dev)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +    int error;
>>> +
>>> +    error = lsdc_pm_freeze(dev);
>>> +    if (error)
>>> +        return error;
>>> +
>>> +    pci_save_state(pdev);
>>> +    /* Shut down the device */
>>> +    pci_disable_device(pdev);
>>> +    pci_set_power_state(pdev, PCI_D3hot);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int lsdc_pm_resume(struct device *dev)
>>> +{
>>> +    struct pci_dev *pdev = to_pci_dev(dev);
>>> +
>>> +    if (pcim_enable_device(pdev))
>>> +        return -EIO;
>>> +
>>> +    pci_set_power_state(pdev, PCI_D0);
>>> +
>>> +    pci_restore_state(pdev);
>>> +
>>> +    return lsdc_pm_thaw(dev);
>>> +}
>>> +
>>> +static const struct dev_pm_ops lsdc_pm_ops = {
>>> +    .suspend = lsdc_pm_suspend,
>>> +    .resume = lsdc_pm_resume,
>>> +    .freeze = lsdc_pm_freeze,
>>> +    .thaw = lsdc_pm_thaw,
>>> +    .poweroff = lsdc_pm_freeze,
>>> +    .restore = lsdc_pm_resume,
>>> +};
>>> +
>>> +static const struct pci_device_id lsdc_pciid_list[] = {
>>> +    {PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
>>> +     (kernel_ulong_t)&dc_in_ls7a1000},
>>> +    {PCI_VENDOR_ID_LOONGSON, 0x7a36, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
>>> +     (kernel_ulong_t)&dc_in_ls7a2000},
>>> +    {0, 0, 0, 0, 0, 0, 0}
>>> +};
>>> +
>>> +static struct pci_driver lsdc_pci_driver = {
>>> +    .name = DRIVER_NAME,
>>> +    .id_table = lsdc_pciid_list,
>>> +    .probe = lsdc_pci_probe,
>>> +    .remove = lsdc_pci_remove,
>>> +    .driver.pm = &lsdc_pm_ops,
>>> +};
>>> +
>>> +static int __init lsdc_module_init(void)
>>> +{
>>> +    struct pci_dev *pdev = NULL;
>>> +
>>> +    if (drm_firmware_drivers_only())
>>> +        return -EINVAL;
>>
>>   return -ENODEV;
>
> OK, no problem, I will fix it at new version. I remember i already fix 
> this, sorry.
>
>>
>>> +
>>> +    while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
>>> +        /*
>>> +         * Multiple video card workaround: lsdc will always be
>>> +         * selected as the default boot device by vgaarb subsystem.
>>> +         */
>>> +        if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
>>> +            pr_info("Discrete graphic card detected, abort\n");
>>> +            return 0;
>>> +        }
>>> +    }
>>
>> I don't understand this code. You are not registering your driver if 
>> there's another graphics card?
>>
> Yes, we do not want to registering this driver if there's discrete 
> graphics card or BMC in the system.
>
>
> for example:
>
> 1)  Loongson desktop computer(ls3a5000 + ls7a2000 with amdgpu rx580 
> mounted)
>
> On such a configuration, loongson display controller and rx580 
> co-exist in the system.
>
> As discrete GPU is more powerful, it seems that there no need to using 
> LSDC driver anymore.
>
> The user is most likely want to using the  rx580 as primary GPU and 
> Using rx580 alone is enough for user in such a  case.
>
> It is introduce unnecessary problems and confusion If we leave lsdc 
> driver live on the system together with amdgpu/ati drm driver.
>
>
> I have just tested  the case which leave lsdc driver live on the 
> system together with radeon drm driver.
>
> the monitor connected with lsdc is black, not working as a output slave.
>
>
> 2)  Loongson ls3c5000 server with aspeed 2400/25000 BMC card mounted.
>
> The BMC provide remote access and control besides the graphics, use it 
> alone is enough, we have solve
>
> 4 ~ 5 bugs on our product side.  we don't want make a mess.
>
> our tester get confused, than find a amdgpu and plug in, then he get 
> three video co-exist in the sistem.
>
> lsdc, ast and amdgpu, there /dev/dri/card0, /dev/dri/car1 and 
> /dev/dri/card2.
>
> if i bring etnaviv up, then i can get four.
>
>
>> Best regards
>> Thomas
>>
> Thinks your valuable advice and guiding, we will take time to fix all 
> the problems your mentioned,
>
> and prepare next version.

The driver still have a few problem, i will fix it if i can found, but 
it already can suit the need for

daily  usage for programmer. hope i can help to merge this driver,  i 
holding it on my hand

more than one years . If i miss anything, please remind me, any 
discussion is welcome.

>
>>> +
>>> +    return pci_register_driver(&lsdc_pci_driver);
>>> +}
>>> +module_init(lsdc_module_init);
>>> +
>>> +static void __exit lsdc_module_exit(void)
>>> +{
>>> +    pci_unregister_driver(&lsdc_pci_driver);
>>> +}
>>> +module_exit(lsdc_module_exit);
>>> +
>>> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
>>> +MODULE_AUTHOR(DRIVER_AUTHOR);
>>> +MODULE_DESCRIPTION(DRIVER_DESC);
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h 
>>> b/drivers/gpu/drm/lsdc/lsdc_drv.h
>>> new file mode 100644
>>> index 000000000000..d67dae0414ca
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
>>> @@ -0,0 +1,274 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * KMS driver for Loongson display controller
>>> + * Copyright (C) 2022 Loongson Corporation
>>> + *
>>> + * Authors:
>>> + *      Li Yi <liyi@loongson.cn>
>>> + *      Li Chenyang <lichenyang@loongson.cn>
>>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>>> + */
>>> +
>>> +#ifndef __LSDC_DRV_H__
>>> +#define __LSDC_DRV_H__
>>> +
>>> +#include <linux/i2c.h>
>>> +#include <linux/i2c-algo-bit.h>
>>> +
>>> +#include <drm/drm_print.h>
>>> +#include <drm/drm_device.h>
>>> +#include <drm/drm_crtc.h>
>>> +#include <drm/drm_plane.h>
>>> +#include <drm/drm_connector.h>
>>> +#include <drm/drm_encoder.h>
>>> +#include <drm/drm_drv.h>
>>> +#include <drm/drm_atomic.h>
>>> +
>>> +#include "lsdc_regs.h"
>>> +#include "lsdc_pll.h"
>>> +
>>> +#define LSDC_NUM_CRTC           2
>>> +
>>> +/*
>>> + * The display controller in LS7A2000 integrate three loongson 
>>> self-made
>>> + * encoder. Display pipe 0 has a transparent VGA encoder and a HDMI 
>>> phy,
>>> + * they are parallel. Display pipe 1 has only one HDMI phy.
>>> + *       ______________________ _____________
>>> + *      |             +-----+  | |             |
>>> + *      | CRTC0 -+--> | VGA |  ----> VGA Connector ---> | VGA 
>>> Monitor |<---+
>>> + *      |        |    +-----+  | |_____________|    |
>>> + *      |        |             | ______________    |
>>> + *      |        |    +------+ | |              |   |
>>> + *      |        +--> | HDMI | ----> HDMI Connector --> | HDMI 
>>> Monitor |<--+
>>> + *      |             +------+ | |______________|   |
>>> + *      |            +------+ 
>>> |                                           |
>>> + *      |            | i2c6 | 
>>> <-------------------------------------------+
>>> + *      |            +------+  |
>>> + *      |                      |
>>> + *      |    DC in LS7A2000    |
>>> + *      |                      |
>>> + *      |            +------+  |
>>> + *      |            | i2c7 | <--------------------------------+
>>> + *      |            +------+  | |
>>> + *      |                      | ______|_______
>>> + *      |            +------+  | |              |
>>> + *      | CRTC1 ---> | HDMI |  ----> HDMI Connector ---> | HDMI 
>>> Monitor |
>>> + *      |            +------+  | |______________|
>>> + *      |______________________|
>>> + *
>>> + *
>>> + * The display controller in LS7A1000 integrate two-way DVO, external
>>> + * encoder is required except use directly with dpi(rgb888) panel.
>>> + * ___________________ _________
>>> + *      |            -------| |         |
>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | 
>>> Display |
>>> + *      |  _   _     -------|        ^             ^ |_________|
>>> + *      | | | | |    -------|        |             |
>>> + *      | |_| |_|    | i2c6 <--------+-------------+
>>> + *      |            -------|
>>> + *      |  _   _     -------|
>>> + *      | | | | |    | i2c7 <--------+-------------+
>>> + *      | |_| |_|    -------|        | | _________
>>> + *      |            -------|        |             | |         |
>>> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  
>>> Panel  |
>>> + *      |            -------| |_________|
>>> + *      |___________________|
>>> + *
>>> + *
>>> + * The display controller in LS2K1000.
>>> + * ___________________ _________
>>> + *      |            -------| |         |
>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | 
>>> Display |
>>> + *      |  _   _     -------|        ^              ^ |_________|
>>> + *      | | | | |           |        |              |
>>> + *      | |_| |_|           |     +------+          |
>>> + *      |                   <---->| i2c0 |<---------+
>>> + *      |  DC in LS2K1000   |     +------+
>>> + *      |  _   _            |     +------+
>>> + *      | | | | |           <---->| i2c1 |----------+
>>> + *      | |_| |_|           |     +------+ | _________
>>> + *      |            -------|        |              | |         |
>>> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  
>>> Panel  |
>>> + *      |            -------| |_________|
>>> + *      |___________________|
>>> + *
>>> + *
>>> + * The display controller in LS2K0500, LS2K0500 has a built-in 
>>> transparent
>>> + * VGA encoder which is connected to display pipe 1(CRTC1).
>>> + * ___________________ _________
>>> + *      |            -------| |         |
>>> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | 
>>> Display |
>>> + *      |  _   _     -------|        ^              ^ |_________|
>>> + *      | | | | |           |        |              |
>>> + *      | |_| |_|           |     +------+          |
>>> + *      |                   <---->| i2c4 |<---------+
>>> + *      |  DC in LS2K0500   |     +------+
>>> + *      |  _   _            |     +------+
>>> + *      | | | | |           <---->| i2c5 |-------------------+
>>> + *      | |_| |_|           |     +------+ ______|______
>>> + *      |           +-----+ | |             |
>>> + *      | CRTC1 --> | VGA | ------------------------> | VGA Monitor |
>>> + *      |           +-----+ | |_____________|
>>> + *      |___________________|
>>> + *
>>> + * LS7A1000 and LS7A2000 are bridge chips, has dedicated Video RAM.
>>> + * while LS2K2000/LS2K1000/LS2K0500 are SoC, they don't have 
>>> dediacated
>>> + * Video RAM. The dc in LS2K2000 is basicly same with the dc in 
>>> LS7A1000
>>> + * except that LS2K2000 don't have a video RAM and have only one 
>>> built-in
>>> + * hdmi encoder.
>>> + *
>>> + * There is only a 1:1 mapping of encoders and connectors for the DC,
>>> + * each CRTC have two FB address registers.
>>> + */
>>> +
>>> +enum loongson_chip_family {
>>> +    CHIP_UNKNOWN = 0,
>>> +    CHIP_LS7A1000 = 1,  /* North bridge of 
>>> LS3A3000/LS3A4000/LS3A5000 */
>>> +    CHIP_LS7A2000 = 2,  /* Update version of LS7A1000, with 
>>> built-in HDMI encoder */
>>> +    CHIP_LS2K0500 = 3,  /* Reduced version of LS2K1000, single core */
>>> +    CHIP_LS2K1000 = 4,  /* 2-Core Mips64r2/LA264 SoC, 64-bit, 1.0 
>>> Ghz */
>>> +    CHIP_LS2K2000 = 5,  /* 2-Core 64-bit LA364 SoC, 1.2 ~ 1.5 Ghz */
>>> +    CHIP_LAST,
>>> +};
>>> +
>>> +struct lsdc_desc {
>>> +    enum loongson_chip_family chip;
>>> +    u32 num_of_crtc;
>>> +    u32 max_pixel_clk;
>>> +    u32 max_width;
>>> +    u32 max_height;
>>> +    u32 num_of_hw_cursor;
>>> +    u32 hw_cursor_w;
>>> +    u32 hw_cursor_h;
>>> +    u32 pitch_align;  /* DMA alignment constraint */
>>> +    u64 mc_bits;      /* physical address bus bit width */
>>> +    bool has_vblank_counter;
>>> +    bool has_builtin_i2c;
>>> +    bool has_vram;
>>> +    bool has_hpd_reg;
>>> +    bool is_soc;
>>> +};
>>> +
>>> +struct lsdc_i2c {
>>> +    struct i2c_adapter adapter;
>>> +    struct i2c_algo_bit_data bit;
>>> +    struct drm_device *ddev;
>>> +    void __iomem *reg_base;
>>> +    void __iomem *dir_reg;
>>> +    void __iomem *dat_reg;
>>> +    /* pin bit mask */
>>> +    u8 sda;
>>> +    u8 scl;
>>> +};
>>> +
>>> +/*
>>> + * struct lsdc_display_pipe - Abstraction of hardware display 
>>> pipeline.
>>> + * @crtc: CRTC control structure
>>> + * @primary: framebuffer plane control structure
>>> + * @cursor: cursor plane control structure
>>> + * @output: output control structure of this display pipe bind
>>> + * @pixpll: pixel pll control structure
>>> + * @index: the index corresponding to the hardware display pipe
>>> + */
>>> +struct lsdc_display_pipe {
>>> +    struct drm_crtc crtc;
>>> +    struct drm_plane primary;
>>> +    struct drm_plane cursor;
>>> +    struct drm_encoder encoder;
>>> +    struct drm_connector connector;
>>> +    struct lsdc_pll pixpll;
>>> +    struct lsdc_i2c *li2c;
>>> +    int index;
>>> +};
>>> +
>>> +static inline struct lsdc_display_pipe *
>>> +crtc_to_display_pipe(struct drm_crtc *crtc)
>>> +{
>>> +    return container_of(crtc, struct lsdc_display_pipe, crtc);
>>> +}
>>> +
>>> +static inline struct lsdc_display_pipe *
>>> +cursor_to_display_pipe(struct drm_plane *cursor)
>>> +{
>>> +    return container_of(cursor, struct lsdc_display_pipe, cursor);
>>> +}
>>> +
>>> +static inline struct lsdc_display_pipe *
>>> +connector_to_display_pipe(struct drm_connector *conn)
>>> +{
>>> +    return container_of(conn, struct lsdc_display_pipe, connector);
>>> +}
>>> +
>>> +static inline struct lsdc_display_pipe *
>>> +encoder_to_display_pipe(struct drm_encoder *enc)
>>> +{
>>> +    return container_of(enc, struct lsdc_display_pipe, encoder);
>>> +}
>>> +
>>> +struct lsdc_crtc_state {
>>> +    struct drm_crtc_state base;
>>> +    struct lsdc_pll_parms pparms;
>>> +};
>>> +
>>> +struct lsdc_device {
>>> +    struct drm_device base;
>>> +
>>> +    /* @reglock: protects concurrent register access */
>>> +    spinlock_t reglock;
>>> +    void __iomem *reg_base;
>>> +    void __iomem *vram;
>>> +    resource_size_t vram_base;
>>> +    resource_size_t vram_size;
>>> +    u64 mc_mask;
>>> +
>>> +    struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
>>> +
>>> +    /* @num_output: count the number of active display pipe */
>>> +    unsigned int num_output;
>>> +
>>> +    /* @descp: features description of the DC variant */
>>> +    const struct lsdc_desc *descp;
>>> +
>>> +    u32 irq_status;
>>> +};
>>> +
>>> +static inline struct lsdc_device *
>>> +to_lsdc(struct drm_device *ddev)
>>> +{
>>> +    return container_of(ddev, struct lsdc_device, base);
>>> +}
>>> +
>>> +static inline struct lsdc_crtc_state *
>>> +to_lsdc_crtc_state(struct drm_crtc_state *base)
>>> +{
>>> +    return container_of(base, struct lsdc_crtc_state, base);
>>> +}
>>> +
>>> +void lsdc_debugfs_init(struct drm_minor *minor);
>>> +
>>> +int lsdc_crtc_init(struct drm_device *ddev,
>>> +           struct drm_crtc *crtc,
>>> +           unsigned int index,
>>> +           struct drm_plane *primary,
>>> +           struct drm_plane *cursor);
>>> +
>>> +int lsdc_plane_init(struct lsdc_device *ldev,
>>> +            struct drm_plane *plane,
>>> +            enum drm_plane_type type,
>>> +            unsigned int index);
>>> +
>>> +int lsdc_create_output(struct lsdc_device *ldev, unsigned int index);
>>> +
>>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
>>> +                      void *base,
>>> +                      unsigned int index);
>>> +
>>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev, 
>>> int index);
>>> +
>>> +irqreturn_t lsdc_irq_thread_handler(int irq, void *arg);
>>> +irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev);
>>> +
>>> +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32 offset);
>>> +void lsdc_wreg32(struct lsdc_device * const ldev, u32 offset, u32 
>>> val);
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>>> new file mode 100644
>>> index 000000000000..b380098409ca
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
>>> @@ -0,0 +1,201 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <linux/i2c.h>
>>> +#include <drm/drm_managed.h>
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +
>>> +/*
>>> + * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by mask
>>> + * @mask: gpio pin mask
>>> + * @state: "0" for low, "1" for high
>>> + */
>>> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int 
>>> mask, int state)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(li2c->ddev);
>>> +    unsigned long flags;
>>> +    u8 val;
>>> +
>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>> +
>>> +    if (state) {
>>> +        /*
>>> +         * Setting this pin as input directly, write 1 for Input.
>>> +         * The external pull-up resistor will pull the level up
>>> +         */
>>> +        val = readb(li2c->dir_reg);
>>> +        val |= mask;
>>> +        writeb(val, li2c->dir_reg);
>>> +    } else {
>>> +        /* First set this pin as output, write 0 for Output */
>>> +        val = readb(li2c->dir_reg);
>>> +        val &= ~mask;
>>> +        writeb(val, li2c->dir_reg);
>>> +
>>> +        /* Then, make this pin output 0 */
>>> +        val = readb(li2c->dat_reg);
>>> +        val &= ~mask;
>>> +        writeb(val, li2c->dat_reg);
>>> +    }
>>> +
>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>> +}
>>> +
>>> +/*
>>> + * ls7a_gpio_i2c_get - read value back from the gpio pin indicated 
>>> by mask
>>> + * @mask: gpio pin mask
>>> + * return "0" for low, "1" for high
>>> + */
>>> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const li2c, int mask)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(li2c->ddev);
>>> +    unsigned long flags;
>>> +    u8 val;
>>> +
>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>> +
>>> +    /* First set this pin as input */
>>> +    val = readb(li2c->dir_reg);
>>> +    val |= mask;
>>> +    writeb(val, li2c->dir_reg);
>>> +
>>> +    /* Then get level state from this pin */
>>> +    val = readb(li2c->dat_reg);
>>> +
>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>> +
>>> +    return (val & mask) ? 1 : 0;
>>> +}
>>> +
>>> +static void ls7a_i2c_set_sda(void *i2c, int state)
>>> +{
>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>> +    /* set state on the li2c->sda pin */
>>> +    return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
>>> +}
>>> +
>>> +static void ls7a_i2c_set_scl(void *i2c, int state)
>>> +{
>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>> +    /* set state on the li2c->scl pin */
>>> +    return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
>>> +}
>>> +
>>> +static int ls7a_i2c_get_sda(void *i2c)
>>> +{
>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>> +    /* read value from the li2c->sda pin */
>>> +    return ls7a_gpio_i2c_get(li2c, li2c->sda);
>>> +}
>>> +
>>> +static int ls7a_i2c_get_scl(void *i2c)
>>> +{
>>> +    struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
>>> +    /* read the value from the li2c->scl pin */
>>> +    return ls7a_gpio_i2c_get(li2c, li2c->scl);
>>> +}
>>> +
>>> +static void lsdc_destroy_i2c(struct drm_device *ddev, void *data)
>>> +{
>>> +    struct lsdc_i2c *li2c = (struct lsdc_i2c *)data;
>>> +
>>> +    if (li2c) {
>>> +        i2c_del_adapter(&li2c->adapter);
>>> +        kfree(li2c);
>>> +    }
>>> +}
>>> +
>>> +/*
>>> + * The DC in ls7a1000/ls7a2000 have builtin gpio hardware
>>> + *
>>> + * @base: gpio reg base
>>> + * @index: output channel index, 0 for DVO0, 1 for DVO1
>>> + */
>>> +struct lsdc_i2c *lsdc_create_i2c_chan(struct drm_device *ddev,
>>> +                      void *base,
>>> +                      unsigned int index)
>>> +{
>>> +    struct i2c_adapter *adapter;
>>> +    struct lsdc_i2c *li2c;
>>> +    int ret;
>>> +
>>> +    li2c = kzalloc(sizeof(*li2c), GFP_KERNEL);
>>> +    if (!li2c)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    if (index == 0) {
>>> +        li2c->sda = 0x01;  /* pin 0 */
>>> +        li2c->scl = 0x02;  /* pin 1 */
>>> +    } else if (index == 1) {
>>> +        li2c->sda = 0x04;  /* pin 2 */
>>> +        li2c->scl = 0x08;  /* pin 3 */
>>> +    }
>>> +
>>> +    li2c->reg_base = base;
>>> +    li2c->ddev = ddev;
>>> +    li2c->dir_reg = li2c->reg_base + LS7A_DC_GPIO_DIR_REG;
>>> +    li2c->dat_reg = li2c->reg_base + LS7A_DC_GPIO_DAT_REG;
>>> +
>>> +    li2c->bit.setsda = ls7a_i2c_set_sda;
>>> +    li2c->bit.setscl = ls7a_i2c_set_scl;
>>> +    li2c->bit.getsda = ls7a_i2c_get_sda;
>>> +    li2c->bit.getscl = ls7a_i2c_get_scl;
>>> +    li2c->bit.udelay = 5;
>>> +    li2c->bit.timeout = usecs_to_jiffies(2200);
>>> +    li2c->bit.data = li2c;
>>> +
>>> +    adapter = &li2c->adapter;
>>> +    adapter->algo_data = &li2c->bit;
>>> +    adapter->owner = THIS_MODULE;
>>> +    adapter->class = I2C_CLASS_DDC;
>>> +    adapter->dev.parent = ddev->dev;
>>> +    adapter->nr = -1;
>>> +
>>> +    snprintf(adapter->name, sizeof(adapter->name), "lsdc-i2c%u", 
>>> index);
>>> +
>>> +    i2c_set_adapdata(adapter, li2c);
>>> +
>>> +    ret = i2c_bit_add_bus(adapter);
>>> +    if (ret) {
>>> +        kfree(li2c);
>>> +        return ERR_PTR(ret);
>>> +    }
>>> +
>>> +    ret = drmm_add_action_or_reset(ddev, lsdc_destroy_i2c, li2c);
>>> +    if (ret)
>>> +        return NULL;
>>> +
>>> +    drm_info(ddev, "%s(sda=%u, scl=%u) created for connector-%u\n",
>>> +         adapter->name, li2c->sda, li2c->scl, index);
>>> +
>>> +    return li2c;
>>> +}
>>> +
>>> +static int lsdc_get_i2c_id(struct lsdc_device *ldev, int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (descp->chip == CHIP_LS2K1000)
>>> +        return index;
>>> +
>>> +    if (descp->chip == CHIP_LS2K0500)
>>> +        return index + 2;
>>> +
>>> +    return index;
>>> +}
>>> +
>>> +struct i2c_adapter *lsdc_get_i2c_adapter(struct lsdc_device *ldev,
>>> +                     int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +    struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
>>> +
>>> +    if (descp->has_builtin_i2c) {
>>> +        struct lsdc_i2c *li2c = dispipe->li2c;
>>> +
>>> +        if (li2c)
>>> +            return &li2c->adapter;
>>> +    }
>>> +
>>> +    return i2c_get_adapter(lsdc_get_i2c_id(ldev, index));
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_irq.c
>>> new file mode 100644
>>> index 000000000000..71c85f09bb6f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
>>> @@ -0,0 +1,86 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <drm/drm_vblank.h>
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +
>>> +/*
>>> + * For the DC in ls7a2000, clearing interrupt status is achieved by
>>> + * write "1" to LSDC_INT_REG, For the DC in ls7a1000, ls2k1000 and
>>> + * ls2k0500, clearing interrupt status is achieved by write "0" to
>>> + * LSDC_INT_REG. Two different hardware engineer of Loongson modify
>>> + * it as their will.
>>> + */
>>> +
>>> +/* For the DC in ls7a2000 */
>>> +static irqreturn_t lsdc_irq_handler(int irq, void *arg)
>>> +{
>>> +    struct drm_device *ddev = arg;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    u32 val;
>>> +
>>> +    /* Read the interrupt status */
>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>> +    if ((val & INT_STATUS_MASK) == 0) {
>>> +        drm_warn(ddev, "no interrupt occurs\n");
>>> +        return IRQ_NONE;
>>> +    }
>>> +
>>> +    ldev->irq_status = val;
>>> +
>>> +    /* write "1" to clear the interrupt status */
>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val);
>>> +
>>> +    return IRQ_WAKE_THREAD;
>>> +}
>>> +
>>> +/* For the DC in ls7a1000, ls2k1000 and ls2k0500 */
>>> +static irqreturn_t lsdc_irq_handler_legacy(int irq, void *arg)
>>> +{
>>> +    struct drm_device *ddev = arg;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    u32 val;
>>> +
>>> +    /* Read the interrupt status */
>>> +    val = lsdc_rreg32(ldev, LSDC_INT_REG);
>>> +    if ((val & INT_STATUS_MASK) == 0) {
>>> +        drm_warn(ddev, "no interrupt occurs\n");
>>> +        return IRQ_NONE;
>>> +    }
>>> +
>>> +    ldev->irq_status = val;
>>> +
>>> +    /* write "0" to clear the interrupt status */
>>> +    lsdc_wreg32(ldev, LSDC_INT_REG, val & ~INT_STATUS_MASK);
>>> +
>>> +    return IRQ_WAKE_THREAD;
>>> +}
>>> +
>>> +irq_handler_t lsdc_get_irq_handler(struct lsdc_device *ldev)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (descp->chip == CHIP_LS7A2000)
>>> +        return lsdc_irq_handler;
>>> +
>>> +    return lsdc_irq_handler_legacy;
>>> +}
>>> +
>>> +irqreturn_t lsdc_irq_thread_handler(int irq, void *arg)
>>> +{
>>> +    struct drm_device *ddev = arg;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct drm_crtc *crtc;
>>> +
>>> +    if (ldev->irq_status & INT_CRTC0_VSYNC) {
>>> +        crtc = drm_crtc_from_index(ddev, 0);
>>> +        drm_crtc_handle_vblank(crtc);
>>> +    }
>>> +
>>> +    if (ldev->irq_status & INT_CRTC1_VSYNC) {
>>> +        crtc = drm_crtc_from_index(ddev, 1);
>>> +        drm_crtc_handle_vblank(crtc);
>>> +    }
>>> +
>>> +    return IRQ_HANDLED;
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_output.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_output.c
>>> new file mode 100644
>>> index 000000000000..d4bc7666d9ea
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_output.c
>>> @@ -0,0 +1,452 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <drm/drm_edid.h>
>>> +#include <drm/drm_probe_helper.h>
>>> +#include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_connector.h>
>>> +#include "lsdc_drv.h"
>>> +
>>> +static int lsdc_get_modes(struct drm_connector *connector)
>>> +{
>>> +    unsigned int num = 0;
>>> +    struct edid *edid;
>>> +
>>> +    if (connector->ddc) {
>>> +        edid = drm_get_edid(connector, connector->ddc);
>>> +        if (edid) {
>>> +            drm_connector_update_edid_property(connector, edid);
>>> +            num = drm_add_edid_modes(connector, edid);
>>> +            kfree(edid);
>>> +        }
>>> +
>>> +        return num;
>>> +    }
>>> +
>>> +    num = drm_add_modes_noedid(connector, 1920, 1200);
>>> +
>>> +    drm_set_preferred_mode(connector, 1024, 768);
>>> +
>>> +    return num;
>>> +}
>>> +
>>> +static enum drm_connector_status
>>> +lsdc_unknown_connector_detect(struct drm_connector *connector, bool 
>>> force)
>>> +{
>>> +    struct i2c_adapter *ddc = connector->ddc;
>>> +
>>> +    if (ddc) {
>>> +        if (drm_probe_ddc(ddc))
>>> +            return connector_status_connected;
>>> +    } else {
>>> +        if (connector->connector_type == DRM_MODE_CONNECTOR_DPI)
>>> +            return connector_status_connected;
>>> +
>>> +        if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
>>> +            return connector_status_connected;
>>> +    }
>>> +
>>> +    return connector_status_unknown;
>>> +}
>>> +
>>> +static enum drm_connector_status
>>> +lsdc_hdmi_connector_detect(struct drm_connector *connector, bool 
>>> force)
>>> +{
>>> +    struct lsdc_display_pipe *pipe = 
>>> connector_to_display_pipe(connector);
>>> +    struct lsdc_device *ldev = to_lsdc(connector->dev);
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
>>> +
>>> +    if (pipe->index == 0) {
>>> +        if (val & HDMI0_HPD_FLAG)
>>> +            return connector_status_connected;
>>> +    }
>>> +
>>> +    if (pipe->index == 1) {
>>> +        if (val & HDMI1_HPD_FLAG)
>>> +            return connector_status_connected;
>>> +    }
>>> +
>>> +    return connector_status_disconnected;
>>> +}
>>> +
>>> +static enum drm_connector_status
>>> +lsdc_hdmi_vga_connector_detect(struct drm_connector *connector, 
>>> bool force)
>>> +{
>>> +    struct lsdc_display_pipe *pipe = 
>>> connector_to_display_pipe(connector);
>>> +    struct drm_device *ddev = connector->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct i2c_adapter *ddc;
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_HDMI_HPD_STATUS_REG);
>>> +
>>> +    if (pipe->index == 1) {
>>> +        if (val & HDMI1_HPD_FLAG)
>>> +            return connector_status_connected;
>>> +
>>> +        return connector_status_disconnected;
>>> +    }
>>> +
>>> +    if (pipe->index == 0) {
>>> +        if (val & HDMI0_HPD_FLAG)
>>> +            return connector_status_connected;
>>> +
>>> +        ddc = connector->ddc;
>>> +        if (ddc) {
>>> +            if (drm_probe_ddc(ddc))
>>> +                return connector_status_connected;
>>> +
>>> +            return connector_status_disconnected;
>>> +        }
>>> +    }
>>> +
>>> +    return connector_status_unknown;
>>> +}
>>> +
>>> +static struct drm_encoder *
>>> +lsdc_connector_get_best_encoder(struct drm_connector *connector,
>>> +                struct drm_atomic_state *state)
>>> +{
>>> +    struct lsdc_display_pipe *pipe = 
>>> connector_to_display_pipe(connector);
>>> +
>>> +    return &pipe->encoder;
>>> +}
>>> +
>>> +static const struct drm_connector_helper_funcs 
>>> lsdc_connector_helpers = {
>>> +    .atomic_best_encoder = lsdc_connector_get_best_encoder,
>>> +    .get_modes = lsdc_get_modes,
>>> +};
>>> +
>>> +static const struct drm_connector_funcs 
>>> lsdc_unknown_connector_funcs = {
>>> +    .detect = lsdc_unknown_connector_detect,
>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>> +    .destroy = drm_connector_cleanup,
>>> +    .reset = drm_atomic_helper_connector_reset,
>>> +    .atomic_duplicate_state = 
>>> drm_atomic_helper_connector_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +};
>>> +
>>> +static const struct drm_connector_funcs 
>>> lsdc_hdmi_vga_connector_funcs = {
>>> +    .detect = lsdc_hdmi_vga_connector_detect,
>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>> +    .destroy = drm_connector_cleanup,
>>> +    .reset = drm_atomic_helper_connector_reset,
>>> +    .atomic_duplicate_state = 
>>> drm_atomic_helper_connector_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +};
>>> +
>>> +static const struct drm_connector_funcs lsdc_hdmi_connector_funcs = {
>>> +    .detect = lsdc_hdmi_connector_detect,
>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>> +    .destroy = drm_connector_cleanup,
>>> +    .reset = drm_atomic_helper_connector_reset,
>>> +    .atomic_duplicate_state = 
>>> drm_atomic_helper_connector_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +};
>>> +
>>> +static const struct drm_connector_funcs *
>>> +lsdc_get_connector_func(struct lsdc_device *ldev, unsigned int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (descp->chip == CHIP_LS7A2000) {
>>> +        if (index == 0)
>>> +            return &lsdc_hdmi_vga_connector_funcs;
>>> +
>>> +        if (index == 1)
>>> +            return &lsdc_hdmi_connector_funcs;
>>> +    }
>>> +
>>> +    return &lsdc_unknown_connector_funcs;
>>> +}
>>> +
>>> +/*
>>> + * we provide a default support before DT/VBIOS is supported
>>> + */
>>> +static int lsdc_get_encoder_type(struct lsdc_device *ldev,
>>> +                 unsigned int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (descp->chip == CHIP_LS7A2000) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_ENCODER_DAC;
>>> +        if (index == 1)
>>> +            return DRM_MODE_ENCODER_TMDS;
>>> +    }
>>> +
>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>> CHIP_LS2K1000) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_ENCODER_DPI;
>>> +        if (index == 1)
>>> +            return DRM_MODE_ENCODER_DPI;
>>> +    }
>>> +
>>> +    if (descp->chip == CHIP_LS2K0500) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_ENCODER_DPI;
>>> +        if (index == 1)
>>> +            return DRM_MODE_ENCODER_DAC;
>>> +    }
>>> +
>>> +    return DRM_MODE_ENCODER_NONE;
>>> +}
>>> +
>>> +/*
>>> + * provide a default before DT/VBIOS support is upstreamed
>>> + */
>>> +static int lsdc_get_connector_type(struct lsdc_device *ldev,
>>> +                   unsigned int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    if (descp->chip == CHIP_LS7A2000) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_CONNECTOR_VGA;
>>> +        if (index == 1)
>>> +            return DRM_MODE_CONNECTOR_HDMIA;
>>> +    }
>>> +
>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>> CHIP_LS2K1000) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_CONNECTOR_DPI;
>>> +        if (index == 1)
>>> +            return DRM_MODE_CONNECTOR_DPI;
>>> +    }
>>> +
>>> +    if (descp->chip == CHIP_LS2K0500) {
>>> +        if (index == 0)
>>> +            return DRM_MODE_CONNECTOR_DPI;
>>> +        if (index == 1)
>>> +            return DRM_MODE_CONNECTOR_VGA;
>>> +    }
>>> +
>>> +    return DRM_MODE_CONNECTOR_Unknown;
>>> +}
>>> +
>>> +static void lsdc_hdmi_disable(struct drm_encoder *encoder)
>>> +{
>>> +    struct lsdc_display_pipe *dispipe = 
>>> encoder_to_display_pipe(encoder);
>>> +    struct drm_device *ddev = encoder->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    unsigned int index = dispipe->index;
>>> +    u32 val;
>>> +
>>> +    if (index == 0)
>>> +        val = lsdc_rreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG);
>>> +    else if (index == 1)
>>> +        val = lsdc_rreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG);
>>> +
>>> +    val &= ~HDMI_PHY_EN;
>>> +
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
>>> +
>>> +    drm_dbg(ddev, "HDMI-%u disabled\n", index);
>>> +}
>>> +
>>> +static void lsdc_hdmi_enable(struct drm_encoder *encoder)
>>> +{
>>> +    struct drm_device *ddev = encoder->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct lsdc_display_pipe *dispipe = 
>>> encoder_to_display_pipe(encoder);
>>> +    unsigned int index = dispipe->index;
>>> +    u32 val;
>>> +
>>> +    /* we are using software gpio emulated i2c */
>>> +    val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
>>> +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
>>> +
>>> +    if (index == 0) {
>>> +        /* Enable HDMI-0 */
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
>>> +
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_ZONE_REG, 0x00400040);
>>> +    } else if (index == 1) {
>>> +        /* Enable HDMI-1 */
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
>>> +
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_ZONE_REG, 0x00400040);
>>> +    }
>>> +
>>> +    val = HDMI_PHY_TERM_STATUS |
>>> +          HDMI_PHY_TERM_DET_EN |
>>> +          HDMI_PHY_TERM_H_EN |
>>> +          HDMI_PHY_TERM_L_EN |
>>> +          HDMI_PHY_RESET_N |
>>> +          HDMI_PHY_EN;
>>> +
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_CTRL_REG, val);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_CTRL_REG, val);
>>> +
>>> +    drm_dbg(ddev, "HDMI-%u enabled\n", index);
>>> +}
>>> +
>>> +/*
>>> + *  Fout = M * Fin
>>> + *
>>> + *  M = (4 * LF) / (IDF * ODF)
>>> + *
>>> + *  Loongson HDMI require M = 10
>>> + */
>>> +static void lsdc_hdmi_phy_pll_config(struct lsdc_device *ldev,
>>> +                     int index,
>>> +                     int clock)
>>> +{
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    int count = 0;
>>> +    u32 val;
>>> +
>>> +    /* disable phy pll */
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, 0x0);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, 0x0);
>>> +
>>> +    /*
>>> +     * 10 = (4 * 40) / (8 * 2)
>>> +     */
>>> +    val = (8 << HDMI_PLL_IDF_SHIFT) |
>>> +          (40 << HDMI_PLL_LF_SHIFT) |
>>> +          (1 << HDMI_PLL_ODF_SHIFT) |
>>> +          HDMI_PLL_ENABLE;
>>> +
>>> +    drm_dbg(ddev, "HDMI-%u clock: %d\n", index, clock);
>>> +
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI0_PHY_PLL_REG, val);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_HDMI1_PHY_PLL_REG, val);
>>> +
>>> +    /* wait hdmi phy pll lock */
>>> +    do {
>>> +        if (index == 0)
>>> +            val = lsdc_rreg32(ldev, LSDC_HDMI0_PHY_PLL_REG);
>>> +        else if (index == 1)
>>> +            val = lsdc_rreg32(ldev, LSDC_HDMI1_PHY_PLL_REG);
>>> +
>>> +        ++count;
>>> +
>>> +        if (val & HDMI_PLL_LOCKED) {
>>> +            drm_dbg(ddev, "Setting HDMI-%u PLL success(take %d 
>>> cycles)\n",
>>> +                index, count);
>>> +            break;
>>> +        }
>>> +    } while (count < 1000);
>>> +}
>>> +
>>> +static void lsdc_hdmi_atomic_mode_set(struct drm_encoder *encoder,
>>> +                      struct drm_crtc_state *crtc_state,
>>> +                      struct drm_connector_state *conn_state)
>>> +{
>>> +    struct drm_device *ddev = encoder->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct lsdc_display_pipe *dispipe = 
>>> encoder_to_display_pipe(encoder);
>>> +    unsigned int index = dispipe->index;
>>> +    struct drm_display_mode *mode = &crtc_state->mode;
>>> +
>>> +    lsdc_hdmi_phy_pll_config(ldev, index, mode->clock);
>>> +
>>> +    drm_dbg(ddev, "HDMI-%u modeset\n", index);
>>> +}
>>> +
>>> +static const struct drm_encoder_helper_funcs lsdc_hdmi_helper_funcs 
>>> = {
>>> +    .disable = lsdc_hdmi_disable,
>>> +    .enable = lsdc_hdmi_enable,
>>> +    .atomic_mode_set = lsdc_hdmi_atomic_mode_set,
>>> +};
>>> +
>>> +static void lsdc_hdmi_reset(struct drm_encoder *encoder)
>>> +{
>>> +    struct drm_device *ddev = encoder->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct lsdc_display_pipe *dispipe = 
>>> encoder_to_display_pipe(encoder);
>>> +    unsigned int index = dispipe->index;
>>> +    u32 val = HDMI_CTL_PERIOD_MODE | HDMI_AUDIO_EN |
>>> +          HDMI_PACKET_EN | HDMI_INTERFACE_EN;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_HDMI0_CTRL_REG, val);
>>> +    lsdc_wreg32(ldev, LSDC_HDMI1_CTRL_REG, val);
>>> +
>>> +    drm_dbg(ddev, "HDMI-%u Reset\n", index);
>>> +}
>>> +
>>> +static const struct drm_encoder_funcs lsdc_encoder_funcs = {
>>> +    .reset = lsdc_hdmi_reset,
>>> +    .destroy = drm_encoder_cleanup,
>>> +};
>>> +
>>> +int lsdc_create_output(struct lsdc_device *ldev, unsigned int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    struct lsdc_display_pipe *dispipe = &ldev->dispipe[index];
>>> +    struct drm_encoder *encoder = &dispipe->encoder;
>>> +    struct drm_connector *connector = &dispipe->connector;
>>> +    struct i2c_adapter *ddc = NULL;
>>> +    struct lsdc_i2c *li2c;
>>> +    int ret;
>>> +
>>> +    ret = drm_encoder_init(ddev,
>>> +                   encoder,
>>> +                   &lsdc_encoder_funcs,
>>> +                   lsdc_get_encoder_type(ldev, index),
>>> +                   "encoder-%u",
>>> +                   index);
>>> +    if (ret) {
>>> +        drm_err(ddev, "Failed to init encoder: %d\n", ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    encoder->possible_crtcs = BIT(index);
>>> +
>>> +    if (descp->chip == CHIP_LS7A2000)
>>> +        drm_encoder_helper_add(encoder, &lsdc_hdmi_helper_funcs);
>>> +
>>> +    if (descp->has_builtin_i2c) {
>>> +        li2c = lsdc_create_i2c_chan(ddev, ldev->reg_base, index);
>>> +        if (IS_ERR(li2c))
>>> +            return PTR_ERR(li2c);
>>> +
>>> +        dispipe->li2c = li2c;
>>> +
>>> +        ddc = &li2c->adapter;
>>> +    } else {
>>> +        ddc = lsdc_get_i2c_adapter(ldev, index);
>>> +        if (IS_ERR(ddc)) {
>>> +            drm_err(ddev, "Error get ddc for output-%u\n", index);
>>> +            return PTR_ERR(ddc);
>>> +        }
>>> +    }
>>> +
>>> +    ret = drm_connector_init_with_ddc(ddev,
>>> +                      connector,
>>> +                      lsdc_get_connector_func(ldev, index),
>>> +                      lsdc_get_connector_type(ldev, index),
>>> +                      ddc);
>>> +    if (ret) {
>>> +        drm_err(ddev, "Init connector-%d failed\n", index);
>>> +        return ret;
>>> +    }
>>> +
>>> +    drm_connector_helper_add(connector, &lsdc_connector_helpers);
>>> +
>>> +    drm_connector_attach_encoder(connector, encoder);
>>> +
>>> +    connector->polled = DRM_CONNECTOR_POLL_CONNECT |
>>> +                DRM_CONNECTOR_POLL_DISCONNECT;
>>> +
>>> +    connector->interlace_allowed = 0;
>>> +    connector->doublescan_allowed = 0;
>>> +
>>> +    ldev->num_output++;
>>> +
>>> +    drm_info(ddev, "output-%u initialized\n", index);
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_plane.c
>>> new file mode 100644
>>> index 000000000000..0f779c97d53b
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
>>> @@ -0,0 +1,443 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <drm/drm_atomic.h>
>>> +#include <drm/drm_atomic_helper.h>
>>> +#include <drm/drm_framebuffer.h>
>>> +#include <drm/drm_plane_helper.h>
>>> +#include <drm/drm_gem_vram_helper.h>
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +#include "lsdc_pll.h"
>>> +
>>> +static const u32 lsdc_primary_formats[] = {
>>> +    DRM_FORMAT_XRGB8888,
>>> +    DRM_FORMAT_ARGB8888,
>>> +};
>>> +
>>> +static const u32 lsdc_cursor_formats[] = {
>>> +    DRM_FORMAT_ARGB8888,
>>> +};
>>> +
>>> +static const u64 lsdc_fb_format_modifiers[] = {
>>> +    DRM_FORMAT_MOD_LINEAR,
>>> +    DRM_FORMAT_MOD_INVALID
>>> +};
>>> +
>>> +static void lsdc_update_fb_format(struct lsdc_device *ldev,
>>> +                  struct drm_crtc *crtc,
>>> +                  const struct drm_format_info *fmt_info)
>>> +{
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    u32 val;
>>> +    u32 fmt;
>>> +
>>> +    switch (fmt_info->format) {
>>> +    case DRM_FORMAT_XRGB8888:
>>> +        fmt = LSDC_PF_XRGB8888;
>>> +        break;
>>> +    case DRM_FORMAT_ARGB8888:
>>> +        fmt = LSDC_PF_XRGB8888;
>>> +        break;
>>> +    default:
>>> +        fmt = LSDC_PF_XRGB8888;
>>> +        break;
>>> +    }
>>> +
>>> +    if (index == 0) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +        val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +    } else if (index == 1) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +        val = (val & ~CFG_PIX_FMT_MASK) | fmt;
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +    }
>>> +}
>>> +
>>> +static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
>>> +                      struct drm_crtc *crtc,
>>> +                      u64 paddr)
>>> +{
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +    u32 lo_addr_reg;
>>> +    u32 hi_addr_reg;
>>> +    u32 val;
>>> +
>>> +    /*
>>> +     * Find which framebuffer address register should update.
>>> +     * if FB_ADDR0_REG is in using, we write the address to 
>>> FB_ADDR0_REG,
>>> +     * if FB_ADDR1_REG is in using, we write the address to 
>>> FB_ADDR1_REG
>>> +     * for each CRTC, the switch using one fb register to another is
>>> +     * trigger by triggered by set CFG_PAGE_FLIP bit of 
>>> LSDC_CRTCx_CFG_REG
>>> +     */
>>> +    if (index == 0) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +        if (val & CFG_FB_IN_USING) {
>>> +            lo_addr_reg = LSDC_CRTC0_FB1_LO_ADDR_REG;
>>> +            hi_addr_reg = LSDC_CRTC0_FB1_HI_ADDR_REG;
>>> +            drm_dbg(ddev, "Currently, FB1 is in using by CRTC-0\n");
>>> +        } else {
>>> +            lo_addr_reg = LSDC_CRTC0_FB0_LO_ADDR_REG;
>>> +            hi_addr_reg = LSDC_CRTC0_FB0_HI_ADDR_REG;
>>> +            drm_dbg(ddev, "Currently, FB0 is in using by CRTC-0\n");
>>> +        }
>>> +    } else if (index == 1) {
>>> +        val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +        if (val & CFG_FB_IN_USING) {
>>> +            lo_addr_reg = LSDC_CRTC1_FB1_LO_ADDR_REG;
>>> +            hi_addr_reg = LSDC_CRTC1_FB1_HI_ADDR_REG;
>>> +            drm_dbg(ddev, "Currently, FB1 is in using by CRTC-1\n");
>>> +        } else {
>>> +            lo_addr_reg = LSDC_CRTC1_FB0_LO_ADDR_REG;
>>> +            hi_addr_reg = LSDC_CRTC1_FB0_HI_ADDR_REG;
>>> +            drm_dbg(ddev, "Currently, FB0 is in using by CRTC-1\n");
>>> +        }
>>> +    }
>>> +
>>> +    /* 40-bit width physical address bus */
>>> +    lsdc_wreg32(ldev, lo_addr_reg, paddr);
>>> +    lsdc_wreg32(ldev, hi_addr_reg, (paddr >> 32) & 0xFF);
>>> +
>>> +    drm_dbg(ddev, "CRTC-%u scantout from 0x%llx\n", index, paddr);
>>> +}
>>> +
>>> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
>>> +                       struct drm_plane_state *state,
>>> +                       unsigned int plane)
>>> +{
>>> +    unsigned int offset = fb->offsets[plane];
>>> +
>>> +    offset += fb->format->cpp[plane] * (state->src_x >> 16);
>>> +    offset += fb->pitches[plane] * (state->src_y >> 16);
>>> +
>>> +    return offset;
>>> +}
>>> +
>>> +static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
>>> +{
>>> +    struct drm_gem_vram_object *gbo;
>>> +    s64 gpu_addr;
>>> +
>>> +    gbo = drm_gem_vram_of_gem(fb->obj[0]);
>>> +    gpu_addr = drm_gem_vram_offset(gbo);
>>> +
>>> +    return gpu_addr;
>>> +}
>>> +
>>> +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
>>> +                       struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_plane_state *plane_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> +    struct drm_crtc *crtc = plane_state->crtc;
>>> +    struct drm_crtc_state *crtc_state = 
>>> drm_atomic_get_new_crtc_state(state, crtc);
>>> +
>>> +    if (!crtc)
>>> +        return 0;
>>> +
>>> +    return drm_atomic_helper_check_plane_state(plane_state,
>>> +                           crtc_state,
>>> +                           DRM_PLANE_NO_SCALING,
>>> +                           DRM_PLANE_NO_SCALING,
>>> +                           false,
>>> +                           true);
>>> +}
>>> +
>>> +static void lsdc_update_fb_stride(struct lsdc_device *ldev,
>>> +                  struct drm_crtc *crtc,
>>> +                  unsigned int stride)
>>> +{
>>> +    unsigned int index = drm_crtc_index(crtc);
>>> +
>>> +    if (index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, stride);
>>> +    else if (index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_CRTC1_STRIDE_REG, stride);
>>> +
>>> +    drm_dbg(crtc->dev, "update stride to %u\n", stride);
>>> +}
>>> +
>>> +static void lsdc_primary_plane_atomic_update(struct drm_plane *plane,
>>> +                         struct drm_atomic_state *state)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(plane->dev);
>>> +    struct drm_plane_state *new_plane_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> +    struct drm_crtc *crtc = new_plane_state->crtc;
>>> +    struct drm_framebuffer *fb = new_plane_state->fb;
>>> +    u32 fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
>>> +    dma_addr_t fb_addr;
>>> +    s64 gpu_addr;
>>> +
>>> +    gpu_addr = lsdc_get_vram_bo_offset(fb);
>>> +    if (gpu_addr < 0)
>>> +        return;
>>> +
>>> +    fb_addr = ldev->vram_base + gpu_addr + fb_offset;
>>> +
>>> +    lsdc_update_fb_start_addr(ldev, crtc, fb_addr);
>>> +
>>> +    lsdc_update_fb_stride(ldev, crtc, fb->pitches[0]);
>>> +
>>> +    lsdc_update_fb_format(ldev, crtc, fb->format);
>>> +}
>>> +
>>> +static void lsdc_primary_plane_atomic_disable(struct drm_plane *plane,
>>> +                          struct drm_atomic_state *state)
>>> +{
>>> +    drm_dbg(plane->dev, "%s disabled\n", plane->name);
>>> +}
>>> +
>>> +static const struct drm_plane_helper_funcs 
>>> lsdc_primary_plane_helpers = {
>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>> +    .atomic_check = lsdc_primary_plane_atomic_check,
>>> +    .atomic_update = lsdc_primary_plane_atomic_update,
>>> +    .atomic_disable = lsdc_primary_plane_atomic_disable,
>>> +};
>>> +
>>> +static int lsdc_cursor_atomic_check(struct drm_plane *plane,
>>> +                    struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_plane_state *new_plane_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> +    struct drm_framebuffer *fb = new_plane_state->fb;
>>> +    struct drm_crtc *crtc = new_plane_state->crtc;
>>> +    struct drm_crtc_state *crtc_state;
>>> +    int ret;
>>> +
>>> +    /* no need for further checks if the plane is being disabled */
>>> +    if (!crtc || !fb)
>>> +        return 0;
>>> +
>>> +    if (!new_plane_state->visible)
>>> +        return 0;
>>> +
>>> +    crtc_state = drm_atomic_get_new_crtc_state(state,
>>> +                           new_plane_state->crtc);
>>> +
>>> +    ret = drm_atomic_helper_check_plane_state(new_plane_state,
>>> +                          crtc_state,
>>> +                          DRM_PLANE_NO_SCALING,
>>> +                          DRM_PLANE_NO_SCALING,
>>> +                          true,
>>> +                          true);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +/*
>>> + * There is only one hardware cursor in ls7a1000, ls2k1000 and 
>>> ls2k0500.
>>> + * we made it shared by the two CRTC, which can satisfy peoples who 
>>> use
>>> + * double screen extend mode only. On clone screen usage case, the 
>>> cursor
>>> + * on display pipe 1 will not be able to display.
>>> + *
>>> + * Update location of the cursor, attach it to CRTC0 or CRTC1 on 
>>> the runtime.
>>> + */
>>> +static void lsdc_cursor_update_location_quirks(struct lsdc_device 
>>> *ldev,
>>> +                           struct drm_crtc *crtc)
>>> +{
>>> +    u32 val = CURSOR_FORMAT_ARGB8888;
>>> +
>>> +    /*
>>> +     * If bit 4 of LSDC_CURSOR0_CFG_REG is 1, then the cursor will be
>>> +     * locate at CRTC-1, if bit 4 of LSDC_CURSOR0_CFG_REG is 0, then
>>> +     * the cursor will be locate at CRTC-0. The cursor is alway on the
>>> +     * top of the primary. Compositing the primary plane and cursor
>>> +     * plane is automatically done by hardware.
>>> +     */
>>> +    if (drm_crtc_index(crtc))
>>> +        val |= CURSOR_LOCATION;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, val);
>>> +}
>>> +
>>> +/* update the position of the cursor */
>>> +static void lsdc_cursor_update_position_quirks(struct lsdc_device 
>>> *ldev,
>>> +                           int x,
>>> +                           int y)
>>> +{
>>> +    if (x < 0)
>>> +        x = 0;
>>> +
>>> +    if (y < 0)
>>> +        y = 0;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
>>> +}
>>> +
>>> +static void lsdc_cursor_atomic_update_quirks(struct drm_plane *plane,
>>> +                         struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = plane->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct drm_plane_state *new_plane_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> +    struct drm_plane_state *old_plane_state = 
>>> drm_atomic_get_old_plane_state(state, plane);
>>> +    struct drm_framebuffer *new_fb = new_plane_state->fb;
>>> +    struct drm_framebuffer *old_fb = old_plane_state->fb;
>>> +
>>> +    if (new_fb != old_fb) {
>>> +        s64 offset = lsdc_get_vram_bo_offset(new_fb);
>>> +        u64 cursor_addr = ldev->vram_base + offset;
>>> +
>>> +        drm_dbg_kms(ddev, "%s offset: %llx\n", plane->name, offset);
>>> +
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, cursor_addr);
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (cursor_addr >> 
>>> 32) & 0xFF);
>>> +    }
>>> +
>>> +    lsdc_cursor_update_position_quirks(ldev, 
>>> new_plane_state->crtc_x, new_plane_state->crtc_y);
>>> +
>>> +    lsdc_cursor_update_location_quirks(ldev, new_plane_state->crtc);
>>> +}
>>> +
>>> +/* update the format, size and location of the cursor */
>>> +static void lsdc_cursor_atomic_update(struct drm_plane *plane,
>>> +                      struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = plane->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct lsdc_display_pipe *dispipe = cursor_to_display_pipe(plane);
>>> +    struct drm_plane_state *new_plane_state = 
>>> drm_atomic_get_new_plane_state(state, plane);
>>> +    struct drm_framebuffer *new_fb = new_plane_state->fb;
>>> +    int x = new_plane_state->crtc_x;
>>> +    int y = new_plane_state->crtc_y;
>>> +    u32 conf = CURSOR_FORMAT_ARGB8888 | CURSOR_SIZE_64X64;
>>> +    u64 cursor_addr = ldev->vram_base + 
>>> lsdc_get_vram_bo_offset(new_fb);
>>> +
>>> +    if (x < 0)
>>> +        x = 0;
>>> +
>>> +    if (y < 0)
>>> +        y = 0;
>>> +
>>> +    if (dispipe->index == 0) {
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_HI_REG, (cursor_addr >> 
>>> 32) & 0xFF);
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_ADDR_LO_REG, cursor_addr);
>>> +        /* Attach Cursor-0 to CRTC-0 */
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, conf & 
>>> ~CURSOR_LOCATION);
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_POSITION_REG, (y << 16) | x);
>>> +        return;
>>> +    }
>>> +
>>> +    if (dispipe->index == 1) {
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_HI_REG, (cursor_addr >> 
>>> 32) & 0xFF);
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_ADDR_LO_REG, cursor_addr);
>>> +        /* Attach Cursor-1 to CRTC-1 */
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, conf | 
>>> CURSOR_LOCATION);
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_POSITION_REG, (y << 16) | x);
>>> +        return;
>>> +    }
>>> +}
>>> +
>>> +static void lsdc_cursor_atomic_disable_quirks(struct drm_plane *plane,
>>> +                          struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = plane->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +
>>> +    /* Set the format to 0 actually display the cursor */
>>> +    lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
>>> +
>>> +    drm_dbg(ddev, "%s disabled\n", plane->name);
>>> +}
>>> +
>>> +static void lsdc_cursor_atomic_disable(struct drm_plane *plane,
>>> +                       struct drm_atomic_state *state)
>>> +{
>>> +    struct drm_device *ddev = plane->dev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    struct lsdc_display_pipe *dispipe = cursor_to_display_pipe(plane);
>>> +
>>> +    if (dispipe->index == 0)
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR0_CFG_REG, 0);
>>> +    else if (dispipe->index == 1)
>>> +        lsdc_wreg32(ldev, LSDC_CURSOR1_CFG_REG, 0);
>>> +
>>> +    drm_dbg(ddev, "%s disabled\n", plane->name);
>>> +}
>>> +
>>> +static const struct drm_plane_helper_funcs 
>>> lsdc_cursor_helpers_quirk = {
>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>> +    .atomic_check = lsdc_cursor_atomic_check,
>>> +    .atomic_update = lsdc_cursor_atomic_update_quirks,
>>> +    .atomic_disable = lsdc_cursor_atomic_disable_quirks,
>>> +};
>>> +
>>> +static const struct drm_plane_helper_funcs 
>>> lsdc_cursor_plane_helpers = {
>>> +    .prepare_fb = drm_gem_vram_plane_helper_prepare_fb,
>>> +    .cleanup_fb = drm_gem_vram_plane_helper_cleanup_fb,
>>> +    .atomic_check = lsdc_cursor_atomic_check,
>>> +    .atomic_update = lsdc_cursor_atomic_update,
>>> +    .atomic_disable = lsdc_cursor_atomic_disable,
>>> +};
>>> +
>>> +static const struct drm_plane_funcs lsdc_plane_funcs = {
>>> +    .update_plane = drm_atomic_helper_update_plane,
>>> +    .disable_plane = drm_atomic_helper_disable_plane,
>>> +    .destroy = drm_plane_cleanup,
>>> +    .reset = drm_atomic_helper_plane_reset,
>>> +    .atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>>> +};
>>> +
>>> +static const struct drm_plane_helper_funcs *
>>> +lsdc_get_cursor_helper_funcs(const struct lsdc_desc *descp)
>>> +{
>>> +    if (descp->chip == CHIP_LS7A2000)
>>> +        return &lsdc_cursor_plane_helpers;
>>> +
>>> +    return &lsdc_cursor_helpers_quirk;
>>> +}
>>> +
>>> +int lsdc_plane_init(struct lsdc_device *ldev,
>>> +            struct drm_plane *plane,
>>> +            enum drm_plane_type type,
>>> +            unsigned int index)
>>> +{
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +    struct drm_device *ddev = &ldev->base;
>>> +    unsigned int format_count;
>>> +    const u32 *formats;
>>> +    const char *name;
>>> +    int ret;
>>> +
>>> +    switch (type) {
>>> +    case DRM_PLANE_TYPE_PRIMARY:
>>> +        formats = lsdc_primary_formats;
>>> +        format_count = ARRAY_SIZE(lsdc_primary_formats);
>>> +        name = "primary-%u";
>>> +        break;
>>> +    case DRM_PLANE_TYPE_CURSOR:
>>> +        formats = lsdc_cursor_formats;
>>> +        format_count = ARRAY_SIZE(lsdc_cursor_formats);
>>> +        name = "cursor-%u";
>>> +        break;
>>> +    case DRM_PLANE_TYPE_OVERLAY:
>>> +        drm_err(ddev, "overlay plane is not supported\n");
>>> +        break;
>>> +    }
>>> +
>>> +    ret = drm_universal_plane_init(ddev, plane, 1 << index,
>>> +                       &lsdc_plane_funcs,
>>> +                       formats, format_count,
>>> +                       lsdc_fb_format_modifiers,
>>> +                       type, name, index);
>>> +    if (ret) {
>>> +        drm_err(ddev, "%s failed: %d\n", __func__, ret);
>>> +        return ret;
>>> +    }
>>> +
>>> +    switch (type) {
>>> +    case DRM_PLANE_TYPE_PRIMARY:
>>> +        drm_plane_helper_add(plane, &lsdc_primary_plane_helpers);
>>> +        break;
>>> +    case DRM_PLANE_TYPE_CURSOR:
>>> +        drm_plane_helper_add(plane, 
>>> lsdc_get_cursor_helper_funcs(descp));
>>> +        break;
>>> +    case DRM_PLANE_TYPE_OVERLAY:
>>> +        drm_err(ddev, "overlay plane is not supported\n");
>>> +        break;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_pll.c
>>> new file mode 100644
>>> index 000000000000..6ed74989a6f5
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.c
>>> @@ -0,0 +1,569 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +#include "lsdc_pll.h"
>>> +
>>> +/*
>>> + * The structure of the pixel PLL register is evolved with times.
>>> + * All loongson's cpu is little endian.
>>> + */
>>> +
>>> +/* u64 */
>>> +struct ls7a1000_pixpll_bitmap {
>>> +    /* Byte 0 ~ Byte 3 */
>>> +    unsigned div_out      : 7;   /*  0 : 6     output clock 
>>> divider  */
>>> +    unsigned __1          : 14;  /*  7 : 
>>> 20                          */
>>> +    unsigned loopc        : 9;   /* 21 : 29    clock 
>>> multiplier      */
>>> +    unsigned __2          : 2;   /* 30 : 
>>> 31                          */
>>> +
>>> +    /* Byte 4 ~ Byte 7 */
>>> +    unsigned div_ref      : 7;   /*  0 : 6     input clock 
>>> divider   */
>>> +    unsigned locked       : 1;   /*  7         PLL locked 
>>> status     */
>>> +    unsigned sel_out      : 1;   /*  8         output clk 
>>> selector   */
>>> +    unsigned __3          : 2;   /*  9 : 10 reserved              */
>>> +    unsigned set_param    : 1;   /*  11        trigger the 
>>> update    */
>>> +    unsigned bypass       : 1;   /* 12                              */
>>> +    unsigned powerdown    : 1;   /* 13                              */
>>> +    unsigned __4          : 18;  /*  14 : 
>>> 31                         */
>>> +};
>>> +
>>> +/* u128 */
>>> +struct ls2k1000_pixpll_bitmap {
>>> +    /* Byte 0 ~ Byte 3 */
>>> +    unsigned sel_out      :  1;  /*  0      select this 
>>> PLL          */
>>> +    unsigned __1          :  1;  /* 1                               */
>>> +    unsigned sw_adj_en    :  1;  /*  2      allow software 
>>> adjust    */
>>> +    unsigned bypass       :  1;  /*  3      bypass L1 
>>> PLL            */
>>> +    unsigned __2          :  3;  /* 4:6                             */
>>> +    unsigned lock_en      :  1;  /*  7      enable lock L1 
>>> PLL       */
>>> +    unsigned __3          :  2;  /* 8:9                             */
>>> +    unsigned lock_check   :  2;  /* 10:11   precision 
>>> check          */
>>> +    unsigned __4          :  4;  /* 
>>> 12:15                            */
>>> +
>>> +    unsigned locked       :  1;  /* 16      PLL locked flag 
>>> bit      */
>>> +    unsigned __5          :  2;  /* 
>>> 17:18                            */
>>> +    unsigned powerdown    :  1;  /* 19      powerdown the pll if 
>>> set */
>>> +    unsigned __6          :  6;  /* 
>>> 20:25                            */
>>> +    unsigned div_ref      :  6;  /* 26:31   L1 
>>> Prescaler             */
>>> +
>>> +    /* Byte 4 ~ Byte 7 */
>>> +    unsigned loopc        : 10;  /* 32:41   Clock 
>>> Multiplier         */
>>> +    unsigned l1_div       :  6;  /* 42:47   not 
>>> used                 */
>>> +    unsigned __7          : 16;  /* 
>>> 48:63                            */
>>> +
>>> +    /* Byte 8 ~ Byte 15 */
>>> +    unsigned div_out      :  6;  /* 0 : 5   output clock 
>>> divider     */
>>> +    unsigned __8          : 26;  /* 6 : 
>>> 31                           */
>>> +    unsigned __9          : 32;  /* 70: 
>>> 127                          */
>>> +};
>>> +
>>> +/* u32 */
>>> +struct ls2k0500_pixpll_bitmap {
>>> +    /* Byte 0 ~ Byte 1 */
>>> +    unsigned sel_out      : 1;
>>> +    unsigned __1          : 2;
>>> +    unsigned sw_adj_en    : 1;   /* allow software 
>>> adjust              */
>>> +    unsigned bypass       : 1;   /* bypass L1 
>>> PLL                      */
>>> +    unsigned powerdown    : 1;   /* write 1 to powerdown the 
>>> PLL       */
>>> +    unsigned __2          : 1;
>>> +    unsigned locked       : 1;   /*  7     Is L1 PLL locked, read 
>>> only */
>>> +    unsigned div_ref      : 6;   /*  8:13  ref clock 
>>> divider           */
>>> +    unsigned __3          : 2;   /* 
>>> 14:15                              */
>>> +    /* Byte 2 ~ Byte 3 */
>>> +    unsigned loopc        : 8;   /* 16:23   Clock 
>>> Multiplier           */
>>> +    unsigned div_out      : 6;   /* 24:29   output clock 
>>> divider       */
>>> +    unsigned __4          : 2;   /* 
>>> 30:31                              */
>>> +};
>>> +
>>> +union lsdc_pixpll_bitmap {
>>> +    struct ls7a1000_pixpll_bitmap ls7a1000;
>>> +    struct ls2k1000_pixpll_bitmap ls2k1000;
>>> +    struct ls2k0500_pixpll_bitmap ls2k0500;
>>> +
>>> +    u32 dword[4];
>>> +};
>>> +
>>> +struct pixclk_to_pll_parm {
>>> +    /* kHz */
>>> +    unsigned int clock;
>>> +
>>> +    unsigned short width;
>>> +    unsigned short height;
>>> +    unsigned short vrefresh;
>>> +
>>> +    /* Stores parameters for programming the Hardware PLLs */
>>> +    unsigned short div_out;
>>> +    unsigned short loopc;
>>> +    unsigned short div_ref;
>>> +};
>>> +
>>> +/*
>>> + * Pixel clock to PLL parameters translation table.
>>> + * Small static cached value to speed up PLL parameters calculation.
>>> + */
>>> +static const struct pixclk_to_pll_parm pll_param_table[] = {
>>> +    {148500, 1920, 1080, 60, 11, 49,  3},   /* 1920x1080@60Hz */
>>> +                        /* 1920x1080@50Hz */
>>> +    {174500, 1920, 1080, 75, 17, 89,  3},   /* 1920x1080@75Hz */
>>> +    {181250, 2560, 1080, 75,  8, 58,  4},   /* 2560x1080@75Hz */
>>> +    {146250, 1680, 1050, 60, 16, 117, 5},   /* 1680x1050@60Hz */
>>> +    {135000, 1280, 1024, 75, 10, 54,  4},   /* 1280x1024@75Hz */
>>> +
>>> +    {108000, 1600, 900,  60, 15, 81,  5},   /* 1600x900@60Hz */
>>> +                        /* 1280x1024@60Hz */
>>> +                        /* 1280x960@60Hz */
>>> +                        /* 1152x864@75Hz */
>>> +
>>> +    {106500, 1440, 900,  60, 19, 81,  4},   /* 1440x900@60Hz */
>>> +    {88750,  1440, 900,  60, 16, 71,  5},   /* 1440x900@60Hz */
>>> +    {83500,  1280, 800,  60, 17, 71,  5},   /* 1280x800@60Hz */
>>> +    {71000,  1280, 800,  60, 20, 71,  5},   /* 1280x800@60Hz */
>>> +
>>> +    {74250,  1280, 720,  60, 22, 49,  3},   /* 1280x720@60Hz */
>>> +                        /* 1280x720@50Hz */
>>> +
>>> +    {78750,  1024, 768,  75, 16, 63,  5},   /* 1024x768@75Hz */
>>> +    {75000,  1024, 768,  70, 29, 87,  4},   /* 1024x768@70Hz */
>>> +    {65000,  1024, 768,  60, 20, 39,  3},   /* 1024x768@60Hz */
>>> +
>>> +    {51200,  1024, 600,  60, 25, 64,  5},   /* 1024x600@60Hz */
>>> +
>>> +    {57284,  832,  624,  75, 24, 55,  4},   /* 832x624@75Hz */
>>> +    {49500,  800,  600,  75, 40, 99,  5},   /* 800x600@75Hz */
>>> +    {50000,  800,  600,  72, 44, 88,  4},   /* 800x600@72Hz */
>>> +    {40000,  800,  600,  60, 30, 36,  3},   /* 800x600@60Hz */
>>> +    {36000,  800,  600,  56, 50, 72,  4},   /* 800x600@56Hz */
>>> +    {31500,  640,  480,  75, 40, 63,  5},   /* 640x480@75Hz */
>>> +                        /* 640x480@73Hz */
>>> +
>>> +    {30240,  640,  480,  67, 62, 75,  4},   /* 640x480@67Hz */
>>> +    {27000,  720,  576,  50, 50, 54,  4},   /* 720x576@60Hz */
>>> +    {25175,  640,  480,  60, 85, 107, 5},   /* 640x480@60Hz */
>>> +    {25200,  640,  480,  60, 50, 63,  5},   /* 640x480@60Hz */
>>> +                        /* 720x480@60Hz */
>>> +};
>>> +
>>> +/*
>>> + * lsdc_pixpll_setup - ioremap the device dependent PLL registers
>>> + *
>>> + * @this: point to the object where this function is called from
>>> + */
>>> +static int lsdc_pixpll_setup(struct lsdc_pll * const this)
>>> +{
>>> +    this->mmio = ioremap(this->reg_base, this->reg_size);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Find a set of pll parameters (to generate pixel clock) from a 
>>> static
>>> + * local table, which avoid to compute the pll parameter eachtime a
>>> + * modeset is triggered.
>>> + *
>>> + * @this: point to the object which this function is called from
>>> + * @clock: the desired output pixel clock, the unit is kHz
>>> + * @pout: point to where the parameters to store if found
>>> + *
>>> + *  Return true if hit, otherwise return false.
>>> + */
>>> +static bool lsdc_pixpll_find(struct lsdc_pll * const this,
>>> +                 unsigned int clock,
>>> +                 struct lsdc_pll_parms * const pout)
>>> +{
>>> +    unsigned int num = ARRAY_SIZE(pll_param_table);
>>> +    unsigned int i;
>>> +
>>> +    for (i = 0; i < num; i++) {
>>> +        if (clock != pll_param_table[i].clock)
>>> +            continue;
>>> +
>>> +        pout->div_ref = pll_param_table[i].div_ref;
>>> +        pout->loopc   = pll_param_table[i].loopc;
>>> +        pout->div_out = pll_param_table[i].div_out;
>>> +
>>> +        return true;
>>> +    }
>>> +
>>> +    drm_dbg(this->ddev, "pixel clock %u: miss\n", clock);
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +/*
>>> + * Find a set of pll parameters which have minimal difference with 
>>> the desired
>>> + * pixel clock frequency. It does that by computing all of the 
>>> possible
>>> + * combination. Compute the diff and find the combination with 
>>> minimal diff.
>>> + *
>>> + *  clock_out = refclk / div_ref * loopc / div_out
>>> + *
>>> + *  refclk is determined by the oscillator mounted board(Here is 
>>> 100MHz in
>>> + *  almost all case)
>>> + *
>>> + * @this: point to the object from which this function is called
>>> + * @clock_khz: the desired output pixel clock, the unit is kHz
>>> + * @pout: point to the out struct of lsdc_pll_parms
>>> + *
>>> + *  Return true if a parameter is found, otherwise return false
>>> + */
>>> +static bool lsdc_pixpll_compute(struct lsdc_pll * const this,
>>> +                unsigned int clock_khz,
>>> +                struct lsdc_pll_parms *pout)
>>> +{
>>> +    unsigned int refclk = this->ref_clock;
>>> +    const unsigned int tolerance = 1000;
>>> +    unsigned int min = tolerance;
>>> +    unsigned int div_out, loopc, div_ref;
>>> +    unsigned int computed;
>>> +
>>> +    if (lsdc_pixpll_find(this, clock_khz, pout))
>>> +        return true;
>>> +
>>> +    for (div_out = 6; div_out < 64; div_out++) {
>>> +        for (div_ref = 3; div_ref < 6; div_ref++) {
>>> +            for (loopc = 6; loopc < 161; loopc++) {
>>> +                int diff;
>>> +
>>> +                if (loopc < 12 * div_ref)
>>> +                    continue;
>>> +                if (loopc > 32 * div_ref)
>>> +                    continue;
>>> +
>>> +                computed = refclk * loopc / div_ref / div_out;
>>> +
>>> +                if (clock_khz > computed)
>>> +                    diff = clock_khz - computed;
>>> +                else if (clock_khz < computed)
>>> +                    diff = computed - clock_khz;
>>> +
>>> +                if (diff < min) {
>>> +                    min = diff;
>>> +                    pout->div_ref = div_ref;
>>> +                    pout->div_out = div_out;
>>> +                    pout->loopc = loopc;
>>> +
>>> +                    if (diff == 0)
>>> +                        return true;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return min < tolerance;
>>> +}
>>> +
>>> +/*
>>> + * Update the pll parameters to hardware, target to the pixpll in 
>>> ls7a1000
>>> + *
>>> + * @this: point to the object from which this function is called
>>> + * @pin: point to the struct of lsdc_pll_parms passed in
>>> + *
>>> + * return 0 if successful.
>>> + */
>>> +static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
>>> +                    struct lsdc_pll_parms const *pin)
>>> +{
>>> +    void __iomem *reg = this->mmio;
>>> +    unsigned int counter = 0;
>>> +    bool locked;
>>> +    u32 val;
>>> +
>>> +    /* Bypass the software configured PLL, using refclk directly */
>>> +    val = readl(reg + 0x4);
>>> +    val &= ~(1 << 8);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    /* Powerdown the PLL */
>>> +    val = readl(reg + 0x4);
>>> +    val |= (1 << 13);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    /* Clear the pll parameters */
>>> +    val = readl(reg + 0x4);
>>> +    val &= ~(1 << 11);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    /* clear old value & config new value */
>>> +    val = readl(reg + 0x04);
>>> +    val &= ~0x7F;
>>> +    val |= pin->div_ref;        /* div_ref */
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    val = readl(reg);
>>> +    val &= ~0x7f;
>>> +    val |= pin->div_out;        /* div_out */
>>> +
>>> +    val &= ~(0x1ff << 21);
>>> +    val |= pin->loopc << 21;    /* loopc */
>>> +    writel(val, reg);
>>> +
>>> +    /* Set the pll the parameters */
>>> +    val = readl(reg + 0x4);
>>> +    val |= (1 << 11);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    /* Powerup the PLL */
>>> +    val = readl(reg + 0x4);
>>> +    val &= ~(1 << 13);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    /* Wait the PLL lock */
>>> +    do {
>>> +        val = readl(reg + 0x4);
>>> +        locked = val & 0x80;
>>> +        counter++;
>>> +    } while (!locked && (counter < 2000));
>>> +
>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>> +
>>> +    /* Switch to the software configured pll */
>>> +    val = readl(reg + 0x4);
>>> +    val |= (1UL << 8);
>>> +    writel(val, reg + 0x4);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Update the pll parameters to hardware, target to the pixpll in 
>>> ls2k1000
>>> + *
>>> + * @this: point to the object from which this function is called
>>> + * @pin: point to the struct of lsdc_pll_parms passed in
>>> + *
>>> + * return 0 if successful.
>>> + */
>>> +static int ls2k1000_pixpll_param_update(struct lsdc_pll * const this,
>>> +                    struct lsdc_pll_parms const *pin)
>>> +{
>>> +    void __iomem *reg = this->mmio;
>>> +    unsigned int counter = 0;
>>> +    bool locked = false;
>>> +    u32 val;
>>> +
>>> +    val = readl(reg);
>>> +    /* Bypass the software configured PLL, using refclk directly */
>>> +    val &= ~(1 << 0);
>>> +    writel(val, reg);
>>> +
>>> +    /* Powerdown the PLL */
>>> +    val |= (1 << 19);
>>> +    writel(val, reg);
>>> +
>>> +    /* Allow the software configuration */
>>> +    val &= ~(1 << 2);
>>> +    writel(val, reg);
>>> +
>>> +    /* allow L1 PLL lock */
>>> +    val = (1L << 7) | (3L << 10);
>>> +    writel(val, reg);
>>> +
>>> +    /* clear div_ref bit field */
>>> +    val &= ~(0x3f << 26);
>>> +    /* set div_ref bit field */
>>> +    val |= pin->div_ref << 26;
>>> +    writel(val, reg);
>>> +
>>> +    val = readl(reg + 4);
>>> +    /* clear loopc bit field */
>>> +    val &= ~0x0fff;
>>> +    /* set loopc bit field */
>>> +    val |= pin->loopc;
>>> +    writel(val, reg + 4);
>>> +
>>> +    /* set div_out */
>>> +    writel(pin->div_out, reg + 8);
>>> +
>>> +    val = readl(reg);
>>> +    /* use this parms configured just now */
>>> +    val |= (1 << 2);
>>> +    /* powerup the PLL */
>>> +    val &= ~(1 << 19);
>>> +    writel(val, reg);
>>> +
>>> +    /* wait pll setup and locked */
>>> +    do {
>>> +        val = readl(reg);
>>> +        locked = val & 0x10000;
>>> +        counter++;
>>> +    } while (!locked && (counter < 2000));
>>> +
>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>> +
>>> +    /* Switch to software configured PLL instead of refclk */
>>> +    val |= 1;
>>> +    writel(val, reg);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/*
>>> + * Update the pll parameters to hardware, target to the pixpll in 
>>> ls2k0500
>>> + *
>>> + * @this: point to the object which calling this function
>>> + * @param: pointer to where the parameters passed in
>>> + *
>>> + * return 0 if successful.
>>> + */
>>> +static int ls2k0500_pixpll_param_update(struct lsdc_pll * const this,
>>> +                    struct lsdc_pll_parms const *param)
>>> +{
>>> +    void __iomem *reg = this->mmio;
>>> +    unsigned int counter = 0;
>>> +    bool locked = false;
>>> +    u32 val;
>>> +
>>> +    /* Bypass the software configured PLL, using refclk directly */
>>> +    val = readl(reg);
>>> +    val &= ~(1 << 0);
>>> +    writel(val, reg);
>>> +
>>> +    /* Powerdown the PLL */
>>> +    val = readl(reg);
>>> +    val |= (1 << 5);
>>> +    writel(val, reg);
>>> +
>>> +    /* Allow the software configuration */
>>> +    val |= (1 << 3);
>>> +    writel(val, reg);
>>> +
>>> +    /* Update the pll params */
>>> +    val = (param->div_out << 24) |
>>> +          (param->loopc << 16) |
>>> +          (param->div_ref << 8);
>>> +
>>> +    writel(val, reg);
>>> +
>>> +    /* Powerup the PLL */
>>> +    val = readl(reg);
>>> +    val &= ~(1 << 5);
>>> +    writel(val, reg);
>>> +
>>> +    /* wait pll setup and locked */
>>> +    do {
>>> +        val = readl(reg);
>>> +        locked = val & 0x80;
>>> +        counter++;
>>> +    } while (!locked && (counter < 10000));
>>> +
>>> +    drm_dbg(this->ddev, "%u loop waited\n", counter);
>>> +
>>> +    /* Switch to software configured PLL instead of refclk */
>>> +    writel((val | 1), reg);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static unsigned int lsdc_get_clock_rate(struct lsdc_pll * const this,
>>> +                    struct lsdc_pll_parms *pout)
>>> +{
>>> +    struct drm_device *ddev = this->ddev;
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    const struct lsdc_desc * const descp = ldev->descp;
>>> +    unsigned int out;
>>> +    union lsdc_pixpll_bitmap parms;
>>> +
>>> +    if (descp->chip == CHIP_LS7A1000 || descp->chip == 
>>> CHIP_LS7A2000) {
>>> +        struct ls7a1000_pixpll_bitmap *obj = &parms.ls7a1000;
>>> +
>>> +        parms.dword[0] = readl(this->mmio);
>>> +        parms.dword[1] = readl(this->mmio + 4);
>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>> obj->div_out;
>>> +        if (pout) {
>>> +            pout->div_ref = obj->div_ref;
>>> +            pout->loopc = obj->loopc;
>>> +            pout->div_out = obj->div_out;
>>> +        }
>>> +    } else if (descp->chip == CHIP_LS2K1000) {
>>> +        struct ls2k1000_pixpll_bitmap *obj = &parms.ls2k1000;
>>> +
>>> +        parms.dword[0] = readl(this->mmio);
>>> +        parms.dword[1] = readl(this->mmio + 4);
>>> +        parms.dword[2] = readl(this->mmio + 8);
>>> +        parms.dword[3] = readl(this->mmio + 12);
>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>> obj->div_out;
>>> +        if (pout) {
>>> +            pout->div_ref = obj->div_ref;
>>> +            pout->loopc = obj->loopc;
>>> +            pout->div_out = obj->div_out;
>>> +        }
>>> +    } else if (descp->chip == CHIP_LS2K0500) {
>>> +        struct ls2k0500_pixpll_bitmap *obj = &parms.ls2k0500;
>>> +
>>> +        parms.dword[0] = readl(this->mmio);
>>> +        out = this->ref_clock / obj->div_ref * obj->loopc / 
>>> obj->div_out;
>>> +        if (pout) {
>>> +            pout->div_ref = obj->div_ref;
>>> +            pout->loopc = obj->loopc;
>>> +            pout->div_out = obj->div_out;
>>> +        }
>>> +    } else {
>>> +        drm_err(ddev, "unknown chip, the driver need update\n");
>>> +        return 0;
>>> +    }
>>> +
>>> +    return out;
>>> +}
>>> +
>>> +static const struct lsdc_pixpll_funcs ls7a1000_pixpll_funcs = {
>>> +    .setup = lsdc_pixpll_setup,
>>> +    .compute = lsdc_pixpll_compute,
>>> +    .update = ls7a1000_pixpll_param_update,
>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>> +};
>>> +
>>> +static const struct lsdc_pixpll_funcs ls2k1000_pixpll_funcs = {
>>> +    .setup = lsdc_pixpll_setup,
>>> +    .compute = lsdc_pixpll_compute,
>>> +    .update = ls2k1000_pixpll_param_update,
>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>> +};
>>> +
>>> +static const struct lsdc_pixpll_funcs ls2k0500_pixpll_funcs = {
>>> +    .setup = lsdc_pixpll_setup,
>>> +    .compute = lsdc_pixpll_compute,
>>> +    .update = ls2k0500_pixpll_param_update,
>>> +    .get_clock_rate = lsdc_get_clock_rate,
>>> +};
>>> +
>>> +int lsdc_pixpll_init(struct lsdc_pll * const this,
>>> +             struct drm_device *ddev,
>>> +             unsigned int index)
>>> +{
>>> +    struct lsdc_device *ldev = to_lsdc(ddev);
>>> +    const struct lsdc_desc *descp = ldev->descp;
>>> +
>>> +    this->ddev = ddev;
>>> +    this->index = index;
>>> +    this->ref_clock = LSDC_PLL_REF_CLK;
>>> +
>>> +    /* LS7A1000 and LS7A2000's pixpll setting registers is same */
>>> +    if (descp->chip == CHIP_LS7A2000 || descp->chip == 
>>> CHIP_LS7A1000) {
>>> +        if (index == 0)
>>> +            this->reg_base = LS7A1000_CFG_REG_BASE + 
>>> LS7A1000_PIX_PLL0_REG;
>>> +        else if (index == 1)
>>> +            this->reg_base = LS7A1000_CFG_REG_BASE + 
>>> LS7A1000_PIX_PLL1_REG;
>>> +        this->reg_size = 8;
>>> +        this->funcs = &ls7a1000_pixpll_funcs;
>>> +    } else if (descp->chip == CHIP_LS2K1000) {
>>> +        if (index == 0)
>>> +            this->reg_base = LS2K1000_CFG_REG_BASE + 
>>> LS2K1000_PIX_PLL0_REG;
>>> +        else if (index == 1)
>>> +            this->reg_base = LS2K1000_CFG_REG_BASE + 
>>> LS2K1000_PIX_PLL1_REG;
>>> +
>>> +        this->reg_size = 16;
>>> +        this->funcs = &ls2k1000_pixpll_funcs;
>>> +    } else if (descp->chip == CHIP_LS2K0500) {
>>> +        if (index == 0)
>>> +            this->reg_base = LS2K0500_CFG_REG_BASE + 
>>> LS2K0500_PIX_PLL0_REG;
>>> +        else if (index == 1)
>>> +            this->reg_base = LS2K0500_CFG_REG_BASE + 
>>> LS2K0500_PIX_PLL1_REG;
>>> +
>>> +        this->reg_size = 4;
>>> +        this->funcs = &ls2k0500_pixpll_funcs;
>>> +    } else {
>>> +        drm_err(this->ddev, "unknown chip, the driver need update\n");
>>> +        return -ENOENT;
>>> +    }
>>> +
>>> +    return this->funcs->setup(this);
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_pll.h 
>>> b/drivers/gpu/drm/lsdc/lsdc_pll.h
>>> new file mode 100644
>>> index 000000000000..538739f461f2
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_pll.h
>>> @@ -0,0 +1,78 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +
>>> +#ifndef __LSDC_PLL_H__
>>> +#define __LSDC_PLL_H__
>>> +
>>> +#include <drm/drm_device.h>
>>> +
>>> +/*
>>> + * Loongson Pixel PLL hardware structure
>>> + *
>>> + * refclk: reference frequency, 100 MHz from external oscillator
>>> + * outclk: output frequency desired.
>>> + *
>>> + *
>>> + *               L1       Fref                      Fvco L2
>>> + * refclk   +-----------+      +------------------+ +---------+   
>>> outclk
>>> + * ---+---> | Prescaler | ---> | Clock Multiplier | ---> | divider 
>>> | -------->
>>> + *    |     +-----------+      +------------------+ +---------+     ^
>>> + *    |           ^                      ^ ^          |
>>> + *    |           |                      | |          |
>>> + *    |           |                      | |          |
>>> + *    |        div_ref                 loopc div_out       |
>>> + * | |
>>> + *    +--- sel_out (bypass above software configurable clock if 
>>> set) ----+
>>> + *
>>> + *  sel_out: PLL clock output selector (for debug purpose only).
>>> + *
>>> + *  If sel_out == 1, it will take refclk as output directly,
>>> + *  the L1 Prescaler and the out divider will be bypassed.
>>> + *
>>> + *  If sel_out == 0, then outclk = refclk / div_ref * loopc / div_out;
>>> + *
>>> + * PLL working requirements:
>>> + *
>>> + *  1) 20 MHz <= refclk / div_ref <= 40Mhz
>>> + *  2) 1.2 GHz <= refclk /div_out * loopc <= 3.2 Ghz
>>> + */
>>> +
>>> +struct lsdc_pll_parms {
>>> +    unsigned int div_ref;
>>> +    unsigned int loopc;
>>> +    unsigned int div_out;
>>> +};
>>> +
>>> +struct lsdc_pll;
>>> +
>>> +struct lsdc_pixpll_funcs {
>>> +    int (*setup)(struct lsdc_pll * const this);
>>> +    bool (*compute)(struct lsdc_pll * const this,
>>> +            unsigned int clock,
>>> +            struct lsdc_pll_parms *pout);
>>> +    int (*update)(struct lsdc_pll * const this,
>>> +              struct lsdc_pll_parms const *pin);
>>> +    unsigned int (*get_clock_rate)(struct lsdc_pll * const this,
>>> +                       struct lsdc_pll_parms *pout);
>>> +};
>>> +
>>> +struct lsdc_pll {
>>> +    const struct lsdc_pixpll_funcs *funcs;
>>> +    struct drm_device *ddev;
>>> +    void __iomem *mmio;
>>> +
>>> +    /* PLL register offset */
>>> +    u32 reg_base;
>>> +    /* PLL register size in bytes */
>>> +    u32 reg_size;
>>> +
>>> +    /* 100000kHz, fixed on all board found */
>>> +    unsigned int ref_clock;
>>> +
>>> +    unsigned int index;
>>> +};
>>> +
>>> +int lsdc_pixpll_init(struct lsdc_pll * const this,
>>> +             struct drm_device *ddev,
>>> +             unsigned int index);
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.c 
>>> b/drivers/gpu/drm/lsdc/lsdc_regs.c
>>> new file mode 100644
>>> index 000000000000..c7950c43968f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_regs.c
>>> @@ -0,0 +1,29 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include "lsdc_drv.h"
>>> +#include "lsdc_regs.h"
>>> +
>>> +u32 lsdc_rreg32(struct lsdc_device * const ldev, u32 offset)
>>> +{
>>> +    unsigned long flags;
>>> +    u32 ret;
>>> +
>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>> +
>>> +    ret = readl(ldev->reg_base + offset);
>>> +
>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +void lsdc_wreg32(struct lsdc_device * const ldev, u32 offset, u32 val)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    spin_lock_irqsave(&ldev->reglock, flags);
>>> +
>>> +    writel(val, ldev->reg_base + offset);
>>> +
>>> +    spin_unlock_irqrestore(&ldev->reglock, flags);
>>> +}
>>> diff --git a/drivers/gpu/drm/lsdc/lsdc_regs.h 
>>> b/drivers/gpu/drm/lsdc/lsdc_regs.h
>>> new file mode 100644
>>> index 000000000000..828956633137
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/lsdc/lsdc_regs.h
>>> @@ -0,0 +1,296 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +
>>> +#ifndef __LSDC_REGS_H__
>>> +#define __LSDC_REGS_H__
>>> +
>>> +#include <linux/bitops.h>
>>> +#include <linux/types.h>
>>> +
>>> +/*
>>> + * PIXEL PLL Reference clock
>>> + */
>>> +#define LSDC_PLL_REF_CLK                100000           /* kHz */
>>> +
>>> +/*
>>> + * Those PLL registers are not located at DC reg bar space,
>>> + * there are relative to LSXXXXX_CFG_REG_BASE.
>>> + * XXXXX = 7A1000, 2K1000, 2K0500
>>> + */
>>> +
>>> +/* LS2K1000 */
>>> +#define LS2K1000_PIX_PLL0_REG           0x04B0
>>> +#define LS2K1000_PIX_PLL1_REG           0x04C0
>>> +#define LS2K1000_CFG_REG_BASE           0x1fe10000
>>> +
>>> +/* LS7A1000 and LS2K2000 */
>>> +#define LS7A1000_PIX_PLL0_REG           0x04B0
>>> +#define LS7A1000_PIX_PLL1_REG           0x04C0
>>> +#define LS7A1000_CFG_REG_BASE           0x10010000
>>> +
>>> +/* LS2K0500 */
>>> +#define LS2K0500_PIX_PLL0_REG           0x0418
>>> +#define LS2K0500_PIX_PLL1_REG           0x0420
>>> +#define LS2K0500_CFG_REG_BASE           0x1fe10000
>>> +
>>> +/*
>>> + *  CRTC CFG REG
>>> + */
>>> +#define CFG_PIX_FMT_MASK                GENMASK(2, 0)
>>> +
>>> +enum lsdc_pixel_format {
>>> +    LSDC_PF_NONE = 0,
>>> +    LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4 bits each [16 
>>> bits] */
>>> +    LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits [16 bits] */
>>> +    LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
>>> +    LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
>>> +    LSDC_PF_RGBA8888 = 5,  /* ARGB [32 bits] */
>>> +};
>>> +
>>> +/*
>>> + * Each crtc has two set fb address registers usable, 
>>> CFG_FB_IN_USING of
>>> + * LSDC_CRTCx_CFG_REG specify which fb address register is currently
>>> + * in using by the CRTC. CFG_PAGE_FLIP of LSDC_CRTCx_CFG_REG is 
>>> used to
>>> + * trigger the switch which will be finished at the very vblank. If 
>>> you
>>> + * want it switch to another again, you must set CFG_PAGE_FLIP again.
>>> + */
>>> +#define CFG_PAGE_FLIP                   BIT(7)
>>> +#define CFG_OUTPUT_EN                   BIT(8)
>>> +/* CRTC0 clone from CRTC1 or CRTC1 clone from CRTC0 using hardware 
>>> logic */
>>> +#define CFG_PANEL_SWITCH                BIT(9)
>>> +/* Indicate witch fb addr reg is in using, currently */
>>> +#define CFG_FB_IN_USING                 BIT(11)
>>> +#define CFG_GAMMA_EN                    BIT(12)
>>> +
>>> +/* CRTC get soft reset if voltage level change from 1 -> 0 */
>>> +#define CFG_RESET_N                     BIT(20)
>>> +
>>> +#define CFG_HSYNC_EN                    BIT(30)
>>> +#define CFG_HSYNC_INV                   BIT(31)
>>> +#define CFG_VSYNC_EN                    BIT(30)
>>> +#define CFG_VSYNC_INV                   BIT(31)
>>> +
>>> +/* THE DMA step of the DC in LS7A2000 is configurable */
>>> +#define LSDC_DMA_STEP_MASK              GENMASK(17, 16)
>>> +enum lsdc_dma_steps_supported {
>>> +    LSDC_DMA_STEP_256_BYTES = 0,
>>> +    LSDC_DMA_STEP_128_BYTES = 1,
>>> +    LSDC_DMA_STEP_64_BYTES = 2,
>>> +    LSDC_DMA_STEP_32_BYTES = 3,
>>> +};
>>> +
>>> +/******** CRTC0 & DVO0 ********/
>>> +#define LSDC_CRTC0_CFG_REG              0x1240
>>> +#define LSDC_CRTC0_FB0_LO_ADDR_REG      0x1260
>>> +#define LSDC_CRTC0_FB0_HI_ADDR_REG      0x15A0
>>> +#define LSDC_CRTC0_FB1_LO_ADDR_REG      0x1580
>>> +#define LSDC_CRTC0_FB1_HI_ADDR_REG      0x15C0
>>> +#define LSDC_CRTC0_STRIDE_REG           0x1280
>>> +#define LSDC_CRTC0_FB_ORIGIN_REG        0x1300
>>> +#define LSDC_CRTC0_HDISPLAY_REG         0x1400
>>> +#define LSDC_CRTC0_HSYNC_REG            0x1420
>>> +#define LSDC_CRTC0_VDISPLAY_REG         0x1480
>>> +#define LSDC_CRTC0_VSYNC_REG            0x14A0
>>> +#define LSDC_CRTC0_GAMMA_INDEX_REG      0x14E0
>>> +#define LSDC_CRTC0_GAMMA_DATA_REG       0x1500
>>> +
>>> +/******** CTRC1 & DVO1 ********/
>>> +#define LSDC_CRTC1_CFG_REG              0x1250
>>> +#define LSDC_CRTC1_FB0_LO_ADDR_REG      0x1270
>>> +#define LSDC_CRTC1_FB0_HI_ADDR_REG      0x15B0
>>> +#define LSDC_CRTC1_FB1_LO_ADDR_REG      0x1590
>>> +#define LSDC_CRTC1_FB1_HI_ADDR_REG      0x15D0
>>> +#define LSDC_CRTC1_STRIDE_REG           0x1290
>>> +#define LSDC_CRTC1_FB_ORIGIN_REG        0x1310
>>> +#define LSDC_CRTC1_HDISPLAY_REG         0x1410
>>> +#define LSDC_CRTC1_HSYNC_REG            0x1430
>>> +#define LSDC_CRTC1_VDISPLAY_REG         0x1490
>>> +#define LSDC_CRTC1_VSYNC_REG            0x14B0
>>> +#define LSDC_CRTC1_GAMMA_INDEX_REG      0x14F0
>>> +#define LSDC_CRTC1_GAMMA_DATA_REG       0x1510
>>> +
>>> +/*
>>> + * LS7A2000 has the hardware which record the scan position of the 
>>> CRTC
>>> + * [31:16] : current X position, [15:0] : current Y position
>>> + */
>>> +#define LSDC_CRTC0_SCAN_POS_REG         0x14C0
>>> +#define LSDC_CRTC1_SCAN_POS_REG         0x14D0
>>> +
>>> +/*
>>> + * LS7A2000 has the hardware which count the number of vblank 
>>> generated
>>> + */
>>> +#define LSDC_CRTC0_VSYNC_COUNTER_REG    0x1A00
>>> +#define LSDC_CRTC1_VSYNC_COUNTER_REG    0x1A10
>>> +
>>> +/* In all, LSDC_CRTC1_XXX_REG - LSDC_CRTC0_XXX_REG = 0x10 */
>>> +
>>> +/*
>>> + * There is only one hardware cursor unit in ls7a1000, ls2k1000 and 
>>> ls2k0500.
>>> + * well, ls7a2000 has two hardware cursor unit.
>>> + */
>>> +#define CURSOR_FORMAT_MASK              GENMASK(1, 0)
>>> +enum lsdc_cursor_format {
>>> +    CURSOR_FORMAT_DISABLE = 0,
>>> +    CURSOR_FORMAT_MONOCHROME = 1,
>>> +    CURSOR_FORMAT_ARGB8888 = 2,
>>> +};
>>> +
>>> +#define CURSOR_SIZE_64X64               BIT(2)
>>> +#define CURSOR_LOCATION                 BIT(4)
>>> +
>>> +#define LSDC_CURSOR0_CFG_REG            0x1520
>>> +#define LSDC_CURSOR0_ADDR_LO_REG        0x1530
>>> +#define LSDC_CURSOR0_ADDR_HI_REG        0x15e0
>>> +#define LSDC_CURSOR0_POSITION_REG       0x1540
>>> +#define LSDC_CURSOR0_BG_COLOR_REG       0x1550  /* background color */
>>> +#define LSDC_CURSOR0_FG_COLOR_REG       0x1560  /* foreground color */
>>> +
>>> +#define LSDC_CURSOR1_CFG_REG            0x1670
>>> +#define LSDC_CURSOR1_ADDR_LO_REG        0x1680
>>> +#define LSDC_CURSOR1_ADDR_HI_REG        0x16e0
>>> +#define LSDC_CURSOR1_POSITION_REG       0x1690  /* [31:16] Y, 
>>> [15:0] X */
>>> +#define LSDC_CURSOR1_BG_COLOR_REG       0x16A0  /* background color */
>>> +#define LSDC_CURSOR1_FG_COLOR_REG       0x16B0  /* foreground color */
>>> +
>>> +/*
>>> + * DC Interrupt Control Register, 32bit, Address Offset: 1570
>>> + *
>>> + * Bits 15:0 inidicate the interrupt status
>>> + * Bits 31:16 control enable interrupts corresponding to bit 15:0 
>>> or not
>>> + * Write 1 to enable, write 0 to disable
>>> + *
>>> + * RF: Read Finished
>>> + * IDBU: Internal Data Buffer Underflow
>>> + * IDBFU: Internal Data Buffer Fatal Underflow
>>> + * CBRF: Cursor Buffer Read Finished Flag, no use.
>>> + *
>>> + * 
>>> +-------+--------------------------+-------+--------+--------+-------+
>>> + * | 31:27 |         26:16            | 15:11 |   10   |   9 |   8   |
>>> + * 
>>> +-------+--------------------------+-------+--------+--------+-------+
>>> + * |  N/A  | Interrupt Enable Control |  N/A  | IDBFU0 | IDBFU1 | 
>>> IDBU0 |
>>> + * 
>>> +-------+--------------------------+-------+--------+--------+-------+
>>> + *
>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>> + * |   7   |  6  |  5  |  4   |   3    |   2    |   1    | 0    |
>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>> + * | IDBU1 | RF0 | RF1 | CRRF | HSYNC0 | VSYNC0 | HSYNC1 | VSYNC1 |
>>> + * +-------+-----+-----+------+--------+--------+--------+--------+
>>> + */
>>> +
>>> +#define LSDC_INT_REG                    0x1570
>>> +
>>> +#define INT_CRTC0_VSYNC                 BIT(2)
>>> +#define INT_CRTC0_HSYNC                 BIT(3)
>>> +#define INT_CRTC0_RF                    BIT(6)
>>> +#define INT_CRTC0_IDBU                  BIT(8)
>>> +#define INT_CRTC0_IDBFU                 BIT(10)
>>> +
>>> +#define INT_CRTC1_VSYNC                 BIT(0)
>>> +#define INT_CRTC1_HSYNC                 BIT(1)
>>> +#define INT_CRTC1_RF                    BIT(5)
>>> +#define INT_CRTC1_IDBU                  BIT(7)
>>> +#define INT_CRTC1_IDBFU                 BIT(9)
>>> +
>>> +#define INT_CRTC0_VS_EN                 BIT(18)
>>> +#define INT_CRTC0_HS_EN                 BIT(19)
>>> +#define INT_CRTC0_RF_EN                 BIT(22)
>>> +#define INT_CRTC0_IDBU_EN               BIT(24)
>>> +#define INT_CRTC0_IDBFU_EN              BIT(26)
>>> +
>>> +#define INT_CRTC1_VS_EN                 BIT(16)
>>> +#define INT_CRTC1_HS_EN                 BIT(17)
>>> +#define INT_CRTC1_RF_EN                 BIT(21)
>>> +#define INT_CRTC1_IDBU_EN               BIT(23)
>>> +#define INT_CRTC1_IDBFU_EN              BIT(25)
>>> +
>>> +#define INT_STATUS_MASK                 GENMASK(15, 0)
>>> +
>>> +/*
>>> + * LS7A1000/LS7A2000 have 4 gpios which are used to emulated I2C.
>>> + * They are under control of the LS7A_DC_GPIO_DAT_REG and 
>>> LS7A_DC_GPIO_DIR_REG
>>> + * register, Those GPIOs has no relationship whth the GPIO hardware 
>>> on the
>>> + * bridge chip itself. Those offsets are relative to DC register 
>>> base address
>>> + *
>>> + * LS2k1000 and LS2K0500 don't have those registers, they use 
>>> hardware i2c
>>> + * or general GPIO emulated i2c from linux i2c subsystem.
>>> + *
>>> + * GPIO data register, address offset: 0x1650
>>> + *   +---------------+-----------+-----------+
>>> + *   | 7 | 6 | 5 | 4 |  3  |  2  |  1  |  0  |
>>> + *   +---------------+-----------+-----------+
>>> + *   |               |    DVO1   |    DVO0   |
>>> + *   +      N/A      +-----------+-----------+
>>> + *   |               | SCL | SDA | SCL | SDA |
>>> + *   +---------------+-----------+-----------+
>>> + */
>>> +#define LS7A_DC_GPIO_DAT_REG            0x1650
>>> +
>>> +/*
>>> + *  GPIO Input/Output direction control register, address offset: 
>>> 0x1660
>>> + */
>>> +#define LS7A_DC_GPIO_DIR_REG            0x1660
>>> +
>>> +/*
>>> + *  LS7A2000 has two built-in HDMI Encoder and one VGA encoder
>>> + */
>>> +
>>> +/*
>>> + * Number of continuous packets may be present
>>> + * in HDMI hblank and vblank zone, should >= 48
>>> + */
>>> +#define LSDC_HDMI0_ZONE_REG             0x1700
>>> +#define LSDC_HDMI1_ZONE_REG             0x1710
>>> +
>>> +#define HDMI_INTERFACE_EN               BIT(0)
>>> +#define HDMI_PACKET_EN                  BIT(1)
>>> +#define HDMI_AUDIO_EN                   BIT(2)
>>> +#define HDMI_VIDEO_PREAMBLE_MASK        GENMASK(7, 4)
>>> +#define HDMI_HW_I2C_EN                  BIT(8)
>>> +#define HDMI_CTL_PERIOD_MODE            BIT(9)
>>> +#define LSDC_HDMI0_CTRL_REG             0x1720
>>> +#define LSDC_HDMI1_CTRL_REG             0x1730
>>> +
>>> +#define HDMI_PHY_EN                     BIT(0)
>>> +#define HDMI_PHY_RESET_N                BIT(1)
>>> +#define HDMI_PHY_TERM_L_EN              BIT(8)
>>> +#define HDMI_PHY_TERM_H_EN              BIT(9)
>>> +#define HDMI_PHY_TERM_DET_EN            BIT(10)
>>> +#define HDMI_PHY_TERM_STATUS            BIT(11)
>>> +#define LSDC_HDMI0_PHY_CTRL_REG         0x1800
>>> +#define LSDC_HDMI1_PHY_CTRL_REG         0x1810
>>> +
>>> +/*
>>> + *  IDF: Input Division Factor
>>> + *  ODF: Output Division Factor
>>> + *   LF: Loop Factor
>>> + *    M: Required Mult
>>> + *
>>> + * +--------------------------------------------------------+
>>> + *  |     Fin (kHZ)     | M  | IDF | LF | ODF |   Fout(Mhz) |
>>> + * |-------------------+----+-----+----+-----+--------------|
>>> + *  |  170000 ~ 340000  | 10 | 16  | 40 |  1  | 1700 ~ 3400 |
>>> + *  |   85000 ~ 170000  | 10 |  8  | 40 |  2  |  850 ~ 1700 |
>>> + *  |   42500 ~  85000  | 10 |  4  | 40 |  4  |  425 ~ 850 |
>>> + *  |   21250 ~  42500  | 10 |  2  | 40 |  8  | 212.5 ~ 425 |
>>> + *  |   20000 ~  21250  | 10 |  1  | 40 | 16  |  200 ~ 212.5 |
>>> + * +--------------------------------------------------------+
>>> + */
>>> +#define LSDC_HDMI0_PHY_PLL_REG          0x1820
>>> +#define LSDC_HDMI1_PHY_PLL_REG          0x1830
>>> +
>>> +#define HDMI_PLL_ENABLE                 BIT(0)
>>> +#define HDMI_PLL_LOCKED                 BIT(16)
>>> +#define HDMI_PLL_BYPASS                 BIT(17)
>>> +
>>> +#define HDMI_PLL_IDF_SHIFT              1
>>> +#define HDMI_PLL_IDF_MASK               GENMASK(5, 1)
>>> +#define HDMI_PLL_LF_SHIFT               6
>>> +#define HDMI_PLL_LF_MASK                GENMASK(12, 6)
>>> +#define HDMI_PLL_ODF_SHIFT              13
>>> +#define HDMI_PLL_ODF_MASK               GENMASK(15, 13)
>>> +
>>> +/* LS7A2000 have hpd support */
>>> +#define LSDC_HDMI_HPD_STATUS_REG        0x1BA0
>>> +#define HDMI0_HPD_FLAG                  BIT(0)
>>> +#define HDMI1_HPD_FLAG                  BIT(1)
>>> +
>>> +#endif
>>
>
