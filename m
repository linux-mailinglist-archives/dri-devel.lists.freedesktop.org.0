Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F6B8B1AC1
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FB411A18B;
	Thu, 25 Apr 2024 06:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EK8lLOwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FD911A189;
 Thu, 25 Apr 2024 06:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714025701; x=1745561701;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rtxNtzPilOLj7vcoC1ZYoMmw21VcF/h6UaYeI5wDNvw=;
 b=EK8lLOwjoDeY09E9OTQSjozBv/QORrcPMPM/x6Nlv3zIZgrWcZMgN7f7
 rG+OxD82uIIuvc15pZoEgqR8OHq0qngK+uNvnD4jgIz34vZShoiybv0Pl
 Jkvlj/UiXhIF4ItDZhFUvHnmNlC4TbghaC6mJtELbiv8URn7q1NOnfvzt
 dri/JJofYbrUeUU0TElNmLZIDpRS+M7qa0I1EP4mzKKUsc+wXfx7vs5KO
 fuxfNm/rolb9oGUWFreqJ0hgF+hK2NfUmq6GNylENUpnyf0NjGDhiYPNi
 E7EIA+mT/eDGviIOGG7rOmh6dlWlbBv83SGpHMgLKrD/9sZeTB1szKpFe Q==;
X-CSE-ConnectionGUID: vEINIZdTSzaYD7vLAv6Rvw==
X-CSE-MsgGUID: 6oZldLO3Tj2Qu5ut9Y/HpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9813262"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9813262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 23:15:00 -0700
X-CSE-ConnectionGUID: XQKXRCafRoSNVU/Qy2Wxhg==
X-CSE-MsgGUID: 1j+FQWjVR6KvVzKKnvrbrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="55899205"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 23:14:56 -0700
Message-ID: <f297b6c9-2352-45a0-8eea-3e6956ddd1ce@linux.intel.com>
Date: Thu, 25 Apr 2024 11:47:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe/FLR: Support PCIe FLR
Content-Language: en-US
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-5-aravind.iddamsetty@linux.intel.com>
 <2sls3mnsjhd3zo2e7qel5zsc5zgrtv7sby3xvsh2yf5elnvjks@mulhpzx3lxjk>
 <39f107b3-f95d-4a60-989c-c39aac33303c@linux.intel.com>
 <gnauhvd3q5i3qe33suveqxmoxin3xhvlbslcfxiv76qvf27rxi@c6dwq3xgcjbz>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <gnauhvd3q5i3qe33suveqxmoxin3xhvlbslcfxiv76qvf27rxi@c6dwq3xgcjbz>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 25/04/24 04:59, Michał Winiarski wrote:
> On Wed, Apr 24, 2024 at 10:42:59AM +0530, Aravind Iddamsetty wrote:
>> On 24/04/24 05:19, Michał Winiarski wrote:
>>> On Mon, Apr 22, 2024 at 12:27:56PM +0530, Aravind Iddamsetty wrote:
>>>> PCI subsystem provides callbacks to inform the driver about a request to
>>>> do function level reset by user, initiated by writing to sysfs entry
>>>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>>>> without the need to do unbind and rebind as the driver needs to
>>>> reinitialize the device afresh post FLR.
>>>>
>>>> v2:
>>>> 1. separate out gt idle and pci save/restore to a separate patch (Lucas)
>>>> 2. Fixed the warnings seen around xe_guc_submit_stop, xe_guc_puc_fini
>>>>
>>>> v3: declare xe_pci_err_handlers as static(Michal)
>>>>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>
>>>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/Makefile          |  1 +
>>>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
>>>>  drivers/gpu/drm/xe/xe_guc_pc.c       |  4 ++
>>>>  drivers/gpu/drm/xe/xe_pci.c          |  9 ++-
>>>>  drivers/gpu/drm/xe/xe_pci.h          |  2 +
>>>>  drivers/gpu/drm/xe/xe_pci_err.c      | 88 ++++++++++++++++++++++++++++
>>>>  drivers/gpu/drm/xe/xe_pci_err.h      | 13 ++++
>>>>  7 files changed, 119 insertions(+), 1 deletion(-)
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.h
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>>>> index 8bc62bfbc679..693971a1fac0 100644
>>>> --- a/drivers/gpu/drm/xe/Makefile
>>>> +++ b/drivers/gpu/drm/xe/Makefile
>>>> @@ -117,6 +117,7 @@ xe-y += xe_bb.o \
>>>>  	xe_module.o \
>>>>  	xe_pat.o \
>>>>  	xe_pci.o \
>>>> +	xe_pci_err.o \
>>>>  	xe_pcode.o \
>>>>  	xe_pm.o \
>>>>  	xe_preempt_fence.o \
>>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>>> index 0a66555229e9..8c749b378a92 100644
>>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>>> @@ -465,6 +465,9 @@ struct xe_device {
>>>>  	/** @pci_state: PCI state of device */
>>>>  	struct pci_saved_state *pci_state;
>>>>  
>>>> +	/** @pci_device_is_reset: device went through PCIe FLR */
>>>> +	bool pci_device_is_reset;
>>>> +
>>>>  	/* private: */
>>>>  
>>>>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> index 509649d0e65e..efba0fbe2f5c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>>>> @@ -902,6 +902,10 @@ static void xe_guc_pc_fini(struct drm_device *drm, void *arg)
>>>>  		return;
>>>>  	}
>>>>  
>>>> +	/* We already have done this before going through a reset, so skip here */
>>>> +	if (xe->pci_device_is_reset)
>>>> +		return;
>>>> +
>>>>  	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>>>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>>>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index a62300990e19..b5a582afc9e7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -23,6 +23,7 @@
>>>>  #include "xe_macros.h"
>>>>  #include "xe_mmio.h"
>>>>  #include "xe_module.h"
>>>> +#include "xe_pci_err.h"
>>>>  #include "xe_pci_types.h"
>>>>  #include "xe_pm.h"
>>>>  #include "xe_sriov.h"
>>>> @@ -738,7 +739,7 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>>>  	pci_set_drvdata(pdev, NULL);
>>>>  }
>>>>  
>>>> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>>  {
>>>>  	const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>>>  	const struct xe_subplatform_desc *subplatform_desc;
>>>> @@ -986,6 +987,11 @@ static const struct dev_pm_ops xe_pm_ops = {
>>>>  };
>>>>  #endif
>>>>  
>>>> +static const struct pci_error_handlers xe_pci_err_handlers = {
>>>> +	.reset_prepare = xe_pci_reset_prepare,
>>>> +	.reset_done = xe_pci_reset_done,
>>>> +};
>>>> +
>>>>  static struct pci_driver xe_pci_driver = {
>>>>  	.name = DRIVER_NAME,
>>>>  	.id_table = pciidlist,
>>>> @@ -995,6 +1001,7 @@ static struct pci_driver xe_pci_driver = {
>>>>  #ifdef CONFIG_PM_SLEEP
>>>>  	.driver.pm = &xe_pm_ops,
>>>>  #endif
>>>> +	.err_handler = &xe_pci_err_handlers,
>>>>  };
>>>>  
>>>>  int xe_register_pci_driver(void)
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>>>> index 73b90a430d1f..9faf5380a09e 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>>>> @@ -7,8 +7,10 @@
>>>>  #define _XE_PCI_H_
>>>>  
>>>>  struct pci_dev;
>>>> +struct pci_device_id;
>>>>  
>>>>  int xe_register_pci_driver(void);
>>>>  void xe_unregister_pci_driver(void);
>>>>  void xe_load_pci_state(struct pci_dev *pdev);
>>>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>>>>  #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>>>> new file mode 100644
>>>> index 000000000000..5306925ea2fa
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>>>> @@ -0,0 +1,88 @@
>>>> +// SPDX-License-Identifier: MIT
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/pci.h>
>>>> +#include <drm/drm_drv.h>
>>>> +
>>>> +#include "xe_device.h"
>>>> +#include "xe_gt.h"
>>>> +#include "xe_gt_printk.h"
>>>> +#include "xe_pci.h"
>>>> +#include "xe_pci_err.h"
>>>> +#include "xe_pm.h"
>>>> +#include "xe_uc.h"
>>>> +
>>>> +/**
>>>> + * xe_pci_reset_prepare - Called when user issued a PCIe reset
>>>> + * via /sys/bus/pci/devices/.../reset.
>>>> + * @pdev: PCI device struct
>>>> + */
>>>> +void xe_pci_reset_prepare(struct pci_dev *pdev)
>>>> +{
>>>> +	struct xe_device *xe = pci_get_drvdata(pdev);
>>>> +	struct xe_gt *gt;
>>>> +	int id, err;
>>>> +
>>>> +	pci_warn(pdev, "preparing for PCIe reset\n");
>>>> +
>>>> +	drm_warn(&xe->drm, "removing device access to userspace\n");
>>> Warn? Shouldn't it be info?
>> I believe warn is appropriate as this is not a usual path the users apps expect
>> to hit and as they loose device connection.
> It's an expected path after issuing a reset via /sys/bus/pci/devices/.../reset.
> DRM device disappearing - yeah, that's probably not expected, fully
> agree on that.
>
>>>> +	drm_dev_unplug(&xe->drm);
>>>> +
>>>> +	xe_pm_runtime_get(xe);
>>>> +	/* idle the GTs */
>>>> +	for_each_gt(gt, xe, id) {
>>>> +		err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +		if (err)
>>>> +			goto reset;
>>>> +		xe_uc_reset_prepare(&gt->uc);
>>>> +		xe_gt_idle(gt);
>>>> +		err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>> +		XE_WARN_ON(err);
>>>> +	}
>>>> +	xe_pm_runtime_put(xe);
>>>> +
>>>> +reset:
>>>> +	pci_disable_device(pdev);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_pci_reset_done - Called when PCIe reset is done.
>>>> + * @pdev: PCI device struct
>>>> + */
>>>> +void xe_pci_reset_done(struct pci_dev *pdev)
>>>> +{
>>>> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>>>> +	struct xe_device *xe = pci_get_drvdata(pdev);
>>>> +
>>>> +	dev_info(&pdev->dev,
>>>> +		 "device went through PCIe reset, reenabling the device\n");
>>>> +
>>>> +	if (pci_enable_device(pdev)) {
>>>> +		dev_err(&pdev->dev,
>>>> +			"Cannot re-enable PCI device after reset\n");
>>>> +		return;
>>>> +	}
>>>> +	pci_set_master(pdev);
>>>> +	xe_load_pci_state(pdev);
>>>> +
>>>> +	xe->pci_device_is_reset = true;
>>>> +	/*
>>>> +	 * We want to completely clean the driver and even destroy
>>>> +	 * the xe private data and reinitialize afresh similar to
>>>> +	 * probe
>>>> +	 */
>>>> +	pdev->driver->remove(pdev);
>>> Do we really want to do that?
>>> First of all, that fairly unusual - none of the other PCI drivers makes
>>> changes in the device/driver model during reset, which makes me wonder
>>> if this is really what the user expects.
>>> I would expect that the device is reset, but the driver is not unloaded
>>> and previously created FDs are still valid.
>> We cannot continue to work with previous instance of driver as post
>> reset GuC , LMEM and most of the soc is reset, so  we need to reinitialize
>> device afresh like in driver probe, hence we remove to clean the previous
>> stale driver state and re-probe again.
> GuC, LMEM and most of the soc is reset when we're doing S3 / S4, and
> yet, we're not removing the driver in this scenario.
ya there we are migrating the buffer from device memory to system memory, but I'm little
doubtful if we can do that in case of reset as device might already be a bad state or error state.
Also, that this is a reset and expectation is to have clean slate not resume from previous state.
>
>> All applications are expected to reopen the device handles afresh.
> Current UMDs are not handling that case.

strange then how is it handled today, without these callback implemented
the only way to do FLR and recover from it is to unbind the driver->initiate FLR->rebind.
also i do not think it is automatically handled the admin or privileged application initiating a 
reset should re launch those UMDS.
>
>>> Note that messing with the driver model at reset also makes it difficult
>>> to do a proper cleanup if SR-IOV is enabled, as PCI-core expects drivers
>>> to remove VF devices during driver->remove.
>>> Removal of said devices depends on pci_cfg_access_lock, which is already
>>> held for the duration of the reset (wh
>> I haven't verified SRIOV use case, i believe we can take this up as next step.
>> Also, since this is not an automatic reset but a user/admin initiated i believe
>> the onus can be on admin to close all VFs before initiating a reset.
> That's not the contract for reset. It's not a "user/admin" interface,
> there doesn't necessarily have to be an "interactive" user interfacing
> with it through shell.
> It's just a regular stable sysfs uAPI - it could very well be called by
> application as well.
the application issuing a reset cannot be a normal one it should be a privileged one,
and not every application is granted that access eg; L0 sysman who initiates the reset
takes care of closing all open connections before initiating a reset.
>
>>> ich includes calling reset_done),
>>> which will cause a deadlock.
>>>
>>> In current form, it also causes WARN if there are open FDs to DRM
>>> device during reset.
>> I did verify using igt@device_reset@reset-bound which has a open connection haven't seen this error
>> but will re verify again but again certain warns are expected but driver reload should be successful.
>> similarly here as well we can expect the admin to close any applications using the device before
>> initiating a reset.
> Can we expect this?
> If we can - why are you stating that "all applications are expected to
> reopen the device handles afresh"?
> I believe that the expectation for reset is that it behaves simiarly to
> the PM flows, which is mostly transparent to the users.
Like I mentioned the definition of a reset is to start afresh from clean state
and since we cleared previous state of device applications cannot continue to work
without re initializing device connections.

and today that is the case even without these callbacks.

Thanks,
Aravind.
>
> Thanks,
> -Michał
>
>> Thanks,
>>
>> Aravind.
>>> [29357.277699] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:02.0/tile0'                                                                                                                            01:06:58 [142/47263]
>>> [29357.286158] CPU: 7 PID: 3479 Comm: bash Not tainted 6.9.0-rc5-xe+ #78
>>> [29357.305870] Call Trace:
>>> [29357.308342]  <TASK>
>>> [29357.310453]  dump_stack_lvl+0x139/0x1d0
>>> [29357.314305]  ? __pfx_dump_stack_lvl+0x10/0x10
>>> [29357.318680]  ? __pfx__printk+0x10/0x10
>>> [29357.322450]  ? kmalloc_trace+0x1c1/0x3a0
>>> [29357.326394]  ? sysfs_create_dir_ns+0x162/0x210
>>> [29357.330861]  sysfs_create_dir_ns+0x195/0x210
>>> [29357.335154]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
>>> [29357.339965]  ? strcmp+0x2f/0x60
>>> [29357.343134]  kobject_add_internal+0x2af/0x600
>>> [29357.347517]  kobject_add+0xfb/0x190
>>> [29357.351028]  ? __link_object+0x1c7/0x280
>>> [29357.354976]  ? __pfx_kobject_add+0x10/0x10
>>> [29357.359093]  ? __create_object+0x62/0x140
>>> [29357.363111]  ? rcu_is_watching+0x20/0x50
>>> [29357.367055]  ? kmalloc_trace+0x1c1/0x3a0
>>> [29357.370998]  ? xe_tile_sysfs_init+0x4b/0x100 [xe]
>>> [29357.376016]  xe_tile_sysfs_init+0x91/0x100 [xe]
>>> [29357.380868]  xe_tile_init_noalloc+0xaf/0xc0 [xe]
>>> [29357.385936]  xe_device_probe+0x60c/0x750 [xe]
>>> [29357.390674]  ? __asan_memcpy+0x40/0x70
>>> [29357.394461]  ? __drmm_add_action+0x1ac/0x210 [drm]
>>> [29357.399413]  xe_pci_probe+0x5dc/0x680 [xe]
>>> [29357.403882]  pci_reset_function+0x108/0x140
>>> [29357.408100]  reset_store+0xb5/0x120
>>> [29357.411623]  ? __pfx_reset_store+0x10/0x10
>>> [29357.415751]  ? __pfx_sysfs_kf_write+0x10/0x10
>>> [29357.420149]  kernfs_fop_write_iter+0x1b8/0x260
>>> [29357.424620]  vfs_write+0x5ce/0x660
>>> [29357.428067]  ? __pfx_vfs_write+0x10/0x10
>>> [29357.432028]  ? __rcu_read_unlock+0x60/0x90
>>> [29357.436181]  ksys_write+0xe4/0x190
>>> [29357.439612]  ? __pfx_ksys_write+0x10/0x10
>>> [29357.443657]  do_syscall_64+0x7b/0x120
>>> [29357.447348]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>> [29357.452423] RIP: 0033:0x7f4f1ff14887
>>> [29357.456030] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
>>> [29357.474761] RSP: 002b:00007ffe54e95068 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>>> [29357.482343] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f4f1ff14887
>>> [29357.489487] RDX: 0000000000000002 RSI: 0000559eb4076e30 RDI: 0000000000000001
>>> [29357.496630] RBP: 0000559eb4076e30 R08: 0000000000000000 R09: 0000559eb4076e30
>>> [29357.503775] R10: 0000000000000077 R11: 0000000000000246 R12: 0000000000000002
>>> [29357.510947] R13: 00007f4f2001b780 R14: 00007f4f20017600 R15: 00007f4f20016a00
>>> [29357.518174]  </TASK>
>>> [29357.520539] kobject: kobject_add_internal failed for tile0 with -EEXIST, don't try to register things with the same name in the same directory.
>>>
>>> -Michał
>>>
>>>> +	if (pci_dev_msi_enabled(pdev))
>>>> +		pci_free_irq_vectors(pdev);
>>>> +
>>>> +	devm_drm_dev_release_action(&xe->drm);
>>>> +	pci_disable_device(pdev);
>>>> +
>>>> +	/*
>>>> +	 * if this fails the driver might be in a stale state, only option is
>>>> +	 * to unbind and rebind
>>>> +	 */
>>>> +	xe_pci_probe(pdev, ent);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.h b/drivers/gpu/drm/xe/xe_pci_err.h
>>>> new file mode 100644
>>>> index 000000000000..95a4c8ce9cf1
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_pci_err.h
>>>> @@ -0,0 +1,13 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2024 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_PCI_ERR_H_
>>>> +#define _XE_PCI_ERR_H_
>>>> +
>>>> +struct pci_dev;
>>>> +
>>>> +void xe_pci_reset_prepare(struct pci_dev *pdev);
>>>> +void xe_pci_reset_done(struct pci_dev *pdev);
>>>> +#endif
>>>> -- 
>>>> 2.25.1
>>>>
