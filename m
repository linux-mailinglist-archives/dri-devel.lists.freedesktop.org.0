Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C3342EBE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 19:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACC96E08E;
	Sat, 20 Mar 2021 18:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB05A6E08E
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:14:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D67C66193B
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 18:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616264052;
 bh=OZJoNyQNHWxZLYJ9F/343eB5Z/5Y9ahBH1fatpFeYf4=;
 h=From:To:Subject:Date:From;
 b=S2mcllw2nc9tc8weSN+TgbtodTEUbuwy8j2Oc8WYYaNDCUUGLTx7Dc0271hYh/tj6
 3jGD+GY04F0VZwaXK+XLgA3dNyyegU+NVxvexLB8J8RZ7BVFF/gvUypyFwFxvZ2UyJ
 732QcHJL67oGYeGVPL0yhfbKGoF2X6zIPlBmzHGrCiYX/1QyMqs6Fvuu+tomyqAz6j
 6C13156TX+Bn1se69z+2FUMAEOKdggX+qpjYEx5QwnKXUvmaSXFpOcDcRCk3H7G/z0
 ojxGOSaPWm0AI/Wf/JFw8BOpjfRlDnXKYf5cVMrMYAGrtolJ43jbkGlG/tODPTSJUr
 CkIX0v3LM9NDA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C51DB62A3C; Sat, 20 Mar 2021 18:14:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212369] New: AMDGPU: GPU hangs with '*ERROR* Couldn't update
 BO_VA (-12)' on MIPS64
Date: Sat, 20 Mar 2021 18:14:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xry111@mengyan1223.wang
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212369

            Bug ID: 212369
           Summary: AMDGPU: GPU hangs with '*ERROR* Couldn't update BO_VA
                    (-12)' on MIPS64
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.0-rc3+
          Hardware: Mips64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: xry111@mengyan1223.wang
        Regression: No

With Linus' kernel (git 1c273e10), when I try to run some program using GL (for
example, gtk3-demo's GL view demo) from Xorg, GPU hangs and the system becomes
inoperable.  Using SysRq key to reboot the system to gather the stack
backtrace:

Mar 20 18:51:59 xry111-A1901 kernel: [drm:amdgpu_gem_va_ioctl] *ERROR* Couldn't
update BO_VA (-12)
Mar 20 18:51:59 xry111-A1901 kernel: ------------[ cut here ]------------
Mar 20 18:51:59 xry111-A1901 kernel: WARNING: CPU: 1 PID: 2649 at
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:1457
amdgpu_bo_gpu_offset+0x140/0x180
Mar 20 18:51:59 xry111-A1901 kernel: Modules linked in: vfat fat mousedev
hid_generic usbhid snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg
snd_hda_codec snd_hwdep snd_hda_core fuse ip_t>
Mar 20 18:51:59 xry111-A1901 kernel: CPU: 1 PID: 2649 Comm: X:cs0 Not tainted
5.12.0-rc3+ #10
Mar 20 18:51:59 xry111-A1901 kernel: Hardware name: SANCOG
SANCOG-QingLong-L402-V1.0-DeskTop/SANCOG-QingLong-L402-V1.0-DeskTop, BIOS
Kunlun-L402-V4.1.4 05/25/2020
Mar 20 18:51:59 xry111-A1901 kernel: Stack : 0000000000000000 0000000000000000
0000000000000008 98000001347cb8c8
Mar 20 18:51:59 xry111-A1901 kernel:         d59008b3440befaa 0000000000000000
0000000000000000 ffffffff84e034c0
Mar 20 18:51:59 xry111-A1901 kernel:         98000001347cb700 0000000000000001
98000001347cb788 0000000000000000
Mar 20 18:51:59 xry111-A1901 kernel:         20534f4942202c70 0000000000000010
ffffffff83bf89a0 98000001347cb6f8
Mar 20 18:51:59 xry111-A1901 kernel:         2d302e31562d3230 ffffffff84f40000
ffff000000000000 0000000000000001
Mar 20 18:51:59 xry111-A1901 kernel:         ffffffff84e00000 0000000000000000
00000000e39b8000 00000000000f7ded
Mar 20 18:51:59 xry111-A1901 kernel:         fffffffffffffff4 0000000000000000
98000001b47cb787 0000000000006000
Mar 20 18:51:59 xry111-A1901 kernel:         9800000121134000 98000001347c8000
98000001347cb8c0 0000000000000003
Mar 20 18:51:59 xry111-A1901 kernel:         ffffffff843f20ec 0000000000000000
0000000000000003 ffffffff84f492c3
Mar 20 18:51:59 xry111-A1901 kernel:         ffffffff8530c070 ffffffff84e034c0
ffffffff8379b950 d59008b3440befaa
Mar 20 18:51:59 xry111-A1901 kernel:         ...
Mar 20 18:51:59 xry111-A1901 kernel: Call Trace:
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff8379b950>] show_stack+0x40/0x130
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff843f20ec>] dump_stack+0xb4/0xe0
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff843edd60>] __warn+0xc0/0x114
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff843ede28>]
warn_slowpath_fmt+0x74/0xc4
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d2b7c0>]
amdgpu_bo_gpu_offset+0x140/0x180
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d3514c>]
amdgpu_cs_ioctl+0x1154/0x1bb8
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83ccfc64>]
drm_ioctl_kernel+0xcc/0x120
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83cd0158>] drm_ioctl+0x220/0x408
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d0fb58>]
amdgpu_drm_ioctl+0x58/0x98
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff839bd224>] sys_ioctl+0xcc/0xe8
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff837a7210>]
syscall_common+0x34/0x58
Mar 20 18:51:59 xry111-A1901 kernel: 
Mar 20 18:51:59 xry111-A1901 kernel: ---[ end trace 678210b5f2b1f5e4 ]---
Mar 20 18:51:59 xry111-A1901 kernel: [drm:amdgpu_cs_ioctl] *ERROR* Not enough
memory for command submission!
Mar 20 18:51:59 xry111-A1901 kernel: CPU 1 Unable to handle kernel paging
request at virtual address 0000000000000008, epc == ffffffff83d414a0, ra ==
ffffffff83d41434
Mar 20 18:51:59 xry111-A1901 kernel: Oops[#1]:
Mar 20 18:51:59 xry111-A1901 kernel: CPU: 1 PID: 2649 Comm: X:cs0 Tainted: G   
    W         5.12.0-rc3+ #10
Mar 20 18:51:59 xry111-A1901 kernel: Hardware name: SANCOG
SANCOG-QingLong-L402-V1.0-DeskTop/SANCOG-QingLong-L402-V1.0-DeskTop, BIOS
Kunlun-L402-V4.1.4 05/25/2020
Mar 20 18:51:59 xry111-A1901 kernel: $ 0   : 0000000000000000 0000000000000001
98000001345dc3f0 98000001483f1000
Mar 20 18:51:59 xry111-A1901 kernel: $ 4   : 980000027aa36c00 98000001345dc3b8
98000001483f1068 0000000000000001
Mar 20 18:51:59 xry111-A1901 kernel: $ 8   : 000000000006a600 9800000148b3f880
0000000000000000 0000000000288a35
Mar 20 18:51:59 xry111-A1901 kernel: $12   : 0000000000000000 ffffffff83bf89a8
00000000000000eb 00000000000000eb
Mar 20 18:51:59 xry111-A1901 kernel: $16   : 98000001345dc3d8 9800000120780000
6db6db6db6db0000 98000001483f1048
Mar 20 18:51:59 xry111-A1901 kernel: $20   : ffffffff84f40000 98000001347cbc10
0000000000000000 98000001483f1000
Mar 20 18:51:59 xry111-A1901 kernel: $24   : ffffffff84411960 0000000000000000  
Mar 20 18:51:59 xry111-A1901 kernel: $28   : 98000001347c8000 98000001347cbb40
ffffffff84f40000 ffffffff83d41434
Mar 20 18:51:59 xry111-A1901 kernel: Hi    : 0000000000000002
Mar 20 18:51:59 xry111-A1901 kernel: Lo    : 0000000000103c06
Mar 20 18:51:59 xry111-A1901 kernel: epc   : ffffffff83d414a0
amdgpu_vm_update_pdes+0xf0/0x268
Mar 20 18:51:59 xry111-A1901 kernel: ra    : ffffffff83d41434
amdgpu_vm_update_pdes+0x84/0x268
Mar 20 18:51:59 xry111-A1901 kernel: Status: 5400cce3        KX SX UX KERNEL
EXL IE 
Mar 20 18:51:59 xry111-A1901 kernel: Cause : 10000008 (ExcCode 02)
Mar 20 18:51:59 xry111-A1901 kernel: BadVA : 0000000000000008
Mar 20 18:51:59 xry111-A1901 kernel: PrId  : 0014c004 (ICT Loongson-3)
Mar 20 18:51:59 xry111-A1901 kernel: Modules linked in: vfat fat mousedev
hid_generic usbhid snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg
snd_hda_codec snd_hwdep snd_hda_core fuse ip_t>
Mar 20 18:51:59 xry111-A1901 kernel: Process X:cs0 (pid: 2649,
threadinfo=00000000a6d48d91, task=0000000007ecd99e, tls=000000ffe7b0a6c0)
Mar 20 18:51:59 xry111-A1901 kernel: Stack : 980000012cb70158 0400000000000076
980000013421b780 ffffffff83d41b50
Mar 20 18:51:59 xry111-A1901 kernel:         0000000000000000 9800000120780000
98000001483f1000 0000000000000000
Mar 20 18:51:59 xry111-A1901 kernel:         0000000000000000 980000027aa37000
0000000000000100 d59008b3440befaa
Mar 20 18:51:59 xry111-A1901 kernel:         0000000000000002 0000000000000000
ffffffff84f40000 98000001483f1000
Mar 20 18:51:59 xry111-A1901 kernel:         9800000120780000 98000001347cbc10
980000013442a180 980000012d666858
Mar 20 18:51:59 xry111-A1901 kernel:         ffffffff84f40000 ffffffff83d31dc8
98000001347cbc48 98000001347cbc28
Mar 20 18:51:59 xry111-A1901 kernel:         98000001347cbc00 98000001347cbc00
9800000120988f00 0000000000038623
Mar 20 18:51:59 xry111-A1901 kernel:         0001000000000002 98000001347cbbf0
98000001347cbc48 980000012d666858
Mar 20 18:51:59 xry111-A1901 kernel:         9800000100000000 98000001347cbc28
98000001347cbbf0 980000012cb70058
Mar 20 18:51:59 xry111-A1901 kernel:         0000000000000004 9800000134928032
0000000000000000 0000000000000000
Mar 20 18:51:59 xry111-A1901 kernel:         ...
Mar 20 18:51:59 xry111-A1901 kernel: Call Trace:
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d414a0>]
amdgpu_vm_update_pdes+0xf0/0x268
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d31dc8>]
amdgpu_gem_va_ioctl+0x3d8/0x430
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83ccfc64>]
drm_ioctl_kernel+0xcc/0x120
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83cd0158>] drm_ioctl+0x220/0x408
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff83d0fb58>]
amdgpu_drm_ioctl+0x58/0x98
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff839bd224>] sys_ioctl+0xcc/0xe8
Mar 20 18:51:59 xry111-A1901 kernel: [<ffffffff837a7210>]
syscall_common+0x34/0x58
Mar 20 18:51:59 xry111-A1901 kernel: 
Mar 20 18:51:59 xry111-A1901 kernel: Code: 12c00002  00000000  ded602a8
<dede0008> dfc202b0  10400004  00001825  dc4202b0  1440fffe 
Mar 20 18:51:59 xry111-A1901 kernel: 
Mar 20 18:51:59 xry111-A1901 kernel: ---[ end trace 678210b5f2b1f5e5 ]---

The system is MIPS64 (Loongson 3A4000) and the GPU is RX550 (640SP).

Linux-5.10.17 works properly, but 5.11.0 also has this issue.  I tried
bisection but it gone into some commits before 5.10.0 (due to merging commits),
which can't boot my system.

My guess is some change between 5.10.0 and 5.11.0 has broke non-4K-page
systems.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
