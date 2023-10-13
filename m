Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C27C8CEF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 20:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435F10E627;
	Fri, 13 Oct 2023 18:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3995310E627
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 18:14:45 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b652e785dbso296205241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 11:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697220884; x=1697825684; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=U463dFAjiamtoTbQSqqANS3WBWXcmMOWycz7o8lMoWo=;
 b=x7RuWMbkCAEpm8/C10MEUjVFgOco0cuDvXQBXe6EeRaDpmuAahvsF7i1R49LSIwMjB
 WecazE5KvXg9r/8tTcNa5kL/vusBgojLTWNptbPAOIV4IpIKOy1uK14Xe3uy1BxCGmY6
 qkA1Etlo0PDf9LbPfrV/zoDuK+V5EMVLtINTCH7rR+rC8Bgi2vwX/EwuKDRYl5PCu30B
 uvbr9/ziAThk2sA3SZzLCVZaCfPj6H3rmjXRf/oI/EGcpnimslLa6vw+IAU5a/IMguQz
 BshoHt/5kDZ5TX0hErEtqku4rhnwGZnEB0iLBxQjr0C/IL0oKXB4z2uvQZE/eQFytbat
 0SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697220884; x=1697825684;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=U463dFAjiamtoTbQSqqANS3WBWXcmMOWycz7o8lMoWo=;
 b=Es1+afSKxkbRpJLAmQReEWSVztHD1ygqUJRF4v9xBnh/WK9cqbrIHFwXqne51lmiCT
 MVTyjsr9vYgy/rmzo4F7i4xFBicsMv7pSuB6o/LK5ZlGMtf5ENYbg8ewsltJfoNmowgq
 +bt5t5lgIF2KOAjrttF38iJZck4uUAN2fXZ2KB2QqRjZBloB5A8nXRFdGVqAWohp0MOs
 X8TBRGoeewg8ft//cnSNTUiL29mgP6wYU3ZyqyZ8oItrI0Ts/C07nb/++uHCgtvdK/rK
 /rSPcoU3RXgh9aevVBGzq36N8b6iwE3VD0J6PbGetKXY5QjeKUBY5oLPauQVebw0D5v2
 3Glw==
X-Gm-Message-State: AOJu0Yyvr47qJZi8mTYYO9xsP6Kcwg+uvZ/yUevvTZT5BIPS3OkdGHtm
 v+ydiotI9YdnsycmNr9ArBdCkfaA+EWWAHVIWSrd2PMAOuCFGV+IzQvzow==
X-Google-Smtp-Source: AGHT+IFqYOkIG10rUUjAHn0umZzwqb3b0j+0GeORYbcMwPRlekYfUq8tCD536ZKCfhiGjWwPVUnbPln5QBTBE6aBrHg=
X-Received: by 2002:a67:c89b:0:b0:457:bc52:9b04 with SMTP id
 v27-20020a67c89b000000b00457bc529b04mr4305607vsk.35.1697220883363; Fri, 13
 Oct 2023 11:14:43 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 13 Oct 2023 23:44:32 +0530
Message-ID: <CA+G9fYvJA2HGqzR9LGgq63v0SKaUejHAE6f7+z9cwWN-ourJ_g@mail.gmail.com>
Subject: BUG: KASAN: slab-use-after-free in drm_connector_cleanup
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org, kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following kasan bug was noticed on arm64 bcm2711-rpi-4-b device running
Linux next 6.6.0-rc5-next-20231011 with given config.

This was first noticed on 6.6.0-rc2-next-20230918.
This is an intermittent issue.
Links to build and test logs provided.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
-----

[  209.991842] Bluetooth: Core ver 2.22
[  209.996014] NET: Registered PF_BLUETOOTH protocol family
[  210.002564] Bluetooth: HCI device and connection manager initialized
[  210.009204] Bluetooth: HCI socket layer initialized
[  210.014443] Bluetooth: L2CAP socket layer initialized
[  210.019906] Bluetooth: SCO socket layer initialized
[  210.175889] KTAP version 1
[  210.178771] 1..3
[  210.184030]     KTAP version 1
[  210.187234]     # Subtest: vc4-pv-muxing-combinations
[  210.192491]     # module: vc4
[  210.192572]     1..2
[  210.197937]         KTAP version 1
[  210.201544]         # Subtest: drm_vc4_test_pv_muxing
[  210.218416] Bluetooth: HCI UART driver ver 2.3
[  210.236869] [drm] Initialized vc4 0.0.0 20140616 for
drm-kunit-mock-device on minor 1
[  210.241063] Bluetooth: HCI UART protocol H4 registered
[  210.320009] Bluetooth: HCI UART protocol LL registered
[  210.464457] Bluetooth: HCI UART protocol Broadcom registered
[  210.470871] hci_uart_bcm serial0-0: supply vbat not found, using
dummy regulator
[  210.472120] Bluetooth: HCI UART protocol QCA registered
[  210.480123] hci_uart_bcm serial0-0: supply vddio not found, using
dummy regulator
[  210.490971] Bluetooth: HCI UART protocol Marvell registered

Debian GNU/Linux 12 runner-vwmj3eza-project-40964107-concurrent-0 ttyS0

runner-vwmj3eza-project-40964107-concurrent-0 login: [  2root
10.623188] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[  210.658616] ==================================================================
[  210.666006] BUG: KASAN: slab-use-after-free in
drm_connector_cleanup+0x30/0x488 drm
[  210.675144] Read of size 8 at addr ffff000113a8e0a8 by task
kunit_try_catch/1750
[  210.682685]
[  210.684219] CPU: 1 PID: 1750 Comm: kunit_try_catch Tainted: G    B
          N 6.6.0-rc5-next-20231011 #1
[  210.694056] Hardware name: Raspberry Pi 4 Model B (DT)
[  210.699323] Call trace:
r[ 210.701824] dump_backtrace (arch/arm64/kernel/stacktrace.c:235)
[  210.705757] show_stack (arch/arm64/kernel/stacktrace.c:242)
[  210.709160] dump_stack_lvl (lib/dump_stack.c:107)
[  210.712917] print_report (mm/kasan/report.c:365 mm/kasan/report.c:475)
[  210.716560] kasan_report (mm/kasan/report.c:590)
o[ 210.720201] __asan_load8 (mm/kasan/generic.c:260)
o[ 210.723827] drm_connector_cleanup+0x30/0x488 drm
[  210.729265] drm_connector_cleanup_action+0x1c/0x30 drm
t[ 210.735228] drm_managed_release+0x128/0x228 drm
[  210.740570] drm_dev_put.part.0+0xb4/0xf8 drm
[  210.742616] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[  210.745649] devm_drm_dev_init_release+0x1c/0x38 drm
[  210.756667] devm_action_release (drivers/base/devres.c:722)
[  210.760840] release_nodes (drivers/base/devres.c:506)
[  210.764569] devres_release_all (drivers/base/devres.c:535)
[  210.765145] platform regulatory.0: Direct firmware load for
regulatory.db failed with error -2
[  210.768737] device_unbind_cleanup (drivers/base/dd.c:551)
[  210.768759] device_release_driver_internal (drivers/base/dd.c:1280
drivers/base/dd.c:1295)
[  210.768775] device_release_driver (drivers/base/dd.c:1319)
[  210.768788] bus_remove_device (include/linux/kobject.h:193
drivers/base/base.h:73 drivers/base/bus.c:581)
[  210.768801] device_del (drivers/base/core.c:3815)
[  210.768812] platform_device_del.part.0 (drivers/base/platform.c:753)
[  210.768824] platform_device_del (drivers/base/platform.c:764)

[  210.768834] kunit_action_platform_device_del+0x18/0x30 drm_kunit_helpers
[  210.810264] cfg80211: failed to load regulatory.db
[  210.815438] __kunit_action_free (lib/kunit/resource.c:92)
[  210.815460] kunit_remove_resource (include/kunit/resource.h:120
include/linux/kref.h:65 include/kunit/resource.h:138
lib/kunit/resource.c:59 lib/kunit/resource.c:48)
[  210.815474] kunit_cleanup (lib/kunit/test.c:815 (discriminator 1))
[  210.815486] kunit_try_run_case_cleanup (lib/kunit/test.c:412)
[  210.815499] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30)
[  210.815514] kthread (kernel/kthread.c:388)
[  210.815526] ret_from_fork (arch/arm64/kernel/entry.S:858)
[  210.815540]
[  210.815544] Allocated by task 1745:
[  210.815552] kasan_save_stack (mm/kasan/common.c:46)
[  210.815567] kasan_set_track (mm/kasan/common.c:52 (discriminator 1))
[  210.815579] kasan_save_alloc_info (mm/kasan/generic.c:512)
[  210.815592] __kasan_kmalloc (mm/kasan/common.c:374 mm/kasan/common.c:383)
[  210.815603] __kmalloc (include/linux/kasan.h:198
mm/slab_common.c:1004 mm/slab_common.c:1017)
[  210.815613] kunit_kmalloc_array (include/linux/slab.h:637
lib/kunit/test.c:779)
[  210.815625] vc4_dummy_output+0xac/0x228 vc4
[  210.882798] __mock_device+0x24c/0x4b0 vc4
[  210.887335] vc4_mock_device+0x1c/0x30 vc4
[  210.891871] vc4_pv_muxing_test_init+0xc8/0x248 vc4
[  210.897199] kunit_try_run_case (lib/kunit/test.c:351 lib/kunit/test.c:400)
[  210.901375] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30)
[  210.906869] kthread (kernel/kthread.c:388)
[  210.910156] ret_from_fork (arch/arm64/kernel/entry.S:858)
[  210.913797]
[  210.915309] Freed by task 1750:
[  210.918498] kasan_save_stack (mm/kasan/common.c:46)
[  210.922405] kasan_set_track (mm/kasan/common.c:52 (discriminator 1))
[  210.926220] kasan_save_free_info (include/linux/kasan.h:60
mm/kasan/generic.c:524)
[  210.930476] __kasan_slab_free (mm/kasan/common.c:238
mm/kasan/common.c:200 mm/kasan/common.c:244)
[  210.934645] __kmem_cache_free (mm/slub.c:1826 (discriminator 2)
mm/slub.c:3809 (discriminator 2) mm/slub.c:3822 (discriminator 2))
[  210.938812] kfree (mm/slab_common.c:1054)
[  210.941835] __kunit_action_free (lib/kunit/resource.c:92)
[  210.946004] kunit_remove_resource (include/kunit/resource.h:120
include/linux/kref.h:65 include/kunit/resource.h:138
lib/kunit/resource.c:59 lib/kunit/resource.c:48)
[  210.950525] kunit_cleanup (lib/kunit/test.c:815 (discriminator 1))
[  210.954166] kunit_try_run_case_cleanup (lib/kunit/test.c:412)
[  210.958951] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30)
[  210.959940] Bluetooth: hci0: BCM: chip id 107
[  210.964444] kthread (kernel/kthread.c:388)
[  210.964455] ret_from_fork (arch/arm64/kernel/entry.S:858)
[  210.964466]
[  210.964470] The buggy address belongs to the object at ffff000113a8e000
[  210.964470]  which belongs to the cache kmalloc-2k of size 2048
[  210.964481] The buggy address is located 168 bytes inside of
[  210.964481]  freed 2048-byte region [ffff000113a8e000, ffff000113a8e800)
[  210.964492]
[  210.969465] Bluetooth: hci0: BCM: features 0x2f
[  210.972170] The buggy address belongs to the physical page:
[  210.972177] page:00000000a86866c3 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 pfn:0x113a88
[  210.972190] head:00000000a86866c3 order:3 entire_mapcount:0
nr_pages_mapped:0 pincount:0
[  210.972199] flags:
0xbfffc0000000840(slab|head|node=0|zone=2|lastcpupid=0xffff)
[  210.972214] page_type: 0xffffffff()
[  210.972227] raw: 0bfffc0000000840 ffff000100002f00 dead000000000122
0000000000000000
[  210.982178] Bluetooth: hci0: BCM4345C0
[  210.990038] raw: 0000000000000000 0000000000080008 00000001ffffffff
0000000000000000
[  210.990046] page dumped because: kasan: bad access detected
[  210.990052]
[  210.990055] Memory state around the buggy address:
[  211.002660] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0000
[  211.004080]  ffff000113a8df80: fc fc fc fc fc fc fc fc fc fc fc fc
fc fc fc fc
[  211.009183] Bluetooth: hci0: BCM: firmware Patch file not found, tried:
[  211.014313]  ffff000113a8e000: fa fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[  211.014321] >ffff000113a8e080: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[  211.014328]                                   ^
[  211.014334]  ffff000113a8e100: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[  211.014343]  ffff000113a8e180: fb fb fb fb fb fb fb fb fb fb fb fb
fb fb fb fb
[  211.014349] ==================================================================
[  211.023911] Bluetooth: hci0: BCM: 'brcm/BCM4345C0.raspberrypi,4-model-b.hcd'
[  211.036370] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000001
[  211.040035] Bluetooth: hci0: BCM: 'brcm/BCM4345C0.hcd'
[  211.044474] Mem abort info:
[  211.056083] Bluetooth: hci0: BCM: 'brcm/BCM.raspberrypi,4-model-b.hcd'
[  211.063048]   ESR = 0x0000000096000004
[  211.063068]   EC = 0x25: DABT (current EL), IL = 32 bits
[  211.063082]   SET = 0, FnV = 0
[  211.063090]   EA = 0, S1PTW = 0
[  211.063098]   FSC = 0x04: level 0 translation fault
[  211.063108] Data abort info:
[  211.063114]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  211.063123]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  211.063133]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  211.063142] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000105434000
[  211.063153] [0000000000000001] pgd=0000000000000000, p4d=0000000000000000
[  211.063181] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[  211.063192] Modules linked in: brcmutil xhci_pci_renesas
raspberrypi_cpufreq cfg80211 hci_uart vc4(+) btqca btbcm bluetooth
snd_soc_hdmi_codec reset_raspberrypi cec clk_raspberrypi
raspberrypi_hwmon drm_dma_helper crct10dif_ce drm_kunit_helpers rfkill
drm_display_helper bcm2711_thermal i2c_bcm2835 pwm_bcm2835 v3d
drm_kms_helper drm_shmem_helper gpu_sched pcie_brcmstb fuse drm
backlight dm_mod ip_tables x_tables
[  211.063341] CPU: 1 PID: 1750 Comm: kunit_try_catch Tainted: G    B
          N 6.6.0-rc5-next-20231011 #1
[  211.063355] Hardware name: Raspberry Pi 4 Model B (DT)
[  211.063362] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  211.063373] pc : drm_mode_object_unregister+0x38/0xe0 drm
[  211.063870] lr : drm_mode_object_unregister+0x38/0xe0 drm
[  211.064346] sp : ffff8000887e78e0
[  211.064352] x29: ffff8000887e78e0 x28: ffff000101254180 x27: dead000000000122
[  211.064374] x26: ffff00010b82f810 x25: dead000000000100 x24: ffff000105dda780
[  211.064393] x23: ffff000113a8e058 x22: ffff000113a8e000 x21: 0000000000000001
[  211.064411] x20: ffff000113a8e018 x19: ffff000105dda780 x18: 0000000000000000
[  211.064429] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000809cb4a0
[  211.064446] x14: ffff80007f89e258 x13: 00000000f1f1f1f1 x12: 00000000f2f20000
[  211.064464] x11: dfff800000000000 x10: ffff7000110fcf16 x9 : ffff80007f772094
[  211.064482] x8 : ffff8000887e78d0 x7 : 0000000000000000 x6 : 0000000000000008
Linux runner-vwmj3eza-project-40964107-concurrent-0
6.6.0-rc5-next-20231011 #1 SMP PREEMPT @1697009423 aarch64

The programs i[  211.064499] x5 : 0000000000000000 x4 :
ffff000103806900 x3 : 0000000000000000
[  211.064515] x2 : 0000000000000001 x1 : ffff80008762ed60 x0 : 0000000000000000
[  211.064532] Call trace:
[  211.064538] drm_mode_object_unregister+0x38/0xe0 drm
[  211.065018] drm_encoder_cleanup+0x8c/0x128 drm
[  211.065495] drmm_encoder_alloc_release+0x34/0x60 drm
[  211.072100] Bluetooth: hci0: BCM: 'brcm/BCM.hcd'
[  211.073130] drm_managed_release+0x128/0x228 drm
[  211.413574] drm_dev_put.part.0+0xb4/0xf8 drm
[  211.418639] devm_drm_dev_init_release+0x1c/0x38 drm
[  211.424301] devm_action_release (drivers/base/devres.c:722)
[  211.428470] release_nodes (drivers/base/devres.c:506)
[  211.432189] devres_release_all (drivers/base/devres.c:535)
[  211.436349] device_unbind_cleanup (drivers/base/dd.c:551)
[  211.440688] device_release_driver_internal (drivers/base/dd.c:1280
drivers/base/dd.c:1295)
[  211.445996] device_release_driver (drivers/base/dd.c:1319)
[  211.450333] bus_remove_device (include/linux/kobject.h:193
drivers/base/base.h:73 drivers/base/bus.c:581)
[  211.454494] device_del (drivers/base/core.c:3815)
[  211.458036] platform_device_del.part.0 (drivers/base/platform.c:753)
[  211.462813] platform_device_del (drivers/base/platform.c:764)
[  211.466972] kunit_action_platform_device_del+0x18/0x30 drm_kunit_helpers
[  211.474065] __kunit_action_free (lib/kunit/resource.c:92)
[  211.478228] kunit_remove_resource (include/kunit/resource.h:120
include/linux/kref.h:65 include/kunit/resource.h:138
lib/kunit/resource.c:59 lib/kunit/resource.c:48)
[  211.482741] kunit_cleanup (lib/kunit/test.c:815 (discriminator 1))
[  211.486373] kunit_try_run_case_cleanup (lib/kunit/test.c:412)
[  211.491151] kunit_generic_run_threadfn_adapter (lib/kunit/try-catch.c:30)
[  211.496637] kthread (kernel/kthread.c:388)
[  211.499914] ret_from_fork (arch/arm64/kernel/entry.S:858)
[ 211.503554] Code: 9435d388 f9401a75 aa1503e0 9435d385 (f94002a0)
All code
========
   0: 9435d388 bl 0xd74e20
   4: f9401a75 ldr x21, [x19, #48]
   8: aa1503e0 mov x0, x21
   c: 9435d385 bl 0xd74e20
  10:* f94002a0 ldr x0, [x21] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f94002a0 ldr x0, [x21]
[  211.509739] ---[ end trace 0000000000000000 ]---
[  211.531417] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac43455-sdio for chip BCM4345/6
[  211.540473] brcmfmac mmc0:0001:1: Direct firmware load for
brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.bin failed with error -2
[  211.555864] brcmfmac mmc0:0001:1: Direct firmware load for
brcm/brcmfmac43455-sdio.bin failed with error -2
[  211.562623] xhci_hcd 0000:01:00.0: xHCI Host Controller
[  211.572059] xhci_hcd 0000:01:00.0: new USB bus registered, assigned
bus number 1
[  211.581888] xhci_hcd 0000:01:00.0: hcc params 0x002841eb hci
version 0x100 quirks 0x0000000000000890
[  211.593596] xhci_hcd 0000:01:00.0: xHCI Host Controller
[  211.599291] xhci_hcd 0000:01:00.0: new USB bus registered, assigned
bus number 2
[  211.606923] xhci_hcd 0000:01:00.0: Host supports USB 3.0 SuperSpeed
[  211.616825] hub 1-0:1.0: USB hub found
[  211.621005] hub 1-0:1.0: 1 port detected
[  211.631045] hub 2-0:1.0: USB hub found
[  211.635097] hub 2-0:1.0: 4 ports detected
[  211.879995] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[  212.048581] hub 1-1:1.0: USB hub found
[  212.052854] hub 1-1:1.0: 4 ports detected
[  212.170763] usb 2-2: new SuperSpeed USB device number 2 using xhci_hcd
[  212.201876] usb-storage 2-2:1.0: USB Mass Storage device detected
[  212.209511] usb-storage 2-2:1.0: Quirks match for vid 174c pid 55aa: 400000
[  212.217225] scsi host0: usb-storage 2-2:1.0
[  212.586463] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50
[  213.228696] scsi 0:0:0:0: Direct-Access     ASMT     ASM105x
  0    PQ: 0 ANSI: 6
[  213.246921] sd 0:0:0:0: [sda] 234455040 512-byte logical blocks:
(120 GB/112 GiB)
[  213.255923] sd 0:0:0:0: [sda] Write Protect is off
[  213.260998] sd 0:0:0:0: [sda] Mode Sense: 43 00 00 00
[  213.267569] sd 0:0:0:0: [sda] Write cache: enabled, read cache:
enabled, doesn't support DPO or FUA
[  213.289202] sd 0:0:0:0: [sda] Attached SCSI disk
[  513.002290]     # drm_vc4_test_pv_muxing: try timed out
[  513.007730] ------------[ cut here ]------------
[  513.012479] refcount_t: addition on 0; use-after-free.
[  513.017805] WARNING: CPU: 1 PID: 1702 at lib/refcount.c:25
refcount_warn_saturate (lib/refcount.c:25 (discriminator 1))
[  513.026495] Modules linked in: brcmfmac xhci_pci brcmutil
xhci_pci_renesas raspberrypi_cpufreq cfg80211 hci_uart vc4(+) btqca
btbcm bluetooth snd_soc_hdmi_codec reset_raspberrypi cec
clk_raspberrypi raspberrypi_hwmon drm_dma_helper crct10dif_ce
drm_kunit_helpers rfkill drm_display_helper bcm2711_thermal
i2c_bcm2835 pwm_bcm2835 v3d drm_kms_helper drm_shmem_helper gpu_sched
pcie_brcmstb fuse drm backlight dm_mod ip_tables x_tables
[  513.065278] CPU: 1 PID: 1702 Comm: (udev-worker) Tainted: G    B D
        N 6.6.0-rc5-next-20231011 #1
[  513.074909] Hardware name: Raspberry Pi 4 Model B (DT)
[  513.080125] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  513.087198] pc : refcount_warn_saturate (lib/refcount.c:25 (discriminator 1))
[  513.092156] lr : refcount_warn_saturate (lib/refcount.c:25 (discriminator 1))
[  513.097114] sp : ffff8000880e70c0
[  513.100477] x29: ffff8000880e70c0 x28: ffff8000820cea00 x27: 0000000000000000
[  513.107742] x26: ffff8000880e73f8 x25: ffff000103806900 x24: ffff8000880e73d0
[  513.115006] x23: ffff8000880e7410 x22: ffff000101181580 x21: ffff000103806928
[  513.122268] x20: ffff000103806928 x19: 0000000000000002 x18: 0000000000000000
[  513.129530] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  513.136790] x14: 0000000000000000 x13: 2e656572662d7265 x12: ffff70001101cdb9
[  513.144051] x11: 1ffff0001101cdb8 x10: ffff70001101cdb8 x9 : ffff8000801a2350
[  513.151313] x8 : 00008fffeefe3248 x7 : ffff8000880e6dc7 x6 : 0000000000000001
[  513.158574] x5 : ffff8000880e6dc0 x4 : ffff70001101cdb9 x3 : dfff800000000000
[  513.165836] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00010c1cb480
[  513.173096] Call trace:
[  513.175577] refcount_warn_saturate (lib/refcount.c:25 (discriminator 1))
[  513.180184] kthread_stop (kernel/kthread.c:76 kernel/kthread.c:704)
[  513.183907] kunit_try_catch_run (lib/kunit/try-catch.c:81)
[  513.188251] kunit_run_case_catch_errors (lib/kunit/test.c:501)
[  513.193300] kunit_run_tests (lib/kunit/test.c:606)
[  513.197290] __kunit_test_suites_init (lib/kunit/test.c:675
(discriminator 1) lib/kunit/test.c:664 (discriminator 1))
[  513.201897] kunit_exec_run_tests (lib/kunit/executor.c:270)
[  513.206147] kunit_module_notify (lib/kunit/test.c:724 lib/kunit/test.c:760)
[  513.210490] notifier_call_chain (kernel/notifier.c:93)
[  513.214742] blocking_notifier_call_chain_robust
(kernel/notifier.c:128 kernel/notifier.c:353 kernel/notifier.c:341)
[  513.220407] load_module (include/linux/notifier.h:207
kernel/module/main.c:2740 kernel/module/main.c:2921)
[  513.224221] init_module_from_file (kernel/module/main.c:3099)
[  513.228651] __arm64_sys_finit_module (kernel/module/main.c:3140
kernel/module/main.c:3161 kernel/module/main.c:3144
kernel/module/main.c:3144)
[  513.233434] invoke_syscall (arch/arm64/kernel/syscall.c:37
arch/arm64/kernel/syscall.c:51)
[  513.237248] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:143)
[  513.242209] do_el0_svc (arch/arm64/kernel/syscall.c:156)
[  513.245576] el0_svc (arch/arm64/kernel/entry-common.c:133
arch/arm64/kernel/entry-common.c:144
arch/arm64/kernel/entry-common.c:679)
[  513.248681] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:697)
[  513.253108] el0t_64_sync (arch/arm64/kernel/entry.S:595)
[  513.256830] ---[ end trace 0000000000000000 ]---
[  513.261615] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[  513.270590] Mem abort info:
[  513.273441]   ESR = 0x0000000096000004
[  513.277305]   EC = 0x25: DABT (current EL), IL = 32 bits
[  513.282754]   SET = 0, FnV = 0
[  513.285870]   EA = 0, S1PTW = 0
[  513.289109]   FSC = 0x04: level 0 translation fault
[  513.294131] Data abort info:
[  513.297069]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  513.302677]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  513.307866]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  513.313317] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010c00b000
[  513.319915] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[  513.326880] Internal error: Oops: 0000000096000004 [#2] PREEMPT SMP
[  513.333260] Modules linked in: brcmfmac xhci_pci brcmutil
xhci_pci_renesas raspberrypi_cpufreq cfg80211 hci_uart vc4(+) btqca
btbcm bluetooth snd_soc_hdmi_codec reset_raspberrypi cec
clk_raspberrypi raspberrypi_hwmon drm_dma_helper crct10dif_ce
drm_kunit_helpers rfkill drm_display_helper bcm2711_thermal
i2c_bcm2835 pwm_bcm2835 v3d drm_kms_helper drm_shmem_helper gpu_sched
pcie_brcmstb fuse drm backlight dm_mod ip_tables x_tables
[  513.371993] CPU: 1 PID: 1702 Comm: (udev-worker) Tainted: G    B D
W        N 6.6.0-rc5-next-20231011 #1
[  513.381625] Hardware name: Raspberry Pi 4 Model B (DT)
[  513.386837] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  513.393907] pc : kthread_stop
(arch/arm64/include/asm/atomic_ll_sc.h:203 (discriminator 2)
arch/arm64/include/asm/atomic.h:65 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:3784 (discriminator 2)
include/linux/atomic/atomic-long.h:1069 (discriminator 2)
include/asm-generic/bitops/atomic.h:18 (discriminator 2)
include/asm-generic/bitops/instrumented-atomic.h:29 (discriminator 2)
kernel/kthread.c:705 (discriminator 2))
[  513.397987] lr : kthread_stop
(arch/arm64/include/asm/alternative-macros.h:232
arch/arm64/include/asm/lse.h:21 arch/arm64/include/asm/atomic.h:65
include/linux/atomic/atomic-arch-fallback.h:3784
include/linux/atomic/atomic-long.h:1069
include/asm-generic/bitops/atomic.h:18
include/asm-generic/bitops/instrumented-atomic.h:29
kernel/kthread.c:705)
[  513.401968] sp : ffff8000880e70e0
[  513.405329] x29: ffff8000880e70e0 x28: ffff8000820cea00 x27: 0000000000000000
[  513.412587] x26: ffff8000880e73f8 x25: ffff000103806900 x24: ffff8000880e73d0
[  513.419842] x23: ffff8000880e7410 x22: ffff000101181580 x21: ffff000103806928
[  513.427098] x20: 0000000000000000 x19: ffff000103806900 x18: 0000000000000000
[  513.434352] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[  513.441606] x14: 0000000000000000 x13: 2e656572662d7265 x12: ffff70001101cdb9
[  513.448860] x11: 1ffff0001101cdb8 x10: ffff70001101cdb8 x9 : ffff8000801a2350
[  513.456115] x8 : ffff8000880e70c0 x7 : 0000000000000000 x6 : 0000000000000001
[  513.463368] x5 : 0000000000000000 x4 : ffff00010c1cb480 x3 : 0000000000000000
[  513.470622] x2 : 0000000000000001 x1 : ffff80008762ed60 x0 : 0000000000000001
[  513.477876] Call trace:
[  513.480354] kthread_stop (arch/arm64/include/asm/atomic_ll_sc.h:203
(discriminator 2) arch/arm64/include/asm/atomic.h:65 (discriminator 2)
include/linux/atomic/atomic-arch-fallback.h:3784 (discriminator 2)
include/linux/atomic/atomic-long.h:1069 (discriminator 2)
include/asm-generic/bitops/atomic.h:18 (discriminator 2)
include/asm-generic/bitops/instrumented-atomic.h:29 (discriminator 2)
kernel/kthread.c:705 (discriminator 2))
[  513.484073] kunit_try_catch_run (lib/kunit/try-catch.c:81)
[  513.488417] kunit_run_case_catch_errors (lib/kunit/test.c:501)
[  513.493461] kunit_run_tests (lib/kunit/test.c:606)
[  513.497445] __kunit_test_suites_init (lib/kunit/test.c:675
(discriminator 1) lib/kunit/test.c:664 (discriminator 1))
[  513.502047] kunit_exec_run_tests (lib/kunit/executor.c:270)
[  513.506292] kunit_module_notify (lib/kunit/test.c:724 lib/kunit/test.c:760)
[  513.510630] notifier_call_chain (kernel/notifier.c:93)
[  513.514878] blocking_notifier_call_chain_robust
(kernel/notifier.c:128 kernel/notifier.c:353 kernel/notifier.c:341)
[  513.520537] load_module (include/linux/notifier.h:207
kernel/module/main.c:2740 kernel/module/main.c:2921)
[  513.524345] init_module_from_file (kernel/module/main.c:3099)
[  513.528771] __arm64_sys_finit_module (kernel/module/main.c:3140
kernel/module/main.c:3161 kernel/module/main.c:3144
kernel/module/main.c:3144)
[  513.533550] invoke_syscall (arch/arm64/kernel/syscall.c:37
arch/arm64/kernel/syscall.c:51)
[  513.537359] el0_svc_common.constprop.0 (arch/arm64/kernel/syscall.c:143)
[  513.542316] do_el0_svc (arch/arm64/kernel/syscall.c:156)
[  513.545680] el0_svc (arch/arm64/kernel/entry-common.c:133
arch/arm64/kernel/entry-common.c:144
arch/arm64/kernel/entry-common.c:679)
[  513.548782] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:697)
[  513.553205] el0t_64_sync (arch/arm64/kernel/entry.S:595)
[ 513.556928] Code: c8017e60 35ffffa1 17ffffae f9800291 (c85f7e80)
All code
========
   0: c8017e60 stxr w1, x0, [x19]
   4: 35ffffa1 cbnz w1, 0xfffffffffffffff8
   8: 17ffffae b 0xfffffffffffffec0
   c: f9800291 prfm pstl1strm, [x20]
  10:* c85f7e80 ldxr x0, [x20] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: c85f7e80 ldxr x0, [x20]
[  513.563112] ---[ end trace 0000000000000000 ]---

Links:
 - build: https://storage.tuxsuite.com/public/linaro/lkft/builds/2WblMBAz9gtucRiTnLMgK0KAbYV/
- config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2WblMBAz9gtucRiTnLMgK0KAbYV/config
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2VZLML9vVYDASh7HR2Dk8jsg87c
 - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2WblOoPXGMwdOosTSRRaWPaIVp6

--
Linaro LKFT
https://lkft.linaro.org
