Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E24885868
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 12:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B18DF10E7C2;
	Thu, 21 Mar 2024 11:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iBw5ZYEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4A310E7A2;
 Thu, 21 Mar 2024 11:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020938; x=1742556938;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/cW09MDNNFkuG/4qwHQQ4FRvmsTu3/KWRbfYxGU1z9Q=;
 b=iBw5ZYEXzD17cGlei672LkUWXI9W9vWJrG+Yjt5cHM29Y91Isdqmd+Kv
 Sequui1FXoYdfe/CJIms5t6QAp8W/qfnh81GCUr63uFzB1Le5vreVhjCj
 oRU/dmQLqvUG7op9AQCPZjjmb+UgAOwiCTZTgZSRcmUn2F+DpzXMOXI/f
 cN9pobtqX122xrpRLmcifD+Vn6hxdQrVKO/td4W+0W/joCVhYtfqE3NXr
 P7PuMCavu3rcIU5f30TiQIpxmg3Jg2npFt5ll0j/fa7W14EmwYAS+0TC+
 XWVE9wEW1nk6tUKqS5p/+ecSNy24RfVWa8i2Xy5olkS3hHoYltn428+/C A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17141511"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17141511"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="15121948"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:35:36 -0700
Message-ID: <4b7ce0d6-05ec-4f34-b9db-878d7ce2a3f1@linux.intel.com>
Date: Thu, 21 Mar 2024 17:08:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/2] drm/xe/FLR: Support PCIe FLR
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
 <20240320104426.1592959-3-aravind.iddamsetty@linux.intel.com>
 <yijkvevwkkbvknfsavams7oihpe7inhht3ezcz5ylo3um27miu@tzrycoc6gsyu>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <yijkvevwkkbvknfsavams7oihpe7inhht3ezcz5ylo3um27miu@tzrycoc6gsyu>
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


On 21/03/24 04:31, Lucas De Marchi wrote:
> On Wed, Mar 20, 2024 at 04:14:26PM +0530, Aravind Iddamsetty wrote:
>> PCI subsystem provides callbacks to inform the driver about a request to
>> do function level reset by user, initiated by writing to sysfs entry
>> /sys/bus/pci/devices/.../reset. This will allow the driver to handle FLR
>> without the need to do unbind and rebind as the driver needs to
>> reinitialize the device afresh post FLR.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> ---
>> drivers/gpu/drm/xe/Makefile          |  1 +
>> drivers/gpu/drm/xe/xe_device_types.h |  3 +
>> drivers/gpu/drm/xe/xe_gt.c           | 31 ++++++---
>> drivers/gpu/drm/xe/xe_gt.h           |  1 +
>> drivers/gpu/drm/xe/xe_pci.c          | 53 ++++++++++++++--
>> drivers/gpu/drm/xe/xe_pci.h          |  6 +-
>> drivers/gpu/drm/xe/xe_pci_err.c      | 94 ++++++++++++++++++++++++++++
>> 7 files changed, 174 insertions(+), 15 deletions(-)
>> create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 3c3e67885559..1447712fec65 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>     xe_module.o \
>>     xe_pat.o \
>>     xe_pci.o \
>> +    xe_pci_err.o \
>>     xe_pcode.o \
>>     xe_pm.o \
>>     xe_preempt_fence.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 9785eef2e5a4..e9b8c7cbb428 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -455,6 +455,9 @@ struct xe_device {
>>     /** @needs_flr_on_fini: requests function-reset on fini */
>>     bool needs_flr_on_fini;
>>
>> +    /** @pci_state: PCI state of device */
>> +    struct pci_saved_state *pci_state;
>> +
>>     /* private: */
>>
>> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 85408e7a932b..437874a9a5a0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -629,6 +629,26 @@ static int do_gt_restart(struct xe_gt *gt)
>>     return 0;
>> }
>>
>> +/* Idle the GT */
>> +int xe_idle_gt(struct xe_gt *gt)
>
> any non-static function should use xe_gt_ prefix.
Ok will change it.
>
>> +{
>> +    int err;
>> +
>> +    xe_gt_sanitize(gt);
>> +
>> +    xe_uc_gucrc_disable(&gt->uc);
>> +    xe_uc_stop_prepare(&gt->uc);
>> +    xe_gt_pagefault_reset(gt);
>> +
>> +    err = xe_uc_stop(&gt->uc);
>> +    if (err)
>> +        return err;
>> +
>> +    xe_gt_tlb_invalidation_reset(gt);
>> +
>> +    return err;
>> +}
>> +
>> static int gt_reset(struct xe_gt *gt)
>> {
>>     int err;
>> @@ -645,21 +665,12 @@ static int gt_reset(struct xe_gt *gt)
>>     }
>>
>>     xe_pm_runtime_get(gt_to_xe(gt));
>> -    xe_gt_sanitize(gt);
>>
>>     err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>     if (err)
>>         goto err_msg;
>>
>> -    xe_uc_gucrc_disable(&gt->uc);
>> -    xe_uc_stop_prepare(&gt->uc);
>> -    xe_gt_pagefault_reset(gt);
>> -
>> -    err = xe_uc_stop(&gt->uc);
>> -    if (err)
>> -        goto err_out;
>> -
>> -    xe_gt_tlb_invalidation_reset(gt);
>> +    xe_idle_gt(gt);
>
> this and the above should be in a commit alone
> "drm/xe: Extract xe_gt_idle() helper" with explanation it will be used
> in other places outside of gt_reset path.
sure will separate it out.
>
> but I'm a little bit confused here... why do you need to remove
> xe_gt_sanitize() inside the function to make gt idle?
if I understood right this controls how the invalidation is 

sent via guc or mmio. hence moved into this function as we disable guc.

>
> Lucas De Marchi
>
>>
>>     err = do_gt_reset(gt);
>>     if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index ed6ea8057e35..77df919199cc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -43,6 +43,7 @@ int xe_gt_resume(struct xe_gt *gt);
>> void xe_gt_reset_async(struct xe_gt *gt);
>> void xe_gt_sanitize(struct xe_gt *gt);
>> void xe_gt_remove(struct xe_gt *gt);
>> +int xe_idle_gt(struct xe_gt *gt);
>>
>> /**
>>  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index c401d4890386..fcd2a7f66f7b 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -383,6 +383,41 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>>
>> #undef INTEL_VGA_DEVICE
>>
>> +static bool xe_save_pci_state(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +
>> +    if (pci_save_state(pdev))
>> +        return false;
>> +
>> +    kfree(xe->pci_state);
>> +
>> +    xe->pci_state = pci_store_saved_state(pdev);
>> +
>> +    if (!xe->pci_state) {
>> +        drm_err(&xe->drm, "Failed to store PCI saved state\n");
>> +        return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +void xe_load_pci_state(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +    int ret;
>> +
>> +    if (!xe->pci_state)
>> +        return;
>> +
>> +    ret = pci_load_saved_state(pdev, xe->pci_state);
>> +    if (!ret) {
>> +        pci_restore_state(pdev);
>> +    } else {
>> +        drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
>> +    }
>
> please check coding style here and invert condition so you keep the
> return-early pattern you started in the xe->pci_state check.
>
>
> ret = pci_load_saved_state(pdev, xe->pci_state);
> if (ret) {
>     drm_warn(&xe->drm, "Failed to load PCI state err:%d\n", ret);
>     return;
> }
Ok will correct it.
>
>> +}
>> +
>> /* is device_id present in comma separated list of ids */
>> static bool device_id_in_list(u16 device_id, const char *devices, bool negative)
>> {
>> @@ -688,10 +723,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>
>>     xe_device_remove(xe);
>>     xe_pm_runtime_fini(xe);
>> +
>> +    kfree(xe->pci_state);
>>     pci_set_drvdata(pdev, NULL);
>> }
>>
>> -static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>> {
>>     const struct xe_device_desc *desc = (const void *)ent->driver_data;
>>     const struct xe_subplatform_desc *subplatform_desc;
>> @@ -786,6 +823,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>     drm_dbg(&xe->drm, "d3cold: capable=%s\n",
>>         str_yes_no(xe->d3cold.capable));
>>
>> +    if (xe_save_pci_state(pdev))
>> +        pci_restore_state(pdev);
>
> why do we save and restore in sequence when probing? If we only have to
> have a saved stated for possible errors later, why do we restore on
> success? /me confused

this is needed to avoid breaking the PCI core functionality of suspend/resume

to unset dev->state_saved which is checked in suspend

Documentation/power/pci.rst:

"Moreover, if the driver calls pci_save_state(),
the PCI subsystem will not execute either pci_prepare_to_sleep(), or
pci_set_power_state() for its device, so the driver is then responsible for
handling the device as appropriate."

>
>> +
>>     return 0;
>> }
>>
>> @@ -833,7 +873,7 @@ static int xe_pci_suspend(struct device *dev)
>>      */
>>     d3cold_toggle(pdev, D3COLD_ENABLE);
>>
>> -    pci_save_state(pdev);
>> +    xe_save_pci_state(pdev);
>
> all these no change in behavior with xe_ functions wrapping the the pci
> ones could be delegated to a prep patch so it's easier to separate the
> noise from the actual changes.
Ok.
>
>>     pci_disable_device(pdev);
>>
>>     return 0;
>> @@ -857,6 +897,8 @@ static int xe_pci_resume(struct device *dev)
>>
>>     pci_set_master(pdev);
>>
>> +    xe_load_pci_state(pdev);
>> +
>>     err = xe_pm_resume(pdev_to_xe_device(pdev));
>>     if (err)
>>         return err;
>> @@ -874,7 +916,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>     if (err)
>>         return err;
>>
>> -    pci_save_state(pdev);
>> +    xe_save_pci_state(pdev);
>>
>>     if (xe->d3cold.allowed) {
>>         d3cold_toggle(pdev, D3COLD_ENABLE);
>> @@ -899,7 +941,7 @@ static int xe_pci_runtime_resume(struct device *dev)
>>     if (err)
>>         return err;
>>
>> -    pci_restore_state(pdev);
>> +    xe_load_pci_state(pdev);
>>
>>     if (xe->d3cold.allowed) {
>>         err = pci_enable_device(pdev);
>> @@ -928,6 +970,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>> };
>> #endif
>>
>> +extern const struct pci_error_handlers xe_pci_err_handlers;
>
> not sure this really belongs into a separate compilation unit. Just
> leave it in xe_pci.c? Adding the extern here doesn't make it pretty.
>
I wanted to keep it separate so that it will be clean, will do as suggested below.

Thanks,
Aravind.
> if we are adding a separate .c, then the struct definition should
> probably be here, and you do it like
>
>     static const struct pci_error_handlers xe_pci_err_handlers = {
>         .reset_prepare = xe_pci_err_reset_prepare,
>         .reset_done = xe_pci_err_reset_done,
>     };
>
>
> See xe_pm_ops, that was left here rather than in xe_pm.c.
>
> Lucas De Marchi
>
>> +
>> static struct pci_driver xe_pci_driver = {
>>     .name = DRIVER_NAME,
>>     .id_table = pciidlist,
>> @@ -937,6 +981,7 @@ static struct pci_driver xe_pci_driver = {
>> #ifdef CONFIG_PM_SLEEP
>>     .driver.pm = &xe_pm_ops,
>> #endif
>> +    .err_handler = &xe_pci_err_handlers,
>> };
>>
>> int xe_register_pci_driver(void)
>> diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
>> index 611c1209b14c..9faf5380a09e 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.h
>> +++ b/drivers/gpu/drm/xe/xe_pci.h
>> @@ -6,7 +6,11 @@
>> #ifndef _XE_PCI_H_
>> #define _XE_PCI_H_
>>
>> +struct pci_dev;
>> +struct pci_device_id;
>> +
>> int xe_register_pci_driver(void);
>> void xe_unregister_pci_driver(void);
>> -
>> +void xe_load_pci_state(struct pci_dev *pdev);
>> +int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_err.c b/drivers/gpu/drm/xe/xe_pci_err.c
>> new file mode 100644
>> index 000000000000..ecc467a9c3af
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pci_err.c
>> @@ -0,0 +1,94 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <linux/pci.h>
>> +#include <drm/drm_drv.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_gt_printk.h"
>> +#include "xe_pci.h"
>> +#include "xe_pm.h"
>> +
>> +/**
>> + * xe_pci_reset_prepare - Called when user issued a function level reset
>> + * via /sys/bus/pci/devices/.../reset.
>> + * @pdev: PCI device struct
>> + */
>> +static void xe_pci_reset_prepare(struct pci_dev *pdev)
>> +{
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +    struct xe_gt *gt;
>> +    int id, err;
>> +
>> +    pci_warn(pdev, "preparing for PCIe FLR reset\n");
>> +
>> +    drm_warn(&xe->drm, "removing device access to userspace\n");
>> +    drm_dev_unplug(&xe->drm);
>> +
>> +    xe_pm_runtime_get(xe);
>> +    /* idle the GTs */
>> +    for_each_gt(gt, xe, id) {
>> +        err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +        if (err)
>> +            goto reset;
>> +        err = xe_idle_gt(gt);
>> +        if (err) {
>> +            xe_gt_err(gt, "failed to idle gt (%pe)\n", ERR_PTR(err));
>> +            goto reset;
>> +        }
>> +
>> +        err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +        XE_WARN_ON(err);
>> +    }
>> +    xe_pm_runtime_put(xe);
>> +
>> +reset:
>> +    pci_disable_device(pdev);
>> +}
>> +
>> +/**
>> + * xe_pci_reset_done - Called when function level reset is done.
>> + * @pdev: PCI device struct
>> + */
>> +static void xe_pci_reset_done(struct pci_dev *pdev)
>> +{
>> +    const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>> +    struct xe_device *xe = pci_get_drvdata(pdev);
>> +
>> +    dev_info(&pdev->dev,
>> +         "PCI device went through FLR, reenabling the device\n");
>> +
>> +    if (pci_enable_device(pdev)) {
>> +        dev_err(&pdev->dev,
>> +            "Cannot re-enable PCI device after reset\n");
>> +        return;
>> +    }
>> +    pci_set_master(pdev);
>> +    xe_load_pci_state(pdev);
>> +
>> +    /*
>> +     * We want to completely clean the driver and even destroy
>> +     * the xe private data and reinitialize afresh similar to
>> +     * probe
>> +     */
>> +    pdev->driver->remove(pdev);
>> +    if (pci_dev_msi_enabled(pdev))
>> +        pci_free_irq_vectors(pdev);
>> +
>> +    devm_drm_release_action(&xe->drm);
>> +    pci_disable_device(pdev);
>> +
>> +    /*
>> +     * if this fails the driver might be in a stale state, only option is
>> +     * to unbind and rebind
>> +     */
>> +    xe_pci_probe(pdev, ent);
>> +}
>> +
>> +const struct pci_error_handlers xe_pci_err_handlers = {
>> +    .reset_prepare = xe_pci_reset_prepare,
>> +    .reset_done = xe_pci_reset_done,
>> +};
>> -- 
>> 2.25.1
>>
