Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C867A28FB5B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 00:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE2089D6C;
	Thu, 15 Oct 2020 22:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BD989D6C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 22:54:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Thu, 15 Oct 2020 22:54:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209457-2300-R5NXPf5mBI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209457

dark_sylinc@yahoo.com.ar changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dark_sylinc@yahoo.com.ar

--- Comment #10 from dark_sylinc@yahoo.com.ar ---
I'm having the same problem; I'm using Ubuntu 18.04 LTS and whatever they
backported to kernel 5.4.0-51-generic started causing this problem; while the
problem goes away in 5.4.0-48-generic (Ubuntu flavors)

I have more information:

 - Card is Radeon RX 560 Series (POLARIS11, DRM 3.35.0, 5.4.0-48-generic, LLVM
10.0.1)
 - The bug sometimes also triggers when plugging or unplugging an HDMI TV.
(this may be https://bugzilla.kernel.org/show_bug.cgi?id=204241 ?)
 - The keyboard locks up, but I can still login via SSH
 - 'sudo shutdown now' will never finish. The kernel is stuck
 - In my case dmesg nor xorg.log notice at all something went wrong
 - Trying to kill X reveals the following:

[ 1571.941734] Call Trace:
[ 1571.941747]  __schedule+0x293/0x720
[ 1571.941752]  ? __queue_work+0x14c/0x400
[ 1571.941758]  schedule+0x33/0xa0
[ 1571.941765]  rpm_resume+0x108/0x780
[ 1571.941769]  ? __switch_to_asm+0x40/0x70
[ 1571.941776]  ? wait_woken+0x80/0x80
[ 1571.941782]  __pm_runtime_resume+0x4e/0x80
[ 1571.941939]  amdgpu_drm_ioctl+0x39/0x80 [amdgpu]
[ 1571.941944]  do_vfs_ioctl+0xa9/0x640
[ 1571.941950]  ? __schedule+0x29b/0x720
[ 1571.941954]  ksys_ioctl+0x75/0x80
[ 1571.941957]  __x64_sys_ioctl+0x1a/0x20
[ 1571.941964]  do_syscall_64+0x57/0x190
[ 1571.941968]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1571.941973] RIP: 0033:0x7f746d5a96d7
[ 1571.941982] Code: Bad RIP value.
[ 1571.941985] RSP: 002b:00007fff1ec6a7a8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1571.941990] RAX: ffffffffffffffda RBX: 00007fff1ec6a7e0 RCX:
00007f746d5a96d7
[ 1571.941992] RDX: 00007fff1ec6a7e0 RSI: 00000000c06864a2 RDI:
000000000000000d
[ 1571.941994] RBP: 00007fff1ec6a7e0 R08: 0000000000000000 R09:
0000000000000000
[ 1571.941996] R10: 0000000000000000 R11: 0000000000003246 R12:
00000000c06864a2
[ 1571.941998] R13: 000000000000000d R14: 000055f52f391780 R15:
000055f52f2176a0
[ 1571.942021] INFO: task chrome:shlo0:2563 blocked for more than 120 seconds.
[ 1571.942026]       Tainted: G           OE     5.4.0-51-generic
#56~18.04.1-Ubuntu
[ 1571.942029] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.


[ 1692.774402] python3:disk$2  D    0  6187      1 0x80004002
[ 1692.774404] Call Trace:
[ 1692.774410]  __schedule+0x293/0x720
[ 1692.774414]  ? __switch_to_asm+0x40/0x70
[ 1692.774419]  schedule+0x33/0xa0
[ 1692.774424]  schedule_preempt_disabled+0xe/0x10
[ 1692.774429]  __mutex_lock.isra.9+0x26d/0x4e0
[ 1692.774436]  __mutex_lock_slowpath+0x13/0x20
[ 1692.774441]  ? __mutex_lock_slowpath+0x13/0x20
[ 1692.774446]  mutex_lock+0x2f/0x40
[ 1692.774472]  drm_release+0x2e/0xd0 [drm]
[ 1692.774476]  __fput+0xc6/0x260
[ 1692.774481]  ____fput+0xe/0x10
[ 1692.774485]  task_work_run+0x9d/0xc0
[ 1692.774491]  do_exit+0x382/0xb80
[ 1692.774496]  ? mem_cgroup_try_charge+0x75/0x190
[ 1692.774503]  do_group_exit+0x43/0xa0
[ 1692.774506]  get_signal+0x14f/0x860
[ 1692.774512]  do_signal+0x34/0x6d0
[ 1692.774515]  ? strlcpy+0x32/0x50
[ 1692.774519]  ? __x64_sys_futex+0x13f/0x190
[ 1692.774525]  exit_to_usermode_loop+0x90/0x130
[ 1692.774530]  do_syscall_64+0x170/0x190
[ 1692.774534]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1692.774536] RIP: 0033:0x7f7f31d789f3
[ 1692.774541] Code: Bad RIP value.
[ 1692.774543] RSP: 002b:00007f7ef49abd10 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[ 1692.774546] RAX: fffffffffffffe00 RBX: 0000000002041e80 RCX:
00007f7f31d789f3
[ 1692.774548] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
0000000002041ea8
[ 1692.774549] RBP: 0000000002041ea4 R08: 0000000000000000 R09:
0000000000000000
[ 1692.774551] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000002041ea8
[ 1692.774553] R13: 0000000000000000 R14: 0000000002041e58 R15:
0000000000000002
[ 1692.774558] INFO: task kworker/4:1:6532 blocked for more than 241 seconds.
[ 1692.774561]       Tainted: G           OE     5.4.0-51-generic
#56~18.04.1-Ubuntu
[ 1692.774563] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this
message.
[ 1692.774566] kworker/4:1     D    0  6532      2 0x80004000

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
