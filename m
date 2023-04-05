Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7A96D79D1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 12:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85E10E8B3;
	Wed,  5 Apr 2023 10:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3773A10E8B9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 10:36:59 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:45396.591263666
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id B48D2100212;
 Wed,  5 Apr 2023 18:36:54 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 fa906cc8fb9f4f46a2ec08ab67748914 for javierm@redhat.com; 
 Wed, 05 Apr 2023 18:36:56 CST
X-Transaction-ID: fa906cc8fb9f4f46a2ec08ab67748914
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <99489e62-c4c4-ee82-5a47-d0e74cabc124@189.cn>
Date: Wed, 5 Apr 2023 18:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] video/aperture: fix typos
From: Sui Jingfeng <15330273260@189.cn>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>, Christian Koenig <christian.koenig@amd.com>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
 <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
 <87zg7ndi57.fsf@minerva.mail-host-address-is-not-set>
 <fabb3433-e8f1-f162-891b-8aac28ef7662@189.cn>
Content-Language: en-US
In-Reply-To: <fabb3433-e8f1-f162-891b-8aac28ef7662@189.cn>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/4/5 17:55, Sui Jingfeng wrote:
> Hi,
>
> thanks you for the time and effort  for reviewing.
>
> On 2023/4/4 19:03, Javier Martinez Canillas wrote:
>> Javier Martinez Canillas <javierm@redhat.com> writes:
>>
>> [...]
>>
>>>>>        /*
>>>>>         * Remove the device from the device hierarchy. This is the 
>>>>> right thing
>>>>> -     * to do for firmware-based DRM drivers, such as EFI, VESA or 
>>>>> VGA. After
>>>>> +     * to do for firmware-based fb drivers, such as EFI, VESA or 
>>>>> VGA. After
>>>> That sentences is not well phrased. Maybe say 'This is required for
>>>> firmware-provided graphics, such as EFI, VESA or VGA.'
>>>>
>>> Graphic drivers or display drivers would indeed be more accurate 
>>> here. But
>>> I think that "fb drivers" is still well pharsed since the are other 
>>> places
>>> where either fbdev or DRM drivers for firmware-provided framebuffers 
>>> are
>>> named like that.
>>>
>> Sui,
>>
>> Maybe you could post a follow-up patch to improve the comment as 
>> suggested
>> by Thomas?
>>
> Yes, certainly.
>
>
> This is the right thing to do for conflicting drivers takes over the 
> hardware resource required.
>

While the `drivers` include both drm driver and the real device 
dependent framebuffer driver,

They are typically build as kernel module as oppose to the efifb and 
simplefb which is built

into kernel kernel.  Firmware framebuffer is conflict with the drm 
driver is because the memory

region they use overlaps.  If there no overlap, then no `taken over`  
will be happen.


By the way,  I'm asked to made efifb and simplefb works on LoongArch and 
Mips platform in the past.

We are using downstream kernel(linux-4.19)  at that time. efifb is ony 
works for platform with uefi

firmware support. By ensure that framebuffer locate at the address range 
of the on-board video ram(VRAM)

and passing screen_info parameters to kernel correctly, 
drm_aperture_remove_conflicting_framebuffers

will success. This required the uefi firmware engineer understand this, 
for loongson bridge chip, this need

a small trick.  Simplefb is only tested on loongson SoC platform by 
providing fb parameters in DT which

match the PMON firmware's setting. As the framebuffer may located at 
anywhere in the physical address

space, there no aperture for SoC anymore.  Should call 
aperture_remove_conflicting_devices(0, ~0, false, "drmfb")

to remove them all.


>
> But the comments is actually nearly perfect in overall, it has some 
> difficulty to improve
>
> the perfection.  Below is my personal understanding toward the above 
> sentence.
>
>
> efifb and simplefb belong to the class of firmware based framebuffer 
> driver.
>
> They are generic and platform agnostic, yet they have to relay on the 
> firmware
>
> to passing fb format, fb size, fb base address, fb resolution and fb 
> stride etc to the kernel.
>
> Linux kernel using those information to fill the global screen_info 
> structure.
>
> sysfb_init() then using the global screen_info to  create a platform 
> device,
>
> the device will be claimed by efifb or simplefb driver finally. This 
> is a hand over solution.
>
> It relay on the firmware setup such a framebuffer and hand over the 
> state(this is
>
> actually a kind of modeset state) to kernel.
>
>
> efifb only own the potential hardware resource for a very short time if a
>
> conflicting drm driver probe successfully.
>
>
> For the platform/graphics without  a drm driver, developers may choose to
>
> use efifb driver as a replacement.  So, there are no conflicting 
> happen on
>
> such a case. The `nomodeset` kernel cmd options can also be used for
>
> debugging and testing purpose if the more intelligent drm driver is 
> broken
>
> due to bugs.
>
