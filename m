Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9388E14FCB6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 11:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB6E6EA96;
	Sun,  2 Feb 2020 10:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD796EA96
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2020 10:54:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206389] New: ambgpu crashes randomly
Date: Sun, 02 Feb 2020 10:54:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rob@sandersmail.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206389-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206389

            Bug ID: 206389
           Summary: ambgpu crashes randomly
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.16
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rob@sandersmail.eu
        Regression: No

Created attachment 287075
  --> https://bugzilla.kernel.org/attachment.cgi?id=287075&action=edit
big crash log file

The driver crashes randomly at least once every few hours. Sometimes when left
idle, sometimes when just using chrome. I haven't found a way to reliably
reproduce the issue. After the crash the screen is full of artefacts and the
only way forward is to restart the PC.

Backtrace #1:

Feb 02 10:29:49 trudex kernel: [drm:gfx_v9_0_priv_reg_irq [amdgpu]] *ERROR*
Illegal register access in command stream
Feb 02 10:29:49 trudex kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
gfx timeout, signaled seq=386096, emitted seq=386097
Feb 02 10:29:49 trudex kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process kwin_x11 pid 895 thread kwin_x11:cs0 pid 1006
Feb 02 10:29:49 trudex kernel: amdgpu 0000:03:00.0: GPU reset begin!
Feb 02 10:29:50 trudex kernel: ------------[ cut here ]------------
Feb 02 10:29:50 trudex kernel: WARNING: CPU: 4 PID: 1210 at
kernel/kthread.c:510 kthread_park+0x85/0xa0
Feb 02 10:29:50 trudex kernel: Modules linked in: rfcomm bnep 8021q mei_hdcp
mxm_wmi amdgpu btusb btrtl btbcm btintel bluetooth snd_hda_codec_hdmi
snd_hda_intel ecdh_generic rfkill snd_intel_nhlt snd_hda_codec ecc snd_oxygen
snd_oxygen_lib snd_hda_core snd_mpu401_uart e>
Feb 02 10:29:50 trudex kernel: CPU: 4 PID: 1210 Comm: ThreadPoolForeg Not
tainted 5.4.16-900.native #1
Feb 02 10:29:50 trudex kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./Z170M Pro4S, BIOS P7.40 01/23/2018
Feb 02 10:29:50 trudex kernel: RIP: 0010:kthread_park+0x85/0xa0
Feb 02 10:29:50 trudex kernel: Code: 32 31 c0 5b 31 f6 41 5c 5d 89 f7 c3 0f 0b
a8 04 49 8b 9c 24 c8 05 00 00 74 ab 0f 0b 5b b8 da ff ff ff 31 f6 41 5c 5d 89
f7 c3 <0f> 0b b8 f0 ff ff ff eb d0 0f 0b eb cc 66 66 2e 0f 1f 84 00 00 00
Feb 02 10:29:50 trudex kernel: RSP: 0018:ffffafd401edfaf8 EFLAGS: 00010202
Feb 02 10:29:50 trudex kernel: RAX: 0000000000000004 RBX: ffffa39cd04f5240 RCX:
0000000000000000
Feb 02 10:29:50 trudex kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffffa39a9f151f40
Feb 02 10:29:50 trudex kernel: RBP: ffffafd401edfb08 R08: 0000000000000000 R09:
0000000000000000
Feb 02 10:29:50 trudex kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
ffffa39a9f151f40
Feb 02 10:29:50 trudex kernel: R13: ffffa398eada0000 R14: ffffa398eada4e88 R15:
0000000000000206
Feb 02 10:29:50 trudex kernel: FS:  00007efe25c67700(0000)
GS:ffffa39cd6300000(0000) knlGS:0000000000000000
Feb 02 10:29:50 trudex kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Feb 02 10:29:50 trudex kernel: CR2: 00007f2b7562a000 CR3: 000000038a88e004 CR4:
00000000003606e0
Feb 02 10:29:50 trudex kernel: DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
Feb 02 10:29:50 trudex kernel: DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
Feb 02 10:29:50 trudex kernel: Call Trace:
Feb 02 10:29:50 trudex kernel:  drm_sched_entity_fini+0x46/0x1d0 [gpu_sched]
Feb 02 10:29:50 trudex kernel:  drm_sched_entity_destroy+0x1b/0x30 [gpu_sched]
Feb 02 10:29:50 trudex kernel:  amdgpu_vm_fini+0x4e/0x3e0 [amdgpu]
Feb 02 10:29:50 trudex kernel:  amdgpu_driver_postclose_kms+0x17c/0x250
[amdgpu]
Feb 02 10:29:50 trudex kernel:  drm_file_free.part.0+0x232/0x2f0
Feb 02 10:29:50 trudex kernel:  drm_close_helper.isra.0+0x6e/0x80
Feb 02 10:29:50 trudex kernel:  drm_release+0x4c/0x90
Feb 02 10:29:50 trudex kernel:  __fput+0xbf/0x270
Feb 02 10:29:50 trudex kernel:  ____fput+0x9/0x10
Feb 02 10:29:50 trudex kernel:  task_work_run+0x8f/0xc0
Feb 02 10:29:50 trudex kernel:  do_exit+0x347/0xb50
Feb 02 10:29:50 trudex kernel:  ? hrtimer_cancel+0x10/0x20
Feb 02 10:29:50 trudex kernel:  do_group_exit+0x3e/0xa0
Feb 02 10:29:50 trudex kernel:  get_signal+0x159/0x830
Feb 02 10:29:50 trudex kernel:  do_signal+0x2f/0x270
Feb 02 10:29:50 trudex kernel:  ? do_futex+0x122/0x1f0
Feb 02 10:29:50 trudex kernel:  ? __x64_sys_futex+0x12b/0x160
Feb 02 10:29:50 trudex kernel:  exit_to_usermode_loop+0x69/0xd0
Feb 02 10:29:50 trudex kernel:  do_syscall_64+0x180/0x1c0
Feb 02 10:29:50 trudex kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Feb 02 10:29:50 trudex kernel: RIP: 0033:0x7efe39989e40
Feb 02 10:29:50 trudex kernel: Code: Bad RIP value.
Feb 02 10:29:50 trudex kernel: RSP: 002b:00007efe25c66620 EFLAGS: 00000246
ORIG_RAX: 00000000000000ca
Feb 02 10:29:50 trudex kernel: RAX: fffffffffffffdfc RBX: 00007efe25c66710 RCX:
00007efe39989e40
Feb 02 10:29:50 trudex kernel: RDX: 0000000000000000 RSI: 0000000000000089 RDI:
00007efe25c66808
Feb 02 10:29:50 trudex kernel: RBP: 00007efe25c667e0 R08: 0000000000000000 R09:
00000000ffffffff
Feb 02 10:29:50 trudex kernel: R10: 00007efe25c66710 R11: 0000000000000246 R12:
00007efe25c667b8
Feb 02 10:29:50 trudex kernel: R13: 00007efe25c66670 R14: 00007efe25c66808 R15:
00007efe25c66804
Feb 02 10:29:50 trudex kernel: ---[ end trace eab922733aa26bfb ]---
Feb 02 10:29:50 trudex systemd[1]: Started Telemetrics Daemon.
Feb 02 10:29:50 trudex systemd[1]: Started Telemetrics Post Daemon.
Feb 02 10:29:55 trudex kernel: [drm:amdgpu_dm_commit_planes.constprop.0
[amdgpu]] *ERROR* Waiting for fences timed out!
Feb 02 10:29:55 trudex kernel: amdgpu 0000:03:00.0: GPU BACO reset
Feb 02 10:29:55 trudex kernel: amdgpu 0000:03:00.0: GPU reset succeeded, trying
to resume
Feb 02 10:29:55 trudex kernel: [drm] PCIE GART of 512M enabled (table at
0x000000F400900000).
Feb 02 10:29:55 trudex kernel: [drm] VRAM is lost due to GPU reset!
Feb 02 10:29:55 trudex kernel: [drm] PSP is resuming...
Feb 02 10:29:55 trudex kernel: [drm] reserve 0x400000 from 0xf5fe800000 for PSP
TMR
Feb 02 10:29:55 trudex kernel: [drm] UVD and UVD ENC initialized successfully.
Feb 02 10:29:56 trudex kernel: [drm] VCE initialized successfully.
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring gfx uses VM inv eng 0
on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.0.0 uses VM inv
eng 1 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.1.0 uses VM inv
eng 4 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.2.0 uses VM inv
eng 5 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.3.0 uses VM inv
eng 6 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.0.1 uses VM inv
eng 7 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.1.1 uses VM inv
eng 8 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.2.1 uses VM inv
eng 9 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring comp_1.3.1 uses VM inv
eng 10 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring kiq_2.1.0 uses VM inv
eng 11 on hub 0
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring sdma0 uses VM inv eng
0 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring page0 uses VM inv eng
1 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring sdma1 uses VM inv eng
4 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring page1 uses VM inv eng
5 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring uvd_0 uses VM inv eng
6 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring uvd_enc_0.0 uses VM
inv eng 7 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring uvd_enc_0.1 uses VM
inv eng 8 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring vce0 uses VM inv eng 9
on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring vce1 uses VM inv eng
10 on hub 1
Feb 02 10:29:56 trudex kernel: amdgpu 0000:03:00.0: ring vce2 uses VM inv eng
11 on hub 1
Feb 02 10:29:56 trudex kernel: [drm] ECC is not present.
Feb 02 10:29:56 trudex kernel: [drm] SRAM ECC is not present.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
