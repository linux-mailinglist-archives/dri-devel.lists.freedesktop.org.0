Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2634581BA6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 23:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AD1A842B;
	Tue, 26 Jul 2022 21:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5FEA7A38
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 21:23:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75E45B818D4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28EA4C433D7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 21:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658870601;
 bh=LwPnVZQECZdDYMFi3+Eh2+r0SzNC7LZNM2AZDk5VPi4=;
 h=From:To:Subject:Date:From;
 b=XiYgxHDNR1qDgSQF5e/ZbMlpsv1AFgaGr6ZlH6PcXDKo1IrSukDjooFjZOQwQivs+
 hsvyABa99s84DKS6Vnt5jgl/WL2GTHehHryofAXUAMXqWjpc4WAszgckba0tgJ12tp
 i1VNDV+yyN5DJP3l3IpQctcN9QPkVvBdiUdnBvJveTNu5qNFgSAzoZQ4LhRJ9BB1tT
 Yv314ceW8/JI2UDmxQ7nV+AaEWctc0yA3lmB0lBsnTQ2VmZWRYhCUtrXrnITY1+yXg
 6gs4suXU1Xoe8n9ezQJHq7vbYZLsNrIBnjAV3y4uQA3SQCfdGg7P4ORCt5pWtTdIUV
 nX74dt+770wNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0D5DDC433E4; Tue, 26 Jul 2022 21:23:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216290] New: [amdgpu] drm/ttm: fbdev race condition into fork()
Date: Tue, 26 Jul 2022 21:23:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: k.melekhin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216290-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216290

            Bug ID: 216290
           Summary: [amdgpu] drm/ttm: fbdev race condition into fork()
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.0-rc7+ 353afba44cdabdab9fdfaa6990a088718abd5d85
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: k.melekhin@gmail.com
        Regression: No

Created attachment 301492
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301492&action=3Dedit
triggers the assertion

Hello Dri-devel,

There is yet another race condition happening with ttm objects,
this time with fbdev.

Please consider the following simple code that shows the problem (or
email attached):
https://0x0.st/ojmf.c

The kernel assertion:

[ 2112.472011] ---[ end trace 0000000000000000 ]---
[ 2182.118552] usb 3-2.2.1.4: reset high-speed USB device number 8
using xhci_hcd
[ 2194.632197] ------------[ cut here ]------------
[ 2194.632199] WARNING: CPU: 6 PID: 383 at
drivers/gpu/drm/ttm/ttm_bo_vm.c:352 0xffffffff8169c28f
[ 2194.632201] CPU: 6 PID: 383 Comm: fb Tainted: G        W
5.19.0-rc7+ #22 353afba44cdabdab9fdfaa6990a088718abd5d85
[ 2194.632204] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X300M-STX, BIOS L1.72 10/08/2021
[ 2194.632205] RIP: 0010:0xffffffff8169c28f
[ 2194.632206] Code: 48 8d ba 50 01 00 00 b8 01 00 00 00 f0 0f c1 82
50 01 00 00 85 c0 74 16 8d 50 01 09 c2 78 01 c3 be 01 00 00 00 e9 91
47 e5 ff <0f> 0b eb d2 be 02 00 00 00 e9 83 47 e5 ff 0f 1f 00 41 57 41
56 41
[ 2194.632207] RSP: 0018:ffffc90000767d30 EFLAGS: 00010287
[ 2194.632209] RAX: ffff888100a627b8 RBX: ffff888101745ec0 RCX:
ffff888102285128
[ 2194.632210] RDX: ffff888102b00058 RSI: 00007f89976fb000 RDI:
ffff88811031d440
[ 2194.632211] RBP: ffff88810177c800 R08: ffff888102541138 R09:
ffff88811f9d95e0
[ 2194.632212] R10: ffff8887fe2fc000 R11: 0000000000000000 R12:
0000000000000000
[ 2194.632213] R13: ffff888102c5fc00 R14: ffff88811031d390 R15:
ffff88811031d440
[ 2194.632213] FS:  00007f89977afb68(0000) GS:ffff8887ded80000(0000)
knlGS:0000000000000000
[ 2194.632214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2194.632215] CR2: 00007f8994840000 CR3: 00000001047df000 CR4:
0000000000750ee0
[ 2194.632216] PKRU: 55555554
[ 2194.632217] Call Trace:
[ 2194.632218]  <TASK>
[ 2194.632219]  0xffffffff81040d1e
[ 2194.632220]  0xffffffff8104306b
[ 2194.632221]  0xffffffff81043306
[ 2194.632222]  ? 0xffffffff81608ae6
[ 2194.632222]  0xffffffff810437d1
[ 2194.632223]  0xffffffff81fa1884
[ 2194.632224]  0xffffffff8200006a
[ 2194.632225] RIP: 0033:0x00007f8997749429
[ 2194.632226] Code: 88 00 00 00 31 c0 48 89 e5 48 89 ef e8 e0 b5 00
00 bf ff ff ff ff e8 36 7a fc ff 4c 89 e7 e8 ae bc 01 00 b8 39 00 00
00 0f 05 <48> 89 c3 85 c0 75 50 b8 ba 00 00 00 64 48 8b 14 25 00 00 00
00 0f
[ 2194.632227] RSP: 002b:00007ffee0d808e0 EFLAGS: 00000246 ORIG_RAX:
0000000000000039
[ 2194.632228] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f8997749429
[ 2194.632229] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
00007f89977affd4
[ 2194.632230] RBP: 00007ffee0d808e0 R08: 0000000000000000 R09:
0000000000000000
[ 2194.632230] R10: 0000000000000008 R11: 0000000000000246 R12:
00007f89977affd4
[ 2194.632231] R13: 00007f89977afb9c R14: 00007ffee0d809a0 R15:
00007f89977b0a40
[ 2194.632232]  </TASK>

Apparently this commit does not fix it
dbd0da2453c694f2f74651834d90fb280b57f151

Hardware info:
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
Root Complex
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne
PCIe GPP Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal
PCIe GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data
Fabric; Function 7
04:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Cezanne (rev c8)
04:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir
Radeon High Definition Audio Controller

---
And why does this bugzilla preview is so damn broken?
https://0x0.st/ojvn.png
So sorry if it actually looks like that.

Kyryl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
