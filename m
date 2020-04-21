Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6071B233B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 11:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAAC6E8F3;
	Tue, 21 Apr 2020 09:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5C16E8F3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 09:51:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] New: [Regression] 5.7-rc: amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Tue, 21 Apr 2020 09:51:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: 1i5t5.duncan@cox.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-207383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=207383

            Bug ID: 207383
           Summary: [Regression] 5.7-rc: amdgpu/polaris11 gpf:
                    amdgpu_atomic_commit_tail
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.7-rc1, 5.7-rc2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: 1i5t5.duncan@cox.net
        Regression: No

Created attachment 288649
  --> https://bugzilla.kernel.org/attachment.cgi?id=288649&action=edit
kernel config

5.7-rc1 and rc2 regression from kernel 5.6.0

After starting X/plasma on 5.7-rc1 and rc2, system runs for a few seconds to a
few hours, then display freezes.  The pointer continues to be movable and audio
will continue to play for some seconds but they eventually stop as well. The
kernel remains alive at least enough to reboot with SRQ-b, not sure if previous
SRQs have any effect or not.

Sometimes but not always there's a gpf left in the log, appearing to confirm
it's amdgpu (the -dirty is simply a patch making mounts noatime by default):

Apr 20 03:25:55 h2 kernel: general protection fault, probably for non-canonical
address 0xc1316515e40a92f6: 0000 [#1] SMP
Apr 20 03:25:55 h2 kernel: CPU: 3 PID: 3921 Comm: kworker/u16:5 Tainted: G     
          T 5.7.0-rc2-dirty #194
Apr 20 03:25:55 h2 kernel: Hardware name: Gigabyte Technology Co., Ltd.
GA-990FXA-UD3/GA-990FXA-UD3, BIOS F6 03/30/2012
Apr 20 03:25:55 h2 kernel: Workqueue: events_unbound commit_work
Apr 20 03:25:55 h2 kernel: RIP: 0010:amdgpu_dm_atomic_commit_tail+0x102d/0x1fd8
Apr 20 03:25:55 h2 kernel: Code: 48 89 9d a0 fc ff ff 8b 90 e0 02 00 00 85 d2
0f 85 26 f1 ff ff 48 8b 85 e0 fc ff ff 48 89 85 a0 fc ff ff 48 8b b5 e0 fc ff
ff <80> be b0 01 00 00 01 0f 86 b4 00 00 00 31 c0 48 b9 00 00 00 00 01
Apr 20 03:25:55 h2 kernel: RSP: 0018:ffffc9000216bad0 EFLAGS: 00010286
Apr 20 03:25:55 h2 kernel: RAX: ffff88842a6e1000 RBX: ffff8883d1d5b800 RCX:
ffff8884283db200
Apr 20 03:25:55 h2 kernel: RDX: ffff8884283db2e0 RSI: c1316515e40a92f6 RDI:
0000000000000002
Apr 20 03:25:55 h2 kernel: RBP: ffffc9000216be50 R08: 0000000000000001 R09:
0000000000000001
Apr 20 03:25:55 h2 kernel: R10: 0000000000030000 R11: 0000000000000000 R12:
0000000000000000
Apr 20 03:25:55 h2 kernel: R13: 0000000000000005 R14: ffff88842bb76000 R15:
ffff88841c08cc00
Apr 20 03:25:55 h2 kernel: FS:  0000000000000000(0000)
GS:ffff88842ecc0000(0000) knlGS:0000000000000000
Apr 20 03:25:55 h2 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 20 03:25:55 h2 kernel: CR2: 000078617de4fffc CR3: 000000040ca0e000 CR4:
00000000000406e0
Apr 20 03:25:55 h2 kernel: Call Trace:
Apr 20 03:25:55 h2 kernel:  ? 0xffffffff81000000
Apr 20 03:25:55 h2 kernel:  ? __switch_to_asm+0x34/0x70
Apr 20 03:25:55 h2 kernel:  ? __switch_to_asm+0x40/0x70
Apr 20 03:25:55 h2 kernel:  ? __switch_to_asm+0x34/0x70
Apr 20 03:25:55 h2 kernel:  ? __switch_to_asm+0x40/0x70
Apr 20 03:25:55 h2 kernel:  ? commit_tail+0x8e/0x120
Apr 20 03:25:55 h2 kernel:  ? process_one_work+0x1a9/0x300
Apr 20 03:25:55 h2 kernel:  ? worker_thread+0x45/0x3b8
Apr 20 03:25:55 h2 kernel:  ? kthread+0xf3/0x130
Apr 20 03:25:55 h2 kernel:  ? process_one_work+0x300/0x300
Apr 20 03:25:55 h2 kernel:  ? __kthread_create_on_node+0x180/0x180
Apr 20 03:25:55 h2 kernel:  ? ret_from_fork+0x22/0x40
Apr 20 03:25:55 h2 kernel: ---[ end trace 33869116def8e8ad ]---
Apr 20 03:25:55 h2 kernel: RIP: 0010:amdgpu_dm_atomic_commit_tail+0x102d/0x1fd8
Apr 20 03:25:55 h2 kernel: Code: 48 89 9d a0 fc ff ff 8b 90 e0 02 00 00 85 d2
0f 85 26 f1 ff ff 48 8b 85 e0 fc ff ff 48 89 85 a0 fc ff ff 48 89 85 a0 fc ff
ff 48 8b b5 e0 fc ff ff <80> be b0 01 00 00 01 0f 86 b4 00 00 00 31 c0 48 b9 00
00 00 00 01
Apr 20 03:25:55 h2 kernel: RSP: 0018:ffffc9000216bad0 EFLAGS: 00010286
Apr 20 03:25:55 h2 kernel: RAX: ffff88842a6e1000 RBX: ffff8883d1d5b800 RCX:
ffff8884283db200
Apr 20 03:25:55 h2 kernel: RDX: ffff8884283db2e0 RSI: c1316515e40a92f6 RDI:
0000000000000002
Apr 20 03:25:55 h2 kernel: RBP: ffffc9000216be50 R08: 0000000000000001 R09:
0000000000000001
Apr 20 03:25:55 h2 kernel: R10: 0000000000030000 R11: 0000000000000000 R12:
0000000000000000
Apr 20 03:25:55 h2 kernel: R13: 0000000000000005 R14: ffff88842bb76000 R15:
ffff88841c08cc00
Apr 20 03:25:55 h2 kernel: FS:  0000000000000000(0000)
GS:ffff88842ecc0000(0000) knlGS:0000000000000000
Apr 20 03:25:55 h2 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Apr 20 03:25:55 h2 kernel: CR2: 000078617de4fffc CR3: 000000040ca0e000 CR4:
00000000000406e0

That's it.  Nothing in the log since boot before, and the next entry is after
reboot.

gcc version 9.3.0 on Gentoo.  AMD fx6100 on the Gigabyte board in the log
above.    
xorg-server 1.20.8, mesa 20.0.4, xf86-video-amdgpu 19.1.0, linux-firmware
20200413

kernel config attached

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
