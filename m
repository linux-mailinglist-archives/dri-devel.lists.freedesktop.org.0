Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B8744F701
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 07:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE376E9C3;
	Sun, 14 Nov 2021 06:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F4806E9C3
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 06:12:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6623660EE2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 06:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636870362;
 bh=PIrKgAgz3a8r+uSlyVmwlhfr9z2zgxLxj8GJYFQJurY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MzpNx+LiWuj8odm3VbTAilZZKepz6IokN5Y3c19NcoFNyvqp+6vkbHNywzsMNZv35
 GkPt/3QKw9aPkMVdk0fgnnMirotAnYz/4NkJ4dBSdcTp6l+CODzk79wdyIdvIhWhOU
 xqhOiY3bEvRfn3D3Q6iyveCNPOlB5iLR7Vsi9dm+hrbWwvEVm0lwFNZhilNSC5vVrI
 LPRLZgBVUdxty5RrBfsuCKDVXCaV2VxCw0OtdLK4Tpj3iQ8PTJFewDUwHefJ+4kIF+
 YcOxkd06c2hGVzsJhVdkZAyVGCmBUNIara1b7A47a+sUJFBfJvtfYbIJhXD6fo10Gr
 0DUe/+6dhLrgQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5A3F860E49; Sun, 14 Nov 2021 06:12:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sun, 14 Nov 2021 06:12:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dreifachstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215003-2300-MwsvijSIwp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

--- Comment #4 from Xiaolei Yu (dreifachstein@gmail.com) ---
gpu-switch does not work because `EFI runtime services are disabled`.

[    0.371791] ------------[ cut here ]------------
[    0.371822] [Firmware Bug]: Page fault caused by firmware at PA:
0xffffb6ee80068000
[    0.371872] WARNING: CPU: 0 PID: 75 at arch/x86/platform/efi/quirks.c:734
efi_crash_gracefully_on_page_fault+0x49/0xc0
[    0.371942] Modules linked in:
[    0.371963] CPU: 0 PID: 75 Comm: kworker/u24:4 Not tainted 5.14.17+ #9
[    0.372006] Hardware name: Apple Inc. MacBookPro16,1/Mac-E1008331FDC9686=
4,
BIOS 1554.120.19.0.0 (iBridge: 18.16.14663.0.0,0) 05/07/2021
[    0.372083] Workqueue: efi_rts_wq efi_call_rts
[    0.372114] RIP: 0010:efi_crash_gracefully_on_page_fault+0x49/0xc0
[    0.372154] Code: 48 89 fd e8 09 8d 02 00 48 81 fd ff 0f 00 00 76 08 48 =
3d
50 a0 61 b1 74 02 5d c3 48 89 ee 48 c7 c7 40 bf 6c b0 e8 f5 22 7e 00 <0f> 0=
b 83
3d 7e 0e fa 01 0a 0f 84 17 1e 7e 00 e8 53 19 00 00 48 8b
[    0.372271] RSP: 0000:ffffb6ee8033ab30 EFLAGS: 00010086
[    0.372305] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
ffffffffb0cb4a08
[    0.372350] RDX: 0000000000000000 RSI: 00000000ffffefff RDI:
ffffffffb0c5ca00
[    0.372395] RBP: ffffb6ee80068000 R08: 0000000000000000 R09:
ffffb6ee8033a958
[    0.372440] R10: ffffb6ee8033a950 R11: ffffffffb0ccca48 R12:
ffffb6ee8033abc8
[    0.374667] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
[    0.376933] FS:  0000000000000000(0000) GS:ffff9fc8aea00000(0000)
knlGS:0000000000000000
[    0.379162] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.381422] CR2: ffffb6ee80068000 CR3: 00000001001a8006 CR4:
00000000003706f0
[    0.383698] Call Trace:
[    0.385899]  page_fault_oops+0x9c/0x240
[    0.388141]  exc_page_fault+0xcc/0x150
[    0.390313]  asm_exc_page_fault+0x1e/0x30
[    0.392540] RIP: 0010:0xfffffffeefc440c5
[    0.394703] Code: 31 c9 48 29 f9 48 83 e1 0f 74 0c 4c 39 c1 49 0f 47 c8 =
49
29 c8 f3 a4 4c 89 c1 49 83 e0 0f 48 c1 e9 04 74 2c f3 0f 7f 44 24 18 <f3> 0=
f 6f
06 66 0f e7 07 48 83 c6 10 48 83 c7 10 e2 ee 0f ae f0 66
[    0.397081] RSP: 0000:ffffb6ee8033ac78 EFLAGS: 00010286
[    0.399456] RAX: fffffffeefc921e5 RBX: ffffffffb0709ce2 RCX:
0000000000000035
[    0.401753] RDX: ffffb6ee80067d48 RSI: ffffb6ee80067ff3 RDI:
fffffffeefc92490
[    0.404119] RBP: ffffb6ee8033ad00 R08: 000000000000000c R09:
ffffb6ee8006834e
[    0.406426] R10: 0000000000000000 R11: 00000000005ef3bd R12:
0000000000000000
[    0.408788] R13: ffffb6ee80067dd0 R14: ffffb6ee80067d01 R15:
0000000000000607
[    0.411101]  ? __efi_call+0x28/0x30
[    0.413426]  ? switch_mm_irqs_off+0x19a/0x3b0
[    0.415753]  ? efi_call_rts+0x17c/0x6c0
[    0.418001]  ? process_one_work+0x1ec/0x390
[    0.420289]  ? worker_thread+0x53/0x3e0
[    0.422515]  ? process_one_work+0x390/0x390
[    0.424780]  ? kthread+0x127/0x150
[    0.426991]  ? set_kthread_struct+0x40/0x40
[    0.429254]  ? ret_from_fork+0x22/0x30
[    0.431488] ---[ end trace d9718208699f023a ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
