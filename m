Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D121228FA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644576E9AC;
	Tue, 17 Dec 2019 10:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 937 seconds by postgrey-1.36 at gabe;
 Mon, 16 Dec 2019 17:38:52 UTC
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794996E850
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 17:38:52 +0000 (UTC)
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id EEF2E54E8228FDBE8727;
 Mon, 16 Dec 2019 17:23:10 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Dec 2019 17:23:10 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 16 Dec
 2019 17:23:10 +0000
To: xinliang <z.liuxinliang@hisilicon.com>, "kongxinwei (A)"
 <kong.kongxinwei@hisilicon.com>, "kongxinwei (A)"
 <kong.kongxinwei@hisilicon.com>, "Chenfeng (puck)" <puck.chen@hisilicon.com>, 
 "airlied@linux.ie" <airlied@linux.ie>, <daniel@ffwll.ch>
From: John Garry <john.garry@huawei.com>
Subject: Warnings in DRM code when removing/unbinding a driver
Message-ID: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
Date: Mon, 16 Dec 2019 17:23:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml728-chm.china.huawei.com (10.201.108.79) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Enabling CONFIG_DEBUG_TEST_DRIVER_REMOVE causes many warns on a system 
with the HIBMC hw:

[   27.788806] WARNING: CPU: 24 PID: 1 at 
drivers/gpu/drm/drm_gem_vram_helper.c:564 bo_driver_move_notify+0x8c/0x98
[   27.798969] Modules linked in:
[   27.802018] CPU: 24 PID: 1 Comm: swapper/0 Tainted: G    B 
  5.5.0-rc1-dirty #565
[   27.810358] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI 
RC0 - V1.16.01 03/15/2019
[   27.818872] pstate: 20c00009 (nzCv daif +PAN +UAO)
[   27.823654] pc : bo_driver_move_notify+0x8c/0x98
[   27.828262] lr : bo_driver_move_notify+0x40/0x98
[   27.832868] sp : ffff00236f0677e0
[   27.836173] x29: ffff00236f0677e0 x28: ffffa0001454e5e0
[   27.841476] x27: ffff002366e52128 x26: ffffa000149e67b0
[   27.846779] x25: ffff002366e523e0 x24: ffff002336936120
[   27.852082] x23: ffff0023346f4010 x22: ffff002336936128
[   27.857385] x21: ffffa000149c15c0 x20: ffff0023369361f8
[   27.862687] x19: ffff002336936000 x18: 0000000000001258
[   27.867989] x17: 0000000000001190 x16: 00000000000011d0
[   27.873292] x15: 0000000000001348 x14: ffffa00012d68190
[   27.878595] x13: 0000000000000006 x12: 1ffff40003241f91
[   27.883897] x11: ffff940003241f91 x10: dfffa00000000000
[   27.889200] x9 : ffff940003241f92 x8 : 0000000000000001
[   27.894502] x7 : ffffa0001920fc88 x6 : ffff940003241f92
[   27.899804] x5 : ffff940003241f92 x4 : ffff0023369363a0
[   27.905107] x3 : ffffa00010c104b8 x2 : dfffa00000000000
[   27.910409] x1 : 0000000000000003 x0 : 0000000000000001
[   27.915712] Call trace:
[   27.918151]  bo_driver_move_notify+0x8c/0x98
[   27.922412]  ttm_bo_cleanup_memtype_use+0x54/0x100
[   27.927194]  ttm_bo_put+0x3a0/0x5d0
[   27.930673]  drm_gem_vram_object_free+0xc/0x18
[   27.935109]  drm_gem_object_free+0x34/0xd0
[   27.939196]  drm_gem_object_put_unlocked+0xc8/0xf0
[   27.943978]  hibmc_user_framebuffer_destroy+0x20/0x40
[   27.949020]  drm_framebuffer_free+0x48/0x58
[   27.953194]  drm_mode_object_put.part.1+0x90/0xe8
[   27.957889]  drm_mode_object_put+0x28/0x38
[   27.961976]  hibmc_fbdev_fini+0x54/0x78
[   27.965802]  hibmc_unload+0x2c/0xd0
[   27.969281]  hibmc_pci_remove+0x2c/0x40
[   27.973109]  pci_device_remove+0x6c/0x140
[   27.977110]  really_probe+0x174/0x548
[   27.980763]  driver_probe_device+0x7c/0x148
[   27.984936]  device_driver_attach+0x94/0xa0
[   27.989109]  __driver_attach+0xa8/0x110
[   27.992935]  bus_for_each_dev+0xe8/0x158
[   27.996849]  driver_attach+0x30/0x40
[   28.000415]  bus_add_driver+0x234/0x2f0
[   28.004241]  driver_register+0xbc/0x1d0
[   28.008067]  __pci_register_driver+0xbc/0xd0
[   28.012329]  hibmc_pci_driver_init+0x20/0x28
[   28.016590]  do_one_initcall+0xb4/0x254
[   28.020417]  kernel_init_freeable+0x27c/0x328
[   28.024765]  kernel_init+0x10/0x118
[   28.028245]  ret_from_fork+0x10/0x18
[   28.031813] ---[ end trace 35a83b71b657878d ]---
[   28.036503] ------------[ cut here ]------------
[   28.041115] WARNING: CPU: 24 PID: 1 at 
drivers/gpu/drm/drm_gem_vram_helper.c:40 ttm_buffer_object_destroy+0x4c/0x80
[   28.051537] Modules linked in:
[   28.054585] CPU: 24 PID: 1 Comm: swapper/0 Tainted: G    B   W 
  5.5.0-rc1-dirty #565
[   28.062924] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI 
RC0 - V1.16.01 03/15/2019

[snip]

Indeed, simply unbinding the device from the driver causes the same sort 
of issue:

root@(none)$ cd ./bus/pci/drivers/hibmc-drm/
root@(none)$ ls
0000:05:00.0  bind          new_id        remove_id     uevent        unbind
root@(none)$ echo 0000\:05\:00.0 > unbind
[  116.074352] ------------[ cut here ]------------
[  116.078978] WARNING: CPU: 17 PID: 1178 at 
drivers/gpu/drm/drm_gem_vram_helper.c:40 ttm_buffer_object_destroy+0x4c/0x80
[  116.089661] Modules linked in:
[  116.092711] CPU: 17 PID: 1178 Comm: sh Tainted: G    B   W 
5.5.0-rc1-dirty #565
[  116.100704] Hardware name: Huawei D06 /D06, BIOS Hisilicon D06 UEFI 
RC0 - V1.16.01 03/15/2019
[  116.109218] pstate: 20400009 (nzCv daif +PAN -UAO)
[  116.114001] pc : ttm_buffer_object_destroy+0x4c/0x80
[  116.118956] lr : ttm_buffer_object_destroy+0x18/0x80
[  116.123910] sp : ffff0022e6cef8e0
[  116.127215] x29: ffff0022e6cef8e0 x28: ffff00231b1fb000
[  116.132519] x27: 0000000000000000 x26: ffff00231b1fb000
[  116.137821] x25: ffff0022e6cefdc0 x24: 0000000000002480
[  116.143124] x23: ffff0023682b6ab0 x22: ffff0023682b6800
[  116.148427] x21: ffff0023682b6800 x20: 0000000000000000
[  116.153730] x19: ffff0023682b6800 x18: 0000000000000000
[  116.159032] x17: 000000000000000000000000001
[  116.185545] x7 : ffff0023682b6b07 x6 : ffff80046d056d61
[  116.190848] x5 : ffff80046d056d61 x4 : ffff0023682b6ba0
[  116.196151] x3 : ffffa00010197338 x2 : dfffa00000000000
[  116.201453] x1 : 0000000000000003 x0 : 0000000000000001
[  116.206756] Call trace:
[  116.209195]  ttm_buffer_object_destroy+0x4c/0x80
[  116.213803]  ttm_bo_release_list+0x184/0x220
[  116.218064]  ttm_bo_put+0x410/0x5d0
[  116.221544]  drm_gem_vram_object_free+0xc/0x18
[  116.225979]  drm_gem_object_free+0x34/0xd0
[  116.230066]  drm_gem_object_put_unlocked+0xc8/0xf0
[  116.234848]  hibmc_user_framebuffer_destroy+0x20/0x40
[  116.239890]  drm_framebuffer_free+0x48/0x58
[  116.244064]  drm_mode_object_put.part.1+0x90/0xe8
[  116.248759]  drm_mode_object_put+0x28/0x38
[  116.252846]  hibmc_fbdev_fini+0x54/0x78
[  116.256672]  hibmc_unload+0x2c/0xd0
[  116.260151]  hibmc_pci_remove+0x2c/0x40
[  116.263979]  pci_device_remove+0x6c/0x140
[  116.267980]  device_release_driver_internal+0x134/0x250
[  116.273196]  device_driver_detach+0x28/0x38
[  116.277369]  unbind_store+0xfc/0x150
[  116.280934]  drv_attr_store+0x48/0x60
[  116.284589]  sysfs_kf_write+0x80/0xb0
[  116.288241]  kernfs_fop_write+0x1d4/0x320
[  116.292243]  __vfs_write+0x54/0x98
[  116.295635]  vfs_write+0xe8/0x270
[  116.298940]  ksys_write+0xc8/0x180
[  116.302333]  __arm64_sys_write+0x40/0x50
[  116.306248]  el0_svc_common.constprop.0+0xa4/0x1f8
[  116.311029]  el0_svc_handler+0x34/0xb0
[  116.314770]  el0_sync_handler+0x10c/0x1c8
[  116.318769]  el0_sync+0x140/0x180
[  116.322074] ---[ end trace e60e43d0e316b5c8 ]---
[  116.326868] ------------[ cut here ]------------


dmesg and .config is here:
https://pastebin.com/4P5yaZBS

I'm not sure if this is a HIBMC driver issue or issue with the framework.

john


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
