Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7348459F5
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 15:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0EE10EE53;
	Thu,  1 Feb 2024 14:19:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvJIuLQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFC310EE53;
 Thu,  1 Feb 2024 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797196; x=1738333196;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FRbvlYyjpnr7PyYFkq4RqomDGaXl3+k4Hq2BQKrbKYg=;
 b=QvJIuLQJY7BS702qFrjnRLkChmW2QPPpTW1WZ0cExAp0s3Blm26kmkek
 ce10YpT1pyuvB16RmXqFNbXs6mvxzvfgcL5fe70VEv5CyN2iDZxj7VxWQ
 h2Othsv/P3w76l5yvmd8aLUxJLsfWQYknxqmAknYukQHy1g2uag1yT8o1
 65j44Crh1MVTS2pG+am5lMZFK0cT6i72iCqjR/fN/IoCoDypAMKel+Q31
 IofmeE+aAp/KnGHtKbtfQFAFGEVvheUTBw2DNo9fnt++W8w0hlqLTlZ75
 I7VYy+yzFLszlr7zxGqon2LmGBCa4TrZmnqqc0+H8urrYFX0FvzixyPcW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="401033600"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="401033600"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:19:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4422947"
Received: from osandru-mobl1.ger.corp.intel.com (HELO [10.252.41.143])
 ([10.252.41.143])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:19:52 -0800
Message-ID: <ed96c60e-c6ea-490f-9811-57b92d87083e@linux.intel.com>
Date: Thu, 1 Feb 2024 15:19:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/display: Fix memleak in display initialization
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 wangxiaoming321 <xiaoming.wang@intel.com>
Cc: ogabbay@kernel.org, thomas.hellstrom@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
 <20240126153453.997855-1-xiaoming.wang@intel.com>
 <abko5y3n5mju6srjly257bpqlvjf5ie6h6snboaekxnfv5mu76@jjumdgev76ag>
 <87zfwlh78b.fsf@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87zfwlh78b.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-01-31 16:07, Jani Nikula wrote:
> On Wed, 31 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> +Jani
>>
>> On Fri, Jan 26, 2024 at 11:34:53PM +0800, wangxiaoming321 wrote:
>>> intel_power_domains_init has been called twice in xe_device_probe:
>>> xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init(xe)
>>> xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
>>> -> intel_power_domains_init(i915)
>>
>> ok, once upon a time intel_power_domains_init() was called by the driver
>> initialization code and not initialized inside the display. I think.
>> Now it's part of the display probe and we never updated the xe side.
>>
>>>
>>> It needs remove one to avoid power_domains->power_wells double malloc.
>>>
>>> unreferenced object 0xffff88811150ee00 (size 512):
>>>   comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
>>>   hex dump (first 32 bytes):
>>>     10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
>>>     ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
>>>   backtrace:
>>>     [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
>>>     [<ffffffff812c98b2>] __kmalloc+0x52/0x150
>>>     [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
>>>     [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
>>>     [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
>>>     [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
>>>     [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
>>>     [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
>>>     [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
>>>     [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
>>>     [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
>>>     [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
>>>     [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
>>>     [<ffffffff8192e159>] bus_add_driver+0x119/0x220
>>>     [<ffffffff81930d00>] driver_register+0x60/0x120
>>>     [<ffffffffa05e50a0>] 0xffffffffa05e50a0
>>>
>>
>> This will need a Fixes trailer.  This seems to be a suitable one:
>>
>> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>>
>>> Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_display.c | 6 ------
>>> 1 file changed, 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>>> index 74391d9b11ae..e4db069f0db3 100644
>>> --- a/drivers/gpu/drm/xe/xe_display.c
>>> +++ b/drivers/gpu/drm/xe/xe_display.c
>>> @@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>>>
>>> int xe_display_init_nommio(struct xe_device *xe)
>>> {
>>> -	int err;
>>> -
>>> 	if (!xe->info.enable_display)
>>> 		return 0;
>>>
>>> @@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
>>> 	/* This must be called before any calls to HAS_PCH_* */
>>> 	intel_detect_pch(xe);
>>>
>>> -	err = intel_power_domains_init(xe);
>>> -	if (err)
>>> -		return err;
>>
>> xe_display_init_nommio() has xe_display_fini_nommio() as its destructor
>> counter part. Unfortunately display side looks wrong as it does:
>>
>> init:
>> 	intel_display_driver_probe_noirq() -> intel_power_domains_init()
>>
>> destroy:
>> 	i915_driver_late_release() -> intel_power_domains_cleanup()
>>
>> I think leaving intel_power_domains_cleanup() as is for now so it's
>> called by xe works, but this needs to go through CI, which apparently
>> this series didn't go. I re-triggered it.
>>
>> +Jani if he thinks this can be changed in another way or already have
>> the complete solution.
> 
> I don't. But it is and will be a recurring problem. i915 and xe core
> drivers should handle display init and cleanup the same way. But
> currently i915 goes on to call e.g. intel_power_domains_cleanup()
> directly from top level driver code. There are other examples.
> 
> And we seem to have recently added *more*. See e.g. bd738d859e71
> ("drm/i915: Prevent modesets during driver init/shutdown").
That commit seems terrible Should we instead not only enable any code 
that can cause modesets after it's safe to do so?

Cheers,
~Maarten
