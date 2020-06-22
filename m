Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F24203AA7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905CF6E82E;
	Mon, 22 Jun 2020 15:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634B86E82E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:20:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Mon, 22 Jun 2020 15:20:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207383-2300-HMS92X9ApZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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

rtmasura+kernel@hotmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rtmasura+kernel@hotmail.com

--- Comment #16 from rtmasura+kernel@hotmail.com ---
Reporting I've had the same issue with kernel 5.7.2 and 5.7.4:

Jun 22 07:10:24 abiggun kernel: general protection fault, probably for
non-canonical address 0xd3d74027d6d8fad4: 0000 [#1] PREEMPT SMP NOPTI
Jun 22 07:10:24 abiggun kernel: CPU: 0 PID: 32680 Comm: kworker/u12:9 Not
tainted 5.7.4-arch1-1 #1
Jun 22 07:10:24 abiggun kernel: Hardware name: System manufacturer System
Product Name/Crosshair IV Formula, BIOS 1102    08/24/2010
Jun 22 07:10:24 abiggun kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Jun 22 07:10:24 abiggun kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 22 07:10:24 abiggun kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 f>
Jun 22 07:10:24 abiggun kernel: RSP: 0018:ffffb0cc421abaf8 EFLAGS: 00010286
Jun 22 07:10:24 abiggun kernel: RAX: 0000000000000006 RBX: ffffa21b8e16c400
RCX: ffffa21cab9c8800
Jun 22 07:10:24 abiggun kernel: RDX: ffffa21ca7326200 RSI: ffffffffc10de1a0
RDI: d3d74027d6d8fad4
Jun 22 07:10:24 abiggun kernel: RBP: ffffb0cc421abe60 R08: 0000000000000001
R09: 0000000000000001
Jun 22 07:10:24 abiggun kernel: R10: 00000000000002be R11: 00000000001c57a1
R12: 0000000000000000
Jun 22 07:10:24 abiggun kernel: R13: 0000000000000006 R14: ffffa218e4959800
R15: ffffa219e5b12780
Jun 22 07:10:24 abiggun kernel: FS:  0000000000000000(0000)
GS:ffffa21cbfc00000(0000) knlGS:0000000000000000
Jun 22 07:10:24 abiggun kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 07:10:24 abiggun kernel: CR2: 00007fec2b573008 CR3: 0000000344bd8000
CR4: 00000000000006f0
Jun 22 07:10:24 abiggun kernel: Call Trace:
Jun 22 07:10:24 abiggun kernel:  ? cpumask_next_and+0x19/0x20
Jun 22 07:10:24 abiggun kernel:  ? update_sd_lb_stats.constprop.0+0x115/0x8f0
Jun 22 07:10:24 abiggun kernel:  ? __update_load_avg_cfs_rq+0x277/0x2f0
Jun 22 07:10:24 abiggun kernel:  ? update_load_avg+0x58f/0x660
Jun 22 07:10:24 abiggun kernel:  ? update_curr+0x108/0x1f0
Jun 22 07:10:24 abiggun kernel:  ? __switch_to_asm+0x34/0x70
Jun 22 07:10:24 abiggun kernel:  ? __switch_to_asm+0x40/0x70
Jun 22 07:10:24 abiggun kernel:  ? __switch_to_asm+0x34/0x70
Jun 22 07:10:24 abiggun kernel:  ? __switch_to_asm+0x40/0x70
Jun 22 07:10:24 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 22 07:10:24 abiggun kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Jun 22 07:10:24 abiggun kernel:  process_one_work+0x1da/0x3d0
Jun 22 07:10:24 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 22 07:10:24 abiggun kernel:  worker_thread+0x4d/0x3e0
Jun 22 07:10:24 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 22 07:10:24 abiggun kernel:  kthread+0x13e/0x160
Jun 22 07:10:24 abiggun kernel:  ? __kthread_bind_mask+0x60/0x60
Jun 22 07:10:24 abiggun kernel:  ret_from_fork+0x22/0x40
Jun 22 07:10:24 abiggun kernel: Modules linked in: snd_usb_audio
snd_usbmidi_lib snd_rawmidi hid_plantronics mc vhost_net vhost tap vhost_iotlb
snd_seq_dumm>
Jun 22 07:10:24 abiggun kernel:  crypto_simd cryptd glue_helper xts dm_crypt
hid_generic usbhid hid raid456 libcrc32c crc32c_generic async_raid6_recov
async>
Jun 22 07:10:24 abiggun kernel: ---[ end trace 536cfe34e3c36293 ]---
Jun 22 07:10:24 abiggun kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 22 07:10:24 abiggun kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 f>
Jun 22 07:10:25 abiggun kernel: RSP: 0018:ffffb0cc421abaf8 EFLAGS: 00010286
Jun 22 07:10:25 abiggun kernel: RAX: 0000000000000006 RBX: ffffa21b8e16c400
RCX: ffffa21cab9c8800
Jun 22 07:10:25 abiggun kernel: RDX: ffffa21ca7326200 RSI: ffffffffc10de1a0
RDI: d3d74027d6d8fad4
Jun 22 07:10:25 abiggun kernel: RBP: ffffb0cc421abe60 R08: 0000000000000001
R09: 0000000000000001
Jun 22 07:10:25 abiggun kernel: R10: 00000000000002be R11: 00000000001c57a1
R12: 0000000000000000
Jun 22 07:10:25 abiggun kernel: R13: 0000000000000006 R14: ffffa218e4959800
R15: ffffa219e5b12780
Jun 22 07:10:25 abiggun kernel: FS:  0000000000000000(0000)
GS:ffffa21cbfc00000(0000) knlGS:0000000000000000
Jun 22 07:10:25 abiggun kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 22 07:10:25 abiggun kernel: CR2: 00007fec2b573008 CR3: 0000000344bd8000
CR4: 00000000000006f0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
