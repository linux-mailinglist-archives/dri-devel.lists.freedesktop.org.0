Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8913C2DFDD0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 16:58:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4D96E492;
	Mon, 21 Dec 2020 15:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E36E6E487
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 15:57:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209987] Memory leak in amdgpu_dm_update_connector_after_detect
Date: Mon, 21 Dec 2020 15:57:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-209987-2300-vnFepn7bJj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209987-2300@https.bugzilla.kernel.org/>
References: <bug-209987-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209987

youling257@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |youling257@gmail.com

--- Comment #4 from youling257@gmail.com ---
I have the same memory leak.

android_x86:/ # echo scan >  /sys/kernel/debug/kmemleak
android_x86:/ # cat /sys/kernel/debug/kmemleak
android_x86:/ # echo scan >  /sys/kernel/debug/kmemleak
android_x86:/ # cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff8edad8208580 (size 128):
  comm "ueventd", pid 1498, jiffies 4294676333 (age 65.106s)
  hex dump (first 32 bytes):
    22 16 04 00 00 0a 30 0a 50 0a a0 0a 00 00 40 06  ".....0.P.....@.
    43 06 48 06 69 06 00 00 05 00 00 00 00 00 00 00  C.H.i...........
  backtrace:
    [<0000000080ce8e0b>] do_detailed_mode+0x27c/0x520 [drm]
    [<000000000427e646>] drm_for_each_detailed_block.part.0+0x35/0x110 [drm]
    [<00000000566583b3>] drm_add_edid_modes+0x22b/0x1880 [drm]
    [<00000000f63b328b>] amdgpu_dm_update_connector_after_detect+0x385/0x4f0
[amdgpu]
    [<000000009f1bbb4c>] dm_helpers_read_local_edid+0xaa/0x170 [amdgpu]
    [<0000000005f6f065>] dc_link_detect_helper+0x29b/0xd70 [amdgpu]
    [<00000000a096d0f5>] dc_link_detect+0x31/0x50 [amdgpu]
    [<000000009a977098>] amdgpu_dm_init.isra.0.cold+0xf81/0x1297 [amdgpu]
    [<00000000cfd3da50>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000128bd3d5>] amdgpu_device_init.cold+0x13c7/0x16b5 [amdgpu]
    [<0000000039b2a07d>] amdgpu_driver_load_kms+0x2b/0x200 [amdgpu]
    [<000000009b370228>] amdgpu_pci_probe+0x129/0x1b0 [amdgpu]
    [<0000000066485d99>] pci_device_probe+0xd2/0x150
    [<00000000c858be29>] really_probe+0x232/0x460
    [<00000000f84cda17>] driver_probe_device+0x5d/0x150
    [<00000000103f2cc3>] device_driver_attach+0xa1/0xb0
unreferenced object 0xffff8edad828f280 (size 128):
  comm "ueventd", pid 1498, jiffies 4294676333 (age 65.107s)
  hex dump (first 32 bytes):
    14 44 02 00 80 07 d8 07 04 08 98 08 00 00 38 04  .D............8.
    3c 04 41 04 65 04 00 00 0a 00 00 00 00 00 00 00  <.A.e...........
  backtrace:
    [<0000000017977f42>] drm_mode_duplicate+0x1f/0x90 [drm]
    [<00000000c4367b7e>] drm_mode_std+0x1fe/0x5e0 [drm]
    [<00000000d7555cdd>] drm_add_edid_modes+0x2c7/0x1880 [drm]
    [<00000000f63b328b>] amdgpu_dm_update_connector_after_detect+0x385/0x4f0
[amdgpu]
    [<000000009f1bbb4c>] dm_helpers_read_local_edid+0xaa/0x170 [amdgpu]
    [<0000000005f6f065>] dc_link_detect_helper+0x29b/0xd70 [amdgpu]
    [<00000000a096d0f5>] dc_link_detect+0x31/0x50 [amdgpu]
    [<000000009a977098>] amdgpu_dm_init.isra.0.cold+0xf81/0x1297 [amdgpu]
    [<00000000cfd3da50>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000128bd3d5>] amdgpu_device_init.cold+0x13c7/0x16b5 [amdgpu]
    [<0000000039b2a07d>] amdgpu_driver_load_kms+0x2b/0x200 [amdgpu]
    [<000000009b370228>] amdgpu_pci_probe+0x129/0x1b0 [amdgpu]
    [<0000000066485d99>] pci_device_probe+0xd2/0x150
    [<00000000c858be29>] really_probe+0x232/0x460
    [<00000000f84cda17>] driver_probe_device+0x5d/0x150
    [<00000000103f2cc3>] device_driver_attach+0xa1/0xb0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
