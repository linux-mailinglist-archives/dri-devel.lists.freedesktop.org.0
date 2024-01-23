Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CA98389B1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 09:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A110E11E;
	Tue, 23 Jan 2024 08:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B6610E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706000044; x=1737536044;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nouvMkw/JPclFvzsPoMX71L7t1/744VZ2+x1KM/V/Nw=;
 b=XA59U4OgnzEtpretzUNkHUl7b7CEIEOvWhFSkAttj4WFA5fX/T9PVEcF
 74mEauYDB8KQaSBF8S8QHkPTRD5WxIpXl04HZQJIRTT1Fs+4B6JyBrCO0
 R88lTSUwCLqdqzEgIoCdHbi18bTLqdTo7tukPuoPiyLZFUf1+N89sUrPb
 1cFMDCHx3Cxsqk+F/dyPnrzQJ/rEFk3vck/4mtXMwvDVlDiCDxMN9+Usf
 0CzMgtYIvkzCu1ZsUW9wAugCM/8KoaNx69Br6b8iDOWEzqPQHm22aZ9ec
 c94MzqAFlmJffjEN51+zJ5T7GjDBhcfJc+9gWdac838JmZ19VRA2WfRxJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1351527"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="1351527"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 00:54:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="735500245"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; d="scan'208";a="735500245"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 00:54:00 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Huacai Chen
 <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
In-Reply-To: <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
Date: Tue, 23 Jan 2024 10:53:57 +0200
Message-ID: <87il3ko2fu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jaak Ristioja <jaak@ristioja.ee>,
 "Linux regression tracking \(Thorsten Leemhuis\)"
 <regressions@leemhuis.info>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi,
>
> thanks for the patch.
>
> Am 08.11.23 um 03:46 schrieb Huacai Chen:
>> After commit 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from
>> device_initcall to subsys_initcall_sync") some Lenovo laptops get a blank
>> screen until the display manager starts.
>> 
>> This regression occurs with such a Kconfig combination:
>> CONFIG_SYSFB=y
>> CONFIG_SYSFB_SIMPLEFB=y
>> CONFIG_DRM_SIMPLEDRM=y
>> CONFIG_DRM_I915=y      # Or other native drivers such as radeon, amdgpu
>> 
>> If replace CONFIG_DRM_SIMPLEDRM with CONFIG_FB_SIMPLE (they use the same
>> device), there is no blank screen. The root cause is the initialization
>> order, and this order depends on the Makefile.
>> 
>> FB_SIMPLE is before native DRM drivers (e.g. i915, radeon, amdgpu, and
>> so on), but DRM_SIMPLEDRM is after them. Thus, if we use FB_SIMPLE, I915
>> will takeover FB_SIMPLE, then no problem; and if we use DRM_SIMPLEDRM,
>> DRM_SIMPLEDRM will try to takeover I915, but fails to work.
>
> But what exactly is the problem? From the lengthy discussion threat, it 
> looks like you've stumbled across a long-known problem, where the 
> firmware driver probes a device that has already been taken by a native 
> driver. But that should not be possible.
>
> As you know, there's a platform device that represents the firmware 
> framebuffer. The firmware drivers, such as simpledrm, bind to it. In 
> i915 and the other native drivers we remove that platform device, so 
> that simpledrm does not run.

The problem is still not resolved. Another bug report at [1].

The commit message here points at 60aebc955949 ("drivers/firmware: Move
sysfb_init() from device_initcall to subsys_initcall_sync") as
regressing, and Jaak also bisected it (see Closes:).

I agree the patch here is just papering over the issue, but lacking a
proper fix, for months, a revert would be in order, no?


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/intel/-/issues/10133


>
> We call the DRM aperture helpers at [1]. It's implemented at [2]. The 
> function contains a call to sysfb_disable(), [3] which should be invoked 
> for the i915 device and remove the platform device.
>
> [1] 
> https://elixir.bootlin.com/linux/v6.5/source/drivers/gpu/drm/i915/i915_driver.c#L489
> [2] 
> https://elixir.bootlin.com/linux/v6.5/source/drivers/video/aperture.c#L347
> [3] 
> https://elixir.bootlin.com/linux/v6.5/source/drivers/firmware/sysfb.c#L63
>
> Can you investigate why this does not work? Is sysfb_disable() not being 
> called? Does it remove the platform device?
>
>> 
>> So we can move the "tiny" directory before native DRM drivers to solve
>> this problem.
>
> Relying on linking order is just as unreliable. The usual workaround is 
> to build native drivers as modules. But first, please investigate where 
> the current code fails.
>
> Best regards
> Thomas
>
>> 
>> Fixes: 60aebc9559492cea ("drivers/firmware: Move sysfb_init() from device_initcall to subsys_initcall_sync")
>> Closes: https://lore.kernel.org/dri-devel/ZUnNi3q3yB3zZfTl@P70.localdomain/T/#t
>> Reported-by: Jaak Ristioja <jaak@ristioja.ee>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> ---
>>   drivers/gpu/drm/Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 8e1bde059170..db0f3d3aff43 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -141,6 +141,7 @@ obj-y			+= arm/
>>   obj-y			+= display/
>>   obj-$(CONFIG_DRM_TTM)	+= ttm/
>>   obj-$(CONFIG_DRM_SCHED)	+= scheduler/
>> +obj-y			+= tiny/
>>   obj-$(CONFIG_DRM_RADEON)+= radeon/
>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdgpu/
>>   obj-$(CONFIG_DRM_AMDGPU)+= amd/amdxcp/
>> @@ -182,7 +183,6 @@ obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>>   obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
>>   obj-y			+= hisilicon/
>>   obj-y			+= mxsfb/
>> -obj-y			+= tiny/
>>   obj-$(CONFIG_DRM_PL111) += pl111/
>>   obj-$(CONFIG_DRM_TVE200) += tve200/
>>   obj-$(CONFIG_DRM_XEN) += xen/

-- 
Jani Nikula, Intel
