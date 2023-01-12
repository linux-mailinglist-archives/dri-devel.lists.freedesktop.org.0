Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7112667A14
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693510E1AC;
	Thu, 12 Jan 2023 15:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF53210E1B3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:57:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 584346200F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD784C433EF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673539070;
 bh=tSuyHm82s0wgBlo66PkH3wBx4NIBo3djB5zL0K1YpJo=;
 h=From:To:Subject:Date:From;
 b=ok4XBsAVYPQmFPsG60/QeHlwEj0Y5y9gnWZTXE89jddYZqxAJWCPxuWL8milAmfBs
 pdnMUao4L/+q9oZcO+7ymGZbYC/K/L316q/xi6MSJeUuTO1H0yd40qJLmjsXecP/HA
 cCZ26YPgwgVJD3auTKhec4wwW2EDgP3JMzVpXRdT2vY7K4CHWa+OhRR/GE/GEpspJ4
 0rB9AZBE4NswiW4LuQrkZ6KPO6YtFV0y+YiRFVfO2BS5Yo+pZC1Pn6fBGB8/FynOYg
 nvyZMwHxDqjO19XQkKRwNJcCPr1JhQz4fzrtfW86XID+Q7ZVkON80eN9oZ3/YjlFPa
 eYGUVBeaxAmqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB07BC43142; Thu, 12 Jan 2023 15:57:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216920] New: Running IDE eventually leads to BUG: kernel NULL
 pointer dereference
Date: Thu, 12 Jan 2023 15:57:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gabriel@sullice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216920-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216920

            Bug ID: 216920
           Summary: Running IDE eventually leads to BUG: kernel NULL
                    pointer dereference
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.4-arch1-1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gabriel@sullice.com
        Regression: No

Hello,

I do my best to provide details, but I am very much a novice so please bear
with me. I will not ghost this issue and I will be as helpful as I can be, =
but
I will have difficulty patching my kernel, for example.

My desktop has been freezing after its free memory nearly reaches zero. I c=
an
consistently reproduce this behavior within a few minutes of opening my IDE
(any of the JetBrains products).

I have noticed that if I leave my system on for many days, it will eventual=
ly
report very little free memory and freeze. Unfortunately, I have not recove=
red
for logs after these events. However, within minutes of opening my IDE my
memory usage begins to increase rapidly. When I have nearly no free memory
left, my desktop freezes. By running "journalctl -b -1" after these events,=
 I
am able to recover the error and stack trace included below.


I searched for similar but reports and
https://bugzilla.kernel.org/show_bug.cgi?id=3D216730 sounds similar, especi=
ally
regarding the Linux 5 -> 6 upgrade. I believe the situation started (or bec=
ame
noticeably worse) after I upgraded in early December.

Please let me know if I can provide any additional details.

- Gabe

BUG: kernel NULL pointer dereference, address: 0000000000000017
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] PREEMPT SMP NOPTI
CPU: 17 PID: 765 Comm: Xorg:cs0 Not tainted 6.1.4-arch1-1 #1
b56a0be67d6a5f69f99015da4a908cae98ee5acc
Hardware name: ASUS System Product Name/ProArt Z690-CREATOR WIFI, BIOS 1003
01/19/2022
RIP: 0010:ttm_bo_swapout+0x5c/0x310 [ttm]
Code: 31 c0 48 8b 87 70 01 00 00 4c 8d 44 24 07 48 c7 44 24 18 00 00 00 00 =
48
8d 4c 24 10 c6 44 24 07 00 48 c7 44 24 10 00 00 00 00 <8b> >
RSP: 0018:ffffa4f60684b838 EFLAGS: 00010246
RAX: 0000000000000007 RBX: ffff8ccd5cf2e058 RCX: ffffa4f60684b848
RDX: ffff8cd23ebc2d58 RSI: 0000000000000000 RDI: ffff8ccd5cf2e058
RBP: ffff8cca0ede55c8 R08: ffffa4f60684b83f R09: 0000000000000000
R10: ffffa4f60684ba00 R11: ffff8cd2751e70e0 R12: ffff8cd661e415a0
R10: ffffa4f60684ba00 R11: ffff8cd2751e70e0 R12: ffff8cd661e415a0
R13: 0000000000000cc0 R14: ffffa4f60684ba38 R15: 0000000000000000
FS:  00007f1c9b1ff6c0(0000) GS:ffff8cd96dc40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000017 CR3: 0000000101c4e005 CR4: 0000000000f70ee0
PKRU: 55555554
Call Trace:
 <TASK>
 ? __kmem_cache_alloc_node+0x1a5/0x2d0
 ? amdgpu_gtt_mgr_new+0x40/0x130 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 ttm_device_swapout+0xf8/0x120 [ttm 63a90b9054166370014bbe40c6fa1031268577f=
4]
 ttm_global_swapout+0x50/0xc0 [ttm 63a90b9054166370014bbe40c6fa1031268577f4]
 ttm_tt_populate+0x82/0x140 [ttm 63a90b9054166370014bbe40c6fa1031268577f4]
 ttm_bo_handle_move_mem+0x15f/0x170 [ttm
63a90b9054166370014bbe40c6fa1031268577f4]
 ttm_bo_bounce_temp_buffer.constprop.0+0x9c/0xc0 [ttm
63a90b9054166370014bbe40c6fa1031268577f4]
 ? ttm_bo_handle_move_mem+0xb5/0x170 [ttm
63a90b9054166370014bbe40c6fa1031268577f4]
 ttm_bo_validate+0xd5/0x160 [ttm 63a90b9054166370014bbe40c6fa1031268577f4]
 amdgpu_cs_bo_validate+0x98/0x280 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 amdgpu_cs_list_validate+0xf9/0x140 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 amdgpu_cs_ioctl+0x10a4/0x1f40 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 drm_ioctl_kernel+0xca/0x170
 drm_ioctl+0x1eb/0x450
 ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu
e075343022af70307c8e70736313f8c62afdb58b]
 amdgpu_drm_ioctl+0x4e/0x90 [amdgpu e075343022af70307c8e70736313f8c62afdb58=
b]
 __x64_sys_ioctl+0x91/0xd0
 do_syscall_64+0x5c/0x90
 ? do_syscall_64+0x6b/0x90
 ? do_syscall_64+0x6b/0x90
 ? exit_to_user_mode_prepare+0x160/0x1d0
 ? syscall_exit_to_user_mode+0x1b/0x40
 ? do_syscall_64+0x6b/0x90
 ? do_syscall_64+0x6b/0x90
 ? do_syscall_64+0x6b/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f1ca7308c0f
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 =
24
08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> >
RSP: 002b:00007f1c9b1fe920 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f1c9b1fea98 RCX: 00007f1ca7308c0f
RDX: 00007f1c9b1fe9e0 RSI: 00000000c0186444 RDI: 0000000000000010
RBP: 00007f1c9b1fe9e0 R08: 00007f1c9b1feaf0 R09: 00007f1c9b1fe9c0
R10: 000055d820acd9a0 R11: 0000000000000246 R12: 00000000c0186444
R13: 0000000000000010 R14: 00007f1c9b1fea98 R15: 000055d820a3fb80
 </TASK>
Modules linked in: xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink
xt_addrtype iptable_filter iptable_nat nf_nat nf_conntrack n>
 i2c_i801 spi_nor ac97_bus atlantic thunderbolt i2c_smbus snd_pcm_dmaengine=
 mtd
igc iwlwifi btusb macsec btrtl mei_me btbcm intel_lpss_pc>
 cec vmd nvme_common xhci_pci_renesas video wmi
CR2: 0000000000000017
---[ end trace 0000000000000000 ]---
RIP: 0010:ttm_bo_swapout+0x5c/0x310 [ttm]
Code: 31 c0 48 8b 87 70 01 00 00 4c 8d 44 24 07 48 c7 44 24 18 00 00 00 00 =
48
8d 4c 24 10 c6 44 24 07 00 48 c7 44 24 10 00 00 00 00 <8b> >
RSP: 0018:ffffa4f60684b838 EFLAGS: 00010246
RAX: 0000000000000007 RBX: ffff8ccd5cf2e058 RCX: ffffa4f60684b848
RDX: ffff8cd23ebc2d58 RSI: 0000000000000000 RDI: ffff8ccd5cf2e058
RBP: ffff8cca0ede55c8 R08: ffffa4f60684b83f R09: 0000000000000000
R10: ffffa4f60684ba00 R11: ffff8cd2751e70e0 R12: ffff8cd661e415a0
R13: 0000000000000cc0 R14: ffffa4f60684ba38 R15: 0000000000000000
FS:  00007f1c9b1ff6c0(0000) GS:ffff8cd96dc40000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000017 CR3: 0000000101c4e005 CR4: 0000000000f70ee0
PKRU: 55555554

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
