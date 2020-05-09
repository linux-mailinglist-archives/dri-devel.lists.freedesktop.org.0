Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB21CC442
	for <lists+dri-devel@lfdr.de>; Sat,  9 May 2020 21:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF0B6E0C1;
	Sat,  9 May 2020 19:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18C16E0C1
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 19:53:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207665] New: virtio GPU driver dereferences null pointer while
 using some Wayland applications
Date: Sat, 09 May 2020 19:53:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: c3bacd17@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207665-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207665

            Bug ID: 207665
           Summary: virtio GPU driver dereferences null pointer while
                    using some Wayland applications
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.6.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: c3bacd17@protonmail.com
        Regression: No

Created attachment 289029
  --> https://bugzilla.kernel.org/attachment.cgi?id=289029&action=edit
The full kernel log

Relevant part of the kernel log:


[  179.722024] BUG: kernel NULL pointer dereference, address: 0000000000000008
[  179.723955] #PF: supervisor read access in kernel mode
[  179.724503] #PF: error_code(0x0000) - not-present page
[  179.725027] PGD 0 P4D 0 
[  179.725294] Oops: 0000 [#1] PREEMPT SMP PTI
[  179.725738] CPU: 0 PID: 28 Comm: kworker/u2:1 Not tainted 5.6.11 #22
[  179.726384] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
[  179.727551] Workqueue: events_unbound commit_work
[  179.728046] RIP: 0010:dma_fence_wait_timeout+0x21/0x120
[  179.728581] Code: 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00 41 55 41 54 55
53 48 85 d2 0f 88 fd 00 00 00 48 89 fb 89 f5 49 89 d5 0f 1f 44 00 00 <48> 8b 43
08 40 0f b6 f5 4c 89 ea 48 89 df 48 8b 40 28 48 85 c0 0f
[  179.730636] RSP: 0018:ffffa8d4400ebda0 EFLAGS: 00010206
[  179.731194] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[  179.731947] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI:
0000000000000000
[  179.737139] RBP: 0000000000000001 R08: 0000000000000001 R09:
ffff8f7d37b3bf00
[  179.737975] R10: 00000000000006c8 R11: 0000000000000018 R12:
ffff8f7dbab46c00
[  179.738726] R13: 7fffffffffffffff R14: ffff8f7dbab50000 R15:
000000000000000c
[  179.739479] FS:  0000000000000000(0000) GS:ffff8f7dbbc00000(0000)
knlGS:0000000000000000
[  179.740329] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  179.740938] CR2: 0000000000000008 CR3: 0000000131c42004 CR4:
0000000000360ef0
[  179.741695] Call Trace:
[  179.741988]  virtio_gpu_cursor_plane_update+0x1bb/0x290
[  179.742379]  drm_atomic_helper_commit_planes+0xb8/0x220
[  179.742753]  vgdev_atomic_commit_tail+0x32/0x60
[  179.743079]  commit_tail+0x94/0x130
[  179.743332]  process_one_work+0x1da/0x3d0
[  179.743621]  worker_thread+0x4a/0x3d0
[  179.743885]  kthread+0xfb/0x130
[  179.744115]  ? process_one_work+0x3d0/0x3d0
[  179.744532]  ? kthread_park+0x90/0x90
[  179.744891]  ret_from_fork+0x35/0x40
[  179.745378] Modules linked in:
[  179.745600] CR2: 0000000000000008
[  179.745946] ---[ end trace 8cef036ef4df2477 ]---
[  179.746256] RIP: 0010:dma_fence_wait_timeout+0x21/0x120
[  179.746604] Code: 84 00 00 00 00 00 0f 1f 00 0f 1f 44 00 00 41 55 41 54 55
53 48 85 d2 0f 88 fd 00 00 00 48 89 fb 89 f5 49 89 d5 0f 1f 44 00 00 <48> 8b 43
08 40 0f b6 f5 4c 89 ea 48 89 df 48 8b 40 28 48 85 c0 0f
[  179.747892] RSP: 0018:ffffa8d4400ebda0 EFLAGS: 00010206
[  179.748373] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
[  179.753551] RDX: 7fffffffffffffff RSI: 0000000000000001 RDI:
0000000000000000
[  179.754141] RBP: 0000000000000001 R08: 0000000000000001 R09:
ffff8f7d37b3bf00
[  179.754679] R10: 00000000000006c8 R11: 0000000000000018 R12:
ffff8f7dbab46c00
[  179.755203] R13: 7fffffffffffffff R14: ffff8f7dbab50000 R15:
000000000000000c
[  179.755727] FS:  0000000000000000(0000) GS:ffff8f7dbbc00000(0000)
knlGS:0000000000000000
[  179.756318] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  179.756742] CR2: 0000000000000008 CR3: 0000000131c42004 CR4:
0000000000360ef0


This is on a QEMU machine started with the following command:

exec qemu-system-x86_64 -enable-kvm -display gtk -vga virtio -cpu host -m 4G
-netdev tap,ifname=vmtap0,id=vn0,script=no,downscript=no -device
virtio-net-pci,netdev=vn0 -kernel kernel.img -drive
file=file.img,format=raw,if=virtio -virtfs
local,path=mnt,mount_tag=host0,security_model=passthrough,id=host0 -append
"console=ttyS0 root=/dev/vda rw"

On QEMU 5.0.50 with one patch related to 9p virtfs applied(don't think it's
relevant)

The guest and host are both Arch Linux, with the host kernel version 5.5.7. I'm
using the proprietary NVIDIA drivers on the host, but I don't think it matters
since it's not passthrough.

To reproduce, install firefox, Xwayland and sway from the Arch Linux
repositories. Then just open firefox in sway, open a few new tabs, then attempt
to exit firefox. It seems the "Are you sure you want to close x tabs?" dialog
triggers it.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
