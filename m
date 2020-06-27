Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4167020C4B3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 00:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D516E181;
	Sat, 27 Jun 2020 22:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356406E181
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 22:26:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sat, 27 Jun 2020 22:26:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: zzyxpaw@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207383-2300-bZYUBsNMkH@https.bugzilla.kernel.org/>
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

zzyxpaw@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zzyxpaw@gmail.com

--- Comment #29 from zzyxpaw@gmail.com ---
Just hit this on Archlinux with linux-5.7.6 on a Vega 64. So far I've had three
crashes mostly occuring within the first few minutes of uptime. I'm not running
kwin or chrome, just a light window manager (bspwm) and compton.

During the first two, steam's fossilize was running which lead me to suspect it
was triggered by an interaction with that. However the third crashed before I
even managed to start steam, so either I'm just lucky or my system is good at
triggering this. @Duncan I'm not sure if you want to muddle your bisect results
with a different system configuration, but I'm happy to help test commits if
that would be helpful.

I've noticed the call traces reported in the kernel log are slightly different
for each crash; I'm not sure if they're likely to be useful or not. Here's at
least the one from my first crash:

Jun 27 14:04:40 erebor kernel: general protection fault, probably for
non-canonical address 0x5dda9795528973db: 0000 [#1] PREEMPT SMP NOPTI
Jun 27 14:04:40 erebor kernel: CPU: 14 PID: 193610 Comm: kworker/u32:14
Tainted: G           OE     5.7.6-arch1-1 #1
Jun 27 14:04:40 erebor kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./AB350 Pro4, BIOS P4.90 06/14/2018
Jun 27 14:04:40 erebor kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Jun 27 14:04:40 erebor kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 27 14:04:40 erebor kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 fc
ff ff <80> bf b0 01 00 00 01 0f 86 ac 00 00>
Jun 27 14:04:40 erebor kernel: RSP: 0018:ffffbcec0a4afaf8 EFLAGS: 00010206
Jun 27 14:04:40 erebor kernel: RAX: 0000000000000006 RBX: ffff9b71dbaed000 RCX:
ffff9b7472e4b800
Jun 27 14:04:40 erebor kernel: RDX: ffff9b72504ea400 RSI: ffffffffc13181e0 RDI:
5dda9795528973db
Jun 27 14:04:40 erebor kernel: RBP: ffffbcec0a4afe60 R08: 0000000000000001 R09:
0000000000000001
Jun 27 14:04:40 erebor kernel: R10: 0000000000000082 R11: 00000000000730e2 R12:
0000000000000000
Jun 27 14:04:40 erebor kernel: R13: 0000000000000006 R14: ffff9b71dbaed800 R15:
ffff9b71a8fdb580
Jun 27 14:04:40 erebor kernel: FS:  0000000000000000(0000)
GS:ffff9b747ef80000(0000) knlGS:0000000000000000
Jun 27 14:04:40 erebor kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 27 14:04:40 erebor kernel: CR2: 000056460ce164b0 CR3: 0000000341c86000 CR4:
00000000003406e0
Jun 27 14:04:40 erebor kernel: Call Trace:
Jun 27 14:04:40 erebor kernel:  ? __erst_read+0x160/0x1d0
Jun 27 14:04:40 erebor kernel:  ? __switch_to_asm+0x34/0x70
Jun 27 14:04:40 erebor kernel:  ? __switch_to_asm+0x40/0x70
Jun 27 14:04:40 erebor kernel:  ? __switch_to_asm+0x34/0x70
Jun 27 14:04:40 erebor kernel:  ? __switch_to_asm+0x40/0x70
Jun 27 14:04:40 erebor kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 27 14:04:40 erebor kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Jun 27 14:04:40 erebor kernel:  process_one_work+0x1da/0x3d0
Jun 27 14:04:40 erebor kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 27 14:04:40 erebor kernel:  worker_thread+0x4d/0x3e0
Jun 27 14:04:40 erebor kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 27 14:04:40 erebor kernel:  kthread+0x13e/0x160
Jun 27 14:04:40 erebor kernel:  ? __kthread_bind_mask+0x60/0x60
Jun 27 14:04:40 erebor kernel:  ret_from_fork+0x22/0x40
Jun 27 14:04:40 erebor kernel: Modules linked in: snd_seq_midi snd_seq_dummy
snd_seq_midi_event snd_hrtimer snd_seq fuse ccm 8021q garp mrp stp llc
snd_usb_audio snd_usbmidi_lib snd_rawmidi snd_seq_de>
Jun 27 14:04:40 erebor kernel:  blake2b_generic libcrc32c crc32c_generic xor
uas usb_storage raid6_pq crc32c_intel xhci_pci xhci_hcd
Jun 27 14:04:40 erebor kernel: ---[ end trace cb5c0d96dd991657 ]---
Jun 27 14:04:40 erebor kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 27 14:04:40 erebor kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 fc
ff ff <80> bf b0 01 00 00 01 0f 86 ac 00 00>
Jun 27 14:04:40 erebor kernel: RSP: 0018:ffffbcec0a4afaf8 EFLAGS: 00010206
Jun 27 14:04:40 erebor kernel: RAX: 0000000000000006 RBX: ffff9b71dbaed000 RCX:
ffff9b7472e4b800
Jun 27 14:04:40 erebor kernel: RDX: ffff9b72504ea400 RSI: ffffffffc13181e0 RDI:
5dda9795528973db
Jun 27 14:04:40 erebor kernel: RBP: ffffbcec0a4afe60 R08: 0000000000000001 R09:
0000000000000001
Jun 27 14:04:40 erebor kernel: R10: 0000000000000082 R11: 00000000000730e2 R12:
0000000000000000
Jun 27 14:04:40 erebor kernel: R13: 0000000000000006 R14: ffff9b71dbaed800 R15:
ffff9b71a8fdb580
Jun 27 14:04:40 erebor kernel: FS:  0000000000000000(0000)
GS:ffff9b747ef80000(0000) knlGS:0000000000000000
Jun 27 14:04:40 erebor kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 27 14:04:40 erebor kernel: CR2: 000056460ce164b0 CR3: 0000000341c86000 CR4:
00000000003406e0

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
