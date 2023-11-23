Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AEA7F5C33
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 11:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0800910E011;
	Thu, 23 Nov 2023 10:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04D1F10E011
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=w06c1
 c5bKiZFqNa3EjrmlSblA1FQeqzrmkZLtfR2Erg=; b=DvHGMob1vXteBYisNHPmh
 G6gyLMZ1+mMWL9atftDCWHvRRIxKFFPMXR/R5XFd2DUBow8cvPiBqlFVJqrYjno8
 oKHwa/U1ekzwhKtJh/QrJ56szYolYwBHwnoBrC0p2cK6Hw/2kQ9TsCv2VsjfyJ0e
 2VeOf8BQXt/QW2kYDOM42k=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g0-2 (Coremail) with SMTP id _____wDXX+wLKF9lx+Y1CA--.58971S2;
 Thu, 23 Nov 2023 18:23:10 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dri-devel@lists.freedesktop.org
Subject: Is there a potential race condition when drm resume?
Date: Thu, 23 Nov 2023 18:23:06 +0800
Message-Id: <20231123102306.3541347-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXX+wLKF9lx+Y1CA--.58971S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw1rtFWrZrW3Cr45Jw17Awb_yoW7Xr1kpF
 nxJrZ2yw4UGrW5JF4xCwn2qw1DZrsY9wnrZws7KrsrGF4ay34UJa98tr40gF4DWr1Yy3sr
 J3W7Can5Zw4ktaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFjgcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiFhExXl44X-f6rgAAsy
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
Cc: Andy Yan <andy.yan@rock-chips.com>, treding@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

Hi:
I get a use-after-free KASAN report on a psr enabled system as bellow:

It seems there is a race happens like this:

task 6074:                                                 userspace                                         
 suspend_devices_and_enter+0xa20/0xba0                     drm_ioctl
 dpm_resume_end+0x20/0x3c                                  drm_mode_atomic_ioctl
 dpm_resume+0x254/0x744                                    drm_atomic_helper_check
 device_resume+0x348/0x5d4                                 drm_self_refresh_helper_alter_state(state);
 platform_pm_resume+0xb4/0xd4                              drm_ioctldrm_self_refresh_helper_entry_work+0xd0/0x354
 rockchip_drm_sys_resume+0x3c/0x50                         drm_atomic_get_crtc_state
 drm_mode_config_helper_resume+0x54/0xdc                   vop2_crtc_duplicate_state
 drm_atomic_helper_resume+0x44/0x2cc                       kmemdup(vcstate)
 drm_mode_config_reset+0x12c/0x280
 vop2_crtc_reset+0x58/0x1cc
 kfree(vcstate)

After read the drm code, I found there is no lock or sync between
drm_ioctl and drm_atomic_helper_resume-->drm_mode_config_reset

So it seems that there are potential race condition between
drm_atomic_helper_resume-->drm_mode_config_reset(reset/free plane/crtc state) and
drm_ioctl->drm_mode_atomic_ioctl->drm_atomic_get_crtc/plane_state ?
Or i missed something ? Any suggestions here would be much appreciated.
 
==================================================================
[    6.767310][T10055] BUG: KASAN: use-after-free in kmemdup+0xa0/0xbc
[    6.767343][T10055] Read of size 680 at addr ffffff81929e1000 by task kworker/1:2/10055
[    6.767365][T10055] 
[    6.767402][T10055] CPU: 1 PID: 10055 Comm: kworker/1:2 Not tainted 5.10.66-abeng..20231117.183336 #2
[    6.767428][T10055] Hardware name: Rockchip RK3588S TABLET CTG30 SSD V11 Board (DT)
[    6.767471][T10055] Workqueue: events drm_self_refresh_helper_entry_work
[    6.767514][T10055] Call trace:
[    6.767548][T10055]  dump_backtrace+0x0/0x3c0
[    6.767575][T10055]  show_stack+0x1c/0x2c
[    6.767609][T10055]  dump_stack_lvl+0x14c/0x1bc
[    6.767641][T10055]  print_address_description+0x88/0x38c
[    6.767670][T10055]  kasan_report+0x180/0x230
[    6.767698][T10055]  kasan_check_range+0x200/0x208
[    6.767727][T10055]  memcpy+0x94/0xf0
[    6.767753][T10055]  kmemdup+0xa0/0xbc
[    6.767787][T10055]  vop2_crtc_duplicate_state+0x4c/0xdc
[    6.767817][T10055]  drm_atomic_get_crtc_state+0x124/0x2e4
[    6.767848][T10055]  drm_self_refresh_helper_entry_work+0xd0/0x354
[    6.767878][T10055]  process_one_work+0x5dc/0xcb4
[    6.767907][T10055]  worker_thread+0x7f0/0xfd8
[    6.767937][T10055]  kthread+0x2fc/0x3bc
[    6.767967][T10055]  ret_from_fork+0x10/0x30
[    6.767990][T10055] 
[    6.768016][T10055] Allocated by task 42:
[    6.768047][T10055]  ____kasan_kmalloc+0xc8/0x10c
[    6.768074][T10055]  __kasan_kmalloc+0x14/0x24
[    6.768103][T10055]  kmem_cache_alloc_trace+0x104/0x474
[    6.768136][T10055]  register_sched_domain_sysctl+0x400/0xd38
[    6.768165][T10055]  partition_sched_domains_locked+0xfc8/0x10cc
[    6.768193][T10055]  partition_sched_domains+0x48/0x68
[    6.768224][T10055]  sched_cpu_activate+0xec/0x340
[    6.768256][T10055]  cpuhp_invoke_callback+0x26c/0x5f4
[    6.768285][T10055]  cpuhp_thread_fun+0x264/0x560
[    6.768315][T10055]  smpboot_thread_fn+0x540/0x95c
[    6.768342][T10055]  kthread+0x2fc/0x3bc
[    6.768370][T10055]  ret_from_fork+0x10/0x30
[    6.768392][T10055] 
[    6.768415][T10055] Freed by task 6074:
[    6.768444][T10055]  kasan_set_track+0x40/0x7c
[    6.768473][T10055]  kasan_set_free_info+0x2c/0x54
[    6.768501][T10055]  ____kasan_slab_free+0x124/0x164
[    6.768528][T10055]  __kasan_slab_free+0x1c/0x30
[    6.768556][T10055]  slab_free_freelist_hook+0x1d4/0x2d4
[    6.768582][T10055]  kfree+0x100/0x2ec
[    6.768610][T10055]  vop2_crtc_reset+0x58/0x1cc
[    6.768641][T10055]  drm_mode_config_reset+0x12c/0x280
[    6.768669][T10055]  drm_atomic_helper_resume+0x44/0x2cc
[    6.768698][T10055]  drm_mode_config_helper_resume+0x54/0xdc
[    6.768727][T10055]  rockchip_drm_sys_resume+0x3c/0x50
[    6.768760][T10055]  platform_pm_resume+0xb4/0xd4
[    6.768788][T10055]  device_resume+0x348/0x5d4
[    6.768815][T10055]  dpm_resume+0x254/0x744
[    6.768842][T10055]  dpm_resume_end+0x20/0x3c
[    6.768873][T10055]  suspend_devices_and_enter+0xa20/0xba0
[    6.768900][T10055]  pm_suspend+0x4d8/0x66c
[    6.768928][T10055]  state_store+0x14c/0x1dc
[    6.768959][T10055]  kobj_attr_store+0x68/0x8c
[    6.768991][T10055]  sysfs_kf_write+0x1c0/0x23c
[    6.769019][T10055]  kernfs_fop_write_iter+0x280/0x3bc
[    6.769049][T10055]  vfs_write+0x5f0/0x7a8
[    6.769077][T10055]  ksys_write+0xc0/0x178
[    6.769104][T10055]  __arm64_sys_write+0x7c/0x94
[    6.769134][T10055]  el0_svc_common+0x168/0x448
[    6.769159][T10055]  do_el0_svc+0x50/0xe8
[    6.769188][T10055]  el0_svc+0x24/0x38
[    6.769214][T10055]  el0_sync_handler+0x88/0xec
[    6.769240][T10055]  el0_sync+0x1a8/0x1c0
[    6.769261][T10055] 
-- 
2.34.1

