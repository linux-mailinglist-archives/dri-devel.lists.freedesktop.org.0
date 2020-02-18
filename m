Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17844162D54
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 18:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B16E6E394;
	Tue, 18 Feb 2020 17:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E6A56E394
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:47:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206575] [amdgpu] [drm] No video signal on resume from suspend,
 R9 380
Date: Tue, 18 Feb 2020 17:47:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: thfrkbz@e.mail.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206575-2300-4vgfdjMVLq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206575-2300@https.bugzilla.kernel.org/>
References: <bug-206575-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206575

Thomas Frank (thfrkbz@e.mail.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |thfrkbz@e.mail.de

--- Comment #6 from Thomas Frank (thfrkbz@e.mail.de) ---
I have the same graphics card and the same problem.  Do you need additional
dmesg outputs from kernel 5.4.20 and 5.5.4?

I don't know if this helps but I diffed my `amdgpu` filtered dmesg outputs:

```
--- 5.4.20-1-lts_amdgpu_wo_uptime.txt   2020-02-18 18:38:07.393633705 +0100
+++ 5.5.4-arch1-1_amdgpu_wo_uptime.txt  2020-02-18 18:38:32.714488497 +0100
@@ -1,7 +1,4 @@
 [drm] amdgpu kernel modesetting enabled.
-amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 0: 0xd0000000 ->
0xdfffffff
-amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 2: 0xe0000000 ->
0xe01fffff
-amdgpu 0000:01:00.0: remove_conflicting_pci_framebuffers: bar 5: 0xefe00000 ->
0xefe3ffff
 fb0: switching to amdgpudrmfb from VESA VGA
 amdgpu 0000:01:00.0: vgaarb: deactivate vga console
 amdgpu 0000:01:00.0: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF
(4096M used)
@@ -9,7 +6,9 @@
 [drm] amdgpu: 4096M of VRAM memory ready
 [drm] amdgpu: 4096M of GTT memory ready.
 amdgpu: [powerplay] hwmgr_sw_init smu backed is tonga_smu
+[drm:dm_helpers_parse_edid_caps [amdgpu]] *ERROR* Couldn't read SADs: -2
 fbcon: amdgpudrmfb (fb0) is primary device
 amdgpu 0000:01:00.0: fb0: amdgpudrmfb frame buffer device
-[drm] Initialized amdgpu 3.35.0 20150101 for 0000:01:00.0 on minor 0
+[drm] Initialized amdgpu 3.36.0 20150101 for 0000:01:00.0 on minor 0
 snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops
amdgpu_dm_audio_component_bind_ops [amdgpu])
+[drm:dm_helpers_parse_edid_caps [amdgpu]] *ERROR* Couldn't read SADs: -2
```

The last line from the diff 
`[drm:dm_helpers_parse_edid_caps [amdgpu]] *ERROR* Couldn't read SADs: -2`
happens after resuming (with blank screen).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
