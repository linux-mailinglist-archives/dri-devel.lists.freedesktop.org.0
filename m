Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A3E5FC7F0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 17:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DAE10E546;
	Wed, 12 Oct 2022 15:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B8C0910E546
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 15:07:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65E10113E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 08:07:20 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D41A03F792
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 08:07:13 -0700 (PDT)
Date: Wed, 12 Oct 2022 16:07:06 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 4/7] drm/arm/hdlcd: use drm_dev_unplug()
Message-ID: <Y0bYGjtAHbjeGJHF@e110455-lin.cambridge.arm.com>
References: <20221001011905.433408-1-dakr@redhat.com>
 <20221001011905.433408-5-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221001011905.433408-5-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Appologies again for the delay in reviewing this as I was at XDC last week.

This patch is causing a regression at 'rmmod' time as the drm_crtc_vblank_off() does
not get called when we disable outputs and the HDLCD remains active as I keep getting
unhandled context faults from the arm-smmu driver that sits in front of the HDLCD.

This is the stack trace for it:

root@alarm ~]# rmmod hdlcd
[  198.981343] Console: switching to colour dummy device 80x25
[  199.012492] ------------[ cut here ]------------
[  199.017209] driver forgot to call drm_crtc_vblank_off()
[  199.023513] WARNING: CPU: 5 PID: 176 at drivers/gpu/drm/drm_atomic_helper.c:1236 disable_outputs+0x2c4/0x2d0 [drm_kms_helper]
[  199.035055] Modules linked in: hdlcd(-) drm_dma_helper tda998x cec drm_kms_helper drm
[  199.042929] CPU: 5 PID: 176 Comm: kworker/5:2 Not tainted 6.0.0-rc2-00007-ge17e6f0211cd #6
[  199.051212] Hardware name: ARM Juno development board (r2) (DT)
[  199.057143] Workqueue: events drm_mode_rmfb_work_fn [drm]
[  199.062831] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  199.069809] pc : disable_outputs+0x2c4/0x2d0 [drm_kms_helper]
[  199.075664] lr : disable_outputs+0x2c4/0x2d0 [drm_kms_helper]
[  199.081519] sp : ffff80000a8f3b60
[  199.084836] x29: ffff80000a8f3b60 x28: 0000000000000028 x27: ffff0008013962b8
[  199.091996] x26: ffff800001049688 x25: ffff800001080520 x24: 0000000000000038
[  199.099155] x23: 0000000000000000 x22: ffff000801396000 x21: ffff0008013966f0
[  199.106314] x20: 0000000000000000 x19: ffff00080a65a800 x18: 0000000000000000
[  199.113472] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  199.120630] x14: 00000000000000e1 x13: 0000000000000000 x12: 0000000000000000
[  199.127788] x11: 0000000000000001 x10: 0000000000000a60 x9 : ffff80000a8f3910
[  199.134947] x8 : ffff00080149d480 x7 : ffff00097efb5bc0 x6 : 0000000000000083
[  199.142106] x5 : 0000000000000000 x4 : ffff00097efaea18 x3 : ffff00097efb1c20
[  199.149264] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00080149c9c0
[  199.156423] Call trace:
[  199.158870]  disable_outputs+0x2c4/0x2d0 [drm_kms_helper]
[  199.164380]  drm_atomic_helper_commit_tail+0x24/0xa0 [drm_kms_helper]
[  199.170933]  commit_tail+0x150/0x180 [drm_kms_helper]
[  199.176093]  drm_atomic_helper_commit+0x13c/0x370 [drm_kms_helper]
[  199.182384]  drm_atomic_commit+0xa4/0xe0 [drm]
[  199.187074]  drm_framebuffer_remove+0x434/0x4d4 [drm]
[  199.192374]  drm_mode_rmfb_work_fn+0x74/0x9c [drm]
[  199.197413]  process_one_work+0x1d4/0x330
[  199.201437]  worker_thread+0x220/0x430
[  199.205195]  kthread+0x108/0x10c
[  199.208430]  ret_from_fork+0x10/0x20
[  199.212015] ---[ end trace 0000000000000000 ]---
[  199.221088] arm-smmu 7fb10000.iommu: Unhandled context fault: fsr=0x2, iova=0xffa53600, fsynr=0x182, cbfrsynra=0x0, cb=0
[  199.232958] arm-smmu 7fb10000.iommu: Unhandled context fault: fsr=0x2, iova=0xff800000, fsynr=0x182, cbfrsynra=0x0, cb=0
[  199.233228] ------------[ cut here ]------------
[  199.248618] hdlcd 7ff50000.hdlcd: drm_WARN_ON(({ do { __attribute__((__noreturn__)) extern void __compiletime_assert_384(void) __attribute__((__error__("Unsupported access size for {READ,WRITE}_ONCE()."))); if (!((sizeof(vblank->enabled) == sizeof(char) || sizeof(vblank->enabled) == sizeof(short) || sizeof(vblank->🢱
enabled) == sizeof(int) || sizeof(vblank->enabled) == sizeof(long)) || sizeof(vblank->enabled) == sizeof(long long))) __compiletime_assert_384(); } while (0); (*(const volatile typeof( _Generic((vblank->enabled), char: (char)0, unsigned char: (unsigned char)0, signed char: (signed char)0, unsigned short: (unsigned sho🢱
rt)0, signed short: (signed short)0, unsigned int: (unsigned int)0, signed int: (signed int)0, unsigned long: (unsigned long)0, signed long: (signed long)0, unsigned long long: (unsigned long long)0, signed long long: (signed long long)0, default: (vblank->enabled))) *)&(vblank->enabled)); }) && drm_core_check_feature🢱
(dev, DRIVER_MODESET))
[  199.248790] WARNING: CPU: 4 PID: 285 at drivers/gpu/drm/drm_vblank.c:504 drm_vblank_init_release+0x84/0xb0 [drm]
[  199.249751] arm-smmu 7fb10000.iommu: Unhandled context fault: fsr=0x2, iova=0xff800000, fsynr=0x182, cbfrsynra=0x0, cb=0
[  199.291902] arm-scmi firmware:scmi: timed out in resp(caller: scmi_perf_level_set+0xfc/0x120)
[  199.291926] cpufreq: __target_index: Failed to change cpu frequency: -110
[  199.334654] Modules linked in: hdlcd(-)
[  199.345063] scmi-cpufreq scmi_dev.2: Message for 857 type 0 is not expected!
[  199.355734]  drm_dma_helper
[  199.371060]  tda998x
[  199.384738]  cec
[  199.408686]  drm_kms_helper
[  199.421404]  drm
[  199.436732]
[  199.450409] CPU: 4 PID: 285 Comm: rmmod Tainted: G        W 6.0.0-rc2-00007-ge17e6f0211cd #6
[  199.475499] Hardware name: ARM Juno development board (r2) (DT)
[  199.501541] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  199.508531] pc : drm_vblank_init_release+0x84/0xb0 [drm]
[  199.514314] lr : drm_vblank_init_release+0x84/0xb0 [drm]
[  199.519877] sp : ffff80000b183b30
[  199.523195] x29: ffff80000b183b30 x28: ffff0008008b8000 x27: 0000000000000000
[  199.530374] x26: 0000000000000000 x25: dead000000000100 x24: dead000000000122
[  199.537550] x23: ffff000801396010 x22: ffff800001008010 x21: ffff000801396000
[  199.544727] x20: ffff000801396000 x19: ffff000800398480 x18: fffffffffffeb478
[  199.551904] x17: 000000040044ffff x16: 00400032b5503510 x15: 00000000000003d0
[  199.559080] x14: 0000000000000001 x13: ffff800009f62f50 x12: 000000000000073e
[  199.566256] x11: 000000000000026a x10: ffff800009fbe940 x9 : ffff800009f62f50
[  199.573432] x8 : 00000000ffffefff x7 : ffff800009fbaf50 x6 : 000000000000026a
[  199.580607] x5 : ffff00097ef9aa18 x4 : 0000000000000000 x3 : 0000000000000027
[  199.587782] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008008b8000
[  199.594957] Call trace:
[  199.597409]  drm_vblank_init_release+0x84/0xb0 [drm]
[  199.602823]  drm_managed_release+0xa8/0x140 [drm]
[  199.607973]  drm_dev_put.part.0+0x78/0xb0 [drm]
[  199.612946]  devm_drm_dev_init_release+0x18/0x30 [drm]
[  199.618529]  devm_action_release+0x14/0x20
[  199.622654]  devres_release_group+0xe0/0x164
[  199.626949]  component_master_del+0xb0/0xc0
[  199.631154]  hdlcd_remove+0x1c/0x2c [hdlcd]
[  199.635368]  platform_remove+0x28/0x60
[  199.639138]  device_remove+0x4c/0x80
[  199.642731]  device_release_driver_internal+0x1e4/0x250
[  199.647979]  driver_detach+0x50/0xe0
[  199.651572]  bus_remove_driver+0x5c/0xbc
[  199.655513]  driver_unregister+0x30/0x60
[  199.659454]  platform_driver_unregister+0x14/0x20
[  199.664181]  hdlcd_platform_driver_exit+0x1c/0xe20 [hdlcd]
[  199.669698]  __arm64_sys_delete_module+0x18c/0x240
[  199.674513]  invoke_syscall+0x48/0x114
[  199.678286]  el0_svc_common.constprop.0+0xcc/0xec
[  199.683015]  do_el0_svc+0x2c/0xc0
[  199.686350]  el0_svc+0x2c/0x84
[  199.689424]  el0t_64_sync_handler+0x11c/0x150
[  199.693803]  el0t_64_sync+0x18c/0x190
[  199.697485] ---[ end trace 0000000000000000 ]---


Looking at the documentation for drm_dev_unplug, you can get a hint about what is going on:

 /*
 * [....] There is one
 * shortcoming however, drm_dev_unplug() marks the drm_device as unplugged before
 * drm_atomic_helper_shutdown() is called. This means that if the disable code
 * paths are protected, they will not run on regular driver module unload,
 * possibly leaving the hardware enabled.
 */

I've reverted this patch and I can remove most of the time, but I also get this crash
from time to time:

[root@alarm ~]# rmmod hdlcd
[ 5442.625918] Console: switching to colour dummy device 80x25
[ 5442.662398] Unable to handle kernel paging request at virtual address ffff80000aa8c230
[ 5442.672018] Mem abort info:
[ 5442.675537]   ESR = 0x0000000096000047
[ 5442.679654]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 5442.685355]   SET = 0, FnV = 0
[ 5442.688759]   EA = 0, S1PTW = 0
[ 5442.692122]   FSC = 0x07: level 3 translation fault
[ 5442.697031] Data abort info:
[ 5442.699912]   ISV = 0, ISS = 0x00000047
[ 5442.703766]   CM = 0, WnR = 1
[ 5442.706749] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000081a7f000
[ 5442.713493] [ffff80000aa8c230] pgd=10000009fffff003, p4d=10000009fffff003, pud=10000009ffffe003, pmd=10000008811dd003, pte=0000000000000000
[ 5442.726214] Internal error: Oops: 96000047 [#1] PREEMPT SMP
[ 5442.731803] Modules linked in: psmouse libps2 onboard_usb_hub tda998x crct10dif_ce cec polyval_ce ambakmi polyval_generic serio hdlcd(-) drm_dma_helper arm_smccc_trng gpio_keys rng_core drm_kms_helper cfg80211 rfkill fuse drm ip_tables x_tables ipv6 
[ 5442.753979] CPU: 0 PID: 274 Comm: rmmod Not tainted 6.0.0-rc2-00007-ge17e6f0211cd-dirty #7
[ 5442.760857] arm-scmi firmware:scmi: timed out in resp(caller: scmi_perf_level_set+0xfc/0x120)
[ 5442.762258] Hardware name: ARM Juno development board (r2) (DT)
[ 5442.762263] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 5442.770822] cpufreq: __target_index: Failed to change cpu frequency: -110
[ 5442.776718] pc : hdlcd_crtc_cleanup+0x44/0x84 [hdlcd]
[ 5442.776735] lr : hdlcd_crtc_cleanup+0x30/0x84 [hdlcd]
[ 5442.776744] sp : ffff80000a963a60
[ 5442.803918] x29: ffff80000a963a60 x28: ffff00080240e740 x27: 0000000000000000
[ 5442.811071] x26: 0000000000000000 x25: dead000000000100 x24: dead000000000122
[ 5442.816720] arm-scmi firmware:scmi: timed out in resp(caller: scmi_perf_level_set+0xfc/0x120)
[ 5442.818222] x23: ffff000800d1f010 x22: ffff000800d1f2d8 x21: ffff000800d1f200
[ 5442.826803] cpufreq: __target_index: Failed to change cpu frequency: -110
[ 5442.833905] x20: ffff000800d1f000 x19: ffff000800d1f6f0 x18: ffffffffffffffff
[ 5442.833916] x17: 30647261632f6d72 x16: 642f64636c64682e x15: 0000000000000001
[ 5442.833926] x14: 0000000000000004 x13: ffff000800d1f1e8 x12: 0000000000000000
[ 5442.862146] x11: ffff0008005aec68 x10: ffff0008005aeb58 x9 : 0000000000000000
[ 5442.869296] x8 : ffff0008005aeb80 x7 : 0000000000000000 x6 : 0000000000000228
[ 5442.876446] x5 : 000000000000082a x4 : 0000000000000000 x3 : 0000000000000001
[ 5442.883595] x2 : ffff00080240e740 x1 : 0000000000000000 x0 : ffff80000aa8c230
[ 5442.890746] Call trace:
[ 5442.893189]  hdlcd_crtc_cleanup+0x44/0x84 [hdlcd]
[ 5442.897902]  drm_mode_config_cleanup+0x150/0x2fc [drm]
[ 5442.903160]  drm_mode_config_init_release+0x10/0x20 [drm]
[ 5442.908671]  drm_managed_release+0xa8/0x140 [drm]
[ 5442.913489]  drm_dev_put.part.0+0x78/0xb0 [drm]
[ 5442.918131]  devm_drm_dev_init_release+0x18/0x30 [drm]
[ 5442.923380]  devm_action_release+0x14/0x20
[ 5442.927487]  devres_release_group+0xe0/0x164
[ 5442.931763]  component_master_del+0xb0/0xc0
[ 5442.935951]  hdlcd_remove+0x1c/0x2c [hdlcd]
[ 5442.940142]  platform_remove+0x28/0x60
[ 5442.943894]  device_remove+0x4c/0x80
[ 5442.947471]  device_release_driver_internal+0x1e4/0x250
[ 5442.952703]  driver_detach+0x50/0xe0
[ 5442.956280]  bus_remove_driver+0x5c/0xbc
[ 5442.960205]  driver_unregister+0x30/0x60
[ 5442.964131]  platform_driver_unregister+0x14/0x20
[ 5442.968840]  hdlcd_platform_driver_exit+0x1c/0xe20 [hdlcd]
[ 5442.974335]  __arm64_sys_delete_module+0x18c/0x240
[ 5442.979133]  invoke_syscall+0x48/0x114
[ 5442.982887]  el0_svc_common.constprop.0+0xcc/0xec
[ 5442.987597]  do_el0_svc+0x2c/0xc0
[ 5442.990915]  el0_svc+0x2c/0x84
[ 5442.993972]  el0t_64_sync_handler+0x11c/0x150
[ 5442.998334]  el0t_64_sync+0x18c/0x190
[ 5443.002001] Code: 540000e0 f85f0260 9108c000 d50332bf (b900001f)
[ 5443.008103] ---[ end trace 0000000000000000 ]---
[ 5443.012793] arm-scmi firmware:scmi: timed out in resp(caller: scmi_perf_level_set+0xfc/0x120)
[ 5443.021366] cpufreq: __target_index: Failed to change cpu frequency: -110


I'm finally getting to a conclusion: I'm still not sure what problem you were trying
to solve when you have started this series and if you have found a scenario where
you've got use after free then I would like to be able to reproduce it on my setup.
Otherwise, I think this whole series introduces a regression on the behaviour of the
driver and I would be inclined to reject it.

Best regards,
Liviu


On Sat, Oct 01, 2022 at 03:19:02AM +0200, Danilo Krummrich wrote:
> When the driver is unbound, there might still be users in userspace
> having an open fd and are calling into the driver.
> 
> While this is fine for drm managed resources, it is not for resources
> bound to the device/driver lifecycle, e.g. clocks or MMIO mappings.
> 
> To prevent use-after-free issues we need to protect those resources with
> drm_dev_enter() and drm_dev_exit(). This does only work if we indicate
> that the drm device was unplugged, hence use drm_dev_unplug() instead of
> drm_dev_unregister().
> 
> Protecting the particular resources with drm_dev_enter()/drm_dev_exit()
> is handled by subsequent patches.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index 120c87934a91..e41def6d47cc 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -325,7 +325,7 @@ static void hdlcd_drm_unbind(struct device *dev)
>  	struct drm_device *drm = dev_get_drvdata(dev);
>  	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
>  
> -	drm_dev_unregister(drm);
> +	drm_dev_unplug(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	component_unbind_all(dev, drm);
>  	of_node_put(hdlcd->crtc.port);
> -- 
> 2.37.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
