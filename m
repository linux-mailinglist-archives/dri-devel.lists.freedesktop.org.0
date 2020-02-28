Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E1E173E47
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 18:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CB46F490;
	Fri, 28 Feb 2020 17:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FDC6F490
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 17:21:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206705] New: ida_free called for id=32782 which is not allocated.
Date: Fri, 28 Feb 2020 17:21:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ansla80@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206705-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206705

            Bug ID: 206705
           Summary: ida_free called for id=32782 which is not allocated.
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ansla80@yahoo.com
        Regression: No

Created attachment 287699
  --> https://bugzilla.kernel.org/attachment.cgi?id=287699&action=edit
Output of rocminfo

Video Card: Radeon RX 580
OpenCL: ROCm 3.0.0

After I left the computer overnight to perform a btrfs balance while it was
also running boinc (Amicable Numbers being the only project using OpenCL), I
found this in dmesg among all the expected btrfs messages:

[17350.059221] Failed to create process VM object
[17350.162949] ------------[ cut here ]------------
[17350.162950] ida_free called for id=32782 which is not allocated.
[17350.162966] WARNING: CPU: 4 PID: 8428 at lib/idr.c:521 ida_free+0x11a/0x130
[17350.162967] Modules linked in: snd_usb_audio snd_usbmidi_lib snd_rawmidi
tpm_crb tpm_tis tpm_tis_core
[17350.162971] CPU: 4 PID: 8428 Comm: amicable_OpenCL Tainted: G        W      
  5.5.4-gentoo #2
[17350.162971] Hardware name: System manufacturer System Product Name/ROG STRIX
B450-F GAMING, BIOS 3003 12/09/2019
[17350.162973] RIP: 0010:ida_free+0x11a/0x130
[17350.162975] Code: 6c f3 61 ff 31 f6 48 89 e7 e8 c2 eb 00 00 eb 9c 48 8b 3c
24 4c 89 ee e8 84 ff 01 00 89 ee 48 c7 c7 60 81 75 82 e8 23 b4 47 ff <0f> 0b eb
8a 0f 0b e8 9b b1 47 ff 66 66 2e 0f 1f 84 00 00 00 00 00
[17350.162976] RSP: 0018:ffffc900005f3cc8 EFLAGS: 00010282
[17350.162976] RAX: 0000000000000000 RBX: 000000000000000e RCX:
0000000000000007
[17350.162977] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff888fde9183c0
[17350.162978] RBP: 000000000000800e R08: 0000000000000001 R09:
0000000000000a0e
[17350.162978] R10: 0000000000033110 R11: 0000000000000001 R12:
000000000007bfff
[17350.162979] R13: 0000000000000202 R14: 000000000000800e R15:
ffff888e166ea6c8
[17350.162979] FS:  00007f5db5302740(0000) GS:ffff888fde900000(0000)
knlGS:0000000000000000
[17350.162980] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[17350.162981] CR2: 00007f5bc4f3dee0 CR3: 000000000280a000 CR4:
00000000003406e0
[17350.162981] Call Trace:
[17350.162985]  amdgpu_pasid_free_delayed+0x10c/0x2a0
[17350.162988]  amdgpu_driver_postclose_kms+0x1fb/0x220
[17350.162990]  drm_file_free.part.0+0x1df/0x280
[17350.162992]  drm_release+0xa2/0xe0
[17350.162994]  __fput+0xb4/0x240
[17350.162997]  task_work_run+0x84/0xa0
[17350.162999]  do_exit+0x358/0xb30
[17350.163001]  do_group_exit+0x35/0x90
[17350.163002]  __x64_sys_exit_group+0xf/0x10
[17350.163004]  do_syscall_64+0x50/0x170
[17350.163005]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[17350.163006] RIP: 0033:0x7f5db53e2206
[17350.163010] Code: Bad RIP value.
[17350.163010] RSP: 002b:00007ffd961c0ca8 EFLAGS: 00000246 ORIG_RAX:
00000000000000e7
[17350.163011] RAX: ffffffffffffffda RBX: 00007f5db54d98a0 RCX:
00007f5db53e2206
[17350.163011] RDX: 00000000ffffffff RSI: 000000000000003c RDI:
00000000ffffffff
[17350.163012] RBP: 00007f5db54d98a0 R08: 00000000000000e7 R09:
ffffffffffffff68
[17350.163012] R10: fffffffffffffcf8 R11: 0000000000000246 R12:
00000000ffffffff
[17350.163013] R13: 0000000000000000 R14: 00000000000002af R15:
0000000000000000
[17350.163014] ---[ end trace aae51382bec0201b ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
