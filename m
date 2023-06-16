Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3220733511
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CF310E102;
	Fri, 16 Jun 2023 15:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7183010E0E3;
 Fri, 16 Jun 2023 15:44:48 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxKupvg4xk8wUGAA--.12861S3;
 Fri, 16 Jun 2023 23:44:47 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxhuRsg4xkqmsdAA--.18023S3; 
 Fri, 16 Jun 2023 23:44:45 +0800 (CST)
Message-ID: <1486f6e9-3123-3c3e-806a-47b9463cb61a@loongson.cn>
Date: Fri, 16 Jun 2023 23:44:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 2/8] PCI/VGA: Deal only with VGA class devices
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>
References: <20230613030151.216625-1-15330273260@189.cn>
 <20230613030151.216625-3-15330273260@189.cn>
 <dbf0d89f-717a-1f78-aef2-f30506751d4d@loongson.cn>
 <CADnq5_N6vVtzH6tzguZdHnP_TdRoG1G-Cr94O+X03jvtk=vhag@mail.gmail.com>
 <3c1c86ab-96ea-aa1c-c9c5-9a4012644fd6@loongson.cn>
 <CADnq5_Px-HWfwetv8LZsCnCeV7SMt_uqtLwMVK7648ZQiP2RCQ@mail.gmail.com>
 <f08b6a76-6c90-b59b-ff43-c779ef759d09@loongson.cn>
 <CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <CADnq5_PFoM2O8mCd6+VFfu9Nc-Hg_HTnwEMxrq0FGRpva1kKiA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxhuRsg4xkqmsdAA--.18023S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Zr4kXFW7uF1fWr1kJF47Awc_yoWkZFyDpF
 W5GFW5tF4DJr1UCr12qw1UXFyYv34rJFy5Xr15Jw1Y9ws0yr1UXryrtr4UC347Jrn5GF12
 vr4UJry7uF15ZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y
 6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/16 22:34, Alex Deucher wrote:
> On Fri, Jun 16, 2023 at 10:22 AM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>
>> On 2023/6/16 21:41, Alex Deucher wrote:
>>> On Fri, Jun 16, 2023 at 3:11 AM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>> Hi,
>>>>
>>>> On 2023/6/16 05:11, Alex Deucher wrote:
>>>>> On Wed, Jun 14, 2023 at 6:50 AM Sui Jingfeng <suijingfeng@loongson.cn> wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 2023/6/13 11:01, Sui Jingfeng wrote:
>>>>>>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>>
>>>>>>> Deal only with the VGA devcie(pdev->class == 0x0300), so replace the
>>>>>>> pci_get_subsys() function with pci_get_class(). Filter the non-PCI display
>>>>>>> device(pdev->class != 0x0300) out. There no need to process the non-display
>>>>>>> PCI device.
>>>>>>>
>>>>>>> Cc: Bjorn Helgaas <bhelgaas@google.com>
>>>>>>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>>>>>>> ---
>>>>>>>      drivers/pci/vgaarb.c | 22 ++++++++++++----------
>>>>>>>      1 file changed, 12 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>>>>>>> index c1bc6c983932..22a505e877dc 100644
>>>>>>> --- a/drivers/pci/vgaarb.c
>>>>>>> +++ b/drivers/pci/vgaarb.c
>>>>>>> @@ -754,10 +754,6 @@ static bool vga_arbiter_add_pci_device(struct pci_dev *pdev)
>>>>>>>          struct pci_dev *bridge;
>>>>>>>          u16 cmd;
>>>>>>>
>>>>>>> -     /* Only deal with VGA class devices */
>>>>>>> -     if ((pdev->class >> 8) != PCI_CLASS_DISPLAY_VGA)
>>>>>>> -             return false;
>>>>>>> -
>>>>>> Hi, here is probably a bug fixing.
>>>>>>
>>>>>> For an example, nvidia render only GPU typically has 0x0380.
>>>>>>
>>>>>> as its PCI class number, but render only GPU should not participate in
>>>>>> the arbitration.
>>>>>>
>>>>>> As it shouldn't snoop the legacy fixed VGA address.
>>>>>>
>>>>>> It(render only GPU) can not display anything.
>>>>>>
>>>>>>
>>>>>> But 0x0380 >> 8 = 0x03, the filter  failed.
>>>>>>
>>>>>>
>>>>>>>          /* Allocate structure */
>>>>>>>          vgadev = kzalloc(sizeof(struct vga_device), GFP_KERNEL);
>>>>>>>          if (vgadev == NULL) {
>>>>>>> @@ -1500,7 +1496,9 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>>>>>>          struct pci_dev *pdev = to_pci_dev(dev);
>>>>>>>          bool notify = false;
>>>>>>>
>>>>>>> -     vgaarb_dbg(dev, "%s\n", __func__);
>>>>>>> +     /* Only deal with VGA class devices */
>>>>>>> +     if (pdev->class != PCI_CLASS_DISPLAY_VGA << 8)
>>>>>>> +             return 0;
>>>>>> So here we only care 0x0300, my initial intent is to make an optimization,
>>>>>>
>>>>>> nowadays sane display graphic card should all has 0x0300 as its PCI
>>>>>> class number, is this complete right?
>>>>>>
>>>>>> ```
>>>>>>
>>>>>> #define PCI_BASE_CLASS_DISPLAY        0x03
>>>>>> #define PCI_CLASS_DISPLAY_VGA        0x0300
>>>>>> #define PCI_CLASS_DISPLAY_XGA        0x0301
>>>>>> #define PCI_CLASS_DISPLAY_3D        0x0302
>>>>>> #define PCI_CLASS_DISPLAY_OTHER        0x0380
>>>>>>
>>>>>> ```
>>>>>>
>>>>>> Any ideas ?
>>>>> I'm not quite sure what you are asking about here.
>>>> To be honest, I'm worried about the PCI devices which has a
>>>>
>>>> PCI_CLASS_DISPLAY_XGA as its PCI class number.
>>>>
>>>> As those devices are very uncommon in the real world.
>>>>
>>>>
>>>> $ find . -name "*.c" -type f | xargs grep "PCI_CLASS_DISPLAY_XGA"
>>>>
>>>>
>>>> Grep the "PCI_CLASS_DISPLAY_XGA" in the linux kernel tree got ZERO,
>>>>
>>>> there no code reference this macro. So I think it seems safe to ignore
>>>> the XGA ?
>>>>
>>>>
>>>> PCI_CLASS_DISPLAY_3D and PCI_CLASS_DISPLAY_OTHER are used to annotate
>>>> the render-only GPU.
>>>>
>>>> And render-only GPU can't decode the fixed VGA address space, it is safe
>>>> to ignore them.
>>>>
>>>>
>>>>>     For vga_arb, we
>>>>> only care about VGA class devices since those should be on the only
>>>>> ones that might have VGA routed to them.
>>>>>     However, as VGA gets deprecated,
>>>> We need the vgaarb for a system with multiple video card.
>>>>
>>>> Not only because some Legacy VGA devices implemented
>>>>
>>>> on PCI will typically have the same "hard-decoded" addresses;
>>>>
>>>> But also these video card need to participate in the arbitration,
>>>>
>>>> determine the default boot device.
>>> But couldn't the boot device be determined via what whatever resources
>>> were used by the pre-OS console?
>> I don't know what you are refer to by saying  pre-OS console, UEFI
>> SHELL,  UEFI GOP  or something like that.
>>
> Right.  Before the OS loads the platform firmware generally sets up
> something for display.  That could be GOP or vesa or some other
> platform specific protocol.
>
>> If you are referring to the framebuffer driver which light up the screen
>> before the Linux kernel is loaded .
>>
>>
>> Then, what you have said is true,  the boot device is determined by the
>> pre-OS console.
>>
>> But the problem is how does the Linux kernel(vgaarb) could know which
>> one is the default boot device
>>
>> on a multiple GPU machine.  Relaying on the firmware fb's address and
>> size is what the mechanism
>>
>> we already in using.
> Right.  It shouldn't need to depend on vgaarb.
>
>>
>>>    I feel like that should be separate from vgaarb.
>> Emm, this really deserved another patch, please ?
>>
>>>    vgaarb should handle PCI VGA routing and some other
>>> mechanism should be used to determine what device provided the pre-OS
>>> console.
>> If the new mechanism need the firmware changed, then this probably break
>> the old machine.
>>
>> Also, this probably will get all arch involved. to get the new mechanism
>> supported.
>>
>> The testing pressure and review power needed is quite large.
>>
>> drm/amdgpu and drm/radeon already being used on X86, ARM64,  Mips and
>> more arch...
>>
>> The reviewing process will became quite difficult then.
>>
>> vgaarb is really what we already in use, and being used more than ten
>> years ...
> Yes, it works for x86 (and a few other platforms) today because of the
> VGA legacy, so we can look at VGA routing to determine this.  But even
> today, we don't need VGA routing to determine what was the primary
> display before starting the OS.  We could probably have a platform
> independent way to handle this by looking at the bread crumbs leftover
> from the pre-OS environment.  E.g., for pre-UEFI platforms, we can
> look at VGA routing.  For UEFI platforms we can look at what GOP left
> us.  For various non-UEFI ARM/PPC/MIPS/etc. platforms we can look at
> whatever breadcrumbs those pre-OS environments left.  That way when
> VGA goes away, we can have a clean break and you won't need vgaarb if
> the platform has no VGA devices.

Yes, I'm complete agree the spirit you are convey here.

Patch 5[1] of this series is actually does what you have told me just now.

I put this function in video/aperture intended.


Its does not rely on "VGA routing".

Its also does not required the display device is PCI vga device.

Platform display controller drivers(drm/ingenic, drm/imx, drm/rockchip etc)

can also call this function(aperture_contain_firmware_fb).

It only require the platform has a firmware framebuffer driver 
registered successfully.

Both EFIFB are SIMPLEFB will be OK.


Beside  this, on systems with a platform display controller device and a 
PCI GPU device,

the current implement may always set the PCI GPU device as the default 
boot device.

This is probably true for the arm64 platform.


On the past, loongson LS2K1000 SoC  has a platform display controller,

the SoC also has PCIE controller, So drm/radeon driver can be used on it.

When discrete card is mounted on the system, the discrete gpu is always been

selected as the default boot device in the past.

Because radeon gpu is more faster, this behavior meet the user's 
expectation by accident.

Its funny and lucky.


But the problem is sometime you want to use the integrated one,

for example in the process of developing driver, or discrete GPU driver

has a bug panic X server,  the user(or the device driver) don't has the 
right to override.


Also with the current implement, even you disable the device driver.

vgaarb still make the decision for you,  which made the X server 
confused and panic.


Say on machine with loongson integrated display controller and a rx5700  
machine.

By passing the cmdline "modprobe.blacklist=amdgpu", then vgaarb will not 
agree.

He still mark the rx5700 as the default boot device. Then X server crash.

Because xf86-video-amdgpu(still loaded) has no root in the kernel do the 
service for it.


I'm doing such a thing because I need developing the drivers for this

integrated display controller, but I don't want unmounted the discrete 
GPU every time.

Because I also need to do the PRIME buffer sharing developing and test.


For AMD APU, this is also the case.

R5 200GE and 3000G processor has the integrated GPU,

On a machine with R5 5600G + nvidia gtx1060, a user may want to compare

which GPU is more powerful. But with the current implement, both the device

driver and the end user don't have a choice.


This is the reason why patch 6, 7 and 8[2] of this series is introduced.

Device driver could do the force override if it isn't the default device.

(by introducing another kernel cmd line)

Because of device driver(.ko) get loaded latter than vgaarb.


So feel free send a reviewed by ?


[1] https://patchwork.freedesktop.org/patch/542253/?series=119250&rev=1

[2] https://patchwork.freedesktop.org/patch/542255/?series=119250&rev=1

> Alex
>
>>
>>> Alex
>>>
>>>> Nowadays, the 'VGA devices' here is stand for the Graphics card
>>>>
>>>> which is capable of display something on the screen.
>>>>
>>>> We still need vgaarb to select the default boot device.
>>>>
>>>>
>>>>> you'll have more non VGA PCI classes for devices which
>>>>> could be the pre-OS console device.
>>>> Ah, we still want  do this(by applying this patch) first,
>>>>
>>>> and then we will have the opportunity to see who will crying if
>>>> something is broken. Will know more then.
>>>>
>>>> But drop this patch or revise it with more consideration is also
>>>> acceptable.
>>>>
>>>>
>>>> I asking about suggestion and/or review.
>>>>
>>>>> Alex
>>>>>
>>>>>>>          /* For now we're only intereted in devices added and removed. I didn't
>>>>>>>           * test this thing here, so someone needs to double check for the
>>>>>>> @@ -1510,6 +1508,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>>>>>>>          else if (action == BUS_NOTIFY_DEL_DEVICE)
>>>>>>>                  notify = vga_arbiter_del_pci_device(pdev);
>>>>>>>
>>>>>>> +     vgaarb_dbg(dev, "%s: action = %lu\n", __func__, action);
>>>>>>> +
>>>>>>>          if (notify)
>>>>>>>                  vga_arbiter_notify_clients();
>>>>>>>          return 0;
>>>>>>> @@ -1534,8 +1534,8 @@ static struct miscdevice vga_arb_device = {
>>>>>>>
>>>>>>>      static int __init vga_arb_device_init(void)
>>>>>>>      {
>>>>>>> +     struct pci_dev *pdev = NULL;
>>>>>>>          int rc;
>>>>>>> -     struct pci_dev *pdev;
>>>>>>>
>>>>>>>          rc = misc_register(&vga_arb_device);
>>>>>>>          if (rc < 0)
>>>>>>> @@ -1545,11 +1545,13 @@ static int __init vga_arb_device_init(void)
>>>>>>>
>>>>>>>          /* We add all PCI devices satisfying VGA class in the arbiter by
>>>>>>>           * default */
>>>>>>> -     pdev = NULL;
>>>>>>> -     while ((pdev =
>>>>>>> -             pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>>>>>>> -                            PCI_ANY_ID, pdev)) != NULL)
>>>>>>> +     while (1) {
>>>>>>> +             pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev);
>>>>>>> +             if (!pdev)
>>>>>>> +                     break;
>>>>>>> +
>>>>>>>                  vga_arbiter_add_pci_device(pdev);
>>>>>>> +     }
>>>>>>>
>>>>>>>          pr_info("loaded\n");
>>>>>>>          return rc;
>>>>>> --
>>>>>> Jingfeng
>>>>>>
>>>> --
>>>> Jingfeng
>>>>
>> --
>> Jingfeng
>>
-- 
Jingfeng

