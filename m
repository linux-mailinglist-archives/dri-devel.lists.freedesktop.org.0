Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42FA33EE94
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 11:46:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DFE6E513;
	Wed, 17 Mar 2021 10:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EBF6E513
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:46:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B084F64F38
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615978003;
 bh=9/xtNube1/VHzm+0wk0vJjA7mCCPF7NNmBn6df0Iw8I=;
 h=From:To:Subject:Date:From;
 b=uNi0+rPoLEx3TDxr7OxGf7WWFNlQ4r5fGjmBnCxJ6zACRn+D6IBxR0I9F1c389G+j
 Ya9YmWm3llgZloVJ5V0Sv3gy60nutBp++R/S5wLXfjjF7j8XgwyNGyBbP766RIQ1i+
 Fm2I7yy6x3IW3udzhxpzLgK4bNa9+O/LvFVBMZMWC9wEN/iYW7sPyKWW8tM/oMFduR
 ZaXuOv/75zT4kUQn1pClSnTHUEz1zqrVfbW4oPrCuGyFsvxfUi1DjUl6zdSLilfLpd
 rENkF6L7bbaREbQDLgl0e8w6i6XkKiwpCHlnbIkT1LVS4NIO/zgpHDwOeyPb1z6y87
 IUNQcbzLJwv9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A599E653C5; Wed, 17 Mar 2021 10:46:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212311] New: amdgpu DCN callis sleeping function in illegal
 context
Date: Wed, 17 Mar 2021 10:46:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nirmoy.aiemd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212311-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212311

            Bug ID: 212311
           Summary: amdgpu DCN callis sleeping function in illegal context
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: nirmoy.aiemd@gmail.com
        Regression: No

Getting below warning on boot with Navi10

[   25.204238] [drm] reserve 0x900000 from 0x81fe400000 for PSP TMR
[   25.243138] amdgpu 0000:44:00.0: amdgpu: RAS: optional ras ta ucode is not
available
[   25.247390] amdgpu 0000:44:00.0: amdgpu: RAP: optional rap ta ucode is not
available
[   25.247393] amdgpu 0000:44:00.0: amdgpu: SECUREDISPLAY: securedisplay ta
ucode is not available
[   25.247497] amdgpu 0000:44:00.0: amdgpu: use vbios provided pptable
[   25.247499] amdgpu 0000:44:00.0: amdgpu: smc_dpm_info table
revision(format.content): 4.5
[   25.283692] amdgpu 0000:44:00.0: amdgpu: SMU is initialized successfully!
[   25.283718] BUG: sleeping function called from invalid context at
include/linux/sched/mm.h:196
[   25.283735] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 373,
name: kworker/6:2
[   25.283749] 2 locks held by kworker/6:2/373:
[   25.283751]  #0: ffff9e7b07c59148 ((wq_completion)events){....}-{0:0}, at:
process_one_work+0x1fb/0x4f0
[   25.283760]  #1: ffffaab6441c3e68
((work_completion)(&wfc.work)){....}-{0:0}, at: process_one_work+0x1fb/0x4f0
[   25.283768] CPU: 6 PID: 373 Comm: kworker/6:2 Tainted: G            E    
5.11.0-1-default+ #171
[   25.283770] Hardware name: Gigabyte Technology Co., Ltd. X399 DESIGNARE
EX/X399 DESIGNARE EX-CF, BIOS F12i 09/24/2019
[   25.283772] Workqueue: events work_for_cpu_fn
[   25.283776] Call Trace:
[   25.283780]  dump_stack+0x6b/0x83
[   25.283785]  ___might_sleep.cold+0xa7/0xb7
[   25.283789]  kmem_cache_alloc_trace+0x30a/0x360
[   25.283796]  dccg2_create+0x2d/0x80 [amdgpu]
[   25.283985]  dcn20_resource_construct+0x389/0xd30 [amdgpu]
[   25.284146]  ? fs_reclaim_release+0x46/0x80
[   25.284150]  ? dcn20_create_resource_pool+0x25/0x80 [amdgpu]
[   25.284308]  ? kmem_cache_alloc_trace+0x1a4/0x360
[   25.284310]  ? __kmalloc+0x1c1/0x3c0
[   25.284314]  dcn20_create_resource_pool+0x3c/0x80 [amdgpu]
[   25.284472]  dc_create_resource_pool+0x13f/0x1d0 [amdgpu]
[   25.284627]  dc_create+0x203/0x7b0 [amdgpu]
[   25.284783]  amdgpu_dm_init.isra.0+0x1de/0x270 [amdgpu]
[   25.284940]  ? dev_vprintk_emit+0x12c/0x150
[   25.284947]  ? dev_printk_emit+0x4e/0x65
[   25.284958]  dm_hw_init+0xe/0x20 [amdgpu]
[   25.285111]  amdgpu_device_init.cold+0x13e6/0x17ad [amdgpu]
[   25.285265]  ? pci_bus_read_config_word+0x49/0x70
[   25.285271]  amdgpu_driver_load_kms+0x64/0x260 [amdgpu]
[   25.285393]  amdgpu_pci_probe+0x122/0x1b0 [amdgpu]
[   25.285513]  local_pci_probe+0x42/0x80
[   25.285517]  work_for_cpu_fn+0x16/0x20
[   25.285520]  process_one_work+0x28c/0x4f0
[   25.285526]  worker_thread+0x20d/0x3f0
[   25.285528]  ? rescuer_thread+0x390/0x390
[   25.285531]  kthread+0x13a/0x150
[   25.285534]  ? __kthread_bind_mask+0x60/0x60
[   25.285537]  ret_from_fork+0x22/0x30
[   25.285853] [drm] Display Core initialized with v3.2.127!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
