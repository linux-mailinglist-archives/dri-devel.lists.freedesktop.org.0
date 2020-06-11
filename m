Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB41F608F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752006E88D;
	Thu, 11 Jun 2020 03:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8916E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 03:31:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208135] AMDGPU sleep with preemption disabled
Date: Thu, 11 Jun 2020 03:31:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yshuiv7@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208135-2300-i1XTT9ZjlX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208135-2300@https.bugzilla.kernel.org/>
References: <bug-208135-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=208135

--- Comment #2 from yshuiv7@gmail.com ---
And another one:

[    2.071364] BUG: sleeping function called from invalid context at
mm/slab.h:567
[    2.071379] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name:
swapper/0
[    2.071393] 1 lock held by swapper/0/1:
[    2.071402]  #0: ffff953e072b7228 (&dev->mutex){....}-{3:3}, at:
device_driver_attach+0x48/0xc0
[    2.071422] Preemption disabled at:
[    2.071424] [<ffffffffb8a7ff2e>] kernel_fpu_begin+0xe/0x70
[    2.071443] CPU: 18 PID: 1 Comm: swapper/0 Tainted: G                T
5.7.2-local+ #17
[    2.071458] Hardware name: System manufacturer System Product Name/ROG STRIX
X470-F GAMING, BIOS 5406 11/13/2019
[    2.071476] Call Trace:
[    2.071485]  show_stack+0x3e/0x40
[    2.071494]  dump_stack+0x7a/0xaa
[    2.071504]  ___might_sleep.cold+0xfa/0x10b
[    2.071515]  __might_sleep+0x50/0x90
[    2.071526]  kmem_cache_alloc_trace+0x1b1/0x200
[    2.071536]  ? dccg2_create+0x3a/0x70
[    2.071546]  dccg2_create+0x3a/0x70
[    2.071556]  dcn20_resource_construct+0x2e2/0xb00
[    2.071567]  ? rcu_read_lock_sched_held+0x5a/0xa0
[    2.071578]  ? trace_kmalloc+0x105/0x130
[    2.071589]  ? kmem_cache_alloc_trace+0xec/0x200
[    2.071600]  dcn20_create_resource_pool+0x47/0x70
[    2.071612]  dc_create_resource_pool+0x142/0x170
[    2.071622]  ? dal_gpio_service_create+0x98/0x120
[    2.071633]  dc_construct+0x1b1/0x360
[    2.071644]  dc_create+0x48/0x120
[    2.071653]  amdgpu_dm_init.isra.0+0x155/0x1b0
[    2.071669]  dm_hw_init+0xe/0x20
[    2.071678]  amdgpu_device_ip_init+0x2b5/0x33e
[    2.071690]  amdgpu_device_init.cold+0x74f/0x9f3
[    2.071701]  amdgpu_driver_load_kms+0x51/0x180
[    2.071711]  amdgpu_pci_probe+0xbb/0x140
[    2.071722]  pci_device_probe+0xf2/0x160
[    2.071733]  really_probe+0xf5/0x420
[    2.071743]  driver_probe_device+0xc2/0x110
[    2.071754]  device_driver_attach+0xb9/0xc0
[    2.071764]  __driver_attach+0x94/0x150
[    2.071774]  ? device_driver_attach+0xc0/0xc0
[    2.071784]  bus_for_each_dev+0x6b/0xa0
[    2.071794]  driver_attach+0x19/0x20
[    2.071803]  bus_add_driver+0x149/0x200
[    2.071813]  driver_register+0x8c/0xe0
[    2.071823]  __pci_register_driver+0x6b/0x80
[    2.071834]  amdgpu_init+0x9c/0xbc
[    2.071842]  ? drm_sched_fence_slab_init+0x7e/0x7e
[    2.071853]  do_one_initcall+0x5c/0x330
[    2.071863]  ? rcu_read_lock_sched_held+0x5a/0xa0
[    2.071876]  do_initcalls+0x104/0x162
[    2.071886]  kernel_init_freeable+0x193/0x235
[    2.071897]  ? rest_init+0x241/0x241
[    2.071906]  kernel_init+0x9/0xff
[    2.071914]  ret_from_fork+0x27/0x50

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
