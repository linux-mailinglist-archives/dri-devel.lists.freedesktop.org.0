Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564F8442A0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 16:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D10210F393;
	Wed, 31 Jan 2024 15:07:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83CD10E5EB;
 Wed, 31 Jan 2024 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706713645; x=1738249645;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1gKRjbeF385lVjQe3INmGEbRSihpxA0qX1m3cojS4F4=;
 b=gLCklx3rPVlvg6CrQRKigd9lG/2Yxk+/rhJCucA0t/mEDOEZOxmaXvCx
 O+1gZJiHHN0Xs8DZdMjYlCnieMMTnQyqCY6Hj/23ijZTrhokpdWmN3rZB
 DtkWig8ujaDZ1daPBq53qyLt37LnziRjIbn6gUpq6ipmzzq7NxAOHvr6C
 Z2d1dUMdjr0xzfF62rK5Wkzj9mgVR+yyG5UyCgwsHJX/nDi3uGHX3BRJ0
 wroTa+bsSoIsvlY6pmWtPVE0gdtMMvMkuyvwZ4tDkRtCxCTYXTbk9cJhO
 U6/rbrksR+zPeB+r88hicz0W6SYq8IULegMult8CPmL4Bmnu8fFETV3Mc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3474313"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3474313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 07:07:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788607938"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="788607938"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 07:07:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, wangxiaoming321
 <xiaoming.wang@intel.com>
Subject: Re: [PATCH] drm/xe/display: Fix memleak in display initialization
In-Reply-To: <abko5y3n5mju6srjly257bpqlvjf5ie6h6snboaekxnfv5mu76@jjumdgev76ag>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240125063633.989944-1-xiaoming.wang@intel.com>
 <20240126153453.997855-1-xiaoming.wang@intel.com>
 <abko5y3n5mju6srjly257bpqlvjf5ie6h6snboaekxnfv5mu76@jjumdgev76ag>
Date: Wed, 31 Jan 2024 17:07:16 +0200
Message-ID: <87zfwlh78b.fsf@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniel@ffwll.ch, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Jan 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> +Jani
>
> On Fri, Jan 26, 2024 at 11:34:53PM +0800, wangxiaoming321 wrote:
>>intel_power_domains_init has been called twice in xe_device_probe:
>>xe_device_probe -> xe_display_init_nommio -> intel_power_domains_init(xe)
>>xe_device_probe -> xe_display_init_noirq -> intel_display_driver_probe_noirq
>>-> intel_power_domains_init(i915)
>
> ok, once upon a time intel_power_domains_init() was called by the driver
> initialization code and not initialized inside the display. I think.
> Now it's part of the display probe and we never updated the xe side.
>
>>
>>It needs remove one to avoid power_domains->power_wells double malloc.
>>
>>unreferenced object 0xffff88811150ee00 (size 512):
>>  comm "systemd-udevd", pid 506, jiffies 4294674198 (age 3605.560s)
>>  hex dump (first 32 bytes):
>>    10 b4 9d a0 ff ff ff ff ff ff ff ff ff ff ff ff  ................
>>    ff ff ff ff ff ff ff ff 00 00 00 00 00 00 00 00  ................
>>  backtrace:
>>    [<ffffffff8134b901>] __kmem_cache_alloc_node+0x1c1/0x2b0
>>    [<ffffffff812c98b2>] __kmalloc+0x52/0x150
>>    [<ffffffffa08b0033>] __set_power_wells+0xc3/0x360 [xe]
>>    [<ffffffffa08562fc>] xe_display_init_nommio+0x4c/0x70 [xe]
>>    [<ffffffffa07f0d1c>] xe_device_probe+0x3c/0x5a0 [xe]
>>    [<ffffffffa082e48f>] xe_pci_probe+0x33f/0x5a0 [xe]
>>    [<ffffffff817f2187>] local_pci_probe+0x47/0xa0
>>    [<ffffffff817f3db3>] pci_device_probe+0xc3/0x1f0
>>    [<ffffffff8192f2a2>] really_probe+0x1a2/0x410
>>    [<ffffffff8192f598>] __driver_probe_device+0x78/0x160
>>    [<ffffffff8192f6ae>] driver_probe_device+0x1e/0x90
>>    [<ffffffff8192f92a>] __driver_attach+0xda/0x1d0
>>    [<ffffffff8192c95c>] bus_for_each_dev+0x7c/0xd0
>>    [<ffffffff8192e159>] bus_add_driver+0x119/0x220
>>    [<ffffffff81930d00>] driver_register+0x60/0x120
>>    [<ffffffffa05e50a0>] 0xffffffffa05e50a0
>>
>
> This will need a Fixes trailer.  This seems to be a suitable one:
>
> Fixes: 44e694958b95 ("drm/xe/display: Implement display support")
>
>>Signed-off-by: wangxiaoming321 <xiaoming.wang@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_display.c | 6 ------
>> 1 file changed, 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>>index 74391d9b11ae..e4db069f0db3 100644
>>--- a/drivers/gpu/drm/xe/xe_display.c
>>+++ b/drivers/gpu/drm/xe/xe_display.c
>>@@ -134,8 +134,6 @@ static void xe_display_fini_nommio(struct drm_device *dev, void *dummy)
>>
>> int xe_display_init_nommio(struct xe_device *xe)
>> {
>>-	int err;
>>-
>> 	if (!xe->info.enable_display)
>> 		return 0;
>>
>>@@ -145,10 +143,6 @@ int xe_display_init_nommio(struct xe_device *xe)
>> 	/* This must be called before any calls to HAS_PCH_* */
>> 	intel_detect_pch(xe);
>>
>>-	err = intel_power_domains_init(xe);
>>-	if (err)
>>-		return err;
>
> xe_display_init_nommio() has xe_display_fini_nommio() as its destructor
> counter part. Unfortunately display side looks wrong as it does:
>
> init:
> 	intel_display_driver_probe_noirq() -> intel_power_domains_init()
>
> destroy:
> 	i915_driver_late_release() -> intel_power_domains_cleanup()
>
> I think leaving intel_power_domains_cleanup() as is for now so it's
> called by xe works, but this needs to go through CI, which apparently
> this series didn't go. I re-triggered it.
>
> +Jani if he thinks this can be changed in another way or already have
> the complete solution.

I don't. But it is and will be a recurring problem. i915 and xe core
drivers should handle display init and cleanup the same way. But
currently i915 goes on to call e.g. intel_power_domains_cleanup()
directly from top level driver code. There are other examples.

And we seem to have recently added *more*. See e.g. bd738d859e71
("drm/i915: Prevent modesets during driver init/shutdown").


BR,
Jani.


-- 
Jani Nikula, Intel
