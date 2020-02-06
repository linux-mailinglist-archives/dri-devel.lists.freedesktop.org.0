Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48971545DF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 15:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA666FA65;
	Thu,  6 Feb 2020 14:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508996FA65
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 14:14:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206441] New: kernel crash when amdgpu reset while very high
 loading
Date: Thu, 06 Feb 2020 14:14:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wormwang@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206441-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206441

            Bug ID: 206441
           Summary: kernel crash when amdgpu reset while very high loading
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.3.15
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: wormwang@yahoo.com
        Regression: No

environment:
  hw : Huawei TaiShan 2280(aarch64) server
  ubuntu : v5.3.15
  amdgpu : Radeon RX 580
  amdgpu driver: from 5.3.15  kernel

crash:
    kernel crash accidentally  when  the gpu reset while the system is very
high load. The load average is about 600.
    The crash repeated about 8 times  on different machines recently.

kernel log:
,----
| [ 2510.570612] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=11815857, emitted seq=11815860
| [ 2510.570711] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Media35435 pid 70612 thread appstream:cs0 pid 70667
| [ 2510.570722] amdgpu 000d:31:00.0: GPU reset begin!
| [ 2511.066418] amdgpu 000d:31:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
| [ 2511.066525] [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
| [ 2511.322334] cp is busy, skip halt cp
| [ 2511.378072] [drm] schedsdma0 is not ready, skipping
| [ 2511.378075] [drm] schedsdma1 is not ready, skipping
| [ 2511.378931] Unable to handle kernel access to user memory outside uaccess
routines at virtual address 0000000000000008
| [ 2511.378934] Mem abort info:
| [ 2511.378936]   ESR = 0x96000004
| [ 2511.378939]   Exception class = DABT (current EL), IL = 32 bits
| [ 2511.378940]   SET = 0, FnV = 0
| [ 2511.378941]   EA = 0, S1PTW = 0
| [ 2511.378942] Data abort info:
| [ 2511.378943]   ISV = 0, ISS = 0x00000004
| [ 2511.378944]   CM = 0, WnR = 0
| [ 2511.378947] user pgtable: 4k pages, 48-bit VAs, pgdp=0000001f76271000
| [ 2511.378948] [0000000000000008] pgd=0000000000000000
| [ 2511.378954] Internal error: Oops: 96000004 [#1] PREEMPT SMP
| [ 2511.381197] CPU: 59 PID: 16120 Comm: appstream:cs0 Kdump: loaded Tainted:
G           OE     5.3.15-050315.2019121601-generic #jeff
| [ 2511.381507] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.63
09/19/2019
| [ 2511.381709] pstate: 20400005 (nzCv daif +PAN -UAO)
| [ 2511.382017] pc : amdgpu_cs_ioctl+0x173c/0x1998 [amdgpu]
| [ 2511.382255] lr : amdgpu_cs_ioctl+0x16fc/0x1998 [amdgpu]
| [ 2511.382392] sp : ffff00006b3e39e0
| [ 2511.382459] x29: ffff00006b3e39e0 x28: 0000000000000000
| [ 2511.382603] x27: ffff00006b3e3ca8 x26: ffff000011b19b48
| [ 2511.382756] x25: 0000000000000000 x24: 0000000000000000
| [ 2511.382907] x23: ffff8093ba510df8 x22: ffff00000976da44
| [ 2511.383056] x21: ffff8096a48a8400 x20: ffff8097c5460000
| [ 2511.383202] x19: 0000000000000000 x18: 0000000000000000
| [ 2511.383340] x17: 0000000000000000 x16: 0000000000000000
| [ 2511.383491] x15: 0000000000000000 x14: 0000000000000000
| [ 2511.383641] x13: 0000000000000000 x12: 0000000000000000
| [ 2511.383791] x11: 0000000000000000 x10: 0000000000000040
| [ 2511.383937] x9 : 0000000000000000 x8 : ffff8093ba511000
| [ 2511.384087] x7 : 00000000a14eea3b x6 : ffff8096a48a8a00
| [ 2511.384243] x5 : ffff8093ba510c00 x4 : ffff00006b3e3a88
| [ 2511.384395] x3 : ffff801fd5427320 x2 : 0000000000000000
| [ 2511.384529] x1 : 0000000000000000 x0 : 0000000000000000
| [ 2511.384681] Call trace:
| [ 2511.384852]  amdgpu_cs_ioctl+0x173c/0x1998 [amdgpu]
| [ 2511.389484]  drm_ioctl_kernel+0xb4/0x100 [drm]
| [ 2511.394027]  drm_ioctl+0x218/0x400 [drm]
| [ 2511.398696]  amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
| [ 2511.403156]  do_vfs_ioctl+0xc4/0xb70
| [ 2511.407477]  ksys_ioctl+0x84/0xb8
| [ 2511.411706]  __arm64_sys_ioctl+0x28/0x38
| [ 2511.415663]  el0_svc_common.constprop.3+0xa4/0x1c8
| [ 2511.419497]  el0_svc_handler+0x34/0x90
| [ 2511.423165]  el0_svc+0x10/0x14
| [ 2511.426733] Code: 540006e1 f90077e0 52800002 f9400800 (f9400400)
| [ 2511.430388] SMP: stopping secondary CPUs
| [ 2511.436245] Starting crashdump kernel...
| [ 2511.439485] Bye!
| 
| 
|   (gdb) l *(amdgpu_vm_sdma_commit+0x54)
|   0x54 is in amdgpu_vm_sdma_commit
(/home/motech/src/v5.3.15/v5.3.15/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c:102).
|   97              struct amdgpu_ib *ib = p->job->ibs;
|   98              struct amdgpu_ring *ring;
|   99              struct dma_fence *f;
|   100             int r;
|   101
|   102             ring = container_of(p->vm->entity.rq->sched, struct
amdgpu_ring, sched);
|   103
|   104             WARN_ON(ib->length_dw == 0);
|   105             amdgpu_ring_pad_ib(ring, ib);
|   106             WARN_ON(ib->length_dw > p->num_dw_left);
|   (gdb)
`----

    There was a gpu reset before the crash (null point)and the crash position
was different on  different machines, so I think the other layers used to the
release the memory during the gpu reset processs.



log:
   the first crash log
,----
| [ 2489.810091] binder_dkms: undelivered transaction 51778751, process died.
| [ 2489.810543] binder_dkms: undelivered transaction 51774314, process died.
| [ 2489.810547] binder_dkms: undelivered transaction 51774321, process died.
| [ 2492.207798] amdgpu 000d:31:00.0: GPU fault detected: 146 0x0000480c for
process Media35435 pid 70612 thread appstream:cs0 pid 70667
| [ 2492.207806] amdgpu 000d:31:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
| [ 2492.207808] amdgpu 000d:31:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E04800C
| [ 2492.207812] amdgpu 000d:31:00.0: VM fault (0x0c, vmid 7, pasid 32854) at
page 0, read from 'TC4' (0x54433400) (72)
| [ 2494.532757] binder_cleanup_transaction: 4 callbacks suppressed
| [ 2494.532763] binder_dkms: undelivered transaction 51870919, process died.
| [ 2494.532885] binder_dkms: undelivered TRANSACTION_COMPLETE
| [ 2494.532888] binder_dkms: undelivered transaction 51871017, process died.
| [ 2494.533172] binder_dkms: undelivered transaction 51871031, process died.
| [ 2494.533364] binder_dkms: undelivered transaction 51875739, process died.
| [ 2494.533724] binder_dkms: undelivered transaction 51870920, process died.
| [ 2494.533727] binder_dkms: undelivered transaction 51875737, process died.
| [ 2494.713333] binder_dkms: 23592:23921 IncRefs 0 refcount change on invalid
ref 13 ret -22
| [ 2494.713340] binder_dkms: 23592:23921 Acquire 1 refcount change on invalid
ref 13 ret -22
| [ 2494.713347] binder_dkms: transaction release 51765348 bad handle 13, ret =
-22
| [ 2494.984179] binder_dkms: undelivered TRANSACTION_COMPLETE
| [ 2494.984187] binder_dkms: undelivered transaction 51878867, process died.
| [ 2495.368273] binder_dkms: 1545523: binder_alloc_buf, no vma
| [ 2495.368284] binder_dkms: 114651:124581 transaction failed 29189/-3, size
104-0 line 3078
| [ 2495.387489] binder_dkms: undelivered TRANSACTION_COMPLETE
| [ 2500.361421] binder_dkms: release 1528844:1543299 transaction 51835149 out,
still active
| [ 2500.361428] binder_dkms: undelivered TRANSACTION_COMPLETE
| [ 2500.361572] binder_cleanup_transaction: 8 callbacks suppressed
| [ 2500.361574] binder_dkms: undelivered transaction 51977335, process died.
| [ 2500.362282] binder_dkms: undelivered transaction 51977218, process died.
| [ 2507.289938] binder_dkms: undelivered transaction 52079922, process died.
| [ 2507.289941] binder_dkms: undelivered transaction 52079927, process died.
| [ 2508.065330] binder_dkms: undelivered transaction 52090811, process died.
| [ 2508.066126] binder_dkms: undelivered transaction 52089931, process died.
| [ 2508.066129] binder_dkms: undelivered transaction 52090005, process died.
| [ 2508.066132] binder_dkms: undelivered transaction 52090010, process died.
| [ 2510.570612] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=11815857, emitted seq=11815860
| [ 2510.570711] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Media35435 pid 70612 thread appstream:cs0 pid 70667
| [ 2510.570722] amdgpu 000d:31:00.0: GPU reset begin!
| [ 2510.835555] binder_dkms: undelivered transaction 52135447, process died.
| [ 2510.835735] binder_dkms: undelivered transaction 52136417, process died.
| [ 2511.066418] amdgpu 000d:31:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_2.1.0 test failed (-110)
| [ 2511.066525] [drm:gfx_v8_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
| [ 2511.322334] cp is busy, skip halt cp
| [ 2511.378072] [drm] schedsdma0 is not ready, skipping
| [ 2511.378075] [drm] schedsdma1 is not ready, skipping
| [ 2511.378931] Unable to handle kernel access to user memory outside uaccess
routines at virtual address 0000000000000008
| [ 2511.378934] Mem abort info:
| [ 2511.378936]   ESR = 0x96000004
| [ 2511.378939]   Exception class = DABT (current EL), IL = 32 bits
| [ 2511.378940]   SET = 0, FnV = 0
| [ 2511.378941]   EA = 0, S1PTW = 0
| [ 2511.378942] Data abort info:
| [ 2511.378943]   ISV = 0, ISS = 0x00000004
| [ 2511.378944]   CM = 0, WnR = 0
| [ 2511.378947] user pgtable: 4k pages, 48-bit VAs, pgdp=0000001f76271000
| [ 2511.378948] [0000000000000008] pgd=0000000000000000
| [ 2511.378954] Internal error: Oops: 96000004 [#1] PREEMPT SMP
| [ 2511.381197] CPU: 59 PID: 16120 Comm: appstream:cs0 Kdump: loaded Tainted:
G           OE     5.3.15-050315.2019121601-generic #jeff
| [ 2511.381507] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.63
09/19/2019
| [ 2511.381709] pstate: 20400005 (nzCv daif +PAN -UAO)
| [ 2511.382017] pc : amdgpu_cs_ioctl+0x173c/0x1998 [amdgpu]
| [ 2511.382255] lr : amdgpu_cs_ioctl+0x16fc/0x1998 [amdgpu]
| [ 2511.382392] sp : ffff00006b3e39e0
| [ 2511.382459] x29: ffff00006b3e39e0 x28: 0000000000000000
| [ 2511.382603] x27: ffff00006b3e3ca8 x26: ffff000011b19b48
| [ 2511.382756] x25: 0000000000000000 x24: 0000000000000000
| [ 2511.382907] x23: ffff8093ba510df8 x22: ffff00000976da44
| [ 2511.383056] x21: ffff8096a48a8400 x20: ffff8097c5460000
| [ 2511.383202] x19: 0000000000000000 x18: 0000000000000000
| [ 2511.383340] x17: 0000000000000000 x16: 0000000000000000
| [ 2511.383491] x15: 0000000000000000 x14: 0000000000000000
| [ 2511.383641] x13: 0000000000000000 x12: 0000000000000000
| [ 2511.383791] x11: 0000000000000000 x10: 0000000000000040
| [ 2511.383937] x9 : 0000000000000000 x8 : ffff8093ba511000
| [ 2511.384087] x7 : 00000000a14eea3b x6 : ffff8096a48a8a00
| [ 2511.384243] x5 : ffff8093ba510c00 x4 : ffff00006b3e3a88
| [ 2511.384395] x3 : ffff801fd5427320 x2 : 0000000000000000
| [ 2511.384529] x1 : 0000000000000000 x0 : 0000000000000000
| [ 2511.384681] Call trace:
| [ 2511.384852]  amdgpu_cs_ioctl+0x173c/0x1998 [amdgpu]
| [ 2511.389484]  drm_ioctl_kernel+0xb4/0x100 [drm]
| [ 2511.394027]  drm_ioctl+0x218/0x400 [drm]
| [ 2511.398696]  amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
| [ 2511.403156]  do_vfs_ioctl+0xc4/0xb70
| [ 2511.407477]  ksys_ioctl+0x84/0xb8
| [ 2511.411706]  __arm64_sys_ioctl+0x28/0x38
| [ 2511.415663]  el0_svc_common.constprop.3+0xa4/0x1c8
| [ 2511.419497]  el0_svc_handler+0x34/0x90
| [ 2511.423165]  el0_svc+0x10/0x14
| [ 2511.426733] Code: 540006e1 f90077e0 52800002 f9400800 (f9400400)
| [ 2511.430388] SMP: stopping secondary CPUs
| [ 2511.436245] Starting crashdump kernel...
| [ 2511.439485] Bye!
`----
the second crash log
,----
| [21378.992080] binder_dkms: undelivered TRANSACTION_COMPLETE
| [21378.992085] binder_dkms: undelivered transaction 472869055, process died.
| [21378.992170] binder_dkms: undelivered transaction 472869381, process died.
| [21379.914175] binder_dkms: 532753 invalid dec weak, ref 472728014 desc 35 s
1 w 0
| [21379.965133] binder_dkms: undelivered TRANSACTION_COMPLETE
| [21380.973171] binder_dkms: 18770:18784 DecRefs 0 refcount change on invalid
ref 13 ret -22
| [21381.332315] binder_dkms: 18770:19056 IncRefs 0 refcount change on invalid
ref 13 ret -22
| [21381.332323] binder_dkms: 18770:19056 Acquire 1 refcount change on invalid
ref 13 ret -22
| [21381.332331] binder_dkms: transaction release 472926067 bad handle 13, ret
= -22
| [21382.750573] amdgpu 000d:31:00.0: GPU fault detected: 146 0x0000480c for
process Media14139 pid 111553 thread appstream:cs0 pid 111628
| [21382.750580] amdgpu 000d:31:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
| [21382.750582] amdgpu 000d:31:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0C04800C
| [21382.750586] amdgpu 000d:31:00.0: VM fault (0x0c, vmid 6, pasid 32886) at
page 0, read from 'TC4' (0x54433400) (72)
| [21384.479407] binder_dkms: 530213:530294 DecRefs 0 refcount change on
invalid ref 72 ret -22
| [21385.878272] binder_cleanup_transaction: 12 callbacks suppressed
| [21385.878277] binder_dkms: undelivered transaction 473011235, process died.
| [21385.879550] binder_dkms: undelivered transaction 473010940, process died.
| [21385.879555] binder_dkms: undelivered transaction 473010943, process died.
| [21386.759032] binder_dkms: undelivered TRANSACTION_COMPLETE
| [21386.759042] binder_dkms: undelivered transaction 473022753, process died.
| [21386.759069] binder_dkms: undelivered transaction 473023013, process died.
| [21386.759221] binder_dkms: undelivered transaction 473027708, process died.
| [21386.759966] binder_dkms: undelivered transaction 473022938, process died.
| [21386.759970] binder_dkms: undelivered transaction 473022939, process died.
| [21386.759977] binder_dkms: undelivered transaction 473027704, process died.
| [21390.060819] binder_dkms: release 499274:528095 transaction 472963476 out,
still active
| [21390.060827] binder_dkms: undelivered TRANSACTION_COMPLETE
| [21390.060848] binder_dkms: undelivered transaction 473070877, process died.
| [21390.063188] binder_dkms: 48074:138549 transaction failed 29189/0, size
24-0 line 2857
| [21390.063194] binder_dkms: send failed reply for transaction 472963476,
target dead
| [21391.133544] binder_dkms: 541607:541664 DecRefs 0 refcount change on
invalid ref 59 ret -22
| [21391.198764] binder_dkms: undelivered TRANSACTION_COMPLETE
| [21391.198773] binder_cleanup_transaction: 2 callbacks suppressed
| [21391.198776] binder_dkms: undelivered transaction 473087060, process died.
| [21393.440950] binder_dkms: 22941:24542 transaction failed 29189/0, size 24-0
line 2857
| [21393.440955] binder_dkms: send failed reply for transaction 472963295,
target dead
| [21394.958429] binder_dkms: 572751:572799 DecRefs 0 refcount change on
invalid ref 9 ret -22
| [21394.961455] binder_dkms: 572751:572751 IncRefs 0 refcount change on
invalid ref 9 ret -22
| [21394.961461] binder_dkms: 572751:572751 Acquire 1 refcount change on
invalid ref 9 ret -22
| [21394.961466] binder_dkms: transaction release 473156420 bad handle 9, ret =
-22
| [21399.299028] binder_dkms: undelivered transaction 473215166, process died.
| [21399.299291] binder_dkms: undelivered transaction 473215454, process died.
| [21399.300374] binder_dkms: undelivered transaction 473215343, process died.
| [21399.300377] binder_dkms: undelivered transaction 473215346, process died.
| [21403.491946] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=112112021, emitted seq=112112024
| [21403.492046] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Media14139 pid 111553 thread appstream:cs0 pid 111628
| [21403.492058] amdgpu 000d:31:00.0: GPU reset begin!
| [21403.492990] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspend
of IP block <vce_v3_0> failed -22
| [21403.762844] [drm] schedsdma0 is not ready, skipping
| [21403.762848] [drm] schedsdma1 is not ready, skipping
| [21403.763249] Unable to handle kernel access to user memory outside uaccess
routines at virtual address 0000000000000008
| [21403.763251] Mem abort info:
| [21403.763253]   ESR = 0x96000004
| [21403.763255]   Exception class = DABT (current EL), IL = 32 bits
| [21403.763256]   SET = 0, FnV = 0
| [21403.763258]   EA = 0, S1PTW = 0
| [21403.763259] Data abort info:
| [21403.763260]   ISV = 0, ISS = 0x00000004
| [21403.763261]   CM = 0, WnR = 0
| [21403.763263] user pgtable: 4k pages, 48-bit VAs, pgdp=0000009790575000
| [21403.763264] [0000000000000008] pgd=0000000000000000
| [21403.763268] Internal error: Oops: 96000004 [#1] PREEMPT SMP
| [21403.765739] CPU: 1 PID: 12845 Comm: appstream:cs0 Kdump: loaded Tainted: G
          OE     5.3.15-050315.2019121601-generic #jeff
| [21403.766081] Hardware name: Huawei TaiShan 2280 /BC11SPCD, BIOS 1.63
09/19/2019
| [21403.766294] pstate: 60400005 (nZCv daif +PAN -UAO)
| [21403.766532] pc : amdgpu_vm_sdma_commit+0x54/0x150 [amdgpu]
| [21403.766781] lr : amdgpu_vm_bo_update_mapping+0xe8/0xf0 [amdgpu]
| [21403.766954] sp : ffff000046f23820
| [21403.767042] x29: ffff000046f23820 x28: 0000000000000001
| [21403.767198] x27: ffff8097c51a0000 x26: 0000000000000000
| [21403.767352] x25: ffff8097c54a9000 x24: 0000009790c00000
| [21403.767509] x23: ffff809788cd4ab8 x22: 0000000000100200
| [21403.767662] x21: ffff8015474d35f8 x20: ffff000011b19b48
| [21403.767812] x19: ffff000046f238e0 x18: 0000000000000000
| [21403.767968] x17: 0000000000000000 x16: 0000000000000000
| [21403.768119] x15: 0000000000000000 x14: 0000000000000000
| [21403.768268] x13: 0000000000000000 x12: 0000000000000000
| [21403.768411] x11: 0000000000000000 x10: 0000000000000001
| [21403.768558] x9 : 0000000000000000 x8 : ffff000009904300
| [21403.768702] x7 : 0000000000001000 x6 : ffff00000998ee60
| [21403.768855] x5 : ffff000046f23818 x4 : 0000000000100200
| [21403.769003] x3 : fffffffffffffc00 x2 : 0000000000000000
| [21403.769157] x1 : 0000000000000014 x0 : ffff8097c54ae000
| [21403.769308] Call trace:
| [21403.769474]  amdgpu_vm_sdma_commit+0x54/0x150 [amdgpu]
| [21403.774222]  amdgpu_vm_bo_update_mapping+0xe8/0xf0 [amdgpu]
| [21403.779019]  amdgpu_vm_bo_update+0x2e0/0x718 [amdgpu]
| [21403.783872]  amdgpu_cs_ioctl+0x1070/0x1998 [amdgpu]
| [21403.788614]  drm_ioctl_kernel+0xb4/0x100 [drm]
| [21403.793182]  drm_ioctl+0x218/0x400 [drm]
| [21403.797609]  amdgpu_drm_ioctl+0x58/0x90 [amdgpu]
| [21403.801749]  do_vfs_ioctl+0xc4/0xb70
| [21403.805745]  ksys_ioctl+0x84/0xb8
| [21403.809538]  __arm64_sys_ioctl+0x28/0x38
| [21403.813289]  el0_svc_common.constprop.3+0xa4/0x1c8
| [21403.816927]  el0_svc_handler+0x34/0x90
| [21403.820347]  el0_svc+0x10/0x14
| [21403.823674] Code: f940c435 f9406402 b9400aa1 f9404019 (f9400456)
| [21403.826938] SMP: stopping secondary CPUs
| [21403.831420] Starting crashdump kernel...
| [21403.834427] Bye!
| 

pls triage the crash and fix it.

BR
Wang

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
