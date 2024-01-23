Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21417838A9A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 10:45:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489BB10E741;
	Tue, 23 Jan 2024 09:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4844E10E72E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 09:45:02 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rSDKw-0000FO-6t; Tue, 23 Jan 2024 10:44:54 +0100
Message-ID: <e8ef361d-71e4-402b-a891-bab9135e93fd@leemhuis.info>
Date: Tue, 23 Jan 2024 10:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Huacai Chen
 <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de> <87il3ko2fu.fsf@intel.com>
 <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
In-Reply-To: <3b0ab7e1-a28b-4dc6-a789-dccecaea7800@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1706003102;
 4eda2ebb; 
X-HE-SMSGID: 1rSDKw-0000FO-6t
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
Cc: Jaak Ristioja <jaak@ristioja.ee>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23.01.24 10:17, Thorsten Leemhuis wrote:
> On 23.01.24 09:53, Jani Nikula wrote:
>> On Wed, 08 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>
>>> thanks for the patch.
>>>
>>> Am 08.11.23 um 03:46 schrieb Huacai Chen:
>>>> After commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
>>>> device_initcall to subsys_initcall_sync") some Lenovo laptops get a blank
>>>> screen until the display manager starts.
>>>>
>>>> This regression occurs with such a Kconfig combination:
>>>> CONFIG_SYSFB=y
>>>> CONFIG_SYSFB_SIMPLEFB=y
>>>> CONFIG_DRM_SIMPLEDRM=y
>>>> CONFIG_DRM_I915=y      # Or other native drivers such as radeon, amdgpu
>>>>
>>>> If replace CONFIG_DRM_SIMPLEDRM with CONFIG_FB_SIMPLE (they use the same
>>>> device), there is no blank screen. The root cause is the initialization
>>>> order, and this order depends on the Makefile.
>>>>
>>>> FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
>>>> so on), but DRM_SIMPLEDRM is after them. Thus, if we use FB_SIMPLE, I915
>>>> will takeover FB_SIMPLE, then no problem; and if we use DRM_SIMPLEDRM,
>>>> DRM_SIMPLEDRM will try to takeover I915, but fails to work.
>>>
>>> But what exactly is the problem? From the lengthy discussion threat, it 
>>> looks like you've stumbled across a long-known problem, where the 
>>> firmware driver probes a device that has already been taken by a native 
>>> driver. But that should not be possible.
>>>
>>> As you know, there's a platform device that represents the firmware 
>>> framebuffer. The firmware drivers, such as simpledrm, bind to it. In 
>>> i915 and the other native drivers we remove that platform device, so 
>>> that simpledrm does not run.
>>
>> The problem is still not resolved. Another bug report at [1].
>>
>> The commit message here points at 60aebc955949 ("drivers/firmware: Move
>> sysfb_init() from device_initcall to subsys_initcall_sync") as
>> regressing, and Jaak also bisected it (see Closes:).
>>
>> I agree the patch here is just papering over the issue, but lacking a
>> proper fix, for months, a revert would be in order, no?
>>
>> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/10133
> 
> Interesting.
> 
> JFYI for those that don't follow this closely: Huacai Chen proposed a
> fix

Sorry, I did not look closely and misremembered: that was not a fix, it
was just a test patch for gather more data for debugging.

Ciao, Thorsten

> and asked a earlier reporter to test it, but afaics heard nothing back:
> 
> https://lore.kernel.org/all/CAAhV-H5eXM7FNzuRCMthAziG_jg75XwQV3grpw=sdyJ-9GXgvA@mail.gmail.com/
> 
> That's afaics why this got stuck (and why I didn't request on a escalate
> this weeks ago).
> 
> Ciao, Thorsten
> 
>>> We call the DRM aperture helpers at [1]. It's implemented at [2]. The 
>>> function contains a call to sysfb_disable(), [3] which should be invoked 
>>> for the i915 device and remove the platform device.
>>>
>>> [1] 
>>> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/i915/i915_driver.c#L489
>>> [2] 
>>> https://elixir.bootlin.com/linux/v6.5/source/drivers/video/aperture.c#L347
>>> [3] 
>>> https://elixir.bootlin.com/linux/v6.5/source/drivers/firmware/sysfb.c#L63
>>>
>>> Can you investigate why this does not work? Is sysfb_disable() not being 
>>> called? Does it remove the platform device?
>>>
>>>>
>>>> So we can move the "tiny" directory before native DRM drivers to solve
>>>> this problem.
>>>
>>> Relying on linking order is just as unreliable. The usual workaround is 
>>> to build native drivers as modules. But first, please investigate where 
>>> the current code fails.
>>>
>>> Best regards
>>> Thomas
>>>
>>>>
>>>> Fixes: 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync")
>>>> Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
>>>> Reported-by: Jaak Ristioja <jaak@ristioja.ee>
>>>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>>>> ---
>>>>   drivers/gpu/drm/Makefile | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>>>> index 8e1bde059170..db0f3d3aff43 100644
>>>> --- a/drivers/gpu/drm/Makefile
>>>> +++ b/drivers/gpu/drm/Makefile
>>>> @@ -141,6 +141,7 @@ obj-y			+= arm/
>>>>   obj-y			+= display/
>>>>   obj-$(CONFIG_DRM_TTM)	+= ttm/
>>>>   obj-$(CONFIG_DRM_SCHED)	+= scheduler/
>>>> +obj-y			+= tiny/
>>>>   obj-$(CONFIG_DRM_RADEON)+= radeon/
>>>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
>>>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
>>>> @@ -182,7 +183,6 @@ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>>>>   obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
>>>>   obj-y			+= hisilicon/
>>>>   obj-y			+= mxsfb/
>>>> -obj-y			+= tiny/
>>>>   obj-$(CONFIG_DRM_PL111) += pl111/
>>>>   obj-$(CONFIG_DRM_TVE200) += tve200/
>>>>   obj-$(CONFIG_DRM_XEN) += xen/
>>
